module multiplier_32bits_version13(product, A, B);

    /*
     * Area: 
     * Power: mW
     * Timing: ns
     */

    output [63:0] product;
    input [31:0] A, B;

    wire [31:0] pp0;
    wire [31:0] pp1;
    wire [31:0] pp2;
    wire [31:0] pp3;
    wire [31:0] pp4;
    wire [31:0] pp5;
    wire [31:0] pp6;
    wire [31:0] pp7;
    wire [31:0] pp8;
    wire [31:0] pp9;
    wire [31:0] pp10;
    wire [31:0] pp11;
    wire [31:0] pp12;
    wire [31:0] pp13;
    wire [31:0] pp14;
    wire [31:0] pp15;
    wire [31:0] pp16;
    wire [31:0] pp17;
    wire [31:0] pp18;
    wire [31:0] pp19;
    wire [31:0] pp20;
    wire [31:0] pp21;
    wire [31:0] pp22;
    wire [31:0] pp23;
    wire [31:0] pp24;
    wire [31:0] pp25;
    wire [31:0] pp26;
    wire [31:0] pp27;
    wire [31:0] pp28;
    wire [31:0] pp29;
    wire [31:0] pp30;
    wire [31:0] pp31;


    assign pp0 = A[0] ? B: 32'b00000000000000000000000000000000;
    assign pp1 = A[1] ? B: 32'b00000000000000000000000000000000;
    assign pp2 = A[2] ? B: 32'b00000000000000000000000000000000;
    assign pp3 = A[3] ? B: 32'b00000000000000000000000000000000;
    assign pp4 = A[4] ? B: 32'b00000000000000000000000000000000;
    assign pp5 = A[5] ? B: 32'b00000000000000000000000000000000;
    assign pp6 = A[6] ? B: 32'b00000000000000000000000000000000;
    assign pp7 = A[7] ? B: 32'b00000000000000000000000000000000;
    assign pp8 = A[8] ? B: 32'b00000000000000000000000000000000;
    assign pp9 = A[9] ? B: 32'b00000000000000000000000000000000;
    assign pp10 = A[10] ? B: 32'b00000000000000000000000000000000;
    assign pp11 = A[11] ? B: 32'b00000000000000000000000000000000;
    assign pp12 = A[12] ? B: 32'b00000000000000000000000000000000;
    assign pp13 = A[13] ? B: 32'b00000000000000000000000000000000;
    assign pp14 = A[14] ? B: 32'b00000000000000000000000000000000;
    assign pp15 = A[15] ? B: 32'b00000000000000000000000000000000;
    assign pp16 = A[16] ? B: 32'b00000000000000000000000000000000;
    assign pp17 = A[17] ? B: 32'b00000000000000000000000000000000;
    assign pp18 = A[18] ? B: 32'b00000000000000000000000000000000;
    assign pp19 = A[19] ? B: 32'b00000000000000000000000000000000;
    assign pp20 = A[20] ? B: 32'b00000000000000000000000000000000;
    assign pp21 = A[21] ? B: 32'b00000000000000000000000000000000;
    assign pp22 = A[22] ? B: 32'b00000000000000000000000000000000;
    assign pp23 = A[23] ? B: 32'b00000000000000000000000000000000;
    assign pp24 = A[24] ? B: 32'b00000000000000000000000000000000;
    assign pp25 = A[25] ? B: 32'b00000000000000000000000000000000;
    assign pp26 = A[26] ? B: 32'b00000000000000000000000000000000;
    assign pp27 = A[27] ? B: 32'b00000000000000000000000000000000;
    assign pp28 = A[28] ? B: 32'b00000000000000000000000000000000;
    assign pp29 = A[29] ? B: 32'b00000000000000000000000000000000;
    assign pp30 = A[30] ? B: 32'b00000000000000000000000000000000;
    assign pp31 = A[31] ? B: 32'b00000000000000000000000000000000;


    /*Stage 1*/
    wire[31:0] s1, in1_1, in1_2;
    wire c1;
    assign in1_1 = {pp0[16],pp0[17],pp0[18],pp0[19],pp0[20],pp0[21],pp0[22],pp0[23],pp0[24],pp0[25],pp0[26],pp0[27],pp0[28],pp0[29],pp0[30],pp0[31],pp1[31],pp2[31],pp3[31],pp4[31],pp5[31],pp6[31],pp7[31],pp8[31],pp9[31],pp10[31],pp11[31],pp12[31],pp13[31],pp14[31],pp15[31],pp16[31]};
    assign in1_2 = {pp1[15],pp1[16],pp1[17],pp1[18],pp1[19],pp1[20],pp1[21],pp1[22],pp1[23],pp1[24],pp1[25],pp1[26],pp1[27],pp1[28],pp1[29],pp1[30],pp2[30],pp3[30],pp4[30],pp5[30],pp6[30],pp7[30],pp8[30],pp9[30],pp10[30],pp11[30],pp12[30],pp13[30],pp14[30],pp15[30],pp16[30],pp17[30]};
    CLA_32 KS_1(s1, c1, in1_1, in1_2);
    wire[29:0] s2, in2_1, in2_2;
    wire c2;
    assign in2_1 = {pp2[15],pp2[16],pp2[17],pp2[18],pp2[19],pp2[20],pp2[21],pp2[22],pp2[23],pp2[24],pp2[25],pp2[26],pp2[27],pp2[28],pp2[29],pp3[29],pp4[29],pp5[29],pp6[29],pp7[29],pp8[29],pp9[29],pp10[29],pp11[29],pp12[29],pp13[29],pp14[29],pp15[29],pp16[29],pp17[29]};
    assign in2_2 = {pp3[14],pp3[15],pp3[16],pp3[17],pp3[18],pp3[19],pp3[20],pp3[21],pp3[22],pp3[23],pp3[24],pp3[25],pp3[26],pp3[27],pp3[28],pp4[28],pp5[28],pp6[28],pp7[28],pp8[28],pp9[28],pp10[28],pp11[28],pp12[28],pp13[28],pp14[28],pp15[28],pp16[28],pp17[28],pp18[28]};
    CLA_30 KS_2(s2, c2, in2_1, in2_2);
    wire[27:0] s3, in3_1, in3_2;
    wire c3;
    assign in3_1 = {pp4[14],pp4[15],pp4[16],pp4[17],pp4[18],pp4[19],pp4[20],pp4[21],pp4[22],pp4[23],pp4[24],pp4[25],pp4[26],pp4[27],pp5[27],pp6[27],pp7[27],pp8[27],pp9[27],pp10[27],pp11[27],pp12[27],pp13[27],pp14[27],pp15[27],pp16[27],pp17[27],pp18[27]};
    assign in3_2 = {pp5[13],pp5[14],pp5[15],pp5[16],pp5[17],pp5[18],pp5[19],pp5[20],pp5[21],pp5[22],pp5[23],pp5[24],pp5[25],pp5[26],pp6[26],pp7[26],pp8[26],pp9[26],pp10[26],pp11[26],pp12[26],pp13[26],pp14[26],pp15[26],pp16[26],pp17[26],pp18[26],pp19[26]};
    CLA_28 KS_3(s3, c3, in3_1, in3_2);
    wire[25:0] s4, in4_1, in4_2;
    wire c4;
    assign in4_1 = {pp6[13],pp6[14],pp6[15],pp6[16],pp6[17],pp6[18],pp6[19],pp6[20],pp6[21],pp6[22],pp6[23],pp6[24],pp6[25],pp7[25],pp8[25],pp9[25],pp10[25],pp11[25],pp12[25],pp13[25],pp14[25],pp15[25],pp16[25],pp17[25],pp18[25],pp19[25]};
    assign in4_2 = {pp7[12],pp7[13],pp7[14],pp7[15],pp7[16],pp7[17],pp7[18],pp7[19],pp7[20],pp7[21],pp7[22],pp7[23],pp7[24],pp8[24],pp9[24],pp10[24],pp11[24],pp12[24],pp13[24],pp14[24],pp15[24],pp16[24],pp17[24],pp18[24],pp19[24],pp20[24]};
    CLA_26 KS_4(s4, c4, in4_1, in4_2);
    wire[23:0] s5, in5_1, in5_2;
    wire c5;
    assign in5_1 = {pp8[12],pp8[13],pp8[14],pp8[15],pp8[16],pp8[17],pp8[18],pp8[19],pp8[20],pp8[21],pp8[22],pp8[23],pp9[23],pp10[23],pp11[23],pp12[23],pp13[23],pp14[23],pp15[23],pp16[23],pp17[23],pp18[23],pp19[23],pp20[23]};
    assign in5_2 = {pp9[11],pp9[12],pp9[13],pp9[14],pp9[15],pp9[16],pp9[17],pp9[18],pp9[19],pp9[20],pp9[21],pp9[22],pp10[22],pp11[22],pp12[22],pp13[22],pp14[22],pp15[22],pp16[22],pp17[22],pp18[22],pp19[22],pp20[22],pp21[22]};
    CLA_24 KS_5(s5, c5, in5_1, in5_2);
    wire[21:0] s6, in6_1, in6_2;
    wire c6;
    assign in6_1 = {pp10[11],pp10[12],pp10[13],pp10[14],pp10[15],pp10[16],pp10[17],pp10[18],pp10[19],pp10[20],pp10[21],pp11[21],pp12[21],pp13[21],pp14[21],pp15[21],pp16[21],pp17[21],pp18[21],pp19[21],pp20[21],pp21[21]};
    assign in6_2 = {pp11[10],pp11[11],pp11[12],pp11[13],pp11[14],pp11[15],pp11[16],pp11[17],pp11[18],pp11[19],pp11[20],pp12[20],pp13[20],pp14[20],pp15[20],pp16[20],pp17[20],pp18[20],pp19[20],pp20[20],pp21[20],pp22[20]};
    CLA_22 KS_6(s6, c6, in6_1, in6_2);
    wire[19:0] s7, in7_1, in7_2;
    wire c7;
    assign in7_1 = {pp12[10],pp12[11],pp12[12],pp12[13],pp12[14],pp12[15],pp12[16],pp12[17],pp12[18],pp12[19],pp13[19],pp14[19],pp15[19],pp16[19],pp17[19],pp18[19],pp19[19],pp20[19],pp21[19],pp22[19]};
    assign in7_2 = {pp13[9],pp13[10],pp13[11],pp13[12],pp13[13],pp13[14],pp13[15],pp13[16],pp13[17],pp13[18],pp14[18],pp15[18],pp16[18],pp17[18],pp18[18],pp19[18],pp20[18],pp21[18],pp22[18],pp23[18]};
    CLA_20 KS_7(s7, c7, in7_1, in7_2);
    wire[17:0] s8, in8_1, in8_2;
    wire c8;
    assign in8_1 = {pp14[9],pp14[10],pp14[11],pp14[12],pp14[13],pp14[14],pp14[15],pp14[16],pp14[17],pp15[17],pp16[17],pp17[17],pp18[17],pp19[17],pp20[17],pp21[17],pp22[17],pp23[17]};
    assign in8_2 = {pp15[8],pp15[9],pp15[10],pp15[11],pp15[12],pp15[13],pp15[14],pp15[15],pp15[16],pp16[16],pp17[16],pp18[16],pp19[16],pp20[16],pp21[16],pp22[16],pp23[16],pp24[16]};
    CLA_18 KS_8(s8, c8, in8_1, in8_2);
    wire[15:0] s9, in9_1, in9_2;
    wire c9;
    assign in9_1 = {pp16[8],pp16[9],pp16[10],pp16[11],pp16[12],pp16[13],pp16[14],pp16[15],pp17[15],pp18[15],pp19[15],pp20[15],pp21[15],pp22[15],pp23[15],pp24[15]};
    assign in9_2 = {pp17[7],pp17[8],pp17[9],pp17[10],pp17[11],pp17[12],pp17[13],pp17[14],pp18[14],pp19[14],pp20[14],pp21[14],pp22[14],pp23[14],pp24[14],pp25[14]};
    CLA_16 KS_9(s9, c9, in9_1, in9_2);
    wire[13:0] s10, in10_1, in10_2;
    wire c10;
    assign in10_1 = {pp18[7],pp18[8],pp18[9],pp18[10],pp18[11],pp18[12],pp18[13],pp19[13],pp20[13],pp21[13],pp22[13],pp23[13],pp24[13],pp25[13]};
    assign in10_2 = {pp19[6],pp19[7],pp19[8],pp19[9],pp19[10],pp19[11],pp19[12],pp20[12],pp21[12],pp22[12],pp23[12],pp24[12],pp25[12],pp26[12]};
    CLA_14 KS_10(s10, c10, in10_1, in10_2);
    wire[11:0] s11, in11_1, in11_2;
    wire c11;
    assign in11_1 = {pp20[6],pp20[7],pp20[8],pp20[9],pp20[10],pp20[11],pp21[11],pp22[11],pp23[11],pp24[11],pp25[11],pp26[11]};
    assign in11_2 = {pp21[5],pp21[6],pp21[7],pp21[8],pp21[9],pp21[10],pp22[10],pp23[10],pp24[10],pp25[10],pp26[10],pp27[10]};
    CLA_12 KS_11(s11, c11, in11_1, in11_2);
    wire[9:0] s12, in12_1, in12_2;
    wire c12;
    assign in12_1 = {pp22[5],pp22[6],pp22[7],pp22[8],pp22[9],pp23[9],pp24[9],pp25[9],pp26[9],pp27[9]};
    assign in12_2 = {pp23[4],pp23[5],pp23[6],pp23[7],pp23[8],pp24[8],pp25[8],pp26[8],pp27[8],pp28[8]};
    CLA_10 KS_12(s12, c12, in12_1, in12_2);
    wire[7:0] s13, in13_1, in13_2;
    wire c13;
    assign in13_1 = {pp24[4],pp24[5],pp24[6],pp24[7],pp25[7],pp26[7],pp27[7],pp28[7]};
    assign in13_2 = {pp25[3],pp25[4],pp25[5],pp25[6],pp26[6],pp27[6],pp28[6],pp29[6]};
    CLA_8 KS_13(s13, c13, in13_1, in13_2);
    wire[5:0] s14, in14_1, in14_2;
    wire c14;
    assign in14_1 = {pp26[3],pp26[4],pp26[5],pp27[5],pp28[5],pp29[5]};
    assign in14_2 = {pp27[2],pp27[3],pp27[4],pp28[4],pp29[4],pp30[4]};
    CLA_6 KS_14(s14, c14, in14_1, in14_2);
    wire[3:0] s15, in15_1, in15_2;
    wire c15;
    assign in15_1 = {pp28[2],pp28[3],pp29[3],pp30[3]};
    assign in15_2 = {pp29[1],pp29[2],pp30[2],pp31[2]};
    CLA_4 KS_15(s15, c15, in15_1, in15_2);
    wire[1:0] s16, in16_1, in16_2;
    wire c16;
    assign in16_1 = {pp30[1],pp31[1]};
    assign in16_2 = {pp31[0],1'b0};
    CLA_2 KS_16(s16, c16, in16_1, in16_2);

    /*Stage 2*/
    wire[47:0] s17, in17_1, in17_2;
    wire c17;
    assign in17_1 = {pp0[8],pp0[9],pp0[10],pp0[11],pp0[12],pp0[13],pp0[14],pp0[15],pp2[14],pp4[13],pp6[12],pp8[11],pp10[10],pp12[9],pp14[8],pp16[7],pp18[6],pp20[5],pp22[4],pp24[3],pp26[2],pp28[1],pp30[0],s1[15],s1[16],s1[17],pp31[3],pp30[5],pp29[7],pp28[9],pp27[11],pp26[13],pp25[15],pp24[17],pp23[19],pp22[21],pp21[23],pp20[25],pp19[27],pp18[29],pp17[31],pp18[31],pp19[31],pp20[31],pp21[31],pp22[31],pp23[31],pp24[31]};
    assign in17_2 = {pp1[7],pp1[8],pp1[9],pp1[10],pp1[11],pp1[12],pp1[13],pp1[14],pp3[13],pp5[12],pp7[11],pp9[10],pp11[9],pp13[8],pp15[7],pp17[6],pp19[5],pp21[4],pp23[3],pp25[2],pp27[1],pp29[0],s1[14],s2[14],s2[15],s2[16],s1[18],pp31[4],pp30[6],pp29[8],pp28[10],pp27[12],pp26[14],pp25[16],pp24[18],pp23[20],pp22[22],pp21[24],pp20[26],pp19[28],pp18[30],pp19[30],pp20[30],pp21[30],pp22[30],pp23[30],pp24[30],pp25[30]};
    CLA_48 KS_17(s17, c17, in17_1, in17_2);
    wire[45:0] s18, in18_1, in18_2;
    wire c18;
    assign in18_1 = {pp2[7],pp2[8],pp2[9],pp2[10],pp2[11],pp2[12],pp2[13],pp4[12],pp6[11],pp8[10],pp10[9],pp12[8],pp14[7],pp16[6],pp18[5],pp20[4],pp22[3],pp24[2],pp26[1],pp28[0],s1[13],s2[13],s3[13],s3[14],s3[15],s2[17],s1[19],pp31[5],pp30[7],pp29[9],pp28[11],pp27[13],pp26[15],pp25[17],pp24[19],pp23[21],pp22[23],pp21[25],pp20[27],pp19[29],pp20[29],pp21[29],pp22[29],pp23[29],pp24[29],pp25[29]};
    assign in18_2 = {pp3[6],pp3[7],pp3[8],pp3[9],pp3[10],pp3[11],pp3[12],pp5[11],pp7[10],pp9[9],pp11[8],pp13[7],pp15[6],pp17[5],pp19[4],pp21[3],pp23[2],pp25[1],pp27[0],s1[12],s2[12],s3[12],s4[12],s4[13],s4[14],s3[16],s2[18],s1[20],pp31[6],pp30[8],pp29[10],pp28[12],pp27[14],pp26[16],pp25[18],pp24[20],pp23[22],pp22[24],pp21[26],pp20[28],pp21[28],pp22[28],pp23[28],pp24[28],pp25[28],pp26[28]};
    CLA_46 KS_18(s18, c18, in18_1, in18_2);
    wire[43:0] s19, in19_1, in19_2;
    wire c19;
    assign in19_1 = {pp4[6],pp4[7],pp4[8],pp4[9],pp4[10],pp4[11],pp6[10],pp8[9],pp10[8],pp12[7],pp14[6],pp16[5],pp18[4],pp20[3],pp22[2],pp24[1],pp26[0],s1[11],s2[11],s3[11],s4[11],s5[11],s5[12],s5[13],s4[15],s3[17],s2[19],s1[21],pp31[7],pp30[9],pp29[11],pp28[13],pp27[15],pp26[17],pp25[19],pp24[21],pp23[23],pp22[25],pp21[27],pp22[27],pp23[27],pp24[27],pp25[27],pp26[27]};
    assign in19_2 = {pp5[5],pp5[6],pp5[7],pp5[8],pp5[9],pp5[10],pp7[9],pp9[8],pp11[7],pp13[6],pp15[5],pp17[4],pp19[3],pp21[2],pp23[1],pp25[0],s1[10],s2[10],s3[10],s4[10],s5[10],s6[10],s6[11],s6[12],s5[14],s4[16],s3[18],s2[20],s1[22],pp31[8],pp30[10],pp29[12],pp28[14],pp27[16],pp26[18],pp25[20],pp24[22],pp23[24],pp22[26],pp23[26],pp24[26],pp25[26],pp26[26],pp27[26]};
    CLA_44 KS_19(s19, c19, in19_1, in19_2);
    wire[41:0] s20, in20_1, in20_2;
    wire c20;
    assign in20_1 = {pp6[5],pp6[6],pp6[7],pp6[8],pp6[9],pp8[8],pp10[7],pp12[6],pp14[5],pp16[4],pp18[3],pp20[2],pp22[1],pp24[0],s1[9],s2[9],s3[9],s4[9],s5[9],s6[9],s7[9],s7[10],s7[11],s6[13],s5[15],s4[17],s3[19],s2[21],s1[23],pp31[9],pp30[11],pp29[13],pp28[15],pp27[17],pp26[19],pp25[21],pp24[23],pp23[25],pp24[25],pp25[25],pp26[25],pp27[25]};
    assign in20_2 = {pp7[4],pp7[5],pp7[6],pp7[7],pp7[8],pp9[7],pp11[6],pp13[5],pp15[4],pp17[3],pp19[2],pp21[1],pp23[0],s1[8],s2[8],s3[8],s4[8],s5[8],s6[8],s7[8],s8[8],s8[9],s8[10],s7[12],s6[14],s5[16],s4[18],s3[20],s2[22],s1[24],pp31[10],pp30[12],pp29[14],pp28[16],pp27[18],pp26[20],pp25[22],pp24[24],pp25[24],pp26[24],pp27[24],pp28[24]};
    CLA_42 KS_20(s20, c20, in20_1, in20_2);
    wire[39:0] s21, in21_1, in21_2;
    wire c21;
    assign in21_1 = {pp8[4],pp8[5],pp8[6],pp8[7],pp10[6],pp12[5],pp14[4],pp16[3],pp18[2],pp20[1],pp22[0],s1[7],s2[7],s3[7],s4[7],s5[7],s6[7],s7[7],s8[7],s9[7],s9[8],s9[9],s8[11],s7[13],s6[15],s5[17],s4[19],s3[21],s2[23],s1[25],pp31[11],pp30[13],pp29[15],pp28[17],pp27[19],pp26[21],pp25[23],pp26[23],pp27[23],pp28[23]};
    assign in21_2 = {pp9[3],pp9[4],pp9[5],pp9[6],pp11[5],pp13[4],pp15[3],pp17[2],pp19[1],pp21[0],s1[6],s2[6],s3[6],s4[6],s5[6],s6[6],s7[6],s8[6],s9[6],s10[6],s10[7],s10[8],s9[10],s8[12],s7[14],s6[16],s5[18],s4[20],s3[22],s2[24],s1[26],pp31[12],pp30[14],pp29[16],pp28[18],pp27[20],pp26[22],pp27[22],pp28[22],pp29[22]};
    CLA_40 KS_21(s21, c21, in21_1, in21_2);
    wire[37:0] s22, in22_1, in22_2;
    wire c22;
    assign in22_1 = {pp10[3],pp10[4],pp10[5],pp12[4],pp14[3],pp16[2],pp18[1],pp20[0],s1[5],s2[5],s3[5],s4[5],s5[5],s6[5],s7[5],s8[5],s9[5],s10[5],s11[5],s11[6],s11[7],s10[9],s9[11],s8[13],s7[15],s6[17],s5[19],s4[21],s3[23],s2[25],s1[27],pp31[13],pp30[15],pp29[17],pp28[19],pp27[21],pp28[21],pp29[21]};
    assign in22_2 = {pp11[2],pp11[3],pp11[4],pp13[3],pp15[2],pp17[1],pp19[0],s1[4],s2[4],s3[4],s4[4],s5[4],s6[4],s7[4],s8[4],s9[4],s10[4],s11[4],s12[4],s12[5],s12[6],s11[8],s10[10],s9[12],s8[14],s7[16],s6[18],s5[20],s4[22],s3[24],s2[26],s1[28],pp31[14],pp30[16],pp29[18],pp28[20],pp29[20],pp30[20]};
    CLA_38 KS_22(s22, c22, in22_1, in22_2);
    wire[35:0] s23, in23_1, in23_2;
    wire c23;
    assign in23_1 = {pp12[2],pp12[3],pp14[2],pp16[1],pp18[0],s1[3],s2[3],s3[3],s4[3],s5[3],s6[3],s7[3],s8[3],s9[3],s10[3],s11[3],s12[3],s13[3],s13[4],s13[5],s12[7],s11[9],s10[11],s9[13],s8[15],s7[17],s6[19],s5[21],s4[23],s3[25],s2[27],s1[29],pp31[15],pp30[17],pp29[19],pp30[19]};
    assign in23_2 = {pp13[1],pp13[2],pp15[1],pp17[0],s1[2],s2[2],s3[2],s4[2],s5[2],s6[2],s7[2],s8[2],s9[2],s10[2],s11[2],s12[2],s13[2],s14[2],s14[3],s14[4],s13[6],s12[8],s11[10],s10[12],s9[14],s8[16],s7[18],s6[20],s5[22],s4[24],s3[26],s2[28],s1[30],pp31[16],pp30[18],pp31[18]};
    CLA_36 KS_23(s23, c23, in23_1, in23_2);
    wire[33:0] s24, in24_1, in24_2;
    wire c24;
    assign in24_1 = {pp14[1],pp16[0],s1[1],s2[1],s3[1],s4[1],s5[1],s6[1],s7[1],s8[1],s9[1],s10[1],s11[1],s12[1],s13[1],s14[1],s15[1],s15[2],s15[3],s14[5],s13[7],s12[9],s11[11],s10[13],s9[15],s8[17],s7[19],s6[21],s5[23],s4[25],s3[27],s2[29],s1[31],pp31[17]};
    assign in24_2 = {pp15[0],s1[0],s2[0],s3[0],s4[0],s5[0],s6[0],s7[0],s8[0],s9[0],s10[0],s11[0],s12[0],s13[0],s14[0],s15[0],s16[0],s16[1],c16,c15,c14,c13,c12,c11,c10,c9,c8,c7,c6,c5,c4,c3,c2,c1};
    CLA_34 KS_24(s24, c24, in24_1, in24_2);

    /*Stage 3*/
    wire[55:0] s25, in25_1, in25_2;
    wire c25;
    assign in25_1 = {pp0[4],pp0[5],pp0[6],pp0[7],pp2[6],pp4[5],pp6[4],pp8[3],pp10[2],pp12[1],pp14[0],s17[7],s17[8],s17[9],s17[10],s17[11],s17[12],s17[13],s17[14],s17[15],s17[16],s17[17],s17[18],s17[19],s17[20],s17[21],s17[22],s17[23],s17[24],s17[25],s17[26],s17[27],s17[28],s17[29],s17[30],s17[31],s17[32],s17[33],s17[34],s17[35],s17[36],s17[37],s17[38],s17[39],s17[40],s17[41],pp31[19],pp30[21],pp29[23],pp28[25],pp27[27],pp26[29],pp25[31],pp26[31],pp27[31],pp28[31]};
    assign in25_2 = {pp1[3],pp1[4],pp1[5],pp1[6],pp3[5],pp5[4],pp7[3],pp9[2],pp11[1],pp13[0],s17[6],s18[6],s18[7],s18[8],s18[9],s18[10],s18[11],s18[12],s18[13],s18[14],s18[15],s18[16],s18[17],s18[18],s18[19],s18[20],s18[21],s18[22],s18[23],s18[24],s18[25],s18[26],s18[27],s18[28],s18[29],s18[30],s18[31],s18[32],s18[33],s18[34],s18[35],s18[36],s18[37],s18[38],s18[39],s18[40],s17[42],pp31[20],pp30[22],pp29[24],pp28[26],pp27[28],pp26[30],pp27[30],pp28[30],pp29[30]};
    CLA_56 KS_25(s25, c25, in25_1, in25_2);
    wire[53:0] s26, in26_1, in26_2;
    wire c26;
    assign in26_1 = {pp2[3],pp2[4],pp2[5],pp4[4],pp6[3],pp8[2],pp10[1],pp12[0],s17[5],s18[5],s19[5],s19[6],s19[7],s19[8],s19[9],s19[10],s19[11],s19[12],s19[13],s19[14],s19[15],s19[16],s19[17],s19[18],s19[19],s19[20],s19[21],s19[22],s19[23],s19[24],s19[25],s19[26],s19[27],s19[28],s19[29],s19[30],s19[31],s19[32],s19[33],s19[34],s19[35],s19[36],s19[37],s19[38],s19[39],s18[41],s17[43],pp31[21],pp30[23],pp29[25],pp28[27],pp27[29],pp28[29],pp29[29]};
    assign in26_2 = {pp3[2],pp3[3],pp3[4],pp5[3],pp7[2],pp9[1],pp11[0],s17[4],s18[4],s19[4],s20[4],s20[5],s20[6],s20[7],s20[8],s20[9],s20[10],s20[11],s20[12],s20[13],s20[14],s20[15],s20[16],s20[17],s20[18],s20[19],s20[20],s20[21],s20[22],s20[23],s20[24],s20[25],s20[26],s20[27],s20[28],s20[29],s20[30],s20[31],s20[32],s20[33],s20[34],s20[35],s20[36],s20[37],s20[38],s19[40],s18[42],s17[44],pp31[22],pp30[24],pp29[26],pp28[28],pp29[28],pp30[28]};
    CLA_54 KS_26(s26, c26, in26_1, in26_2);
    wire[51:0] s27, in27_1, in27_2;
    wire c27;
    assign in27_1 = {pp4[2],pp4[3],pp6[2],pp8[1],pp10[0],s17[3],s18[3],s19[3],s20[3],s21[3],s21[4],s21[5],s21[6],s21[7],s21[8],s21[9],s21[10],s21[11],s21[12],s21[13],s21[14],s21[15],s21[16],s21[17],s21[18],s21[19],s21[20],s21[21],s21[22],s21[23],s21[24],s21[25],s21[26],s21[27],s21[28],s21[29],s21[30],s21[31],s21[32],s21[33],s21[34],s21[35],s21[36],s21[37],s20[39],s19[41],s18[43],s17[45],pp31[23],pp30[25],pp29[27],pp30[27]};
    assign in27_2 = {pp5[1],pp5[2],pp7[1],pp9[0],s17[2],s18[2],s19[2],s20[2],s21[2],s22[2],s22[3],s22[4],s22[5],s22[6],s22[7],s22[8],s22[9],s22[10],s22[11],s22[12],s22[13],s22[14],s22[15],s22[16],s22[17],s22[18],s22[19],s22[20],s22[21],s22[22],s22[23],s22[24],s22[25],s22[26],s22[27],s22[28],s22[29],s22[30],s22[31],s22[32],s22[33],s22[34],s22[35],s22[36],s21[38],s20[40],s19[42],s18[44],s17[46],pp31[24],pp30[26],pp31[26]};
    CLA_52 KS_27(s27, c27, in27_1, in27_2);
    wire[49:0] s28, in28_1, in28_2;
    wire c28;
    assign in28_1 = {pp6[1],pp8[0],s17[1],s18[1],s19[1],s20[1],s21[1],s22[1],s23[1],s23[2],s23[3],s23[4],s23[5],s23[6],s23[7],s23[8],s23[9],s23[10],s23[11],s23[12],s23[13],s23[14],s23[15],s23[16],s23[17],s23[18],s23[19],s23[20],s23[21],s23[22],s23[23],s23[24],s23[25],s23[26],s23[27],s23[28],s23[29],s23[30],s23[31],s23[32],s23[33],s23[34],s23[35],s22[37],s21[39],s20[41],s19[43],s18[45],s17[47],pp31[25]};
    assign in28_2 = {pp7[0],s17[0],s18[0],s19[0],s20[0],s21[0],s22[0],s23[0],s24[0],s24[1],s24[2],s24[3],s24[4],s24[5],s24[6],s24[7],s24[8],s24[9],s24[10],s24[11],s24[12],s24[13],s24[14],s24[15],s24[16],s24[17],s24[18],s24[19],s24[20],s24[21],s24[22],s24[23],s24[24],s24[25],s24[26],s24[27],s24[28],s24[29],s24[30],s24[31],s24[32],s24[33],c24,c23,c22,c21,c20,c19,c18,c17};
    CLA_50 KS_28(s28, c28, in28_1, in28_2);

    /*Stage 4*/
    wire[59:0] s29, in29_1, in29_2;
    wire c29;
    assign in29_1 = {pp0[2],pp0[3],pp2[2],pp4[1],pp6[0],s25[3],s25[4],s25[5],s25[6],s25[7],s25[8],s25[9],s25[10],s25[11],s25[12],s25[13],s25[14],s25[15],s25[16],s25[17],s25[18],s25[19],s25[20],s25[21],s25[22],s25[23],s25[24],s25[25],s25[26],s25[27],s25[28],s25[29],s25[30],s25[31],s25[32],s25[33],s25[34],s25[35],s25[36],s25[37],s25[38],s25[39],s25[40],s25[41],s25[42],s25[43],s25[44],s25[45],s25[46],s25[47],s25[48],s25[49],s25[50],s25[51],s25[52],s25[53],pp31[27],pp30[29],pp29[31],pp30[31]};
    assign in29_2 = {pp1[1],pp1[2],pp3[1],pp5[0],s25[2],s26[2],s26[3],s26[4],s26[5],s26[6],s26[7],s26[8],s26[9],s26[10],s26[11],s26[12],s26[13],s26[14],s26[15],s26[16],s26[17],s26[18],s26[19],s26[20],s26[21],s26[22],s26[23],s26[24],s26[25],s26[26],s26[27],s26[28],s26[29],s26[30],s26[31],s26[32],s26[33],s26[34],s26[35],s26[36],s26[37],s26[38],s26[39],s26[40],s26[41],s26[42],s26[43],s26[44],s26[45],s26[46],s26[47],s26[48],s26[49],s26[50],s26[51],s26[52],s25[54],pp31[28],pp30[30],pp31[30]};
    CLA_60 KS_29(s29, c29, in29_1, in29_2);
    wire[57:0] s30, in30_1, in30_2;
    wire c30;
    assign in30_1 = {pp2[1],pp4[0],s25[1],s26[1],s27[1],s27[2],s27[3],s27[4],s27[5],s27[6],s27[7],s27[8],s27[9],s27[10],s27[11],s27[12],s27[13],s27[14],s27[15],s27[16],s27[17],s27[18],s27[19],s27[20],s27[21],s27[22],s27[23],s27[24],s27[25],s27[26],s27[27],s27[28],s27[29],s27[30],s27[31],s27[32],s27[33],s27[34],s27[35],s27[36],s27[37],s27[38],s27[39],s27[40],s27[41],s27[42],s27[43],s27[44],s27[45],s27[46],s27[47],s27[48],s27[49],s27[50],s27[51],s26[53],s25[55],pp31[29]};
    assign in30_2 = {pp3[0],s25[0],s26[0],s27[0],s28[0],s28[1],s28[2],s28[3],s28[4],s28[5],s28[6],s28[7],s28[8],s28[9],s28[10],s28[11],s28[12],s28[13],s28[14],s28[15],s28[16],s28[17],s28[18],s28[19],s28[20],s28[21],s28[22],s28[23],s28[24],s28[25],s28[26],s28[27],s28[28],s28[29],s28[30],s28[31],s28[32],s28[33],s28[34],s28[35],s28[36],s28[37],s28[38],s28[39],s28[40],s28[41],s28[42],s28[43],s28[44],s28[45],s28[46],s28[47],s28[48],s28[49],c28,c27,c26,c25};
    CLA_58 KS_30(s30, c30, in30_1, in30_2);


    /*Final Stage 4*/
    wire[61:0] s, in_1, in_2;
    wire c;
    assign in_1 = {pp0[1],pp2[0],s29[1],s29[2],s29[3],s29[4],s29[5],s29[6],s29[7],s29[8],s29[9],s29[10],s29[11],s29[12],s29[13],s29[14],s29[15],s29[16],s29[17],s29[18],s29[19],s29[20],s29[21],s29[22],s29[23],s29[24],s29[25],s29[26],s29[27],s29[28],s29[29],s29[30],s29[31],s29[32],s29[33],s29[34],s29[35],s29[36],s29[37],s29[38],s29[39],s29[40],s29[41],s29[42],s29[43],s29[44],s29[45],s29[46],s29[47],s29[48],s29[49],s29[50],s29[51],s29[52],s29[53],s29[54],s29[55],s29[56],s29[57],s29[58],s29[59],pp31[31]};
    assign in_2 = {pp1[0],s29[0],s30[0],s30[1],s30[2],s30[3],s30[4],s30[5],s30[6],s30[7],s30[8],s30[9],s30[10],s30[11],s30[12],s30[13],s30[14],s30[15],s30[16],s30[17],s30[18],s30[19],s30[20],s30[21],s30[22],s30[23],s30[24],s30[25],s30[26],s30[27],s30[28],s30[29],s30[30],s30[31],s30[32],s30[33],s30[34],s30[35],s30[36],s30[37],s30[38],s30[39],s30[40],s30[41],s30[42],s30[43],s30[44],s30[45],s30[46],s30[47],s30[48],s30[49],s30[50],s30[51],s30[52],s30[53],s30[54],s30[55],s30[56],s30[57],c30,c29};
    kogge_stone_62(s, c, in_1, in_2);

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
    assign product[31] = s[30];
    assign product[32] = s[31];
    assign product[33] = s[32];
    assign product[34] = s[33];
    assign product[35] = s[34];
    assign product[36] = s[35];
    assign product[37] = s[36];
    assign product[38] = s[37];
    assign product[39] = s[38];
    assign product[40] = s[39];
    assign product[41] = s[40];
    assign product[42] = s[41];
    assign product[43] = s[42];
    assign product[44] = s[43];
    assign product[45] = s[44];
    assign product[46] = s[45];
    assign product[47] = s[46];
    assign product[48] = s[47];
    assign product[49] = s[48];
    assign product[50] = s[49];
    assign product[51] = s[50];
    assign product[52] = s[51];
    assign product[53] = s[52];
    assign product[54] = s[53];
    assign product[55] = s[54];
    assign product[56] = s[55];
    assign product[57] = s[56];
    assign product[58] = s[57];
    assign product[59] = s[58];
    assign product[60] = s[59];
    assign product[61] = s[60];
    assign product[62] = s[61];
    assign product[63] = c;
endmodule


module CLA_2(output [1:0] sum, output cout, input [1:0] in1, input [1:0] in2);

    wire[1:0] G;
    wire[1:0] C;
    wire[1:0] P;

    assign G[0] = in1[1] & in2[1];
    assign P[0] = in1[1] ^ in2[1];
    assign G[1] = in1[0] & in2[0];
    assign P[1] = in1[0] ^ in2[0];


    assign C[0] = 0;  /* Carry_out = Ci+1 = Gi + Pi*Ci */;
    assign C[1] = G[0] | (P[0] & C[0]);
    assign cout = G[1] | (P[1] & C[1]);
    assign sum = P ^ C;
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


module CLA_3(output [2:0] sum, output cout, input [2:0] in1, input [2:0] in2);

    wire[2:0] G;
    wire[2:0] C;
    wire[2:0] P;

    assign G[0] = in1[2] & in2[2];
    assign P[0] = in1[2] ^ in2[2];
    assign G[1] = in1[1] & in2[1];
    assign P[1] = in1[1] ^ in2[1];
    assign G[2] = in1[0] & in2[0];
    assign P[2] = in1[0] ^ in2[0];


    assign C[0] = 0;  /* Carry_out = Ci+1 = Gi + Pi*Ci */;
    assign C[1] = G[0] | (P[0] & C[0]);
    assign C[2] = G[1] | (P[1] & C[1]);
    assign cout = G[2] | (P[2] & C[2]);
    assign sum = P ^ C;
endmodule

module CLA_3_c(output [2:0] sum, output cout, input [2:0] in1, input [2:0] in2, input cin);

    wire[2:0] G;
    wire[2:0] C;
    wire[2:0] P;

    assign G[0] = in1[2] & in2[2];
    assign P[0] = in1[2] ^ in2[2];
    assign G[1] = in1[1] & in2[1];
    assign P[1] = in1[1] ^ in2[1];
    assign G[2] = in1[0] & in2[0];
    assign P[2] = in1[0] ^ in2[0];


    assign C[0] = cin;  /* Carry_out = Ci+1 = Gi + Pi*Ci */;
    assign C[1] = G[0] | (P[0] & C[0]);
    assign C[2] = G[1] | (P[1] & C[1]);
    assign cout = G[2] | (P[2] & C[2]);
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


module CLA_62(output [61:0] sum, output cout, input [61:0] in1, input [61:0] in2);

    wire[61:0] G;
    wire[61:0] C;
    wire[61:0] P;

    assign G[0] = in1[61] & in2[61];
    assign P[0] = in1[61] ^ in2[61];
    assign G[1] = in1[60] & in2[60];
    assign P[1] = in1[60] ^ in2[60];
    assign G[2] = in1[59] & in2[59];
    assign P[2] = in1[59] ^ in2[59];
    assign G[3] = in1[58] & in2[58];
    assign P[3] = in1[58] ^ in2[58];
    assign G[4] = in1[57] & in2[57];
    assign P[4] = in1[57] ^ in2[57];
    assign G[5] = in1[56] & in2[56];
    assign P[5] = in1[56] ^ in2[56];
    assign G[6] = in1[55] & in2[55];
    assign P[6] = in1[55] ^ in2[55];
    assign G[7] = in1[54] & in2[54];
    assign P[7] = in1[54] ^ in2[54];
    assign G[8] = in1[53] & in2[53];
    assign P[8] = in1[53] ^ in2[53];
    assign G[9] = in1[52] & in2[52];
    assign P[9] = in1[52] ^ in2[52];
    assign G[10] = in1[51] & in2[51];
    assign P[10] = in1[51] ^ in2[51];
    assign G[11] = in1[50] & in2[50];
    assign P[11] = in1[50] ^ in2[50];
    assign G[12] = in1[49] & in2[49];
    assign P[12] = in1[49] ^ in2[49];
    assign G[13] = in1[48] & in2[48];
    assign P[13] = in1[48] ^ in2[48];
    assign G[14] = in1[47] & in2[47];
    assign P[14] = in1[47] ^ in2[47];
    assign G[15] = in1[46] & in2[46];
    assign P[15] = in1[46] ^ in2[46];
    assign G[16] = in1[45] & in2[45];
    assign P[16] = in1[45] ^ in2[45];
    assign G[17] = in1[44] & in2[44];
    assign P[17] = in1[44] ^ in2[44];
    assign G[18] = in1[43] & in2[43];
    assign P[18] = in1[43] ^ in2[43];
    assign G[19] = in1[42] & in2[42];
    assign P[19] = in1[42] ^ in2[42];
    assign G[20] = in1[41] & in2[41];
    assign P[20] = in1[41] ^ in2[41];
    assign G[21] = in1[40] & in2[40];
    assign P[21] = in1[40] ^ in2[40];
    assign G[22] = in1[39] & in2[39];
    assign P[22] = in1[39] ^ in2[39];
    assign G[23] = in1[38] & in2[38];
    assign P[23] = in1[38] ^ in2[38];
    assign G[24] = in1[37] & in2[37];
    assign P[24] = in1[37] ^ in2[37];
    assign G[25] = in1[36] & in2[36];
    assign P[25] = in1[36] ^ in2[36];
    assign G[26] = in1[35] & in2[35];
    assign P[26] = in1[35] ^ in2[35];
    assign G[27] = in1[34] & in2[34];
    assign P[27] = in1[34] ^ in2[34];
    assign G[28] = in1[33] & in2[33];
    assign P[28] = in1[33] ^ in2[33];
    assign G[29] = in1[32] & in2[32];
    assign P[29] = in1[32] ^ in2[32];
    assign G[30] = in1[31] & in2[31];
    assign P[30] = in1[31] ^ in2[31];
    assign G[31] = in1[30] & in2[30];
    assign P[31] = in1[30] ^ in2[30];
    assign G[32] = in1[29] & in2[29];
    assign P[32] = in1[29] ^ in2[29];
    assign G[33] = in1[28] & in2[28];
    assign P[33] = in1[28] ^ in2[28];
    assign G[34] = in1[27] & in2[27];
    assign P[34] = in1[27] ^ in2[27];
    assign G[35] = in1[26] & in2[26];
    assign P[35] = in1[26] ^ in2[26];
    assign G[36] = in1[25] & in2[25];
    assign P[36] = in1[25] ^ in2[25];
    assign G[37] = in1[24] & in2[24];
    assign P[37] = in1[24] ^ in2[24];
    assign G[38] = in1[23] & in2[23];
    assign P[38] = in1[23] ^ in2[23];
    assign G[39] = in1[22] & in2[22];
    assign P[39] = in1[22] ^ in2[22];
    assign G[40] = in1[21] & in2[21];
    assign P[40] = in1[21] ^ in2[21];
    assign G[41] = in1[20] & in2[20];
    assign P[41] = in1[20] ^ in2[20];
    assign G[42] = in1[19] & in2[19];
    assign P[42] = in1[19] ^ in2[19];
    assign G[43] = in1[18] & in2[18];
    assign P[43] = in1[18] ^ in2[18];
    assign G[44] = in1[17] & in2[17];
    assign P[44] = in1[17] ^ in2[17];
    assign G[45] = in1[16] & in2[16];
    assign P[45] = in1[16] ^ in2[16];
    assign G[46] = in1[15] & in2[15];
    assign P[46] = in1[15] ^ in2[15];
    assign G[47] = in1[14] & in2[14];
    assign P[47] = in1[14] ^ in2[14];
    assign G[48] = in1[13] & in2[13];
    assign P[48] = in1[13] ^ in2[13];
    assign G[49] = in1[12] & in2[12];
    assign P[49] = in1[12] ^ in2[12];
    assign G[50] = in1[11] & in2[11];
    assign P[50] = in1[11] ^ in2[11];
    assign G[51] = in1[10] & in2[10];
    assign P[51] = in1[10] ^ in2[10];
    assign G[52] = in1[9] & in2[9];
    assign P[52] = in1[9] ^ in2[9];
    assign G[53] = in1[8] & in2[8];
    assign P[53] = in1[8] ^ in2[8];
    assign G[54] = in1[7] & in2[7];
    assign P[54] = in1[7] ^ in2[7];
    assign G[55] = in1[6] & in2[6];
    assign P[55] = in1[6] ^ in2[6];
    assign G[56] = in1[5] & in2[5];
    assign P[56] = in1[5] ^ in2[5];
    assign G[57] = in1[4] & in2[4];
    assign P[57] = in1[4] ^ in2[4];
    assign G[58] = in1[3] & in2[3];
    assign P[58] = in1[3] ^ in2[3];
    assign G[59] = in1[2] & in2[2];
    assign P[59] = in1[2] ^ in2[2];
    assign G[60] = in1[1] & in2[1];
    assign P[60] = in1[1] ^ in2[1];
    assign G[61] = in1[0] & in2[0];
    assign P[61] = in1[0] ^ in2[0];


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
    assign C[30] = G[29] | (P[29] & C[29]);
    assign C[31] = G[30] | (P[30] & C[30]);
    assign C[32] = G[31] | (P[31] & C[31]);
    assign C[33] = G[32] | (P[32] & C[32]);
    assign C[34] = G[33] | (P[33] & C[33]);
    assign C[35] = G[34] | (P[34] & C[34]);
    assign C[36] = G[35] | (P[35] & C[35]);
    assign C[37] = G[36] | (P[36] & C[36]);
    assign C[38] = G[37] | (P[37] & C[37]);
    assign C[39] = G[38] | (P[38] & C[38]);
    assign C[40] = G[39] | (P[39] & C[39]);
    assign C[41] = G[40] | (P[40] & C[40]);
    assign C[42] = G[41] | (P[41] & C[41]);
    assign C[43] = G[42] | (P[42] & C[42]);
    assign C[44] = G[43] | (P[43] & C[43]);
    assign C[45] = G[44] | (P[44] & C[44]);
    assign C[46] = G[45] | (P[45] & C[45]);
    assign C[47] = G[46] | (P[46] & C[46]);
    assign C[48] = G[47] | (P[47] & C[47]);
    assign C[49] = G[48] | (P[48] & C[48]);
    assign C[50] = G[49] | (P[49] & C[49]);
    assign C[51] = G[50] | (P[50] & C[50]);
    assign C[52] = G[51] | (P[51] & C[51]);
    assign C[53] = G[52] | (P[52] & C[52]);
    assign C[54] = G[53] | (P[53] & C[53]);
    assign C[55] = G[54] | (P[54] & C[54]);
    assign C[56] = G[55] | (P[55] & C[55]);
    assign C[57] = G[56] | (P[56] & C[56]);
    assign C[58] = G[57] | (P[57] & C[57]);
    assign C[59] = G[58] | (P[58] & C[58]);
    assign C[60] = G[59] | (P[59] & C[59]);
    assign C[61] = G[60] | (P[60] & C[60]);
    assign cout = G[61] | (P[61] & C[61]);
    assign sum = P ^ C;
endmodule

module gray_cell(Gk_j, Pi_k, Gi_k, G);
    input Gk_j, Pi_k, Gi_k;
    output G;
    wire Y;
    and(Y, Gk_j, Pi_k);
    or(G, Y, Gi_k);
endmodule

module black_cell(Gk_j, Pi_k, Gi_k, Pk_j, G, P);
    input Gk_j, Pi_k, Gi_k, Pk_j;
    output G, P;
    wire Y;
    and(Y, Gk_j, Pi_k);
    or(G, Gi_k, Y);
    and(P, Pk_j, Pi_k);
endmodule
