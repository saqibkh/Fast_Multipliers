/* This implementation is a 64bit Carry Select Adder made from
 * 4-bit Ripple Carry Adder
 * Area: 2561.439335 
 * Power: 1.1201mW
 * Timing: 2.24ns
 */

module carry_select_adder_64(output [63:0] sum,
                            output cout,
                            input [63:0] in1, in2,
                            input cin);

    wire [63:0] sum;
    wire cout;
    wire [3:0] result2_1, result2_2, result3_1,result3_2,result4_1,result4_2,result5_1,result5_2,result6_1,result6_2,result7_1,result7_2,result8_1,result8_2;
    wire [3:0] result9_1, result9_2, resultA_1, resultA_2, resultB_1, resultB_2, resultC_1, resultC_2, resultD_1, resultD_2, resultE_1, resultE_2, resultF_1, resultF_2, resultG_1, resultG_2;
    wire c1, c2_1, c2_2, c2_3,c3_1,c3_2,c3_3,c3,c4_1,c4_2,c4_3,c4,c5_1,c5_2,c5_3,c5,c6_1,c6_2,c6_3,c6,c7_1,c7_2,c7_3,c7,c8_1,c8_2,c8_3,c8;
    wire c9, cA, cB, cC, cD, cE, cF, cG, c9_1, c9_2;

    /* 1st 4 bits */
    ripple_carry_adder_4(sum[3:0], c1, in1[3:0], in2[3:0], cin);

    /* 2nd 4 bits */
    ripple_carry_adder_4(result2_1, c2_1, in1[7:4], in2[7:4], 1'b0);
    ripple_carry_adder_4(result2_2, c2_2, in1[7:4], in2[7:4], 1'b1);
    mux (sum[7:4], result2_1, result2_2, c1);
    and(c2_3, c2_1, c1);
    or(c2, c2_3, c2_2);

    /* 3rd 4 bits */
    ripple_carry_adder_4(result3_1, c3_1, in1[11:8], in2[11:8], 1'b0);
    ripple_carry_adder_4(result3_2, c3_2, in1[11:8], in2[11:8], 1'b1);
    mux (sum[11:8], result3_1, result3_2, c2);
    and(c3_3, c3_1, c2);
    or(c3, c3_3, c3_2);

    /* 4th 4 bits */
    ripple_carry_adder_4(result4_1, c4_1, in1[15:12], in2[15:12], 1'b0);
    ripple_carry_adder_4(result4_2, c4_2, in1[15:12], in2[15:12], 1'b1);
    mux (sum[15:12], result4_1, result4_2, c3);
    and(c4_3, c4_1, c3);
    or(c4, c4_3, c4_2);

    
    ripple_carry_adder_4(result5_1, c5_1, in1[19:16], in2[19:16], 1'b0);
    ripple_carry_adder_4(result5_2, c5_2, in1[19:16], in2[19:16], 1'b1);
    mux (sum[19:16], result5_1, result5_2, c4);
    and(c5_3, c5_1, c4);
    or(c5, c5_3, c5_2);

    ripple_carry_adder_4(result6_1, c6_1, in1[23:20], in2[23:20], 1'b0);
    ripple_carry_adder_4(result6_2, c6_2, in1[23:20], in2[23:20], 1'b1);
    mux (sum[23:20], result6_1, result6_2, c5);
    and(c6_3, c6_1, c5);
    or(c6, c6_3, c6_2);

    ripple_carry_adder_4(result7_1, c7_1, in1[27:24], in2[27:24], 1'b0);
    ripple_carry_adder_4(result7_2, c7_2, in1[27:24], in2[27:24], 1'b1);
    mux (sum[27:24], result7_1, result7_2, c6);
    and(c7_3, c7_1, c6);
    or(c7, c7_3, c7_2);

    ripple_carry_adder_4(result8_1, c8_1, in1[31:28], in2[31:28], 1'b0);
    ripple_carry_adder_4(result8_2, c8_2, in1[31:28], in2[31:28], 1'b1);
    mux (sum[31:28], result8_1, result8_2, c7);
    and(c8_3, c8_1, c7);
    or(c8, c8_3, c8_2);

    ripple_carry_adder_4(result9_1, c9_1, in1[35:32], in2[35:32], 1'b0);
    ripple_carry_adder_4(result9_2, c9_2, in1[35:32], in2[35:32], 1'b1);
    mux (sum[35:32], result9_1, result9_2, c8);
    and(c9_3, c9_1, c8);
    or(c9, c9_3, c9_2);

    ripple_carry_adder_4(resultA_1, cA_1, in1[39:36], in2[39:36], 1'b0);
    ripple_carry_adder_4(resultA_2, cA_2, in1[39:36], in2[39:36], 1'b1);
    mux (sum[39:36], resultA_1, resultA_2, c9);
    and(cA_3, cA_1, c9);
    or(cA, cA_3, cA_2);

    ripple_carry_adder_4(resultB_1, cB_1, in1[43:40], in2[43:40], 1'b0);
    ripple_carry_adder_4(resultB_2, cB_2, in1[43:40], in2[43:40], 1'b1);
    mux (sum[43:40], resultB_1, resultB_2, cA);
    and(cB_3, cB_1, cA);
    or(cB, cB_3, cB_2);

    ripple_carry_adder_4(resultC_1, cC_1, in1[47:44], in2[47:44], 1'b0);
    ripple_carry_adder_4(resultC_2, cC_2, in1[47:44], in2[47:44], 1'b1);
    mux (sum[47:44], resultC_1, resultC_2, cB);
    and(cC_3, cC_1, cB);
    or(cC, cC_3, cC_2);

    ripple_carry_adder_4(resultD_1, cD_1, in1[51:48], in2[51:48], 1'b0);
    ripple_carry_adder_4(resultD_2, cD_2, in1[51:48], in2[51:48], 1'b1);
    mux (sum[51:48], resultD_1, resultD_2, cC);
    and(cD_3, cD_1, cC);
    or(cD, cD_3, cD_2);

    ripple_carry_adder_4(resultE_1, cE_1, in1[55:52], in2[55:52], 1'b0);
    ripple_carry_adder_4(resultE_2, cE_2, in1[55:52], in2[55:52], 1'b1);
    mux (sum[55:52], resultE_1, resultE_2, cD);
    and(cE_3, cE_1, cD);
    or(cE, cE_3, cE_2);

    ripple_carry_adder_4(resultF_1, cF_1, in1[59:56], in2[59:56], 1'b0);
    ripple_carry_adder_4(resultF_2, cF_2, in1[59:56], in2[59:56], 1'b1);
    mux (sum[59:56], resultF_1, resultF_2, cE);
    and(cF_3, cF_1, cE);
    or(cF, cF_3, cF_2);

    ripple_carry_adder_4(resultG_1, cG_1, in1[63:60], in2[63:60], 1'b0);
    ripple_carry_adder_4(resultG_2, cG_2, in1[63:60], in2[63:60], 1'b1);
    mux (sum[63:60], resultG_1, resultG_2, cF);
    and(cG_3, cG_1, cF);
    or(cout, cG_3, cG_2);
endmodule

module mux(result, in1, in2, key);
    input [3:0] in1, in2;
    input key;
    output [3:0] result;
    assign result = key ? in2 : in1;
endmodule

module ripple_carry_adder_4(output wire [3:0] sum,
                      output wire cout,
                      input wire [3:0] in1, in2,
                      input wire cin);
    wire c1, c2, c3;
    full_adder FA1(sum[0], c1, in1[0], in2[0], cin);
    full_adder FA2(sum[1], c2, in1[1], in2[1], c1);
    full_adder FA3(sum[2], c3, in1[2], in2[2], c2);
    full_adder FA4(sum[3], cout, in1[3], in2[3], c3);
endmodule

module half_adder(output wire sum,
                  output wire cout,
                  input wire in1,
                  input wire in2);
    xor(sum, in1, in2);
    and(cout, in1, in2);
endmodule

module full_adder(output wire sum,
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
