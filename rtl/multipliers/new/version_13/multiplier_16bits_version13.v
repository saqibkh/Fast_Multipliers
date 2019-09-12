module multiplier_16bits_version13(product, A, B);

    output [31:0] product;
    input [15:0] A, B;

    /*
     * Area: 
     * Power: mW
     * Timing: ns
     */

    wire [15:0] pp0;
    wire [15:0] pp1;
    wire [15:0] pp2;
    wire [15:0] pp3;
    wire [15:0] pp4;
    wire [15:0] pp5;
    wire [15:0] pp6;
    wire [15:0] pp7;
    wire [15:0] pp8;
    wire [15:0] pp9;
    wire [15:0] pp10;
    wire [15:0] pp11;
    wire [15:0] pp12;
    wire [15:0] pp13;
    wire [15:0] pp14;
    wire [15:0] pp15;


    assign pp0 = A[0] ? B: 16'b0000000000000000;
    assign pp1 = A[1] ? B: 16'b0000000000000000;
    assign pp2 = A[2] ? B: 16'b0000000000000000;
    assign pp3 = A[3] ? B: 16'b0000000000000000;
    assign pp4 = A[4] ? B: 16'b0000000000000000;
    assign pp5 = A[5] ? B: 16'b0000000000000000;
    assign pp6 = A[6] ? B: 16'b0000000000000000;
    assign pp7 = A[7] ? B: 16'b0000000000000000;
    assign pp8 = A[8] ? B: 16'b0000000000000000;
    assign pp9 = A[9] ? B: 16'b0000000000000000;
    assign pp10 = A[10] ? B: 16'b0000000000000000;
    assign pp11 = A[11] ? B: 16'b0000000000000000;
    assign pp12 = A[12] ? B: 16'b0000000000000000;
    assign pp13 = A[13] ? B: 16'b0000000000000000;
    assign pp14 = A[14] ? B: 16'b0000000000000000;
    assign pp15 = A[15] ? B: 16'b0000000000000000;


    /*Stage 1*/
    wire[3:0] s1, in1_1, in1_2;
    wire c1;
    assign in1_1 = {pp0[10],pp0[11],pp0[12],pp0[13]};
    assign in1_2 = {pp1[9],pp1[10],pp1[11],pp1[12]};
    CLA_4 KS_1(s1, c1, in1_1, in1_2);
    wire[3:0] s2, in2_1, in2_2;
    wire c2;
    assign in2_1 = {pp2[9],pp2[10],pp2[11],pp0[14]};
    assign in2_2 = {pp3[8],pp3[9],pp3[10],pp1[13]};
    CLA_4 KS_2(s2, c2, in2_1, in2_2);
    wire[3:0] s3, in3_1, in3_2;
    wire c3;
    assign in3_1 = {pp4[8],pp4[9],pp2[12],pp0[15]};
    assign in3_2 = {pp5[7],pp5[8],pp3[11],pp1[14]};
    CLA_4 KS_3(s3, c3, in3_1, in3_2);
    wire[3:0] s4, in4_1, in4_2;
    wire c4;
    assign in4_1 = {pp6[7],pp4[10],pp2[13],pp1[15]};
    assign in4_2 = {pp7[6],pp5[9],pp3[12],pp2[14]};
    CLA_4 KS_4(s4, c4, in4_1, in4_2);
    wire[3:0] s5, in5_1, in5_2;
    wire c5;
    assign in5_1 = {pp6[8],pp4[11],pp3[13],pp2[15]};
    assign in5_2 = {pp7[7],pp5[10],pp4[12],pp3[14]};
    CLA_4 KS_5(s5, c5, in5_1, in5_2);
    wire[3:0] s6, in6_1, in6_2;
    wire c6;
    assign in6_1 = {pp9[5],pp6[9],pp5[11],pp4[13]};
    assign in6_2 = {pp10[4],pp7[8],pp6[10],pp5[12]};
    CLA_4_c KS_6(s6, c6, in6_1, in6_2, pp8[6]);
    wire[3:0] s7, in7_1, in7_2;
    wire c7;
    assign in7_1 = {pp8[7],pp7[9],pp6[11],pp3[15]};
    assign in7_2 = {pp9[6],pp8[8],pp7[10],pp4[14]};
    CLA_4 KS_7(s7, c7, in7_1, in7_2);
    wire[3:0] s8, in8_1, in8_2;
    wire c8;
    assign in8_1 = {pp11[4],pp9[7],pp8[9],pp5[13]};
    assign in8_2 = {pp12[3],pp10[6],pp9[8],pp6[12]};
    CLA_4_c KS_8(s8, c8, in8_1, in8_2, pp10[5]);
    wire[3:0] s9, in9_1, in9_2;
    wire c9;
    assign in9_1 = {pp12[4],pp10[7],pp7[11],pp4[15]};
    assign in9_2 = {pp13[3],pp11[6],pp8[10],pp5[14]};
    CLA_4_c KS_9(s9, c9, in9_1, in9_2, pp11[5]);
    wire[3:0] s10, in10_1, in10_2;
    wire c10;
    assign in10_1 = {pp10[8],pp6[13],pp5[15],pp6[15]};
    assign in10_2 = {pp11[7],pp7[12],pp6[14],pp7[14]};
    CLA_4_c KS_10(s10, c10, in10_1, in10_2, pp9[9]);
    wire[1:0] s11, in11_1, in11_2;
    wire c11;
    assign in11_1 = {pp9[10],pp7[13]};
    assign in11_2 = {pp10[9],pp8[12]};
    CLA_2_c KS_11(s11, c11, in11_1, in11_2, pp8[11]);

    /*Stage 2*/
    wire[3:0] s12, in12_1, in12_2;
    wire c12;
    assign in12_1 = {pp0[6],pp0[7],pp0[8],pp0[9]};
    assign in12_2 = {pp1[5],pp1[6],pp1[7],pp1[8]};
    CLA_4 KS_12(s12, c12, in12_1, in12_2);
    wire[3:0] s13, in13_1, in13_2;
    wire c13;
    assign in13_1 = {pp2[5],pp2[6],pp2[7],pp2[8]};
    assign in13_2 = {pp3[4],pp3[5],pp3[6],pp3[7]};
    CLA_4 KS_13(s13, c13, in13_1, in13_2);
    wire[3:0] s14, in14_1, in14_2;
    wire c14;
    assign in14_1 = {pp4[4],pp4[5],pp4[6],pp4[7]};
    assign in14_2 = {pp5[3],pp5[4],pp5[5],pp5[6]};
    CLA_4 KS_14(s14, c14, in14_1, in14_2);
    wire[3:0] s15, in15_1, in15_2;
    wire c15;
    assign in15_1 = {pp6[3],pp6[4],pp6[5],pp6[6]};
    assign in15_2 = {pp7[2],pp7[3],pp7[4],pp7[5]};
    CLA_4 KS_15(s15, c15, in15_1, in15_2);
    wire[3:0] s16, in16_1, in16_2;
    wire c16;
    assign in16_1 = {pp9[1],pp8[3],pp8[4],pp8[5]};
    assign in16_2 = {pp10[0],pp9[2],pp9[3],pp9[4]};
    CLA_4_c KS_16(s16, c16, in16_1, in16_2, pp8[2]);
    wire[3:0] s17, in17_1, in17_2;
    wire c17;
    assign in17_1 = {pp11[0],pp10[2],pp10[3],pp11[3]};
    assign in17_2 = {s1[1],pp11[1],pp11[2],pp12[2]};
    CLA_4_c KS_17(s17, c17, in17_1, in17_2, pp10[1]);
    wire[3:0] s18, in18_1, in18_2;
    wire c18;
    assign in18_1 = {s1[2],pp12[1],pp13[1],pp13[2]};
    assign in18_2 = {s2[1],pp13[0],pp14[0],pp14[1]};
    CLA_4_c KS_18(s18, c18, in18_1, in18_2, pp12[0]);
    wire[3:0] s19, in19_1, in19_2;
    wire c19;
    assign in19_1 = {s2[2],c1,pp15[0],pp14[2]};
    assign in19_2 = {s3[1],s2[3],c2,pp15[1]};
    CLA_4_c KS_19(s19, c19, in19_1, in19_2, s1[3]);
    wire[3:0] s20, in20_1, in20_2;
    wire c20;
    assign in20_1 = {s4[1],s3[3],1'b0,pp12[5]};
    assign in20_2 = {s5[0],s4[2],c3,pp13[4]};
    CLA_4_c KS_20(s20, c20, in20_1, in20_2, s3[2]);
    wire[3:0] s21, in21_1, in21_2;
    wire c21;
    assign in21_1 = {s6[1],s4[3],pp14[3],pp12[6]};
    assign in21_2 = {s7[0],s5[2],pp15[2],pp13[5]};
    CLA_4_c KS_21(s21, c21, in21_1, in21_2, s5[1]);
    wire[3:0] s22, in22_1, in22_2;
    wire c22;
    assign in22_1 = {s7[1],c4,pp14[4],pp11[8]};
    assign in22_2 = {s8[1],s5[3],pp15[3],pp12[7]};
    CLA_4_c KS_22(s22, c22, in22_1, in22_2, s6[2]);
    wire[3:0] s23, in23_1, in23_2;
    wire c23;
    assign in23_1 = {s7[2],c5,pp13[6],pp9[11]};
    assign in23_2 = {s8[2],c6,pp14[5],pp10[10]};
    CLA_4_c KS_23(s23, c23, in23_1, in23_2, s6[3]);
    wire[3:0] s24, in24_1, in24_2;
    wire c24;
    assign in24_1 = {s8[3],pp15[4],pp11[9],pp8[13]};
    assign in24_2 = {s9[2],c7,pp12[8],pp9[12]};
    CLA_4_c KS_24(s24, c24, in24_1, in24_2, s7[3]);
    wire[3:0] s25, in25_1, in25_2;
    wire c25;
    assign in25_1 = {s9[3],pp13[7],pp10[11],pp7[15]};
    assign in25_2 = {s10[1],pp14[6],pp11[10],pp8[14]};
    CLA_4_c KS_25(s25, c25, in25_1, in25_2, c8);
    wire[3:0] s26, in26_1, in26_2;
    wire c26;
    assign in26_1 = {c9,pp12[9],pp9[13],pp8[15]};
    assign in26_2 = {s10[2],pp13[8],pp10[12],pp9[14]};
    CLA_4_c KS_26(s26, c26, in26_1, in26_2, pp15[5]);
    wire[3:0] s27, in27_1, in27_2;
    wire c27;
    assign in27_1 = {pp15[6],pp11[11],pp10[13],pp9[15]};
    assign in27_2 = {s10[3],pp12[10],pp11[12],pp10[14]};
    CLA_4_c KS_27(s27, c27, in27_1, in27_2, pp14[7]);
    wire[3:0] s28, in28_1, in28_2;
    wire c28;
    assign in28_1 = {pp14[8],pp12[11],pp11[13],pp10[15]};
    assign in28_2 = {pp15[7],pp13[10],pp12[12],pp11[14]};
    CLA_4_c KS_28(s28, c28, in28_1, in28_2, pp13[9]);

    /*Stage 3*/
    wire[3:0] s29, in29_1, in29_2;
    wire c29;
    assign in29_1 = {pp0[4],pp0[5],pp2[4],pp4[3]};
    assign in29_2 = {pp1[3],pp1[4],pp3[3],pp5[2]};
    CLA_4 KS_29(s29, c29, in29_1, in29_2);
    wire[3:0] s30, in30_1, in30_2;
    wire c30;
    assign in30_1 = {pp2[3],pp4[2],pp6[1],pp6[2]};
    assign in30_2 = {pp3[2],pp5[1],pp7[0],pp7[1]};
    CLA_4 KS_30(s30, c30, in30_1, in30_2);
    wire[3:0] s31, in31_1, in31_2;
    wire c31;
    assign in31_1 = {s12[2],pp8[1],s1[0],s2[0]};
    assign in31_2 = {s13[1],pp9[0],c12,c13};
    CLA_4_c KS_31(s31, c31, in31_1, in31_2, pp8[0]);
    wire[3:0] s32, in32_1, in32_2;
    wire c32;
    assign in32_1 = {s13[2],s13[3],s14[3],s3[0]};
    assign in32_2 = {s14[1],s14[2],s15[2],c14};
    CLA_4_c KS_32(s32, c32, in32_1, in32_2, s12[3]);
    wire[3:0] s33, in33_1, in33_2;
    wire c33;
    assign in33_1 = {s16[2],s4[0],s6[0],s8[0]};
    assign in33_2 = {s17[1],c15,c16,c17};
    CLA_4_c KS_33(s33, c33, in33_1, in33_2, s15[3]);
    wire[3:0] s34, in34_1, in34_2;
    wire c34;
    assign in34_1 = {s17[2],s17[3],s18[3],s9[0]};
    assign in34_2 = {s18[1],s18[2],s19[2],c18};
    CLA_4_c KS_34(s34, c34, in34_1, in34_2, s16[3]);
    wire[3:0] s35, in35_1, in35_2;
    wire c35;
    assign in35_1 = {s20[2],s9[1],s10[0],s11[0]};
    assign in35_2 = {s21[1],c19,c20,c21};
    CLA_4_c KS_35(s35, c35, in35_1, in35_2, s19[3]);
    wire[3:0] s36, in36_1, in36_2;
    wire c36;
    assign in36_1 = {s21[2],s21[3],s22[3],s11[1]};
    assign in36_2 = {s22[1],s22[2],s23[2],c22};
    CLA_4_c KS_36(s36, c36, in36_1, in36_2, s20[3]);
    wire[3:0] s37, in37_1, in37_2;
    wire c37;
    assign in37_1 = {s24[2],c11,c10,pp14[9]};
    assign in37_2 = {s25[1],c23,c24,pp15[8]};
    CLA_4_c KS_37(s37, c37, in37_1, in37_2, s23[3]);
    wire[3:0] s38, in38_1, in38_2;
    wire c38;
    assign in38_1 = {s25[2],s25[3],c25,pp13[11]};
    assign in38_2 = {s26[1],s26[2],s26[3],pp14[10]};
    CLA_4_c KS_38(s38, c38, in38_1, in38_2, s24[3]);
    wire[3:0] s39, in39_1, in39_2;
    wire c39;
    assign in39_1 = {c26,pp12[13],pp11[15],pp12[15]};
    assign in39_2 = {s27[3],pp13[12],pp12[14],pp13[14]};
    CLA_4_c KS_39(s39, c39, in39_1, in39_2, pp15[9]);
    wire[1:0] s40, in40_1, in40_2;
    wire c40;
    assign in40_1 = {pp15[10],pp13[13]};
    assign in40_2 = {c27,pp14[12]};
    CLA_2_c KS_40(s40, c40, in40_1, in40_2, pp14[11]);

    /*Stage 4*/
    wire[3:0] s41, in41_1, in41_2;
    wire c41;
    assign in41_1 = {pp0[3],pp2[2],pp4[1],pp6[0]};
    assign in41_2 = {pp1[2],pp3[1],pp5[0],s12[0]};
    CLA_4 KS_41(s41, c41, in41_1, in41_2);
    wire[3:0] s42, in42_1, in42_2;
    wire c42;
    assign in42_1 = {s13[0],s14[0],s15[0],s15[1]};
    assign in42_2 = {s29[3],c29,c30,s16[0]};
    CLA_4_c KS_42(s42, c42, in42_1, in42_2, s12[1]);
    wire[3:0] s43, in43_1, in43_2;
    wire c43;
    assign in43_1 = {s17[0],s18[0],s19[0],s19[1]};
    assign in43_2 = {s31[3],c31,c32,s20[0]};
    CLA_4_c KS_43(s43, c43, in43_1, in43_2, s16[1]);
    wire[3:0] s44, in44_1, in44_2;
    wire c44;
    assign in44_1 = {s21[0],s22[0],s23[0],s23[1]};
    assign in44_2 = {s33[3],c33,c34,s24[0]};
    CLA_4_c KS_44(s44, c44, in44_1, in44_2, s20[1]);
    wire[3:0] s45, in45_1, in45_2;
    wire c45;
    assign in45_1 = {s25[0],s26[0],s27[0],s27[1]};
    assign in45_2 = {s35[3],c35,c36,s28[0]};
    CLA_4_c KS_45(s45, c45, in45_1, in45_2, s24[1]);
    wire[3:0] s46, in46_1, in46_2;
    wire c46;
    assign in46_1 = {s28[1],s28[2],s28[3],pp15[11]};
    assign in46_2 = {s37[3],c37,c38,c28};
    CLA_4_c KS_46(s46, c46, in46_1, in46_2, s27[2]);
    wire[1:0] s47, in47_1, in47_2;
    wire c47;
    assign in47_1 = {pp15[12],pp13[15]};
    assign in47_2 = {s39[3],pp14[14]};
    CLA_2_c KS_47(s47, c47, in47_1, in47_2, pp14[13]);

    /*Stage 5*/
    wire[3:0] s48, in48_1, in48_2;
    wire c48;
    assign in48_1 = {pp0[2],pp2[1],pp4[0],s29[1]};
    assign in48_2 = {pp1[1],pp3[0],s29[0],s30[0]};
    CLA_4 KS_48(s48, c48, in48_1, in48_2);
    wire[3:0] s49, in49_1, in49_2;
    wire c49;
    assign in49_1 = {s30[1],s30[2],s30[3],s31[1]};
    assign in49_2 = {s41[3],c41,s31[0],s32[0]};
    CLA_4_c KS_49(s49, c49, in49_1, in49_2, s29[2]);
    wire[3:0] s50, in50_1, in50_2;
    wire c50;
    assign in50_1 = {s32[1],s32[2],s32[3],s33[1]};
    assign in50_2 = {s42[3],c42,s33[0],s34[0]};
    CLA_4_c KS_50(s50, c50, in50_1, in50_2, s31[2]);
    wire[3:0] s51, in51_1, in51_2;
    wire c51;
    assign in51_1 = {s34[1],s34[2],s34[3],s35[1]};
    assign in51_2 = {s43[3],c43,s35[0],s36[0]};
    CLA_4_c KS_51(s51, c51, in51_1, in51_2, s33[2]);
    wire[3:0] s52, in52_1, in52_2;
    wire c52;
    assign in52_1 = {s36[1],s36[2],s36[3],s37[1]};
    assign in52_2 = {s44[3],c44,s37[0],s38[0]};
    CLA_4_c KS_52(s52, c52, in52_1, in52_2, s35[2]);
    wire[3:0] s53, in53_1, in53_2;
    wire c53;
    assign in53_1 = {s38[1],s38[2],s38[3],s39[1]};
    assign in53_2 = {s45[3],c45,s39[0],s40[0]};
    CLA_4_c KS_53(s53, c53, in53_1, in53_2, s37[2]);
    wire[3:0] s54, in54_1, in54_2;
    wire c54;
    assign in54_1 = {s40[1],c40,pp15[13],pp14[15]};
    assign in54_2 = {s46[3],c46,c39,pp15[14]};
    CLA_4_c KS_54(s54, c54, in54_1, in54_2, s39[2]);


    /*Final Stage 5*/
    wire[29:0] s, in_1, in_2;
    wire c;
    assign in_1 = {pp0[1],pp2[0],s41[0],s41[1],s41[2],c48,s42[0],s42[1],s42[2],c49,s43[0],s43[1],s43[2],c50,s44[0],s44[1],s44[2],c51,s45[0],s45[1],s45[2],c52,s46[0],s46[1],s46[2],c53,s47[0],s47[1],c47,pp15[15]};
    assign in_2 = {pp1[0],s48[0],s48[1],s48[2],s48[3],s49[0],s49[1],s49[2],s49[3],s50[0],s50[1],s50[2],s50[3],s51[0],s51[1],s51[2],s51[3],s52[0],s52[1],s52[2],s52[3],s53[0],s53[1],s53[2],s53[3],s54[0],s54[1],s54[2],s54[3],c54};
    kogge_stone_30(s, c, in_1, in_2);

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
    assign product[15] = s[14];
    assign product[16] = s[15];
    assign product[17] = s[16];
    assign product[18] = s[17];
    assign product[19] = s[18];
    assign product[20] = s[19];
    assign product[21] = s[20];
    assign product[22] = s[21];
    assign product[23] = s[22];
    assign product[24] = s[23];
    assign product[25] = s[24];
    assign product[26] = s[25];
    assign product[27] = s[26];
    assign product[28] = s[27];
    assign product[29] = s[28];
    assign product[30] = s[29];
    assign product[31] = c;
endmodule

module CLA_2_c(output [1:0] sum,
            output cout,
            input [1:0] in1, in2,
            input cin);

    wire [1:0] G; /* Generate */
    wire [1:0] P; /* Propagate */
    wire [1:0] C; /* Carry */

    assign G[0] = in1[1] & in2[1]; /*Generate    Gi = Ai * Bi */
    assign G[1] = in1[0] & in2[0];

    assign P[0] = in1[1] ^ in2[1];
    assign P[1] = in1[0] ^ in2[0];

    assign C[0] = cin;
    assign C[1] = G[0] | (P[0] & C[0]);
    assign cout = G[1] | (P[1] & C[1]);
    assign sum = P ^ C;
endmodule

module CLA_4(output [3:0] sum,
            output cout,
            input [3:0] in1, in2);

    wire [3:0] G; /* Generate */
    wire [3:0] P; /* Propagate */
    wire [3:0] C; /* Carry */

    assign G[0] = in1[3] & in2[3]; /*Generate    Gi = Ai * Bi */
    assign G[1] = in1[2] & in2[2];
    assign G[2] = in1[1] & in2[1];
    assign G[3] = in1[0] & in2[0];
    assign P[0] = in1[3] ^ in2[3]; /*Propagate   Pi = Ai + Bi */
    assign P[1] = in1[2] ^ in2[2];
    assign P[2] = in1[1] ^ in2[1];
    assign P[3] = in1[0] ^ in2[0];

    assign C[0] = 0;
    assign C[1] = G[0] | (P[0] & C[0]);
    assign C[2] = G[1] | (P[1] & C[1]);
    assign C[3] = G[2] | (P[2] & C[2]);
    assign cout = G[3] | (P[3] & C[3]);
    assign sum = P ^ C;
endmodule

module CLA_4_c(output [3:0] sum,
            output cout,
            input [3:0] in1, in2,
            input cin);

    wire [3:0] G; /* Generate */
    wire [3:0] P; /* Propagate */
    wire [3:0] C; /* Carry */

    assign G[0] = in1[3] & in2[3]; /*Generate    Gi = Ai * Bi */
    assign G[1] = in1[2] & in2[2];
    assign G[2] = in1[1] & in2[1];
    assign G[3] = in1[0] & in2[0];
    assign P[0] = in1[3] ^ in2[3]; /*Propagate   Pi = Ai + Bi */
    assign P[1] = in1[2] ^ in2[2];
    assign P[2] = in1[1] ^ in2[1];
    assign P[3] = in1[0] ^ in2[0];

    assign C[0] = cin;
    assign C[1] = G[0] | (P[0] & C[0]);
    assign C[2] = G[1] | (P[1] & C[1]);
    assign C[3] = G[2] | (P[2] & C[2]);
    assign cout = G[3] | (P[3] & C[3]);
    assign sum = P ^ C;
endmodule


module CLA_30(output [29:0] sum, output cout, input [29:0] in1, input [29:0] in2);

    wire[29:0] G;
    wire[29:0] C;
    wire[29:0] P;

    assign G[0] = in1[29] & in2[29];
    assign P[0] = in1[29] ^ in2[29];
    assign G[1] = in1[28] & in2[28];
    assign P[1] = in1[28] ^ in2[28];
    assign G[2] = in1[27] & in2[27];
    assign P[2] = in1[27] ^ in2[27];
    assign G[3] = in1[26] & in2[26];
    assign P[3] = in1[26] ^ in2[26];
    assign G[4] = in1[25] & in2[25];
    assign P[4] = in1[25] ^ in2[25];
    assign G[5] = in1[24] & in2[24];
    assign P[5] = in1[24] ^ in2[24];
    assign G[6] = in1[23] & in2[23];
    assign P[6] = in1[23] ^ in2[23];
    assign G[7] = in1[22] & in2[22];
    assign P[7] = in1[22] ^ in2[22];
    assign G[8] = in1[21] & in2[21];
    assign P[8] = in1[21] ^ in2[21];
    assign G[9] = in1[20] & in2[20];
    assign P[9] = in1[20] ^ in2[20];
    assign G[10] = in1[19] & in2[19];
    assign P[10] = in1[19] ^ in2[19];
    assign G[11] = in1[18] & in2[18];
    assign P[11] = in1[18] ^ in2[18];
    assign G[12] = in1[17] & in2[17];
    assign P[12] = in1[17] ^ in2[17];
    assign G[13] = in1[16] & in2[16];
    assign P[13] = in1[16] ^ in2[16];
    assign G[14] = in1[15] & in2[15];
    assign P[14] = in1[15] ^ in2[15];
    assign G[15] = in1[14] & in2[14];
    assign P[15] = in1[14] ^ in2[14];
    assign G[16] = in1[13] & in2[13];
    assign P[16] = in1[13] ^ in2[13];
    assign G[17] = in1[12] & in2[12];
    assign P[17] = in1[12] ^ in2[12];
    assign G[18] = in1[11] & in2[11];
    assign P[18] = in1[11] ^ in2[11];
    assign G[19] = in1[10] & in2[10];
    assign P[19] = in1[10] ^ in2[10];
    assign G[20] = in1[9] & in2[9];
    assign P[20] = in1[9] ^ in2[9];
    assign G[21] = in1[8] & in2[8];
    assign P[21] = in1[8] ^ in2[8];
    assign G[22] = in1[7] & in2[7];
    assign P[22] = in1[7] ^ in2[7];
    assign G[23] = in1[6] & in2[6];
    assign P[23] = in1[6] ^ in2[6];
    assign G[24] = in1[5] & in2[5];
    assign P[24] = in1[5] ^ in2[5];
    assign G[25] = in1[4] & in2[4];
    assign P[25] = in1[4] ^ in2[4];
    assign G[26] = in1[3] & in2[3];
    assign P[26] = in1[3] ^ in2[3];
    assign G[27] = in1[2] & in2[2];
    assign P[27] = in1[2] ^ in2[2];
    assign G[28] = in1[1] & in2[1];
    assign P[28] = in1[1] ^ in2[1];
    assign G[29] = in1[0] & in2[0];
    assign P[29] = in1[0] ^ in2[0];


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
    assign C[14] = G[13] | (P[13] & C[13]);
    assign C[15] = G[14] | (P[14] & C[14]);
    assign C[16] = G[15] | (P[15] & C[15]);
    assign C[17] = G[16] | (P[16] & C[16]);
    assign C[18] = G[17] | (P[17] & C[17]);
    assign C[19] = G[18] | (P[18] & C[18]);
    assign C[20] = G[19] | (P[19] & C[19]);
    assign C[21] = G[20] | (P[20] & C[20]);
    assign C[22] = G[21] | (P[21] & C[21]);
    assign C[23] = G[22] | (P[22] & C[22]);
    assign C[24] = G[23] | (P[23] & C[23]);
    assign C[25] = G[24] | (P[24] & C[24]);
    assign C[26] = G[25] | (P[25] & C[25]);
    assign C[27] = G[26] | (P[26] & C[26]);
    assign C[28] = G[27] | (P[27] & C[27]);
    assign C[29] = G[28] | (P[28] & C[28]);
    assign cout = G[29] | (P[29] & C[29]);
    assign sum = P ^ C;
endmodule


module kogge_stone_30(sum, cout, in1, in2);
    input [29:0] in1, in2; 
    output [29:0] sum; 
    output cout; 
    wire [29:0] G_Z, P_Z, 
    G_A, P_A,
    G_B, P_B,
    G_C, P_C,
    G_D, P_D,
    G_E, P_E,
    G_F, P_F;

    

    assign P_Z[0]  = in1[29] ^ in2[29];
    assign P_Z[1]  = in1[28] ^ in2[28];
    assign P_Z[2]  = in1[27] ^ in2[27];
    assign P_Z[3]  = in1[26] ^ in2[26];
    assign P_Z[4]  = in1[25] ^ in2[25];
    assign P_Z[5]  = in1[24] ^ in2[24];
    assign P_Z[6]  = in1[23] ^ in2[23];
    assign P_Z[7]  = in1[22] ^ in2[22];
    assign P_Z[8]  = in1[21] ^ in2[21];
    assign P_Z[9]  = in1[20] ^ in2[20];
    assign P_Z[10] = in1[19] ^ in2[19];
    assign P_Z[11] = in1[18] ^ in2[18];
    assign P_Z[12] = in1[17] ^ in2[17];
    assign P_Z[13] = in1[16] ^ in2[16];
    assign P_Z[14] = in1[15] ^ in2[15];
    assign P_Z[15] = in1[14] ^ in2[14];
    assign P_Z[16] = in1[13] ^ in2[13];
    assign P_Z[17] = in1[12] ^ in2[12];
    assign P_Z[18] = in1[11] ^ in2[11];
    assign P_Z[19] = in1[10] ^ in2[10];
    assign P_Z[20] = in1[9]  ^ in2[9];
    assign P_Z[21] = in1[8]  ^ in2[8];
    assign P_Z[22] = in1[7]  ^ in2[7];
    assign P_Z[23] = in1[6]  ^ in2[6];
    assign P_Z[24] = in1[5]  ^ in2[5];
    assign P_Z[25] = in1[4]  ^ in2[4];
    assign P_Z[26] = in1[3]  ^ in2[3];
    assign P_Z[27] = in1[2]  ^ in2[2];
    assign P_Z[28] = in1[1]  ^ in2[1];
    assign P_Z[29] = in1[0]  ^ in2[0];

    assign G_Z[0]  = in1[29] & in2[29];
    assign G_Z[1]  = in1[28] & in2[28];
    assign G_Z[2]  = in1[27] & in2[27];
    assign G_Z[3]  = in1[26] & in2[26];
    assign G_Z[4]  = in1[25] & in2[25];
    assign G_Z[5]  = in1[24] & in2[24];
    assign G_Z[6]  = in1[23] & in2[23];
    assign G_Z[7]  = in1[22] & in2[22];
    assign G_Z[8]  = in1[21] & in2[21];
    assign G_Z[9]  = in1[20] & in2[20];
    assign G_Z[10]  = in1[19] & in2[19];
    assign G_Z[11] = in1[18] & in2[18];
    assign G_Z[12] = in1[17] & in2[17];
    assign G_Z[13] = in1[16] & in2[16];
    assign G_Z[14] = in1[15] & in2[15];
    assign G_Z[15] = in1[14] & in2[14];
    assign G_Z[16] = in1[13] & in2[13];
    assign G_Z[17] = in1[12] & in2[12];
    assign G_Z[18] = in1[11] & in2[11];
    assign G_Z[19] = in1[10] & in2[10];
    assign G_Z[20] = in1[9]  & in2[9];
    assign G_Z[21] = in1[8]  & in2[8];
    assign G_Z[22] = in1[7]  & in2[7];
    assign G_Z[23] = in1[6]  & in2[6];
    assign G_Z[24] = in1[5]  & in2[5];
    assign G_Z[25] = in1[4]  & in2[4];
    assign G_Z[26] = in1[3]  & in2[3];
    assign G_Z[27] = in1[2]  & in2[2];
    assign G_Z[28] = in1[1]  & in2[1];
    assign G_Z[29] = in1[0]  & in2[0];

    /*level 1*/
    assign G_A[0] = G_Z[0];
    /*gray_cell level_0A(cin, P_Z[0], G_Z[0], G_A[0]);*/
    black_cell level_1A(G_Z[0],  P_Z[1],  G_Z[1],  P_Z[0],  G_A[1],  P_A[1]);
    black_cell level_2A(G_Z[1],  P_Z[2],  G_Z[2],  P_Z[1],  G_A[2],  P_A[2]);
    black_cell level_3A(G_Z[2],  P_Z[3],  G_Z[3],  P_Z[2],  G_A[3],  P_A[3]);
    black_cell level_4A(G_Z[3],  P_Z[4],  G_Z[4],  P_Z[3],  G_A[4],  P_A[4]);
    black_cell level_5A(G_Z[4],  P_Z[5],  G_Z[5],  P_Z[4],  G_A[5],  P_A[5]);
    black_cell level_6A(G_Z[5],  P_Z[6],  G_Z[6],  P_Z[5],  G_A[6],  P_A[6]);
    black_cell level_7A(G_Z[6],  P_Z[7],  G_Z[7],  P_Z[6],  G_A[7],  P_A[7]);
    black_cell level_8A(G_Z[7],  P_Z[8],  G_Z[8],  P_Z[7],  G_A[8],  P_A[8]);
    black_cell level_9A(G_Z[8],  P_Z[9],  G_Z[9],  P_Z[8],  G_A[9],  P_A[9]);
    black_cell level_AA(G_Z[9],  P_Z[10], G_Z[10], P_Z[9],  G_A[10], P_A[10]);
    black_cell level_BA(G_Z[10], P_Z[11], G_Z[11], P_Z[10], G_A[11], P_A[11]);
    black_cell level_CA(G_Z[11], P_Z[12], G_Z[12], P_Z[11], G_A[12], P_A[12]);
    black_cell level_DA(G_Z[12], P_Z[13], G_Z[13], P_Z[12], G_A[13], P_A[13]);
    black_cell level_EA(G_Z[13], P_Z[14], G_Z[14], P_Z[13], G_A[14], P_A[14]);
    black_cell level_FA(G_Z[14], P_Z[15], G_Z[15], P_Z[14], G_A[15], P_A[15]);
    black_cell level_GA(G_Z[15], P_Z[16], G_Z[16], P_Z[15], G_A[16], P_A[16]);
    black_cell level_HA(G_Z[16], P_Z[17], G_Z[17], P_Z[16], G_A[17], P_A[17]);
    black_cell level_IA(G_Z[17], P_Z[18], G_Z[18], P_Z[17], G_A[18], P_A[18]);
    black_cell level_JA(G_Z[18], P_Z[19], G_Z[19], P_Z[18], G_A[19], P_A[19]);
    black_cell level_KA(G_Z[19], P_Z[20], G_Z[20], P_Z[19], G_A[20], P_A[20]);
    black_cell level_LA(G_Z[20], P_Z[21], G_Z[21], P_Z[20], G_A[21], P_A[21]);
    black_cell level_MA(G_Z[21], P_Z[22], G_Z[22], P_Z[21], G_A[22], P_A[22]);
    black_cell level_NA(G_Z[22], P_Z[23], G_Z[23], P_Z[22], G_A[23], P_A[23]);
    black_cell level_OA(G_Z[23], P_Z[24], G_Z[24], P_Z[23], G_A[24], P_A[24]);
    black_cell level_PA(G_Z[24], P_Z[25], G_Z[25], P_Z[24], G_A[25], P_A[25]);
    black_cell level_QA(G_Z[25], P_Z[26], G_Z[26], P_Z[25], G_A[26], P_A[26]);
    black_cell level_RA(G_Z[26], P_Z[27], G_Z[27], P_Z[26], G_A[27], P_A[27]);
    black_cell level_SA(G_Z[27], P_Z[28], G_Z[28], P_Z[27], G_A[28], P_A[28]);
    black_cell level_TA(G_Z[28], P_Z[29], G_Z[29], P_Z[28], G_A[29], P_A[29]);

    /*level 2*/
    assign G_B[1] = G_A[1];
    /*gray_cell level_1B(cin,      P_A[1],  G_A[1],  G_B[1]);*/
    gray_cell level_2B(G_A[0],   P_A[2],  G_A[2],  G_B[2]);
    black_cell level_3B(G_A[1],  P_A[3],  G_A[3],  P_A[1],  G_B[3],  P_B[3]);
    black_cell level_4B(G_A[2],  P_A[4],  G_A[4],  P_A[2],  G_B[4],  P_B[4]);
    black_cell level_5B(G_A[3],  P_A[5],  G_A[5],  P_A[3],  G_B[5],  P_B[5]);
    black_cell level_6B(G_A[4],  P_A[6],  G_A[6],  P_A[4],  G_B[6],  P_B[6]);
    black_cell level_7B(G_A[5],  P_A[7],  G_A[7],  P_A[5],  G_B[7],  P_B[7]);
    black_cell level_8B(G_A[6],  P_A[8],  G_A[8],  P_A[6],  G_B[8],  P_B[8]);
    black_cell level_9B(G_A[7],  P_A[9],  G_A[9],  P_A[7],  G_B[9],  P_B[9]);
    black_cell level_AB(G_A[8],  P_A[10], G_A[10], P_A[8],  G_B[10], P_B[10]);
    black_cell level_BB(G_A[9],  P_A[11], G_A[11], P_A[9],  G_B[11], P_B[11]);
    black_cell level_CB(G_A[10], P_A[12], G_A[12], P_A[10], G_B[12], P_B[12]);
    black_cell level_DB(G_A[11], P_A[13], G_A[13], P_A[11], G_B[13], P_B[13]);
    black_cell level_EB(G_A[12], P_A[14], G_A[14], P_A[12], G_B[14], P_B[14]);
    black_cell level_FB(G_A[13], P_A[15], G_A[15], P_A[13], G_B[15], P_B[15]);
    black_cell level_GB(G_A[14], P_A[16], G_A[16], P_A[14], G_B[16], P_B[16]);
    black_cell level_HB(G_A[15], P_A[17], G_A[17], P_A[15], G_B[17], P_B[17]);
    black_cell level_IB(G_A[16], P_A[18], G_A[18], P_A[16], G_B[18], P_B[18]);
    black_cell level_JB(G_A[17], P_A[19], G_A[19], P_A[17], G_B[19], P_B[19]);
    black_cell level_KB(G_A[18], P_A[20], G_A[20], P_A[18], G_B[20], P_B[20]);
    black_cell level_LB(G_A[19], P_A[21], G_A[21], P_A[19], G_B[21], P_B[21]);
    black_cell level_MB(G_A[20], P_A[22], G_A[22], P_A[20], G_B[22], P_B[22]);
    black_cell level_NB(G_A[21], P_A[23], G_A[23], P_A[21], G_B[23], P_B[23]);
    black_cell level_OB(G_A[22], P_A[24], G_A[24], P_A[22], G_B[24], P_B[24]);
    black_cell level_PB(G_A[23], P_A[25], G_A[25], P_A[23], G_B[25], P_B[25]);
    black_cell level_QB(G_A[24], P_A[26], G_A[26], P_A[24], G_B[26], P_B[26]);
    black_cell level_RB(G_A[25], P_A[27], G_A[27], P_A[25], G_B[27], P_B[27]);
    black_cell level_SB(G_A[26], P_A[28], G_A[28], P_A[26], G_B[28], P_B[28]);
    black_cell level_TB(G_A[27], P_A[29], G_A[29], P_A[27], G_B[29], P_B[29]);

    /*level 3*/
    assign G_C[3] = G_B[3];
    /*gray_cell level_3C(cin,      P_B[3],  G_B[3],  G_C[3]);*/
    gray_cell level_4C(G_A[0],   P_B[4],  G_B[4],  G_C[4]);
    gray_cell level_5C(G_B[1],   P_B[5],  G_B[5],  G_C[5]);
    gray_cell level_6C(G_B[2],   P_B[6],  G_B[6],  G_C[6]);
    black_cell level_7C(G_B[3],  P_B[7],  G_B[7],  P_B[3],  G_C[7],  P_C[7]);
    black_cell level_8C(G_B[4],  P_B[8],  G_B[8],  P_B[4],  G_C[8],  P_C[8]);
    black_cell level_9C(G_B[5],  P_B[9],  G_B[9],  P_B[5],  G_C[9],  P_C[9]);
    black_cell level_AC(G_B[6],  P_B[10], G_B[10], P_B[6],  G_C[10], P_C[10]);
    black_cell level_BC(G_B[7],  P_B[11], G_B[11], P_B[7],  G_C[11], P_C[11]);
    black_cell level_CC(G_B[8],  P_B[12], G_B[12], P_B[8],  G_C[12], P_C[12]);
    black_cell level_DC(G_B[9],  P_B[13], G_B[13], P_B[9],  G_C[13], P_C[13]);
    black_cell level_EC(G_B[10], P_B[14], G_B[14], P_B[10], G_C[14], P_C[14]);
    black_cell level_FC(G_B[11], P_B[15], G_B[15], P_B[11], G_C[15], P_C[15]);
    black_cell level_GC(G_B[12], P_B[16], G_B[16], P_B[12], G_C[16], P_C[16]);
    black_cell level_HC(G_B[13], P_B[17], G_B[17], P_B[13], G_C[17], P_C[17]);
    black_cell level_IC(G_B[14], P_B[18], G_B[18], P_B[14], G_C[18], P_C[18]);
    black_cell level_JC(G_B[15], P_B[19], G_B[19], P_B[15], G_C[19], P_C[19]);
    black_cell level_KC(G_B[16], P_B[20], G_B[20], P_B[16], G_C[20], P_C[20]);
    black_cell level_LC(G_B[17], P_B[21], G_B[21], P_B[17], G_C[21], P_C[21]);
    black_cell level_MC(G_B[18], P_B[22], G_B[22], P_B[18], G_C[22], P_C[22]);
    black_cell level_NC(G_B[19], P_B[23], G_B[23], P_B[19], G_C[23], P_C[23]);
    black_cell level_OC(G_B[20], P_B[24], G_B[24], P_B[20], G_C[24], P_C[24]);
    black_cell level_PC(G_B[21], P_B[25], G_B[25], P_B[21], G_C[25], P_C[25]);
    black_cell level_QC(G_B[22], P_B[26], G_B[26], P_B[22], G_C[26], P_C[26]);
    black_cell level_RC(G_B[23], P_B[27], G_B[27], P_B[23], G_C[27], P_C[27]);
    black_cell level_SC(G_B[24], P_B[28], G_B[28], P_B[24], G_C[28], P_C[28]);
    black_cell level_TC(G_B[25], P_B[29], G_B[29], P_B[25], G_C[29], P_C[29]);

    /*level 4*/
    assign G_D[7] =  G_C[7];
    /*gray_cell level_7D(cin,       P_C[7],   G_C[7],            G_D[7]);*/
    gray_cell level_8D(G_A[0],    P_C[8],   G_C[8],            G_D[8]);
    gray_cell level_9D(G_B[1],    P_C[9],   G_C[9],            G_D[9]);
    gray_cell level_AD(G_B[2],    P_C[10],  G_C[10],           G_D[10]);
    gray_cell level_BD(G_C[3],    P_C[11],  G_C[11],           G_D[11]);
    gray_cell level_CD(G_C[4],    P_C[12],  G_C[12],           G_D[12]);
    gray_cell level_DD(G_C[5],    P_C[13],  G_C[13],           G_D[13]);
    gray_cell level_ED(G_C[6],    P_C[14],  G_C[14],           G_D[14]);
    black_cell level_FD(G_C[7],   P_C[15],  G_C[15],  P_C[7],  G_D[15], P_D[15]);
    black_cell level_GD(G_C[8],   P_C[16],  G_C[16],  P_C[8],  G_D[16], P_D[16]);
    black_cell level_HD(G_C[9],   P_C[17],  G_C[17],  P_C[9],  G_D[17], P_D[17]);
    black_cell level_ID(G_C[10],  P_C[18],  G_C[18],  P_C[10], G_D[18], P_D[18]);
    black_cell level_JD(G_C[11],  P_C[19],  G_C[19],  P_C[11], G_D[19], P_D[19]);
    black_cell level_KD(G_C[12],  P_C[20],  G_C[20],  P_C[12], G_D[20], P_D[20]);
    black_cell level_LD(G_C[13],  P_C[21],  G_C[21],  P_C[13], G_D[21], P_D[21]);
    black_cell level_MD(G_C[14],  P_C[22],  G_C[22],  P_C[14], G_D[22], P_D[22]);
    black_cell level_ND(G_C[15],  P_C[23],  G_C[23],  P_C[15], G_D[23], P_D[23]);
    black_cell level_OD(G_C[16],  P_C[24],  G_C[24],  P_C[16], G_D[24], P_D[24]);
    black_cell level_PD(G_C[17],  P_C[25],  G_C[25],  P_C[17], G_D[25], P_D[25]);
    black_cell level_QD(G_C[18],  P_C[26],  G_C[26],  P_C[18], G_D[26], P_D[26]);
    black_cell level_RD(G_C[19],  P_C[27],  G_C[27],  P_C[19], G_D[27], P_D[27]);
    black_cell level_SD(G_C[20],  P_C[28],  G_C[28],  P_C[20], G_D[28], P_D[28]);
    black_cell level_TD(G_C[21],  P_C[29],  G_C[29],  P_C[21], G_D[29], P_D[29]);

    /*level 5*/
    assign G_E[15] = G_D[15];
    /*gray_cell level_FE(cin,       P_D[15],  G_D[15],           G_E[15]);*/
    gray_cell level_GE(G_A[0],    P_D[16],  G_D[16],           G_E[16]);
    gray_cell level_HE(G_B[1],    P_D[17],  G_D[17],           G_E[17]);
    gray_cell level_IE(G_B[2],    P_D[18],  G_D[18],           G_E[18]);
    gray_cell level_JE(G_C[3],    P_D[19],  G_D[19],           G_E[19]);
    gray_cell level_KE(G_C[4],    P_D[20],  G_D[20],           G_E[20]);
    gray_cell level_LE(G_C[5],    P_D[21],  G_D[21],           G_E[21]);
    gray_cell level_ME(G_C[6],    P_D[22],  G_D[22],           G_E[22]);
    gray_cell level_NE(G_D[7],    P_D[23],  G_D[23],           G_E[23]);
    gray_cell level_OE(G_D[8],    P_D[24],  G_D[24],           G_E[24]);
    gray_cell level_PE(G_D[9],    P_D[25],  G_D[25],           G_E[25]);
    gray_cell level_QE(G_D[10],   P_D[26],  G_D[26],           G_E[26]);
    gray_cell level_RE(G_D[11],   P_D[27],  G_D[27],           G_E[27]);
    gray_cell level_SE(G_D[12],   P_D[28],  G_D[28],           G_E[28]);
    gray_cell level_TE(G_D[13],   P_D[29],  G_D[29],           cout);

    /*outputs*/
    assign sum[0]  =           P_Z[0];
    assign sum[1]  = G_A[0]  ^ P_Z[1];
    assign sum[2]  = G_B[1]  ^ P_Z[2];
    assign sum[3]  = G_B[2]  ^ P_Z[3];
    assign sum[4]  = G_C[3]  ^ P_Z[4];
    assign sum[5]  = G_C[4]  ^ P_Z[5];
    assign sum[6]  = G_C[5]  ^ P_Z[6];
    assign sum[7]  = G_C[6]  ^ P_Z[7];
    assign sum[8]  = G_D[7]  ^ P_Z[8];
    assign sum[9]  = G_D[8]  ^ P_Z[9];
    assign sum[10] = G_D[9]  ^ P_Z[10];
    assign sum[11] = G_D[10] ^ P_Z[11];
    assign sum[12] = G_D[11] ^ P_Z[12];
    assign sum[13] = G_D[12] ^ P_Z[13];
    assign sum[14] = G_D[13] ^ P_Z[14];
    assign sum[15] = G_D[14] ^ P_Z[15];
    assign sum[16] = G_D[15] ^ P_Z[16];
    assign sum[17] = G_D[16] ^ P_Z[17];
    assign sum[18] = G_D[17] ^ P_Z[18];
    assign sum[19] = G_D[18] ^ P_Z[19];
    assign sum[20] = G_D[19] ^ P_Z[20];
    assign sum[21] = G_D[20] ^ P_Z[21];
    assign sum[22] = G_D[21] ^ P_Z[22];
    assign sum[23] = G_D[22] ^ P_Z[23];
    assign sum[24] = G_D[23] ^ P_Z[24];
    assign sum[25] = G_D[24] ^ P_Z[25];
    assign sum[26] = G_D[25] ^ P_Z[26];
    assign sum[27] = G_D[26] ^ P_Z[27];
    assign sum[28] = G_D[27] ^ P_Z[28];
    assign sum[29] = G_D[28] ^ P_Z[29];
endmodule

