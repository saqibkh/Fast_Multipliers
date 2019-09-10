module dadda_unsigned_multiplier_RCA_64(product, A, B);
    input [63:0] A, B;
    output [127:0] product;

	wire [63:0] pp0, pp1, pp2, pp3, pp4, pp5, pp6, pp7, pp8, pp9, pp10, pp11, pp12, pp13, pp14, pp15;
	wire [63:0] pp16, pp17, pp18, pp19, pp20, pp21, pp22, pp23, pp24, pp25, pp26, pp27, pp28, pp29, pp30, pp31, pp32, pp33, pp34;
	wire [63:0] pp35, pp36, pp37, pp38, pp39, pp40, pp41, pp42, pp43, pp44, pp45, pp46, pp47, pp48, pp49, pp50, pp51, pp52, pp53;
	wire [63:0] pp54, pp55, pp56, pp57, pp58, pp59, pp60, pp61, pp62, pp63;
	wire [127:0] product;

	assign product[2] = 1'b0;
	assign product[1] = 1'b0;
	assign product[0] = 1'b0;

endmodule

module Half_Adder(output wire sum,
                  output wire cout,
                  input wire in1,
                  input wire in2);
    xor(sum, in1, in2);
    and(cout, in1, in2);
endmodule

module Full_Adder(output wire sum,
                  output wire cout,
                  input wire in1,
                  input wire in2,
                  input wire cin);
    wire temp1;
    wire temp2;
    wire temp3;
    xor(sum, in1, in2, cin);
    and(temp1,in1,in2);
    and(temp2,in1,cin);
    and(temp3,in2,cin);
    or(cout,temp1,temp2,temp3);
endmodule
