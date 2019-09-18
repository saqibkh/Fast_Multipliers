/////////////////////////////////////////////////////////////////////////
////
//// Module Name: Ripple Carry Adder (16-bits)
//// Function: Implements an 64-bit Ripple Carry Adder
////
/////////////////////////////////////////////////////////////////////////
module ripple_carry_adder_64(output [63:0] sum,
                      output cout,
                      input [63:0] in1, in2,
                      input cin);

    /* Area: 
     * Power: mW
     * Timing: ns
     */

    wire c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15, c16, c17, c18, c19, c20, c21, c22, c23, c24, c25, c26, c27, c28, c29, c30, c31;
    wire c32, c33, c34, c35, c36, c37, c38, c39, c40, c41, c42, c43, c44, c45, c46, c47, c48, c49, c50, c51, c52, c53, c54, c55, c56, c57, c58, c59, c60, c61, c62; 
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
    full_adder FA28(sum[27], c28,  in1[27], in2[27], c27);
    full_adder FA29(sum[28], c29,  in1[28], in2[28], c28);
    full_adder FA30(sum[29], c30,  in1[29], in2[29], c29);
    full_adder FA31(sum[30], c31, in1[30], in2[30], c30);

    full_adder FA32(sum[31], c32, in1[31], in2[31], c31);
    full_adder FA33(sum[32], c33, in1[32], in2[32], c32);
    full_adder FA34(sum[33], c34, in1[33], in2[33], c33);
    full_adder FA35(sum[34], c35, in1[34], in2[34], c34);
    full_adder FA36(sum[35], c36, in1[35], in2[35], c35);
    full_adder FA37(sum[36], c37, in1[36], in2[36], c36);
    full_adder FA38(sum[37], c38, in1[37], in2[37], c37);
    full_adder FA39(sum[38], c39, in1[38], in2[38], c38);
    full_adder FA40(sum[39], c40, in1[39], in2[39], c39);
    full_adder FA41(sum[40], c41, in1[40], in2[40], c40);
    full_adder FA42(sum[41], c42, in1[41], in2[41], c41);
    full_adder FA43(sum[42], c43, in1[42], in2[42], c42);
    full_adder FA44(sum[43], c44, in1[43], in2[43], c43);
    full_adder FA45(sum[44], c45, in1[44], in2[44], c44);
    full_adder FA46(sum[45], c46, in1[45], in2[45], c45);
    full_adder FA47(sum[46], c47, in1[46], in2[46], c46);
    full_adder FA48(sum[47], c48, in1[47], in2[47], c47);
    full_adder FA49(sum[48], c49, in1[48], in2[48], c48);
    full_adder FA50(sum[49], c50, in1[49], in2[49], c49);
    full_adder FA51(sum[50], c51, in1[50], in2[50], c50);
    full_adder FA52(sum[51], c52, in1[51], in2[51], c51);
    full_adder FA53(sum[52], c53, in1[52], in2[52], c52);
    full_adder FA54(sum[53], c54, in1[53], in2[53], c53);
    full_adder FA55(sum[54], c55, in1[54], in2[54], c54);
    full_adder FA56(sum[55], c56, in1[55], in2[55], c55);
    full_adder FA57(sum[56], c57, in1[56], in2[56], c56);
    full_adder FA58(sum[57], c58, in1[57], in2[57], c57);
    full_adder FA59(sum[58], c59, in1[58], in2[58], c58);
    full_adder FA60(sum[59], c60, in1[59], in2[59], c59);
    full_adder FA61(sum[60], c61, in1[60], in2[60], c60);
    full_adder FA62(sum[61], cout,in1[61], in2[61], c61);
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
