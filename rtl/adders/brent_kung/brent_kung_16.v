module brent_kung_16(
                    output [15:0] sum,
                    output cout,
                    input [15:0] in1, in2,
                    input cin);

    wire [16:0] res;
    //assign G = in1 & in2; /* Generate */
    //assign P = in1 ^ in2; /* Propagate */

	wire [15:0] init_p, init_g;
	wire [7:0]  first_layer_buffer_p, first_layer_buffer_g;
	wire [6:0]  black_cell_first_layer_g, black_cell_first_layer_p;
	

	wire first_layer_gray_cell_out;

        // layer 1
        assign init_p = (in1 ^ in2);
	assign init_g = (in1 & in2);

	gray_cell gc_l1(init_g[1], init_p[1], init_g[0], first_layer_gray_cell_out);

	assign {first_layer_buffer_g[0], first_layer_buffer_p[0]} = {init_g[0]^cin, 1'b0};
	
	genvar index;  
	generate  
	for (index=1; index < 8; index=index+1)  
	  begin: first_level_black_cells  
	    black_cell black_level_1(
	    	.Gi_k(init_g[2*index+1]), .Pi_k(init_p[2*index+1]), .Gk_j(init_g[2*index]), .Pk_j(init_p[2*index]), 
	    	.Gi_j(black_cell_first_layer_g[index-1]), .Pi_j(black_cell_first_layer_p[index-1])
	    );
	    buffer b_l1(init_g[index*2], init_p[index*2], first_layer_buffer_g[index], first_layer_buffer_p[index]);
	  end  
	endgenerate  
	
	// layer 2
	wire second_layer_gray_cell_out;
	wire[2:0] black_cell_second_layer_g, black_cell_second_layer_p;
	wire[3:0] second_layer_buffer_g, second_layer_buffer_p;

	gray_cell gc_l2(black_cell_first_layer_g[0], black_cell_first_layer_p[0], first_layer_gray_cell_out, second_layer_gray_cell_out);
	buf(second_layer_buffer_g[0] ,first_layer_gray_cell_out);
	generate
	for (index=1; index < 4; index=index+1)  
	  begin: second_level_black_cells  
	    black_cell black_level_2(	
	    		black_cell_first_layer_g[2*index], 
	    		black_cell_first_layer_p[2*index],
	    		black_cell_first_layer_g[2*index-1],
	    		black_cell_first_layer_p[2*index-1],
	    				
				black_cell_second_layer_g[index-1],
				black_cell_second_layer_p[index-1]
	    );
	    buffer b_l2(
	    	black_cell_first_layer_g[index*2-1],
	    	black_cell_first_layer_p[index*2-1],
	     	second_layer_buffer_g[index], 
	     	second_layer_buffer_p[index]
	    );
	  end  
	endgenerate 

	// layer 3
	wire[1:0] third_layer_buffer_g, third_layer_buffer_p;
	wire black_cell_third_layer_g, black_cell_third_layer_p;
	wire third_layer_gray_cell_out;

	gray_cell gc_l3(black_cell_second_layer_g[0], black_cell_second_layer_p[0], second_layer_gray_cell_out, third_layer_gray_cell_out);
	buf(third_layer_buffer_g[0], second_layer_gray_cell_out);
	buffer third_layer_buff(black_cell_second_layer_g[1], black_cell_second_layer_p[1], third_layer_buffer_g[1], third_layer_buffer_p[1]);
	black_cell bc_l3(
		black_cell_second_layer_g[2],
		black_cell_second_layer_p[2],
		black_cell_second_layer_g[1],
		black_cell_second_layer_p[1],
		black_cell_third_layer_g,
		black_cell_third_layer_p
		);

	// layer 4
	wire forth_layer_gray_cell_out;
	wire forth_layer_buffer_out;

	gray_cell gc_l4(black_cell_third_layer_g, black_cell_third_layer_p, third_layer_gray_cell_out, forth_layer_gray_cell_out);
	buf(forth_layer_buffer_out, third_layer_gray_cell_out);

	// layer 5
	wire fifth_layer_gray_cell_out;
	gray_cell gc_l5(third_layer_buffer_g[1], third_layer_buffer_p[1], forth_layer_buffer_out, fifth_layer_gray_cell_out);

 	// layer 6
	wire [2:0] sixth_layer_gray_cell_out;
	wire [1:0] sixth_layer_buffer_out;
	gray_cell gc_l6_0(
		second_layer_buffer_g[1],
		second_layer_buffer_p[1],
		third_layer_buffer_g[0],

		sixth_layer_gray_cell_out[0]
	);
	gray_cell gc_l6_1(
		second_layer_buffer_g[2],
		second_layer_buffer_p[2],
		forth_layer_buffer_out,

		sixth_layer_gray_cell_out[1]
	);

	gray_cell gc_l6_2(
		second_layer_buffer_g[3],
		second_layer_buffer_p[3],
		fifth_layer_gray_cell_out,

		sixth_layer_gray_cell_out[2]
	);

	buf(sixth_layer_buffer_out[0], fifth_layer_gray_cell_out);
	buf(sixth_layer_buffer_out[1], forth_layer_gray_cell_out);

	// layer 7
	wire [15:0] seventh_layer_g;
	assign seventh_layer_g[0] = first_layer_buffer_g[0];
	assign seventh_layer_g[1] = second_layer_buffer_g[0];
	
	gray_cell gc_l7_0(
		first_layer_buffer_g[1],
		first_layer_buffer_p[1],
		second_layer_buffer_g[0],

		seventh_layer_g[2]
	);

	assign seventh_layer_g[3] = third_layer_buffer_g[0];

	gray_cell gc_l7_1(
		first_layer_buffer_g[2],
		first_layer_buffer_p[2],
		third_layer_buffer_g[0],

		seventh_layer_g[4]
	);

	buf(seventh_layer_g[5], sixth_layer_gray_cell_out[0]);

	gray_cell gc_l7_2(
		first_layer_buffer_g[3],
		first_layer_buffer_p[3],
		sixth_layer_gray_cell_out[0],

		seventh_layer_g[6]
	);

	assign seventh_layer_g[7] = forth_layer_buffer_out;

	gray_cell gc_l7_3(
		first_layer_buffer_g[4],
		first_layer_buffer_p[4],
		forth_layer_buffer_out,

		seventh_layer_g[8]
	);

	buf(seventh_layer_g[9], sixth_layer_gray_cell_out[1]);

	gray_cell gc_l7_4(
		first_layer_buffer_g[5],
		first_layer_buffer_p[5],
		sixth_layer_gray_cell_out[1],

		seventh_layer_g[10]
	);

	buf(seventh_layer_g[11], sixth_layer_buffer_out[0]);

	gray_cell gc_l7_5(
		first_layer_buffer_g[6],
		first_layer_buffer_p[6],
		sixth_layer_buffer_out[0],

		seventh_layer_g[12]
	);

	buf(seventh_layer_g[13], sixth_layer_gray_cell_out[2]);

	gray_cell gc_l7_6(
		first_layer_buffer_g[7],
		first_layer_buffer_p[7],
		sixth_layer_gray_cell_out[2],

		seventh_layer_g[14]
	);

	assign seventh_layer_g[15] = sixth_layer_buffer_out[1];
	// res
	assign res = {1'b0, init_p} ^ {seventh_layer_g, 1'b0};

        assign cout = res[16];
        assign sum = res[15:0];

endmodule

module black_cell(input  Gi_k,
                  input  Pi_k,
                  input  Gk_j,
                  input  Pk_j,
                  output Gi_j,
                  output Pi_j);

    assign Gi_j = (Pi_k & Gk_j) | Gi_k;
    assign Pi_j = Pi_k & Pk_j;
endmodule

module gray_cell(input Gi_k,  
                 input Pi_k, 
                 input Gk_j,
                 output Gi_j
);
    assign Gi_j = Gi_k | (Pi_k & Gk_j);
endmodule

module buffer (input g_input, p_input,
	       output g_output, p_output	
);
    buf(g_output, g_input );
    buf(p_output, p_input);
endmodule
