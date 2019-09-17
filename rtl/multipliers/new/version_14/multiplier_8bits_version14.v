module multiplier_8bits_version14(product, A, B);

    output [15:0] product;
    input [7:0] A, B;

    /*
     * Area: 1032.459969
     * Power: 0.5483mW
     * Timing: 1.09ns
     */

    wire [7:0] pp0;
    wire [7:0] pp1;
    wire [7:0] pp2;
    wire [7:0] pp3;
    wire [7:0] pp4;
    wire [7:0] pp5;
    wire [7:0] pp6;
    wire [7:0] pp7;


    assign pp0 = A[0] ? B: 8'b00000000;
    assign pp1 = A[1] ? B: 8'b00000000;
    assign pp2 = A[2] ? B: 8'b00000000;
    assign pp3 = A[3] ? B: 8'b00000000;
    assign pp4 = A[4] ? B: 8'b00000000;
    assign pp5 = A[5] ? B: 8'b00000000;
    assign pp6 = A[6] ? B: 8'b00000000;
    assign pp7 = A[7] ? B: 8'b00000000;


    /*Stage 1*/
    wire[0:0] s1, in1_1, in1_2;
    wire c1;
    assign in1_1 = {pp0[6]};
    assign in1_2 = {pp1[5]};
    Half_Adder HA_1(s1, c1, in1_1, in1_2);
    wire[0:0] s2, in2_1, in2_2;
    wire c2;
    assign in2_1 = {pp1[6]};
    assign in2_2 = {pp2[5]};
    Full_Adder FA_2(s2, c2, in2_1, in2_2, pp0[7]);
    wire[0:0] s3, in3_1, in3_2;
    wire c3;
    assign in3_1 = {pp3[4]};
    assign in3_2 = {pp4[3]};
    Half_Adder HA_3(s3, c3, in3_1, in3_2);
    wire[0:0] s4, in4_1, in4_2;
    wire c4;
    assign in4_1 = {pp2[6]};
    assign in4_2 = {pp3[5]};
    Full_Adder FA_4(s4, c4, in4_1, in4_2, pp1[7]);
    wire[0:0] s5, in5_1, in5_2;
    wire c5;
    assign in5_1 = {pp4[4]};
    assign in5_2 = {pp5[3]};
    Half_Adder HA_5(s5, c5, in5_1, in5_2);
    wire[0:0] s6, in6_1, in6_2;
    wire c6;
    assign in6_1 = {pp3[6]};
    assign in6_2 = {pp4[5]};
    Full_Adder FA_6(s6, c6, in6_1, in6_2, pp2[7]);

    /*Stage 2*/
    wire[0:0] s7, in7_1, in7_2;
    wire c7;
    assign in7_1 = {pp0[4]};
    assign in7_2 = {pp1[3]};
    Half_Adder HA_7(s7, c7, in7_1, in7_2);
    wire[0:0] s8, in8_1, in8_2;
    wire c8;
    assign in8_1 = {pp1[4]};
    assign in8_2 = {pp2[3]};
    Full_Adder FA_8(s8, c8, in8_1, in8_2, pp0[5]);
    wire[0:0] s9, in9_1, in9_2;
    wire c9;
    assign in9_1 = {pp3[2]};
    assign in9_2 = {pp4[1]};
    Half_Adder HA_9(s9, c9, in9_1, in9_2);
    wire[0:0] s10, in10_1, in10_2;
    wire c10;
    assign in10_1 = {pp3[3]};
    assign in10_2 = {pp4[2]};
    Full_Adder FA_10(s10, c10, in10_1, in10_2, pp2[4]);
    wire[0:0] s11, in11_1, in11_2;
    wire c11;
    assign in11_1 = {pp6[0]};
    assign in11_2 = {s1[0]};
    Full_Adder FA_11(s11, c11, in11_1, in11_2, pp5[1]);
    wire[0:0] s12, in12_1, in12_2;
    wire c12;
    assign in12_1 = {pp6[1]};
    assign in12_2 = {pp7[0]};
    Full_Adder FA_12(s12, c12, in12_1, in12_2, pp5[2]);
    wire[0:0] s13, in13_1, in13_2;
    wire c13;
    assign in13_1 = {s2[0]};
    assign in13_2 = {s3[0]};
    Full_Adder FA_13(s13, c13, in13_1, in13_2, c1);
    wire[0:0] s14, in14_1, in14_2;
    wire c14;
    assign in14_1 = {pp7[1]};
    assign in14_2 = {c2};
    Full_Adder FA_14(s14, c14, in14_1, in14_2, pp6[2]);
    wire[0:0] s15, in15_1, in15_2;
    wire c15;
    assign in15_1 = {s4[0]};
    assign in15_2 = {s5[0]};
    Full_Adder FA_15(s15, c15, in15_1, in15_2, c3);
    wire[0:0] s16, in16_1, in16_2;
    wire c16;
    assign in16_1 = {pp6[3]};
    assign in16_2 = {pp7[2]};
    Full_Adder FA_16(s16, c16, in16_1, in16_2, pp5[4]);
    wire[0:0] s17, in17_1, in17_2;
    wire c17;
    assign in17_1 = {c5};
    assign in17_2 = {s6[0]};
    Full_Adder FA_17(s17, c17, in17_1, in17_2, c4);
    wire[0:0] s18, in18_1, in18_2;
    wire c18;
    assign in18_1 = {pp4[6]};
    assign in18_2 = {pp5[5]};
    Full_Adder FA_18(s18, c18, in18_1, in18_2, pp3[7]);
    wire[0:0] s19, in19_1, in19_2;
    wire c19;
    assign in19_1 = {pp7[3]};
    assign in19_2 = {c6};
    Full_Adder FA_19(s19, c19, in19_1, in19_2, pp6[4]);
    wire[0:0] s20, in20_1, in20_2;
    wire c20;
    assign in20_1 = {pp5[6]};
    assign in20_2 = {pp6[5]};
    Full_Adder FA_20(s20, c20, in20_1, in20_2, pp4[7]);

    /*Stage 3*/
    wire[0:0] s21, in21_1, in21_2;
    wire c21;
    assign in21_1 = {pp0[3]};
    assign in21_2 = {pp1[2]};
    Half_Adder HA_21(s21, c21, in21_1, in21_2);
    wire[0:0] s22, in22_1, in22_2;
    wire c22;
    assign in22_1 = {pp3[1]};
    assign in22_2 = {pp4[0]};
    Full_Adder FA_22(s22, c22, in22_1, in22_2, pp2[2]);
    wire[0:0] s23, in23_1, in23_2;
    wire c23;
    assign in23_1 = {c7};
    assign in23_2 = {s8[0]};
    Full_Adder FA_23(s23, c23, in23_1, in23_2, pp5[0]);
    wire[0:0] s24, in24_1, in24_2;
    wire c24;
    assign in24_1 = {c9};
    assign in24_2 = {s10[0]};
    Full_Adder FA_24(s24, c24, in24_1, in24_2, c8);
    wire[0:0] s25, in25_1, in25_2;
    wire c25;
    assign in25_1 = {c11};
    assign in25_2 = {s12[0]};
    Full_Adder FA_25(s25, c25, in25_1, in25_2, c10);
    wire[0:0] s26, in26_1, in26_2;
    wire c26;
    assign in26_1 = {c13};
    assign in26_2 = {s14[0]};
    Full_Adder FA_26(s26, c26, in26_1, in26_2, c12);
    wire[0:0] s27, in27_1, in27_2;
    wire c27;
    assign in27_1 = {c15};
    assign in27_2 = {s16[0]};
    Full_Adder FA_27(s27, c27, in27_1, in27_2, c14);
    wire[0:0] s28, in28_1, in28_2;
    wire c28;
    assign in28_1 = {c17};
    assign in28_2 = {s18[0]};
    Full_Adder FA_28(s28, c28, in28_1, in28_2, c16);
    wire[0:0] s29, in29_1, in29_2;
    wire c29;
    assign in29_1 = {c18};
    assign in29_2 = {c19};
    Full_Adder FA_29(s29, c29, in29_1, in29_2, pp7[4]);
    wire[0:0] s30, in30_1, in30_2;
    wire c30;
    assign in30_1 = {pp6[6]};
    assign in30_2 = {pp7[5]};
    Full_Adder FA_30(s30, c30, in30_1, in30_2, pp5[7]);

    /*Stage 4*/
    wire[0:0] s31, in31_1, in31_2;
    wire c31;
    assign in31_1 = {pp0[2]};
    assign in31_2 = {pp1[1]};
    Half_Adder HA_31(s31, c31, in31_1, in31_2);
    wire[0:0] s32, in32_1, in32_2;
    wire c32;
    assign in32_1 = {pp3[0]};
    assign in32_2 = {s21[0]};
    Full_Adder FA_32(s32, c32, in32_1, in32_2, pp2[1]);
    wire[0:0] s33, in33_1, in33_2;
    wire c33;
    assign in33_1 = {c21};
    assign in33_2 = {s22[0]};
    Full_Adder FA_33(s33, c33, in33_1, in33_2, s7[0]);
    wire[0:0] s34, in34_1, in34_2;
    wire c34;
    assign in34_1 = {c22};
    assign in34_2 = {s23[0]};
    Full_Adder FA_34(s34, c34, in34_1, in34_2, s9[0]);
    wire[0:0] s35, in35_1, in35_2;
    wire c35;
    assign in35_1 = {c23};
    assign in35_2 = {s24[0]};
    Full_Adder FA_35(s35, c35, in35_1, in35_2, s11[0]);
    wire[0:0] s36, in36_1, in36_2;
    wire c36;
    assign in36_1 = {c24};
    assign in36_2 = {s25[0]};
    Full_Adder FA_36(s36, c36, in36_1, in36_2, s13[0]);
    wire[0:0] s37, in37_1, in37_2;
    wire c37;
    assign in37_1 = {c25};
    assign in37_2 = {s26[0]};
    Full_Adder FA_37(s37, c37, in37_1, in37_2, s15[0]);
    wire[0:0] s38, in38_1, in38_2;
    wire c38;
    assign in38_1 = {c26};
    assign in38_2 = {s27[0]};
    Full_Adder FA_38(s38, c38, in38_1, in38_2, s17[0]);
    wire[0:0] s39, in39_1, in39_2;
    wire c39;
    assign in39_1 = {c27};
    assign in39_2 = {s28[0]};
    Full_Adder FA_39(s39, c39, in39_1, in39_2, s19[0]);
    wire[0:0] s40, in40_1, in40_2;
    wire c40;
    assign in40_1 = {c28};
    assign in40_2 = {s29[0]};
    Full_Adder FA_40(s40, c40, in40_1, in40_2, s20[0]);
    wire[0:0] s41, in41_1, in41_2;
    wire c41;
    assign in41_1 = {c29};
    assign in41_2 = {s30[0]};
    Full_Adder FA_41(s41, c41, in41_1, in41_2, c20);
    wire[0:0] s42, in42_1, in42_2;
    wire c42;
    assign in42_1 = {pp7[6]};
    assign in42_2 = {c30};
    Full_Adder FA_42(s42, c42, in42_1, in42_2, pp6[7]);


    /*Final Stage 4*/
    wire[13:0] s, in_1, in_2;
    wire c;
    assign in_1 = {pp0[1],pp2[0],c31,c32,c33,c34,c35,c36,c37,c38,c39,c40,c41,pp7[7]};
    assign in_2 = {pp1[0],s31[0],s32[0],s33[0],s34[0],s35[0],s36[0],s37[0],s38[0],s39[0],s40[0],s41[0],s42[0],c42};
    CLA_14(s, c, in_1, in_2);

    assign product[0] = pp0[0];
    assign product[1] = s[0];
    assign product[2] = s[1];
    assign product[3] = s[2];
    assign product[4] = s[3];
    assign product[5] = s[4];
    assign product[6] = s[5];
    assign product[7] = s[6];
    assign product[8] = s[7];
    assign product[9] = s[8];
    assign product[10] = s[9];
    assign product[11] = s[10];
    assign product[12] = s[11];
    assign product[13] = s[12];
    assign product[14] = s[13];
    assign product[15] = c;
endmodule


module CLA_14(output [13:0] sum, output cout, input [13:0] in1, input [13:0] in2);

    wire[13:0] G;
    wire[13:0] C;
    wire[13:0] P;

    assign G[0] = in1[13] & in2[13];
    assign P[0] = in1[13] ^ in2[13];
    assign G[1] = in1[12] & in2[12];
    assign P[1] = in1[12] ^ in2[12];
    assign G[2] = in1[11] & in2[11];
    assign P[2] = in1[11] ^ in2[11];
    assign G[3] = in1[10] & in2[10];
    assign P[3] = in1[10] ^ in2[10];
    assign G[4] = in1[9] & in2[9];
    assign P[4] = in1[9] ^ in2[9];
    assign G[5] = in1[8] & in2[8];
    assign P[5] = in1[8] ^ in2[8];
    assign G[6] = in1[7] & in2[7];
    assign P[6] = in1[7] ^ in2[7];
    assign G[7] = in1[6] & in2[6];
    assign P[7] = in1[6] ^ in2[6];
    assign G[8] = in1[5] & in2[5];
    assign P[8] = in1[5] ^ in2[5];
    assign G[9] = in1[4] & in2[4];
    assign P[9] = in1[4] ^ in2[4];
    assign G[10] = in1[3] & in2[3];
    assign P[10] = in1[3] ^ in2[3];
    assign G[11] = in1[2] & in2[2];
    assign P[11] = in1[2] ^ in2[2];
    assign G[12] = in1[1] & in2[1];
    assign P[12] = in1[1] ^ in2[1];
    assign G[13] = in1[0] & in2[0];
    assign P[13] = in1[0] ^ in2[0];


    assign C[0] = 0;  /* Carry_out = Ci+1 = Gi + Pi*Ci */;
    assign C[1] = G[0] | (P[0] & C[0]);
    assign C[2] = G[1] | (P[1] & C[1]);
    assign C[3] = G[2] | (P[2] & C[2]);
    assign C[4] = G[3] | (P[3] & C[3]);
    assign C[5] = G[4] | (P[4] & C[4]);
    assign C[6] = G[5] | (P[5] & C[5]);
    assign C[7] = G[6] | (P[6] & C[6]);
    assign C[8] = G[7] | (P[7] & C[7]);
    assign C[9] = G[8] | (P[8] & C[8]);
    assign C[10] = G[9] | (P[9] & C[9]);
    assign C[11] = G[10] | (P[10] & C[10]);
    assign C[12] = G[11] | (P[11] & C[11]);
    assign C[13] = G[12] | (P[12] & C[12]);
    assign cout = G[13] | (P[13] & C[13]);
    assign sum = P ^ C;
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
