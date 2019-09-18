/////////////////////////////////////////////////////////////////////////
////
//// Module Name: Ripple Carry Adder (16-bits)
//// Function: Implements an 32-bit Ripple Carry Adder
////
/////////////////////////////////////////////////////////////////////////
module ripple_carry_adder_32(output [31:0] sum,
                      output cout,
                      input [31:0] in1, in2,
                      input cin);

    /* Area: 
     * Power: mW
     * Timing: ns
     */

    wire c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15, c16, c17, c18, c19, c20, c21, c22, c23, c24, c25, c26, c27, c28, c29, c30, c31;
    full_adder FA1(sum[0],   c1,   in1[0],  in2[0], cin);
    full_adder FA2(sum[1],   c2,   in1[1],  in2[1], c1);
    full_adder FA3(sum[2],   c3,   in1[2],  in2[2], c2);
    full_adder FA4(sum[3],   c4,   in1[3],  in2[3], c3);
    full_adder FA5(sum[4],   c5,   in1[4],  in2[4], c4);
    full_adder FA6(sum[5],   c6,   in1[5],  in2[5], c5);
    full_adder FA7(sum[6],   c7,   in1[6],  in2[6], c6);
    full_adder FA8(sum[7],   c8,   in1[7],  in2[7], c7);
    full_adder FA9(sum[8],   c9,   in1[8],  in2[8], c8);
    full_adder FA10(sum[9],  c10,  in1[9],  in2[9], c9);
    full_adder FA11(sum[10], c11,  in1[10], in2[10], c10);
    full_adder FA12(sum[11], c12,  in1[11], in2[11], c11);
    full_adder FA13(sum[12], c13,  in1[12], in2[12], c12);
    full_adder FA14(sum[13], c14,  in1[13], in2[13], c13);
    full_adder FA15(sum[14], c15,  in1[14], in2[14], c14);
    full_adder FA16(sum[15], c16,  in1[15], in2[15], c15);
    full_adder FA17(sum[16], c17,  in1[16], in2[16], c16);
    full_adder FA18(sum[17], c18,  in1[17], in2[17], c17);
    full_adder FA19(sum[18], c19,  in1[18], in2[18], c18);
    full_adder FA20(sum[19], c20,  in1[19], in2[19], c19);
    full_adder FA21(sum[20], c21,  in1[20], in2[20], c20);
    full_adder FA22(sum[21], c22,  in1[21], in2[21], c21);
    full_adder FA23(sum[22], c23,  in1[22], in2[22], c22);
    full_adder FA24(sum[23], c24,  in1[23], in2[23], c23);
    full_adder FA25(sum[24], c25,  in1[24], in2[24], c24);
    full_adder FA26(sum[25], c26,  in1[25], in2[25], c25);
    full_adder FA27(sum[26], c27,  in1[26], in2[26], c26);
    full_adder FA38(sum[27], c28,  in1[27], in2[27], c27);
    full_adder FA39(sum[28], c29,  in1[28], in2[28], c28);
    full_adder FA30(sum[29], c30,  in1[29], in2[29], c29);
    full_adder FA31(sum[30], cout, in1[30], in2[30], c30);
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
