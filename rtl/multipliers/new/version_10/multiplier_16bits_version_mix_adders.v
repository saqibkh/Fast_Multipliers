module multiplier_16bits_version10(product, A, B);


    /* 
     * Area: 8222.135777
     * Power: 4.3449mW
     * Timing: 1.50ns
     */
    output [31:0] product;
    input [15:0] A, B;

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
    wire[15:0] s1, in1_1, in1_2;
    wire c1;
    assign in1_1 = {pp0[8],pp0[9],pp0[10],pp0[11],pp0[12],pp0[13],pp0[14],pp0[15],pp1[15],pp2[15],pp3[15],pp4[15],pp5[15],pp6[15],pp7[15],pp8[15]};
    assign in1_2 = {pp1[7],pp1[8],pp1[9],pp1[10],pp1[11],pp1[12],pp1[13],pp1[14],pp2[14],pp3[14],pp4[14],pp5[14],pp6[14],pp7[14],pp8[14],pp9[14]};
    kogge_stone_16 KS_1(s1, c1, in1_1, in1_2);
    wire[13:0] s2, in2_1, in2_2;
    wire c2;
    assign in2_1 = {pp2[7],pp2[8],pp2[9],pp2[10],pp2[11],pp2[12],pp2[13],pp3[13],pp4[13],pp5[13],pp6[13],pp7[13],pp8[13],pp9[13]};
    assign in2_2 = {pp3[6],pp3[7],pp3[8],pp3[9],pp3[10],pp3[11],pp3[12],pp4[12],pp5[12],pp6[12],pp7[12],pp8[12],pp9[12],pp10[12]};
    kogge_stone_14 KS_2(s2, c2, in2_1, in2_2);
    wire[11:0] s3, in3_1, in3_2;
    wire c3;
    assign in3_1 = {pp4[6],pp4[7],pp4[8],pp4[9],pp4[10],pp4[11],pp5[11],pp6[11],pp7[11],pp8[11],pp9[11],pp10[11]};
    assign in3_2 = {pp5[5],pp5[6],pp5[7],pp5[8],pp5[9],pp5[10],pp6[10],pp7[10],pp8[10],pp9[10],pp10[10],pp11[10]};
    kogge_stone_12 KS_3(s3, c3, in3_1, in3_2);
    wire[9:0] s4, in4_1, in4_2;
    wire c4;
    assign in4_1 = {pp6[5],pp6[6],pp6[7],pp6[8],pp6[9],pp7[9],pp8[9],pp9[9],pp10[9],pp11[9]};
    assign in4_2 = {pp7[4],pp7[5],pp7[6],pp7[7],pp7[8],pp8[8],pp9[8],pp10[8],pp11[8],pp12[8]};
    kogge_stone_10 KS_4(s4, c4, in4_1, in4_2);
    wire[7:0] s5, in5_1, in5_2;
    wire c5;
    assign in5_1 = {pp8[4],pp8[5],pp8[6],pp8[7],pp9[7],pp10[7],pp11[7],pp12[7]};
    assign in5_2 = {pp9[3],pp9[4],pp9[5],pp9[6],pp10[6],pp11[6],pp12[6],pp13[6]};
    kogge_stone_8 KS_5(s5, c5, in5_1, in5_2);
    wire[5:0] s6, in6_1, in6_2;
    wire c6;
    assign in6_1 = {pp10[3],pp10[4],pp10[5],pp11[5],pp12[5],pp13[5]};
    assign in6_2 = {pp11[2],pp11[3],pp11[4],pp12[4],pp13[4],pp14[4]};
    kogge_stone_6 KS_6(s6, c6, in6_1, in6_2);
    wire[3:0] s7, in7_1, in7_2;
    wire c7;
    assign in7_1 = {pp12[2],pp12[3],pp13[3],pp14[3]};
    assign in7_2 = {pp13[1],pp13[2],pp14[2],pp15[2]};
    kogge_stone_4 KS_7(s7, c7, in7_1, in7_2);
    wire[1:0] s8, in8_1, in8_2;
    wire c8;
    assign in8_1 = {pp14[1],pp15[1]};
    assign in8_2 = {pp15[0],1'b0};
    kogge_stone_2 KS_8(s8, c8, in8_1, in8_2);

    /*Stage 2*/
    wire[23:0] s9, in9_1, in9_2;
    wire c9;
    assign in9_1 = {pp0[4],pp0[5],pp0[6],pp0[7],pp2[6],pp4[5],pp6[4],pp8[3],pp10[2],pp12[1],pp14[0],s1[7],s1[8],s1[9],pp15[3],pp14[5],pp13[7],pp12[9],pp11[11],pp10[13],pp9[15],pp10[15],pp11[15],pp12[15]};
    assign in9_2 = {pp1[3],pp1[4],pp1[5],pp1[6],pp3[5],pp5[4],pp7[3],pp9[2],pp11[1],pp13[0],s1[6],s2[6],s2[7],s2[8],s1[10],pp15[4],pp14[6],pp13[8],pp12[10],pp11[12],pp10[14],pp11[14],pp12[14],pp13[14]};
    CLA_24 KS_9(s9, c9, in9_1, in9_2);
    wire[21:0] s10, in10_1, in10_2;
    wire c10;
    assign in10_1 = {pp2[3],pp2[4],pp2[5],pp4[4],pp6[3],pp8[2],pp10[1],pp12[0],s1[5],s2[5],s3[5],s3[6],s3[7],s2[9],s1[11],pp15[5],pp14[7],pp13[9],pp12[11],pp11[13],pp12[13],pp13[13]};
    assign in10_2 = {pp3[2],pp3[3],pp3[4],pp5[3],pp7[2],pp9[1],pp11[0],s1[4],s2[4],s3[4],s4[4],s4[5],s4[6],s3[8],s2[10],s1[12],pp15[6],pp14[8],pp13[10],pp12[12],pp13[12],pp14[12]};
    CLA_22 KS_10(s10, c10, in10_1, in10_2);
    wire[19:0] s11, in11_1, in11_2;
    wire c11;
    assign in11_1 = {pp4[2],pp4[3],pp6[2],pp8[1],pp10[0],s1[3],s2[3],s3[3],s4[3],s5[3],s5[4],s5[5],s4[7],s3[9],s2[11],s1[13],pp15[7],pp14[9],pp13[11],pp14[11]};
    assign in11_2 = {pp5[1],pp5[2],pp7[1],pp9[0],s1[2],s2[2],s3[2],s4[2],s5[2],s6[2],s6[3],s6[4],s5[6],s4[8],s3[10],s2[12],s1[14],pp15[8],pp14[10],pp15[10]};
    CLA_20 KS_11(s11, c11, in11_1, in11_2);
    wire[17:0] s12, in12_1, in12_2;
    wire c12;
    assign in12_1 = {pp6[1],pp8[0],s1[1],s2[1],s3[1],s4[1],s5[1],s6[1],s7[1],s7[2],s7[3],s6[5],s5[7],s4[9],s3[11],s2[13],s1[15],pp15[9]};
    assign in12_2 = {pp7[0],s1[0],s2[0],s3[0],s4[0],s5[0],s6[0],s7[0],s8[0],s8[1],c8,c7,c6,c5,c4,c3,c2,c1};
    CLA_18 KS_12(s12, c12, in12_1, in12_2);

    /*Stage 3*/
    wire[27:0] s13, in13_1, in13_2;
    wire c13;
    assign in13_1 = {pp0[2],pp0[3],pp2[2],pp4[1],pp6[0],s9[3],s9[4],s9[5],s9[6],s9[7],s9[8],s9[9],s9[10],s9[11],s9[12],s9[13],s9[14],s9[15],s9[16],s9[17],s9[18],s9[19],s9[20],s9[21],pp15[11],pp14[13],pp13[15],pp14[15]};
    assign in13_2 = {pp1[1],pp1[2],pp3[1],pp5[0],s9[2],s10[2],s10[3],s10[4],s10[5],s10[6],s10[7],s10[8],s10[9],s10[10],s10[11],s10[12],s10[13],s10[14],s10[15],s10[16],s10[17],s10[18],s10[19],s10[20],s9[22],pp15[12],pp14[14],pp15[14]};
    CLA_28 KS_13(s13, c13, in13_1, in13_2);
    wire[25:0] s14, in14_1, in14_2;
    wire c14;
    assign in14_1 = {pp2[1],pp4[0],s9[1],s10[1],s11[1],s11[2],s11[3],s11[4],s11[5],s11[6],s11[7],s11[8],s11[9],s11[10],s11[11],s11[12],s11[13],s11[14],s11[15],s11[16],s11[17],s11[18],s11[19],s10[21],s9[23],pp15[13]};
    assign in14_2 = {pp3[0],s9[0],s10[0],s11[0],s12[0],s12[1],s12[2],s12[3],s12[4],s12[5],s12[6],s12[7],s12[8],s12[9],s12[10],s12[11],s12[12],s12[13],s12[14],s12[15],s12[16],s12[17],c12,c11,c10,c9};
    CLA_26 KS_14(s14, c14, in14_1, in14_2);


    /*Final Stage 3*/
    wire[29:0] s, in_1, in_2;
    wire c;
    assign in_1 = {pp0[1],pp2[0],s13[1],s13[2],s13[3],s13[4],s13[5],s13[6],s13[7],s13[8],s13[9],s13[10],s13[11],s13[12],s13[13],s13[14],s13[15],s13[16],s13[17],s13[18],s13[19],s13[20],s13[21],s13[22],s13[23],s13[24],s13[25],s13[26],s13[27],pp15[15]};
    assign in_2 = {pp1[0],s13[0],s14[0],s14[1],s14[2],s14[3],s14[4],s14[5],s14[6],s14[7],s14[8],s14[9],s14[10],s14[11],s14[12],s14[13],s14[14],s14[15],s14[16],s14[17],s14[18],s14[19],s14[20],s14[21],s14[22],s14[23],s14[24],s14[25],c14,c13};
    CLA_30(s, c, in_1, in_2);

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

module kogge_stone_32(output [31:0] sum,
        output cout,
        input [31:0] in1,
        input [31:0] in2);

    assign cin = 0;
    wire[31:0] G_0;
    wire[31:0] P_0;
    wire[31:0] G_1;
    wire[31:0] P_1;
    wire[31:0] G_2;
    wire[31:0] P_2;
    wire[31:0] G_3;
    wire[31:0] P_3;
    wire[31:0] G_4;
    wire[31:0] P_4;
    wire[31:0] G_5;
    wire[31:0] P_5;
    wire[31:0] G_6;
    wire[31:0] P_6;

    assign G_0[0] = in1[31] & in2[31];
    assign P_0[0] = in1[31] ^ in2[31];
    assign G_0[1] = in1[30] & in2[30];
    assign P_0[1] = in1[30] ^ in2[30];
    assign G_0[2] = in1[29] & in2[29];
    assign P_0[2] = in1[29] ^ in2[29];
    assign G_0[3] = in1[28] & in2[28];
    assign P_0[3] = in1[28] ^ in2[28];
    assign G_0[4] = in1[27] & in2[27];
    assign P_0[4] = in1[27] ^ in2[27];
    assign G_0[5] = in1[26] & in2[26];
    assign P_0[5] = in1[26] ^ in2[26];
    assign G_0[6] = in1[25] & in2[25];
    assign P_0[6] = in1[25] ^ in2[25];
    assign G_0[7] = in1[24] & in2[24];
    assign P_0[7] = in1[24] ^ in2[24];
    assign G_0[8] = in1[23] & in2[23];
    assign P_0[8] = in1[23] ^ in2[23];
    assign G_0[9] = in1[22] & in2[22];
    assign P_0[9] = in1[22] ^ in2[22];
    assign G_0[10] = in1[21] & in2[21];
    assign P_0[10] = in1[21] ^ in2[21];
    assign G_0[11] = in1[20] & in2[20];
    assign P_0[11] = in1[20] ^ in2[20];
    assign G_0[12] = in1[19] & in2[19];
    assign P_0[12] = in1[19] ^ in2[19];
    assign G_0[13] = in1[18] & in2[18];
    assign P_0[13] = in1[18] ^ in2[18];
    assign G_0[14] = in1[17] & in2[17];
    assign P_0[14] = in1[17] ^ in2[17];
    assign G_0[15] = in1[16] & in2[16];
    assign P_0[15] = in1[16] ^ in2[16];
    assign G_0[16] = in1[15] & in2[15];
    assign P_0[16] = in1[15] ^ in2[15];
    assign G_0[17] = in1[14] & in2[14];
    assign P_0[17] = in1[14] ^ in2[14];
    assign G_0[18] = in1[13] & in2[13];
    assign P_0[18] = in1[13] ^ in2[13];
    assign G_0[19] = in1[12] & in2[12];
    assign P_0[19] = in1[12] ^ in2[12];
    assign G_0[20] = in1[11] & in2[11];
    assign P_0[20] = in1[11] ^ in2[11];
    assign G_0[21] = in1[10] & in2[10];
    assign P_0[21] = in1[10] ^ in2[10];
    assign G_0[22] = in1[9] & in2[9];
    assign P_0[22] = in1[9] ^ in2[9];
    assign G_0[23] = in1[8] & in2[8];
    assign P_0[23] = in1[8] ^ in2[8];
    assign G_0[24] = in1[7] & in2[7];
    assign P_0[24] = in1[7] ^ in2[7];
    assign G_0[25] = in1[6] & in2[6];
    assign P_0[25] = in1[6] ^ in2[6];
    assign G_0[26] = in1[5] & in2[5];
    assign P_0[26] = in1[5] ^ in2[5];
    assign G_0[27] = in1[4] & in2[4];
    assign P_0[27] = in1[4] ^ in2[4];
    assign G_0[28] = in1[3] & in2[3];
    assign P_0[28] = in1[3] ^ in2[3];
    assign G_0[29] = in1[2] & in2[2];
    assign P_0[29] = in1[2] ^ in2[2];
    assign G_0[30] = in1[1] & in2[1];
    assign P_0[30] = in1[1] ^ in2[1];
    assign G_0[31] = in1[0] & in2[0];
    assign P_0[31] = in1[0] ^ in2[0];



    /*Stage 1*/
    gray_cell level_1_0(cin, P_0[0], G_0[0], G_1[0]);
    black_cell level_0_1(G_0[0], P_0[1], G_0[1], P_0[0], G_1[1], P_1[1]);
    black_cell level_0_2(G_0[1], P_0[2], G_0[2], P_0[1], G_1[2], P_1[2]);
    black_cell level_0_3(G_0[2], P_0[3], G_0[3], P_0[2], G_1[3], P_1[3]);
    black_cell level_0_4(G_0[3], P_0[4], G_0[4], P_0[3], G_1[4], P_1[4]);
    black_cell level_0_5(G_0[4], P_0[5], G_0[5], P_0[4], G_1[5], P_1[5]);
    black_cell level_0_6(G_0[5], P_0[6], G_0[6], P_0[5], G_1[6], P_1[6]);
    black_cell level_0_7(G_0[6], P_0[7], G_0[7], P_0[6], G_1[7], P_1[7]);
    black_cell level_0_8(G_0[7], P_0[8], G_0[8], P_0[7], G_1[8], P_1[8]);
    black_cell level_0_9(G_0[8], P_0[9], G_0[9], P_0[8], G_1[9], P_1[9]);
    black_cell level_0_10(G_0[9], P_0[10], G_0[10], P_0[9], G_1[10], P_1[10]);
    black_cell level_0_11(G_0[10], P_0[11], G_0[11], P_0[10], G_1[11], P_1[11]);
    black_cell level_0_12(G_0[11], P_0[12], G_0[12], P_0[11], G_1[12], P_1[12]);
    black_cell level_0_13(G_0[12], P_0[13], G_0[13], P_0[12], G_1[13], P_1[13]);
    black_cell level_0_14(G_0[13], P_0[14], G_0[14], P_0[13], G_1[14], P_1[14]);
    black_cell level_0_15(G_0[14], P_0[15], G_0[15], P_0[14], G_1[15], P_1[15]);
    black_cell level_0_16(G_0[15], P_0[16], G_0[16], P_0[15], G_1[16], P_1[16]);
    black_cell level_0_17(G_0[16], P_0[17], G_0[17], P_0[16], G_1[17], P_1[17]);
    black_cell level_0_18(G_0[17], P_0[18], G_0[18], P_0[17], G_1[18], P_1[18]);
    black_cell level_0_19(G_0[18], P_0[19], G_0[19], P_0[18], G_1[19], P_1[19]);
    black_cell level_0_20(G_0[19], P_0[20], G_0[20], P_0[19], G_1[20], P_1[20]);
    black_cell level_0_21(G_0[20], P_0[21], G_0[21], P_0[20], G_1[21], P_1[21]);
    black_cell level_0_22(G_0[21], P_0[22], G_0[22], P_0[21], G_1[22], P_1[22]);
    black_cell level_0_23(G_0[22], P_0[23], G_0[23], P_0[22], G_1[23], P_1[23]);
    black_cell level_0_24(G_0[23], P_0[24], G_0[24], P_0[23], G_1[24], P_1[24]);
    black_cell level_0_25(G_0[24], P_0[25], G_0[25], P_0[24], G_1[25], P_1[25]);
    black_cell level_0_26(G_0[25], P_0[26], G_0[26], P_0[25], G_1[26], P_1[26]);
    black_cell level_0_27(G_0[26], P_0[27], G_0[27], P_0[26], G_1[27], P_1[27]);
    black_cell level_0_28(G_0[27], P_0[28], G_0[28], P_0[27], G_1[28], P_1[28]);
    black_cell level_0_29(G_0[28], P_0[29], G_0[29], P_0[28], G_1[29], P_1[29]);
    black_cell level_0_30(G_0[29], P_0[30], G_0[30], P_0[29], G_1[30], P_1[30]);
    black_cell level_0_31(G_0[30], P_0[31], G_0[31], P_0[30], G_1[31], P_1[31]);

    /*Stage 2*/
    gray_cell level_2_1(cin, P_1[1], G_1[1], G_2[1]);
    gray_cell level_2_2(G_1[0], P_1[2], G_1[2], G_2[2]);
    black_cell level_1_3(G_1[1], P_1[3], G_1[3], P_1[1], G_2[3], P_2[3]);
    black_cell level_1_4(G_1[2], P_1[4], G_1[4], P_1[2], G_2[4], P_2[4]);
    black_cell level_1_5(G_1[3], P_1[5], G_1[5], P_1[3], G_2[5], P_2[5]);
    black_cell level_1_6(G_1[4], P_1[6], G_1[6], P_1[4], G_2[6], P_2[6]);
    black_cell level_1_7(G_1[5], P_1[7], G_1[7], P_1[5], G_2[7], P_2[7]);
    black_cell level_1_8(G_1[6], P_1[8], G_1[8], P_1[6], G_2[8], P_2[8]);
    black_cell level_1_9(G_1[7], P_1[9], G_1[9], P_1[7], G_2[9], P_2[9]);
    black_cell level_1_10(G_1[8], P_1[10], G_1[10], P_1[8], G_2[10], P_2[10]);
    black_cell level_1_11(G_1[9], P_1[11], G_1[11], P_1[9], G_2[11], P_2[11]);
    black_cell level_1_12(G_1[10], P_1[12], G_1[12], P_1[10], G_2[12], P_2[12]);
    black_cell level_1_13(G_1[11], P_1[13], G_1[13], P_1[11], G_2[13], P_2[13]);
    black_cell level_1_14(G_1[12], P_1[14], G_1[14], P_1[12], G_2[14], P_2[14]);
    black_cell level_1_15(G_1[13], P_1[15], G_1[15], P_1[13], G_2[15], P_2[15]);
    black_cell level_1_16(G_1[14], P_1[16], G_1[16], P_1[14], G_2[16], P_2[16]);
    black_cell level_1_17(G_1[15], P_1[17], G_1[17], P_1[15], G_2[17], P_2[17]);
    black_cell level_1_18(G_1[16], P_1[18], G_1[18], P_1[16], G_2[18], P_2[18]);
    black_cell level_1_19(G_1[17], P_1[19], G_1[19], P_1[17], G_2[19], P_2[19]);
    black_cell level_1_20(G_1[18], P_1[20], G_1[20], P_1[18], G_2[20], P_2[20]);
    black_cell level_1_21(G_1[19], P_1[21], G_1[21], P_1[19], G_2[21], P_2[21]);
    black_cell level_1_22(G_1[20], P_1[22], G_1[22], P_1[20], G_2[22], P_2[22]);
    black_cell level_1_23(G_1[21], P_1[23], G_1[23], P_1[21], G_2[23], P_2[23]);
    black_cell level_1_24(G_1[22], P_1[24], G_1[24], P_1[22], G_2[24], P_2[24]);
    black_cell level_1_25(G_1[23], P_1[25], G_1[25], P_1[23], G_2[25], P_2[25]);
    black_cell level_1_26(G_1[24], P_1[26], G_1[26], P_1[24], G_2[26], P_2[26]);
    black_cell level_1_27(G_1[25], P_1[27], G_1[27], P_1[25], G_2[27], P_2[27]);
    black_cell level_1_28(G_1[26], P_1[28], G_1[28], P_1[26], G_2[28], P_2[28]);
    black_cell level_1_29(G_1[27], P_1[29], G_1[29], P_1[27], G_2[29], P_2[29]);
    black_cell level_1_30(G_1[28], P_1[30], G_1[30], P_1[28], G_2[30], P_2[30]);
    black_cell level_1_31(G_1[29], P_1[31], G_1[31], P_1[29], G_2[31], P_2[31]);

    /*Stage 3*/
    gray_cell level_3_3(cin, P_2[3], G_2[3], G_3[3]);
    gray_cell level_3_4(G_1[0], P_2[4], G_2[4], G_3[4]);
    gray_cell level_3_5(G_2[1], P_2[5], G_2[5], G_3[5]);
    gray_cell level_3_6(G_2[2], P_2[6], G_2[6], G_3[6]);
    black_cell level_2_7(G_2[3], P_2[7], G_2[7], P_2[3], G_3[7], P_3[7]);
    black_cell level_2_8(G_2[4], P_2[8], G_2[8], P_2[4], G_3[8], P_3[8]);
    black_cell level_2_9(G_2[5], P_2[9], G_2[9], P_2[5], G_3[9], P_3[9]);
    black_cell level_2_10(G_2[6], P_2[10], G_2[10], P_2[6], G_3[10], P_3[10]);
    black_cell level_2_11(G_2[7], P_2[11], G_2[11], P_2[7], G_3[11], P_3[11]);
    black_cell level_2_12(G_2[8], P_2[12], G_2[12], P_2[8], G_3[12], P_3[12]);
    black_cell level_2_13(G_2[9], P_2[13], G_2[13], P_2[9], G_3[13], P_3[13]);
    black_cell level_2_14(G_2[10], P_2[14], G_2[14], P_2[10], G_3[14], P_3[14]);
    black_cell level_2_15(G_2[11], P_2[15], G_2[15], P_2[11], G_3[15], P_3[15]);
    black_cell level_2_16(G_2[12], P_2[16], G_2[16], P_2[12], G_3[16], P_3[16]);
    black_cell level_2_17(G_2[13], P_2[17], G_2[17], P_2[13], G_3[17], P_3[17]);
    black_cell level_2_18(G_2[14], P_2[18], G_2[18], P_2[14], G_3[18], P_3[18]);
    black_cell level_2_19(G_2[15], P_2[19], G_2[19], P_2[15], G_3[19], P_3[19]);
    black_cell level_2_20(G_2[16], P_2[20], G_2[20], P_2[16], G_3[20], P_3[20]);
    black_cell level_2_21(G_2[17], P_2[21], G_2[21], P_2[17], G_3[21], P_3[21]);
    black_cell level_2_22(G_2[18], P_2[22], G_2[22], P_2[18], G_3[22], P_3[22]);
    black_cell level_2_23(G_2[19], P_2[23], G_2[23], P_2[19], G_3[23], P_3[23]);
    black_cell level_2_24(G_2[20], P_2[24], G_2[24], P_2[20], G_3[24], P_3[24]);
    black_cell level_2_25(G_2[21], P_2[25], G_2[25], P_2[21], G_3[25], P_3[25]);
    black_cell level_2_26(G_2[22], P_2[26], G_2[26], P_2[22], G_3[26], P_3[26]);
    black_cell level_2_27(G_2[23], P_2[27], G_2[27], P_2[23], G_3[27], P_3[27]);
    black_cell level_2_28(G_2[24], P_2[28], G_2[28], P_2[24], G_3[28], P_3[28]);
    black_cell level_2_29(G_2[25], P_2[29], G_2[29], P_2[25], G_3[29], P_3[29]);
    black_cell level_2_30(G_2[26], P_2[30], G_2[30], P_2[26], G_3[30], P_3[30]);
    black_cell level_2_31(G_2[27], P_2[31], G_2[31], P_2[27], G_3[31], P_3[31]);

    /*Stage 4*/
    gray_cell level_4_7(cin, P_3[7], G_3[7], G_4[7]);
    gray_cell level_4_8(G_1[0], P_3[8], G_3[8], G_4[8]);
    gray_cell level_4_9(G_2[1], P_3[9], G_3[9], G_4[9]);
    gray_cell level_4_10(G_2[2], P_3[10], G_3[10], G_4[10]);
    gray_cell level_4_11(G_3[3], P_3[11], G_3[11], G_4[11]);
    gray_cell level_4_12(G_3[4], P_3[12], G_3[12], G_4[12]);
    gray_cell level_4_13(G_3[5], P_3[13], G_3[13], G_4[13]);
    gray_cell level_4_14(G_3[6], P_3[14], G_3[14], G_4[14]);
    black_cell level_3_15(G_3[7], P_3[15], G_3[15], P_3[7], G_4[15], P_4[15]);
    black_cell level_3_16(G_3[8], P_3[16], G_3[16], P_3[8], G_4[16], P_4[16]);
    black_cell level_3_17(G_3[9], P_3[17], G_3[17], P_3[9], G_4[17], P_4[17]);
    black_cell level_3_18(G_3[10], P_3[18], G_3[18], P_3[10], G_4[18], P_4[18]);
    black_cell level_3_19(G_3[11], P_3[19], G_3[19], P_3[11], G_4[19], P_4[19]);
    black_cell level_3_20(G_3[12], P_3[20], G_3[20], P_3[12], G_4[20], P_4[20]);
    black_cell level_3_21(G_3[13], P_3[21], G_3[21], P_3[13], G_4[21], P_4[21]);
    black_cell level_3_22(G_3[14], P_3[22], G_3[22], P_3[14], G_4[22], P_4[22]);
    black_cell level_3_23(G_3[15], P_3[23], G_3[23], P_3[15], G_4[23], P_4[23]);
    black_cell level_3_24(G_3[16], P_3[24], G_3[24], P_3[16], G_4[24], P_4[24]);
    black_cell level_3_25(G_3[17], P_3[25], G_3[25], P_3[17], G_4[25], P_4[25]);
    black_cell level_3_26(G_3[18], P_3[26], G_3[26], P_3[18], G_4[26], P_4[26]);
    black_cell level_3_27(G_3[19], P_3[27], G_3[27], P_3[19], G_4[27], P_4[27]);
    black_cell level_3_28(G_3[20], P_3[28], G_3[28], P_3[20], G_4[28], P_4[28]);
    black_cell level_3_29(G_3[21], P_3[29], G_3[29], P_3[21], G_4[29], P_4[29]);
    black_cell level_3_30(G_3[22], P_3[30], G_3[30], P_3[22], G_4[30], P_4[30]);
    black_cell level_3_31(G_3[23], P_3[31], G_3[31], P_3[23], G_4[31], P_4[31]);

    /*Stage 5*/
    gray_cell level_5_15(cin, P_4[15], G_4[15], G_5[15]);
    gray_cell level_5_16(G_1[0], P_4[16], G_4[16], G_5[16]);
    gray_cell level_5_17(G_2[1], P_4[17], G_4[17], G_5[17]);
    gray_cell level_5_18(G_2[2], P_4[18], G_4[18], G_5[18]);
    gray_cell level_5_19(G_3[3], P_4[19], G_4[19], G_5[19]);
    gray_cell level_5_20(G_3[4], P_4[20], G_4[20], G_5[20]);
    gray_cell level_5_21(G_3[5], P_4[21], G_4[21], G_5[21]);
    gray_cell level_5_22(G_3[6], P_4[22], G_4[22], G_5[22]);
    gray_cell level_5_23(G_4[7], P_4[23], G_4[23], G_5[23]);
    gray_cell level_5_24(G_4[8], P_4[24], G_4[24], G_5[24]);
    gray_cell level_5_25(G_4[9], P_4[25], G_4[25], G_5[25]);
    gray_cell level_5_26(G_4[10], P_4[26], G_4[26], G_5[26]);
    gray_cell level_5_27(G_4[11], P_4[27], G_4[27], G_5[27]);
    gray_cell level_5_28(G_4[12], P_4[28], G_4[28], G_5[28]);
    gray_cell level_5_29(G_4[13], P_4[29], G_4[29], G_5[29]);
    gray_cell level_5_30(G_4[14], P_4[30], G_4[30], G_5[30]);
    black_cell level_4_31(G_4[15], P_4[31], G_4[31], P_4[15], G_5[31], P_5[31]);

    /*Stage 6*/
    gray_cell level_6_31(cin, P_5[31], G_5[31], cout);

    assign sum[0] = cin    ^ P_0[0];
    assign sum[1] = G_1[0] ^ P_0[1];
    assign sum[2] = G_2[1] ^ P_0[2];
    assign sum[3] = G_2[2] ^ P_0[3];
    assign sum[4] = G_3[3] ^ P_0[4];
    assign sum[5] = G_3[4] ^ P_0[5];
    assign sum[6] = G_3[5] ^ P_0[6];
    assign sum[7] = G_3[6] ^ P_0[7];
    assign sum[8] = G_4[7] ^ P_0[8];
    assign sum[9] = G_4[8] ^ P_0[9];
    assign sum[10] = G_4[9] ^ P_0[10];
    assign sum[11] = G_4[10] ^ P_0[11];
    assign sum[12] = G_4[11] ^ P_0[12];
    assign sum[13] = G_4[12] ^ P_0[13];
    assign sum[14] = G_4[13] ^ P_0[14];
    assign sum[15] = G_4[14] ^ P_0[15];
    assign sum[16] = G_5[15] ^ P_0[16];
    assign sum[17] = G_5[16] ^ P_0[17];
    assign sum[18] = G_5[17] ^ P_0[18];
    assign sum[19] = G_5[18] ^ P_0[19];
    assign sum[20] = G_5[19] ^ P_0[20];
    assign sum[21] = G_5[20] ^ P_0[21];
    assign sum[22] = G_5[21] ^ P_0[22];
    assign sum[23] = G_5[22] ^ P_0[23];
    assign sum[24] = G_5[23] ^ P_0[24];
    assign sum[25] = G_5[24] ^ P_0[25];
    assign sum[26] = G_5[25] ^ P_0[26];
    assign sum[27] = G_5[26] ^ P_0[27];
    assign sum[28] = G_5[27] ^ P_0[28];
    assign sum[29] = G_5[28] ^ P_0[29];
    assign sum[30] = G_5[29] ^ P_0[30];
    assign sum[31] = G_5[30] ^ P_0[31];
endmodule

module kogge_stone_31(output [30:0] sum,
        output cout,
        input [30:0] in1,
        input [30:0] in2);

    assign cin = 0;
    wire[30:0] G_0;
    wire[30:0] P_0;
    wire[30:0] G_1;
    wire[30:0] P_1;
    wire[30:0] G_2;
    wire[30:0] P_2;
    wire[30:0] G_3;
    wire[30:0] P_3;
    wire[30:0] G_4;
    wire[30:0] P_4;
    wire[30:0] G_5;
    wire[30:0] P_5;

    assign G_0[0] = in1[30] & in2[30];
    assign P_0[0] = in1[30] ^ in2[30];
    assign G_0[1] = in1[29] & in2[29];
    assign P_0[1] = in1[29] ^ in2[29];
    assign G_0[2] = in1[28] & in2[28];
    assign P_0[2] = in1[28] ^ in2[28];
    assign G_0[3] = in1[27] & in2[27];
    assign P_0[3] = in1[27] ^ in2[27];
    assign G_0[4] = in1[26] & in2[26];
    assign P_0[4] = in1[26] ^ in2[26];
    assign G_0[5] = in1[25] & in2[25];
    assign P_0[5] = in1[25] ^ in2[25];
    assign G_0[6] = in1[24] & in2[24];
    assign P_0[6] = in1[24] ^ in2[24];
    assign G_0[7] = in1[23] & in2[23];
    assign P_0[7] = in1[23] ^ in2[23];
    assign G_0[8] = in1[22] & in2[22];
    assign P_0[8] = in1[22] ^ in2[22];
    assign G_0[9] = in1[21] & in2[21];
    assign P_0[9] = in1[21] ^ in2[21];
    assign G_0[10] = in1[20] & in2[20];
    assign P_0[10] = in1[20] ^ in2[20];
    assign G_0[11] = in1[19] & in2[19];
    assign P_0[11] = in1[19] ^ in2[19];
    assign G_0[12] = in1[18] & in2[18];
    assign P_0[12] = in1[18] ^ in2[18];
    assign G_0[13] = in1[17] & in2[17];
    assign P_0[13] = in1[17] ^ in2[17];
    assign G_0[14] = in1[16] & in2[16];
    assign P_0[14] = in1[16] ^ in2[16];
    assign G_0[15] = in1[15] & in2[15];
    assign P_0[15] = in1[15] ^ in2[15];
    assign G_0[16] = in1[14] & in2[14];
    assign P_0[16] = in1[14] ^ in2[14];
    assign G_0[17] = in1[13] & in2[13];
    assign P_0[17] = in1[13] ^ in2[13];
    assign G_0[18] = in1[12] & in2[12];
    assign P_0[18] = in1[12] ^ in2[12];
    assign G_0[19] = in1[11] & in2[11];
    assign P_0[19] = in1[11] ^ in2[11];
    assign G_0[20] = in1[10] & in2[10];
    assign P_0[20] = in1[10] ^ in2[10];
    assign G_0[21] = in1[9] & in2[9];
    assign P_0[21] = in1[9] ^ in2[9];
    assign G_0[22] = in1[8] & in2[8];
    assign P_0[22] = in1[8] ^ in2[8];
    assign G_0[23] = in1[7] & in2[7];
    assign P_0[23] = in1[7] ^ in2[7];
    assign G_0[24] = in1[6] & in2[6];
    assign P_0[24] = in1[6] ^ in2[6];
    assign G_0[25] = in1[5] & in2[5];
    assign P_0[25] = in1[5] ^ in2[5];
    assign G_0[26] = in1[4] & in2[4];
    assign P_0[26] = in1[4] ^ in2[4];
    assign G_0[27] = in1[3] & in2[3];
    assign P_0[27] = in1[3] ^ in2[3];
    assign G_0[28] = in1[2] & in2[2];
    assign P_0[28] = in1[2] ^ in2[2];
    assign G_0[29] = in1[1] & in2[1];
    assign P_0[29] = in1[1] ^ in2[1];
    assign G_0[30] = in1[0] & in2[0];
    assign P_0[30] = in1[0] ^ in2[0];



    /*Stage 1*/
    gray_cell level_1_0(cin, P_0[0], G_0[0], G_1[0]);
    black_cell level_0_1(G_0[0], P_0[1], G_0[1], P_0[0], G_1[1], P_1[1]);
    black_cell level_0_2(G_0[1], P_0[2], G_0[2], P_0[1], G_1[2], P_1[2]);
    black_cell level_0_3(G_0[2], P_0[3], G_0[3], P_0[2], G_1[3], P_1[3]);
    black_cell level_0_4(G_0[3], P_0[4], G_0[4], P_0[3], G_1[4], P_1[4]);
    black_cell level_0_5(G_0[4], P_0[5], G_0[5], P_0[4], G_1[5], P_1[5]);
    black_cell level_0_6(G_0[5], P_0[6], G_0[6], P_0[5], G_1[6], P_1[6]);
    black_cell level_0_7(G_0[6], P_0[7], G_0[7], P_0[6], G_1[7], P_1[7]);
    black_cell level_0_8(G_0[7], P_0[8], G_0[8], P_0[7], G_1[8], P_1[8]);
    black_cell level_0_9(G_0[8], P_0[9], G_0[9], P_0[8], G_1[9], P_1[9]);
    black_cell level_0_10(G_0[9], P_0[10], G_0[10], P_0[9], G_1[10], P_1[10]);
    black_cell level_0_11(G_0[10], P_0[11], G_0[11], P_0[10], G_1[11], P_1[11]);
    black_cell level_0_12(G_0[11], P_0[12], G_0[12], P_0[11], G_1[12], P_1[12]);
    black_cell level_0_13(G_0[12], P_0[13], G_0[13], P_0[12], G_1[13], P_1[13]);
    black_cell level_0_14(G_0[13], P_0[14], G_0[14], P_0[13], G_1[14], P_1[14]);
    black_cell level_0_15(G_0[14], P_0[15], G_0[15], P_0[14], G_1[15], P_1[15]);
    black_cell level_0_16(G_0[15], P_0[16], G_0[16], P_0[15], G_1[16], P_1[16]);
    black_cell level_0_17(G_0[16], P_0[17], G_0[17], P_0[16], G_1[17], P_1[17]);
    black_cell level_0_18(G_0[17], P_0[18], G_0[18], P_0[17], G_1[18], P_1[18]);
    black_cell level_0_19(G_0[18], P_0[19], G_0[19], P_0[18], G_1[19], P_1[19]);
    black_cell level_0_20(G_0[19], P_0[20], G_0[20], P_0[19], G_1[20], P_1[20]);
    black_cell level_0_21(G_0[20], P_0[21], G_0[21], P_0[20], G_1[21], P_1[21]);
    black_cell level_0_22(G_0[21], P_0[22], G_0[22], P_0[21], G_1[22], P_1[22]);
    black_cell level_0_23(G_0[22], P_0[23], G_0[23], P_0[22], G_1[23], P_1[23]);
    black_cell level_0_24(G_0[23], P_0[24], G_0[24], P_0[23], G_1[24], P_1[24]);
    black_cell level_0_25(G_0[24], P_0[25], G_0[25], P_0[24], G_1[25], P_1[25]);
    black_cell level_0_26(G_0[25], P_0[26], G_0[26], P_0[25], G_1[26], P_1[26]);
    black_cell level_0_27(G_0[26], P_0[27], G_0[27], P_0[26], G_1[27], P_1[27]);
    black_cell level_0_28(G_0[27], P_0[28], G_0[28], P_0[27], G_1[28], P_1[28]);
    black_cell level_0_29(G_0[28], P_0[29], G_0[29], P_0[28], G_1[29], P_1[29]);
    black_cell level_0_30(G_0[29], P_0[30], G_0[30], P_0[29], G_1[30], P_1[30]);

    /*Stage 2*/
    gray_cell level_2_1(cin, P_1[1], G_1[1], G_2[1]);
    gray_cell level_2_2(G_1[0], P_1[2], G_1[2], G_2[2]);
    black_cell level_1_3(G_1[1], P_1[3], G_1[3], P_1[1], G_2[3], P_2[3]);
    black_cell level_1_4(G_1[2], P_1[4], G_1[4], P_1[2], G_2[4], P_2[4]);
    black_cell level_1_5(G_1[3], P_1[5], G_1[5], P_1[3], G_2[5], P_2[5]);
    black_cell level_1_6(G_1[4], P_1[6], G_1[6], P_1[4], G_2[6], P_2[6]);
    black_cell level_1_7(G_1[5], P_1[7], G_1[7], P_1[5], G_2[7], P_2[7]);
    black_cell level_1_8(G_1[6], P_1[8], G_1[8], P_1[6], G_2[8], P_2[8]);
    black_cell level_1_9(G_1[7], P_1[9], G_1[9], P_1[7], G_2[9], P_2[9]);
    black_cell level_1_10(G_1[8], P_1[10], G_1[10], P_1[8], G_2[10], P_2[10]);
    black_cell level_1_11(G_1[9], P_1[11], G_1[11], P_1[9], G_2[11], P_2[11]);
    black_cell level_1_12(G_1[10], P_1[12], G_1[12], P_1[10], G_2[12], P_2[12]);
    black_cell level_1_13(G_1[11], P_1[13], G_1[13], P_1[11], G_2[13], P_2[13]);
    black_cell level_1_14(G_1[12], P_1[14], G_1[14], P_1[12], G_2[14], P_2[14]);
    black_cell level_1_15(G_1[13], P_1[15], G_1[15], P_1[13], G_2[15], P_2[15]);
    black_cell level_1_16(G_1[14], P_1[16], G_1[16], P_1[14], G_2[16], P_2[16]);
    black_cell level_1_17(G_1[15], P_1[17], G_1[17], P_1[15], G_2[17], P_2[17]);
    black_cell level_1_18(G_1[16], P_1[18], G_1[18], P_1[16], G_2[18], P_2[18]);
    black_cell level_1_19(G_1[17], P_1[19], G_1[19], P_1[17], G_2[19], P_2[19]);
    black_cell level_1_20(G_1[18], P_1[20], G_1[20], P_1[18], G_2[20], P_2[20]);
    black_cell level_1_21(G_1[19], P_1[21], G_1[21], P_1[19], G_2[21], P_2[21]);
    black_cell level_1_22(G_1[20], P_1[22], G_1[22], P_1[20], G_2[22], P_2[22]);
    black_cell level_1_23(G_1[21], P_1[23], G_1[23], P_1[21], G_2[23], P_2[23]);
    black_cell level_1_24(G_1[22], P_1[24], G_1[24], P_1[22], G_2[24], P_2[24]);
    black_cell level_1_25(G_1[23], P_1[25], G_1[25], P_1[23], G_2[25], P_2[25]);
    black_cell level_1_26(G_1[24], P_1[26], G_1[26], P_1[24], G_2[26], P_2[26]);
    black_cell level_1_27(G_1[25], P_1[27], G_1[27], P_1[25], G_2[27], P_2[27]);
    black_cell level_1_28(G_1[26], P_1[28], G_1[28], P_1[26], G_2[28], P_2[28]);
    black_cell level_1_29(G_1[27], P_1[29], G_1[29], P_1[27], G_2[29], P_2[29]);
    black_cell level_1_30(G_1[28], P_1[30], G_1[30], P_1[28], G_2[30], P_2[30]);

    /*Stage 3*/
    gray_cell level_3_3(cin, P_2[3], G_2[3], G_3[3]);
    gray_cell level_3_4(G_1[0], P_2[4], G_2[4], G_3[4]);
    gray_cell level_3_5(G_2[1], P_2[5], G_2[5], G_3[5]);
    gray_cell level_3_6(G_2[2], P_2[6], G_2[6], G_3[6]);
    black_cell level_2_7(G_2[3], P_2[7], G_2[7], P_2[3], G_3[7], P_3[7]);
    black_cell level_2_8(G_2[4], P_2[8], G_2[8], P_2[4], G_3[8], P_3[8]);
    black_cell level_2_9(G_2[5], P_2[9], G_2[9], P_2[5], G_3[9], P_3[9]);
    black_cell level_2_10(G_2[6], P_2[10], G_2[10], P_2[6], G_3[10], P_3[10]);
    black_cell level_2_11(G_2[7], P_2[11], G_2[11], P_2[7], G_3[11], P_3[11]);
    black_cell level_2_12(G_2[8], P_2[12], G_2[12], P_2[8], G_3[12], P_3[12]);
    black_cell level_2_13(G_2[9], P_2[13], G_2[13], P_2[9], G_3[13], P_3[13]);
    black_cell level_2_14(G_2[10], P_2[14], G_2[14], P_2[10], G_3[14], P_3[14]);
    black_cell level_2_15(G_2[11], P_2[15], G_2[15], P_2[11], G_3[15], P_3[15]);
    black_cell level_2_16(G_2[12], P_2[16], G_2[16], P_2[12], G_3[16], P_3[16]);
    black_cell level_2_17(G_2[13], P_2[17], G_2[17], P_2[13], G_3[17], P_3[17]);
    black_cell level_2_18(G_2[14], P_2[18], G_2[18], P_2[14], G_3[18], P_3[18]);
    black_cell level_2_19(G_2[15], P_2[19], G_2[19], P_2[15], G_3[19], P_3[19]);
    black_cell level_2_20(G_2[16], P_2[20], G_2[20], P_2[16], G_3[20], P_3[20]);
    black_cell level_2_21(G_2[17], P_2[21], G_2[21], P_2[17], G_3[21], P_3[21]);
    black_cell level_2_22(G_2[18], P_2[22], G_2[22], P_2[18], G_3[22], P_3[22]);
    black_cell level_2_23(G_2[19], P_2[23], G_2[23], P_2[19], G_3[23], P_3[23]);
    black_cell level_2_24(G_2[20], P_2[24], G_2[24], P_2[20], G_3[24], P_3[24]);
    black_cell level_2_25(G_2[21], P_2[25], G_2[25], P_2[21], G_3[25], P_3[25]);
    black_cell level_2_26(G_2[22], P_2[26], G_2[26], P_2[22], G_3[26], P_3[26]);
    black_cell level_2_27(G_2[23], P_2[27], G_2[27], P_2[23], G_3[27], P_3[27]);
    black_cell level_2_28(G_2[24], P_2[28], G_2[28], P_2[24], G_3[28], P_3[28]);
    black_cell level_2_29(G_2[25], P_2[29], G_2[29], P_2[25], G_3[29], P_3[29]);
    black_cell level_2_30(G_2[26], P_2[30], G_2[30], P_2[26], G_3[30], P_3[30]);

    /*Stage 4*/
    gray_cell level_4_7(cin, P_3[7], G_3[7], G_4[7]);
    gray_cell level_4_8(G_1[0], P_3[8], G_3[8], G_4[8]);
    gray_cell level_4_9(G_2[1], P_3[9], G_3[9], G_4[9]);
    gray_cell level_4_10(G_2[2], P_3[10], G_3[10], G_4[10]);
    gray_cell level_4_11(G_3[3], P_3[11], G_3[11], G_4[11]);
    gray_cell level_4_12(G_3[4], P_3[12], G_3[12], G_4[12]);
    gray_cell level_4_13(G_3[5], P_3[13], G_3[13], G_4[13]);
    gray_cell level_4_14(G_3[6], P_3[14], G_3[14], G_4[14]);
    black_cell level_3_15(G_3[7], P_3[15], G_3[15], P_3[7], G_4[15], P_4[15]);
    black_cell level_3_16(G_3[8], P_3[16], G_3[16], P_3[8], G_4[16], P_4[16]);
    black_cell level_3_17(G_3[9], P_3[17], G_3[17], P_3[9], G_4[17], P_4[17]);
    black_cell level_3_18(G_3[10], P_3[18], G_3[18], P_3[10], G_4[18], P_4[18]);
    black_cell level_3_19(G_3[11], P_3[19], G_3[19], P_3[11], G_4[19], P_4[19]);
    black_cell level_3_20(G_3[12], P_3[20], G_3[20], P_3[12], G_4[20], P_4[20]);
    black_cell level_3_21(G_3[13], P_3[21], G_3[21], P_3[13], G_4[21], P_4[21]);
    black_cell level_3_22(G_3[14], P_3[22], G_3[22], P_3[14], G_4[22], P_4[22]);
    black_cell level_3_23(G_3[15], P_3[23], G_3[23], P_3[15], G_4[23], P_4[23]);
    black_cell level_3_24(G_3[16], P_3[24], G_3[24], P_3[16], G_4[24], P_4[24]);
    black_cell level_3_25(G_3[17], P_3[25], G_3[25], P_3[17], G_4[25], P_4[25]);
    black_cell level_3_26(G_3[18], P_3[26], G_3[26], P_3[18], G_4[26], P_4[26]);
    black_cell level_3_27(G_3[19], P_3[27], G_3[27], P_3[19], G_4[27], P_4[27]);
    black_cell level_3_28(G_3[20], P_3[28], G_3[28], P_3[20], G_4[28], P_4[28]);
    black_cell level_3_29(G_3[21], P_3[29], G_3[29], P_3[21], G_4[29], P_4[29]);
    black_cell level_3_30(G_3[22], P_3[30], G_3[30], P_3[22], G_4[30], P_4[30]);

    /*Stage 5*/
    gray_cell level_5_15(cin, P_4[15], G_4[15], G_5[15]);
    gray_cell level_5_16(G_1[0], P_4[16], G_4[16], G_5[16]);
    gray_cell level_5_17(G_2[1], P_4[17], G_4[17], G_5[17]);
    gray_cell level_5_18(G_2[2], P_4[18], G_4[18], G_5[18]);
    gray_cell level_5_19(G_3[3], P_4[19], G_4[19], G_5[19]);
    gray_cell level_5_20(G_3[4], P_4[20], G_4[20], G_5[20]);
    gray_cell level_5_21(G_3[5], P_4[21], G_4[21], G_5[21]);
    gray_cell level_5_22(G_3[6], P_4[22], G_4[22], G_5[22]);
    gray_cell level_5_23(G_4[7], P_4[23], G_4[23], G_5[23]);
    gray_cell level_5_24(G_4[8], P_4[24], G_4[24], G_5[24]);
    gray_cell level_5_25(G_4[9], P_4[25], G_4[25], G_5[25]);
    gray_cell level_5_26(G_4[10], P_4[26], G_4[26], G_5[26]);
    gray_cell level_5_27(G_4[11], P_4[27], G_4[27], G_5[27]);
    gray_cell level_5_28(G_4[12], P_4[28], G_4[28], G_5[28]);
    gray_cell level_5_29(G_4[13], P_4[29], G_4[29], G_5[29]);
    gray_cell level_5_30(G_4[14], P_4[30], G_4[30], cout);

    assign sum[0] = cin    ^ P_0[0];
    assign sum[1] = G_1[0] ^ P_0[1];
    assign sum[2] = G_2[1] ^ P_0[2];
    assign sum[3] = G_2[2] ^ P_0[3];
    assign sum[4] = G_3[3] ^ P_0[4];
    assign sum[5] = G_3[4] ^ P_0[5];
    assign sum[6] = G_3[5] ^ P_0[6];
    assign sum[7] = G_3[6] ^ P_0[7];
    assign sum[8] = G_4[7] ^ P_0[8];
    assign sum[9] = G_4[8] ^ P_0[9];
    assign sum[10] = G_4[9] ^ P_0[10];
    assign sum[11] = G_4[10] ^ P_0[11];
    assign sum[12] = G_4[11] ^ P_0[12];
    assign sum[13] = G_4[12] ^ P_0[13];
    assign sum[14] = G_4[13] ^ P_0[14];
    assign sum[15] = G_4[14] ^ P_0[15];
    assign sum[16] = G_5[15] ^ P_0[16];
    assign sum[17] = G_5[16] ^ P_0[17];
    assign sum[18] = G_5[17] ^ P_0[18];
    assign sum[19] = G_5[18] ^ P_0[19];
    assign sum[20] = G_5[19] ^ P_0[20];
    assign sum[21] = G_5[20] ^ P_0[21];
    assign sum[22] = G_5[21] ^ P_0[22];
    assign sum[23] = G_5[22] ^ P_0[23];
    assign sum[24] = G_5[23] ^ P_0[24];
    assign sum[25] = G_5[24] ^ P_0[25];
    assign sum[26] = G_5[25] ^ P_0[26];
    assign sum[27] = G_5[26] ^ P_0[27];
    assign sum[28] = G_5[27] ^ P_0[28];
    assign sum[29] = G_5[28] ^ P_0[29];
    assign sum[30] = G_5[29] ^ P_0[30];
endmodule

module kogge_stone_30(output [29:0] sum,
        output cout,
        input [29:0] in1,
        input [29:0] in2);

    assign cin = 0;
    wire[29:0] G_0;
    wire[29:0] P_0;
    wire[29:0] G_1;
    wire[29:0] P_1;
    wire[29:0] G_2;
    wire[29:0] P_2;
    wire[29:0] G_3;
    wire[29:0] P_3;
    wire[29:0] G_4;
    wire[29:0] P_4;
    wire[29:0] G_5;
    wire[29:0] P_5;

    assign G_0[0] = in1[29] & in2[29];
    assign P_0[0] = in1[29] ^ in2[29];
    assign G_0[1] = in1[28] & in2[28];
    assign P_0[1] = in1[28] ^ in2[28];
    assign G_0[2] = in1[27] & in2[27];
    assign P_0[2] = in1[27] ^ in2[27];
    assign G_0[3] = in1[26] & in2[26];
    assign P_0[3] = in1[26] ^ in2[26];
    assign G_0[4] = in1[25] & in2[25];
    assign P_0[4] = in1[25] ^ in2[25];
    assign G_0[5] = in1[24] & in2[24];
    assign P_0[5] = in1[24] ^ in2[24];
    assign G_0[6] = in1[23] & in2[23];
    assign P_0[6] = in1[23] ^ in2[23];
    assign G_0[7] = in1[22] & in2[22];
    assign P_0[7] = in1[22] ^ in2[22];
    assign G_0[8] = in1[21] & in2[21];
    assign P_0[8] = in1[21] ^ in2[21];
    assign G_0[9] = in1[20] & in2[20];
    assign P_0[9] = in1[20] ^ in2[20];
    assign G_0[10] = in1[19] & in2[19];
    assign P_0[10] = in1[19] ^ in2[19];
    assign G_0[11] = in1[18] & in2[18];
    assign P_0[11] = in1[18] ^ in2[18];
    assign G_0[12] = in1[17] & in2[17];
    assign P_0[12] = in1[17] ^ in2[17];
    assign G_0[13] = in1[16] & in2[16];
    assign P_0[13] = in1[16] ^ in2[16];
    assign G_0[14] = in1[15] & in2[15];
    assign P_0[14] = in1[15] ^ in2[15];
    assign G_0[15] = in1[14] & in2[14];
    assign P_0[15] = in1[14] ^ in2[14];
    assign G_0[16] = in1[13] & in2[13];
    assign P_0[16] = in1[13] ^ in2[13];
    assign G_0[17] = in1[12] & in2[12];
    assign P_0[17] = in1[12] ^ in2[12];
    assign G_0[18] = in1[11] & in2[11];
    assign P_0[18] = in1[11] ^ in2[11];
    assign G_0[19] = in1[10] & in2[10];
    assign P_0[19] = in1[10] ^ in2[10];
    assign G_0[20] = in1[9] & in2[9];
    assign P_0[20] = in1[9] ^ in2[9];
    assign G_0[21] = in1[8] & in2[8];
    assign P_0[21] = in1[8] ^ in2[8];
    assign G_0[22] = in1[7] & in2[7];
    assign P_0[22] = in1[7] ^ in2[7];
    assign G_0[23] = in1[6] & in2[6];
    assign P_0[23] = in1[6] ^ in2[6];
    assign G_0[24] = in1[5] & in2[5];
    assign P_0[24] = in1[5] ^ in2[5];
    assign G_0[25] = in1[4] & in2[4];
    assign P_0[25] = in1[4] ^ in2[4];
    assign G_0[26] = in1[3] & in2[3];
    assign P_0[26] = in1[3] ^ in2[3];
    assign G_0[27] = in1[2] & in2[2];
    assign P_0[27] = in1[2] ^ in2[2];
    assign G_0[28] = in1[1] & in2[1];
    assign P_0[28] = in1[1] ^ in2[1];
    assign G_0[29] = in1[0] & in2[0];
    assign P_0[29] = in1[0] ^ in2[0];



    /*Stage 1*/
    gray_cell level_1_0(cin, P_0[0], G_0[0], G_1[0]);
    black_cell level_0_1(G_0[0], P_0[1], G_0[1], P_0[0], G_1[1], P_1[1]);
    black_cell level_0_2(G_0[1], P_0[2], G_0[2], P_0[1], G_1[2], P_1[2]);
    black_cell level_0_3(G_0[2], P_0[3], G_0[3], P_0[2], G_1[3], P_1[3]);
    black_cell level_0_4(G_0[3], P_0[4], G_0[4], P_0[3], G_1[4], P_1[4]);
    black_cell level_0_5(G_0[4], P_0[5], G_0[5], P_0[4], G_1[5], P_1[5]);
    black_cell level_0_6(G_0[5], P_0[6], G_0[6], P_0[5], G_1[6], P_1[6]);
    black_cell level_0_7(G_0[6], P_0[7], G_0[7], P_0[6], G_1[7], P_1[7]);
    black_cell level_0_8(G_0[7], P_0[8], G_0[8], P_0[7], G_1[8], P_1[8]);
    black_cell level_0_9(G_0[8], P_0[9], G_0[9], P_0[8], G_1[9], P_1[9]);
    black_cell level_0_10(G_0[9], P_0[10], G_0[10], P_0[9], G_1[10], P_1[10]);
    black_cell level_0_11(G_0[10], P_0[11], G_0[11], P_0[10], G_1[11], P_1[11]);
    black_cell level_0_12(G_0[11], P_0[12], G_0[12], P_0[11], G_1[12], P_1[12]);
    black_cell level_0_13(G_0[12], P_0[13], G_0[13], P_0[12], G_1[13], P_1[13]);
    black_cell level_0_14(G_0[13], P_0[14], G_0[14], P_0[13], G_1[14], P_1[14]);
    black_cell level_0_15(G_0[14], P_0[15], G_0[15], P_0[14], G_1[15], P_1[15]);
    black_cell level_0_16(G_0[15], P_0[16], G_0[16], P_0[15], G_1[16], P_1[16]);
    black_cell level_0_17(G_0[16], P_0[17], G_0[17], P_0[16], G_1[17], P_1[17]);
    black_cell level_0_18(G_0[17], P_0[18], G_0[18], P_0[17], G_1[18], P_1[18]);
    black_cell level_0_19(G_0[18], P_0[19], G_0[19], P_0[18], G_1[19], P_1[19]);
    black_cell level_0_20(G_0[19], P_0[20], G_0[20], P_0[19], G_1[20], P_1[20]);
    black_cell level_0_21(G_0[20], P_0[21], G_0[21], P_0[20], G_1[21], P_1[21]);
    black_cell level_0_22(G_0[21], P_0[22], G_0[22], P_0[21], G_1[22], P_1[22]);
    black_cell level_0_23(G_0[22], P_0[23], G_0[23], P_0[22], G_1[23], P_1[23]);
    black_cell level_0_24(G_0[23], P_0[24], G_0[24], P_0[23], G_1[24], P_1[24]);
    black_cell level_0_25(G_0[24], P_0[25], G_0[25], P_0[24], G_1[25], P_1[25]);
    black_cell level_0_26(G_0[25], P_0[26], G_0[26], P_0[25], G_1[26], P_1[26]);
    black_cell level_0_27(G_0[26], P_0[27], G_0[27], P_0[26], G_1[27], P_1[27]);
    black_cell level_0_28(G_0[27], P_0[28], G_0[28], P_0[27], G_1[28], P_1[28]);
    black_cell level_0_29(G_0[28], P_0[29], G_0[29], P_0[28], G_1[29], P_1[29]);

    /*Stage 2*/
    gray_cell level_2_1(cin, P_1[1], G_1[1], G_2[1]);
    gray_cell level_2_2(G_1[0], P_1[2], G_1[2], G_2[2]);
    black_cell level_1_3(G_1[1], P_1[3], G_1[3], P_1[1], G_2[3], P_2[3]);
    black_cell level_1_4(G_1[2], P_1[4], G_1[4], P_1[2], G_2[4], P_2[4]);
    black_cell level_1_5(G_1[3], P_1[5], G_1[5], P_1[3], G_2[5], P_2[5]);
    black_cell level_1_6(G_1[4], P_1[6], G_1[6], P_1[4], G_2[6], P_2[6]);
    black_cell level_1_7(G_1[5], P_1[7], G_1[7], P_1[5], G_2[7], P_2[7]);
    black_cell level_1_8(G_1[6], P_1[8], G_1[8], P_1[6], G_2[8], P_2[8]);
    black_cell level_1_9(G_1[7], P_1[9], G_1[9], P_1[7], G_2[9], P_2[9]);
    black_cell level_1_10(G_1[8], P_1[10], G_1[10], P_1[8], G_2[10], P_2[10]);
    black_cell level_1_11(G_1[9], P_1[11], G_1[11], P_1[9], G_2[11], P_2[11]);
    black_cell level_1_12(G_1[10], P_1[12], G_1[12], P_1[10], G_2[12], P_2[12]);
    black_cell level_1_13(G_1[11], P_1[13], G_1[13], P_1[11], G_2[13], P_2[13]);
    black_cell level_1_14(G_1[12], P_1[14], G_1[14], P_1[12], G_2[14], P_2[14]);
    black_cell level_1_15(G_1[13], P_1[15], G_1[15], P_1[13], G_2[15], P_2[15]);
    black_cell level_1_16(G_1[14], P_1[16], G_1[16], P_1[14], G_2[16], P_2[16]);
    black_cell level_1_17(G_1[15], P_1[17], G_1[17], P_1[15], G_2[17], P_2[17]);
    black_cell level_1_18(G_1[16], P_1[18], G_1[18], P_1[16], G_2[18], P_2[18]);
    black_cell level_1_19(G_1[17], P_1[19], G_1[19], P_1[17], G_2[19], P_2[19]);
    black_cell level_1_20(G_1[18], P_1[20], G_1[20], P_1[18], G_2[20], P_2[20]);
    black_cell level_1_21(G_1[19], P_1[21], G_1[21], P_1[19], G_2[21], P_2[21]);
    black_cell level_1_22(G_1[20], P_1[22], G_1[22], P_1[20], G_2[22], P_2[22]);
    black_cell level_1_23(G_1[21], P_1[23], G_1[23], P_1[21], G_2[23], P_2[23]);
    black_cell level_1_24(G_1[22], P_1[24], G_1[24], P_1[22], G_2[24], P_2[24]);
    black_cell level_1_25(G_1[23], P_1[25], G_1[25], P_1[23], G_2[25], P_2[25]);
    black_cell level_1_26(G_1[24], P_1[26], G_1[26], P_1[24], G_2[26], P_2[26]);
    black_cell level_1_27(G_1[25], P_1[27], G_1[27], P_1[25], G_2[27], P_2[27]);
    black_cell level_1_28(G_1[26], P_1[28], G_1[28], P_1[26], G_2[28], P_2[28]);
    black_cell level_1_29(G_1[27], P_1[29], G_1[29], P_1[27], G_2[29], P_2[29]);

    /*Stage 3*/
    gray_cell level_3_3(cin, P_2[3], G_2[3], G_3[3]);
    gray_cell level_3_4(G_1[0], P_2[4], G_2[4], G_3[4]);
    gray_cell level_3_5(G_2[1], P_2[5], G_2[5], G_3[5]);
    gray_cell level_3_6(G_2[2], P_2[6], G_2[6], G_3[6]);
    black_cell level_2_7(G_2[3], P_2[7], G_2[7], P_2[3], G_3[7], P_3[7]);
    black_cell level_2_8(G_2[4], P_2[8], G_2[8], P_2[4], G_3[8], P_3[8]);
    black_cell level_2_9(G_2[5], P_2[9], G_2[9], P_2[5], G_3[9], P_3[9]);
    black_cell level_2_10(G_2[6], P_2[10], G_2[10], P_2[6], G_3[10], P_3[10]);
    black_cell level_2_11(G_2[7], P_2[11], G_2[11], P_2[7], G_3[11], P_3[11]);
    black_cell level_2_12(G_2[8], P_2[12], G_2[12], P_2[8], G_3[12], P_3[12]);
    black_cell level_2_13(G_2[9], P_2[13], G_2[13], P_2[9], G_3[13], P_3[13]);
    black_cell level_2_14(G_2[10], P_2[14], G_2[14], P_2[10], G_3[14], P_3[14]);
    black_cell level_2_15(G_2[11], P_2[15], G_2[15], P_2[11], G_3[15], P_3[15]);
    black_cell level_2_16(G_2[12], P_2[16], G_2[16], P_2[12], G_3[16], P_3[16]);
    black_cell level_2_17(G_2[13], P_2[17], G_2[17], P_2[13], G_3[17], P_3[17]);
    black_cell level_2_18(G_2[14], P_2[18], G_2[18], P_2[14], G_3[18], P_3[18]);
    black_cell level_2_19(G_2[15], P_2[19], G_2[19], P_2[15], G_3[19], P_3[19]);
    black_cell level_2_20(G_2[16], P_2[20], G_2[20], P_2[16], G_3[20], P_3[20]);
    black_cell level_2_21(G_2[17], P_2[21], G_2[21], P_2[17], G_3[21], P_3[21]);
    black_cell level_2_22(G_2[18], P_2[22], G_2[22], P_2[18], G_3[22], P_3[22]);
    black_cell level_2_23(G_2[19], P_2[23], G_2[23], P_2[19], G_3[23], P_3[23]);
    black_cell level_2_24(G_2[20], P_2[24], G_2[24], P_2[20], G_3[24], P_3[24]);
    black_cell level_2_25(G_2[21], P_2[25], G_2[25], P_2[21], G_3[25], P_3[25]);
    black_cell level_2_26(G_2[22], P_2[26], G_2[26], P_2[22], G_3[26], P_3[26]);
    black_cell level_2_27(G_2[23], P_2[27], G_2[27], P_2[23], G_3[27], P_3[27]);
    black_cell level_2_28(G_2[24], P_2[28], G_2[28], P_2[24], G_3[28], P_3[28]);
    black_cell level_2_29(G_2[25], P_2[29], G_2[29], P_2[25], G_3[29], P_3[29]);

    /*Stage 4*/
    gray_cell level_4_7(cin, P_3[7], G_3[7], G_4[7]);
    gray_cell level_4_8(G_1[0], P_3[8], G_3[8], G_4[8]);
    gray_cell level_4_9(G_2[1], P_3[9], G_3[9], G_4[9]);
    gray_cell level_4_10(G_2[2], P_3[10], G_3[10], G_4[10]);
    gray_cell level_4_11(G_3[3], P_3[11], G_3[11], G_4[11]);
    gray_cell level_4_12(G_3[4], P_3[12], G_3[12], G_4[12]);
    gray_cell level_4_13(G_3[5], P_3[13], G_3[13], G_4[13]);
    gray_cell level_4_14(G_3[6], P_3[14], G_3[14], G_4[14]);
    black_cell level_3_15(G_3[7], P_3[15], G_3[15], P_3[7], G_4[15], P_4[15]);
    black_cell level_3_16(G_3[8], P_3[16], G_3[16], P_3[8], G_4[16], P_4[16]);
    black_cell level_3_17(G_3[9], P_3[17], G_3[17], P_3[9], G_4[17], P_4[17]);
    black_cell level_3_18(G_3[10], P_3[18], G_3[18], P_3[10], G_4[18], P_4[18]);
    black_cell level_3_19(G_3[11], P_3[19], G_3[19], P_3[11], G_4[19], P_4[19]);
    black_cell level_3_20(G_3[12], P_3[20], G_3[20], P_3[12], G_4[20], P_4[20]);
    black_cell level_3_21(G_3[13], P_3[21], G_3[21], P_3[13], G_4[21], P_4[21]);
    black_cell level_3_22(G_3[14], P_3[22], G_3[22], P_3[14], G_4[22], P_4[22]);
    black_cell level_3_23(G_3[15], P_3[23], G_3[23], P_3[15], G_4[23], P_4[23]);
    black_cell level_3_24(G_3[16], P_3[24], G_3[24], P_3[16], G_4[24], P_4[24]);
    black_cell level_3_25(G_3[17], P_3[25], G_3[25], P_3[17], G_4[25], P_4[25]);
    black_cell level_3_26(G_3[18], P_3[26], G_3[26], P_3[18], G_4[26], P_4[26]);
    black_cell level_3_27(G_3[19], P_3[27], G_3[27], P_3[19], G_4[27], P_4[27]);
    black_cell level_3_28(G_3[20], P_3[28], G_3[28], P_3[20], G_4[28], P_4[28]);
    black_cell level_3_29(G_3[21], P_3[29], G_3[29], P_3[21], G_4[29], P_4[29]);

    /*Stage 5*/
    gray_cell level_5_15(cin, P_4[15], G_4[15], G_5[15]);
    gray_cell level_5_16(G_1[0], P_4[16], G_4[16], G_5[16]);
    gray_cell level_5_17(G_2[1], P_4[17], G_4[17], G_5[17]);
    gray_cell level_5_18(G_2[2], P_4[18], G_4[18], G_5[18]);
    gray_cell level_5_19(G_3[3], P_4[19], G_4[19], G_5[19]);
    gray_cell level_5_20(G_3[4], P_4[20], G_4[20], G_5[20]);
    gray_cell level_5_21(G_3[5], P_4[21], G_4[21], G_5[21]);
    gray_cell level_5_22(G_3[6], P_4[22], G_4[22], G_5[22]);
    gray_cell level_5_23(G_4[7], P_4[23], G_4[23], G_5[23]);
    gray_cell level_5_24(G_4[8], P_4[24], G_4[24], G_5[24]);
    gray_cell level_5_25(G_4[9], P_4[25], G_4[25], G_5[25]);
    gray_cell level_5_26(G_4[10], P_4[26], G_4[26], G_5[26]);
    gray_cell level_5_27(G_4[11], P_4[27], G_4[27], G_5[27]);
    gray_cell level_5_28(G_4[12], P_4[28], G_4[28], G_5[28]);
    gray_cell level_5_29(G_4[13], P_4[29], G_4[29], cout);

    assign sum[0] = cin    ^ P_0[0];
    assign sum[1] = G_1[0] ^ P_0[1];
    assign sum[2] = G_2[1] ^ P_0[2];
    assign sum[3] = G_2[2] ^ P_0[3];
    assign sum[4] = G_3[3] ^ P_0[4];
    assign sum[5] = G_3[4] ^ P_0[5];
    assign sum[6] = G_3[5] ^ P_0[6];
    assign sum[7] = G_3[6] ^ P_0[7];
    assign sum[8] = G_4[7] ^ P_0[8];
    assign sum[9] = G_4[8] ^ P_0[9];
    assign sum[10] = G_4[9] ^ P_0[10];
    assign sum[11] = G_4[10] ^ P_0[11];
    assign sum[12] = G_4[11] ^ P_0[12];
    assign sum[13] = G_4[12] ^ P_0[13];
    assign sum[14] = G_4[13] ^ P_0[14];
    assign sum[15] = G_4[14] ^ P_0[15];
    assign sum[16] = G_5[15] ^ P_0[16];
    assign sum[17] = G_5[16] ^ P_0[17];
    assign sum[18] = G_5[17] ^ P_0[18];
    assign sum[19] = G_5[18] ^ P_0[19];
    assign sum[20] = G_5[19] ^ P_0[20];
    assign sum[21] = G_5[20] ^ P_0[21];
    assign sum[22] = G_5[21] ^ P_0[22];
    assign sum[23] = G_5[22] ^ P_0[23];
    assign sum[24] = G_5[23] ^ P_0[24];
    assign sum[25] = G_5[24] ^ P_0[25];
    assign sum[26] = G_5[25] ^ P_0[26];
    assign sum[27] = G_5[26] ^ P_0[27];
    assign sum[28] = G_5[27] ^ P_0[28];
    assign sum[29] = G_5[28] ^ P_0[29];
endmodule

module kogge_stone_29(output [28:0] sum,
        output cout,
        input [28:0] in1,
        input [28:0] in2);

    assign cin = 0;
    wire[28:0] G_0;
    wire[28:0] P_0;
    wire[28:0] G_1;
    wire[28:0] P_1;
    wire[28:0] G_2;
    wire[28:0] P_2;
    wire[28:0] G_3;
    wire[28:0] P_3;
    wire[28:0] G_4;
    wire[28:0] P_4;
    wire[28:0] G_5;
    wire[28:0] P_5;

    assign G_0[0] = in1[28] & in2[28];
    assign P_0[0] = in1[28] ^ in2[28];
    assign G_0[1] = in1[27] & in2[27];
    assign P_0[1] = in1[27] ^ in2[27];
    assign G_0[2] = in1[26] & in2[26];
    assign P_0[2] = in1[26] ^ in2[26];
    assign G_0[3] = in1[25] & in2[25];
    assign P_0[3] = in1[25] ^ in2[25];
    assign G_0[4] = in1[24] & in2[24];
    assign P_0[4] = in1[24] ^ in2[24];
    assign G_0[5] = in1[23] & in2[23];
    assign P_0[5] = in1[23] ^ in2[23];
    assign G_0[6] = in1[22] & in2[22];
    assign P_0[6] = in1[22] ^ in2[22];
    assign G_0[7] = in1[21] & in2[21];
    assign P_0[7] = in1[21] ^ in2[21];
    assign G_0[8] = in1[20] & in2[20];
    assign P_0[8] = in1[20] ^ in2[20];
    assign G_0[9] = in1[19] & in2[19];
    assign P_0[9] = in1[19] ^ in2[19];
    assign G_0[10] = in1[18] & in2[18];
    assign P_0[10] = in1[18] ^ in2[18];
    assign G_0[11] = in1[17] & in2[17];
    assign P_0[11] = in1[17] ^ in2[17];
    assign G_0[12] = in1[16] & in2[16];
    assign P_0[12] = in1[16] ^ in2[16];
    assign G_0[13] = in1[15] & in2[15];
    assign P_0[13] = in1[15] ^ in2[15];
    assign G_0[14] = in1[14] & in2[14];
    assign P_0[14] = in1[14] ^ in2[14];
    assign G_0[15] = in1[13] & in2[13];
    assign P_0[15] = in1[13] ^ in2[13];
    assign G_0[16] = in1[12] & in2[12];
    assign P_0[16] = in1[12] ^ in2[12];
    assign G_0[17] = in1[11] & in2[11];
    assign P_0[17] = in1[11] ^ in2[11];
    assign G_0[18] = in1[10] & in2[10];
    assign P_0[18] = in1[10] ^ in2[10];
    assign G_0[19] = in1[9] & in2[9];
    assign P_0[19] = in1[9] ^ in2[9];
    assign G_0[20] = in1[8] & in2[8];
    assign P_0[20] = in1[8] ^ in2[8];
    assign G_0[21] = in1[7] & in2[7];
    assign P_0[21] = in1[7] ^ in2[7];
    assign G_0[22] = in1[6] & in2[6];
    assign P_0[22] = in1[6] ^ in2[6];
    assign G_0[23] = in1[5] & in2[5];
    assign P_0[23] = in1[5] ^ in2[5];
    assign G_0[24] = in1[4] & in2[4];
    assign P_0[24] = in1[4] ^ in2[4];
    assign G_0[25] = in1[3] & in2[3];
    assign P_0[25] = in1[3] ^ in2[3];
    assign G_0[26] = in1[2] & in2[2];
    assign P_0[26] = in1[2] ^ in2[2];
    assign G_0[27] = in1[1] & in2[1];
    assign P_0[27] = in1[1] ^ in2[1];
    assign G_0[28] = in1[0] & in2[0];
    assign P_0[28] = in1[0] ^ in2[0];



    /*Stage 1*/
    gray_cell level_1_0(cin, P_0[0], G_0[0], G_1[0]);
    black_cell level_0_1(G_0[0], P_0[1], G_0[1], P_0[0], G_1[1], P_1[1]);
    black_cell level_0_2(G_0[1], P_0[2], G_0[2], P_0[1], G_1[2], P_1[2]);
    black_cell level_0_3(G_0[2], P_0[3], G_0[3], P_0[2], G_1[3], P_1[3]);
    black_cell level_0_4(G_0[3], P_0[4], G_0[4], P_0[3], G_1[4], P_1[4]);
    black_cell level_0_5(G_0[4], P_0[5], G_0[5], P_0[4], G_1[5], P_1[5]);
    black_cell level_0_6(G_0[5], P_0[6], G_0[6], P_0[5], G_1[6], P_1[6]);
    black_cell level_0_7(G_0[6], P_0[7], G_0[7], P_0[6], G_1[7], P_1[7]);
    black_cell level_0_8(G_0[7], P_0[8], G_0[8], P_0[7], G_1[8], P_1[8]);
    black_cell level_0_9(G_0[8], P_0[9], G_0[9], P_0[8], G_1[9], P_1[9]);
    black_cell level_0_10(G_0[9], P_0[10], G_0[10], P_0[9], G_1[10], P_1[10]);
    black_cell level_0_11(G_0[10], P_0[11], G_0[11], P_0[10], G_1[11], P_1[11]);
    black_cell level_0_12(G_0[11], P_0[12], G_0[12], P_0[11], G_1[12], P_1[12]);
    black_cell level_0_13(G_0[12], P_0[13], G_0[13], P_0[12], G_1[13], P_1[13]);
    black_cell level_0_14(G_0[13], P_0[14], G_0[14], P_0[13], G_1[14], P_1[14]);
    black_cell level_0_15(G_0[14], P_0[15], G_0[15], P_0[14], G_1[15], P_1[15]);
    black_cell level_0_16(G_0[15], P_0[16], G_0[16], P_0[15], G_1[16], P_1[16]);
    black_cell level_0_17(G_0[16], P_0[17], G_0[17], P_0[16], G_1[17], P_1[17]);
    black_cell level_0_18(G_0[17], P_0[18], G_0[18], P_0[17], G_1[18], P_1[18]);
    black_cell level_0_19(G_0[18], P_0[19], G_0[19], P_0[18], G_1[19], P_1[19]);
    black_cell level_0_20(G_0[19], P_0[20], G_0[20], P_0[19], G_1[20], P_1[20]);
    black_cell level_0_21(G_0[20], P_0[21], G_0[21], P_0[20], G_1[21], P_1[21]);
    black_cell level_0_22(G_0[21], P_0[22], G_0[22], P_0[21], G_1[22], P_1[22]);
    black_cell level_0_23(G_0[22], P_0[23], G_0[23], P_0[22], G_1[23], P_1[23]);
    black_cell level_0_24(G_0[23], P_0[24], G_0[24], P_0[23], G_1[24], P_1[24]);
    black_cell level_0_25(G_0[24], P_0[25], G_0[25], P_0[24], G_1[25], P_1[25]);
    black_cell level_0_26(G_0[25], P_0[26], G_0[26], P_0[25], G_1[26], P_1[26]);
    black_cell level_0_27(G_0[26], P_0[27], G_0[27], P_0[26], G_1[27], P_1[27]);
    black_cell level_0_28(G_0[27], P_0[28], G_0[28], P_0[27], G_1[28], P_1[28]);

    /*Stage 2*/
    gray_cell level_2_1(cin, P_1[1], G_1[1], G_2[1]);
    gray_cell level_2_2(G_1[0], P_1[2], G_1[2], G_2[2]);
    black_cell level_1_3(G_1[1], P_1[3], G_1[3], P_1[1], G_2[3], P_2[3]);
    black_cell level_1_4(G_1[2], P_1[4], G_1[4], P_1[2], G_2[4], P_2[4]);
    black_cell level_1_5(G_1[3], P_1[5], G_1[5], P_1[3], G_2[5], P_2[5]);
    black_cell level_1_6(G_1[4], P_1[6], G_1[6], P_1[4], G_2[6], P_2[6]);
    black_cell level_1_7(G_1[5], P_1[7], G_1[7], P_1[5], G_2[7], P_2[7]);
    black_cell level_1_8(G_1[6], P_1[8], G_1[8], P_1[6], G_2[8], P_2[8]);
    black_cell level_1_9(G_1[7], P_1[9], G_1[9], P_1[7], G_2[9], P_2[9]);
    black_cell level_1_10(G_1[8], P_1[10], G_1[10], P_1[8], G_2[10], P_2[10]);
    black_cell level_1_11(G_1[9], P_1[11], G_1[11], P_1[9], G_2[11], P_2[11]);
    black_cell level_1_12(G_1[10], P_1[12], G_1[12], P_1[10], G_2[12], P_2[12]);
    black_cell level_1_13(G_1[11], P_1[13], G_1[13], P_1[11], G_2[13], P_2[13]);
    black_cell level_1_14(G_1[12], P_1[14], G_1[14], P_1[12], G_2[14], P_2[14]);
    black_cell level_1_15(G_1[13], P_1[15], G_1[15], P_1[13], G_2[15], P_2[15]);
    black_cell level_1_16(G_1[14], P_1[16], G_1[16], P_1[14], G_2[16], P_2[16]);
    black_cell level_1_17(G_1[15], P_1[17], G_1[17], P_1[15], G_2[17], P_2[17]);
    black_cell level_1_18(G_1[16], P_1[18], G_1[18], P_1[16], G_2[18], P_2[18]);
    black_cell level_1_19(G_1[17], P_1[19], G_1[19], P_1[17], G_2[19], P_2[19]);
    black_cell level_1_20(G_1[18], P_1[20], G_1[20], P_1[18], G_2[20], P_2[20]);
    black_cell level_1_21(G_1[19], P_1[21], G_1[21], P_1[19], G_2[21], P_2[21]);
    black_cell level_1_22(G_1[20], P_1[22], G_1[22], P_1[20], G_2[22], P_2[22]);
    black_cell level_1_23(G_1[21], P_1[23], G_1[23], P_1[21], G_2[23], P_2[23]);
    black_cell level_1_24(G_1[22], P_1[24], G_1[24], P_1[22], G_2[24], P_2[24]);
    black_cell level_1_25(G_1[23], P_1[25], G_1[25], P_1[23], G_2[25], P_2[25]);
    black_cell level_1_26(G_1[24], P_1[26], G_1[26], P_1[24], G_2[26], P_2[26]);
    black_cell level_1_27(G_1[25], P_1[27], G_1[27], P_1[25], G_2[27], P_2[27]);
    black_cell level_1_28(G_1[26], P_1[28], G_1[28], P_1[26], G_2[28], P_2[28]);

    /*Stage 3*/
    gray_cell level_3_3(cin, P_2[3], G_2[3], G_3[3]);
    gray_cell level_3_4(G_1[0], P_2[4], G_2[4], G_3[4]);
    gray_cell level_3_5(G_2[1], P_2[5], G_2[5], G_3[5]);
    gray_cell level_3_6(G_2[2], P_2[6], G_2[6], G_3[6]);
    black_cell level_2_7(G_2[3], P_2[7], G_2[7], P_2[3], G_3[7], P_3[7]);
    black_cell level_2_8(G_2[4], P_2[8], G_2[8], P_2[4], G_3[8], P_3[8]);
    black_cell level_2_9(G_2[5], P_2[9], G_2[9], P_2[5], G_3[9], P_3[9]);
    black_cell level_2_10(G_2[6], P_2[10], G_2[10], P_2[6], G_3[10], P_3[10]);
    black_cell level_2_11(G_2[7], P_2[11], G_2[11], P_2[7], G_3[11], P_3[11]);
    black_cell level_2_12(G_2[8], P_2[12], G_2[12], P_2[8], G_3[12], P_3[12]);
    black_cell level_2_13(G_2[9], P_2[13], G_2[13], P_2[9], G_3[13], P_3[13]);
    black_cell level_2_14(G_2[10], P_2[14], G_2[14], P_2[10], G_3[14], P_3[14]);
    black_cell level_2_15(G_2[11], P_2[15], G_2[15], P_2[11], G_3[15], P_3[15]);
    black_cell level_2_16(G_2[12], P_2[16], G_2[16], P_2[12], G_3[16], P_3[16]);
    black_cell level_2_17(G_2[13], P_2[17], G_2[17], P_2[13], G_3[17], P_3[17]);
    black_cell level_2_18(G_2[14], P_2[18], G_2[18], P_2[14], G_3[18], P_3[18]);
    black_cell level_2_19(G_2[15], P_2[19], G_2[19], P_2[15], G_3[19], P_3[19]);
    black_cell level_2_20(G_2[16], P_2[20], G_2[20], P_2[16], G_3[20], P_3[20]);
    black_cell level_2_21(G_2[17], P_2[21], G_2[21], P_2[17], G_3[21], P_3[21]);
    black_cell level_2_22(G_2[18], P_2[22], G_2[22], P_2[18], G_3[22], P_3[22]);
    black_cell level_2_23(G_2[19], P_2[23], G_2[23], P_2[19], G_3[23], P_3[23]);
    black_cell level_2_24(G_2[20], P_2[24], G_2[24], P_2[20], G_3[24], P_3[24]);
    black_cell level_2_25(G_2[21], P_2[25], G_2[25], P_2[21], G_3[25], P_3[25]);
    black_cell level_2_26(G_2[22], P_2[26], G_2[26], P_2[22], G_3[26], P_3[26]);
    black_cell level_2_27(G_2[23], P_2[27], G_2[27], P_2[23], G_3[27], P_3[27]);
    black_cell level_2_28(G_2[24], P_2[28], G_2[28], P_2[24], G_3[28], P_3[28]);

    /*Stage 4*/
    gray_cell level_4_7(cin, P_3[7], G_3[7], G_4[7]);
    gray_cell level_4_8(G_1[0], P_3[8], G_3[8], G_4[8]);
    gray_cell level_4_9(G_2[1], P_3[9], G_3[9], G_4[9]);
    gray_cell level_4_10(G_2[2], P_3[10], G_3[10], G_4[10]);
    gray_cell level_4_11(G_3[3], P_3[11], G_3[11], G_4[11]);
    gray_cell level_4_12(G_3[4], P_3[12], G_3[12], G_4[12]);
    gray_cell level_4_13(G_3[5], P_3[13], G_3[13], G_4[13]);
    gray_cell level_4_14(G_3[6], P_3[14], G_3[14], G_4[14]);
    black_cell level_3_15(G_3[7], P_3[15], G_3[15], P_3[7], G_4[15], P_4[15]);
    black_cell level_3_16(G_3[8], P_3[16], G_3[16], P_3[8], G_4[16], P_4[16]);
    black_cell level_3_17(G_3[9], P_3[17], G_3[17], P_3[9], G_4[17], P_4[17]);
    black_cell level_3_18(G_3[10], P_3[18], G_3[18], P_3[10], G_4[18], P_4[18]);
    black_cell level_3_19(G_3[11], P_3[19], G_3[19], P_3[11], G_4[19], P_4[19]);
    black_cell level_3_20(G_3[12], P_3[20], G_3[20], P_3[12], G_4[20], P_4[20]);
    black_cell level_3_21(G_3[13], P_3[21], G_3[21], P_3[13], G_4[21], P_4[21]);
    black_cell level_3_22(G_3[14], P_3[22], G_3[22], P_3[14], G_4[22], P_4[22]);
    black_cell level_3_23(G_3[15], P_3[23], G_3[23], P_3[15], G_4[23], P_4[23]);
    black_cell level_3_24(G_3[16], P_3[24], G_3[24], P_3[16], G_4[24], P_4[24]);
    black_cell level_3_25(G_3[17], P_3[25], G_3[25], P_3[17], G_4[25], P_4[25]);
    black_cell level_3_26(G_3[18], P_3[26], G_3[26], P_3[18], G_4[26], P_4[26]);
    black_cell level_3_27(G_3[19], P_3[27], G_3[27], P_3[19], G_4[27], P_4[27]);
    black_cell level_3_28(G_3[20], P_3[28], G_3[28], P_3[20], G_4[28], P_4[28]);

    /*Stage 5*/
    gray_cell level_5_15(cin, P_4[15], G_4[15], G_5[15]);
    gray_cell level_5_16(G_1[0], P_4[16], G_4[16], G_5[16]);
    gray_cell level_5_17(G_2[1], P_4[17], G_4[17], G_5[17]);
    gray_cell level_5_18(G_2[2], P_4[18], G_4[18], G_5[18]);
    gray_cell level_5_19(G_3[3], P_4[19], G_4[19], G_5[19]);
    gray_cell level_5_20(G_3[4], P_4[20], G_4[20], G_5[20]);
    gray_cell level_5_21(G_3[5], P_4[21], G_4[21], G_5[21]);
    gray_cell level_5_22(G_3[6], P_4[22], G_4[22], G_5[22]);
    gray_cell level_5_23(G_4[7], P_4[23], G_4[23], G_5[23]);
    gray_cell level_5_24(G_4[8], P_4[24], G_4[24], G_5[24]);
    gray_cell level_5_25(G_4[9], P_4[25], G_4[25], G_5[25]);
    gray_cell level_5_26(G_4[10], P_4[26], G_4[26], G_5[26]);
    gray_cell level_5_27(G_4[11], P_4[27], G_4[27], G_5[27]);
    gray_cell level_5_28(G_4[12], P_4[28], G_4[28], cout);

    assign sum[0] = cin    ^ P_0[0];
    assign sum[1] = G_1[0] ^ P_0[1];
    assign sum[2] = G_2[1] ^ P_0[2];
    assign sum[3] = G_2[2] ^ P_0[3];
    assign sum[4] = G_3[3] ^ P_0[4];
    assign sum[5] = G_3[4] ^ P_0[5];
    assign sum[6] = G_3[5] ^ P_0[6];
    assign sum[7] = G_3[6] ^ P_0[7];
    assign sum[8] = G_4[7] ^ P_0[8];
    assign sum[9] = G_4[8] ^ P_0[9];
    assign sum[10] = G_4[9] ^ P_0[10];
    assign sum[11] = G_4[10] ^ P_0[11];
    assign sum[12] = G_4[11] ^ P_0[12];
    assign sum[13] = G_4[12] ^ P_0[13];
    assign sum[14] = G_4[13] ^ P_0[14];
    assign sum[15] = G_4[14] ^ P_0[15];
    assign sum[16] = G_5[15] ^ P_0[16];
    assign sum[17] = G_5[16] ^ P_0[17];
    assign sum[18] = G_5[17] ^ P_0[18];
    assign sum[19] = G_5[18] ^ P_0[19];
    assign sum[20] = G_5[19] ^ P_0[20];
    assign sum[21] = G_5[20] ^ P_0[21];
    assign sum[22] = G_5[21] ^ P_0[22];
    assign sum[23] = G_5[22] ^ P_0[23];
    assign sum[24] = G_5[23] ^ P_0[24];
    assign sum[25] = G_5[24] ^ P_0[25];
    assign sum[26] = G_5[25] ^ P_0[26];
    assign sum[27] = G_5[26] ^ P_0[27];
    assign sum[28] = G_5[27] ^ P_0[28];
endmodule

module kogge_stone_28(output [27:0] sum,
        output cout,
        input [27:0] in1,
        input [27:0] in2);

    assign cin = 0;
    wire[27:0] G_0;
    wire[27:0] P_0;
    wire[27:0] G_1;
    wire[27:0] P_1;
    wire[27:0] G_2;
    wire[27:0] P_2;
    wire[27:0] G_3;
    wire[27:0] P_3;
    wire[27:0] G_4;
    wire[27:0] P_4;
    wire[27:0] G_5;
    wire[27:0] P_5;

    assign G_0[0] = in1[27] & in2[27];
    assign P_0[0] = in1[27] ^ in2[27];
    assign G_0[1] = in1[26] & in2[26];
    assign P_0[1] = in1[26] ^ in2[26];
    assign G_0[2] = in1[25] & in2[25];
    assign P_0[2] = in1[25] ^ in2[25];
    assign G_0[3] = in1[24] & in2[24];
    assign P_0[3] = in1[24] ^ in2[24];
    assign G_0[4] = in1[23] & in2[23];
    assign P_0[4] = in1[23] ^ in2[23];
    assign G_0[5] = in1[22] & in2[22];
    assign P_0[5] = in1[22] ^ in2[22];
    assign G_0[6] = in1[21] & in2[21];
    assign P_0[6] = in1[21] ^ in2[21];
    assign G_0[7] = in1[20] & in2[20];
    assign P_0[7] = in1[20] ^ in2[20];
    assign G_0[8] = in1[19] & in2[19];
    assign P_0[8] = in1[19] ^ in2[19];
    assign G_0[9] = in1[18] & in2[18];
    assign P_0[9] = in1[18] ^ in2[18];
    assign G_0[10] = in1[17] & in2[17];
    assign P_0[10] = in1[17] ^ in2[17];
    assign G_0[11] = in1[16] & in2[16];
    assign P_0[11] = in1[16] ^ in2[16];
    assign G_0[12] = in1[15] & in2[15];
    assign P_0[12] = in1[15] ^ in2[15];
    assign G_0[13] = in1[14] & in2[14];
    assign P_0[13] = in1[14] ^ in2[14];
    assign G_0[14] = in1[13] & in2[13];
    assign P_0[14] = in1[13] ^ in2[13];
    assign G_0[15] = in1[12] & in2[12];
    assign P_0[15] = in1[12] ^ in2[12];
    assign G_0[16] = in1[11] & in2[11];
    assign P_0[16] = in1[11] ^ in2[11];
    assign G_0[17] = in1[10] & in2[10];
    assign P_0[17] = in1[10] ^ in2[10];
    assign G_0[18] = in1[9] & in2[9];
    assign P_0[18] = in1[9] ^ in2[9];
    assign G_0[19] = in1[8] & in2[8];
    assign P_0[19] = in1[8] ^ in2[8];
    assign G_0[20] = in1[7] & in2[7];
    assign P_0[20] = in1[7] ^ in2[7];
    assign G_0[21] = in1[6] & in2[6];
    assign P_0[21] = in1[6] ^ in2[6];
    assign G_0[22] = in1[5] & in2[5];
    assign P_0[22] = in1[5] ^ in2[5];
    assign G_0[23] = in1[4] & in2[4];
    assign P_0[23] = in1[4] ^ in2[4];
    assign G_0[24] = in1[3] & in2[3];
    assign P_0[24] = in1[3] ^ in2[3];
    assign G_0[25] = in1[2] & in2[2];
    assign P_0[25] = in1[2] ^ in2[2];
    assign G_0[26] = in1[1] & in2[1];
    assign P_0[26] = in1[1] ^ in2[1];
    assign G_0[27] = in1[0] & in2[0];
    assign P_0[27] = in1[0] ^ in2[0];



    /*Stage 1*/
    gray_cell level_1_0(cin, P_0[0], G_0[0], G_1[0]);
    black_cell level_0_1(G_0[0], P_0[1], G_0[1], P_0[0], G_1[1], P_1[1]);
    black_cell level_0_2(G_0[1], P_0[2], G_0[2], P_0[1], G_1[2], P_1[2]);
    black_cell level_0_3(G_0[2], P_0[3], G_0[3], P_0[2], G_1[3], P_1[3]);
    black_cell level_0_4(G_0[3], P_0[4], G_0[4], P_0[3], G_1[4], P_1[4]);
    black_cell level_0_5(G_0[4], P_0[5], G_0[5], P_0[4], G_1[5], P_1[5]);
    black_cell level_0_6(G_0[5], P_0[6], G_0[6], P_0[5], G_1[6], P_1[6]);
    black_cell level_0_7(G_0[6], P_0[7], G_0[7], P_0[6], G_1[7], P_1[7]);
    black_cell level_0_8(G_0[7], P_0[8], G_0[8], P_0[7], G_1[8], P_1[8]);
    black_cell level_0_9(G_0[8], P_0[9], G_0[9], P_0[8], G_1[9], P_1[9]);
    black_cell level_0_10(G_0[9], P_0[10], G_0[10], P_0[9], G_1[10], P_1[10]);
    black_cell level_0_11(G_0[10], P_0[11], G_0[11], P_0[10], G_1[11], P_1[11]);
    black_cell level_0_12(G_0[11], P_0[12], G_0[12], P_0[11], G_1[12], P_1[12]);
    black_cell level_0_13(G_0[12], P_0[13], G_0[13], P_0[12], G_1[13], P_1[13]);
    black_cell level_0_14(G_0[13], P_0[14], G_0[14], P_0[13], G_1[14], P_1[14]);
    black_cell level_0_15(G_0[14], P_0[15], G_0[15], P_0[14], G_1[15], P_1[15]);
    black_cell level_0_16(G_0[15], P_0[16], G_0[16], P_0[15], G_1[16], P_1[16]);
    black_cell level_0_17(G_0[16], P_0[17], G_0[17], P_0[16], G_1[17], P_1[17]);
    black_cell level_0_18(G_0[17], P_0[18], G_0[18], P_0[17], G_1[18], P_1[18]);
    black_cell level_0_19(G_0[18], P_0[19], G_0[19], P_0[18], G_1[19], P_1[19]);
    black_cell level_0_20(G_0[19], P_0[20], G_0[20], P_0[19], G_1[20], P_1[20]);
    black_cell level_0_21(G_0[20], P_0[21], G_0[21], P_0[20], G_1[21], P_1[21]);
    black_cell level_0_22(G_0[21], P_0[22], G_0[22], P_0[21], G_1[22], P_1[22]);
    black_cell level_0_23(G_0[22], P_0[23], G_0[23], P_0[22], G_1[23], P_1[23]);
    black_cell level_0_24(G_0[23], P_0[24], G_0[24], P_0[23], G_1[24], P_1[24]);
    black_cell level_0_25(G_0[24], P_0[25], G_0[25], P_0[24], G_1[25], P_1[25]);
    black_cell level_0_26(G_0[25], P_0[26], G_0[26], P_0[25], G_1[26], P_1[26]);
    black_cell level_0_27(G_0[26], P_0[27], G_0[27], P_0[26], G_1[27], P_1[27]);

    /*Stage 2*/
    gray_cell level_2_1(cin, P_1[1], G_1[1], G_2[1]);
    gray_cell level_2_2(G_1[0], P_1[2], G_1[2], G_2[2]);
    black_cell level_1_3(G_1[1], P_1[3], G_1[3], P_1[1], G_2[3], P_2[3]);
    black_cell level_1_4(G_1[2], P_1[4], G_1[4], P_1[2], G_2[4], P_2[4]);
    black_cell level_1_5(G_1[3], P_1[5], G_1[5], P_1[3], G_2[5], P_2[5]);
    black_cell level_1_6(G_1[4], P_1[6], G_1[6], P_1[4], G_2[6], P_2[6]);
    black_cell level_1_7(G_1[5], P_1[7], G_1[7], P_1[5], G_2[7], P_2[7]);
    black_cell level_1_8(G_1[6], P_1[8], G_1[8], P_1[6], G_2[8], P_2[8]);
    black_cell level_1_9(G_1[7], P_1[9], G_1[9], P_1[7], G_2[9], P_2[9]);
    black_cell level_1_10(G_1[8], P_1[10], G_1[10], P_1[8], G_2[10], P_2[10]);
    black_cell level_1_11(G_1[9], P_1[11], G_1[11], P_1[9], G_2[11], P_2[11]);
    black_cell level_1_12(G_1[10], P_1[12], G_1[12], P_1[10], G_2[12], P_2[12]);
    black_cell level_1_13(G_1[11], P_1[13], G_1[13], P_1[11], G_2[13], P_2[13]);
    black_cell level_1_14(G_1[12], P_1[14], G_1[14], P_1[12], G_2[14], P_2[14]);
    black_cell level_1_15(G_1[13], P_1[15], G_1[15], P_1[13], G_2[15], P_2[15]);
    black_cell level_1_16(G_1[14], P_1[16], G_1[16], P_1[14], G_2[16], P_2[16]);
    black_cell level_1_17(G_1[15], P_1[17], G_1[17], P_1[15], G_2[17], P_2[17]);
    black_cell level_1_18(G_1[16], P_1[18], G_1[18], P_1[16], G_2[18], P_2[18]);
    black_cell level_1_19(G_1[17], P_1[19], G_1[19], P_1[17], G_2[19], P_2[19]);
    black_cell level_1_20(G_1[18], P_1[20], G_1[20], P_1[18], G_2[20], P_2[20]);
    black_cell level_1_21(G_1[19], P_1[21], G_1[21], P_1[19], G_2[21], P_2[21]);
    black_cell level_1_22(G_1[20], P_1[22], G_1[22], P_1[20], G_2[22], P_2[22]);
    black_cell level_1_23(G_1[21], P_1[23], G_1[23], P_1[21], G_2[23], P_2[23]);
    black_cell level_1_24(G_1[22], P_1[24], G_1[24], P_1[22], G_2[24], P_2[24]);
    black_cell level_1_25(G_1[23], P_1[25], G_1[25], P_1[23], G_2[25], P_2[25]);
    black_cell level_1_26(G_1[24], P_1[26], G_1[26], P_1[24], G_2[26], P_2[26]);
    black_cell level_1_27(G_1[25], P_1[27], G_1[27], P_1[25], G_2[27], P_2[27]);

    /*Stage 3*/
    gray_cell level_3_3(cin, P_2[3], G_2[3], G_3[3]);
    gray_cell level_3_4(G_1[0], P_2[4], G_2[4], G_3[4]);
    gray_cell level_3_5(G_2[1], P_2[5], G_2[5], G_3[5]);
    gray_cell level_3_6(G_2[2], P_2[6], G_2[6], G_3[6]);
    black_cell level_2_7(G_2[3], P_2[7], G_2[7], P_2[3], G_3[7], P_3[7]);
    black_cell level_2_8(G_2[4], P_2[8], G_2[8], P_2[4], G_3[8], P_3[8]);
    black_cell level_2_9(G_2[5], P_2[9], G_2[9], P_2[5], G_3[9], P_3[9]);
    black_cell level_2_10(G_2[6], P_2[10], G_2[10], P_2[6], G_3[10], P_3[10]);
    black_cell level_2_11(G_2[7], P_2[11], G_2[11], P_2[7], G_3[11], P_3[11]);
    black_cell level_2_12(G_2[8], P_2[12], G_2[12], P_2[8], G_3[12], P_3[12]);
    black_cell level_2_13(G_2[9], P_2[13], G_2[13], P_2[9], G_3[13], P_3[13]);
    black_cell level_2_14(G_2[10], P_2[14], G_2[14], P_2[10], G_3[14], P_3[14]);
    black_cell level_2_15(G_2[11], P_2[15], G_2[15], P_2[11], G_3[15], P_3[15]);
    black_cell level_2_16(G_2[12], P_2[16], G_2[16], P_2[12], G_3[16], P_3[16]);
    black_cell level_2_17(G_2[13], P_2[17], G_2[17], P_2[13], G_3[17], P_3[17]);
    black_cell level_2_18(G_2[14], P_2[18], G_2[18], P_2[14], G_3[18], P_3[18]);
    black_cell level_2_19(G_2[15], P_2[19], G_2[19], P_2[15], G_3[19], P_3[19]);
    black_cell level_2_20(G_2[16], P_2[20], G_2[20], P_2[16], G_3[20], P_3[20]);
    black_cell level_2_21(G_2[17], P_2[21], G_2[21], P_2[17], G_3[21], P_3[21]);
    black_cell level_2_22(G_2[18], P_2[22], G_2[22], P_2[18], G_3[22], P_3[22]);
    black_cell level_2_23(G_2[19], P_2[23], G_2[23], P_2[19], G_3[23], P_3[23]);
    black_cell level_2_24(G_2[20], P_2[24], G_2[24], P_2[20], G_3[24], P_3[24]);
    black_cell level_2_25(G_2[21], P_2[25], G_2[25], P_2[21], G_3[25], P_3[25]);
    black_cell level_2_26(G_2[22], P_2[26], G_2[26], P_2[22], G_3[26], P_3[26]);
    black_cell level_2_27(G_2[23], P_2[27], G_2[27], P_2[23], G_3[27], P_3[27]);

    /*Stage 4*/
    gray_cell level_4_7(cin, P_3[7], G_3[7], G_4[7]);
    gray_cell level_4_8(G_1[0], P_3[8], G_3[8], G_4[8]);
    gray_cell level_4_9(G_2[1], P_3[9], G_3[9], G_4[9]);
    gray_cell level_4_10(G_2[2], P_3[10], G_3[10], G_4[10]);
    gray_cell level_4_11(G_3[3], P_3[11], G_3[11], G_4[11]);
    gray_cell level_4_12(G_3[4], P_3[12], G_3[12], G_4[12]);
    gray_cell level_4_13(G_3[5], P_3[13], G_3[13], G_4[13]);
    gray_cell level_4_14(G_3[6], P_3[14], G_3[14], G_4[14]);
    black_cell level_3_15(G_3[7], P_3[15], G_3[15], P_3[7], G_4[15], P_4[15]);
    black_cell level_3_16(G_3[8], P_3[16], G_3[16], P_3[8], G_4[16], P_4[16]);
    black_cell level_3_17(G_3[9], P_3[17], G_3[17], P_3[9], G_4[17], P_4[17]);
    black_cell level_3_18(G_3[10], P_3[18], G_3[18], P_3[10], G_4[18], P_4[18]);
    black_cell level_3_19(G_3[11], P_3[19], G_3[19], P_3[11], G_4[19], P_4[19]);
    black_cell level_3_20(G_3[12], P_3[20], G_3[20], P_3[12], G_4[20], P_4[20]);
    black_cell level_3_21(G_3[13], P_3[21], G_3[21], P_3[13], G_4[21], P_4[21]);
    black_cell level_3_22(G_3[14], P_3[22], G_3[22], P_3[14], G_4[22], P_4[22]);
    black_cell level_3_23(G_3[15], P_3[23], G_3[23], P_3[15], G_4[23], P_4[23]);
    black_cell level_3_24(G_3[16], P_3[24], G_3[24], P_3[16], G_4[24], P_4[24]);
    black_cell level_3_25(G_3[17], P_3[25], G_3[25], P_3[17], G_4[25], P_4[25]);
    black_cell level_3_26(G_3[18], P_3[26], G_3[26], P_3[18], G_4[26], P_4[26]);
    black_cell level_3_27(G_3[19], P_3[27], G_3[27], P_3[19], G_4[27], P_4[27]);

    /*Stage 5*/
    gray_cell level_5_15(cin, P_4[15], G_4[15], G_5[15]);
    gray_cell level_5_16(G_1[0], P_4[16], G_4[16], G_5[16]);
    gray_cell level_5_17(G_2[1], P_4[17], G_4[17], G_5[17]);
    gray_cell level_5_18(G_2[2], P_4[18], G_4[18], G_5[18]);
    gray_cell level_5_19(G_3[3], P_4[19], G_4[19], G_5[19]);
    gray_cell level_5_20(G_3[4], P_4[20], G_4[20], G_5[20]);
    gray_cell level_5_21(G_3[5], P_4[21], G_4[21], G_5[21]);
    gray_cell level_5_22(G_3[6], P_4[22], G_4[22], G_5[22]);
    gray_cell level_5_23(G_4[7], P_4[23], G_4[23], G_5[23]);
    gray_cell level_5_24(G_4[8], P_4[24], G_4[24], G_5[24]);
    gray_cell level_5_25(G_4[9], P_4[25], G_4[25], G_5[25]);
    gray_cell level_5_26(G_4[10], P_4[26], G_4[26], G_5[26]);
    gray_cell level_5_27(G_4[11], P_4[27], G_4[27], cout);

    assign sum[0] = cin    ^ P_0[0];
    assign sum[1] = G_1[0] ^ P_0[1];
    assign sum[2] = G_2[1] ^ P_0[2];
    assign sum[3] = G_2[2] ^ P_0[3];
    assign sum[4] = G_3[3] ^ P_0[4];
    assign sum[5] = G_3[4] ^ P_0[5];
    assign sum[6] = G_3[5] ^ P_0[6];
    assign sum[7] = G_3[6] ^ P_0[7];
    assign sum[8] = G_4[7] ^ P_0[8];
    assign sum[9] = G_4[8] ^ P_0[9];
    assign sum[10] = G_4[9] ^ P_0[10];
    assign sum[11] = G_4[10] ^ P_0[11];
    assign sum[12] = G_4[11] ^ P_0[12];
    assign sum[13] = G_4[12] ^ P_0[13];
    assign sum[14] = G_4[13] ^ P_0[14];
    assign sum[15] = G_4[14] ^ P_0[15];
    assign sum[16] = G_5[15] ^ P_0[16];
    assign sum[17] = G_5[16] ^ P_0[17];
    assign sum[18] = G_5[17] ^ P_0[18];
    assign sum[19] = G_5[18] ^ P_0[19];
    assign sum[20] = G_5[19] ^ P_0[20];
    assign sum[21] = G_5[20] ^ P_0[21];
    assign sum[22] = G_5[21] ^ P_0[22];
    assign sum[23] = G_5[22] ^ P_0[23];
    assign sum[24] = G_5[23] ^ P_0[24];
    assign sum[25] = G_5[24] ^ P_0[25];
    assign sum[26] = G_5[25] ^ P_0[26];
    assign sum[27] = G_5[26] ^ P_0[27];
endmodule

module kogge_stone_27(output [26:0] sum,
        output cout,
        input [26:0] in1,
        input [26:0] in2);

    assign cin = 0;
    wire[26:0] G_0;
    wire[26:0] P_0;
    wire[26:0] G_1;
    wire[26:0] P_1;
    wire[26:0] G_2;
    wire[26:0] P_2;
    wire[26:0] G_3;
    wire[26:0] P_3;
    wire[26:0] G_4;
    wire[26:0] P_4;
    wire[26:0] G_5;
    wire[26:0] P_5;

    assign G_0[0] = in1[26] & in2[26];
    assign P_0[0] = in1[26] ^ in2[26];
    assign G_0[1] = in1[25] & in2[25];
    assign P_0[1] = in1[25] ^ in2[25];
    assign G_0[2] = in1[24] & in2[24];
    assign P_0[2] = in1[24] ^ in2[24];
    assign G_0[3] = in1[23] & in2[23];
    assign P_0[3] = in1[23] ^ in2[23];
    assign G_0[4] = in1[22] & in2[22];
    assign P_0[4] = in1[22] ^ in2[22];
    assign G_0[5] = in1[21] & in2[21];
    assign P_0[5] = in1[21] ^ in2[21];
    assign G_0[6] = in1[20] & in2[20];
    assign P_0[6] = in1[20] ^ in2[20];
    assign G_0[7] = in1[19] & in2[19];
    assign P_0[7] = in1[19] ^ in2[19];
    assign G_0[8] = in1[18] & in2[18];
    assign P_0[8] = in1[18] ^ in2[18];
    assign G_0[9] = in1[17] & in2[17];
    assign P_0[9] = in1[17] ^ in2[17];
    assign G_0[10] = in1[16] & in2[16];
    assign P_0[10] = in1[16] ^ in2[16];
    assign G_0[11] = in1[15] & in2[15];
    assign P_0[11] = in1[15] ^ in2[15];
    assign G_0[12] = in1[14] & in2[14];
    assign P_0[12] = in1[14] ^ in2[14];
    assign G_0[13] = in1[13] & in2[13];
    assign P_0[13] = in1[13] ^ in2[13];
    assign G_0[14] = in1[12] & in2[12];
    assign P_0[14] = in1[12] ^ in2[12];
    assign G_0[15] = in1[11] & in2[11];
    assign P_0[15] = in1[11] ^ in2[11];
    assign G_0[16] = in1[10] & in2[10];
    assign P_0[16] = in1[10] ^ in2[10];
    assign G_0[17] = in1[9] & in2[9];
    assign P_0[17] = in1[9] ^ in2[9];
    assign G_0[18] = in1[8] & in2[8];
    assign P_0[18] = in1[8] ^ in2[8];
    assign G_0[19] = in1[7] & in2[7];
    assign P_0[19] = in1[7] ^ in2[7];
    assign G_0[20] = in1[6] & in2[6];
    assign P_0[20] = in1[6] ^ in2[6];
    assign G_0[21] = in1[5] & in2[5];
    assign P_0[21] = in1[5] ^ in2[5];
    assign G_0[22] = in1[4] & in2[4];
    assign P_0[22] = in1[4] ^ in2[4];
    assign G_0[23] = in1[3] & in2[3];
    assign P_0[23] = in1[3] ^ in2[3];
    assign G_0[24] = in1[2] & in2[2];
    assign P_0[24] = in1[2] ^ in2[2];
    assign G_0[25] = in1[1] & in2[1];
    assign P_0[25] = in1[1] ^ in2[1];
    assign G_0[26] = in1[0] & in2[0];
    assign P_0[26] = in1[0] ^ in2[0];



    /*Stage 1*/
    gray_cell level_1_0(cin, P_0[0], G_0[0], G_1[0]);
    black_cell level_0_1(G_0[0], P_0[1], G_0[1], P_0[0], G_1[1], P_1[1]);
    black_cell level_0_2(G_0[1], P_0[2], G_0[2], P_0[1], G_1[2], P_1[2]);
    black_cell level_0_3(G_0[2], P_0[3], G_0[3], P_0[2], G_1[3], P_1[3]);
    black_cell level_0_4(G_0[3], P_0[4], G_0[4], P_0[3], G_1[4], P_1[4]);
    black_cell level_0_5(G_0[4], P_0[5], G_0[5], P_0[4], G_1[5], P_1[5]);
    black_cell level_0_6(G_0[5], P_0[6], G_0[6], P_0[5], G_1[6], P_1[6]);
    black_cell level_0_7(G_0[6], P_0[7], G_0[7], P_0[6], G_1[7], P_1[7]);
    black_cell level_0_8(G_0[7], P_0[8], G_0[8], P_0[7], G_1[8], P_1[8]);
    black_cell level_0_9(G_0[8], P_0[9], G_0[9], P_0[8], G_1[9], P_1[9]);
    black_cell level_0_10(G_0[9], P_0[10], G_0[10], P_0[9], G_1[10], P_1[10]);
    black_cell level_0_11(G_0[10], P_0[11], G_0[11], P_0[10], G_1[11], P_1[11]);
    black_cell level_0_12(G_0[11], P_0[12], G_0[12], P_0[11], G_1[12], P_1[12]);
    black_cell level_0_13(G_0[12], P_0[13], G_0[13], P_0[12], G_1[13], P_1[13]);
    black_cell level_0_14(G_0[13], P_0[14], G_0[14], P_0[13], G_1[14], P_1[14]);
    black_cell level_0_15(G_0[14], P_0[15], G_0[15], P_0[14], G_1[15], P_1[15]);
    black_cell level_0_16(G_0[15], P_0[16], G_0[16], P_0[15], G_1[16], P_1[16]);
    black_cell level_0_17(G_0[16], P_0[17], G_0[17], P_0[16], G_1[17], P_1[17]);
    black_cell level_0_18(G_0[17], P_0[18], G_0[18], P_0[17], G_1[18], P_1[18]);
    black_cell level_0_19(G_0[18], P_0[19], G_0[19], P_0[18], G_1[19], P_1[19]);
    black_cell level_0_20(G_0[19], P_0[20], G_0[20], P_0[19], G_1[20], P_1[20]);
    black_cell level_0_21(G_0[20], P_0[21], G_0[21], P_0[20], G_1[21], P_1[21]);
    black_cell level_0_22(G_0[21], P_0[22], G_0[22], P_0[21], G_1[22], P_1[22]);
    black_cell level_0_23(G_0[22], P_0[23], G_0[23], P_0[22], G_1[23], P_1[23]);
    black_cell level_0_24(G_0[23], P_0[24], G_0[24], P_0[23], G_1[24], P_1[24]);
    black_cell level_0_25(G_0[24], P_0[25], G_0[25], P_0[24], G_1[25], P_1[25]);
    black_cell level_0_26(G_0[25], P_0[26], G_0[26], P_0[25], G_1[26], P_1[26]);

    /*Stage 2*/
    gray_cell level_2_1(cin, P_1[1], G_1[1], G_2[1]);
    gray_cell level_2_2(G_1[0], P_1[2], G_1[2], G_2[2]);
    black_cell level_1_3(G_1[1], P_1[3], G_1[3], P_1[1], G_2[3], P_2[3]);
    black_cell level_1_4(G_1[2], P_1[4], G_1[4], P_1[2], G_2[4], P_2[4]);
    black_cell level_1_5(G_1[3], P_1[5], G_1[5], P_1[3], G_2[5], P_2[5]);
    black_cell level_1_6(G_1[4], P_1[6], G_1[6], P_1[4], G_2[6], P_2[6]);
    black_cell level_1_7(G_1[5], P_1[7], G_1[7], P_1[5], G_2[7], P_2[7]);
    black_cell level_1_8(G_1[6], P_1[8], G_1[8], P_1[6], G_2[8], P_2[8]);
    black_cell level_1_9(G_1[7], P_1[9], G_1[9], P_1[7], G_2[9], P_2[9]);
    black_cell level_1_10(G_1[8], P_1[10], G_1[10], P_1[8], G_2[10], P_2[10]);
    black_cell level_1_11(G_1[9], P_1[11], G_1[11], P_1[9], G_2[11], P_2[11]);
    black_cell level_1_12(G_1[10], P_1[12], G_1[12], P_1[10], G_2[12], P_2[12]);
    black_cell level_1_13(G_1[11], P_1[13], G_1[13], P_1[11], G_2[13], P_2[13]);
    black_cell level_1_14(G_1[12], P_1[14], G_1[14], P_1[12], G_2[14], P_2[14]);
    black_cell level_1_15(G_1[13], P_1[15], G_1[15], P_1[13], G_2[15], P_2[15]);
    black_cell level_1_16(G_1[14], P_1[16], G_1[16], P_1[14], G_2[16], P_2[16]);
    black_cell level_1_17(G_1[15], P_1[17], G_1[17], P_1[15], G_2[17], P_2[17]);
    black_cell level_1_18(G_1[16], P_1[18], G_1[18], P_1[16], G_2[18], P_2[18]);
    black_cell level_1_19(G_1[17], P_1[19], G_1[19], P_1[17], G_2[19], P_2[19]);
    black_cell level_1_20(G_1[18], P_1[20], G_1[20], P_1[18], G_2[20], P_2[20]);
    black_cell level_1_21(G_1[19], P_1[21], G_1[21], P_1[19], G_2[21], P_2[21]);
    black_cell level_1_22(G_1[20], P_1[22], G_1[22], P_1[20], G_2[22], P_2[22]);
    black_cell level_1_23(G_1[21], P_1[23], G_1[23], P_1[21], G_2[23], P_2[23]);
    black_cell level_1_24(G_1[22], P_1[24], G_1[24], P_1[22], G_2[24], P_2[24]);
    black_cell level_1_25(G_1[23], P_1[25], G_1[25], P_1[23], G_2[25], P_2[25]);
    black_cell level_1_26(G_1[24], P_1[26], G_1[26], P_1[24], G_2[26], P_2[26]);

    /*Stage 3*/
    gray_cell level_3_3(cin, P_2[3], G_2[3], G_3[3]);
    gray_cell level_3_4(G_1[0], P_2[4], G_2[4], G_3[4]);
    gray_cell level_3_5(G_2[1], P_2[5], G_2[5], G_3[5]);
    gray_cell level_3_6(G_2[2], P_2[6], G_2[6], G_3[6]);
    black_cell level_2_7(G_2[3], P_2[7], G_2[7], P_2[3], G_3[7], P_3[7]);
    black_cell level_2_8(G_2[4], P_2[8], G_2[8], P_2[4], G_3[8], P_3[8]);
    black_cell level_2_9(G_2[5], P_2[9], G_2[9], P_2[5], G_3[9], P_3[9]);
    black_cell level_2_10(G_2[6], P_2[10], G_2[10], P_2[6], G_3[10], P_3[10]);
    black_cell level_2_11(G_2[7], P_2[11], G_2[11], P_2[7], G_3[11], P_3[11]);
    black_cell level_2_12(G_2[8], P_2[12], G_2[12], P_2[8], G_3[12], P_3[12]);
    black_cell level_2_13(G_2[9], P_2[13], G_2[13], P_2[9], G_3[13], P_3[13]);
    black_cell level_2_14(G_2[10], P_2[14], G_2[14], P_2[10], G_3[14], P_3[14]);
    black_cell level_2_15(G_2[11], P_2[15], G_2[15], P_2[11], G_3[15], P_3[15]);
    black_cell level_2_16(G_2[12], P_2[16], G_2[16], P_2[12], G_3[16], P_3[16]);
    black_cell level_2_17(G_2[13], P_2[17], G_2[17], P_2[13], G_3[17], P_3[17]);
    black_cell level_2_18(G_2[14], P_2[18], G_2[18], P_2[14], G_3[18], P_3[18]);
    black_cell level_2_19(G_2[15], P_2[19], G_2[19], P_2[15], G_3[19], P_3[19]);
    black_cell level_2_20(G_2[16], P_2[20], G_2[20], P_2[16], G_3[20], P_3[20]);
    black_cell level_2_21(G_2[17], P_2[21], G_2[21], P_2[17], G_3[21], P_3[21]);
    black_cell level_2_22(G_2[18], P_2[22], G_2[22], P_2[18], G_3[22], P_3[22]);
    black_cell level_2_23(G_2[19], P_2[23], G_2[23], P_2[19], G_3[23], P_3[23]);
    black_cell level_2_24(G_2[20], P_2[24], G_2[24], P_2[20], G_3[24], P_3[24]);
    black_cell level_2_25(G_2[21], P_2[25], G_2[25], P_2[21], G_3[25], P_3[25]);
    black_cell level_2_26(G_2[22], P_2[26], G_2[26], P_2[22], G_3[26], P_3[26]);

    /*Stage 4*/
    gray_cell level_4_7(cin, P_3[7], G_3[7], G_4[7]);
    gray_cell level_4_8(G_1[0], P_3[8], G_3[8], G_4[8]);
    gray_cell level_4_9(G_2[1], P_3[9], G_3[9], G_4[9]);
    gray_cell level_4_10(G_2[2], P_3[10], G_3[10], G_4[10]);
    gray_cell level_4_11(G_3[3], P_3[11], G_3[11], G_4[11]);
    gray_cell level_4_12(G_3[4], P_3[12], G_3[12], G_4[12]);
    gray_cell level_4_13(G_3[5], P_3[13], G_3[13], G_4[13]);
    gray_cell level_4_14(G_3[6], P_3[14], G_3[14], G_4[14]);
    black_cell level_3_15(G_3[7], P_3[15], G_3[15], P_3[7], G_4[15], P_4[15]);
    black_cell level_3_16(G_3[8], P_3[16], G_3[16], P_3[8], G_4[16], P_4[16]);
    black_cell level_3_17(G_3[9], P_3[17], G_3[17], P_3[9], G_4[17], P_4[17]);
    black_cell level_3_18(G_3[10], P_3[18], G_3[18], P_3[10], G_4[18], P_4[18]);
    black_cell level_3_19(G_3[11], P_3[19], G_3[19], P_3[11], G_4[19], P_4[19]);
    black_cell level_3_20(G_3[12], P_3[20], G_3[20], P_3[12], G_4[20], P_4[20]);
    black_cell level_3_21(G_3[13], P_3[21], G_3[21], P_3[13], G_4[21], P_4[21]);
    black_cell level_3_22(G_3[14], P_3[22], G_3[22], P_3[14], G_4[22], P_4[22]);
    black_cell level_3_23(G_3[15], P_3[23], G_3[23], P_3[15], G_4[23], P_4[23]);
    black_cell level_3_24(G_3[16], P_3[24], G_3[24], P_3[16], G_4[24], P_4[24]);
    black_cell level_3_25(G_3[17], P_3[25], G_3[25], P_3[17], G_4[25], P_4[25]);
    black_cell level_3_26(G_3[18], P_3[26], G_3[26], P_3[18], G_4[26], P_4[26]);

    /*Stage 5*/
    gray_cell level_5_15(cin, P_4[15], G_4[15], G_5[15]);
    gray_cell level_5_16(G_1[0], P_4[16], G_4[16], G_5[16]);
    gray_cell level_5_17(G_2[1], P_4[17], G_4[17], G_5[17]);
    gray_cell level_5_18(G_2[2], P_4[18], G_4[18], G_5[18]);
    gray_cell level_5_19(G_3[3], P_4[19], G_4[19], G_5[19]);
    gray_cell level_5_20(G_3[4], P_4[20], G_4[20], G_5[20]);
    gray_cell level_5_21(G_3[5], P_4[21], G_4[21], G_5[21]);
    gray_cell level_5_22(G_3[6], P_4[22], G_4[22], G_5[22]);
    gray_cell level_5_23(G_4[7], P_4[23], G_4[23], G_5[23]);
    gray_cell level_5_24(G_4[8], P_4[24], G_4[24], G_5[24]);
    gray_cell level_5_25(G_4[9], P_4[25], G_4[25], G_5[25]);
    gray_cell level_5_26(G_4[10], P_4[26], G_4[26], cout);

    assign sum[0] = cin    ^ P_0[0];
    assign sum[1] = G_1[0] ^ P_0[1];
    assign sum[2] = G_2[1] ^ P_0[2];
    assign sum[3] = G_2[2] ^ P_0[3];
    assign sum[4] = G_3[3] ^ P_0[4];
    assign sum[5] = G_3[4] ^ P_0[5];
    assign sum[6] = G_3[5] ^ P_0[6];
    assign sum[7] = G_3[6] ^ P_0[7];
    assign sum[8] = G_4[7] ^ P_0[8];
    assign sum[9] = G_4[8] ^ P_0[9];
    assign sum[10] = G_4[9] ^ P_0[10];
    assign sum[11] = G_4[10] ^ P_0[11];
    assign sum[12] = G_4[11] ^ P_0[12];
    assign sum[13] = G_4[12] ^ P_0[13];
    assign sum[14] = G_4[13] ^ P_0[14];
    assign sum[15] = G_4[14] ^ P_0[15];
    assign sum[16] = G_5[15] ^ P_0[16];
    assign sum[17] = G_5[16] ^ P_0[17];
    assign sum[18] = G_5[17] ^ P_0[18];
    assign sum[19] = G_5[18] ^ P_0[19];
    assign sum[20] = G_5[19] ^ P_0[20];
    assign sum[21] = G_5[20] ^ P_0[21];
    assign sum[22] = G_5[21] ^ P_0[22];
    assign sum[23] = G_5[22] ^ P_0[23];
    assign sum[24] = G_5[23] ^ P_0[24];
    assign sum[25] = G_5[24] ^ P_0[25];
    assign sum[26] = G_5[25] ^ P_0[26];
endmodule

module kogge_stone_26(output [25:0] sum,
        output cout,
        input [25:0] in1,
        input [25:0] in2);

    assign cin = 0;
    wire[25:0] G_0;
    wire[25:0] P_0;
    wire[25:0] G_1;
    wire[25:0] P_1;
    wire[25:0] G_2;
    wire[25:0] P_2;
    wire[25:0] G_3;
    wire[25:0] P_3;
    wire[25:0] G_4;
    wire[25:0] P_4;
    wire[25:0] G_5;
    wire[25:0] P_5;

    assign G_0[0] = in1[25] & in2[25];
    assign P_0[0] = in1[25] ^ in2[25];
    assign G_0[1] = in1[24] & in2[24];
    assign P_0[1] = in1[24] ^ in2[24];
    assign G_0[2] = in1[23] & in2[23];
    assign P_0[2] = in1[23] ^ in2[23];
    assign G_0[3] = in1[22] & in2[22];
    assign P_0[3] = in1[22] ^ in2[22];
    assign G_0[4] = in1[21] & in2[21];
    assign P_0[4] = in1[21] ^ in2[21];
    assign G_0[5] = in1[20] & in2[20];
    assign P_0[5] = in1[20] ^ in2[20];
    assign G_0[6] = in1[19] & in2[19];
    assign P_0[6] = in1[19] ^ in2[19];
    assign G_0[7] = in1[18] & in2[18];
    assign P_0[7] = in1[18] ^ in2[18];
    assign G_0[8] = in1[17] & in2[17];
    assign P_0[8] = in1[17] ^ in2[17];
    assign G_0[9] = in1[16] & in2[16];
    assign P_0[9] = in1[16] ^ in2[16];
    assign G_0[10] = in1[15] & in2[15];
    assign P_0[10] = in1[15] ^ in2[15];
    assign G_0[11] = in1[14] & in2[14];
    assign P_0[11] = in1[14] ^ in2[14];
    assign G_0[12] = in1[13] & in2[13];
    assign P_0[12] = in1[13] ^ in2[13];
    assign G_0[13] = in1[12] & in2[12];
    assign P_0[13] = in1[12] ^ in2[12];
    assign G_0[14] = in1[11] & in2[11];
    assign P_0[14] = in1[11] ^ in2[11];
    assign G_0[15] = in1[10] & in2[10];
    assign P_0[15] = in1[10] ^ in2[10];
    assign G_0[16] = in1[9] & in2[9];
    assign P_0[16] = in1[9] ^ in2[9];
    assign G_0[17] = in1[8] & in2[8];
    assign P_0[17] = in1[8] ^ in2[8];
    assign G_0[18] = in1[7] & in2[7];
    assign P_0[18] = in1[7] ^ in2[7];
    assign G_0[19] = in1[6] & in2[6];
    assign P_0[19] = in1[6] ^ in2[6];
    assign G_0[20] = in1[5] & in2[5];
    assign P_0[20] = in1[5] ^ in2[5];
    assign G_0[21] = in1[4] & in2[4];
    assign P_0[21] = in1[4] ^ in2[4];
    assign G_0[22] = in1[3] & in2[3];
    assign P_0[22] = in1[3] ^ in2[3];
    assign G_0[23] = in1[2] & in2[2];
    assign P_0[23] = in1[2] ^ in2[2];
    assign G_0[24] = in1[1] & in2[1];
    assign P_0[24] = in1[1] ^ in2[1];
    assign G_0[25] = in1[0] & in2[0];
    assign P_0[25] = in1[0] ^ in2[0];



    /*Stage 1*/
    gray_cell level_1_0(cin, P_0[0], G_0[0], G_1[0]);
    black_cell level_0_1(G_0[0], P_0[1], G_0[1], P_0[0], G_1[1], P_1[1]);
    black_cell level_0_2(G_0[1], P_0[2], G_0[2], P_0[1], G_1[2], P_1[2]);
    black_cell level_0_3(G_0[2], P_0[3], G_0[3], P_0[2], G_1[3], P_1[3]);
    black_cell level_0_4(G_0[3], P_0[4], G_0[4], P_0[3], G_1[4], P_1[4]);
    black_cell level_0_5(G_0[4], P_0[5], G_0[5], P_0[4], G_1[5], P_1[5]);
    black_cell level_0_6(G_0[5], P_0[6], G_0[6], P_0[5], G_1[6], P_1[6]);
    black_cell level_0_7(G_0[6], P_0[7], G_0[7], P_0[6], G_1[7], P_1[7]);
    black_cell level_0_8(G_0[7], P_0[8], G_0[8], P_0[7], G_1[8], P_1[8]);
    black_cell level_0_9(G_0[8], P_0[9], G_0[9], P_0[8], G_1[9], P_1[9]);
    black_cell level_0_10(G_0[9], P_0[10], G_0[10], P_0[9], G_1[10], P_1[10]);
    black_cell level_0_11(G_0[10], P_0[11], G_0[11], P_0[10], G_1[11], P_1[11]);
    black_cell level_0_12(G_0[11], P_0[12], G_0[12], P_0[11], G_1[12], P_1[12]);
    black_cell level_0_13(G_0[12], P_0[13], G_0[13], P_0[12], G_1[13], P_1[13]);
    black_cell level_0_14(G_0[13], P_0[14], G_0[14], P_0[13], G_1[14], P_1[14]);
    black_cell level_0_15(G_0[14], P_0[15], G_0[15], P_0[14], G_1[15], P_1[15]);
    black_cell level_0_16(G_0[15], P_0[16], G_0[16], P_0[15], G_1[16], P_1[16]);
    black_cell level_0_17(G_0[16], P_0[17], G_0[17], P_0[16], G_1[17], P_1[17]);
    black_cell level_0_18(G_0[17], P_0[18], G_0[18], P_0[17], G_1[18], P_1[18]);
    black_cell level_0_19(G_0[18], P_0[19], G_0[19], P_0[18], G_1[19], P_1[19]);
    black_cell level_0_20(G_0[19], P_0[20], G_0[20], P_0[19], G_1[20], P_1[20]);
    black_cell level_0_21(G_0[20], P_0[21], G_0[21], P_0[20], G_1[21], P_1[21]);
    black_cell level_0_22(G_0[21], P_0[22], G_0[22], P_0[21], G_1[22], P_1[22]);
    black_cell level_0_23(G_0[22], P_0[23], G_0[23], P_0[22], G_1[23], P_1[23]);
    black_cell level_0_24(G_0[23], P_0[24], G_0[24], P_0[23], G_1[24], P_1[24]);
    black_cell level_0_25(G_0[24], P_0[25], G_0[25], P_0[24], G_1[25], P_1[25]);

    /*Stage 2*/
    gray_cell level_2_1(cin, P_1[1], G_1[1], G_2[1]);
    gray_cell level_2_2(G_1[0], P_1[2], G_1[2], G_2[2]);
    black_cell level_1_3(G_1[1], P_1[3], G_1[3], P_1[1], G_2[3], P_2[3]);
    black_cell level_1_4(G_1[2], P_1[4], G_1[4], P_1[2], G_2[4], P_2[4]);
    black_cell level_1_5(G_1[3], P_1[5], G_1[5], P_1[3], G_2[5], P_2[5]);
    black_cell level_1_6(G_1[4], P_1[6], G_1[6], P_1[4], G_2[6], P_2[6]);
    black_cell level_1_7(G_1[5], P_1[7], G_1[7], P_1[5], G_2[7], P_2[7]);
    black_cell level_1_8(G_1[6], P_1[8], G_1[8], P_1[6], G_2[8], P_2[8]);
    black_cell level_1_9(G_1[7], P_1[9], G_1[9], P_1[7], G_2[9], P_2[9]);
    black_cell level_1_10(G_1[8], P_1[10], G_1[10], P_1[8], G_2[10], P_2[10]);
    black_cell level_1_11(G_1[9], P_1[11], G_1[11], P_1[9], G_2[11], P_2[11]);
    black_cell level_1_12(G_1[10], P_1[12], G_1[12], P_1[10], G_2[12], P_2[12]);
    black_cell level_1_13(G_1[11], P_1[13], G_1[13], P_1[11], G_2[13], P_2[13]);
    black_cell level_1_14(G_1[12], P_1[14], G_1[14], P_1[12], G_2[14], P_2[14]);
    black_cell level_1_15(G_1[13], P_1[15], G_1[15], P_1[13], G_2[15], P_2[15]);
    black_cell level_1_16(G_1[14], P_1[16], G_1[16], P_1[14], G_2[16], P_2[16]);
    black_cell level_1_17(G_1[15], P_1[17], G_1[17], P_1[15], G_2[17], P_2[17]);
    black_cell level_1_18(G_1[16], P_1[18], G_1[18], P_1[16], G_2[18], P_2[18]);
    black_cell level_1_19(G_1[17], P_1[19], G_1[19], P_1[17], G_2[19], P_2[19]);
    black_cell level_1_20(G_1[18], P_1[20], G_1[20], P_1[18], G_2[20], P_2[20]);
    black_cell level_1_21(G_1[19], P_1[21], G_1[21], P_1[19], G_2[21], P_2[21]);
    black_cell level_1_22(G_1[20], P_1[22], G_1[22], P_1[20], G_2[22], P_2[22]);
    black_cell level_1_23(G_1[21], P_1[23], G_1[23], P_1[21], G_2[23], P_2[23]);
    black_cell level_1_24(G_1[22], P_1[24], G_1[24], P_1[22], G_2[24], P_2[24]);
    black_cell level_1_25(G_1[23], P_1[25], G_1[25], P_1[23], G_2[25], P_2[25]);

    /*Stage 3*/
    gray_cell level_3_3(cin, P_2[3], G_2[3], G_3[3]);
    gray_cell level_3_4(G_1[0], P_2[4], G_2[4], G_3[4]);
    gray_cell level_3_5(G_2[1], P_2[5], G_2[5], G_3[5]);
    gray_cell level_3_6(G_2[2], P_2[6], G_2[6], G_3[6]);
    black_cell level_2_7(G_2[3], P_2[7], G_2[7], P_2[3], G_3[7], P_3[7]);
    black_cell level_2_8(G_2[4], P_2[8], G_2[8], P_2[4], G_3[8], P_3[8]);
    black_cell level_2_9(G_2[5], P_2[9], G_2[9], P_2[5], G_3[9], P_3[9]);
    black_cell level_2_10(G_2[6], P_2[10], G_2[10], P_2[6], G_3[10], P_3[10]);
    black_cell level_2_11(G_2[7], P_2[11], G_2[11], P_2[7], G_3[11], P_3[11]);
    black_cell level_2_12(G_2[8], P_2[12], G_2[12], P_2[8], G_3[12], P_3[12]);
    black_cell level_2_13(G_2[9], P_2[13], G_2[13], P_2[9], G_3[13], P_3[13]);
    black_cell level_2_14(G_2[10], P_2[14], G_2[14], P_2[10], G_3[14], P_3[14]);
    black_cell level_2_15(G_2[11], P_2[15], G_2[15], P_2[11], G_3[15], P_3[15]);
    black_cell level_2_16(G_2[12], P_2[16], G_2[16], P_2[12], G_3[16], P_3[16]);
    black_cell level_2_17(G_2[13], P_2[17], G_2[17], P_2[13], G_3[17], P_3[17]);
    black_cell level_2_18(G_2[14], P_2[18], G_2[18], P_2[14], G_3[18], P_3[18]);
    black_cell level_2_19(G_2[15], P_2[19], G_2[19], P_2[15], G_3[19], P_3[19]);
    black_cell level_2_20(G_2[16], P_2[20], G_2[20], P_2[16], G_3[20], P_3[20]);
    black_cell level_2_21(G_2[17], P_2[21], G_2[21], P_2[17], G_3[21], P_3[21]);
    black_cell level_2_22(G_2[18], P_2[22], G_2[22], P_2[18], G_3[22], P_3[22]);
    black_cell level_2_23(G_2[19], P_2[23], G_2[23], P_2[19], G_3[23], P_3[23]);
    black_cell level_2_24(G_2[20], P_2[24], G_2[24], P_2[20], G_3[24], P_3[24]);
    black_cell level_2_25(G_2[21], P_2[25], G_2[25], P_2[21], G_3[25], P_3[25]);

    /*Stage 4*/
    gray_cell level_4_7(cin, P_3[7], G_3[7], G_4[7]);
    gray_cell level_4_8(G_1[0], P_3[8], G_3[8], G_4[8]);
    gray_cell level_4_9(G_2[1], P_3[9], G_3[9], G_4[9]);
    gray_cell level_4_10(G_2[2], P_3[10], G_3[10], G_4[10]);
    gray_cell level_4_11(G_3[3], P_3[11], G_3[11], G_4[11]);
    gray_cell level_4_12(G_3[4], P_3[12], G_3[12], G_4[12]);
    gray_cell level_4_13(G_3[5], P_3[13], G_3[13], G_4[13]);
    gray_cell level_4_14(G_3[6], P_3[14], G_3[14], G_4[14]);
    black_cell level_3_15(G_3[7], P_3[15], G_3[15], P_3[7], G_4[15], P_4[15]);
    black_cell level_3_16(G_3[8], P_3[16], G_3[16], P_3[8], G_4[16], P_4[16]);
    black_cell level_3_17(G_3[9], P_3[17], G_3[17], P_3[9], G_4[17], P_4[17]);
    black_cell level_3_18(G_3[10], P_3[18], G_3[18], P_3[10], G_4[18], P_4[18]);
    black_cell level_3_19(G_3[11], P_3[19], G_3[19], P_3[11], G_4[19], P_4[19]);
    black_cell level_3_20(G_3[12], P_3[20], G_3[20], P_3[12], G_4[20], P_4[20]);
    black_cell level_3_21(G_3[13], P_3[21], G_3[21], P_3[13], G_4[21], P_4[21]);
    black_cell level_3_22(G_3[14], P_3[22], G_3[22], P_3[14], G_4[22], P_4[22]);
    black_cell level_3_23(G_3[15], P_3[23], G_3[23], P_3[15], G_4[23], P_4[23]);
    black_cell level_3_24(G_3[16], P_3[24], G_3[24], P_3[16], G_4[24], P_4[24]);
    black_cell level_3_25(G_3[17], P_3[25], G_3[25], P_3[17], G_4[25], P_4[25]);

    /*Stage 5*/
    gray_cell level_5_15(cin, P_4[15], G_4[15], G_5[15]);
    gray_cell level_5_16(G_1[0], P_4[16], G_4[16], G_5[16]);
    gray_cell level_5_17(G_2[1], P_4[17], G_4[17], G_5[17]);
    gray_cell level_5_18(G_2[2], P_4[18], G_4[18], G_5[18]);
    gray_cell level_5_19(G_3[3], P_4[19], G_4[19], G_5[19]);
    gray_cell level_5_20(G_3[4], P_4[20], G_4[20], G_5[20]);
    gray_cell level_5_21(G_3[5], P_4[21], G_4[21], G_5[21]);
    gray_cell level_5_22(G_3[6], P_4[22], G_4[22], G_5[22]);
    gray_cell level_5_23(G_4[7], P_4[23], G_4[23], G_5[23]);
    gray_cell level_5_24(G_4[8], P_4[24], G_4[24], G_5[24]);
    gray_cell level_5_25(G_4[9], P_4[25], G_4[25], cout);

    assign sum[0] = cin    ^ P_0[0];
    assign sum[1] = G_1[0] ^ P_0[1];
    assign sum[2] = G_2[1] ^ P_0[2];
    assign sum[3] = G_2[2] ^ P_0[3];
    assign sum[4] = G_3[3] ^ P_0[4];
    assign sum[5] = G_3[4] ^ P_0[5];
    assign sum[6] = G_3[5] ^ P_0[6];
    assign sum[7] = G_3[6] ^ P_0[7];
    assign sum[8] = G_4[7] ^ P_0[8];
    assign sum[9] = G_4[8] ^ P_0[9];
    assign sum[10] = G_4[9] ^ P_0[10];
    assign sum[11] = G_4[10] ^ P_0[11];
    assign sum[12] = G_4[11] ^ P_0[12];
    assign sum[13] = G_4[12] ^ P_0[13];
    assign sum[14] = G_4[13] ^ P_0[14];
    assign sum[15] = G_4[14] ^ P_0[15];
    assign sum[16] = G_5[15] ^ P_0[16];
    assign sum[17] = G_5[16] ^ P_0[17];
    assign sum[18] = G_5[17] ^ P_0[18];
    assign sum[19] = G_5[18] ^ P_0[19];
    assign sum[20] = G_5[19] ^ P_0[20];
    assign sum[21] = G_5[20] ^ P_0[21];
    assign sum[22] = G_5[21] ^ P_0[22];
    assign sum[23] = G_5[22] ^ P_0[23];
    assign sum[24] = G_5[23] ^ P_0[24];
    assign sum[25] = G_5[24] ^ P_0[25];
endmodule

module kogge_stone_25(output [24:0] sum,
        output cout,
        input [24:0] in1,
        input [24:0] in2);

    assign cin = 0;
    wire[24:0] G_0;
    wire[24:0] P_0;
    wire[24:0] G_1;
    wire[24:0] P_1;
    wire[24:0] G_2;
    wire[24:0] P_2;
    wire[24:0] G_3;
    wire[24:0] P_3;
    wire[24:0] G_4;
    wire[24:0] P_4;
    wire[24:0] G_5;
    wire[24:0] P_5;

    assign G_0[0] = in1[24] & in2[24];
    assign P_0[0] = in1[24] ^ in2[24];
    assign G_0[1] = in1[23] & in2[23];
    assign P_0[1] = in1[23] ^ in2[23];
    assign G_0[2] = in1[22] & in2[22];
    assign P_0[2] = in1[22] ^ in2[22];
    assign G_0[3] = in1[21] & in2[21];
    assign P_0[3] = in1[21] ^ in2[21];
    assign G_0[4] = in1[20] & in2[20];
    assign P_0[4] = in1[20] ^ in2[20];
    assign G_0[5] = in1[19] & in2[19];
    assign P_0[5] = in1[19] ^ in2[19];
    assign G_0[6] = in1[18] & in2[18];
    assign P_0[6] = in1[18] ^ in2[18];
    assign G_0[7] = in1[17] & in2[17];
    assign P_0[7] = in1[17] ^ in2[17];
    assign G_0[8] = in1[16] & in2[16];
    assign P_0[8] = in1[16] ^ in2[16];
    assign G_0[9] = in1[15] & in2[15];
    assign P_0[9] = in1[15] ^ in2[15];
    assign G_0[10] = in1[14] & in2[14];
    assign P_0[10] = in1[14] ^ in2[14];
    assign G_0[11] = in1[13] & in2[13];
    assign P_0[11] = in1[13] ^ in2[13];
    assign G_0[12] = in1[12] & in2[12];
    assign P_0[12] = in1[12] ^ in2[12];
    assign G_0[13] = in1[11] & in2[11];
    assign P_0[13] = in1[11] ^ in2[11];
    assign G_0[14] = in1[10] & in2[10];
    assign P_0[14] = in1[10] ^ in2[10];
    assign G_0[15] = in1[9] & in2[9];
    assign P_0[15] = in1[9] ^ in2[9];
    assign G_0[16] = in1[8] & in2[8];
    assign P_0[16] = in1[8] ^ in2[8];
    assign G_0[17] = in1[7] & in2[7];
    assign P_0[17] = in1[7] ^ in2[7];
    assign G_0[18] = in1[6] & in2[6];
    assign P_0[18] = in1[6] ^ in2[6];
    assign G_0[19] = in1[5] & in2[5];
    assign P_0[19] = in1[5] ^ in2[5];
    assign G_0[20] = in1[4] & in2[4];
    assign P_0[20] = in1[4] ^ in2[4];
    assign G_0[21] = in1[3] & in2[3];
    assign P_0[21] = in1[3] ^ in2[3];
    assign G_0[22] = in1[2] & in2[2];
    assign P_0[22] = in1[2] ^ in2[2];
    assign G_0[23] = in1[1] & in2[1];
    assign P_0[23] = in1[1] ^ in2[1];
    assign G_0[24] = in1[0] & in2[0];
    assign P_0[24] = in1[0] ^ in2[0];



    /*Stage 1*/
    gray_cell level_1_0(cin, P_0[0], G_0[0], G_1[0]);
    black_cell level_0_1(G_0[0], P_0[1], G_0[1], P_0[0], G_1[1], P_1[1]);
    black_cell level_0_2(G_0[1], P_0[2], G_0[2], P_0[1], G_1[2], P_1[2]);
    black_cell level_0_3(G_0[2], P_0[3], G_0[3], P_0[2], G_1[3], P_1[3]);
    black_cell level_0_4(G_0[3], P_0[4], G_0[4], P_0[3], G_1[4], P_1[4]);
    black_cell level_0_5(G_0[4], P_0[5], G_0[5], P_0[4], G_1[5], P_1[5]);
    black_cell level_0_6(G_0[5], P_0[6], G_0[6], P_0[5], G_1[6], P_1[6]);
    black_cell level_0_7(G_0[6], P_0[7], G_0[7], P_0[6], G_1[7], P_1[7]);
    black_cell level_0_8(G_0[7], P_0[8], G_0[8], P_0[7], G_1[8], P_1[8]);
    black_cell level_0_9(G_0[8], P_0[9], G_0[9], P_0[8], G_1[9], P_1[9]);
    black_cell level_0_10(G_0[9], P_0[10], G_0[10], P_0[9], G_1[10], P_1[10]);
    black_cell level_0_11(G_0[10], P_0[11], G_0[11], P_0[10], G_1[11], P_1[11]);
    black_cell level_0_12(G_0[11], P_0[12], G_0[12], P_0[11], G_1[12], P_1[12]);
    black_cell level_0_13(G_0[12], P_0[13], G_0[13], P_0[12], G_1[13], P_1[13]);
    black_cell level_0_14(G_0[13], P_0[14], G_0[14], P_0[13], G_1[14], P_1[14]);
    black_cell level_0_15(G_0[14], P_0[15], G_0[15], P_0[14], G_1[15], P_1[15]);
    black_cell level_0_16(G_0[15], P_0[16], G_0[16], P_0[15], G_1[16], P_1[16]);
    black_cell level_0_17(G_0[16], P_0[17], G_0[17], P_0[16], G_1[17], P_1[17]);
    black_cell level_0_18(G_0[17], P_0[18], G_0[18], P_0[17], G_1[18], P_1[18]);
    black_cell level_0_19(G_0[18], P_0[19], G_0[19], P_0[18], G_1[19], P_1[19]);
    black_cell level_0_20(G_0[19], P_0[20], G_0[20], P_0[19], G_1[20], P_1[20]);
    black_cell level_0_21(G_0[20], P_0[21], G_0[21], P_0[20], G_1[21], P_1[21]);
    black_cell level_0_22(G_0[21], P_0[22], G_0[22], P_0[21], G_1[22], P_1[22]);
    black_cell level_0_23(G_0[22], P_0[23], G_0[23], P_0[22], G_1[23], P_1[23]);
    black_cell level_0_24(G_0[23], P_0[24], G_0[24], P_0[23], G_1[24], P_1[24]);

    /*Stage 2*/
    gray_cell level_2_1(cin, P_1[1], G_1[1], G_2[1]);
    gray_cell level_2_2(G_1[0], P_1[2], G_1[2], G_2[2]);
    black_cell level_1_3(G_1[1], P_1[3], G_1[3], P_1[1], G_2[3], P_2[3]);
    black_cell level_1_4(G_1[2], P_1[4], G_1[4], P_1[2], G_2[4], P_2[4]);
    black_cell level_1_5(G_1[3], P_1[5], G_1[5], P_1[3], G_2[5], P_2[5]);
    black_cell level_1_6(G_1[4], P_1[6], G_1[6], P_1[4], G_2[6], P_2[6]);
    black_cell level_1_7(G_1[5], P_1[7], G_1[7], P_1[5], G_2[7], P_2[7]);
    black_cell level_1_8(G_1[6], P_1[8], G_1[8], P_1[6], G_2[8], P_2[8]);
    black_cell level_1_9(G_1[7], P_1[9], G_1[9], P_1[7], G_2[9], P_2[9]);
    black_cell level_1_10(G_1[8], P_1[10], G_1[10], P_1[8], G_2[10], P_2[10]);
    black_cell level_1_11(G_1[9], P_1[11], G_1[11], P_1[9], G_2[11], P_2[11]);
    black_cell level_1_12(G_1[10], P_1[12], G_1[12], P_1[10], G_2[12], P_2[12]);
    black_cell level_1_13(G_1[11], P_1[13], G_1[13], P_1[11], G_2[13], P_2[13]);
    black_cell level_1_14(G_1[12], P_1[14], G_1[14], P_1[12], G_2[14], P_2[14]);
    black_cell level_1_15(G_1[13], P_1[15], G_1[15], P_1[13], G_2[15], P_2[15]);
    black_cell level_1_16(G_1[14], P_1[16], G_1[16], P_1[14], G_2[16], P_2[16]);
    black_cell level_1_17(G_1[15], P_1[17], G_1[17], P_1[15], G_2[17], P_2[17]);
    black_cell level_1_18(G_1[16], P_1[18], G_1[18], P_1[16], G_2[18], P_2[18]);
    black_cell level_1_19(G_1[17], P_1[19], G_1[19], P_1[17], G_2[19], P_2[19]);
    black_cell level_1_20(G_1[18], P_1[20], G_1[20], P_1[18], G_2[20], P_2[20]);
    black_cell level_1_21(G_1[19], P_1[21], G_1[21], P_1[19], G_2[21], P_2[21]);
    black_cell level_1_22(G_1[20], P_1[22], G_1[22], P_1[20], G_2[22], P_2[22]);
    black_cell level_1_23(G_1[21], P_1[23], G_1[23], P_1[21], G_2[23], P_2[23]);
    black_cell level_1_24(G_1[22], P_1[24], G_1[24], P_1[22], G_2[24], P_2[24]);

    /*Stage 3*/
    gray_cell level_3_3(cin, P_2[3], G_2[3], G_3[3]);
    gray_cell level_3_4(G_1[0], P_2[4], G_2[4], G_3[4]);
    gray_cell level_3_5(G_2[1], P_2[5], G_2[5], G_3[5]);
    gray_cell level_3_6(G_2[2], P_2[6], G_2[6], G_3[6]);
    black_cell level_2_7(G_2[3], P_2[7], G_2[7], P_2[3], G_3[7], P_3[7]);
    black_cell level_2_8(G_2[4], P_2[8], G_2[8], P_2[4], G_3[8], P_3[8]);
    black_cell level_2_9(G_2[5], P_2[9], G_2[9], P_2[5], G_3[9], P_3[9]);
    black_cell level_2_10(G_2[6], P_2[10], G_2[10], P_2[6], G_3[10], P_3[10]);
    black_cell level_2_11(G_2[7], P_2[11], G_2[11], P_2[7], G_3[11], P_3[11]);
    black_cell level_2_12(G_2[8], P_2[12], G_2[12], P_2[8], G_3[12], P_3[12]);
    black_cell level_2_13(G_2[9], P_2[13], G_2[13], P_2[9], G_3[13], P_3[13]);
    black_cell level_2_14(G_2[10], P_2[14], G_2[14], P_2[10], G_3[14], P_3[14]);
    black_cell level_2_15(G_2[11], P_2[15], G_2[15], P_2[11], G_3[15], P_3[15]);
    black_cell level_2_16(G_2[12], P_2[16], G_2[16], P_2[12], G_3[16], P_3[16]);
    black_cell level_2_17(G_2[13], P_2[17], G_2[17], P_2[13], G_3[17], P_3[17]);
    black_cell level_2_18(G_2[14], P_2[18], G_2[18], P_2[14], G_3[18], P_3[18]);
    black_cell level_2_19(G_2[15], P_2[19], G_2[19], P_2[15], G_3[19], P_3[19]);
    black_cell level_2_20(G_2[16], P_2[20], G_2[20], P_2[16], G_3[20], P_3[20]);
    black_cell level_2_21(G_2[17], P_2[21], G_2[21], P_2[17], G_3[21], P_3[21]);
    black_cell level_2_22(G_2[18], P_2[22], G_2[22], P_2[18], G_3[22], P_3[22]);
    black_cell level_2_23(G_2[19], P_2[23], G_2[23], P_2[19], G_3[23], P_3[23]);
    black_cell level_2_24(G_2[20], P_2[24], G_2[24], P_2[20], G_3[24], P_3[24]);

    /*Stage 4*/
    gray_cell level_4_7(cin, P_3[7], G_3[7], G_4[7]);
    gray_cell level_4_8(G_1[0], P_3[8], G_3[8], G_4[8]);
    gray_cell level_4_9(G_2[1], P_3[9], G_3[9], G_4[9]);
    gray_cell level_4_10(G_2[2], P_3[10], G_3[10], G_4[10]);
    gray_cell level_4_11(G_3[3], P_3[11], G_3[11], G_4[11]);
    gray_cell level_4_12(G_3[4], P_3[12], G_3[12], G_4[12]);
    gray_cell level_4_13(G_3[5], P_3[13], G_3[13], G_4[13]);
    gray_cell level_4_14(G_3[6], P_3[14], G_3[14], G_4[14]);
    black_cell level_3_15(G_3[7], P_3[15], G_3[15], P_3[7], G_4[15], P_4[15]);
    black_cell level_3_16(G_3[8], P_3[16], G_3[16], P_3[8], G_4[16], P_4[16]);
    black_cell level_3_17(G_3[9], P_3[17], G_3[17], P_3[9], G_4[17], P_4[17]);
    black_cell level_3_18(G_3[10], P_3[18], G_3[18], P_3[10], G_4[18], P_4[18]);
    black_cell level_3_19(G_3[11], P_3[19], G_3[19], P_3[11], G_4[19], P_4[19]);
    black_cell level_3_20(G_3[12], P_3[20], G_3[20], P_3[12], G_4[20], P_4[20]);
    black_cell level_3_21(G_3[13], P_3[21], G_3[21], P_3[13], G_4[21], P_4[21]);
    black_cell level_3_22(G_3[14], P_3[22], G_3[22], P_3[14], G_4[22], P_4[22]);
    black_cell level_3_23(G_3[15], P_3[23], G_3[23], P_3[15], G_4[23], P_4[23]);
    black_cell level_3_24(G_3[16], P_3[24], G_3[24], P_3[16], G_4[24], P_4[24]);

    /*Stage 5*/
    gray_cell level_5_15(cin, P_4[15], G_4[15], G_5[15]);
    gray_cell level_5_16(G_1[0], P_4[16], G_4[16], G_5[16]);
    gray_cell level_5_17(G_2[1], P_4[17], G_4[17], G_5[17]);
    gray_cell level_5_18(G_2[2], P_4[18], G_4[18], G_5[18]);
    gray_cell level_5_19(G_3[3], P_4[19], G_4[19], G_5[19]);
    gray_cell level_5_20(G_3[4], P_4[20], G_4[20], G_5[20]);
    gray_cell level_5_21(G_3[5], P_4[21], G_4[21], G_5[21]);
    gray_cell level_5_22(G_3[6], P_4[22], G_4[22], G_5[22]);
    gray_cell level_5_23(G_4[7], P_4[23], G_4[23], G_5[23]);
    gray_cell level_5_24(G_4[8], P_4[24], G_4[24], cout);

    assign sum[0] = cin    ^ P_0[0];
    assign sum[1] = G_1[0] ^ P_0[1];
    assign sum[2] = G_2[1] ^ P_0[2];
    assign sum[3] = G_2[2] ^ P_0[3];
    assign sum[4] = G_3[3] ^ P_0[4];
    assign sum[5] = G_3[4] ^ P_0[5];
    assign sum[6] = G_3[5] ^ P_0[6];
    assign sum[7] = G_3[6] ^ P_0[7];
    assign sum[8] = G_4[7] ^ P_0[8];
    assign sum[9] = G_4[8] ^ P_0[9];
    assign sum[10] = G_4[9] ^ P_0[10];
    assign sum[11] = G_4[10] ^ P_0[11];
    assign sum[12] = G_4[11] ^ P_0[12];
    assign sum[13] = G_4[12] ^ P_0[13];
    assign sum[14] = G_4[13] ^ P_0[14];
    assign sum[15] = G_4[14] ^ P_0[15];
    assign sum[16] = G_5[15] ^ P_0[16];
    assign sum[17] = G_5[16] ^ P_0[17];
    assign sum[18] = G_5[17] ^ P_0[18];
    assign sum[19] = G_5[18] ^ P_0[19];
    assign sum[20] = G_5[19] ^ P_0[20];
    assign sum[21] = G_5[20] ^ P_0[21];
    assign sum[22] = G_5[21] ^ P_0[22];
    assign sum[23] = G_5[22] ^ P_0[23];
    assign sum[24] = G_5[23] ^ P_0[24];
endmodule

module kogge_stone_24(output [23:0] sum,
        output cout,
        input [23:0] in1,
        input [23:0] in2);

    assign cin = 0;
    wire[23:0] G_0;
    wire[23:0] P_0;
    wire[23:0] G_1;
    wire[23:0] P_1;
    wire[23:0] G_2;
    wire[23:0] P_2;
    wire[23:0] G_3;
    wire[23:0] P_3;
    wire[23:0] G_4;
    wire[23:0] P_4;
    wire[23:0] G_5;
    wire[23:0] P_5;

    assign G_0[0] = in1[23] & in2[23];
    assign P_0[0] = in1[23] ^ in2[23];
    assign G_0[1] = in1[22] & in2[22];
    assign P_0[1] = in1[22] ^ in2[22];
    assign G_0[2] = in1[21] & in2[21];
    assign P_0[2] = in1[21] ^ in2[21];
    assign G_0[3] = in1[20] & in2[20];
    assign P_0[3] = in1[20] ^ in2[20];
    assign G_0[4] = in1[19] & in2[19];
    assign P_0[4] = in1[19] ^ in2[19];
    assign G_0[5] = in1[18] & in2[18];
    assign P_0[5] = in1[18] ^ in2[18];
    assign G_0[6] = in1[17] & in2[17];
    assign P_0[6] = in1[17] ^ in2[17];
    assign G_0[7] = in1[16] & in2[16];
    assign P_0[7] = in1[16] ^ in2[16];
    assign G_0[8] = in1[15] & in2[15];
    assign P_0[8] = in1[15] ^ in2[15];
    assign G_0[9] = in1[14] & in2[14];
    assign P_0[9] = in1[14] ^ in2[14];
    assign G_0[10] = in1[13] & in2[13];
    assign P_0[10] = in1[13] ^ in2[13];
    assign G_0[11] = in1[12] & in2[12];
    assign P_0[11] = in1[12] ^ in2[12];
    assign G_0[12] = in1[11] & in2[11];
    assign P_0[12] = in1[11] ^ in2[11];
    assign G_0[13] = in1[10] & in2[10];
    assign P_0[13] = in1[10] ^ in2[10];
    assign G_0[14] = in1[9] & in2[9];
    assign P_0[14] = in1[9] ^ in2[9];
    assign G_0[15] = in1[8] & in2[8];
    assign P_0[15] = in1[8] ^ in2[8];
    assign G_0[16] = in1[7] & in2[7];
    assign P_0[16] = in1[7] ^ in2[7];
    assign G_0[17] = in1[6] & in2[6];
    assign P_0[17] = in1[6] ^ in2[6];
    assign G_0[18] = in1[5] & in2[5];
    assign P_0[18] = in1[5] ^ in2[5];
    assign G_0[19] = in1[4] & in2[4];
    assign P_0[19] = in1[4] ^ in2[4];
    assign G_0[20] = in1[3] & in2[3];
    assign P_0[20] = in1[3] ^ in2[3];
    assign G_0[21] = in1[2] & in2[2];
    assign P_0[21] = in1[2] ^ in2[2];
    assign G_0[22] = in1[1] & in2[1];
    assign P_0[22] = in1[1] ^ in2[1];
    assign G_0[23] = in1[0] & in2[0];
    assign P_0[23] = in1[0] ^ in2[0];



    /*Stage 1*/
    gray_cell level_1_0(cin, P_0[0], G_0[0], G_1[0]);
    black_cell level_0_1(G_0[0], P_0[1], G_0[1], P_0[0], G_1[1], P_1[1]);
    black_cell level_0_2(G_0[1], P_0[2], G_0[2], P_0[1], G_1[2], P_1[2]);
    black_cell level_0_3(G_0[2], P_0[3], G_0[3], P_0[2], G_1[3], P_1[3]);
    black_cell level_0_4(G_0[3], P_0[4], G_0[4], P_0[3], G_1[4], P_1[4]);
    black_cell level_0_5(G_0[4], P_0[5], G_0[5], P_0[4], G_1[5], P_1[5]);
    black_cell level_0_6(G_0[5], P_0[6], G_0[6], P_0[5], G_1[6], P_1[6]);
    black_cell level_0_7(G_0[6], P_0[7], G_0[7], P_0[6], G_1[7], P_1[7]);
    black_cell level_0_8(G_0[7], P_0[8], G_0[8], P_0[7], G_1[8], P_1[8]);
    black_cell level_0_9(G_0[8], P_0[9], G_0[9], P_0[8], G_1[9], P_1[9]);
    black_cell level_0_10(G_0[9], P_0[10], G_0[10], P_0[9], G_1[10], P_1[10]);
    black_cell level_0_11(G_0[10], P_0[11], G_0[11], P_0[10], G_1[11], P_1[11]);
    black_cell level_0_12(G_0[11], P_0[12], G_0[12], P_0[11], G_1[12], P_1[12]);
    black_cell level_0_13(G_0[12], P_0[13], G_0[13], P_0[12], G_1[13], P_1[13]);
    black_cell level_0_14(G_0[13], P_0[14], G_0[14], P_0[13], G_1[14], P_1[14]);
    black_cell level_0_15(G_0[14], P_0[15], G_0[15], P_0[14], G_1[15], P_1[15]);
    black_cell level_0_16(G_0[15], P_0[16], G_0[16], P_0[15], G_1[16], P_1[16]);
    black_cell level_0_17(G_0[16], P_0[17], G_0[17], P_0[16], G_1[17], P_1[17]);
    black_cell level_0_18(G_0[17], P_0[18], G_0[18], P_0[17], G_1[18], P_1[18]);
    black_cell level_0_19(G_0[18], P_0[19], G_0[19], P_0[18], G_1[19], P_1[19]);
    black_cell level_0_20(G_0[19], P_0[20], G_0[20], P_0[19], G_1[20], P_1[20]);
    black_cell level_0_21(G_0[20], P_0[21], G_0[21], P_0[20], G_1[21], P_1[21]);
    black_cell level_0_22(G_0[21], P_0[22], G_0[22], P_0[21], G_1[22], P_1[22]);
    black_cell level_0_23(G_0[22], P_0[23], G_0[23], P_0[22], G_1[23], P_1[23]);

    /*Stage 2*/
    gray_cell level_2_1(cin, P_1[1], G_1[1], G_2[1]);
    gray_cell level_2_2(G_1[0], P_1[2], G_1[2], G_2[2]);
    black_cell level_1_3(G_1[1], P_1[3], G_1[3], P_1[1], G_2[3], P_2[3]);
    black_cell level_1_4(G_1[2], P_1[4], G_1[4], P_1[2], G_2[4], P_2[4]);
    black_cell level_1_5(G_1[3], P_1[5], G_1[5], P_1[3], G_2[5], P_2[5]);
    black_cell level_1_6(G_1[4], P_1[6], G_1[6], P_1[4], G_2[6], P_2[6]);
    black_cell level_1_7(G_1[5], P_1[7], G_1[7], P_1[5], G_2[7], P_2[7]);
    black_cell level_1_8(G_1[6], P_1[8], G_1[8], P_1[6], G_2[8], P_2[8]);
    black_cell level_1_9(G_1[7], P_1[9], G_1[9], P_1[7], G_2[9], P_2[9]);
    black_cell level_1_10(G_1[8], P_1[10], G_1[10], P_1[8], G_2[10], P_2[10]);
    black_cell level_1_11(G_1[9], P_1[11], G_1[11], P_1[9], G_2[11], P_2[11]);
    black_cell level_1_12(G_1[10], P_1[12], G_1[12], P_1[10], G_2[12], P_2[12]);
    black_cell level_1_13(G_1[11], P_1[13], G_1[13], P_1[11], G_2[13], P_2[13]);
    black_cell level_1_14(G_1[12], P_1[14], G_1[14], P_1[12], G_2[14], P_2[14]);
    black_cell level_1_15(G_1[13], P_1[15], G_1[15], P_1[13], G_2[15], P_2[15]);
    black_cell level_1_16(G_1[14], P_1[16], G_1[16], P_1[14], G_2[16], P_2[16]);
    black_cell level_1_17(G_1[15], P_1[17], G_1[17], P_1[15], G_2[17], P_2[17]);
    black_cell level_1_18(G_1[16], P_1[18], G_1[18], P_1[16], G_2[18], P_2[18]);
    black_cell level_1_19(G_1[17], P_1[19], G_1[19], P_1[17], G_2[19], P_2[19]);
    black_cell level_1_20(G_1[18], P_1[20], G_1[20], P_1[18], G_2[20], P_2[20]);
    black_cell level_1_21(G_1[19], P_1[21], G_1[21], P_1[19], G_2[21], P_2[21]);
    black_cell level_1_22(G_1[20], P_1[22], G_1[22], P_1[20], G_2[22], P_2[22]);
    black_cell level_1_23(G_1[21], P_1[23], G_1[23], P_1[21], G_2[23], P_2[23]);

    /*Stage 3*/
    gray_cell level_3_3(cin, P_2[3], G_2[3], G_3[3]);
    gray_cell level_3_4(G_1[0], P_2[4], G_2[4], G_3[4]);
    gray_cell level_3_5(G_2[1], P_2[5], G_2[5], G_3[5]);
    gray_cell level_3_6(G_2[2], P_2[6], G_2[6], G_3[6]);
    black_cell level_2_7(G_2[3], P_2[7], G_2[7], P_2[3], G_3[7], P_3[7]);
    black_cell level_2_8(G_2[4], P_2[8], G_2[8], P_2[4], G_3[8], P_3[8]);
    black_cell level_2_9(G_2[5], P_2[9], G_2[9], P_2[5], G_3[9], P_3[9]);
    black_cell level_2_10(G_2[6], P_2[10], G_2[10], P_2[6], G_3[10], P_3[10]);
    black_cell level_2_11(G_2[7], P_2[11], G_2[11], P_2[7], G_3[11], P_3[11]);
    black_cell level_2_12(G_2[8], P_2[12], G_2[12], P_2[8], G_3[12], P_3[12]);
    black_cell level_2_13(G_2[9], P_2[13], G_2[13], P_2[9], G_3[13], P_3[13]);
    black_cell level_2_14(G_2[10], P_2[14], G_2[14], P_2[10], G_3[14], P_3[14]);
    black_cell level_2_15(G_2[11], P_2[15], G_2[15], P_2[11], G_3[15], P_3[15]);
    black_cell level_2_16(G_2[12], P_2[16], G_2[16], P_2[12], G_3[16], P_3[16]);
    black_cell level_2_17(G_2[13], P_2[17], G_2[17], P_2[13], G_3[17], P_3[17]);
    black_cell level_2_18(G_2[14], P_2[18], G_2[18], P_2[14], G_3[18], P_3[18]);
    black_cell level_2_19(G_2[15], P_2[19], G_2[19], P_2[15], G_3[19], P_3[19]);
    black_cell level_2_20(G_2[16], P_2[20], G_2[20], P_2[16], G_3[20], P_3[20]);
    black_cell level_2_21(G_2[17], P_2[21], G_2[21], P_2[17], G_3[21], P_3[21]);
    black_cell level_2_22(G_2[18], P_2[22], G_2[22], P_2[18], G_3[22], P_3[22]);
    black_cell level_2_23(G_2[19], P_2[23], G_2[23], P_2[19], G_3[23], P_3[23]);

    /*Stage 4*/
    gray_cell level_4_7(cin, P_3[7], G_3[7], G_4[7]);
    gray_cell level_4_8(G_1[0], P_3[8], G_3[8], G_4[8]);
    gray_cell level_4_9(G_2[1], P_3[9], G_3[9], G_4[9]);
    gray_cell level_4_10(G_2[2], P_3[10], G_3[10], G_4[10]);
    gray_cell level_4_11(G_3[3], P_3[11], G_3[11], G_4[11]);
    gray_cell level_4_12(G_3[4], P_3[12], G_3[12], G_4[12]);
    gray_cell level_4_13(G_3[5], P_3[13], G_3[13], G_4[13]);
    gray_cell level_4_14(G_3[6], P_3[14], G_3[14], G_4[14]);
    black_cell level_3_15(G_3[7], P_3[15], G_3[15], P_3[7], G_4[15], P_4[15]);
    black_cell level_3_16(G_3[8], P_3[16], G_3[16], P_3[8], G_4[16], P_4[16]);
    black_cell level_3_17(G_3[9], P_3[17], G_3[17], P_3[9], G_4[17], P_4[17]);
    black_cell level_3_18(G_3[10], P_3[18], G_3[18], P_3[10], G_4[18], P_4[18]);
    black_cell level_3_19(G_3[11], P_3[19], G_3[19], P_3[11], G_4[19], P_4[19]);
    black_cell level_3_20(G_3[12], P_3[20], G_3[20], P_3[12], G_4[20], P_4[20]);
    black_cell level_3_21(G_3[13], P_3[21], G_3[21], P_3[13], G_4[21], P_4[21]);
    black_cell level_3_22(G_3[14], P_3[22], G_3[22], P_3[14], G_4[22], P_4[22]);
    black_cell level_3_23(G_3[15], P_3[23], G_3[23], P_3[15], G_4[23], P_4[23]);

    /*Stage 5*/
    gray_cell level_5_15(cin, P_4[15], G_4[15], G_5[15]);
    gray_cell level_5_16(G_1[0], P_4[16], G_4[16], G_5[16]);
    gray_cell level_5_17(G_2[1], P_4[17], G_4[17], G_5[17]);
    gray_cell level_5_18(G_2[2], P_4[18], G_4[18], G_5[18]);
    gray_cell level_5_19(G_3[3], P_4[19], G_4[19], G_5[19]);
    gray_cell level_5_20(G_3[4], P_4[20], G_4[20], G_5[20]);
    gray_cell level_5_21(G_3[5], P_4[21], G_4[21], G_5[21]);
    gray_cell level_5_22(G_3[6], P_4[22], G_4[22], G_5[22]);
    gray_cell level_5_23(G_4[7], P_4[23], G_4[23], cout);

    assign sum[0] = cin    ^ P_0[0];
    assign sum[1] = G_1[0] ^ P_0[1];
    assign sum[2] = G_2[1] ^ P_0[2];
    assign sum[3] = G_2[2] ^ P_0[3];
    assign sum[4] = G_3[3] ^ P_0[4];
    assign sum[5] = G_3[4] ^ P_0[5];
    assign sum[6] = G_3[5] ^ P_0[6];
    assign sum[7] = G_3[6] ^ P_0[7];
    assign sum[8] = G_4[7] ^ P_0[8];
    assign sum[9] = G_4[8] ^ P_0[9];
    assign sum[10] = G_4[9] ^ P_0[10];
    assign sum[11] = G_4[10] ^ P_0[11];
    assign sum[12] = G_4[11] ^ P_0[12];
    assign sum[13] = G_4[12] ^ P_0[13];
    assign sum[14] = G_4[13] ^ P_0[14];
    assign sum[15] = G_4[14] ^ P_0[15];
    assign sum[16] = G_5[15] ^ P_0[16];
    assign sum[17] = G_5[16] ^ P_0[17];
    assign sum[18] = G_5[17] ^ P_0[18];
    assign sum[19] = G_5[18] ^ P_0[19];
    assign sum[20] = G_5[19] ^ P_0[20];
    assign sum[21] = G_5[20] ^ P_0[21];
    assign sum[22] = G_5[21] ^ P_0[22];
    assign sum[23] = G_5[22] ^ P_0[23];
endmodule

module kogge_stone_23(output [22:0] sum,
        output cout,
        input [22:0] in1,
        input [22:0] in2);

    assign cin = 0;
    wire[22:0] G_0;
    wire[22:0] P_0;
    wire[22:0] G_1;
    wire[22:0] P_1;
    wire[22:0] G_2;
    wire[22:0] P_2;
    wire[22:0] G_3;
    wire[22:0] P_3;
    wire[22:0] G_4;
    wire[22:0] P_4;
    wire[22:0] G_5;
    wire[22:0] P_5;

    assign G_0[0] = in1[22] & in2[22];
    assign P_0[0] = in1[22] ^ in2[22];
    assign G_0[1] = in1[21] & in2[21];
    assign P_0[1] = in1[21] ^ in2[21];
    assign G_0[2] = in1[20] & in2[20];
    assign P_0[2] = in1[20] ^ in2[20];
    assign G_0[3] = in1[19] & in2[19];
    assign P_0[3] = in1[19] ^ in2[19];
    assign G_0[4] = in1[18] & in2[18];
    assign P_0[4] = in1[18] ^ in2[18];
    assign G_0[5] = in1[17] & in2[17];
    assign P_0[5] = in1[17] ^ in2[17];
    assign G_0[6] = in1[16] & in2[16];
    assign P_0[6] = in1[16] ^ in2[16];
    assign G_0[7] = in1[15] & in2[15];
    assign P_0[7] = in1[15] ^ in2[15];
    assign G_0[8] = in1[14] & in2[14];
    assign P_0[8] = in1[14] ^ in2[14];
    assign G_0[9] = in1[13] & in2[13];
    assign P_0[9] = in1[13] ^ in2[13];
    assign G_0[10] = in1[12] & in2[12];
    assign P_0[10] = in1[12] ^ in2[12];
    assign G_0[11] = in1[11] & in2[11];
    assign P_0[11] = in1[11] ^ in2[11];
    assign G_0[12] = in1[10] & in2[10];
    assign P_0[12] = in1[10] ^ in2[10];
    assign G_0[13] = in1[9] & in2[9];
    assign P_0[13] = in1[9] ^ in2[9];
    assign G_0[14] = in1[8] & in2[8];
    assign P_0[14] = in1[8] ^ in2[8];
    assign G_0[15] = in1[7] & in2[7];
    assign P_0[15] = in1[7] ^ in2[7];
    assign G_0[16] = in1[6] & in2[6];
    assign P_0[16] = in1[6] ^ in2[6];
    assign G_0[17] = in1[5] & in2[5];
    assign P_0[17] = in1[5] ^ in2[5];
    assign G_0[18] = in1[4] & in2[4];
    assign P_0[18] = in1[4] ^ in2[4];
    assign G_0[19] = in1[3] & in2[3];
    assign P_0[19] = in1[3] ^ in2[3];
    assign G_0[20] = in1[2] & in2[2];
    assign P_0[20] = in1[2] ^ in2[2];
    assign G_0[21] = in1[1] & in2[1];
    assign P_0[21] = in1[1] ^ in2[1];
    assign G_0[22] = in1[0] & in2[0];
    assign P_0[22] = in1[0] ^ in2[0];



    /*Stage 1*/
    gray_cell level_1_0(cin, P_0[0], G_0[0], G_1[0]);
    black_cell level_0_1(G_0[0], P_0[1], G_0[1], P_0[0], G_1[1], P_1[1]);
    black_cell level_0_2(G_0[1], P_0[2], G_0[2], P_0[1], G_1[2], P_1[2]);
    black_cell level_0_3(G_0[2], P_0[3], G_0[3], P_0[2], G_1[3], P_1[3]);
    black_cell level_0_4(G_0[3], P_0[4], G_0[4], P_0[3], G_1[4], P_1[4]);
    black_cell level_0_5(G_0[4], P_0[5], G_0[5], P_0[4], G_1[5], P_1[5]);
    black_cell level_0_6(G_0[5], P_0[6], G_0[6], P_0[5], G_1[6], P_1[6]);
    black_cell level_0_7(G_0[6], P_0[7], G_0[7], P_0[6], G_1[7], P_1[7]);
    black_cell level_0_8(G_0[7], P_0[8], G_0[8], P_0[7], G_1[8], P_1[8]);
    black_cell level_0_9(G_0[8], P_0[9], G_0[9], P_0[8], G_1[9], P_1[9]);
    black_cell level_0_10(G_0[9], P_0[10], G_0[10], P_0[9], G_1[10], P_1[10]);
    black_cell level_0_11(G_0[10], P_0[11], G_0[11], P_0[10], G_1[11], P_1[11]);
    black_cell level_0_12(G_0[11], P_0[12], G_0[12], P_0[11], G_1[12], P_1[12]);
    black_cell level_0_13(G_0[12], P_0[13], G_0[13], P_0[12], G_1[13], P_1[13]);
    black_cell level_0_14(G_0[13], P_0[14], G_0[14], P_0[13], G_1[14], P_1[14]);
    black_cell level_0_15(G_0[14], P_0[15], G_0[15], P_0[14], G_1[15], P_1[15]);
    black_cell level_0_16(G_0[15], P_0[16], G_0[16], P_0[15], G_1[16], P_1[16]);
    black_cell level_0_17(G_0[16], P_0[17], G_0[17], P_0[16], G_1[17], P_1[17]);
    black_cell level_0_18(G_0[17], P_0[18], G_0[18], P_0[17], G_1[18], P_1[18]);
    black_cell level_0_19(G_0[18], P_0[19], G_0[19], P_0[18], G_1[19], P_1[19]);
    black_cell level_0_20(G_0[19], P_0[20], G_0[20], P_0[19], G_1[20], P_1[20]);
    black_cell level_0_21(G_0[20], P_0[21], G_0[21], P_0[20], G_1[21], P_1[21]);
    black_cell level_0_22(G_0[21], P_0[22], G_0[22], P_0[21], G_1[22], P_1[22]);

    /*Stage 2*/
    gray_cell level_2_1(cin, P_1[1], G_1[1], G_2[1]);
    gray_cell level_2_2(G_1[0], P_1[2], G_1[2], G_2[2]);
    black_cell level_1_3(G_1[1], P_1[3], G_1[3], P_1[1], G_2[3], P_2[3]);
    black_cell level_1_4(G_1[2], P_1[4], G_1[4], P_1[2], G_2[4], P_2[4]);
    black_cell level_1_5(G_1[3], P_1[5], G_1[5], P_1[3], G_2[5], P_2[5]);
    black_cell level_1_6(G_1[4], P_1[6], G_1[6], P_1[4], G_2[6], P_2[6]);
    black_cell level_1_7(G_1[5], P_1[7], G_1[7], P_1[5], G_2[7], P_2[7]);
    black_cell level_1_8(G_1[6], P_1[8], G_1[8], P_1[6], G_2[8], P_2[8]);
    black_cell level_1_9(G_1[7], P_1[9], G_1[9], P_1[7], G_2[9], P_2[9]);
    black_cell level_1_10(G_1[8], P_1[10], G_1[10], P_1[8], G_2[10], P_2[10]);
    black_cell level_1_11(G_1[9], P_1[11], G_1[11], P_1[9], G_2[11], P_2[11]);
    black_cell level_1_12(G_1[10], P_1[12], G_1[12], P_1[10], G_2[12], P_2[12]);
    black_cell level_1_13(G_1[11], P_1[13], G_1[13], P_1[11], G_2[13], P_2[13]);
    black_cell level_1_14(G_1[12], P_1[14], G_1[14], P_1[12], G_2[14], P_2[14]);
    black_cell level_1_15(G_1[13], P_1[15], G_1[15], P_1[13], G_2[15], P_2[15]);
    black_cell level_1_16(G_1[14], P_1[16], G_1[16], P_1[14], G_2[16], P_2[16]);
    black_cell level_1_17(G_1[15], P_1[17], G_1[17], P_1[15], G_2[17], P_2[17]);
    black_cell level_1_18(G_1[16], P_1[18], G_1[18], P_1[16], G_2[18], P_2[18]);
    black_cell level_1_19(G_1[17], P_1[19], G_1[19], P_1[17], G_2[19], P_2[19]);
    black_cell level_1_20(G_1[18], P_1[20], G_1[20], P_1[18], G_2[20], P_2[20]);
    black_cell level_1_21(G_1[19], P_1[21], G_1[21], P_1[19], G_2[21], P_2[21]);
    black_cell level_1_22(G_1[20], P_1[22], G_1[22], P_1[20], G_2[22], P_2[22]);

    /*Stage 3*/
    gray_cell level_3_3(cin, P_2[3], G_2[3], G_3[3]);
    gray_cell level_3_4(G_1[0], P_2[4], G_2[4], G_3[4]);
    gray_cell level_3_5(G_2[1], P_2[5], G_2[5], G_3[5]);
    gray_cell level_3_6(G_2[2], P_2[6], G_2[6], G_3[6]);
    black_cell level_2_7(G_2[3], P_2[7], G_2[7], P_2[3], G_3[7], P_3[7]);
    black_cell level_2_8(G_2[4], P_2[8], G_2[8], P_2[4], G_3[8], P_3[8]);
    black_cell level_2_9(G_2[5], P_2[9], G_2[9], P_2[5], G_3[9], P_3[9]);
    black_cell level_2_10(G_2[6], P_2[10], G_2[10], P_2[6], G_3[10], P_3[10]);
    black_cell level_2_11(G_2[7], P_2[11], G_2[11], P_2[7], G_3[11], P_3[11]);
    black_cell level_2_12(G_2[8], P_2[12], G_2[12], P_2[8], G_3[12], P_3[12]);
    black_cell level_2_13(G_2[9], P_2[13], G_2[13], P_2[9], G_3[13], P_3[13]);
    black_cell level_2_14(G_2[10], P_2[14], G_2[14], P_2[10], G_3[14], P_3[14]);
    black_cell level_2_15(G_2[11], P_2[15], G_2[15], P_2[11], G_3[15], P_3[15]);
    black_cell level_2_16(G_2[12], P_2[16], G_2[16], P_2[12], G_3[16], P_3[16]);
    black_cell level_2_17(G_2[13], P_2[17], G_2[17], P_2[13], G_3[17], P_3[17]);
    black_cell level_2_18(G_2[14], P_2[18], G_2[18], P_2[14], G_3[18], P_3[18]);
    black_cell level_2_19(G_2[15], P_2[19], G_2[19], P_2[15], G_3[19], P_3[19]);
    black_cell level_2_20(G_2[16], P_2[20], G_2[20], P_2[16], G_3[20], P_3[20]);
    black_cell level_2_21(G_2[17], P_2[21], G_2[21], P_2[17], G_3[21], P_3[21]);
    black_cell level_2_22(G_2[18], P_2[22], G_2[22], P_2[18], G_3[22], P_3[22]);

    /*Stage 4*/
    gray_cell level_4_7(cin, P_3[7], G_3[7], G_4[7]);
    gray_cell level_4_8(G_1[0], P_3[8], G_3[8], G_4[8]);
    gray_cell level_4_9(G_2[1], P_3[9], G_3[9], G_4[9]);
    gray_cell level_4_10(G_2[2], P_3[10], G_3[10], G_4[10]);
    gray_cell level_4_11(G_3[3], P_3[11], G_3[11], G_4[11]);
    gray_cell level_4_12(G_3[4], P_3[12], G_3[12], G_4[12]);
    gray_cell level_4_13(G_3[5], P_3[13], G_3[13], G_4[13]);
    gray_cell level_4_14(G_3[6], P_3[14], G_3[14], G_4[14]);
    black_cell level_3_15(G_3[7], P_3[15], G_3[15], P_3[7], G_4[15], P_4[15]);
    black_cell level_3_16(G_3[8], P_3[16], G_3[16], P_3[8], G_4[16], P_4[16]);
    black_cell level_3_17(G_3[9], P_3[17], G_3[17], P_3[9], G_4[17], P_4[17]);
    black_cell level_3_18(G_3[10], P_3[18], G_3[18], P_3[10], G_4[18], P_4[18]);
    black_cell level_3_19(G_3[11], P_3[19], G_3[19], P_3[11], G_4[19], P_4[19]);
    black_cell level_3_20(G_3[12], P_3[20], G_3[20], P_3[12], G_4[20], P_4[20]);
    black_cell level_3_21(G_3[13], P_3[21], G_3[21], P_3[13], G_4[21], P_4[21]);
    black_cell level_3_22(G_3[14], P_3[22], G_3[22], P_3[14], G_4[22], P_4[22]);

    /*Stage 5*/
    gray_cell level_5_15(cin, P_4[15], G_4[15], G_5[15]);
    gray_cell level_5_16(G_1[0], P_4[16], G_4[16], G_5[16]);
    gray_cell level_5_17(G_2[1], P_4[17], G_4[17], G_5[17]);
    gray_cell level_5_18(G_2[2], P_4[18], G_4[18], G_5[18]);
    gray_cell level_5_19(G_3[3], P_4[19], G_4[19], G_5[19]);
    gray_cell level_5_20(G_3[4], P_4[20], G_4[20], G_5[20]);
    gray_cell level_5_21(G_3[5], P_4[21], G_4[21], G_5[21]);
    gray_cell level_5_22(G_3[6], P_4[22], G_4[22], cout);

    assign sum[0] = cin    ^ P_0[0];
    assign sum[1] = G_1[0] ^ P_0[1];
    assign sum[2] = G_2[1] ^ P_0[2];
    assign sum[3] = G_2[2] ^ P_0[3];
    assign sum[4] = G_3[3] ^ P_0[4];
    assign sum[5] = G_3[4] ^ P_0[5];
    assign sum[6] = G_3[5] ^ P_0[6];
    assign sum[7] = G_3[6] ^ P_0[7];
    assign sum[8] = G_4[7] ^ P_0[8];
    assign sum[9] = G_4[8] ^ P_0[9];
    assign sum[10] = G_4[9] ^ P_0[10];
    assign sum[11] = G_4[10] ^ P_0[11];
    assign sum[12] = G_4[11] ^ P_0[12];
    assign sum[13] = G_4[12] ^ P_0[13];
    assign sum[14] = G_4[13] ^ P_0[14];
    assign sum[15] = G_4[14] ^ P_0[15];
    assign sum[16] = G_5[15] ^ P_0[16];
    assign sum[17] = G_5[16] ^ P_0[17];
    assign sum[18] = G_5[17] ^ P_0[18];
    assign sum[19] = G_5[18] ^ P_0[19];
    assign sum[20] = G_5[19] ^ P_0[20];
    assign sum[21] = G_5[20] ^ P_0[21];
    assign sum[22] = G_5[21] ^ P_0[22];
endmodule

module kogge_stone_22(output [21:0] sum,
        output cout,
        input [21:0] in1,
        input [21:0] in2);

    assign cin = 0;
    wire[21:0] G_0;
    wire[21:0] P_0;
    wire[21:0] G_1;
    wire[21:0] P_1;
    wire[21:0] G_2;
    wire[21:0] P_2;
    wire[21:0] G_3;
    wire[21:0] P_3;
    wire[21:0] G_4;
    wire[21:0] P_4;
    wire[21:0] G_5;
    wire[21:0] P_5;

    assign G_0[0] = in1[21] & in2[21];
    assign P_0[0] = in1[21] ^ in2[21];
    assign G_0[1] = in1[20] & in2[20];
    assign P_0[1] = in1[20] ^ in2[20];
    assign G_0[2] = in1[19] & in2[19];
    assign P_0[2] = in1[19] ^ in2[19];
    assign G_0[3] = in1[18] & in2[18];
    assign P_0[3] = in1[18] ^ in2[18];
    assign G_0[4] = in1[17] & in2[17];
    assign P_0[4] = in1[17] ^ in2[17];
    assign G_0[5] = in1[16] & in2[16];
    assign P_0[5] = in1[16] ^ in2[16];
    assign G_0[6] = in1[15] & in2[15];
    assign P_0[6] = in1[15] ^ in2[15];
    assign G_0[7] = in1[14] & in2[14];
    assign P_0[7] = in1[14] ^ in2[14];
    assign G_0[8] = in1[13] & in2[13];
    assign P_0[8] = in1[13] ^ in2[13];
    assign G_0[9] = in1[12] & in2[12];
    assign P_0[9] = in1[12] ^ in2[12];
    assign G_0[10] = in1[11] & in2[11];
    assign P_0[10] = in1[11] ^ in2[11];
    assign G_0[11] = in1[10] & in2[10];
    assign P_0[11] = in1[10] ^ in2[10];
    assign G_0[12] = in1[9] & in2[9];
    assign P_0[12] = in1[9] ^ in2[9];
    assign G_0[13] = in1[8] & in2[8];
    assign P_0[13] = in1[8] ^ in2[8];
    assign G_0[14] = in1[7] & in2[7];
    assign P_0[14] = in1[7] ^ in2[7];
    assign G_0[15] = in1[6] & in2[6];
    assign P_0[15] = in1[6] ^ in2[6];
    assign G_0[16] = in1[5] & in2[5];
    assign P_0[16] = in1[5] ^ in2[5];
    assign G_0[17] = in1[4] & in2[4];
    assign P_0[17] = in1[4] ^ in2[4];
    assign G_0[18] = in1[3] & in2[3];
    assign P_0[18] = in1[3] ^ in2[3];
    assign G_0[19] = in1[2] & in2[2];
    assign P_0[19] = in1[2] ^ in2[2];
    assign G_0[20] = in1[1] & in2[1];
    assign P_0[20] = in1[1] ^ in2[1];
    assign G_0[21] = in1[0] & in2[0];
    assign P_0[21] = in1[0] ^ in2[0];



    /*Stage 1*/
    gray_cell level_1_0(cin, P_0[0], G_0[0], G_1[0]);
    black_cell level_0_1(G_0[0], P_0[1], G_0[1], P_0[0], G_1[1], P_1[1]);
    black_cell level_0_2(G_0[1], P_0[2], G_0[2], P_0[1], G_1[2], P_1[2]);
    black_cell level_0_3(G_0[2], P_0[3], G_0[3], P_0[2], G_1[3], P_1[3]);
    black_cell level_0_4(G_0[3], P_0[4], G_0[4], P_0[3], G_1[4], P_1[4]);
    black_cell level_0_5(G_0[4], P_0[5], G_0[5], P_0[4], G_1[5], P_1[5]);
    black_cell level_0_6(G_0[5], P_0[6], G_0[6], P_0[5], G_1[6], P_1[6]);
    black_cell level_0_7(G_0[6], P_0[7], G_0[7], P_0[6], G_1[7], P_1[7]);
    black_cell level_0_8(G_0[7], P_0[8], G_0[8], P_0[7], G_1[8], P_1[8]);
    black_cell level_0_9(G_0[8], P_0[9], G_0[9], P_0[8], G_1[9], P_1[9]);
    black_cell level_0_10(G_0[9], P_0[10], G_0[10], P_0[9], G_1[10], P_1[10]);
    black_cell level_0_11(G_0[10], P_0[11], G_0[11], P_0[10], G_1[11], P_1[11]);
    black_cell level_0_12(G_0[11], P_0[12], G_0[12], P_0[11], G_1[12], P_1[12]);
    black_cell level_0_13(G_0[12], P_0[13], G_0[13], P_0[12], G_1[13], P_1[13]);
    black_cell level_0_14(G_0[13], P_0[14], G_0[14], P_0[13], G_1[14], P_1[14]);
    black_cell level_0_15(G_0[14], P_0[15], G_0[15], P_0[14], G_1[15], P_1[15]);
    black_cell level_0_16(G_0[15], P_0[16], G_0[16], P_0[15], G_1[16], P_1[16]);
    black_cell level_0_17(G_0[16], P_0[17], G_0[17], P_0[16], G_1[17], P_1[17]);
    black_cell level_0_18(G_0[17], P_0[18], G_0[18], P_0[17], G_1[18], P_1[18]);
    black_cell level_0_19(G_0[18], P_0[19], G_0[19], P_0[18], G_1[19], P_1[19]);
    black_cell level_0_20(G_0[19], P_0[20], G_0[20], P_0[19], G_1[20], P_1[20]);
    black_cell level_0_21(G_0[20], P_0[21], G_0[21], P_0[20], G_1[21], P_1[21]);

    /*Stage 2*/
    gray_cell level_2_1(cin, P_1[1], G_1[1], G_2[1]);
    gray_cell level_2_2(G_1[0], P_1[2], G_1[2], G_2[2]);
    black_cell level_1_3(G_1[1], P_1[3], G_1[3], P_1[1], G_2[3], P_2[3]);
    black_cell level_1_4(G_1[2], P_1[4], G_1[4], P_1[2], G_2[4], P_2[4]);
    black_cell level_1_5(G_1[3], P_1[5], G_1[5], P_1[3], G_2[5], P_2[5]);
    black_cell level_1_6(G_1[4], P_1[6], G_1[6], P_1[4], G_2[6], P_2[6]);
    black_cell level_1_7(G_1[5], P_1[7], G_1[7], P_1[5], G_2[7], P_2[7]);
    black_cell level_1_8(G_1[6], P_1[8], G_1[8], P_1[6], G_2[8], P_2[8]);
    black_cell level_1_9(G_1[7], P_1[9], G_1[9], P_1[7], G_2[9], P_2[9]);
    black_cell level_1_10(G_1[8], P_1[10], G_1[10], P_1[8], G_2[10], P_2[10]);
    black_cell level_1_11(G_1[9], P_1[11], G_1[11], P_1[9], G_2[11], P_2[11]);
    black_cell level_1_12(G_1[10], P_1[12], G_1[12], P_1[10], G_2[12], P_2[12]);
    black_cell level_1_13(G_1[11], P_1[13], G_1[13], P_1[11], G_2[13], P_2[13]);
    black_cell level_1_14(G_1[12], P_1[14], G_1[14], P_1[12], G_2[14], P_2[14]);
    black_cell level_1_15(G_1[13], P_1[15], G_1[15], P_1[13], G_2[15], P_2[15]);
    black_cell level_1_16(G_1[14], P_1[16], G_1[16], P_1[14], G_2[16], P_2[16]);
    black_cell level_1_17(G_1[15], P_1[17], G_1[17], P_1[15], G_2[17], P_2[17]);
    black_cell level_1_18(G_1[16], P_1[18], G_1[18], P_1[16], G_2[18], P_2[18]);
    black_cell level_1_19(G_1[17], P_1[19], G_1[19], P_1[17], G_2[19], P_2[19]);
    black_cell level_1_20(G_1[18], P_1[20], G_1[20], P_1[18], G_2[20], P_2[20]);
    black_cell level_1_21(G_1[19], P_1[21], G_1[21], P_1[19], G_2[21], P_2[21]);

    /*Stage 3*/
    gray_cell level_3_3(cin, P_2[3], G_2[3], G_3[3]);
    gray_cell level_3_4(G_1[0], P_2[4], G_2[4], G_3[4]);
    gray_cell level_3_5(G_2[1], P_2[5], G_2[5], G_3[5]);
    gray_cell level_3_6(G_2[2], P_2[6], G_2[6], G_3[6]);
    black_cell level_2_7(G_2[3], P_2[7], G_2[7], P_2[3], G_3[7], P_3[7]);
    black_cell level_2_8(G_2[4], P_2[8], G_2[8], P_2[4], G_3[8], P_3[8]);
    black_cell level_2_9(G_2[5], P_2[9], G_2[9], P_2[5], G_3[9], P_3[9]);
    black_cell level_2_10(G_2[6], P_2[10], G_2[10], P_2[6], G_3[10], P_3[10]);
    black_cell level_2_11(G_2[7], P_2[11], G_2[11], P_2[7], G_3[11], P_3[11]);
    black_cell level_2_12(G_2[8], P_2[12], G_2[12], P_2[8], G_3[12], P_3[12]);
    black_cell level_2_13(G_2[9], P_2[13], G_2[13], P_2[9], G_3[13], P_3[13]);
    black_cell level_2_14(G_2[10], P_2[14], G_2[14], P_2[10], G_3[14], P_3[14]);
    black_cell level_2_15(G_2[11], P_2[15], G_2[15], P_2[11], G_3[15], P_3[15]);
    black_cell level_2_16(G_2[12], P_2[16], G_2[16], P_2[12], G_3[16], P_3[16]);
    black_cell level_2_17(G_2[13], P_2[17], G_2[17], P_2[13], G_3[17], P_3[17]);
    black_cell level_2_18(G_2[14], P_2[18], G_2[18], P_2[14], G_3[18], P_3[18]);
    black_cell level_2_19(G_2[15], P_2[19], G_2[19], P_2[15], G_3[19], P_3[19]);
    black_cell level_2_20(G_2[16], P_2[20], G_2[20], P_2[16], G_3[20], P_3[20]);
    black_cell level_2_21(G_2[17], P_2[21], G_2[21], P_2[17], G_3[21], P_3[21]);

    /*Stage 4*/
    gray_cell level_4_7(cin, P_3[7], G_3[7], G_4[7]);
    gray_cell level_4_8(G_1[0], P_3[8], G_3[8], G_4[8]);
    gray_cell level_4_9(G_2[1], P_3[9], G_3[9], G_4[9]);
    gray_cell level_4_10(G_2[2], P_3[10], G_3[10], G_4[10]);
    gray_cell level_4_11(G_3[3], P_3[11], G_3[11], G_4[11]);
    gray_cell level_4_12(G_3[4], P_3[12], G_3[12], G_4[12]);
    gray_cell level_4_13(G_3[5], P_3[13], G_3[13], G_4[13]);
    gray_cell level_4_14(G_3[6], P_3[14], G_3[14], G_4[14]);
    black_cell level_3_15(G_3[7], P_3[15], G_3[15], P_3[7], G_4[15], P_4[15]);
    black_cell level_3_16(G_3[8], P_3[16], G_3[16], P_3[8], G_4[16], P_4[16]);
    black_cell level_3_17(G_3[9], P_3[17], G_3[17], P_3[9], G_4[17], P_4[17]);
    black_cell level_3_18(G_3[10], P_3[18], G_3[18], P_3[10], G_4[18], P_4[18]);
    black_cell level_3_19(G_3[11], P_3[19], G_3[19], P_3[11], G_4[19], P_4[19]);
    black_cell level_3_20(G_3[12], P_3[20], G_3[20], P_3[12], G_4[20], P_4[20]);
    black_cell level_3_21(G_3[13], P_3[21], G_3[21], P_3[13], G_4[21], P_4[21]);

    /*Stage 5*/
    gray_cell level_5_15(cin, P_4[15], G_4[15], G_5[15]);
    gray_cell level_5_16(G_1[0], P_4[16], G_4[16], G_5[16]);
    gray_cell level_5_17(G_2[1], P_4[17], G_4[17], G_5[17]);
    gray_cell level_5_18(G_2[2], P_4[18], G_4[18], G_5[18]);
    gray_cell level_5_19(G_3[3], P_4[19], G_4[19], G_5[19]);
    gray_cell level_5_20(G_3[4], P_4[20], G_4[20], G_5[20]);
    gray_cell level_5_21(G_3[5], P_4[21], G_4[21], cout);

    assign sum[0] = cin    ^ P_0[0];
    assign sum[1] = G_1[0] ^ P_0[1];
    assign sum[2] = G_2[1] ^ P_0[2];
    assign sum[3] = G_2[2] ^ P_0[3];
    assign sum[4] = G_3[3] ^ P_0[4];
    assign sum[5] = G_3[4] ^ P_0[5];
    assign sum[6] = G_3[5] ^ P_0[6];
    assign sum[7] = G_3[6] ^ P_0[7];
    assign sum[8] = G_4[7] ^ P_0[8];
    assign sum[9] = G_4[8] ^ P_0[9];
    assign sum[10] = G_4[9] ^ P_0[10];
    assign sum[11] = G_4[10] ^ P_0[11];
    assign sum[12] = G_4[11] ^ P_0[12];
    assign sum[13] = G_4[12] ^ P_0[13];
    assign sum[14] = G_4[13] ^ P_0[14];
    assign sum[15] = G_4[14] ^ P_0[15];
    assign sum[16] = G_5[15] ^ P_0[16];
    assign sum[17] = G_5[16] ^ P_0[17];
    assign sum[18] = G_5[17] ^ P_0[18];
    assign sum[19] = G_5[18] ^ P_0[19];
    assign sum[20] = G_5[19] ^ P_0[20];
    assign sum[21] = G_5[20] ^ P_0[21];
endmodule

module kogge_stone_21(output [20:0] sum,
        output cout,
        input [20:0] in1,
        input [20:0] in2);

    assign cin = 0;
    wire[20:0] G_0;
    wire[20:0] P_0;
    wire[20:0] G_1;
    wire[20:0] P_1;
    wire[20:0] G_2;
    wire[20:0] P_2;
    wire[20:0] G_3;
    wire[20:0] P_3;
    wire[20:0] G_4;
    wire[20:0] P_4;
    wire[20:0] G_5;
    wire[20:0] P_5;

    assign G_0[0] = in1[20] & in2[20];
    assign P_0[0] = in1[20] ^ in2[20];
    assign G_0[1] = in1[19] & in2[19];
    assign P_0[1] = in1[19] ^ in2[19];
    assign G_0[2] = in1[18] & in2[18];
    assign P_0[2] = in1[18] ^ in2[18];
    assign G_0[3] = in1[17] & in2[17];
    assign P_0[3] = in1[17] ^ in2[17];
    assign G_0[4] = in1[16] & in2[16];
    assign P_0[4] = in1[16] ^ in2[16];
    assign G_0[5] = in1[15] & in2[15];
    assign P_0[5] = in1[15] ^ in2[15];
    assign G_0[6] = in1[14] & in2[14];
    assign P_0[6] = in1[14] ^ in2[14];
    assign G_0[7] = in1[13] & in2[13];
    assign P_0[7] = in1[13] ^ in2[13];
    assign G_0[8] = in1[12] & in2[12];
    assign P_0[8] = in1[12] ^ in2[12];
    assign G_0[9] = in1[11] & in2[11];
    assign P_0[9] = in1[11] ^ in2[11];
    assign G_0[10] = in1[10] & in2[10];
    assign P_0[10] = in1[10] ^ in2[10];
    assign G_0[11] = in1[9] & in2[9];
    assign P_0[11] = in1[9] ^ in2[9];
    assign G_0[12] = in1[8] & in2[8];
    assign P_0[12] = in1[8] ^ in2[8];
    assign G_0[13] = in1[7] & in2[7];
    assign P_0[13] = in1[7] ^ in2[7];
    assign G_0[14] = in1[6] & in2[6];
    assign P_0[14] = in1[6] ^ in2[6];
    assign G_0[15] = in1[5] & in2[5];
    assign P_0[15] = in1[5] ^ in2[5];
    assign G_0[16] = in1[4] & in2[4];
    assign P_0[16] = in1[4] ^ in2[4];
    assign G_0[17] = in1[3] & in2[3];
    assign P_0[17] = in1[3] ^ in2[3];
    assign G_0[18] = in1[2] & in2[2];
    assign P_0[18] = in1[2] ^ in2[2];
    assign G_0[19] = in1[1] & in2[1];
    assign P_0[19] = in1[1] ^ in2[1];
    assign G_0[20] = in1[0] & in2[0];
    assign P_0[20] = in1[0] ^ in2[0];



    /*Stage 1*/
    gray_cell level_1_0(cin, P_0[0], G_0[0], G_1[0]);
    black_cell level_0_1(G_0[0], P_0[1], G_0[1], P_0[0], G_1[1], P_1[1]);
    black_cell level_0_2(G_0[1], P_0[2], G_0[2], P_0[1], G_1[2], P_1[2]);
    black_cell level_0_3(G_0[2], P_0[3], G_0[3], P_0[2], G_1[3], P_1[3]);
    black_cell level_0_4(G_0[3], P_0[4], G_0[4], P_0[3], G_1[4], P_1[4]);
    black_cell level_0_5(G_0[4], P_0[5], G_0[5], P_0[4], G_1[5], P_1[5]);
    black_cell level_0_6(G_0[5], P_0[6], G_0[6], P_0[5], G_1[6], P_1[6]);
    black_cell level_0_7(G_0[6], P_0[7], G_0[7], P_0[6], G_1[7], P_1[7]);
    black_cell level_0_8(G_0[7], P_0[8], G_0[8], P_0[7], G_1[8], P_1[8]);
    black_cell level_0_9(G_0[8], P_0[9], G_0[9], P_0[8], G_1[9], P_1[9]);
    black_cell level_0_10(G_0[9], P_0[10], G_0[10], P_0[9], G_1[10], P_1[10]);
    black_cell level_0_11(G_0[10], P_0[11], G_0[11], P_0[10], G_1[11], P_1[11]);
    black_cell level_0_12(G_0[11], P_0[12], G_0[12], P_0[11], G_1[12], P_1[12]);
    black_cell level_0_13(G_0[12], P_0[13], G_0[13], P_0[12], G_1[13], P_1[13]);
    black_cell level_0_14(G_0[13], P_0[14], G_0[14], P_0[13], G_1[14], P_1[14]);
    black_cell level_0_15(G_0[14], P_0[15], G_0[15], P_0[14], G_1[15], P_1[15]);
    black_cell level_0_16(G_0[15], P_0[16], G_0[16], P_0[15], G_1[16], P_1[16]);
    black_cell level_0_17(G_0[16], P_0[17], G_0[17], P_0[16], G_1[17], P_1[17]);
    black_cell level_0_18(G_0[17], P_0[18], G_0[18], P_0[17], G_1[18], P_1[18]);
    black_cell level_0_19(G_0[18], P_0[19], G_0[19], P_0[18], G_1[19], P_1[19]);
    black_cell level_0_20(G_0[19], P_0[20], G_0[20], P_0[19], G_1[20], P_1[20]);

    /*Stage 2*/
    gray_cell level_2_1(cin, P_1[1], G_1[1], G_2[1]);
    gray_cell level_2_2(G_1[0], P_1[2], G_1[2], G_2[2]);
    black_cell level_1_3(G_1[1], P_1[3], G_1[3], P_1[1], G_2[3], P_2[3]);
    black_cell level_1_4(G_1[2], P_1[4], G_1[4], P_1[2], G_2[4], P_2[4]);
    black_cell level_1_5(G_1[3], P_1[5], G_1[5], P_1[3], G_2[5], P_2[5]);
    black_cell level_1_6(G_1[4], P_1[6], G_1[6], P_1[4], G_2[6], P_2[6]);
    black_cell level_1_7(G_1[5], P_1[7], G_1[7], P_1[5], G_2[7], P_2[7]);
    black_cell level_1_8(G_1[6], P_1[8], G_1[8], P_1[6], G_2[8], P_2[8]);
    black_cell level_1_9(G_1[7], P_1[9], G_1[9], P_1[7], G_2[9], P_2[9]);
    black_cell level_1_10(G_1[8], P_1[10], G_1[10], P_1[8], G_2[10], P_2[10]);
    black_cell level_1_11(G_1[9], P_1[11], G_1[11], P_1[9], G_2[11], P_2[11]);
    black_cell level_1_12(G_1[10], P_1[12], G_1[12], P_1[10], G_2[12], P_2[12]);
    black_cell level_1_13(G_1[11], P_1[13], G_1[13], P_1[11], G_2[13], P_2[13]);
    black_cell level_1_14(G_1[12], P_1[14], G_1[14], P_1[12], G_2[14], P_2[14]);
    black_cell level_1_15(G_1[13], P_1[15], G_1[15], P_1[13], G_2[15], P_2[15]);
    black_cell level_1_16(G_1[14], P_1[16], G_1[16], P_1[14], G_2[16], P_2[16]);
    black_cell level_1_17(G_1[15], P_1[17], G_1[17], P_1[15], G_2[17], P_2[17]);
    black_cell level_1_18(G_1[16], P_1[18], G_1[18], P_1[16], G_2[18], P_2[18]);
    black_cell level_1_19(G_1[17], P_1[19], G_1[19], P_1[17], G_2[19], P_2[19]);
    black_cell level_1_20(G_1[18], P_1[20], G_1[20], P_1[18], G_2[20], P_2[20]);

    /*Stage 3*/
    gray_cell level_3_3(cin, P_2[3], G_2[3], G_3[3]);
    gray_cell level_3_4(G_1[0], P_2[4], G_2[4], G_3[4]);
    gray_cell level_3_5(G_2[1], P_2[5], G_2[5], G_3[5]);
    gray_cell level_3_6(G_2[2], P_2[6], G_2[6], G_3[6]);
    black_cell level_2_7(G_2[3], P_2[7], G_2[7], P_2[3], G_3[7], P_3[7]);
    black_cell level_2_8(G_2[4], P_2[8], G_2[8], P_2[4], G_3[8], P_3[8]);
    black_cell level_2_9(G_2[5], P_2[9], G_2[9], P_2[5], G_3[9], P_3[9]);
    black_cell level_2_10(G_2[6], P_2[10], G_2[10], P_2[6], G_3[10], P_3[10]);
    black_cell level_2_11(G_2[7], P_2[11], G_2[11], P_2[7], G_3[11], P_3[11]);
    black_cell level_2_12(G_2[8], P_2[12], G_2[12], P_2[8], G_3[12], P_3[12]);
    black_cell level_2_13(G_2[9], P_2[13], G_2[13], P_2[9], G_3[13], P_3[13]);
    black_cell level_2_14(G_2[10], P_2[14], G_2[14], P_2[10], G_3[14], P_3[14]);
    black_cell level_2_15(G_2[11], P_2[15], G_2[15], P_2[11], G_3[15], P_3[15]);
    black_cell level_2_16(G_2[12], P_2[16], G_2[16], P_2[12], G_3[16], P_3[16]);
    black_cell level_2_17(G_2[13], P_2[17], G_2[17], P_2[13], G_3[17], P_3[17]);
    black_cell level_2_18(G_2[14], P_2[18], G_2[18], P_2[14], G_3[18], P_3[18]);
    black_cell level_2_19(G_2[15], P_2[19], G_2[19], P_2[15], G_3[19], P_3[19]);
    black_cell level_2_20(G_2[16], P_2[20], G_2[20], P_2[16], G_3[20], P_3[20]);

    /*Stage 4*/
    gray_cell level_4_7(cin, P_3[7], G_3[7], G_4[7]);
    gray_cell level_4_8(G_1[0], P_3[8], G_3[8], G_4[8]);
    gray_cell level_4_9(G_2[1], P_3[9], G_3[9], G_4[9]);
    gray_cell level_4_10(G_2[2], P_3[10], G_3[10], G_4[10]);
    gray_cell level_4_11(G_3[3], P_3[11], G_3[11], G_4[11]);
    gray_cell level_4_12(G_3[4], P_3[12], G_3[12], G_4[12]);
    gray_cell level_4_13(G_3[5], P_3[13], G_3[13], G_4[13]);
    gray_cell level_4_14(G_3[6], P_3[14], G_3[14], G_4[14]);
    black_cell level_3_15(G_3[7], P_3[15], G_3[15], P_3[7], G_4[15], P_4[15]);
    black_cell level_3_16(G_3[8], P_3[16], G_3[16], P_3[8], G_4[16], P_4[16]);
    black_cell level_3_17(G_3[9], P_3[17], G_3[17], P_3[9], G_4[17], P_4[17]);
    black_cell level_3_18(G_3[10], P_3[18], G_3[18], P_3[10], G_4[18], P_4[18]);
    black_cell level_3_19(G_3[11], P_3[19], G_3[19], P_3[11], G_4[19], P_4[19]);
    black_cell level_3_20(G_3[12], P_3[20], G_3[20], P_3[12], G_4[20], P_4[20]);

    /*Stage 5*/
    gray_cell level_5_15(cin, P_4[15], G_4[15], G_5[15]);
    gray_cell level_5_16(G_1[0], P_4[16], G_4[16], G_5[16]);
    gray_cell level_5_17(G_2[1], P_4[17], G_4[17], G_5[17]);
    gray_cell level_5_18(G_2[2], P_4[18], G_4[18], G_5[18]);
    gray_cell level_5_19(G_3[3], P_4[19], G_4[19], G_5[19]);
    gray_cell level_5_20(G_3[4], P_4[20], G_4[20], cout);

    assign sum[0] = cin    ^ P_0[0];
    assign sum[1] = G_1[0] ^ P_0[1];
    assign sum[2] = G_2[1] ^ P_0[2];
    assign sum[3] = G_2[2] ^ P_0[3];
    assign sum[4] = G_3[3] ^ P_0[4];
    assign sum[5] = G_3[4] ^ P_0[5];
    assign sum[6] = G_3[5] ^ P_0[6];
    assign sum[7] = G_3[6] ^ P_0[7];
    assign sum[8] = G_4[7] ^ P_0[8];
    assign sum[9] = G_4[8] ^ P_0[9];
    assign sum[10] = G_4[9] ^ P_0[10];
    assign sum[11] = G_4[10] ^ P_0[11];
    assign sum[12] = G_4[11] ^ P_0[12];
    assign sum[13] = G_4[12] ^ P_0[13];
    assign sum[14] = G_4[13] ^ P_0[14];
    assign sum[15] = G_4[14] ^ P_0[15];
    assign sum[16] = G_5[15] ^ P_0[16];
    assign sum[17] = G_5[16] ^ P_0[17];
    assign sum[18] = G_5[17] ^ P_0[18];
    assign sum[19] = G_5[18] ^ P_0[19];
    assign sum[20] = G_5[19] ^ P_0[20];
endmodule

module kogge_stone_20(output [19:0] sum,
        output cout,
        input [19:0] in1,
        input [19:0] in2);

    assign cin = 0;
    wire[19:0] G_0;
    wire[19:0] P_0;
    wire[19:0] G_1;
    wire[19:0] P_1;
    wire[19:0] G_2;
    wire[19:0] P_2;
    wire[19:0] G_3;
    wire[19:0] P_3;
    wire[19:0] G_4;
    wire[19:0] P_4;
    wire[19:0] G_5;
    wire[19:0] P_5;

    assign G_0[0] = in1[19] & in2[19];
    assign P_0[0] = in1[19] ^ in2[19];
    assign G_0[1] = in1[18] & in2[18];
    assign P_0[1] = in1[18] ^ in2[18];
    assign G_0[2] = in1[17] & in2[17];
    assign P_0[2] = in1[17] ^ in2[17];
    assign G_0[3] = in1[16] & in2[16];
    assign P_0[3] = in1[16] ^ in2[16];
    assign G_0[4] = in1[15] & in2[15];
    assign P_0[4] = in1[15] ^ in2[15];
    assign G_0[5] = in1[14] & in2[14];
    assign P_0[5] = in1[14] ^ in2[14];
    assign G_0[6] = in1[13] & in2[13];
    assign P_0[6] = in1[13] ^ in2[13];
    assign G_0[7] = in1[12] & in2[12];
    assign P_0[7] = in1[12] ^ in2[12];
    assign G_0[8] = in1[11] & in2[11];
    assign P_0[8] = in1[11] ^ in2[11];
    assign G_0[9] = in1[10] & in2[10];
    assign P_0[9] = in1[10] ^ in2[10];
    assign G_0[10] = in1[9] & in2[9];
    assign P_0[10] = in1[9] ^ in2[9];
    assign G_0[11] = in1[8] & in2[8];
    assign P_0[11] = in1[8] ^ in2[8];
    assign G_0[12] = in1[7] & in2[7];
    assign P_0[12] = in1[7] ^ in2[7];
    assign G_0[13] = in1[6] & in2[6];
    assign P_0[13] = in1[6] ^ in2[6];
    assign G_0[14] = in1[5] & in2[5];
    assign P_0[14] = in1[5] ^ in2[5];
    assign G_0[15] = in1[4] & in2[4];
    assign P_0[15] = in1[4] ^ in2[4];
    assign G_0[16] = in1[3] & in2[3];
    assign P_0[16] = in1[3] ^ in2[3];
    assign G_0[17] = in1[2] & in2[2];
    assign P_0[17] = in1[2] ^ in2[2];
    assign G_0[18] = in1[1] & in2[1];
    assign P_0[18] = in1[1] ^ in2[1];
    assign G_0[19] = in1[0] & in2[0];
    assign P_0[19] = in1[0] ^ in2[0];



    /*Stage 1*/
    gray_cell level_1_0(cin, P_0[0], G_0[0], G_1[0]);
    black_cell level_0_1(G_0[0], P_0[1], G_0[1], P_0[0], G_1[1], P_1[1]);
    black_cell level_0_2(G_0[1], P_0[2], G_0[2], P_0[1], G_1[2], P_1[2]);
    black_cell level_0_3(G_0[2], P_0[3], G_0[3], P_0[2], G_1[3], P_1[3]);
    black_cell level_0_4(G_0[3], P_0[4], G_0[4], P_0[3], G_1[4], P_1[4]);
    black_cell level_0_5(G_0[4], P_0[5], G_0[5], P_0[4], G_1[5], P_1[5]);
    black_cell level_0_6(G_0[5], P_0[6], G_0[6], P_0[5], G_1[6], P_1[6]);
    black_cell level_0_7(G_0[6], P_0[7], G_0[7], P_0[6], G_1[7], P_1[7]);
    black_cell level_0_8(G_0[7], P_0[8], G_0[8], P_0[7], G_1[8], P_1[8]);
    black_cell level_0_9(G_0[8], P_0[9], G_0[9], P_0[8], G_1[9], P_1[9]);
    black_cell level_0_10(G_0[9], P_0[10], G_0[10], P_0[9], G_1[10], P_1[10]);
    black_cell level_0_11(G_0[10], P_0[11], G_0[11], P_0[10], G_1[11], P_1[11]);
    black_cell level_0_12(G_0[11], P_0[12], G_0[12], P_0[11], G_1[12], P_1[12]);
    black_cell level_0_13(G_0[12], P_0[13], G_0[13], P_0[12], G_1[13], P_1[13]);
    black_cell level_0_14(G_0[13], P_0[14], G_0[14], P_0[13], G_1[14], P_1[14]);
    black_cell level_0_15(G_0[14], P_0[15], G_0[15], P_0[14], G_1[15], P_1[15]);
    black_cell level_0_16(G_0[15], P_0[16], G_0[16], P_0[15], G_1[16], P_1[16]);
    black_cell level_0_17(G_0[16], P_0[17], G_0[17], P_0[16], G_1[17], P_1[17]);
    black_cell level_0_18(G_0[17], P_0[18], G_0[18], P_0[17], G_1[18], P_1[18]);
    black_cell level_0_19(G_0[18], P_0[19], G_0[19], P_0[18], G_1[19], P_1[19]);

    /*Stage 2*/
    gray_cell level_2_1(cin, P_1[1], G_1[1], G_2[1]);
    gray_cell level_2_2(G_1[0], P_1[2], G_1[2], G_2[2]);
    black_cell level_1_3(G_1[1], P_1[3], G_1[3], P_1[1], G_2[3], P_2[3]);
    black_cell level_1_4(G_1[2], P_1[4], G_1[4], P_1[2], G_2[4], P_2[4]);
    black_cell level_1_5(G_1[3], P_1[5], G_1[5], P_1[3], G_2[5], P_2[5]);
    black_cell level_1_6(G_1[4], P_1[6], G_1[6], P_1[4], G_2[6], P_2[6]);
    black_cell level_1_7(G_1[5], P_1[7], G_1[7], P_1[5], G_2[7], P_2[7]);
    black_cell level_1_8(G_1[6], P_1[8], G_1[8], P_1[6], G_2[8], P_2[8]);
    black_cell level_1_9(G_1[7], P_1[9], G_1[9], P_1[7], G_2[9], P_2[9]);
    black_cell level_1_10(G_1[8], P_1[10], G_1[10], P_1[8], G_2[10], P_2[10]);
    black_cell level_1_11(G_1[9], P_1[11], G_1[11], P_1[9], G_2[11], P_2[11]);
    black_cell level_1_12(G_1[10], P_1[12], G_1[12], P_1[10], G_2[12], P_2[12]);
    black_cell level_1_13(G_1[11], P_1[13], G_1[13], P_1[11], G_2[13], P_2[13]);
    black_cell level_1_14(G_1[12], P_1[14], G_1[14], P_1[12], G_2[14], P_2[14]);
    black_cell level_1_15(G_1[13], P_1[15], G_1[15], P_1[13], G_2[15], P_2[15]);
    black_cell level_1_16(G_1[14], P_1[16], G_1[16], P_1[14], G_2[16], P_2[16]);
    black_cell level_1_17(G_1[15], P_1[17], G_1[17], P_1[15], G_2[17], P_2[17]);
    black_cell level_1_18(G_1[16], P_1[18], G_1[18], P_1[16], G_2[18], P_2[18]);
    black_cell level_1_19(G_1[17], P_1[19], G_1[19], P_1[17], G_2[19], P_2[19]);

    /*Stage 3*/
    gray_cell level_3_3(cin, P_2[3], G_2[3], G_3[3]);
    gray_cell level_3_4(G_1[0], P_2[4], G_2[4], G_3[4]);
    gray_cell level_3_5(G_2[1], P_2[5], G_2[5], G_3[5]);
    gray_cell level_3_6(G_2[2], P_2[6], G_2[6], G_3[6]);
    black_cell level_2_7(G_2[3], P_2[7], G_2[7], P_2[3], G_3[7], P_3[7]);
    black_cell level_2_8(G_2[4], P_2[8], G_2[8], P_2[4], G_3[8], P_3[8]);
    black_cell level_2_9(G_2[5], P_2[9], G_2[9], P_2[5], G_3[9], P_3[9]);
    black_cell level_2_10(G_2[6], P_2[10], G_2[10], P_2[6], G_3[10], P_3[10]);
    black_cell level_2_11(G_2[7], P_2[11], G_2[11], P_2[7], G_3[11], P_3[11]);
    black_cell level_2_12(G_2[8], P_2[12], G_2[12], P_2[8], G_3[12], P_3[12]);
    black_cell level_2_13(G_2[9], P_2[13], G_2[13], P_2[9], G_3[13], P_3[13]);
    black_cell level_2_14(G_2[10], P_2[14], G_2[14], P_2[10], G_3[14], P_3[14]);
    black_cell level_2_15(G_2[11], P_2[15], G_2[15], P_2[11], G_3[15], P_3[15]);
    black_cell level_2_16(G_2[12], P_2[16], G_2[16], P_2[12], G_3[16], P_3[16]);
    black_cell level_2_17(G_2[13], P_2[17], G_2[17], P_2[13], G_3[17], P_3[17]);
    black_cell level_2_18(G_2[14], P_2[18], G_2[18], P_2[14], G_3[18], P_3[18]);
    black_cell level_2_19(G_2[15], P_2[19], G_2[19], P_2[15], G_3[19], P_3[19]);

    /*Stage 4*/
    gray_cell level_4_7(cin, P_3[7], G_3[7], G_4[7]);
    gray_cell level_4_8(G_1[0], P_3[8], G_3[8], G_4[8]);
    gray_cell level_4_9(G_2[1], P_3[9], G_3[9], G_4[9]);
    gray_cell level_4_10(G_2[2], P_3[10], G_3[10], G_4[10]);
    gray_cell level_4_11(G_3[3], P_3[11], G_3[11], G_4[11]);
    gray_cell level_4_12(G_3[4], P_3[12], G_3[12], G_4[12]);
    gray_cell level_4_13(G_3[5], P_3[13], G_3[13], G_4[13]);
    gray_cell level_4_14(G_3[6], P_3[14], G_3[14], G_4[14]);
    black_cell level_3_15(G_3[7], P_3[15], G_3[15], P_3[7], G_4[15], P_4[15]);
    black_cell level_3_16(G_3[8], P_3[16], G_3[16], P_3[8], G_4[16], P_4[16]);
    black_cell level_3_17(G_3[9], P_3[17], G_3[17], P_3[9], G_4[17], P_4[17]);
    black_cell level_3_18(G_3[10], P_3[18], G_3[18], P_3[10], G_4[18], P_4[18]);
    black_cell level_3_19(G_3[11], P_3[19], G_3[19], P_3[11], G_4[19], P_4[19]);

    /*Stage 5*/
    gray_cell level_5_15(cin, P_4[15], G_4[15], G_5[15]);
    gray_cell level_5_16(G_1[0], P_4[16], G_4[16], G_5[16]);
    gray_cell level_5_17(G_2[1], P_4[17], G_4[17], G_5[17]);
    gray_cell level_5_18(G_2[2], P_4[18], G_4[18], G_5[18]);
    gray_cell level_5_19(G_3[3], P_4[19], G_4[19], cout);

    assign sum[0] = cin    ^ P_0[0];
    assign sum[1] = G_1[0] ^ P_0[1];
    assign sum[2] = G_2[1] ^ P_0[2];
    assign sum[3] = G_2[2] ^ P_0[3];
    assign sum[4] = G_3[3] ^ P_0[4];
    assign sum[5] = G_3[4] ^ P_0[5];
    assign sum[6] = G_3[5] ^ P_0[6];
    assign sum[7] = G_3[6] ^ P_0[7];
    assign sum[8] = G_4[7] ^ P_0[8];
    assign sum[9] = G_4[8] ^ P_0[9];
    assign sum[10] = G_4[9] ^ P_0[10];
    assign sum[11] = G_4[10] ^ P_0[11];
    assign sum[12] = G_4[11] ^ P_0[12];
    assign sum[13] = G_4[12] ^ P_0[13];
    assign sum[14] = G_4[13] ^ P_0[14];
    assign sum[15] = G_4[14] ^ P_0[15];
    assign sum[16] = G_5[15] ^ P_0[16];
    assign sum[17] = G_5[16] ^ P_0[17];
    assign sum[18] = G_5[17] ^ P_0[18];
    assign sum[19] = G_5[18] ^ P_0[19];
endmodule

module kogge_stone_19(output [18:0] sum,
        output cout,
        input [18:0] in1,
        input [18:0] in2);

    assign cin = 0;
    wire[18:0] G_0;
    wire[18:0] P_0;
    wire[18:0] G_1;
    wire[18:0] P_1;
    wire[18:0] G_2;
    wire[18:0] P_2;
    wire[18:0] G_3;
    wire[18:0] P_3;
    wire[18:0] G_4;
    wire[18:0] P_4;
    wire[18:0] G_5;
    wire[18:0] P_5;

    assign G_0[0] = in1[18] & in2[18];
    assign P_0[0] = in1[18] ^ in2[18];
    assign G_0[1] = in1[17] & in2[17];
    assign P_0[1] = in1[17] ^ in2[17];
    assign G_0[2] = in1[16] & in2[16];
    assign P_0[2] = in1[16] ^ in2[16];
    assign G_0[3] = in1[15] & in2[15];
    assign P_0[3] = in1[15] ^ in2[15];
    assign G_0[4] = in1[14] & in2[14];
    assign P_0[4] = in1[14] ^ in2[14];
    assign G_0[5] = in1[13] & in2[13];
    assign P_0[5] = in1[13] ^ in2[13];
    assign G_0[6] = in1[12] & in2[12];
    assign P_0[6] = in1[12] ^ in2[12];
    assign G_0[7] = in1[11] & in2[11];
    assign P_0[7] = in1[11] ^ in2[11];
    assign G_0[8] = in1[10] & in2[10];
    assign P_0[8] = in1[10] ^ in2[10];
    assign G_0[9] = in1[9] & in2[9];
    assign P_0[9] = in1[9] ^ in2[9];
    assign G_0[10] = in1[8] & in2[8];
    assign P_0[10] = in1[8] ^ in2[8];
    assign G_0[11] = in1[7] & in2[7];
    assign P_0[11] = in1[7] ^ in2[7];
    assign G_0[12] = in1[6] & in2[6];
    assign P_0[12] = in1[6] ^ in2[6];
    assign G_0[13] = in1[5] & in2[5];
    assign P_0[13] = in1[5] ^ in2[5];
    assign G_0[14] = in1[4] & in2[4];
    assign P_0[14] = in1[4] ^ in2[4];
    assign G_0[15] = in1[3] & in2[3];
    assign P_0[15] = in1[3] ^ in2[3];
    assign G_0[16] = in1[2] & in2[2];
    assign P_0[16] = in1[2] ^ in2[2];
    assign G_0[17] = in1[1] & in2[1];
    assign P_0[17] = in1[1] ^ in2[1];
    assign G_0[18] = in1[0] & in2[0];
    assign P_0[18] = in1[0] ^ in2[0];



    /*Stage 1*/
    gray_cell level_1_0(cin, P_0[0], G_0[0], G_1[0]);
    black_cell level_0_1(G_0[0], P_0[1], G_0[1], P_0[0], G_1[1], P_1[1]);
    black_cell level_0_2(G_0[1], P_0[2], G_0[2], P_0[1], G_1[2], P_1[2]);
    black_cell level_0_3(G_0[2], P_0[3], G_0[3], P_0[2], G_1[3], P_1[3]);
    black_cell level_0_4(G_0[3], P_0[4], G_0[4], P_0[3], G_1[4], P_1[4]);
    black_cell level_0_5(G_0[4], P_0[5], G_0[5], P_0[4], G_1[5], P_1[5]);
    black_cell level_0_6(G_0[5], P_0[6], G_0[6], P_0[5], G_1[6], P_1[6]);
    black_cell level_0_7(G_0[6], P_0[7], G_0[7], P_0[6], G_1[7], P_1[7]);
    black_cell level_0_8(G_0[7], P_0[8], G_0[8], P_0[7], G_1[8], P_1[8]);
    black_cell level_0_9(G_0[8], P_0[9], G_0[9], P_0[8], G_1[9], P_1[9]);
    black_cell level_0_10(G_0[9], P_0[10], G_0[10], P_0[9], G_1[10], P_1[10]);
    black_cell level_0_11(G_0[10], P_0[11], G_0[11], P_0[10], G_1[11], P_1[11]);
    black_cell level_0_12(G_0[11], P_0[12], G_0[12], P_0[11], G_1[12], P_1[12]);
    black_cell level_0_13(G_0[12], P_0[13], G_0[13], P_0[12], G_1[13], P_1[13]);
    black_cell level_0_14(G_0[13], P_0[14], G_0[14], P_0[13], G_1[14], P_1[14]);
    black_cell level_0_15(G_0[14], P_0[15], G_0[15], P_0[14], G_1[15], P_1[15]);
    black_cell level_0_16(G_0[15], P_0[16], G_0[16], P_0[15], G_1[16], P_1[16]);
    black_cell level_0_17(G_0[16], P_0[17], G_0[17], P_0[16], G_1[17], P_1[17]);
    black_cell level_0_18(G_0[17], P_0[18], G_0[18], P_0[17], G_1[18], P_1[18]);

    /*Stage 2*/
    gray_cell level_2_1(cin, P_1[1], G_1[1], G_2[1]);
    gray_cell level_2_2(G_1[0], P_1[2], G_1[2], G_2[2]);
    black_cell level_1_3(G_1[1], P_1[3], G_1[3], P_1[1], G_2[3], P_2[3]);
    black_cell level_1_4(G_1[2], P_1[4], G_1[4], P_1[2], G_2[4], P_2[4]);
    black_cell level_1_5(G_1[3], P_1[5], G_1[5], P_1[3], G_2[5], P_2[5]);
    black_cell level_1_6(G_1[4], P_1[6], G_1[6], P_1[4], G_2[6], P_2[6]);
    black_cell level_1_7(G_1[5], P_1[7], G_1[7], P_1[5], G_2[7], P_2[7]);
    black_cell level_1_8(G_1[6], P_1[8], G_1[8], P_1[6], G_2[8], P_2[8]);
    black_cell level_1_9(G_1[7], P_1[9], G_1[9], P_1[7], G_2[9], P_2[9]);
    black_cell level_1_10(G_1[8], P_1[10], G_1[10], P_1[8], G_2[10], P_2[10]);
    black_cell level_1_11(G_1[9], P_1[11], G_1[11], P_1[9], G_2[11], P_2[11]);
    black_cell level_1_12(G_1[10], P_1[12], G_1[12], P_1[10], G_2[12], P_2[12]);
    black_cell level_1_13(G_1[11], P_1[13], G_1[13], P_1[11], G_2[13], P_2[13]);
    black_cell level_1_14(G_1[12], P_1[14], G_1[14], P_1[12], G_2[14], P_2[14]);
    black_cell level_1_15(G_1[13], P_1[15], G_1[15], P_1[13], G_2[15], P_2[15]);
    black_cell level_1_16(G_1[14], P_1[16], G_1[16], P_1[14], G_2[16], P_2[16]);
    black_cell level_1_17(G_1[15], P_1[17], G_1[17], P_1[15], G_2[17], P_2[17]);
    black_cell level_1_18(G_1[16], P_1[18], G_1[18], P_1[16], G_2[18], P_2[18]);

    /*Stage 3*/
    gray_cell level_3_3(cin, P_2[3], G_2[3], G_3[3]);
    gray_cell level_3_4(G_1[0], P_2[4], G_2[4], G_3[4]);
    gray_cell level_3_5(G_2[1], P_2[5], G_2[5], G_3[5]);
    gray_cell level_3_6(G_2[2], P_2[6], G_2[6], G_3[6]);
    black_cell level_2_7(G_2[3], P_2[7], G_2[7], P_2[3], G_3[7], P_3[7]);
    black_cell level_2_8(G_2[4], P_2[8], G_2[8], P_2[4], G_3[8], P_3[8]);
    black_cell level_2_9(G_2[5], P_2[9], G_2[9], P_2[5], G_3[9], P_3[9]);
    black_cell level_2_10(G_2[6], P_2[10], G_2[10], P_2[6], G_3[10], P_3[10]);
    black_cell level_2_11(G_2[7], P_2[11], G_2[11], P_2[7], G_3[11], P_3[11]);
    black_cell level_2_12(G_2[8], P_2[12], G_2[12], P_2[8], G_3[12], P_3[12]);
    black_cell level_2_13(G_2[9], P_2[13], G_2[13], P_2[9], G_3[13], P_3[13]);
    black_cell level_2_14(G_2[10], P_2[14], G_2[14], P_2[10], G_3[14], P_3[14]);
    black_cell level_2_15(G_2[11], P_2[15], G_2[15], P_2[11], G_3[15], P_3[15]);
    black_cell level_2_16(G_2[12], P_2[16], G_2[16], P_2[12], G_3[16], P_3[16]);
    black_cell level_2_17(G_2[13], P_2[17], G_2[17], P_2[13], G_3[17], P_3[17]);
    black_cell level_2_18(G_2[14], P_2[18], G_2[18], P_2[14], G_3[18], P_3[18]);

    /*Stage 4*/
    gray_cell level_4_7(cin, P_3[7], G_3[7], G_4[7]);
    gray_cell level_4_8(G_1[0], P_3[8], G_3[8], G_4[8]);
    gray_cell level_4_9(G_2[1], P_3[9], G_3[9], G_4[9]);
    gray_cell level_4_10(G_2[2], P_3[10], G_3[10], G_4[10]);
    gray_cell level_4_11(G_3[3], P_3[11], G_3[11], G_4[11]);
    gray_cell level_4_12(G_3[4], P_3[12], G_3[12], G_4[12]);
    gray_cell level_4_13(G_3[5], P_3[13], G_3[13], G_4[13]);
    gray_cell level_4_14(G_3[6], P_3[14], G_3[14], G_4[14]);
    black_cell level_3_15(G_3[7], P_3[15], G_3[15], P_3[7], G_4[15], P_4[15]);
    black_cell level_3_16(G_3[8], P_3[16], G_3[16], P_3[8], G_4[16], P_4[16]);
    black_cell level_3_17(G_3[9], P_3[17], G_3[17], P_3[9], G_4[17], P_4[17]);
    black_cell level_3_18(G_3[10], P_3[18], G_3[18], P_3[10], G_4[18], P_4[18]);

    /*Stage 5*/
    gray_cell level_5_15(cin, P_4[15], G_4[15], G_5[15]);
    gray_cell level_5_16(G_1[0], P_4[16], G_4[16], G_5[16]);
    gray_cell level_5_17(G_2[1], P_4[17], G_4[17], G_5[17]);
    gray_cell level_5_18(G_2[2], P_4[18], G_4[18], cout);

    assign sum[0] = cin    ^ P_0[0];
    assign sum[1] = G_1[0] ^ P_0[1];
    assign sum[2] = G_2[1] ^ P_0[2];
    assign sum[3] = G_2[2] ^ P_0[3];
    assign sum[4] = G_3[3] ^ P_0[4];
    assign sum[5] = G_3[4] ^ P_0[5];
    assign sum[6] = G_3[5] ^ P_0[6];
    assign sum[7] = G_3[6] ^ P_0[7];
    assign sum[8] = G_4[7] ^ P_0[8];
    assign sum[9] = G_4[8] ^ P_0[9];
    assign sum[10] = G_4[9] ^ P_0[10];
    assign sum[11] = G_4[10] ^ P_0[11];
    assign sum[12] = G_4[11] ^ P_0[12];
    assign sum[13] = G_4[12] ^ P_0[13];
    assign sum[14] = G_4[13] ^ P_0[14];
    assign sum[15] = G_4[14] ^ P_0[15];
    assign sum[16] = G_5[15] ^ P_0[16];
    assign sum[17] = G_5[16] ^ P_0[17];
    assign sum[18] = G_5[17] ^ P_0[18];
endmodule

module kogge_stone_18(output [17:0] sum,
        output cout,
        input [17:0] in1,
        input [17:0] in2);

    assign cin = 0;
    wire[17:0] G_0;
    wire[17:0] P_0;
    wire[17:0] G_1;
    wire[17:0] P_1;
    wire[17:0] G_2;
    wire[17:0] P_2;
    wire[17:0] G_3;
    wire[17:0] P_3;
    wire[17:0] G_4;
    wire[17:0] P_4;
    wire[17:0] G_5;
    wire[17:0] P_5;

    assign G_0[0] = in1[17] & in2[17];
    assign P_0[0] = in1[17] ^ in2[17];
    assign G_0[1] = in1[16] & in2[16];
    assign P_0[1] = in1[16] ^ in2[16];
    assign G_0[2] = in1[15] & in2[15];
    assign P_0[2] = in1[15] ^ in2[15];
    assign G_0[3] = in1[14] & in2[14];
    assign P_0[3] = in1[14] ^ in2[14];
    assign G_0[4] = in1[13] & in2[13];
    assign P_0[4] = in1[13] ^ in2[13];
    assign G_0[5] = in1[12] & in2[12];
    assign P_0[5] = in1[12] ^ in2[12];
    assign G_0[6] = in1[11] & in2[11];
    assign P_0[6] = in1[11] ^ in2[11];
    assign G_0[7] = in1[10] & in2[10];
    assign P_0[7] = in1[10] ^ in2[10];
    assign G_0[8] = in1[9] & in2[9];
    assign P_0[8] = in1[9] ^ in2[9];
    assign G_0[9] = in1[8] & in2[8];
    assign P_0[9] = in1[8] ^ in2[8];
    assign G_0[10] = in1[7] & in2[7];
    assign P_0[10] = in1[7] ^ in2[7];
    assign G_0[11] = in1[6] & in2[6];
    assign P_0[11] = in1[6] ^ in2[6];
    assign G_0[12] = in1[5] & in2[5];
    assign P_0[12] = in1[5] ^ in2[5];
    assign G_0[13] = in1[4] & in2[4];
    assign P_0[13] = in1[4] ^ in2[4];
    assign G_0[14] = in1[3] & in2[3];
    assign P_0[14] = in1[3] ^ in2[3];
    assign G_0[15] = in1[2] & in2[2];
    assign P_0[15] = in1[2] ^ in2[2];
    assign G_0[16] = in1[1] & in2[1];
    assign P_0[16] = in1[1] ^ in2[1];
    assign G_0[17] = in1[0] & in2[0];
    assign P_0[17] = in1[0] ^ in2[0];



    /*Stage 1*/
    gray_cell level_1_0(cin, P_0[0], G_0[0], G_1[0]);
    black_cell level_0_1(G_0[0], P_0[1], G_0[1], P_0[0], G_1[1], P_1[1]);
    black_cell level_0_2(G_0[1], P_0[2], G_0[2], P_0[1], G_1[2], P_1[2]);
    black_cell level_0_3(G_0[2], P_0[3], G_0[3], P_0[2], G_1[3], P_1[3]);
    black_cell level_0_4(G_0[3], P_0[4], G_0[4], P_0[3], G_1[4], P_1[4]);
    black_cell level_0_5(G_0[4], P_0[5], G_0[5], P_0[4], G_1[5], P_1[5]);
    black_cell level_0_6(G_0[5], P_0[6], G_0[6], P_0[5], G_1[6], P_1[6]);
    black_cell level_0_7(G_0[6], P_0[7], G_0[7], P_0[6], G_1[7], P_1[7]);
    black_cell level_0_8(G_0[7], P_0[8], G_0[8], P_0[7], G_1[8], P_1[8]);
    black_cell level_0_9(G_0[8], P_0[9], G_0[9], P_0[8], G_1[9], P_1[9]);
    black_cell level_0_10(G_0[9], P_0[10], G_0[10], P_0[9], G_1[10], P_1[10]);
    black_cell level_0_11(G_0[10], P_0[11], G_0[11], P_0[10], G_1[11], P_1[11]);
    black_cell level_0_12(G_0[11], P_0[12], G_0[12], P_0[11], G_1[12], P_1[12]);
    black_cell level_0_13(G_0[12], P_0[13], G_0[13], P_0[12], G_1[13], P_1[13]);
    black_cell level_0_14(G_0[13], P_0[14], G_0[14], P_0[13], G_1[14], P_1[14]);
    black_cell level_0_15(G_0[14], P_0[15], G_0[15], P_0[14], G_1[15], P_1[15]);
    black_cell level_0_16(G_0[15], P_0[16], G_0[16], P_0[15], G_1[16], P_1[16]);
    black_cell level_0_17(G_0[16], P_0[17], G_0[17], P_0[16], G_1[17], P_1[17]);

    /*Stage 2*/
    gray_cell level_2_1(cin, P_1[1], G_1[1], G_2[1]);
    gray_cell level_2_2(G_1[0], P_1[2], G_1[2], G_2[2]);
    black_cell level_1_3(G_1[1], P_1[3], G_1[3], P_1[1], G_2[3], P_2[3]);
    black_cell level_1_4(G_1[2], P_1[4], G_1[4], P_1[2], G_2[4], P_2[4]);
    black_cell level_1_5(G_1[3], P_1[5], G_1[5], P_1[3], G_2[5], P_2[5]);
    black_cell level_1_6(G_1[4], P_1[6], G_1[6], P_1[4], G_2[6], P_2[6]);
    black_cell level_1_7(G_1[5], P_1[7], G_1[7], P_1[5], G_2[7], P_2[7]);
    black_cell level_1_8(G_1[6], P_1[8], G_1[8], P_1[6], G_2[8], P_2[8]);
    black_cell level_1_9(G_1[7], P_1[9], G_1[9], P_1[7], G_2[9], P_2[9]);
    black_cell level_1_10(G_1[8], P_1[10], G_1[10], P_1[8], G_2[10], P_2[10]);
    black_cell level_1_11(G_1[9], P_1[11], G_1[11], P_1[9], G_2[11], P_2[11]);
    black_cell level_1_12(G_1[10], P_1[12], G_1[12], P_1[10], G_2[12], P_2[12]);
    black_cell level_1_13(G_1[11], P_1[13], G_1[13], P_1[11], G_2[13], P_2[13]);
    black_cell level_1_14(G_1[12], P_1[14], G_1[14], P_1[12], G_2[14], P_2[14]);
    black_cell level_1_15(G_1[13], P_1[15], G_1[15], P_1[13], G_2[15], P_2[15]);
    black_cell level_1_16(G_1[14], P_1[16], G_1[16], P_1[14], G_2[16], P_2[16]);
    black_cell level_1_17(G_1[15], P_1[17], G_1[17], P_1[15], G_2[17], P_2[17]);

    /*Stage 3*/
    gray_cell level_3_3(cin, P_2[3], G_2[3], G_3[3]);
    gray_cell level_3_4(G_1[0], P_2[4], G_2[4], G_3[4]);
    gray_cell level_3_5(G_2[1], P_2[5], G_2[5], G_3[5]);
    gray_cell level_3_6(G_2[2], P_2[6], G_2[6], G_3[6]);
    black_cell level_2_7(G_2[3], P_2[7], G_2[7], P_2[3], G_3[7], P_3[7]);
    black_cell level_2_8(G_2[4], P_2[8], G_2[8], P_2[4], G_3[8], P_3[8]);
    black_cell level_2_9(G_2[5], P_2[9], G_2[9], P_2[5], G_3[9], P_3[9]);
    black_cell level_2_10(G_2[6], P_2[10], G_2[10], P_2[6], G_3[10], P_3[10]);
    black_cell level_2_11(G_2[7], P_2[11], G_2[11], P_2[7], G_3[11], P_3[11]);
    black_cell level_2_12(G_2[8], P_2[12], G_2[12], P_2[8], G_3[12], P_3[12]);
    black_cell level_2_13(G_2[9], P_2[13], G_2[13], P_2[9], G_3[13], P_3[13]);
    black_cell level_2_14(G_2[10], P_2[14], G_2[14], P_2[10], G_3[14], P_3[14]);
    black_cell level_2_15(G_2[11], P_2[15], G_2[15], P_2[11], G_3[15], P_3[15]);
    black_cell level_2_16(G_2[12], P_2[16], G_2[16], P_2[12], G_3[16], P_3[16]);
    black_cell level_2_17(G_2[13], P_2[17], G_2[17], P_2[13], G_3[17], P_3[17]);

    /*Stage 4*/
    gray_cell level_4_7(cin, P_3[7], G_3[7], G_4[7]);
    gray_cell level_4_8(G_1[0], P_3[8], G_3[8], G_4[8]);
    gray_cell level_4_9(G_2[1], P_3[9], G_3[9], G_4[9]);
    gray_cell level_4_10(G_2[2], P_3[10], G_3[10], G_4[10]);
    gray_cell level_4_11(G_3[3], P_3[11], G_3[11], G_4[11]);
    gray_cell level_4_12(G_3[4], P_3[12], G_3[12], G_4[12]);
    gray_cell level_4_13(G_3[5], P_3[13], G_3[13], G_4[13]);
    gray_cell level_4_14(G_3[6], P_3[14], G_3[14], G_4[14]);
    black_cell level_3_15(G_3[7], P_3[15], G_3[15], P_3[7], G_4[15], P_4[15]);
    black_cell level_3_16(G_3[8], P_3[16], G_3[16], P_3[8], G_4[16], P_4[16]);
    black_cell level_3_17(G_3[9], P_3[17], G_3[17], P_3[9], G_4[17], P_4[17]);

    /*Stage 5*/
    gray_cell level_5_15(cin, P_4[15], G_4[15], G_5[15]);
    gray_cell level_5_16(G_1[0], P_4[16], G_4[16], G_5[16]);
    gray_cell level_5_17(G_2[1], P_4[17], G_4[17], cout);

    assign sum[0] = cin    ^ P_0[0];
    assign sum[1] = G_1[0] ^ P_0[1];
    assign sum[2] = G_2[1] ^ P_0[2];
    assign sum[3] = G_2[2] ^ P_0[3];
    assign sum[4] = G_3[3] ^ P_0[4];
    assign sum[5] = G_3[4] ^ P_0[5];
    assign sum[6] = G_3[5] ^ P_0[6];
    assign sum[7] = G_3[6] ^ P_0[7];
    assign sum[8] = G_4[7] ^ P_0[8];
    assign sum[9] = G_4[8] ^ P_0[9];
    assign sum[10] = G_4[9] ^ P_0[10];
    assign sum[11] = G_4[10] ^ P_0[11];
    assign sum[12] = G_4[11] ^ P_0[12];
    assign sum[13] = G_4[12] ^ P_0[13];
    assign sum[14] = G_4[13] ^ P_0[14];
    assign sum[15] = G_4[14] ^ P_0[15];
    assign sum[16] = G_5[15] ^ P_0[16];
    assign sum[17] = G_5[16] ^ P_0[17];
endmodule

module kogge_stone_17(output [16:0] sum,
        output cout,
        input [16:0] in1,
        input [16:0] in2);

    assign cin = 0;
    wire[16:0] G_0;
    wire[16:0] P_0;
    wire[16:0] G_1;
    wire[16:0] P_1;
    wire[16:0] G_2;
    wire[16:0] P_2;
    wire[16:0] G_3;
    wire[16:0] P_3;
    wire[16:0] G_4;
    wire[16:0] P_4;
    wire[16:0] G_5;
    wire[16:0] P_5;

    assign G_0[0] = in1[16] & in2[16];
    assign P_0[0] = in1[16] ^ in2[16];
    assign G_0[1] = in1[15] & in2[15];
    assign P_0[1] = in1[15] ^ in2[15];
    assign G_0[2] = in1[14] & in2[14];
    assign P_0[2] = in1[14] ^ in2[14];
    assign G_0[3] = in1[13] & in2[13];
    assign P_0[3] = in1[13] ^ in2[13];
    assign G_0[4] = in1[12] & in2[12];
    assign P_0[4] = in1[12] ^ in2[12];
    assign G_0[5] = in1[11] & in2[11];
    assign P_0[5] = in1[11] ^ in2[11];
    assign G_0[6] = in1[10] & in2[10];
    assign P_0[6] = in1[10] ^ in2[10];
    assign G_0[7] = in1[9] & in2[9];
    assign P_0[7] = in1[9] ^ in2[9];
    assign G_0[8] = in1[8] & in2[8];
    assign P_0[8] = in1[8] ^ in2[8];
    assign G_0[9] = in1[7] & in2[7];
    assign P_0[9] = in1[7] ^ in2[7];
    assign G_0[10] = in1[6] & in2[6];
    assign P_0[10] = in1[6] ^ in2[6];
    assign G_0[11] = in1[5] & in2[5];
    assign P_0[11] = in1[5] ^ in2[5];
    assign G_0[12] = in1[4] & in2[4];
    assign P_0[12] = in1[4] ^ in2[4];
    assign G_0[13] = in1[3] & in2[3];
    assign P_0[13] = in1[3] ^ in2[3];
    assign G_0[14] = in1[2] & in2[2];
    assign P_0[14] = in1[2] ^ in2[2];
    assign G_0[15] = in1[1] & in2[1];
    assign P_0[15] = in1[1] ^ in2[1];
    assign G_0[16] = in1[0] & in2[0];
    assign P_0[16] = in1[0] ^ in2[0];



    /*Stage 1*/
    gray_cell level_1_0(cin, P_0[0], G_0[0], G_1[0]);
    black_cell level_0_1(G_0[0], P_0[1], G_0[1], P_0[0], G_1[1], P_1[1]);
    black_cell level_0_2(G_0[1], P_0[2], G_0[2], P_0[1], G_1[2], P_1[2]);
    black_cell level_0_3(G_0[2], P_0[3], G_0[3], P_0[2], G_1[3], P_1[3]);
    black_cell level_0_4(G_0[3], P_0[4], G_0[4], P_0[3], G_1[4], P_1[4]);
    black_cell level_0_5(G_0[4], P_0[5], G_0[5], P_0[4], G_1[5], P_1[5]);
    black_cell level_0_6(G_0[5], P_0[6], G_0[6], P_0[5], G_1[6], P_1[6]);
    black_cell level_0_7(G_0[6], P_0[7], G_0[7], P_0[6], G_1[7], P_1[7]);
    black_cell level_0_8(G_0[7], P_0[8], G_0[8], P_0[7], G_1[8], P_1[8]);
    black_cell level_0_9(G_0[8], P_0[9], G_0[9], P_0[8], G_1[9], P_1[9]);
    black_cell level_0_10(G_0[9], P_0[10], G_0[10], P_0[9], G_1[10], P_1[10]);
    black_cell level_0_11(G_0[10], P_0[11], G_0[11], P_0[10], G_1[11], P_1[11]);
    black_cell level_0_12(G_0[11], P_0[12], G_0[12], P_0[11], G_1[12], P_1[12]);
    black_cell level_0_13(G_0[12], P_0[13], G_0[13], P_0[12], G_1[13], P_1[13]);
    black_cell level_0_14(G_0[13], P_0[14], G_0[14], P_0[13], G_1[14], P_1[14]);
    black_cell level_0_15(G_0[14], P_0[15], G_0[15], P_0[14], G_1[15], P_1[15]);
    black_cell level_0_16(G_0[15], P_0[16], G_0[16], P_0[15], G_1[16], P_1[16]);

    /*Stage 2*/
    gray_cell level_2_1(cin, P_1[1], G_1[1], G_2[1]);
    gray_cell level_2_2(G_1[0], P_1[2], G_1[2], G_2[2]);
    black_cell level_1_3(G_1[1], P_1[3], G_1[3], P_1[1], G_2[3], P_2[3]);
    black_cell level_1_4(G_1[2], P_1[4], G_1[4], P_1[2], G_2[4], P_2[4]);
    black_cell level_1_5(G_1[3], P_1[5], G_1[5], P_1[3], G_2[5], P_2[5]);
    black_cell level_1_6(G_1[4], P_1[6], G_1[6], P_1[4], G_2[6], P_2[6]);
    black_cell level_1_7(G_1[5], P_1[7], G_1[7], P_1[5], G_2[7], P_2[7]);
    black_cell level_1_8(G_1[6], P_1[8], G_1[8], P_1[6], G_2[8], P_2[8]);
    black_cell level_1_9(G_1[7], P_1[9], G_1[9], P_1[7], G_2[9], P_2[9]);
    black_cell level_1_10(G_1[8], P_1[10], G_1[10], P_1[8], G_2[10], P_2[10]);
    black_cell level_1_11(G_1[9], P_1[11], G_1[11], P_1[9], G_2[11], P_2[11]);
    black_cell level_1_12(G_1[10], P_1[12], G_1[12], P_1[10], G_2[12], P_2[12]);
    black_cell level_1_13(G_1[11], P_1[13], G_1[13], P_1[11], G_2[13], P_2[13]);
    black_cell level_1_14(G_1[12], P_1[14], G_1[14], P_1[12], G_2[14], P_2[14]);
    black_cell level_1_15(G_1[13], P_1[15], G_1[15], P_1[13], G_2[15], P_2[15]);
    black_cell level_1_16(G_1[14], P_1[16], G_1[16], P_1[14], G_2[16], P_2[16]);

    /*Stage 3*/
    gray_cell level_3_3(cin, P_2[3], G_2[3], G_3[3]);
    gray_cell level_3_4(G_1[0], P_2[4], G_2[4], G_3[4]);
    gray_cell level_3_5(G_2[1], P_2[5], G_2[5], G_3[5]);
    gray_cell level_3_6(G_2[2], P_2[6], G_2[6], G_3[6]);
    black_cell level_2_7(G_2[3], P_2[7], G_2[7], P_2[3], G_3[7], P_3[7]);
    black_cell level_2_8(G_2[4], P_2[8], G_2[8], P_2[4], G_3[8], P_3[8]);
    black_cell level_2_9(G_2[5], P_2[9], G_2[9], P_2[5], G_3[9], P_3[9]);
    black_cell level_2_10(G_2[6], P_2[10], G_2[10], P_2[6], G_3[10], P_3[10]);
    black_cell level_2_11(G_2[7], P_2[11], G_2[11], P_2[7], G_3[11], P_3[11]);
    black_cell level_2_12(G_2[8], P_2[12], G_2[12], P_2[8], G_3[12], P_3[12]);
    black_cell level_2_13(G_2[9], P_2[13], G_2[13], P_2[9], G_3[13], P_3[13]);
    black_cell level_2_14(G_2[10], P_2[14], G_2[14], P_2[10], G_3[14], P_3[14]);
    black_cell level_2_15(G_2[11], P_2[15], G_2[15], P_2[11], G_3[15], P_3[15]);
    black_cell level_2_16(G_2[12], P_2[16], G_2[16], P_2[12], G_3[16], P_3[16]);

    /*Stage 4*/
    gray_cell level_4_7(cin, P_3[7], G_3[7], G_4[7]);
    gray_cell level_4_8(G_1[0], P_3[8], G_3[8], G_4[8]);
    gray_cell level_4_9(G_2[1], P_3[9], G_3[9], G_4[9]);
    gray_cell level_4_10(G_2[2], P_3[10], G_3[10], G_4[10]);
    gray_cell level_4_11(G_3[3], P_3[11], G_3[11], G_4[11]);
    gray_cell level_4_12(G_3[4], P_3[12], G_3[12], G_4[12]);
    gray_cell level_4_13(G_3[5], P_3[13], G_3[13], G_4[13]);
    gray_cell level_4_14(G_3[6], P_3[14], G_3[14], G_4[14]);
    black_cell level_3_15(G_3[7], P_3[15], G_3[15], P_3[7], G_4[15], P_4[15]);
    black_cell level_3_16(G_3[8], P_3[16], G_3[16], P_3[8], G_4[16], P_4[16]);

    /*Stage 5*/
    gray_cell level_5_15(cin, P_4[15], G_4[15], G_5[15]);
    gray_cell level_5_16(G_1[0], P_4[16], G_4[16], cout);

    assign sum[0] = cin    ^ P_0[0];
    assign sum[1] = G_1[0] ^ P_0[1];
    assign sum[2] = G_2[1] ^ P_0[2];
    assign sum[3] = G_2[2] ^ P_0[3];
    assign sum[4] = G_3[3] ^ P_0[4];
    assign sum[5] = G_3[4] ^ P_0[5];
    assign sum[6] = G_3[5] ^ P_0[6];
    assign sum[7] = G_3[6] ^ P_0[7];
    assign sum[8] = G_4[7] ^ P_0[8];
    assign sum[9] = G_4[8] ^ P_0[9];
    assign sum[10] = G_4[9] ^ P_0[10];
    assign sum[11] = G_4[10] ^ P_0[11];
    assign sum[12] = G_4[11] ^ P_0[12];
    assign sum[13] = G_4[12] ^ P_0[13];
    assign sum[14] = G_4[13] ^ P_0[14];
    assign sum[15] = G_4[14] ^ P_0[15];
    assign sum[16] = G_5[15] ^ P_0[16];
endmodule

module kogge_stone_16(output [15:0] sum,
        output cout,
        input [15:0] in1,
        input [15:0] in2);

    assign cin = 0;
    wire[15:0] G_0;
    wire[15:0] P_0;
    wire[15:0] G_1;
    wire[15:0] P_1;
    wire[15:0] G_2;
    wire[15:0] P_2;
    wire[15:0] G_3;
    wire[15:0] P_3;
    wire[15:0] G_4;
    wire[15:0] P_4;
    wire[15:0] G_5;
    wire[15:0] P_5;

    assign G_0[0] = in1[15] & in2[15];
    assign P_0[0] = in1[15] ^ in2[15];
    assign G_0[1] = in1[14] & in2[14];
    assign P_0[1] = in1[14] ^ in2[14];
    assign G_0[2] = in1[13] & in2[13];
    assign P_0[2] = in1[13] ^ in2[13];
    assign G_0[3] = in1[12] & in2[12];
    assign P_0[3] = in1[12] ^ in2[12];
    assign G_0[4] = in1[11] & in2[11];
    assign P_0[4] = in1[11] ^ in2[11];
    assign G_0[5] = in1[10] & in2[10];
    assign P_0[5] = in1[10] ^ in2[10];
    assign G_0[6] = in1[9] & in2[9];
    assign P_0[6] = in1[9] ^ in2[9];
    assign G_0[7] = in1[8] & in2[8];
    assign P_0[7] = in1[8] ^ in2[8];
    assign G_0[8] = in1[7] & in2[7];
    assign P_0[8] = in1[7] ^ in2[7];
    assign G_0[9] = in1[6] & in2[6];
    assign P_0[9] = in1[6] ^ in2[6];
    assign G_0[10] = in1[5] & in2[5];
    assign P_0[10] = in1[5] ^ in2[5];
    assign G_0[11] = in1[4] & in2[4];
    assign P_0[11] = in1[4] ^ in2[4];
    assign G_0[12] = in1[3] & in2[3];
    assign P_0[12] = in1[3] ^ in2[3];
    assign G_0[13] = in1[2] & in2[2];
    assign P_0[13] = in1[2] ^ in2[2];
    assign G_0[14] = in1[1] & in2[1];
    assign P_0[14] = in1[1] ^ in2[1];
    assign G_0[15] = in1[0] & in2[0];
    assign P_0[15] = in1[0] ^ in2[0];



    /*Stage 1*/
    gray_cell level_1_0(cin, P_0[0], G_0[0], G_1[0]);
    black_cell level_0_1(G_0[0], P_0[1], G_0[1], P_0[0], G_1[1], P_1[1]);
    black_cell level_0_2(G_0[1], P_0[2], G_0[2], P_0[1], G_1[2], P_1[2]);
    black_cell level_0_3(G_0[2], P_0[3], G_0[3], P_0[2], G_1[3], P_1[3]);
    black_cell level_0_4(G_0[3], P_0[4], G_0[4], P_0[3], G_1[4], P_1[4]);
    black_cell level_0_5(G_0[4], P_0[5], G_0[5], P_0[4], G_1[5], P_1[5]);
    black_cell level_0_6(G_0[5], P_0[6], G_0[6], P_0[5], G_1[6], P_1[6]);
    black_cell level_0_7(G_0[6], P_0[7], G_0[7], P_0[6], G_1[7], P_1[7]);
    black_cell level_0_8(G_0[7], P_0[8], G_0[8], P_0[7], G_1[8], P_1[8]);
    black_cell level_0_9(G_0[8], P_0[9], G_0[9], P_0[8], G_1[9], P_1[9]);
    black_cell level_0_10(G_0[9], P_0[10], G_0[10], P_0[9], G_1[10], P_1[10]);
    black_cell level_0_11(G_0[10], P_0[11], G_0[11], P_0[10], G_1[11], P_1[11]);
    black_cell level_0_12(G_0[11], P_0[12], G_0[12], P_0[11], G_1[12], P_1[12]);
    black_cell level_0_13(G_0[12], P_0[13], G_0[13], P_0[12], G_1[13], P_1[13]);
    black_cell level_0_14(G_0[13], P_0[14], G_0[14], P_0[13], G_1[14], P_1[14]);
    black_cell level_0_15(G_0[14], P_0[15], G_0[15], P_0[14], G_1[15], P_1[15]);

    /*Stage 2*/
    gray_cell level_2_1(cin, P_1[1], G_1[1], G_2[1]);
    gray_cell level_2_2(G_1[0], P_1[2], G_1[2], G_2[2]);
    black_cell level_1_3(G_1[1], P_1[3], G_1[3], P_1[1], G_2[3], P_2[3]);
    black_cell level_1_4(G_1[2], P_1[4], G_1[4], P_1[2], G_2[4], P_2[4]);
    black_cell level_1_5(G_1[3], P_1[5], G_1[5], P_1[3], G_2[5], P_2[5]);
    black_cell level_1_6(G_1[4], P_1[6], G_1[6], P_1[4], G_2[6], P_2[6]);
    black_cell level_1_7(G_1[5], P_1[7], G_1[7], P_1[5], G_2[7], P_2[7]);
    black_cell level_1_8(G_1[6], P_1[8], G_1[8], P_1[6], G_2[8], P_2[8]);
    black_cell level_1_9(G_1[7], P_1[9], G_1[9], P_1[7], G_2[9], P_2[9]);
    black_cell level_1_10(G_1[8], P_1[10], G_1[10], P_1[8], G_2[10], P_2[10]);
    black_cell level_1_11(G_1[9], P_1[11], G_1[11], P_1[9], G_2[11], P_2[11]);
    black_cell level_1_12(G_1[10], P_1[12], G_1[12], P_1[10], G_2[12], P_2[12]);
    black_cell level_1_13(G_1[11], P_1[13], G_1[13], P_1[11], G_2[13], P_2[13]);
    black_cell level_1_14(G_1[12], P_1[14], G_1[14], P_1[12], G_2[14], P_2[14]);
    black_cell level_1_15(G_1[13], P_1[15], G_1[15], P_1[13], G_2[15], P_2[15]);

    /*Stage 3*/
    gray_cell level_3_3(cin, P_2[3], G_2[3], G_3[3]);
    gray_cell level_3_4(G_1[0], P_2[4], G_2[4], G_3[4]);
    gray_cell level_3_5(G_2[1], P_2[5], G_2[5], G_3[5]);
    gray_cell level_3_6(G_2[2], P_2[6], G_2[6], G_3[6]);
    black_cell level_2_7(G_2[3], P_2[7], G_2[7], P_2[3], G_3[7], P_3[7]);
    black_cell level_2_8(G_2[4], P_2[8], G_2[8], P_2[4], G_3[8], P_3[8]);
    black_cell level_2_9(G_2[5], P_2[9], G_2[9], P_2[5], G_3[9], P_3[9]);
    black_cell level_2_10(G_2[6], P_2[10], G_2[10], P_2[6], G_3[10], P_3[10]);
    black_cell level_2_11(G_2[7], P_2[11], G_2[11], P_2[7], G_3[11], P_3[11]);
    black_cell level_2_12(G_2[8], P_2[12], G_2[12], P_2[8], G_3[12], P_3[12]);
    black_cell level_2_13(G_2[9], P_2[13], G_2[13], P_2[9], G_3[13], P_3[13]);
    black_cell level_2_14(G_2[10], P_2[14], G_2[14], P_2[10], G_3[14], P_3[14]);
    black_cell level_2_15(G_2[11], P_2[15], G_2[15], P_2[11], G_3[15], P_3[15]);

    /*Stage 4*/
    gray_cell level_4_7(cin, P_3[7], G_3[7], G_4[7]);
    gray_cell level_4_8(G_1[0], P_3[8], G_3[8], G_4[8]);
    gray_cell level_4_9(G_2[1], P_3[9], G_3[9], G_4[9]);
    gray_cell level_4_10(G_2[2], P_3[10], G_3[10], G_4[10]);
    gray_cell level_4_11(G_3[3], P_3[11], G_3[11], G_4[11]);
    gray_cell level_4_12(G_3[4], P_3[12], G_3[12], G_4[12]);
    gray_cell level_4_13(G_3[5], P_3[13], G_3[13], G_4[13]);
    gray_cell level_4_14(G_3[6], P_3[14], G_3[14], G_4[14]);
    black_cell level_3_15(G_3[7], P_3[15], G_3[15], P_3[7], G_4[15], P_4[15]);

    /*Stage 5*/
    gray_cell level_5_15(cin, P_4[15], G_4[15], cout);

    assign sum[0] = cin    ^ P_0[0];
    assign sum[1] = G_1[0] ^ P_0[1];
    assign sum[2] = G_2[1] ^ P_0[2];
    assign sum[3] = G_2[2] ^ P_0[3];
    assign sum[4] = G_3[3] ^ P_0[4];
    assign sum[5] = G_3[4] ^ P_0[5];
    assign sum[6] = G_3[5] ^ P_0[6];
    assign sum[7] = G_3[6] ^ P_0[7];
    assign sum[8] = G_4[7] ^ P_0[8];
    assign sum[9] = G_4[8] ^ P_0[9];
    assign sum[10] = G_4[9] ^ P_0[10];
    assign sum[11] = G_4[10] ^ P_0[11];
    assign sum[12] = G_4[11] ^ P_0[12];
    assign sum[13] = G_4[12] ^ P_0[13];
    assign sum[14] = G_4[13] ^ P_0[14];
    assign sum[15] = G_4[14] ^ P_0[15];
endmodule

module kogge_stone_15(output [14:0] sum,
        output cout,
        input [14:0] in1,
        input [14:0] in2);

    assign cin = 0;
    wire[14:0] G_0;
    wire[14:0] P_0;
    wire[14:0] G_1;
    wire[14:0] P_1;
    wire[14:0] G_2;
    wire[14:0] P_2;
    wire[14:0] G_3;
    wire[14:0] P_3;
    wire[14:0] G_4;
    wire[14:0] P_4;

    assign G_0[0] = in1[14] & in2[14];
    assign P_0[0] = in1[14] ^ in2[14];
    assign G_0[1] = in1[13] & in2[13];
    assign P_0[1] = in1[13] ^ in2[13];
    assign G_0[2] = in1[12] & in2[12];
    assign P_0[2] = in1[12] ^ in2[12];
    assign G_0[3] = in1[11] & in2[11];
    assign P_0[3] = in1[11] ^ in2[11];
    assign G_0[4] = in1[10] & in2[10];
    assign P_0[4] = in1[10] ^ in2[10];
    assign G_0[5] = in1[9] & in2[9];
    assign P_0[5] = in1[9] ^ in2[9];
    assign G_0[6] = in1[8] & in2[8];
    assign P_0[6] = in1[8] ^ in2[8];
    assign G_0[7] = in1[7] & in2[7];
    assign P_0[7] = in1[7] ^ in2[7];
    assign G_0[8] = in1[6] & in2[6];
    assign P_0[8] = in1[6] ^ in2[6];
    assign G_0[9] = in1[5] & in2[5];
    assign P_0[9] = in1[5] ^ in2[5];
    assign G_0[10] = in1[4] & in2[4];
    assign P_0[10] = in1[4] ^ in2[4];
    assign G_0[11] = in1[3] & in2[3];
    assign P_0[11] = in1[3] ^ in2[3];
    assign G_0[12] = in1[2] & in2[2];
    assign P_0[12] = in1[2] ^ in2[2];
    assign G_0[13] = in1[1] & in2[1];
    assign P_0[13] = in1[1] ^ in2[1];
    assign G_0[14] = in1[0] & in2[0];
    assign P_0[14] = in1[0] ^ in2[0];



    /*Stage 1*/
    gray_cell level_1_0(cin, P_0[0], G_0[0], G_1[0]);
    black_cell level_0_1(G_0[0], P_0[1], G_0[1], P_0[0], G_1[1], P_1[1]);
    black_cell level_0_2(G_0[1], P_0[2], G_0[2], P_0[1], G_1[2], P_1[2]);
    black_cell level_0_3(G_0[2], P_0[3], G_0[3], P_0[2], G_1[3], P_1[3]);
    black_cell level_0_4(G_0[3], P_0[4], G_0[4], P_0[3], G_1[4], P_1[4]);
    black_cell level_0_5(G_0[4], P_0[5], G_0[5], P_0[4], G_1[5], P_1[5]);
    black_cell level_0_6(G_0[5], P_0[6], G_0[6], P_0[5], G_1[6], P_1[6]);
    black_cell level_0_7(G_0[6], P_0[7], G_0[7], P_0[6], G_1[7], P_1[7]);
    black_cell level_0_8(G_0[7], P_0[8], G_0[8], P_0[7], G_1[8], P_1[8]);
    black_cell level_0_9(G_0[8], P_0[9], G_0[9], P_0[8], G_1[9], P_1[9]);
    black_cell level_0_10(G_0[9], P_0[10], G_0[10], P_0[9], G_1[10], P_1[10]);
    black_cell level_0_11(G_0[10], P_0[11], G_0[11], P_0[10], G_1[11], P_1[11]);
    black_cell level_0_12(G_0[11], P_0[12], G_0[12], P_0[11], G_1[12], P_1[12]);
    black_cell level_0_13(G_0[12], P_0[13], G_0[13], P_0[12], G_1[13], P_1[13]);
    black_cell level_0_14(G_0[13], P_0[14], G_0[14], P_0[13], G_1[14], P_1[14]);

    /*Stage 2*/
    gray_cell level_2_1(cin, P_1[1], G_1[1], G_2[1]);
    gray_cell level_2_2(G_1[0], P_1[2], G_1[2], G_2[2]);
    black_cell level_1_3(G_1[1], P_1[3], G_1[3], P_1[1], G_2[3], P_2[3]);
    black_cell level_1_4(G_1[2], P_1[4], G_1[4], P_1[2], G_2[4], P_2[4]);
    black_cell level_1_5(G_1[3], P_1[5], G_1[5], P_1[3], G_2[5], P_2[5]);
    black_cell level_1_6(G_1[4], P_1[6], G_1[6], P_1[4], G_2[6], P_2[6]);
    black_cell level_1_7(G_1[5], P_1[7], G_1[7], P_1[5], G_2[7], P_2[7]);
    black_cell level_1_8(G_1[6], P_1[8], G_1[8], P_1[6], G_2[8], P_2[8]);
    black_cell level_1_9(G_1[7], P_1[9], G_1[9], P_1[7], G_2[9], P_2[9]);
    black_cell level_1_10(G_1[8], P_1[10], G_1[10], P_1[8], G_2[10], P_2[10]);
    black_cell level_1_11(G_1[9], P_1[11], G_1[11], P_1[9], G_2[11], P_2[11]);
    black_cell level_1_12(G_1[10], P_1[12], G_1[12], P_1[10], G_2[12], P_2[12]);
    black_cell level_1_13(G_1[11], P_1[13], G_1[13], P_1[11], G_2[13], P_2[13]);
    black_cell level_1_14(G_1[12], P_1[14], G_1[14], P_1[12], G_2[14], P_2[14]);

    /*Stage 3*/
    gray_cell level_3_3(cin, P_2[3], G_2[3], G_3[3]);
    gray_cell level_3_4(G_1[0], P_2[4], G_2[4], G_3[4]);
    gray_cell level_3_5(G_2[1], P_2[5], G_2[5], G_3[5]);
    gray_cell level_3_6(G_2[2], P_2[6], G_2[6], G_3[6]);
    black_cell level_2_7(G_2[3], P_2[7], G_2[7], P_2[3], G_3[7], P_3[7]);
    black_cell level_2_8(G_2[4], P_2[8], G_2[8], P_2[4], G_3[8], P_3[8]);
    black_cell level_2_9(G_2[5], P_2[9], G_2[9], P_2[5], G_3[9], P_3[9]);
    black_cell level_2_10(G_2[6], P_2[10], G_2[10], P_2[6], G_3[10], P_3[10]);
    black_cell level_2_11(G_2[7], P_2[11], G_2[11], P_2[7], G_3[11], P_3[11]);
    black_cell level_2_12(G_2[8], P_2[12], G_2[12], P_2[8], G_3[12], P_3[12]);
    black_cell level_2_13(G_2[9], P_2[13], G_2[13], P_2[9], G_3[13], P_3[13]);
    black_cell level_2_14(G_2[10], P_2[14], G_2[14], P_2[10], G_3[14], P_3[14]);

    /*Stage 4*/
    gray_cell level_4_7(cin, P_3[7], G_3[7], G_4[7]);
    gray_cell level_4_8(G_1[0], P_3[8], G_3[8], G_4[8]);
    gray_cell level_4_9(G_2[1], P_3[9], G_3[9], G_4[9]);
    gray_cell level_4_10(G_2[2], P_3[10], G_3[10], G_4[10]);
    gray_cell level_4_11(G_3[3], P_3[11], G_3[11], G_4[11]);
    gray_cell level_4_12(G_3[4], P_3[12], G_3[12], G_4[12]);
    gray_cell level_4_13(G_3[5], P_3[13], G_3[13], G_4[13]);
    gray_cell level_4_14(G_3[6], P_3[14], G_3[14], cout);

    assign sum[0] = cin    ^ P_0[0];
    assign sum[1] = G_1[0] ^ P_0[1];
    assign sum[2] = G_2[1] ^ P_0[2];
    assign sum[3] = G_2[2] ^ P_0[3];
    assign sum[4] = G_3[3] ^ P_0[4];
    assign sum[5] = G_3[4] ^ P_0[5];
    assign sum[6] = G_3[5] ^ P_0[6];
    assign sum[7] = G_3[6] ^ P_0[7];
    assign sum[8] = G_4[7] ^ P_0[8];
    assign sum[9] = G_4[8] ^ P_0[9];
    assign sum[10] = G_4[9] ^ P_0[10];
    assign sum[11] = G_4[10] ^ P_0[11];
    assign sum[12] = G_4[11] ^ P_0[12];
    assign sum[13] = G_4[12] ^ P_0[13];
    assign sum[14] = G_4[13] ^ P_0[14];
endmodule

module kogge_stone_14(output [13:0] sum,
        output cout,
        input [13:0] in1,
        input [13:0] in2);

    assign cin = 0;
    wire[13:0] G_0;
    wire[13:0] P_0;
    wire[13:0] G_1;
    wire[13:0] P_1;
    wire[13:0] G_2;
    wire[13:0] P_2;
    wire[13:0] G_3;
    wire[13:0] P_3;
    wire[13:0] G_4;
    wire[13:0] P_4;

    assign G_0[0] = in1[13] & in2[13];
    assign P_0[0] = in1[13] ^ in2[13];
    assign G_0[1] = in1[12] & in2[12];
    assign P_0[1] = in1[12] ^ in2[12];
    assign G_0[2] = in1[11] & in2[11];
    assign P_0[2] = in1[11] ^ in2[11];
    assign G_0[3] = in1[10] & in2[10];
    assign P_0[3] = in1[10] ^ in2[10];
    assign G_0[4] = in1[9] & in2[9];
    assign P_0[4] = in1[9] ^ in2[9];
    assign G_0[5] = in1[8] & in2[8];
    assign P_0[5] = in1[8] ^ in2[8];
    assign G_0[6] = in1[7] & in2[7];
    assign P_0[6] = in1[7] ^ in2[7];
    assign G_0[7] = in1[6] & in2[6];
    assign P_0[7] = in1[6] ^ in2[6];
    assign G_0[8] = in1[5] & in2[5];
    assign P_0[8] = in1[5] ^ in2[5];
    assign G_0[9] = in1[4] & in2[4];
    assign P_0[9] = in1[4] ^ in2[4];
    assign G_0[10] = in1[3] & in2[3];
    assign P_0[10] = in1[3] ^ in2[3];
    assign G_0[11] = in1[2] & in2[2];
    assign P_0[11] = in1[2] ^ in2[2];
    assign G_0[12] = in1[1] & in2[1];
    assign P_0[12] = in1[1] ^ in2[1];
    assign G_0[13] = in1[0] & in2[0];
    assign P_0[13] = in1[0] ^ in2[0];



    /*Stage 1*/
    gray_cell level_1_0(cin, P_0[0], G_0[0], G_1[0]);
    black_cell level_0_1(G_0[0], P_0[1], G_0[1], P_0[0], G_1[1], P_1[1]);
    black_cell level_0_2(G_0[1], P_0[2], G_0[2], P_0[1], G_1[2], P_1[2]);
    black_cell level_0_3(G_0[2], P_0[3], G_0[3], P_0[2], G_1[3], P_1[3]);
    black_cell level_0_4(G_0[3], P_0[4], G_0[4], P_0[3], G_1[4], P_1[4]);
    black_cell level_0_5(G_0[4], P_0[5], G_0[5], P_0[4], G_1[5], P_1[5]);
    black_cell level_0_6(G_0[5], P_0[6], G_0[6], P_0[5], G_1[6], P_1[6]);
    black_cell level_0_7(G_0[6], P_0[7], G_0[7], P_0[6], G_1[7], P_1[7]);
    black_cell level_0_8(G_0[7], P_0[8], G_0[8], P_0[7], G_1[8], P_1[8]);
    black_cell level_0_9(G_0[8], P_0[9], G_0[9], P_0[8], G_1[9], P_1[9]);
    black_cell level_0_10(G_0[9], P_0[10], G_0[10], P_0[9], G_1[10], P_1[10]);
    black_cell level_0_11(G_0[10], P_0[11], G_0[11], P_0[10], G_1[11], P_1[11]);
    black_cell level_0_12(G_0[11], P_0[12], G_0[12], P_0[11], G_1[12], P_1[12]);
    black_cell level_0_13(G_0[12], P_0[13], G_0[13], P_0[12], G_1[13], P_1[13]);

    /*Stage 2*/
    gray_cell level_2_1(cin, P_1[1], G_1[1], G_2[1]);
    gray_cell level_2_2(G_1[0], P_1[2], G_1[2], G_2[2]);
    black_cell level_1_3(G_1[1], P_1[3], G_1[3], P_1[1], G_2[3], P_2[3]);
    black_cell level_1_4(G_1[2], P_1[4], G_1[4], P_1[2], G_2[4], P_2[4]);
    black_cell level_1_5(G_1[3], P_1[5], G_1[5], P_1[3], G_2[5], P_2[5]);
    black_cell level_1_6(G_1[4], P_1[6], G_1[6], P_1[4], G_2[6], P_2[6]);
    black_cell level_1_7(G_1[5], P_1[7], G_1[7], P_1[5], G_2[7], P_2[7]);
    black_cell level_1_8(G_1[6], P_1[8], G_1[8], P_1[6], G_2[8], P_2[8]);
    black_cell level_1_9(G_1[7], P_1[9], G_1[9], P_1[7], G_2[9], P_2[9]);
    black_cell level_1_10(G_1[8], P_1[10], G_1[10], P_1[8], G_2[10], P_2[10]);
    black_cell level_1_11(G_1[9], P_1[11], G_1[11], P_1[9], G_2[11], P_2[11]);
    black_cell level_1_12(G_1[10], P_1[12], G_1[12], P_1[10], G_2[12], P_2[12]);
    black_cell level_1_13(G_1[11], P_1[13], G_1[13], P_1[11], G_2[13], P_2[13]);

    /*Stage 3*/
    gray_cell level_3_3(cin, P_2[3], G_2[3], G_3[3]);
    gray_cell level_3_4(G_1[0], P_2[4], G_2[4], G_3[4]);
    gray_cell level_3_5(G_2[1], P_2[5], G_2[5], G_3[5]);
    gray_cell level_3_6(G_2[2], P_2[6], G_2[6], G_3[6]);
    black_cell level_2_7(G_2[3], P_2[7], G_2[7], P_2[3], G_3[7], P_3[7]);
    black_cell level_2_8(G_2[4], P_2[8], G_2[8], P_2[4], G_3[8], P_3[8]);
    black_cell level_2_9(G_2[5], P_2[9], G_2[9], P_2[5], G_3[9], P_3[9]);
    black_cell level_2_10(G_2[6], P_2[10], G_2[10], P_2[6], G_3[10], P_3[10]);
    black_cell level_2_11(G_2[7], P_2[11], G_2[11], P_2[7], G_3[11], P_3[11]);
    black_cell level_2_12(G_2[8], P_2[12], G_2[12], P_2[8], G_3[12], P_3[12]);
    black_cell level_2_13(G_2[9], P_2[13], G_2[13], P_2[9], G_3[13], P_3[13]);

    /*Stage 4*/
    gray_cell level_4_7(cin, P_3[7], G_3[7], G_4[7]);
    gray_cell level_4_8(G_1[0], P_3[8], G_3[8], G_4[8]);
    gray_cell level_4_9(G_2[1], P_3[9], G_3[9], G_4[9]);
    gray_cell level_4_10(G_2[2], P_3[10], G_3[10], G_4[10]);
    gray_cell level_4_11(G_3[3], P_3[11], G_3[11], G_4[11]);
    gray_cell level_4_12(G_3[4], P_3[12], G_3[12], G_4[12]);
    gray_cell level_4_13(G_3[5], P_3[13], G_3[13], cout);

    assign sum[0] = cin    ^ P_0[0];
    assign sum[1] = G_1[0] ^ P_0[1];
    assign sum[2] = G_2[1] ^ P_0[2];
    assign sum[3] = G_2[2] ^ P_0[3];
    assign sum[4] = G_3[3] ^ P_0[4];
    assign sum[5] = G_3[4] ^ P_0[5];
    assign sum[6] = G_3[5] ^ P_0[6];
    assign sum[7] = G_3[6] ^ P_0[7];
    assign sum[8] = G_4[7] ^ P_0[8];
    assign sum[9] = G_4[8] ^ P_0[9];
    assign sum[10] = G_4[9] ^ P_0[10];
    assign sum[11] = G_4[10] ^ P_0[11];
    assign sum[12] = G_4[11] ^ P_0[12];
    assign sum[13] = G_4[12] ^ P_0[13];
endmodule

module kogge_stone_13(output [12:0] sum,
        output cout,
        input [12:0] in1,
        input [12:0] in2);

    assign cin = 0;
    wire[12:0] G_0;
    wire[12:0] P_0;
    wire[12:0] G_1;
    wire[12:0] P_1;
    wire[12:0] G_2;
    wire[12:0] P_2;
    wire[12:0] G_3;
    wire[12:0] P_3;
    wire[12:0] G_4;
    wire[12:0] P_4;

    assign G_0[0] = in1[12] & in2[12];
    assign P_0[0] = in1[12] ^ in2[12];
    assign G_0[1] = in1[11] & in2[11];
    assign P_0[1] = in1[11] ^ in2[11];
    assign G_0[2] = in1[10] & in2[10];
    assign P_0[2] = in1[10] ^ in2[10];
    assign G_0[3] = in1[9] & in2[9];
    assign P_0[3] = in1[9] ^ in2[9];
    assign G_0[4] = in1[8] & in2[8];
    assign P_0[4] = in1[8] ^ in2[8];
    assign G_0[5] = in1[7] & in2[7];
    assign P_0[5] = in1[7] ^ in2[7];
    assign G_0[6] = in1[6] & in2[6];
    assign P_0[6] = in1[6] ^ in2[6];
    assign G_0[7] = in1[5] & in2[5];
    assign P_0[7] = in1[5] ^ in2[5];
    assign G_0[8] = in1[4] & in2[4];
    assign P_0[8] = in1[4] ^ in2[4];
    assign G_0[9] = in1[3] & in2[3];
    assign P_0[9] = in1[3] ^ in2[3];
    assign G_0[10] = in1[2] & in2[2];
    assign P_0[10] = in1[2] ^ in2[2];
    assign G_0[11] = in1[1] & in2[1];
    assign P_0[11] = in1[1] ^ in2[1];
    assign G_0[12] = in1[0] & in2[0];
    assign P_0[12] = in1[0] ^ in2[0];



    /*Stage 1*/
    gray_cell level_1_0(cin, P_0[0], G_0[0], G_1[0]);
    black_cell level_0_1(G_0[0], P_0[1], G_0[1], P_0[0], G_1[1], P_1[1]);
    black_cell level_0_2(G_0[1], P_0[2], G_0[2], P_0[1], G_1[2], P_1[2]);
    black_cell level_0_3(G_0[2], P_0[3], G_0[3], P_0[2], G_1[3], P_1[3]);
    black_cell level_0_4(G_0[3], P_0[4], G_0[4], P_0[3], G_1[4], P_1[4]);
    black_cell level_0_5(G_0[4], P_0[5], G_0[5], P_0[4], G_1[5], P_1[5]);
    black_cell level_0_6(G_0[5], P_0[6], G_0[6], P_0[5], G_1[6], P_1[6]);
    black_cell level_0_7(G_0[6], P_0[7], G_0[7], P_0[6], G_1[7], P_1[7]);
    black_cell level_0_8(G_0[7], P_0[8], G_0[8], P_0[7], G_1[8], P_1[8]);
    black_cell level_0_9(G_0[8], P_0[9], G_0[9], P_0[8], G_1[9], P_1[9]);
    black_cell level_0_10(G_0[9], P_0[10], G_0[10], P_0[9], G_1[10], P_1[10]);
    black_cell level_0_11(G_0[10], P_0[11], G_0[11], P_0[10], G_1[11], P_1[11]);
    black_cell level_0_12(G_0[11], P_0[12], G_0[12], P_0[11], G_1[12], P_1[12]);

    /*Stage 2*/
    gray_cell level_2_1(cin, P_1[1], G_1[1], G_2[1]);
    gray_cell level_2_2(G_1[0], P_1[2], G_1[2], G_2[2]);
    black_cell level_1_3(G_1[1], P_1[3], G_1[3], P_1[1], G_2[3], P_2[3]);
    black_cell level_1_4(G_1[2], P_1[4], G_1[4], P_1[2], G_2[4], P_2[4]);
    black_cell level_1_5(G_1[3], P_1[5], G_1[5], P_1[3], G_2[5], P_2[5]);
    black_cell level_1_6(G_1[4], P_1[6], G_1[6], P_1[4], G_2[6], P_2[6]);
    black_cell level_1_7(G_1[5], P_1[7], G_1[7], P_1[5], G_2[7], P_2[7]);
    black_cell level_1_8(G_1[6], P_1[8], G_1[8], P_1[6], G_2[8], P_2[8]);
    black_cell level_1_9(G_1[7], P_1[9], G_1[9], P_1[7], G_2[9], P_2[9]);
    black_cell level_1_10(G_1[8], P_1[10], G_1[10], P_1[8], G_2[10], P_2[10]);
    black_cell level_1_11(G_1[9], P_1[11], G_1[11], P_1[9], G_2[11], P_2[11]);
    black_cell level_1_12(G_1[10], P_1[12], G_1[12], P_1[10], G_2[12], P_2[12]);

    /*Stage 3*/
    gray_cell level_3_3(cin, P_2[3], G_2[3], G_3[3]);
    gray_cell level_3_4(G_1[0], P_2[4], G_2[4], G_3[4]);
    gray_cell level_3_5(G_2[1], P_2[5], G_2[5], G_3[5]);
    gray_cell level_3_6(G_2[2], P_2[6], G_2[6], G_3[6]);
    black_cell level_2_7(G_2[3], P_2[7], G_2[7], P_2[3], G_3[7], P_3[7]);
    black_cell level_2_8(G_2[4], P_2[8], G_2[8], P_2[4], G_3[8], P_3[8]);
    black_cell level_2_9(G_2[5], P_2[9], G_2[9], P_2[5], G_3[9], P_3[9]);
    black_cell level_2_10(G_2[6], P_2[10], G_2[10], P_2[6], G_3[10], P_3[10]);
    black_cell level_2_11(G_2[7], P_2[11], G_2[11], P_2[7], G_3[11], P_3[11]);
    black_cell level_2_12(G_2[8], P_2[12], G_2[12], P_2[8], G_3[12], P_3[12]);

    /*Stage 4*/
    gray_cell level_4_7(cin, P_3[7], G_3[7], G_4[7]);
    gray_cell level_4_8(G_1[0], P_3[8], G_3[8], G_4[8]);
    gray_cell level_4_9(G_2[1], P_3[9], G_3[9], G_4[9]);
    gray_cell level_4_10(G_2[2], P_3[10], G_3[10], G_4[10]);
    gray_cell level_4_11(G_3[3], P_3[11], G_3[11], G_4[11]);
    gray_cell level_4_12(G_3[4], P_3[12], G_3[12], cout);

    assign sum[0] = cin    ^ P_0[0];
    assign sum[1] = G_1[0] ^ P_0[1];
    assign sum[2] = G_2[1] ^ P_0[2];
    assign sum[3] = G_2[2] ^ P_0[3];
    assign sum[4] = G_3[3] ^ P_0[4];
    assign sum[5] = G_3[4] ^ P_0[5];
    assign sum[6] = G_3[5] ^ P_0[6];
    assign sum[7] = G_3[6] ^ P_0[7];
    assign sum[8] = G_4[7] ^ P_0[8];
    assign sum[9] = G_4[8] ^ P_0[9];
    assign sum[10] = G_4[9] ^ P_0[10];
    assign sum[11] = G_4[10] ^ P_0[11];
    assign sum[12] = G_4[11] ^ P_0[12];
endmodule

module kogge_stone_12(output [11:0] sum,
        output cout,
        input [11:0] in1,
        input [11:0] in2);

    assign cin = 0;
    wire[11:0] G_0;
    wire[11:0] P_0;
    wire[11:0] G_1;
    wire[11:0] P_1;
    wire[11:0] G_2;
    wire[11:0] P_2;
    wire[11:0] G_3;
    wire[11:0] P_3;
    wire[11:0] G_4;
    wire[11:0] P_4;

    assign G_0[0] = in1[11] & in2[11];
    assign P_0[0] = in1[11] ^ in2[11];
    assign G_0[1] = in1[10] & in2[10];
    assign P_0[1] = in1[10] ^ in2[10];
    assign G_0[2] = in1[9] & in2[9];
    assign P_0[2] = in1[9] ^ in2[9];
    assign G_0[3] = in1[8] & in2[8];
    assign P_0[3] = in1[8] ^ in2[8];
    assign G_0[4] = in1[7] & in2[7];
    assign P_0[4] = in1[7] ^ in2[7];
    assign G_0[5] = in1[6] & in2[6];
    assign P_0[5] = in1[6] ^ in2[6];
    assign G_0[6] = in1[5] & in2[5];
    assign P_0[6] = in1[5] ^ in2[5];
    assign G_0[7] = in1[4] & in2[4];
    assign P_0[7] = in1[4] ^ in2[4];
    assign G_0[8] = in1[3] & in2[3];
    assign P_0[8] = in1[3] ^ in2[3];
    assign G_0[9] = in1[2] & in2[2];
    assign P_0[9] = in1[2] ^ in2[2];
    assign G_0[10] = in1[1] & in2[1];
    assign P_0[10] = in1[1] ^ in2[1];
    assign G_0[11] = in1[0] & in2[0];
    assign P_0[11] = in1[0] ^ in2[0];



    /*Stage 1*/
    gray_cell level_1_0(cin, P_0[0], G_0[0], G_1[0]);
    black_cell level_0_1(G_0[0], P_0[1], G_0[1], P_0[0], G_1[1], P_1[1]);
    black_cell level_0_2(G_0[1], P_0[2], G_0[2], P_0[1], G_1[2], P_1[2]);
    black_cell level_0_3(G_0[2], P_0[3], G_0[3], P_0[2], G_1[3], P_1[3]);
    black_cell level_0_4(G_0[3], P_0[4], G_0[4], P_0[3], G_1[4], P_1[4]);
    black_cell level_0_5(G_0[4], P_0[5], G_0[5], P_0[4], G_1[5], P_1[5]);
    black_cell level_0_6(G_0[5], P_0[6], G_0[6], P_0[5], G_1[6], P_1[6]);
    black_cell level_0_7(G_0[6], P_0[7], G_0[7], P_0[6], G_1[7], P_1[7]);
    black_cell level_0_8(G_0[7], P_0[8], G_0[8], P_0[7], G_1[8], P_1[8]);
    black_cell level_0_9(G_0[8], P_0[9], G_0[9], P_0[8], G_1[9], P_1[9]);
    black_cell level_0_10(G_0[9], P_0[10], G_0[10], P_0[9], G_1[10], P_1[10]);
    black_cell level_0_11(G_0[10], P_0[11], G_0[11], P_0[10], G_1[11], P_1[11]);

    /*Stage 2*/
    gray_cell level_2_1(cin, P_1[1], G_1[1], G_2[1]);
    gray_cell level_2_2(G_1[0], P_1[2], G_1[2], G_2[2]);
    black_cell level_1_3(G_1[1], P_1[3], G_1[3], P_1[1], G_2[3], P_2[3]);
    black_cell level_1_4(G_1[2], P_1[4], G_1[4], P_1[2], G_2[4], P_2[4]);
    black_cell level_1_5(G_1[3], P_1[5], G_1[5], P_1[3], G_2[5], P_2[5]);
    black_cell level_1_6(G_1[4], P_1[6], G_1[6], P_1[4], G_2[6], P_2[6]);
    black_cell level_1_7(G_1[5], P_1[7], G_1[7], P_1[5], G_2[7], P_2[7]);
    black_cell level_1_8(G_1[6], P_1[8], G_1[8], P_1[6], G_2[8], P_2[8]);
    black_cell level_1_9(G_1[7], P_1[9], G_1[9], P_1[7], G_2[9], P_2[9]);
    black_cell level_1_10(G_1[8], P_1[10], G_1[10], P_1[8], G_2[10], P_2[10]);
    black_cell level_1_11(G_1[9], P_1[11], G_1[11], P_1[9], G_2[11], P_2[11]);

    /*Stage 3*/
    gray_cell level_3_3(cin, P_2[3], G_2[3], G_3[3]);
    gray_cell level_3_4(G_1[0], P_2[4], G_2[4], G_3[4]);
    gray_cell level_3_5(G_2[1], P_2[5], G_2[5], G_3[5]);
    gray_cell level_3_6(G_2[2], P_2[6], G_2[6], G_3[6]);
    black_cell level_2_7(G_2[3], P_2[7], G_2[7], P_2[3], G_3[7], P_3[7]);
    black_cell level_2_8(G_2[4], P_2[8], G_2[8], P_2[4], G_3[8], P_3[8]);
    black_cell level_2_9(G_2[5], P_2[9], G_2[9], P_2[5], G_3[9], P_3[9]);
    black_cell level_2_10(G_2[6], P_2[10], G_2[10], P_2[6], G_3[10], P_3[10]);
    black_cell level_2_11(G_2[7], P_2[11], G_2[11], P_2[7], G_3[11], P_3[11]);

    /*Stage 4*/
    gray_cell level_4_7(cin, P_3[7], G_3[7], G_4[7]);
    gray_cell level_4_8(G_1[0], P_3[8], G_3[8], G_4[8]);
    gray_cell level_4_9(G_2[1], P_3[9], G_3[9], G_4[9]);
    gray_cell level_4_10(G_2[2], P_3[10], G_3[10], G_4[10]);
    gray_cell level_4_11(G_3[3], P_3[11], G_3[11], cout);

    assign sum[0] = cin    ^ P_0[0];
    assign sum[1] = G_1[0] ^ P_0[1];
    assign sum[2] = G_2[1] ^ P_0[2];
    assign sum[3] = G_2[2] ^ P_0[3];
    assign sum[4] = G_3[3] ^ P_0[4];
    assign sum[5] = G_3[4] ^ P_0[5];
    assign sum[6] = G_3[5] ^ P_0[6];
    assign sum[7] = G_3[6] ^ P_0[7];
    assign sum[8] = G_4[7] ^ P_0[8];
    assign sum[9] = G_4[8] ^ P_0[9];
    assign sum[10] = G_4[9] ^ P_0[10];
    assign sum[11] = G_4[10] ^ P_0[11];
endmodule

module kogge_stone_11(output [10:0] sum,
        output cout,
        input [10:0] in1,
        input [10:0] in2);

    assign cin = 0;
    wire[10:0] G_0;
    wire[10:0] P_0;
    wire[10:0] G_1;
    wire[10:0] P_1;
    wire[10:0] G_2;
    wire[10:0] P_2;
    wire[10:0] G_3;
    wire[10:0] P_3;
    wire[10:0] G_4;
    wire[10:0] P_4;

    assign G_0[0] = in1[10] & in2[10];
    assign P_0[0] = in1[10] ^ in2[10];
    assign G_0[1] = in1[9] & in2[9];
    assign P_0[1] = in1[9] ^ in2[9];
    assign G_0[2] = in1[8] & in2[8];
    assign P_0[2] = in1[8] ^ in2[8];
    assign G_0[3] = in1[7] & in2[7];
    assign P_0[3] = in1[7] ^ in2[7];
    assign G_0[4] = in1[6] & in2[6];
    assign P_0[4] = in1[6] ^ in2[6];
    assign G_0[5] = in1[5] & in2[5];
    assign P_0[5] = in1[5] ^ in2[5];
    assign G_0[6] = in1[4] & in2[4];
    assign P_0[6] = in1[4] ^ in2[4];
    assign G_0[7] = in1[3] & in2[3];
    assign P_0[7] = in1[3] ^ in2[3];
    assign G_0[8] = in1[2] & in2[2];
    assign P_0[8] = in1[2] ^ in2[2];
    assign G_0[9] = in1[1] & in2[1];
    assign P_0[9] = in1[1] ^ in2[1];
    assign G_0[10] = in1[0] & in2[0];
    assign P_0[10] = in1[0] ^ in2[0];



    /*Stage 1*/
    gray_cell level_1_0(cin, P_0[0], G_0[0], G_1[0]);
    black_cell level_0_1(G_0[0], P_0[1], G_0[1], P_0[0], G_1[1], P_1[1]);
    black_cell level_0_2(G_0[1], P_0[2], G_0[2], P_0[1], G_1[2], P_1[2]);
    black_cell level_0_3(G_0[2], P_0[3], G_0[3], P_0[2], G_1[3], P_1[3]);
    black_cell level_0_4(G_0[3], P_0[4], G_0[4], P_0[3], G_1[4], P_1[4]);
    black_cell level_0_5(G_0[4], P_0[5], G_0[5], P_0[4], G_1[5], P_1[5]);
    black_cell level_0_6(G_0[5], P_0[6], G_0[6], P_0[5], G_1[6], P_1[6]);
    black_cell level_0_7(G_0[6], P_0[7], G_0[7], P_0[6], G_1[7], P_1[7]);
    black_cell level_0_8(G_0[7], P_0[8], G_0[8], P_0[7], G_1[8], P_1[8]);
    black_cell level_0_9(G_0[8], P_0[9], G_0[9], P_0[8], G_1[9], P_1[9]);
    black_cell level_0_10(G_0[9], P_0[10], G_0[10], P_0[9], G_1[10], P_1[10]);

    /*Stage 2*/
    gray_cell level_2_1(cin, P_1[1], G_1[1], G_2[1]);
    gray_cell level_2_2(G_1[0], P_1[2], G_1[2], G_2[2]);
    black_cell level_1_3(G_1[1], P_1[3], G_1[3], P_1[1], G_2[3], P_2[3]);
    black_cell level_1_4(G_1[2], P_1[4], G_1[4], P_1[2], G_2[4], P_2[4]);
    black_cell level_1_5(G_1[3], P_1[5], G_1[5], P_1[3], G_2[5], P_2[5]);
    black_cell level_1_6(G_1[4], P_1[6], G_1[6], P_1[4], G_2[6], P_2[6]);
    black_cell level_1_7(G_1[5], P_1[7], G_1[7], P_1[5], G_2[7], P_2[7]);
    black_cell level_1_8(G_1[6], P_1[8], G_1[8], P_1[6], G_2[8], P_2[8]);
    black_cell level_1_9(G_1[7], P_1[9], G_1[9], P_1[7], G_2[9], P_2[9]);
    black_cell level_1_10(G_1[8], P_1[10], G_1[10], P_1[8], G_2[10], P_2[10]);

    /*Stage 3*/
    gray_cell level_3_3(cin, P_2[3], G_2[3], G_3[3]);
    gray_cell level_3_4(G_1[0], P_2[4], G_2[4], G_3[4]);
    gray_cell level_3_5(G_2[1], P_2[5], G_2[5], G_3[5]);
    gray_cell level_3_6(G_2[2], P_2[6], G_2[6], G_3[6]);
    black_cell level_2_7(G_2[3], P_2[7], G_2[7], P_2[3], G_3[7], P_3[7]);
    black_cell level_2_8(G_2[4], P_2[8], G_2[8], P_2[4], G_3[8], P_3[8]);
    black_cell level_2_9(G_2[5], P_2[9], G_2[9], P_2[5], G_3[9], P_3[9]);
    black_cell level_2_10(G_2[6], P_2[10], G_2[10], P_2[6], G_3[10], P_3[10]);

    /*Stage 4*/
    gray_cell level_4_7(cin, P_3[7], G_3[7], G_4[7]);
    gray_cell level_4_8(G_1[0], P_3[8], G_3[8], G_4[8]);
    gray_cell level_4_9(G_2[1], P_3[9], G_3[9], G_4[9]);
    gray_cell level_4_10(G_2[2], P_3[10], G_3[10], cout);

    assign sum[0] = cin    ^ P_0[0];
    assign sum[1] = G_1[0] ^ P_0[1];
    assign sum[2] = G_2[1] ^ P_0[2];
    assign sum[3] = G_2[2] ^ P_0[3];
    assign sum[4] = G_3[3] ^ P_0[4];
    assign sum[5] = G_3[4] ^ P_0[5];
    assign sum[6] = G_3[5] ^ P_0[6];
    assign sum[7] = G_3[6] ^ P_0[7];
    assign sum[8] = G_4[7] ^ P_0[8];
    assign sum[9] = G_4[8] ^ P_0[9];
    assign sum[10] = G_4[9] ^ P_0[10];
endmodule

module kogge_stone_10(output [9:0] sum,
        output cout,
        input [9:0] in1,
        input [9:0] in2);

    assign cin = 0;
    wire[9:0] G_0;
    wire[9:0] P_0;
    wire[9:0] G_1;
    wire[9:0] P_1;
    wire[9:0] G_2;
    wire[9:0] P_2;
    wire[9:0] G_3;
    wire[9:0] P_3;
    wire[9:0] G_4;
    wire[9:0] P_4;

    assign G_0[0] = in1[9] & in2[9];
    assign P_0[0] = in1[9] ^ in2[9];
    assign G_0[1] = in1[8] & in2[8];
    assign P_0[1] = in1[8] ^ in2[8];
    assign G_0[2] = in1[7] & in2[7];
    assign P_0[2] = in1[7] ^ in2[7];
    assign G_0[3] = in1[6] & in2[6];
    assign P_0[3] = in1[6] ^ in2[6];
    assign G_0[4] = in1[5] & in2[5];
    assign P_0[4] = in1[5] ^ in2[5];
    assign G_0[5] = in1[4] & in2[4];
    assign P_0[5] = in1[4] ^ in2[4];
    assign G_0[6] = in1[3] & in2[3];
    assign P_0[6] = in1[3] ^ in2[3];
    assign G_0[7] = in1[2] & in2[2];
    assign P_0[7] = in1[2] ^ in2[2];
    assign G_0[8] = in1[1] & in2[1];
    assign P_0[8] = in1[1] ^ in2[1];
    assign G_0[9] = in1[0] & in2[0];
    assign P_0[9] = in1[0] ^ in2[0];



    /*Stage 1*/
    gray_cell level_1_0(cin, P_0[0], G_0[0], G_1[0]);
    black_cell level_0_1(G_0[0], P_0[1], G_0[1], P_0[0], G_1[1], P_1[1]);
    black_cell level_0_2(G_0[1], P_0[2], G_0[2], P_0[1], G_1[2], P_1[2]);
    black_cell level_0_3(G_0[2], P_0[3], G_0[3], P_0[2], G_1[3], P_1[3]);
    black_cell level_0_4(G_0[3], P_0[4], G_0[4], P_0[3], G_1[4], P_1[4]);
    black_cell level_0_5(G_0[4], P_0[5], G_0[5], P_0[4], G_1[5], P_1[5]);
    black_cell level_0_6(G_0[5], P_0[6], G_0[6], P_0[5], G_1[6], P_1[6]);
    black_cell level_0_7(G_0[6], P_0[7], G_0[7], P_0[6], G_1[7], P_1[7]);
    black_cell level_0_8(G_0[7], P_0[8], G_0[8], P_0[7], G_1[8], P_1[8]);
    black_cell level_0_9(G_0[8], P_0[9], G_0[9], P_0[8], G_1[9], P_1[9]);

    /*Stage 2*/
    gray_cell level_2_1(cin, P_1[1], G_1[1], G_2[1]);
    gray_cell level_2_2(G_1[0], P_1[2], G_1[2], G_2[2]);
    black_cell level_1_3(G_1[1], P_1[3], G_1[3], P_1[1], G_2[3], P_2[3]);
    black_cell level_1_4(G_1[2], P_1[4], G_1[4], P_1[2], G_2[4], P_2[4]);
    black_cell level_1_5(G_1[3], P_1[5], G_1[5], P_1[3], G_2[5], P_2[5]);
    black_cell level_1_6(G_1[4], P_1[6], G_1[6], P_1[4], G_2[6], P_2[6]);
    black_cell level_1_7(G_1[5], P_1[7], G_1[7], P_1[5], G_2[7], P_2[7]);
    black_cell level_1_8(G_1[6], P_1[8], G_1[8], P_1[6], G_2[8], P_2[8]);
    black_cell level_1_9(G_1[7], P_1[9], G_1[9], P_1[7], G_2[9], P_2[9]);

    /*Stage 3*/
    gray_cell level_3_3(cin, P_2[3], G_2[3], G_3[3]);
    gray_cell level_3_4(G_1[0], P_2[4], G_2[4], G_3[4]);
    gray_cell level_3_5(G_2[1], P_2[5], G_2[5], G_3[5]);
    gray_cell level_3_6(G_2[2], P_2[6], G_2[6], G_3[6]);
    black_cell level_2_7(G_2[3], P_2[7], G_2[7], P_2[3], G_3[7], P_3[7]);
    black_cell level_2_8(G_2[4], P_2[8], G_2[8], P_2[4], G_3[8], P_3[8]);
    black_cell level_2_9(G_2[5], P_2[9], G_2[9], P_2[5], G_3[9], P_3[9]);

    /*Stage 4*/
    gray_cell level_4_7(cin, P_3[7], G_3[7], G_4[7]);
    gray_cell level_4_8(G_1[0], P_3[8], G_3[8], G_4[8]);
    gray_cell level_4_9(G_2[1], P_3[9], G_3[9], cout);

    assign sum[0] = cin    ^ P_0[0];
    assign sum[1] = G_1[0] ^ P_0[1];
    assign sum[2] = G_2[1] ^ P_0[2];
    assign sum[3] = G_2[2] ^ P_0[3];
    assign sum[4] = G_3[3] ^ P_0[4];
    assign sum[5] = G_3[4] ^ P_0[5];
    assign sum[6] = G_3[5] ^ P_0[6];
    assign sum[7] = G_3[6] ^ P_0[7];
    assign sum[8] = G_4[7] ^ P_0[8];
    assign sum[9] = G_4[8] ^ P_0[9];
endmodule

module kogge_stone_9(output [8:0] sum,
        output cout,
        input [8:0] in1,
        input [8:0] in2);

    assign cin = 0;
    wire[8:0] G_0;
    wire[8:0] P_0;
    wire[8:0] G_1;
    wire[8:0] P_1;
    wire[8:0] G_2;
    wire[8:0] P_2;
    wire[8:0] G_3;
    wire[8:0] P_3;
    wire[8:0] G_4;
    wire[8:0] P_4;

    assign G_0[0] = in1[8] & in2[8];
    assign P_0[0] = in1[8] ^ in2[8];
    assign G_0[1] = in1[7] & in2[7];
    assign P_0[1] = in1[7] ^ in2[7];
    assign G_0[2] = in1[6] & in2[6];
    assign P_0[2] = in1[6] ^ in2[6];
    assign G_0[3] = in1[5] & in2[5];
    assign P_0[3] = in1[5] ^ in2[5];
    assign G_0[4] = in1[4] & in2[4];
    assign P_0[4] = in1[4] ^ in2[4];
    assign G_0[5] = in1[3] & in2[3];
    assign P_0[5] = in1[3] ^ in2[3];
    assign G_0[6] = in1[2] & in2[2];
    assign P_0[6] = in1[2] ^ in2[2];
    assign G_0[7] = in1[1] & in2[1];
    assign P_0[7] = in1[1] ^ in2[1];
    assign G_0[8] = in1[0] & in2[0];
    assign P_0[8] = in1[0] ^ in2[0];



    /*Stage 1*/
    gray_cell level_1_0(cin, P_0[0], G_0[0], G_1[0]);
    black_cell level_0_1(G_0[0], P_0[1], G_0[1], P_0[0], G_1[1], P_1[1]);
    black_cell level_0_2(G_0[1], P_0[2], G_0[2], P_0[1], G_1[2], P_1[2]);
    black_cell level_0_3(G_0[2], P_0[3], G_0[3], P_0[2], G_1[3], P_1[3]);
    black_cell level_0_4(G_0[3], P_0[4], G_0[4], P_0[3], G_1[4], P_1[4]);
    black_cell level_0_5(G_0[4], P_0[5], G_0[5], P_0[4], G_1[5], P_1[5]);
    black_cell level_0_6(G_0[5], P_0[6], G_0[6], P_0[5], G_1[6], P_1[6]);
    black_cell level_0_7(G_0[6], P_0[7], G_0[7], P_0[6], G_1[7], P_1[7]);
    black_cell level_0_8(G_0[7], P_0[8], G_0[8], P_0[7], G_1[8], P_1[8]);

    /*Stage 2*/
    gray_cell level_2_1(cin, P_1[1], G_1[1], G_2[1]);
    gray_cell level_2_2(G_1[0], P_1[2], G_1[2], G_2[2]);
    black_cell level_1_3(G_1[1], P_1[3], G_1[3], P_1[1], G_2[3], P_2[3]);
    black_cell level_1_4(G_1[2], P_1[4], G_1[4], P_1[2], G_2[4], P_2[4]);
    black_cell level_1_5(G_1[3], P_1[5], G_1[5], P_1[3], G_2[5], P_2[5]);
    black_cell level_1_6(G_1[4], P_1[6], G_1[6], P_1[4], G_2[6], P_2[6]);
    black_cell level_1_7(G_1[5], P_1[7], G_1[7], P_1[5], G_2[7], P_2[7]);
    black_cell level_1_8(G_1[6], P_1[8], G_1[8], P_1[6], G_2[8], P_2[8]);

    /*Stage 3*/
    gray_cell level_3_3(cin, P_2[3], G_2[3], G_3[3]);
    gray_cell level_3_4(G_1[0], P_2[4], G_2[4], G_3[4]);
    gray_cell level_3_5(G_2[1], P_2[5], G_2[5], G_3[5]);
    gray_cell level_3_6(G_2[2], P_2[6], G_2[6], G_3[6]);
    black_cell level_2_7(G_2[3], P_2[7], G_2[7], P_2[3], G_3[7], P_3[7]);
    black_cell level_2_8(G_2[4], P_2[8], G_2[8], P_2[4], G_3[8], P_3[8]);

    /*Stage 4*/
    gray_cell level_4_7(cin, P_3[7], G_3[7], G_4[7]);
    gray_cell level_4_8(G_1[0], P_3[8], G_3[8], cout);

    assign sum[0] = cin    ^ P_0[0];
    assign sum[1] = G_1[0] ^ P_0[1];
    assign sum[2] = G_2[1] ^ P_0[2];
    assign sum[3] = G_2[2] ^ P_0[3];
    assign sum[4] = G_3[3] ^ P_0[4];
    assign sum[5] = G_3[4] ^ P_0[5];
    assign sum[6] = G_3[5] ^ P_0[6];
    assign sum[7] = G_3[6] ^ P_0[7];
    assign sum[8] = G_4[7] ^ P_0[8];
endmodule

module kogge_stone_8(output [7:0] sum,
        output cout,
        input [7:0] in1,
        input [7:0] in2);

    assign cin = 0;
    wire[7:0] G_0;
    wire[7:0] P_0;
    wire[7:0] G_1;
    wire[7:0] P_1;
    wire[7:0] G_2;
    wire[7:0] P_2;
    wire[7:0] G_3;
    wire[7:0] P_3;
    wire[7:0] G_4;
    wire[7:0] P_4;

    assign G_0[0] = in1[7] & in2[7];
    assign P_0[0] = in1[7] ^ in2[7];
    assign G_0[1] = in1[6] & in2[6];
    assign P_0[1] = in1[6] ^ in2[6];
    assign G_0[2] = in1[5] & in2[5];
    assign P_0[2] = in1[5] ^ in2[5];
    assign G_0[3] = in1[4] & in2[4];
    assign P_0[3] = in1[4] ^ in2[4];
    assign G_0[4] = in1[3] & in2[3];
    assign P_0[4] = in1[3] ^ in2[3];
    assign G_0[5] = in1[2] & in2[2];
    assign P_0[5] = in1[2] ^ in2[2];
    assign G_0[6] = in1[1] & in2[1];
    assign P_0[6] = in1[1] ^ in2[1];
    assign G_0[7] = in1[0] & in2[0];
    assign P_0[7] = in1[0] ^ in2[0];



    /*Stage 1*/
    gray_cell level_1_0(cin, P_0[0], G_0[0], G_1[0]);
    black_cell level_0_1(G_0[0], P_0[1], G_0[1], P_0[0], G_1[1], P_1[1]);
    black_cell level_0_2(G_0[1], P_0[2], G_0[2], P_0[1], G_1[2], P_1[2]);
    black_cell level_0_3(G_0[2], P_0[3], G_0[3], P_0[2], G_1[3], P_1[3]);
    black_cell level_0_4(G_0[3], P_0[4], G_0[4], P_0[3], G_1[4], P_1[4]);
    black_cell level_0_5(G_0[4], P_0[5], G_0[5], P_0[4], G_1[5], P_1[5]);
    black_cell level_0_6(G_0[5], P_0[6], G_0[6], P_0[5], G_1[6], P_1[6]);
    black_cell level_0_7(G_0[6], P_0[7], G_0[7], P_0[6], G_1[7], P_1[7]);

    /*Stage 2*/
    gray_cell level_2_1(cin, P_1[1], G_1[1], G_2[1]);
    gray_cell level_2_2(G_1[0], P_1[2], G_1[2], G_2[2]);
    black_cell level_1_3(G_1[1], P_1[3], G_1[3], P_1[1], G_2[3], P_2[3]);
    black_cell level_1_4(G_1[2], P_1[4], G_1[4], P_1[2], G_2[4], P_2[4]);
    black_cell level_1_5(G_1[3], P_1[5], G_1[5], P_1[3], G_2[5], P_2[5]);
    black_cell level_1_6(G_1[4], P_1[6], G_1[6], P_1[4], G_2[6], P_2[6]);
    black_cell level_1_7(G_1[5], P_1[7], G_1[7], P_1[5], G_2[7], P_2[7]);

    /*Stage 3*/
    gray_cell level_3_3(cin, P_2[3], G_2[3], G_3[3]);
    gray_cell level_3_4(G_1[0], P_2[4], G_2[4], G_3[4]);
    gray_cell level_3_5(G_2[1], P_2[5], G_2[5], G_3[5]);
    gray_cell level_3_6(G_2[2], P_2[6], G_2[6], G_3[6]);
    black_cell level_2_7(G_2[3], P_2[7], G_2[7], P_2[3], G_3[7], P_3[7]);

    /*Stage 4*/
    gray_cell level_4_7(cin, P_3[7], G_3[7], cout);

    assign sum[0] = cin    ^ P_0[0];
    assign sum[1] = G_1[0] ^ P_0[1];
    assign sum[2] = G_2[1] ^ P_0[2];
    assign sum[3] = G_2[2] ^ P_0[3];
    assign sum[4] = G_3[3] ^ P_0[4];
    assign sum[5] = G_3[4] ^ P_0[5];
    assign sum[6] = G_3[5] ^ P_0[6];
    assign sum[7] = G_3[6] ^ P_0[7];
endmodule

module kogge_stone_7(output [6:0] sum,
        output cout,
        input [6:0] in1,
        input [6:0] in2);

    assign cin = 0;
    wire[6:0] G_0;
    wire[6:0] P_0;
    wire[6:0] G_1;
    wire[6:0] P_1;
    wire[6:0] G_2;
    wire[6:0] P_2;
    wire[6:0] G_3;
    wire[6:0] P_3;

    assign G_0[0] = in1[6] & in2[6];
    assign P_0[0] = in1[6] ^ in2[6];
    assign G_0[1] = in1[5] & in2[5];
    assign P_0[1] = in1[5] ^ in2[5];
    assign G_0[2] = in1[4] & in2[4];
    assign P_0[2] = in1[4] ^ in2[4];
    assign G_0[3] = in1[3] & in2[3];
    assign P_0[3] = in1[3] ^ in2[3];
    assign G_0[4] = in1[2] & in2[2];
    assign P_0[4] = in1[2] ^ in2[2];
    assign G_0[5] = in1[1] & in2[1];
    assign P_0[5] = in1[1] ^ in2[1];
    assign G_0[6] = in1[0] & in2[0];
    assign P_0[6] = in1[0] ^ in2[0];



    /*Stage 1*/
    gray_cell level_1_0(cin, P_0[0], G_0[0], G_1[0]);
    black_cell level_0_1(G_0[0], P_0[1], G_0[1], P_0[0], G_1[1], P_1[1]);
    black_cell level_0_2(G_0[1], P_0[2], G_0[2], P_0[1], G_1[2], P_1[2]);
    black_cell level_0_3(G_0[2], P_0[3], G_0[3], P_0[2], G_1[3], P_1[3]);
    black_cell level_0_4(G_0[3], P_0[4], G_0[4], P_0[3], G_1[4], P_1[4]);
    black_cell level_0_5(G_0[4], P_0[5], G_0[5], P_0[4], G_1[5], P_1[5]);
    black_cell level_0_6(G_0[5], P_0[6], G_0[6], P_0[5], G_1[6], P_1[6]);

    /*Stage 2*/
    gray_cell level_2_1(cin, P_1[1], G_1[1], G_2[1]);
    gray_cell level_2_2(G_1[0], P_1[2], G_1[2], G_2[2]);
    black_cell level_1_3(G_1[1], P_1[3], G_1[3], P_1[1], G_2[3], P_2[3]);
    black_cell level_1_4(G_1[2], P_1[4], G_1[4], P_1[2], G_2[4], P_2[4]);
    black_cell level_1_5(G_1[3], P_1[5], G_1[5], P_1[3], G_2[5], P_2[5]);
    black_cell level_1_6(G_1[4], P_1[6], G_1[6], P_1[4], G_2[6], P_2[6]);

    /*Stage 3*/
    gray_cell level_3_3(cin, P_2[3], G_2[3], G_3[3]);
    gray_cell level_3_4(G_1[0], P_2[4], G_2[4], G_3[4]);
    gray_cell level_3_5(G_2[1], P_2[5], G_2[5], G_3[5]);
    gray_cell level_3_6(G_2[2], P_2[6], G_2[6], cout);

    assign sum[0] = cin    ^ P_0[0];
    assign sum[1] = G_1[0] ^ P_0[1];
    assign sum[2] = G_2[1] ^ P_0[2];
    assign sum[3] = G_2[2] ^ P_0[3];
    assign sum[4] = G_3[3] ^ P_0[4];
    assign sum[5] = G_3[4] ^ P_0[5];
    assign sum[6] = G_3[5] ^ P_0[6];
endmodule

module kogge_stone_6(output [5:0] sum,
        output cout,
        input [5:0] in1,
        input [5:0] in2);

    assign cin = 0;
    wire[5:0] G_0;
    wire[5:0] P_0;
    wire[5:0] G_1;
    wire[5:0] P_1;
    wire[5:0] G_2;
    wire[5:0] P_2;
    wire[5:0] G_3;
    wire[5:0] P_3;

    assign G_0[0] = in1[5] & in2[5];
    assign P_0[0] = in1[5] ^ in2[5];
    assign G_0[1] = in1[4] & in2[4];
    assign P_0[1] = in1[4] ^ in2[4];
    assign G_0[2] = in1[3] & in2[3];
    assign P_0[2] = in1[3] ^ in2[3];
    assign G_0[3] = in1[2] & in2[2];
    assign P_0[3] = in1[2] ^ in2[2];
    assign G_0[4] = in1[1] & in2[1];
    assign P_0[4] = in1[1] ^ in2[1];
    assign G_0[5] = in1[0] & in2[0];
    assign P_0[5] = in1[0] ^ in2[0];



    /*Stage 1*/
    gray_cell level_1_0(cin, P_0[0], G_0[0], G_1[0]);
    black_cell level_0_1(G_0[0], P_0[1], G_0[1], P_0[0], G_1[1], P_1[1]);
    black_cell level_0_2(G_0[1], P_0[2], G_0[2], P_0[1], G_1[2], P_1[2]);
    black_cell level_0_3(G_0[2], P_0[3], G_0[3], P_0[2], G_1[3], P_1[3]);
    black_cell level_0_4(G_0[3], P_0[4], G_0[4], P_0[3], G_1[4], P_1[4]);
    black_cell level_0_5(G_0[4], P_0[5], G_0[5], P_0[4], G_1[5], P_1[5]);

    /*Stage 2*/
    gray_cell level_2_1(cin, P_1[1], G_1[1], G_2[1]);
    gray_cell level_2_2(G_1[0], P_1[2], G_1[2], G_2[2]);
    black_cell level_1_3(G_1[1], P_1[3], G_1[3], P_1[1], G_2[3], P_2[3]);
    black_cell level_1_4(G_1[2], P_1[4], G_1[4], P_1[2], G_2[4], P_2[4]);
    black_cell level_1_5(G_1[3], P_1[5], G_1[5], P_1[3], G_2[5], P_2[5]);

    /*Stage 3*/
    gray_cell level_3_3(cin, P_2[3], G_2[3], G_3[3]);
    gray_cell level_3_4(G_1[0], P_2[4], G_2[4], G_3[4]);
    gray_cell level_3_5(G_2[1], P_2[5], G_2[5], cout);

    assign sum[0] = cin    ^ P_0[0];
    assign sum[1] = G_1[0] ^ P_0[1];
    assign sum[2] = G_2[1] ^ P_0[2];
    assign sum[3] = G_2[2] ^ P_0[3];
    assign sum[4] = G_3[3] ^ P_0[4];
    assign sum[5] = G_3[4] ^ P_0[5];
endmodule

module kogge_stone_5(output [4:0] sum,
        output cout,
        input [4:0] in1,
        input [4:0] in2);

    assign cin = 0;
    wire[4:0] G_0;
    wire[4:0] P_0;
    wire[4:0] G_1;
    wire[4:0] P_1;
    wire[4:0] G_2;
    wire[4:0] P_2;
    wire[4:0] G_3;
    wire[4:0] P_3;

    assign G_0[0] = in1[4] & in2[4];
    assign P_0[0] = in1[4] ^ in2[4];
    assign G_0[1] = in1[3] & in2[3];
    assign P_0[1] = in1[3] ^ in2[3];
    assign G_0[2] = in1[2] & in2[2];
    assign P_0[2] = in1[2] ^ in2[2];
    assign G_0[3] = in1[1] & in2[1];
    assign P_0[3] = in1[1] ^ in2[1];
    assign G_0[4] = in1[0] & in2[0];
    assign P_0[4] = in1[0] ^ in2[0];



    /*Stage 1*/
    gray_cell level_1_0(cin, P_0[0], G_0[0], G_1[0]);
    black_cell level_0_1(G_0[0], P_0[1], G_0[1], P_0[0], G_1[1], P_1[1]);
    black_cell level_0_2(G_0[1], P_0[2], G_0[2], P_0[1], G_1[2], P_1[2]);
    black_cell level_0_3(G_0[2], P_0[3], G_0[3], P_0[2], G_1[3], P_1[3]);
    black_cell level_0_4(G_0[3], P_0[4], G_0[4], P_0[3], G_1[4], P_1[4]);

    /*Stage 2*/
    gray_cell level_2_1(cin, P_1[1], G_1[1], G_2[1]);
    gray_cell level_2_2(G_1[0], P_1[2], G_1[2], G_2[2]);
    black_cell level_1_3(G_1[1], P_1[3], G_1[3], P_1[1], G_2[3], P_2[3]);
    black_cell level_1_4(G_1[2], P_1[4], G_1[4], P_1[2], G_2[4], P_2[4]);

    /*Stage 3*/
    gray_cell level_3_3(cin, P_2[3], G_2[3], G_3[3]);
    gray_cell level_3_4(G_1[0], P_2[4], G_2[4], cout);

    assign sum[0] = cin    ^ P_0[0];
    assign sum[1] = G_1[0] ^ P_0[1];
    assign sum[2] = G_2[1] ^ P_0[2];
    assign sum[3] = G_2[2] ^ P_0[3];
    assign sum[4] = G_3[3] ^ P_0[4];
endmodule

module kogge_stone_4(output [3:0] sum,
        output cout,
        input [3:0] in1,
        input [3:0] in2);

    assign cin = 0;
    wire[3:0] G_0;
    wire[3:0] P_0;
    wire[3:0] G_1;
    wire[3:0] P_1;
    wire[3:0] G_2;
    wire[3:0] P_2;
    wire[3:0] G_3;
    wire[3:0] P_3;

    assign G_0[0] = in1[3] & in2[3];
    assign P_0[0] = in1[3] ^ in2[3];
    assign G_0[1] = in1[2] & in2[2];
    assign P_0[1] = in1[2] ^ in2[2];
    assign G_0[2] = in1[1] & in2[1];
    assign P_0[2] = in1[1] ^ in2[1];
    assign G_0[3] = in1[0] & in2[0];
    assign P_0[3] = in1[0] ^ in2[0];



    /*Stage 1*/
    gray_cell level_1_0(cin, P_0[0], G_0[0], G_1[0]);
    black_cell level_0_1(G_0[0], P_0[1], G_0[1], P_0[0], G_1[1], P_1[1]);
    black_cell level_0_2(G_0[1], P_0[2], G_0[2], P_0[1], G_1[2], P_1[2]);
    black_cell level_0_3(G_0[2], P_0[3], G_0[3], P_0[2], G_1[3], P_1[3]);

    /*Stage 2*/
    gray_cell level_2_1(cin, P_1[1], G_1[1], G_2[1]);
    gray_cell level_2_2(G_1[0], P_1[2], G_1[2], G_2[2]);
    black_cell level_1_3(G_1[1], P_1[3], G_1[3], P_1[1], G_2[3], P_2[3]);

    /*Stage 3*/
    gray_cell level_3_3(cin, P_2[3], G_2[3], cout);

    assign sum[0] = cin    ^ P_0[0];
    assign sum[1] = G_1[0] ^ P_0[1];
    assign sum[2] = G_2[1] ^ P_0[2];
    assign sum[3] = G_2[2] ^ P_0[3];
endmodule

module kogge_stone_3(output [2:0] sum,
        output cout,
        input [2:0] in1,
        input [2:0] in2);

    assign cin = 0;
    wire[2:0] G_0;
    wire[2:0] P_0;
    wire[2:0] G_1;
    wire[2:0] P_1;
    wire[2:0] G_2;
    wire[2:0] P_2;

    assign G_0[0] = in1[2] & in2[2];
    assign P_0[0] = in1[2] ^ in2[2];
    assign G_0[1] = in1[1] & in2[1];
    assign P_0[1] = in1[1] ^ in2[1];
    assign G_0[2] = in1[0] & in2[0];
    assign P_0[2] = in1[0] ^ in2[0];



    /*Stage 1*/
    gray_cell level_1_0(cin, P_0[0], G_0[0], G_1[0]);
    black_cell level_0_1(G_0[0], P_0[1], G_0[1], P_0[0], G_1[1], P_1[1]);
    black_cell level_0_2(G_0[1], P_0[2], G_0[2], P_0[1], G_1[2], P_1[2]);

    /*Stage 2*/
    gray_cell level_2_1(cin, P_1[1], G_1[1], G_2[1]);
    gray_cell level_2_2(G_1[0], P_1[2], G_1[2], cout);

    assign sum[0] = cin    ^ P_0[0];
    assign sum[1] = G_1[0] ^ P_0[1];
    assign sum[2] = G_2[1] ^ P_0[2];
endmodule

module kogge_stone_2(output [1:0] sum,
        output cout,
        input [1:0] in1,
        input [1:0] in2);

    assign cin = 0;
    wire[1:0] G_0;
    wire[1:0] P_0;
    wire[1:0] G_1;
    wire[1:0] P_1;
    wire[1:0] G_2;
    wire[1:0] P_2;

    assign G_0[0] = in1[1] & in2[1];
    assign P_0[0] = in1[1] ^ in2[1];
    assign G_0[1] = in1[0] & in2[0];
    assign P_0[1] = in1[0] ^ in2[0];



    /*Stage 1*/
    gray_cell level_1_0(cin, P_0[0], G_0[0], G_1[0]);
    black_cell level_0_1(G_0[0], P_0[1], G_0[1], P_0[0], G_1[1], P_1[1]);

    /*Stage 2*/
    gray_cell level_2_1(cin, P_1[1], G_1[1], cout);

    assign sum[0] = cin    ^ P_0[0];
    assign sum[1] = G_1[0] ^ P_0[1];
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


module CLA_32(output [31:0] sum, output cout, input [31:0] in1, input [31:0] in2);

    wire[31:0] G;
    wire[31:0] C;
    wire[31:0] P;

    assign G[0] = in1[31] & in2[31];
    assign P[0] = in1[31] ^ in2[31];
    assign G[1] = in1[30] & in2[30];
    assign P[1] = in1[30] ^ in2[30];
    assign G[2] = in1[29] & in2[29];
    assign P[2] = in1[29] ^ in2[29];
    assign G[3] = in1[28] & in2[28];
    assign P[3] = in1[28] ^ in2[28];
    assign G[4] = in1[27] & in2[27];
    assign P[4] = in1[27] ^ in2[27];
    assign G[5] = in1[26] & in2[26];
    assign P[5] = in1[26] ^ in2[26];
    assign G[6] = in1[25] & in2[25];
    assign P[6] = in1[25] ^ in2[25];
    assign G[7] = in1[24] & in2[24];
    assign P[7] = in1[24] ^ in2[24];
    assign G[8] = in1[23] & in2[23];
    assign P[8] = in1[23] ^ in2[23];
    assign G[9] = in1[22] & in2[22];
    assign P[9] = in1[22] ^ in2[22];
    assign G[10] = in1[21] & in2[21];
    assign P[10] = in1[21] ^ in2[21];
    assign G[11] = in1[20] & in2[20];
    assign P[11] = in1[20] ^ in2[20];
    assign G[12] = in1[19] & in2[19];
    assign P[12] = in1[19] ^ in2[19];
    assign G[13] = in1[18] & in2[18];
    assign P[13] = in1[18] ^ in2[18];
    assign G[14] = in1[17] & in2[17];
    assign P[14] = in1[17] ^ in2[17];
    assign G[15] = in1[16] & in2[16];
    assign P[15] = in1[16] ^ in2[16];
    assign G[16] = in1[15] & in2[15];
    assign P[16] = in1[15] ^ in2[15];
    assign G[17] = in1[14] & in2[14];
    assign P[17] = in1[14] ^ in2[14];
    assign G[18] = in1[13] & in2[13];
    assign P[18] = in1[13] ^ in2[13];
    assign G[19] = in1[12] & in2[12];
    assign P[19] = in1[12] ^ in2[12];
    assign G[20] = in1[11] & in2[11];
    assign P[20] = in1[11] ^ in2[11];
    assign G[21] = in1[10] & in2[10];
    assign P[21] = in1[10] ^ in2[10];
    assign G[22] = in1[9] & in2[9];
    assign P[22] = in1[9] ^ in2[9];
    assign G[23] = in1[8] & in2[8];
    assign P[23] = in1[8] ^ in2[8];
    assign G[24] = in1[7] & in2[7];
    assign P[24] = in1[7] ^ in2[7];
    assign G[25] = in1[6] & in2[6];
    assign P[25] = in1[6] ^ in2[6];
    assign G[26] = in1[5] & in2[5];
    assign P[26] = in1[5] ^ in2[5];
    assign G[27] = in1[4] & in2[4];
    assign P[27] = in1[4] ^ in2[4];
    assign G[28] = in1[3] & in2[3];
    assign P[28] = in1[3] ^ in2[3];
    assign G[29] = in1[2] & in2[2];
    assign P[29] = in1[2] ^ in2[2];
    assign G[30] = in1[1] & in2[1];
    assign P[30] = in1[1] ^ in2[1];
    assign G[31] = in1[0] & in2[0];
    assign P[31] = in1[0] ^ in2[0];


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
    assign cout = G[31] | (P[31] & C[31]);
    assign sum = P ^ C;
endmodule

module CLA_31(output [30:0] sum, output cout, input [30:0] in1, input [30:0] in2);

    wire[30:0] G;
    wire[30:0] C;
    wire[30:0] P;

    assign G[0] = in1[30] & in2[30];
    assign P[0] = in1[30] ^ in2[30];
    assign G[1] = in1[29] & in2[29];
    assign P[1] = in1[29] ^ in2[29];
    assign G[2] = in1[28] & in2[28];
    assign P[2] = in1[28] ^ in2[28];
    assign G[3] = in1[27] & in2[27];
    assign P[3] = in1[27] ^ in2[27];
    assign G[4] = in1[26] & in2[26];
    assign P[4] = in1[26] ^ in2[26];
    assign G[5] = in1[25] & in2[25];
    assign P[5] = in1[25] ^ in2[25];
    assign G[6] = in1[24] & in2[24];
    assign P[6] = in1[24] ^ in2[24];
    assign G[7] = in1[23] & in2[23];
    assign P[7] = in1[23] ^ in2[23];
    assign G[8] = in1[22] & in2[22];
    assign P[8] = in1[22] ^ in2[22];
    assign G[9] = in1[21] & in2[21];
    assign P[9] = in1[21] ^ in2[21];
    assign G[10] = in1[20] & in2[20];
    assign P[10] = in1[20] ^ in2[20];
    assign G[11] = in1[19] & in2[19];
    assign P[11] = in1[19] ^ in2[19];
    assign G[12] = in1[18] & in2[18];
    assign P[12] = in1[18] ^ in2[18];
    assign G[13] = in1[17] & in2[17];
    assign P[13] = in1[17] ^ in2[17];
    assign G[14] = in1[16] & in2[16];
    assign P[14] = in1[16] ^ in2[16];
    assign G[15] = in1[15] & in2[15];
    assign P[15] = in1[15] ^ in2[15];
    assign G[16] = in1[14] & in2[14];
    assign P[16] = in1[14] ^ in2[14];
    assign G[17] = in1[13] & in2[13];
    assign P[17] = in1[13] ^ in2[13];
    assign G[18] = in1[12] & in2[12];
    assign P[18] = in1[12] ^ in2[12];
    assign G[19] = in1[11] & in2[11];
    assign P[19] = in1[11] ^ in2[11];
    assign G[20] = in1[10] & in2[10];
    assign P[20] = in1[10] ^ in2[10];
    assign G[21] = in1[9] & in2[9];
    assign P[21] = in1[9] ^ in2[9];
    assign G[22] = in1[8] & in2[8];
    assign P[22] = in1[8] ^ in2[8];
    assign G[23] = in1[7] & in2[7];
    assign P[23] = in1[7] ^ in2[7];
    assign G[24] = in1[6] & in2[6];
    assign P[24] = in1[6] ^ in2[6];
    assign G[25] = in1[5] & in2[5];
    assign P[25] = in1[5] ^ in2[5];
    assign G[26] = in1[4] & in2[4];
    assign P[26] = in1[4] ^ in2[4];
    assign G[27] = in1[3] & in2[3];
    assign P[27] = in1[3] ^ in2[3];
    assign G[28] = in1[2] & in2[2];
    assign P[28] = in1[2] ^ in2[2];
    assign G[29] = in1[1] & in2[1];
    assign P[29] = in1[1] ^ in2[1];
    assign G[30] = in1[0] & in2[0];
    assign P[30] = in1[0] ^ in2[0];


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
    assign cout = G[30] | (P[30] & C[30]);
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

module CLA_29(output [28:0] sum, output cout, input [28:0] in1, input [28:0] in2);

    wire[28:0] G;
    wire[28:0] C;
    wire[28:0] P;

    assign G[0] = in1[28] & in2[28];
    assign P[0] = in1[28] ^ in2[28];
    assign G[1] = in1[27] & in2[27];
    assign P[1] = in1[27] ^ in2[27];
    assign G[2] = in1[26] & in2[26];
    assign P[2] = in1[26] ^ in2[26];
    assign G[3] = in1[25] & in2[25];
    assign P[3] = in1[25] ^ in2[25];
    assign G[4] = in1[24] & in2[24];
    assign P[4] = in1[24] ^ in2[24];
    assign G[5] = in1[23] & in2[23];
    assign P[5] = in1[23] ^ in2[23];
    assign G[6] = in1[22] & in2[22];
    assign P[6] = in1[22] ^ in2[22];
    assign G[7] = in1[21] & in2[21];
    assign P[7] = in1[21] ^ in2[21];
    assign G[8] = in1[20] & in2[20];
    assign P[8] = in1[20] ^ in2[20];
    assign G[9] = in1[19] & in2[19];
    assign P[9] = in1[19] ^ in2[19];
    assign G[10] = in1[18] & in2[18];
    assign P[10] = in1[18] ^ in2[18];
    assign G[11] = in1[17] & in2[17];
    assign P[11] = in1[17] ^ in2[17];
    assign G[12] = in1[16] & in2[16];
    assign P[12] = in1[16] ^ in2[16];
    assign G[13] = in1[15] & in2[15];
    assign P[13] = in1[15] ^ in2[15];
    assign G[14] = in1[14] & in2[14];
    assign P[14] = in1[14] ^ in2[14];
    assign G[15] = in1[13] & in2[13];
    assign P[15] = in1[13] ^ in2[13];
    assign G[16] = in1[12] & in2[12];
    assign P[16] = in1[12] ^ in2[12];
    assign G[17] = in1[11] & in2[11];
    assign P[17] = in1[11] ^ in2[11];
    assign G[18] = in1[10] & in2[10];
    assign P[18] = in1[10] ^ in2[10];
    assign G[19] = in1[9] & in2[9];
    assign P[19] = in1[9] ^ in2[9];
    assign G[20] = in1[8] & in2[8];
    assign P[20] = in1[8] ^ in2[8];
    assign G[21] = in1[7] & in2[7];
    assign P[21] = in1[7] ^ in2[7];
    assign G[22] = in1[6] & in2[6];
    assign P[22] = in1[6] ^ in2[6];
    assign G[23] = in1[5] & in2[5];
    assign P[23] = in1[5] ^ in2[5];
    assign G[24] = in1[4] & in2[4];
    assign P[24] = in1[4] ^ in2[4];
    assign G[25] = in1[3] & in2[3];
    assign P[25] = in1[3] ^ in2[3];
    assign G[26] = in1[2] & in2[2];
    assign P[26] = in1[2] ^ in2[2];
    assign G[27] = in1[1] & in2[1];
    assign P[27] = in1[1] ^ in2[1];
    assign G[28] = in1[0] & in2[0];
    assign P[28] = in1[0] ^ in2[0];


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
    assign cout = G[28] | (P[28] & C[28]);
    assign sum = P ^ C;
endmodule

module CLA_28(output [27:0] sum, output cout, input [27:0] in1, input [27:0] in2);

    wire[27:0] G;
    wire[27:0] C;
    wire[27:0] P;

    assign G[0] = in1[27] & in2[27];
    assign P[0] = in1[27] ^ in2[27];
    assign G[1] = in1[26] & in2[26];
    assign P[1] = in1[26] ^ in2[26];
    assign G[2] = in1[25] & in2[25];
    assign P[2] = in1[25] ^ in2[25];
    assign G[3] = in1[24] & in2[24];
    assign P[3] = in1[24] ^ in2[24];
    assign G[4] = in1[23] & in2[23];
    assign P[4] = in1[23] ^ in2[23];
    assign G[5] = in1[22] & in2[22];
    assign P[5] = in1[22] ^ in2[22];
    assign G[6] = in1[21] & in2[21];
    assign P[6] = in1[21] ^ in2[21];
    assign G[7] = in1[20] & in2[20];
    assign P[7] = in1[20] ^ in2[20];
    assign G[8] = in1[19] & in2[19];
    assign P[8] = in1[19] ^ in2[19];
    assign G[9] = in1[18] & in2[18];
    assign P[9] = in1[18] ^ in2[18];
    assign G[10] = in1[17] & in2[17];
    assign P[10] = in1[17] ^ in2[17];
    assign G[11] = in1[16] & in2[16];
    assign P[11] = in1[16] ^ in2[16];
    assign G[12] = in1[15] & in2[15];
    assign P[12] = in1[15] ^ in2[15];
    assign G[13] = in1[14] & in2[14];
    assign P[13] = in1[14] ^ in2[14];
    assign G[14] = in1[13] & in2[13];
    assign P[14] = in1[13] ^ in2[13];
    assign G[15] = in1[12] & in2[12];
    assign P[15] = in1[12] ^ in2[12];
    assign G[16] = in1[11] & in2[11];
    assign P[16] = in1[11] ^ in2[11];
    assign G[17] = in1[10] & in2[10];
    assign P[17] = in1[10] ^ in2[10];
    assign G[18] = in1[9] & in2[9];
    assign P[18] = in1[9] ^ in2[9];
    assign G[19] = in1[8] & in2[8];
    assign P[19] = in1[8] ^ in2[8];
    assign G[20] = in1[7] & in2[7];
    assign P[20] = in1[7] ^ in2[7];
    assign G[21] = in1[6] & in2[6];
    assign P[21] = in1[6] ^ in2[6];
    assign G[22] = in1[5] & in2[5];
    assign P[22] = in1[5] ^ in2[5];
    assign G[23] = in1[4] & in2[4];
    assign P[23] = in1[4] ^ in2[4];
    assign G[24] = in1[3] & in2[3];
    assign P[24] = in1[3] ^ in2[3];
    assign G[25] = in1[2] & in2[2];
    assign P[25] = in1[2] ^ in2[2];
    assign G[26] = in1[1] & in2[1];
    assign P[26] = in1[1] ^ in2[1];
    assign G[27] = in1[0] & in2[0];
    assign P[27] = in1[0] ^ in2[0];


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
    assign cout = G[27] | (P[27] & C[27]);
    assign sum = P ^ C;
endmodule

module CLA_27(output [26:0] sum, output cout, input [26:0] in1, input [26:0] in2);

    wire[26:0] G;
    wire[26:0] C;
    wire[26:0] P;

    assign G[0] = in1[26] & in2[26];
    assign P[0] = in1[26] ^ in2[26];
    assign G[1] = in1[25] & in2[25];
    assign P[1] = in1[25] ^ in2[25];
    assign G[2] = in1[24] & in2[24];
    assign P[2] = in1[24] ^ in2[24];
    assign G[3] = in1[23] & in2[23];
    assign P[3] = in1[23] ^ in2[23];
    assign G[4] = in1[22] & in2[22];
    assign P[4] = in1[22] ^ in2[22];
    assign G[5] = in1[21] & in2[21];
    assign P[5] = in1[21] ^ in2[21];
    assign G[6] = in1[20] & in2[20];
    assign P[6] = in1[20] ^ in2[20];
    assign G[7] = in1[19] & in2[19];
    assign P[7] = in1[19] ^ in2[19];
    assign G[8] = in1[18] & in2[18];
    assign P[8] = in1[18] ^ in2[18];
    assign G[9] = in1[17] & in2[17];
    assign P[9] = in1[17] ^ in2[17];
    assign G[10] = in1[16] & in2[16];
    assign P[10] = in1[16] ^ in2[16];
    assign G[11] = in1[15] & in2[15];
    assign P[11] = in1[15] ^ in2[15];
    assign G[12] = in1[14] & in2[14];
    assign P[12] = in1[14] ^ in2[14];
    assign G[13] = in1[13] & in2[13];
    assign P[13] = in1[13] ^ in2[13];
    assign G[14] = in1[12] & in2[12];
    assign P[14] = in1[12] ^ in2[12];
    assign G[15] = in1[11] & in2[11];
    assign P[15] = in1[11] ^ in2[11];
    assign G[16] = in1[10] & in2[10];
    assign P[16] = in1[10] ^ in2[10];
    assign G[17] = in1[9] & in2[9];
    assign P[17] = in1[9] ^ in2[9];
    assign G[18] = in1[8] & in2[8];
    assign P[18] = in1[8] ^ in2[8];
    assign G[19] = in1[7] & in2[7];
    assign P[19] = in1[7] ^ in2[7];
    assign G[20] = in1[6] & in2[6];
    assign P[20] = in1[6] ^ in2[6];
    assign G[21] = in1[5] & in2[5];
    assign P[21] = in1[5] ^ in2[5];
    assign G[22] = in1[4] & in2[4];
    assign P[22] = in1[4] ^ in2[4];
    assign G[23] = in1[3] & in2[3];
    assign P[23] = in1[3] ^ in2[3];
    assign G[24] = in1[2] & in2[2];
    assign P[24] = in1[2] ^ in2[2];
    assign G[25] = in1[1] & in2[1];
    assign P[25] = in1[1] ^ in2[1];
    assign G[26] = in1[0] & in2[0];
    assign P[26] = in1[0] ^ in2[0];


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
    assign cout = G[26] | (P[26] & C[26]);
    assign sum = P ^ C;
endmodule

module CLA_26(output [25:0] sum, output cout, input [25:0] in1, input [25:0] in2);

    wire[25:0] G;
    wire[25:0] C;
    wire[25:0] P;

    assign G[0] = in1[25] & in2[25];
    assign P[0] = in1[25] ^ in2[25];
    assign G[1] = in1[24] & in2[24];
    assign P[1] = in1[24] ^ in2[24];
    assign G[2] = in1[23] & in2[23];
    assign P[2] = in1[23] ^ in2[23];
    assign G[3] = in1[22] & in2[22];
    assign P[3] = in1[22] ^ in2[22];
    assign G[4] = in1[21] & in2[21];
    assign P[4] = in1[21] ^ in2[21];
    assign G[5] = in1[20] & in2[20];
    assign P[5] = in1[20] ^ in2[20];
    assign G[6] = in1[19] & in2[19];
    assign P[6] = in1[19] ^ in2[19];
    assign G[7] = in1[18] & in2[18];
    assign P[7] = in1[18] ^ in2[18];
    assign G[8] = in1[17] & in2[17];
    assign P[8] = in1[17] ^ in2[17];
    assign G[9] = in1[16] & in2[16];
    assign P[9] = in1[16] ^ in2[16];
    assign G[10] = in1[15] & in2[15];
    assign P[10] = in1[15] ^ in2[15];
    assign G[11] = in1[14] & in2[14];
    assign P[11] = in1[14] ^ in2[14];
    assign G[12] = in1[13] & in2[13];
    assign P[12] = in1[13] ^ in2[13];
    assign G[13] = in1[12] & in2[12];
    assign P[13] = in1[12] ^ in2[12];
    assign G[14] = in1[11] & in2[11];
    assign P[14] = in1[11] ^ in2[11];
    assign G[15] = in1[10] & in2[10];
    assign P[15] = in1[10] ^ in2[10];
    assign G[16] = in1[9] & in2[9];
    assign P[16] = in1[9] ^ in2[9];
    assign G[17] = in1[8] & in2[8];
    assign P[17] = in1[8] ^ in2[8];
    assign G[18] = in1[7] & in2[7];
    assign P[18] = in1[7] ^ in2[7];
    assign G[19] = in1[6] & in2[6];
    assign P[19] = in1[6] ^ in2[6];
    assign G[20] = in1[5] & in2[5];
    assign P[20] = in1[5] ^ in2[5];
    assign G[21] = in1[4] & in2[4];
    assign P[21] = in1[4] ^ in2[4];
    assign G[22] = in1[3] & in2[3];
    assign P[22] = in1[3] ^ in2[3];
    assign G[23] = in1[2] & in2[2];
    assign P[23] = in1[2] ^ in2[2];
    assign G[24] = in1[1] & in2[1];
    assign P[24] = in1[1] ^ in2[1];
    assign G[25] = in1[0] & in2[0];
    assign P[25] = in1[0] ^ in2[0];


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
    assign cout = G[25] | (P[25] & C[25]);
    assign sum = P ^ C;
endmodule

module CLA_25(output [24:0] sum, output cout, input [24:0] in1, input [24:0] in2);

    wire[24:0] G;
    wire[24:0] C;
    wire[24:0] P;

    assign G[0] = in1[24] & in2[24];
    assign P[0] = in1[24] ^ in2[24];
    assign G[1] = in1[23] & in2[23];
    assign P[1] = in1[23] ^ in2[23];
    assign G[2] = in1[22] & in2[22];
    assign P[2] = in1[22] ^ in2[22];
    assign G[3] = in1[21] & in2[21];
    assign P[3] = in1[21] ^ in2[21];
    assign G[4] = in1[20] & in2[20];
    assign P[4] = in1[20] ^ in2[20];
    assign G[5] = in1[19] & in2[19];
    assign P[5] = in1[19] ^ in2[19];
    assign G[6] = in1[18] & in2[18];
    assign P[6] = in1[18] ^ in2[18];
    assign G[7] = in1[17] & in2[17];
    assign P[7] = in1[17] ^ in2[17];
    assign G[8] = in1[16] & in2[16];
    assign P[8] = in1[16] ^ in2[16];
    assign G[9] = in1[15] & in2[15];
    assign P[9] = in1[15] ^ in2[15];
    assign G[10] = in1[14] & in2[14];
    assign P[10] = in1[14] ^ in2[14];
    assign G[11] = in1[13] & in2[13];
    assign P[11] = in1[13] ^ in2[13];
    assign G[12] = in1[12] & in2[12];
    assign P[12] = in1[12] ^ in2[12];
    assign G[13] = in1[11] & in2[11];
    assign P[13] = in1[11] ^ in2[11];
    assign G[14] = in1[10] & in2[10];
    assign P[14] = in1[10] ^ in2[10];
    assign G[15] = in1[9] & in2[9];
    assign P[15] = in1[9] ^ in2[9];
    assign G[16] = in1[8] & in2[8];
    assign P[16] = in1[8] ^ in2[8];
    assign G[17] = in1[7] & in2[7];
    assign P[17] = in1[7] ^ in2[7];
    assign G[18] = in1[6] & in2[6];
    assign P[18] = in1[6] ^ in2[6];
    assign G[19] = in1[5] & in2[5];
    assign P[19] = in1[5] ^ in2[5];
    assign G[20] = in1[4] & in2[4];
    assign P[20] = in1[4] ^ in2[4];
    assign G[21] = in1[3] & in2[3];
    assign P[21] = in1[3] ^ in2[3];
    assign G[22] = in1[2] & in2[2];
    assign P[22] = in1[2] ^ in2[2];
    assign G[23] = in1[1] & in2[1];
    assign P[23] = in1[1] ^ in2[1];
    assign G[24] = in1[0] & in2[0];
    assign P[24] = in1[0] ^ in2[0];


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
    assign cout = G[24] | (P[24] & C[24]);
    assign sum = P ^ C;
endmodule

module CLA_24(output [23:0] sum, output cout, input [23:0] in1, input [23:0] in2);

    wire[23:0] G;
    wire[23:0] C;
    wire[23:0] P;

    assign G[0] = in1[23] & in2[23];
    assign P[0] = in1[23] ^ in2[23];
    assign G[1] = in1[22] & in2[22];
    assign P[1] = in1[22] ^ in2[22];
    assign G[2] = in1[21] & in2[21];
    assign P[2] = in1[21] ^ in2[21];
    assign G[3] = in1[20] & in2[20];
    assign P[3] = in1[20] ^ in2[20];
    assign G[4] = in1[19] & in2[19];
    assign P[4] = in1[19] ^ in2[19];
    assign G[5] = in1[18] & in2[18];
    assign P[5] = in1[18] ^ in2[18];
    assign G[6] = in1[17] & in2[17];
    assign P[6] = in1[17] ^ in2[17];
    assign G[7] = in1[16] & in2[16];
    assign P[7] = in1[16] ^ in2[16];
    assign G[8] = in1[15] & in2[15];
    assign P[8] = in1[15] ^ in2[15];
    assign G[9] = in1[14] & in2[14];
    assign P[9] = in1[14] ^ in2[14];
    assign G[10] = in1[13] & in2[13];
    assign P[10] = in1[13] ^ in2[13];
    assign G[11] = in1[12] & in2[12];
    assign P[11] = in1[12] ^ in2[12];
    assign G[12] = in1[11] & in2[11];
    assign P[12] = in1[11] ^ in2[11];
    assign G[13] = in1[10] & in2[10];
    assign P[13] = in1[10] ^ in2[10];
    assign G[14] = in1[9] & in2[9];
    assign P[14] = in1[9] ^ in2[9];
    assign G[15] = in1[8] & in2[8];
    assign P[15] = in1[8] ^ in2[8];
    assign G[16] = in1[7] & in2[7];
    assign P[16] = in1[7] ^ in2[7];
    assign G[17] = in1[6] & in2[6];
    assign P[17] = in1[6] ^ in2[6];
    assign G[18] = in1[5] & in2[5];
    assign P[18] = in1[5] ^ in2[5];
    assign G[19] = in1[4] & in2[4];
    assign P[19] = in1[4] ^ in2[4];
    assign G[20] = in1[3] & in2[3];
    assign P[20] = in1[3] ^ in2[3];
    assign G[21] = in1[2] & in2[2];
    assign P[21] = in1[2] ^ in2[2];
    assign G[22] = in1[1] & in2[1];
    assign P[22] = in1[1] ^ in2[1];
    assign G[23] = in1[0] & in2[0];
    assign P[23] = in1[0] ^ in2[0];


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
    assign cout = G[23] | (P[23] & C[23]);
    assign sum = P ^ C;
endmodule

module CLA_23(output [22:0] sum, output cout, input [22:0] in1, input [22:0] in2);

    wire[22:0] G;
    wire[22:0] C;
    wire[22:0] P;

    assign G[0] = in1[22] & in2[22];
    assign P[0] = in1[22] ^ in2[22];
    assign G[1] = in1[21] & in2[21];
    assign P[1] = in1[21] ^ in2[21];
    assign G[2] = in1[20] & in2[20];
    assign P[2] = in1[20] ^ in2[20];
    assign G[3] = in1[19] & in2[19];
    assign P[3] = in1[19] ^ in2[19];
    assign G[4] = in1[18] & in2[18];
    assign P[4] = in1[18] ^ in2[18];
    assign G[5] = in1[17] & in2[17];
    assign P[5] = in1[17] ^ in2[17];
    assign G[6] = in1[16] & in2[16];
    assign P[6] = in1[16] ^ in2[16];
    assign G[7] = in1[15] & in2[15];
    assign P[7] = in1[15] ^ in2[15];
    assign G[8] = in1[14] & in2[14];
    assign P[8] = in1[14] ^ in2[14];
    assign G[9] = in1[13] & in2[13];
    assign P[9] = in1[13] ^ in2[13];
    assign G[10] = in1[12] & in2[12];
    assign P[10] = in1[12] ^ in2[12];
    assign G[11] = in1[11] & in2[11];
    assign P[11] = in1[11] ^ in2[11];
    assign G[12] = in1[10] & in2[10];
    assign P[12] = in1[10] ^ in2[10];
    assign G[13] = in1[9] & in2[9];
    assign P[13] = in1[9] ^ in2[9];
    assign G[14] = in1[8] & in2[8];
    assign P[14] = in1[8] ^ in2[8];
    assign G[15] = in1[7] & in2[7];
    assign P[15] = in1[7] ^ in2[7];
    assign G[16] = in1[6] & in2[6];
    assign P[16] = in1[6] ^ in2[6];
    assign G[17] = in1[5] & in2[5];
    assign P[17] = in1[5] ^ in2[5];
    assign G[18] = in1[4] & in2[4];
    assign P[18] = in1[4] ^ in2[4];
    assign G[19] = in1[3] & in2[3];
    assign P[19] = in1[3] ^ in2[3];
    assign G[20] = in1[2] & in2[2];
    assign P[20] = in1[2] ^ in2[2];
    assign G[21] = in1[1] & in2[1];
    assign P[21] = in1[1] ^ in2[1];
    assign G[22] = in1[0] & in2[0];
    assign P[22] = in1[0] ^ in2[0];


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
    assign cout = G[22] | (P[22] & C[22]);
    assign sum = P ^ C;
endmodule

module CLA_22(output [21:0] sum, output cout, input [21:0] in1, input [21:0] in2);

    wire[21:0] G;
    wire[21:0] C;
    wire[21:0] P;

    assign G[0] = in1[21] & in2[21];
    assign P[0] = in1[21] ^ in2[21];
    assign G[1] = in1[20] & in2[20];
    assign P[1] = in1[20] ^ in2[20];
    assign G[2] = in1[19] & in2[19];
    assign P[2] = in1[19] ^ in2[19];
    assign G[3] = in1[18] & in2[18];
    assign P[3] = in1[18] ^ in2[18];
    assign G[4] = in1[17] & in2[17];
    assign P[4] = in1[17] ^ in2[17];
    assign G[5] = in1[16] & in2[16];
    assign P[5] = in1[16] ^ in2[16];
    assign G[6] = in1[15] & in2[15];
    assign P[6] = in1[15] ^ in2[15];
    assign G[7] = in1[14] & in2[14];
    assign P[7] = in1[14] ^ in2[14];
    assign G[8] = in1[13] & in2[13];
    assign P[8] = in1[13] ^ in2[13];
    assign G[9] = in1[12] & in2[12];
    assign P[9] = in1[12] ^ in2[12];
    assign G[10] = in1[11] & in2[11];
    assign P[10] = in1[11] ^ in2[11];
    assign G[11] = in1[10] & in2[10];
    assign P[11] = in1[10] ^ in2[10];
    assign G[12] = in1[9] & in2[9];
    assign P[12] = in1[9] ^ in2[9];
    assign G[13] = in1[8] & in2[8];
    assign P[13] = in1[8] ^ in2[8];
    assign G[14] = in1[7] & in2[7];
    assign P[14] = in1[7] ^ in2[7];
    assign G[15] = in1[6] & in2[6];
    assign P[15] = in1[6] ^ in2[6];
    assign G[16] = in1[5] & in2[5];
    assign P[16] = in1[5] ^ in2[5];
    assign G[17] = in1[4] & in2[4];
    assign P[17] = in1[4] ^ in2[4];
    assign G[18] = in1[3] & in2[3];
    assign P[18] = in1[3] ^ in2[3];
    assign G[19] = in1[2] & in2[2];
    assign P[19] = in1[2] ^ in2[2];
    assign G[20] = in1[1] & in2[1];
    assign P[20] = in1[1] ^ in2[1];
    assign G[21] = in1[0] & in2[0];
    assign P[21] = in1[0] ^ in2[0];


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
    assign cout = G[21] | (P[21] & C[21]);
    assign sum = P ^ C;
endmodule

module CLA_21(output [20:0] sum, output cout, input [20:0] in1, input [20:0] in2);

    wire[20:0] G;
    wire[20:0] C;
    wire[20:0] P;

    assign G[0] = in1[20] & in2[20];
    assign P[0] = in1[20] ^ in2[20];
    assign G[1] = in1[19] & in2[19];
    assign P[1] = in1[19] ^ in2[19];
    assign G[2] = in1[18] & in2[18];
    assign P[2] = in1[18] ^ in2[18];
    assign G[3] = in1[17] & in2[17];
    assign P[3] = in1[17] ^ in2[17];
    assign G[4] = in1[16] & in2[16];
    assign P[4] = in1[16] ^ in2[16];
    assign G[5] = in1[15] & in2[15];
    assign P[5] = in1[15] ^ in2[15];
    assign G[6] = in1[14] & in2[14];
    assign P[6] = in1[14] ^ in2[14];
    assign G[7] = in1[13] & in2[13];
    assign P[7] = in1[13] ^ in2[13];
    assign G[8] = in1[12] & in2[12];
    assign P[8] = in1[12] ^ in2[12];
    assign G[9] = in1[11] & in2[11];
    assign P[9] = in1[11] ^ in2[11];
    assign G[10] = in1[10] & in2[10];
    assign P[10] = in1[10] ^ in2[10];
    assign G[11] = in1[9] & in2[9];
    assign P[11] = in1[9] ^ in2[9];
    assign G[12] = in1[8] & in2[8];
    assign P[12] = in1[8] ^ in2[8];
    assign G[13] = in1[7] & in2[7];
    assign P[13] = in1[7] ^ in2[7];
    assign G[14] = in1[6] & in2[6];
    assign P[14] = in1[6] ^ in2[6];
    assign G[15] = in1[5] & in2[5];
    assign P[15] = in1[5] ^ in2[5];
    assign G[16] = in1[4] & in2[4];
    assign P[16] = in1[4] ^ in2[4];
    assign G[17] = in1[3] & in2[3];
    assign P[17] = in1[3] ^ in2[3];
    assign G[18] = in1[2] & in2[2];
    assign P[18] = in1[2] ^ in2[2];
    assign G[19] = in1[1] & in2[1];
    assign P[19] = in1[1] ^ in2[1];
    assign G[20] = in1[0] & in2[0];
    assign P[20] = in1[0] ^ in2[0];


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
    assign cout = G[20] | (P[20] & C[20]);
    assign sum = P ^ C;
endmodule

module CLA_20(output [19:0] sum, output cout, input [19:0] in1, input [19:0] in2);

    wire[19:0] G;
    wire[19:0] C;
    wire[19:0] P;

    assign G[0] = in1[19] & in2[19];
    assign P[0] = in1[19] ^ in2[19];
    assign G[1] = in1[18] & in2[18];
    assign P[1] = in1[18] ^ in2[18];
    assign G[2] = in1[17] & in2[17];
    assign P[2] = in1[17] ^ in2[17];
    assign G[3] = in1[16] & in2[16];
    assign P[3] = in1[16] ^ in2[16];
    assign G[4] = in1[15] & in2[15];
    assign P[4] = in1[15] ^ in2[15];
    assign G[5] = in1[14] & in2[14];
    assign P[5] = in1[14] ^ in2[14];
    assign G[6] = in1[13] & in2[13];
    assign P[6] = in1[13] ^ in2[13];
    assign G[7] = in1[12] & in2[12];
    assign P[7] = in1[12] ^ in2[12];
    assign G[8] = in1[11] & in2[11];
    assign P[8] = in1[11] ^ in2[11];
    assign G[9] = in1[10] & in2[10];
    assign P[9] = in1[10] ^ in2[10];
    assign G[10] = in1[9] & in2[9];
    assign P[10] = in1[9] ^ in2[9];
    assign G[11] = in1[8] & in2[8];
    assign P[11] = in1[8] ^ in2[8];
    assign G[12] = in1[7] & in2[7];
    assign P[12] = in1[7] ^ in2[7];
    assign G[13] = in1[6] & in2[6];
    assign P[13] = in1[6] ^ in2[6];
    assign G[14] = in1[5] & in2[5];
    assign P[14] = in1[5] ^ in2[5];
    assign G[15] = in1[4] & in2[4];
    assign P[15] = in1[4] ^ in2[4];
    assign G[16] = in1[3] & in2[3];
    assign P[16] = in1[3] ^ in2[3];
    assign G[17] = in1[2] & in2[2];
    assign P[17] = in1[2] ^ in2[2];
    assign G[18] = in1[1] & in2[1];
    assign P[18] = in1[1] ^ in2[1];
    assign G[19] = in1[0] & in2[0];
    assign P[19] = in1[0] ^ in2[0];


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
    assign cout = G[19] | (P[19] & C[19]);
    assign sum = P ^ C;
endmodule

module CLA_19(output [18:0] sum, output cout, input [18:0] in1, input [18:0] in2);

    wire[18:0] G;
    wire[18:0] C;
    wire[18:0] P;

    assign G[0] = in1[18] & in2[18];
    assign P[0] = in1[18] ^ in2[18];
    assign G[1] = in1[17] & in2[17];
    assign P[1] = in1[17] ^ in2[17];
    assign G[2] = in1[16] & in2[16];
    assign P[2] = in1[16] ^ in2[16];
    assign G[3] = in1[15] & in2[15];
    assign P[3] = in1[15] ^ in2[15];
    assign G[4] = in1[14] & in2[14];
    assign P[4] = in1[14] ^ in2[14];
    assign G[5] = in1[13] & in2[13];
    assign P[5] = in1[13] ^ in2[13];
    assign G[6] = in1[12] & in2[12];
    assign P[6] = in1[12] ^ in2[12];
    assign G[7] = in1[11] & in2[11];
    assign P[7] = in1[11] ^ in2[11];
    assign G[8] = in1[10] & in2[10];
    assign P[8] = in1[10] ^ in2[10];
    assign G[9] = in1[9] & in2[9];
    assign P[9] = in1[9] ^ in2[9];
    assign G[10] = in1[8] & in2[8];
    assign P[10] = in1[8] ^ in2[8];
    assign G[11] = in1[7] & in2[7];
    assign P[11] = in1[7] ^ in2[7];
    assign G[12] = in1[6] & in2[6];
    assign P[12] = in1[6] ^ in2[6];
    assign G[13] = in1[5] & in2[5];
    assign P[13] = in1[5] ^ in2[5];
    assign G[14] = in1[4] & in2[4];
    assign P[14] = in1[4] ^ in2[4];
    assign G[15] = in1[3] & in2[3];
    assign P[15] = in1[3] ^ in2[3];
    assign G[16] = in1[2] & in2[2];
    assign P[16] = in1[2] ^ in2[2];
    assign G[17] = in1[1] & in2[1];
    assign P[17] = in1[1] ^ in2[1];
    assign G[18] = in1[0] & in2[0];
    assign P[18] = in1[0] ^ in2[0];


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
    assign cout = G[18] | (P[18] & C[18]);
    assign sum = P ^ C;
endmodule

module CLA_18(output [17:0] sum, output cout, input [17:0] in1, input [17:0] in2);

    wire[17:0] G;
    wire[17:0] C;
    wire[17:0] P;

    assign G[0] = in1[17] & in2[17];
    assign P[0] = in1[17] ^ in2[17];
    assign G[1] = in1[16] & in2[16];
    assign P[1] = in1[16] ^ in2[16];
    assign G[2] = in1[15] & in2[15];
    assign P[2] = in1[15] ^ in2[15];
    assign G[3] = in1[14] & in2[14];
    assign P[3] = in1[14] ^ in2[14];
    assign G[4] = in1[13] & in2[13];
    assign P[4] = in1[13] ^ in2[13];
    assign G[5] = in1[12] & in2[12];
    assign P[5] = in1[12] ^ in2[12];
    assign G[6] = in1[11] & in2[11];
    assign P[6] = in1[11] ^ in2[11];
    assign G[7] = in1[10] & in2[10];
    assign P[7] = in1[10] ^ in2[10];
    assign G[8] = in1[9] & in2[9];
    assign P[8] = in1[9] ^ in2[9];
    assign G[9] = in1[8] & in2[8];
    assign P[9] = in1[8] ^ in2[8];
    assign G[10] = in1[7] & in2[7];
    assign P[10] = in1[7] ^ in2[7];
    assign G[11] = in1[6] & in2[6];
    assign P[11] = in1[6] ^ in2[6];
    assign G[12] = in1[5] & in2[5];
    assign P[12] = in1[5] ^ in2[5];
    assign G[13] = in1[4] & in2[4];
    assign P[13] = in1[4] ^ in2[4];
    assign G[14] = in1[3] & in2[3];
    assign P[14] = in1[3] ^ in2[3];
    assign G[15] = in1[2] & in2[2];
    assign P[15] = in1[2] ^ in2[2];
    assign G[16] = in1[1] & in2[1];
    assign P[16] = in1[1] ^ in2[1];
    assign G[17] = in1[0] & in2[0];
    assign P[17] = in1[0] ^ in2[0];


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
    assign cout = G[17] | (P[17] & C[17]);
    assign sum = P ^ C;
endmodule

module CLA_17(output [16:0] sum, output cout, input [16:0] in1, input [16:0] in2);

    wire[16:0] G;
    wire[16:0] C;
    wire[16:0] P;

    assign G[0] = in1[16] & in2[16];
    assign P[0] = in1[16] ^ in2[16];
    assign G[1] = in1[15] & in2[15];
    assign P[1] = in1[15] ^ in2[15];
    assign G[2] = in1[14] & in2[14];
    assign P[2] = in1[14] ^ in2[14];
    assign G[3] = in1[13] & in2[13];
    assign P[3] = in1[13] ^ in2[13];
    assign G[4] = in1[12] & in2[12];
    assign P[4] = in1[12] ^ in2[12];
    assign G[5] = in1[11] & in2[11];
    assign P[5] = in1[11] ^ in2[11];
    assign G[6] = in1[10] & in2[10];
    assign P[6] = in1[10] ^ in2[10];
    assign G[7] = in1[9] & in2[9];
    assign P[7] = in1[9] ^ in2[9];
    assign G[8] = in1[8] & in2[8];
    assign P[8] = in1[8] ^ in2[8];
    assign G[9] = in1[7] & in2[7];
    assign P[9] = in1[7] ^ in2[7];
    assign G[10] = in1[6] & in2[6];
    assign P[10] = in1[6] ^ in2[6];
    assign G[11] = in1[5] & in2[5];
    assign P[11] = in1[5] ^ in2[5];
    assign G[12] = in1[4] & in2[4];
    assign P[12] = in1[4] ^ in2[4];
    assign G[13] = in1[3] & in2[3];
    assign P[13] = in1[3] ^ in2[3];
    assign G[14] = in1[2] & in2[2];
    assign P[14] = in1[2] ^ in2[2];
    assign G[15] = in1[1] & in2[1];
    assign P[15] = in1[1] ^ in2[1];
    assign G[16] = in1[0] & in2[0];
    assign P[16] = in1[0] ^ in2[0];


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
    assign cout = G[16] | (P[16] & C[16]);
    assign sum = P ^ C;
endmodule

module CLA_16(output [15:0] sum, output cout, input [15:0] in1, input [15:0] in2);

    wire[15:0] G;
    wire[15:0] C;
    wire[15:0] P;

    assign G[0] = in1[15] & in2[15];
    assign P[0] = in1[15] ^ in2[15];
    assign G[1] = in1[14] & in2[14];
    assign P[1] = in1[14] ^ in2[14];
    assign G[2] = in1[13] & in2[13];
    assign P[2] = in1[13] ^ in2[13];
    assign G[3] = in1[12] & in2[12];
    assign P[3] = in1[12] ^ in2[12];
    assign G[4] = in1[11] & in2[11];
    assign P[4] = in1[11] ^ in2[11];
    assign G[5] = in1[10] & in2[10];
    assign P[5] = in1[10] ^ in2[10];
    assign G[6] = in1[9] & in2[9];
    assign P[6] = in1[9] ^ in2[9];
    assign G[7] = in1[8] & in2[8];
    assign P[7] = in1[8] ^ in2[8];
    assign G[8] = in1[7] & in2[7];
    assign P[8] = in1[7] ^ in2[7];
    assign G[9] = in1[6] & in2[6];
    assign P[9] = in1[6] ^ in2[6];
    assign G[10] = in1[5] & in2[5];
    assign P[10] = in1[5] ^ in2[5];
    assign G[11] = in1[4] & in2[4];
    assign P[11] = in1[4] ^ in2[4];
    assign G[12] = in1[3] & in2[3];
    assign P[12] = in1[3] ^ in2[3];
    assign G[13] = in1[2] & in2[2];
    assign P[13] = in1[2] ^ in2[2];
    assign G[14] = in1[1] & in2[1];
    assign P[14] = in1[1] ^ in2[1];
    assign G[15] = in1[0] & in2[0];
    assign P[15] = in1[0] ^ in2[0];


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
    assign cout = G[15] | (P[15] & C[15]);
    assign sum = P ^ C;
endmodule

module CLA_15(output [14:0] sum, output cout, input [14:0] in1, input [14:0] in2);

    wire[14:0] G;
    wire[14:0] C;
    wire[14:0] P;

    assign G[0] = in1[14] & in2[14];
    assign P[0] = in1[14] ^ in2[14];
    assign G[1] = in1[13] & in2[13];
    assign P[1] = in1[13] ^ in2[13];
    assign G[2] = in1[12] & in2[12];
    assign P[2] = in1[12] ^ in2[12];
    assign G[3] = in1[11] & in2[11];
    assign P[3] = in1[11] ^ in2[11];
    assign G[4] = in1[10] & in2[10];
    assign P[4] = in1[10] ^ in2[10];
    assign G[5] = in1[9] & in2[9];
    assign P[5] = in1[9] ^ in2[9];
    assign G[6] = in1[8] & in2[8];
    assign P[6] = in1[8] ^ in2[8];
    assign G[7] = in1[7] & in2[7];
    assign P[7] = in1[7] ^ in2[7];
    assign G[8] = in1[6] & in2[6];
    assign P[8] = in1[6] ^ in2[6];
    assign G[9] = in1[5] & in2[5];
    assign P[9] = in1[5] ^ in2[5];
    assign G[10] = in1[4] & in2[4];
    assign P[10] = in1[4] ^ in2[4];
    assign G[11] = in1[3] & in2[3];
    assign P[11] = in1[3] ^ in2[3];
    assign G[12] = in1[2] & in2[2];
    assign P[12] = in1[2] ^ in2[2];
    assign G[13] = in1[1] & in2[1];
    assign P[13] = in1[1] ^ in2[1];
    assign G[14] = in1[0] & in2[0];
    assign P[14] = in1[0] ^ in2[0];


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
    assign cout = G[14] | (P[14] & C[14]);
    assign sum = P ^ C;
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

module CLA_13(output [12:0] sum, output cout, input [12:0] in1, input [12:0] in2);

    wire[12:0] G;
    wire[12:0] C;
    wire[12:0] P;

    assign G[0] = in1[12] & in2[12];
    assign P[0] = in1[12] ^ in2[12];
    assign G[1] = in1[11] & in2[11];
    assign P[1] = in1[11] ^ in2[11];
    assign G[2] = in1[10] & in2[10];
    assign P[2] = in1[10] ^ in2[10];
    assign G[3] = in1[9] & in2[9];
    assign P[3] = in1[9] ^ in2[9];
    assign G[4] = in1[8] & in2[8];
    assign P[4] = in1[8] ^ in2[8];
    assign G[5] = in1[7] & in2[7];
    assign P[5] = in1[7] ^ in2[7];
    assign G[6] = in1[6] & in2[6];
    assign P[6] = in1[6] ^ in2[6];
    assign G[7] = in1[5] & in2[5];
    assign P[7] = in1[5] ^ in2[5];
    assign G[8] = in1[4] & in2[4];
    assign P[8] = in1[4] ^ in2[4];
    assign G[9] = in1[3] & in2[3];
    assign P[9] = in1[3] ^ in2[3];
    assign G[10] = in1[2] & in2[2];
    assign P[10] = in1[2] ^ in2[2];
    assign G[11] = in1[1] & in2[1];
    assign P[11] = in1[1] ^ in2[1];
    assign G[12] = in1[0] & in2[0];
    assign P[12] = in1[0] ^ in2[0];


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
    assign cout = G[12] | (P[12] & C[12]);
    assign sum = P ^ C;
endmodule

module CLA_12(output [11:0] sum, output cout, input [11:0] in1, input [11:0] in2);

    wire[11:0] G;
    wire[11:0] C;
    wire[11:0] P;

    assign G[0] = in1[11] & in2[11];
    assign P[0] = in1[11] ^ in2[11];
    assign G[1] = in1[10] & in2[10];
    assign P[1] = in1[10] ^ in2[10];
    assign G[2] = in1[9] & in2[9];
    assign P[2] = in1[9] ^ in2[9];
    assign G[3] = in1[8] & in2[8];
    assign P[3] = in1[8] ^ in2[8];
    assign G[4] = in1[7] & in2[7];
    assign P[4] = in1[7] ^ in2[7];
    assign G[5] = in1[6] & in2[6];
    assign P[5] = in1[6] ^ in2[6];
    assign G[6] = in1[5] & in2[5];
    assign P[6] = in1[5] ^ in2[5];
    assign G[7] = in1[4] & in2[4];
    assign P[7] = in1[4] ^ in2[4];
    assign G[8] = in1[3] & in2[3];
    assign P[8] = in1[3] ^ in2[3];
    assign G[9] = in1[2] & in2[2];
    assign P[9] = in1[2] ^ in2[2];
    assign G[10] = in1[1] & in2[1];
    assign P[10] = in1[1] ^ in2[1];
    assign G[11] = in1[0] & in2[0];
    assign P[11] = in1[0] ^ in2[0];


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
    assign cout = G[11] | (P[11] & C[11]);
    assign sum = P ^ C;
endmodule

module CLA_11(output [10:0] sum, output cout, input [10:0] in1, input [10:0] in2);

    wire[10:0] G;
    wire[10:0] C;
    wire[10:0] P;

    assign G[0] = in1[10] & in2[10];
    assign P[0] = in1[10] ^ in2[10];
    assign G[1] = in1[9] & in2[9];
    assign P[1] = in1[9] ^ in2[9];
    assign G[2] = in1[8] & in2[8];
    assign P[2] = in1[8] ^ in2[8];
    assign G[3] = in1[7] & in2[7];
    assign P[3] = in1[7] ^ in2[7];
    assign G[4] = in1[6] & in2[6];
    assign P[4] = in1[6] ^ in2[6];
    assign G[5] = in1[5] & in2[5];
    assign P[5] = in1[5] ^ in2[5];
    assign G[6] = in1[4] & in2[4];
    assign P[6] = in1[4] ^ in2[4];
    assign G[7] = in1[3] & in2[3];
    assign P[7] = in1[3] ^ in2[3];
    assign G[8] = in1[2] & in2[2];
    assign P[8] = in1[2] ^ in2[2];
    assign G[9] = in1[1] & in2[1];
    assign P[9] = in1[1] ^ in2[1];
    assign G[10] = in1[0] & in2[0];
    assign P[10] = in1[0] ^ in2[0];


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
    assign cout = G[10] | (P[10] & C[10]);
    assign sum = P ^ C;
endmodule

module CLA_10(output [9:0] sum, output cout, input [9:0] in1, input [9:0] in2);

    wire[9:0] G;
    wire[9:0] C;
    wire[9:0] P;

    assign G[0] = in1[9] & in2[9];
    assign P[0] = in1[9] ^ in2[9];
    assign G[1] = in1[8] & in2[8];
    assign P[1] = in1[8] ^ in2[8];
    assign G[2] = in1[7] & in2[7];
    assign P[2] = in1[7] ^ in2[7];
    assign G[3] = in1[6] & in2[6];
    assign P[3] = in1[6] ^ in2[6];
    assign G[4] = in1[5] & in2[5];
    assign P[4] = in1[5] ^ in2[5];
    assign G[5] = in1[4] & in2[4];
    assign P[5] = in1[4] ^ in2[4];
    assign G[6] = in1[3] & in2[3];
    assign P[6] = in1[3] ^ in2[3];
    assign G[7] = in1[2] & in2[2];
    assign P[7] = in1[2] ^ in2[2];
    assign G[8] = in1[1] & in2[1];
    assign P[8] = in1[1] ^ in2[1];
    assign G[9] = in1[0] & in2[0];
    assign P[9] = in1[0] ^ in2[0];


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
    assign cout = G[9] | (P[9] & C[9]);
    assign sum = P ^ C;
endmodule

module CLA_9(output [8:0] sum, output cout, input [8:0] in1, input [8:0] in2);

    wire[8:0] G;
    wire[8:0] C;
    wire[8:0] P;

    assign G[0] = in1[8] & in2[8];
    assign P[0] = in1[8] ^ in2[8];
    assign G[1] = in1[7] & in2[7];
    assign P[1] = in1[7] ^ in2[7];
    assign G[2] = in1[6] & in2[6];
    assign P[2] = in1[6] ^ in2[6];
    assign G[3] = in1[5] & in2[5];
    assign P[3] = in1[5] ^ in2[5];
    assign G[4] = in1[4] & in2[4];
    assign P[4] = in1[4] ^ in2[4];
    assign G[5] = in1[3] & in2[3];
    assign P[5] = in1[3] ^ in2[3];
    assign G[6] = in1[2] & in2[2];
    assign P[6] = in1[2] ^ in2[2];
    assign G[7] = in1[1] & in2[1];
    assign P[7] = in1[1] ^ in2[1];
    assign G[8] = in1[0] & in2[0];
    assign P[8] = in1[0] ^ in2[0];


    assign C[0] = 0;  /* Carry_out = Ci+1 = Gi + Pi*Ci */;
    assign C[1] = G[0] | (P[0] & C[0]);
    assign C[2] = G[1] | (P[1] & C[1]);
    assign C[3] = G[2] | (P[2] & C[2]);
    assign C[4] = G[3] | (P[3] & C[3]);
    assign C[5] = G[4] | (P[4] & C[4]);
    assign C[6] = G[5] | (P[5] & C[5]);
    assign C[7] = G[6] | (P[6] & C[6]);
    assign C[8] = G[7] | (P[7] & C[7]);
    assign cout = G[8] | (P[8] & C[8]);
    assign sum = P ^ C;
endmodule

module CLA_8(output [7:0] sum, output cout, input [7:0] in1, input [7:0] in2);

    wire[7:0] G;
    wire[7:0] C;
    wire[7:0] P;

    assign G[0] = in1[7] & in2[7];
    assign P[0] = in1[7] ^ in2[7];
    assign G[1] = in1[6] & in2[6];
    assign P[1] = in1[6] ^ in2[6];
    assign G[2] = in1[5] & in2[5];
    assign P[2] = in1[5] ^ in2[5];
    assign G[3] = in1[4] & in2[4];
    assign P[3] = in1[4] ^ in2[4];
    assign G[4] = in1[3] & in2[3];
    assign P[4] = in1[3] ^ in2[3];
    assign G[5] = in1[2] & in2[2];
    assign P[5] = in1[2] ^ in2[2];
    assign G[6] = in1[1] & in2[1];
    assign P[6] = in1[1] ^ in2[1];
    assign G[7] = in1[0] & in2[0];
    assign P[7] = in1[0] ^ in2[0];


    assign C[0] = 0;  /* Carry_out = Ci+1 = Gi + Pi*Ci */;
    assign C[1] = G[0] | (P[0] & C[0]);
    assign C[2] = G[1] | (P[1] & C[1]);
    assign C[3] = G[2] | (P[2] & C[2]);
    assign C[4] = G[3] | (P[3] & C[3]);
    assign C[5] = G[4] | (P[4] & C[4]);
    assign C[6] = G[5] | (P[5] & C[5]);
    assign C[7] = G[6] | (P[6] & C[6]);
    assign cout = G[7] | (P[7] & C[7]);
    assign sum = P ^ C;
endmodule

module CLA_7(output [6:0] sum, output cout, input [6:0] in1, input [6:0] in2);

    wire[6:0] G;
    wire[6:0] C;
    wire[6:0] P;

    assign G[0] = in1[6] & in2[6];
    assign P[0] = in1[6] ^ in2[6];
    assign G[1] = in1[5] & in2[5];
    assign P[1] = in1[5] ^ in2[5];
    assign G[2] = in1[4] & in2[4];
    assign P[2] = in1[4] ^ in2[4];
    assign G[3] = in1[3] & in2[3];
    assign P[3] = in1[3] ^ in2[3];
    assign G[4] = in1[2] & in2[2];
    assign P[4] = in1[2] ^ in2[2];
    assign G[5] = in1[1] & in2[1];
    assign P[5] = in1[1] ^ in2[1];
    assign G[6] = in1[0] & in2[0];
    assign P[6] = in1[0] ^ in2[0];


    assign C[0] = 0;  /* Carry_out = Ci+1 = Gi + Pi*Ci */;
    assign C[1] = G[0] | (P[0] & C[0]);
    assign C[2] = G[1] | (P[1] & C[1]);
    assign C[3] = G[2] | (P[2] & C[2]);
    assign C[4] = G[3] | (P[3] & C[3]);
    assign C[5] = G[4] | (P[4] & C[4]);
    assign C[6] = G[5] | (P[5] & C[5]);
    assign cout = G[6] | (P[6] & C[6]);
    assign sum = P ^ C;
endmodule

module CLA_6(output [5:0] sum, output cout, input [5:0] in1, input [5:0] in2);

    wire[5:0] G;
    wire[5:0] C;
    wire[5:0] P;

    assign G[0] = in1[5] & in2[5];
    assign P[0] = in1[5] ^ in2[5];
    assign G[1] = in1[4] & in2[4];
    assign P[1] = in1[4] ^ in2[4];
    assign G[2] = in1[3] & in2[3];
    assign P[2] = in1[3] ^ in2[3];
    assign G[3] = in1[2] & in2[2];
    assign P[3] = in1[2] ^ in2[2];
    assign G[4] = in1[1] & in2[1];
    assign P[4] = in1[1] ^ in2[1];
    assign G[5] = in1[0] & in2[0];
    assign P[5] = in1[0] ^ in2[0];


    assign C[0] = 0;  /* Carry_out = Ci+1 = Gi + Pi*Ci */;
    assign C[1] = G[0] | (P[0] & C[0]);
    assign C[2] = G[1] | (P[1] & C[1]);
    assign C[3] = G[2] | (P[2] & C[2]);
    assign C[4] = G[3] | (P[3] & C[3]);
    assign C[5] = G[4] | (P[4] & C[4]);
    assign cout = G[5] | (P[5] & C[5]);
    assign sum = P ^ C;
endmodule

module CLA_5(output [4:0] sum, output cout, input [4:0] in1, input [4:0] in2);

    wire[4:0] G;
    wire[4:0] C;
    wire[4:0] P;

    assign G[0] = in1[4] & in2[4];
    assign P[0] = in1[4] ^ in2[4];
    assign G[1] = in1[3] & in2[3];
    assign P[1] = in1[3] ^ in2[3];
    assign G[2] = in1[2] & in2[2];
    assign P[2] = in1[2] ^ in2[2];
    assign G[3] = in1[1] & in2[1];
    assign P[3] = in1[1] ^ in2[1];
    assign G[4] = in1[0] & in2[0];
    assign P[4] = in1[0] ^ in2[0];


    assign C[0] = 0;  /* Carry_out = Ci+1 = Gi + Pi*Ci */;
    assign C[1] = G[0] | (P[0] & C[0]);
    assign C[2] = G[1] | (P[1] & C[1]);
    assign C[3] = G[2] | (P[2] & C[2]);
    assign C[4] = G[3] | (P[3] & C[3]);
    assign cout = G[4] | (P[4] & C[4]);
    assign sum = P ^ C;
endmodule

module CLA_4(output [3:0] sum, output cout, input [3:0] in1, input [3:0] in2);

    wire[3:0] G;
    wire[3:0] C;
    wire[3:0] P;

    assign G[0] = in1[3] & in2[3];
    assign P[0] = in1[3] ^ in2[3];
    assign G[1] = in1[2] & in2[2];
    assign P[1] = in1[2] ^ in2[2];
    assign G[2] = in1[1] & in2[1];
    assign P[2] = in1[1] ^ in2[1];
    assign G[3] = in1[0] & in2[0];
    assign P[3] = in1[0] ^ in2[0];


    assign C[0] = 0;  /* Carry_out = Ci+1 = Gi + Pi*Ci */;
    assign C[1] = G[0] | (P[0] & C[0]);
    assign C[2] = G[1] | (P[1] & C[1]);
    assign C[3] = G[2] | (P[2] & C[2]);
    assign cout = G[3] | (P[3] & C[3]);
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

module carry_select_adder_30(output [29:0] sum,
                            output cout,
                            input [29:0] input1, input2);



    wire [29:0] sum;
    wire cout;
    wire [3:0] result2_1, result2_2, result3_1,result3_2,result4_1,result4_2,result5_1,result5_2,result6_1,result6_2,result7_1,result7_2,result8_1,result8_2;
    wire c1, c2_1, c2_2, c2_3,c3_1,c3_2,c3_3,c3,c4_1,c4_2,c4_3,c4,c5_1,c5_2,c5_3,c5,c6_1,c6_2,c6_3,c6,c7_1,c7_2,c7_3,c7,c8_1,c8_2,c8_3, c8;


    wire [29:0] in1, in2;

    assign in1[0]  = input1[29];
    assign in1[1]  = input1[28];
    assign in1[2]  = input1[27];
    assign in1[3]  = input1[26];
    assign in1[4]  = input1[25];
    assign in1[5]  = input1[24];
    assign in1[6]  = input1[23];
    assign in1[7]  = input1[22];
    assign in1[8]  = input1[21];
    assign in1[9]  = input1[20];
    assign in1[10] = input1[19];
    assign in1[11] = input1[18];
    assign in1[12] = input1[17];
    assign in1[13] = input1[16];
    assign in1[14] = input1[15];
    assign in1[15] = input1[14];
    assign in1[16] = input1[13];
    assign in1[17] = input1[12];
    assign in1[18] = input1[11];
    assign in1[19] = input1[10];
    assign in1[20] = input1[9];
    assign in1[21] = input1[8];
    assign in1[22] = input1[7];
    assign in1[23] = input1[6];
    assign in1[24] = input1[5];
    assign in1[25] = input1[4];
    assign in1[26] = input1[3];
    assign in1[27] = input1[2];
    assign in1[28] = input1[1];
    assign in1[29] = input1[0];

    assign in2[0]  = input2[29];
    assign in2[1]  = input2[28];
    assign in2[2]  = input2[27];
    assign in2[3]  = input2[26];
    assign in2[4]  = input2[25];
    assign in2[5]  = input2[24];
    assign in2[6]  = input2[23];
    assign in2[7]  = input2[22];
    assign in2[8]  = input2[21];
    assign in2[9]  = input2[20];
    assign in2[10] = input2[19];
    assign in2[11] = input2[18];
    assign in2[12] = input2[17];
    assign in2[13] = input2[16];
    assign in2[14] = input2[15];
    assign in2[15] = input2[14];
    assign in2[16] = input2[13];
    assign in2[17] = input2[12];
    assign in2[18] = input2[11];
    assign in2[19] = input2[10];
    assign in2[20] = input2[9];
    assign in2[21] = input2[8];
    assign in2[22] = input2[7];
    assign in2[23] = input2[6];
    assign in2[24] = input2[5];
    assign in2[25] = input2[4];
    assign in2[26] = input2[3];
    assign in2[27] = input2[2];
    assign in2[28] = input2[1];
    assign in2[29] = input2[0];

 


    /* 1st 4 bits */
    ripple_carry_adder_4 RCA01(sum[3:0], c1, in1[3:0], in2[3:0], cin);

    /* 2nd 4 bits */
    ripple_carry_adder_4 RCA02(result2_1, c2_1, in1[7:4], in2[7:4], 1'b0);
    ripple_carry_adder_4 RCA03(result2_2, c2_2, in1[7:4], in2[7:4], 1'b1);
    mux (sum[7:4], result2_1, result2_2, c1);
    and(c2_3, c2_1, c1);
    or(c2, c2_3, c2_2);

    /* 3rd 4 bits */
    ripple_carry_adder_4 RCA04(result3_1, c3_1, in1[11:8], in2[11:8], 1'b0);
    ripple_carry_adder_4 RCA05(result3_2, c3_2, in1[11:8], in2[11:8], 1'b1);
    mux (sum[11:8], result3_1, result3_2, c2);
    and(c3_3, c3_1, c2);
    or(c3, c3_3, c3_2);

    /* 4th 4 bits */
    ripple_carry_adder_4 RCA06(result4_1, c4_1, in1[15:12], in2[15:12], 1'b0);
    ripple_carry_adder_4 RCA07(result4_2, c4_2, in1[15:12], in2[15:12], 1'b1);
    mux (sum[15:12], result4_1, result4_2, c3);
    and(c4_3, c4_1, c3);
    or(c4, c4_3, c4_2);


    ripple_carry_adder_4 RCA08(result5_1, c5_1, in1[19:16], in2[19:16], 1'b0);
    ripple_carry_adder_4 RCA09(result5_2, c5_2, in1[19:16], in2[19:16], 1'b1);
    mux (sum[19:16], result5_1, result5_2, c4);
    and(c5_3, c5_1, c4);
    or(c5, c5_3, c5_2);

        ripple_carry_adder_4 RCA10(result6_1, c6_1, in1[23:20], in2[23:20], 1'b0);
    ripple_carry_adder_4 RCA11(result6_2, c6_2, in1[23:20], in2[23:20], 1'b1);
    mux (sum[23:20], result6_1, result6_2, c5);
    and(c6_3, c6_1, c5);
    or(c6, c6_3, c6_2);

    ripple_carry_adder_4 RCA12(result7_1, c7_1, in1[27:24], in2[27:24], 1'b0);
    ripple_carry_adder_4 RCA13(result7_2, c7_2, in1[27:24], in2[27:24], 1'b1);
    mux (sum[27:24], result7_1, result7_2, c6);
    and(c7_3, c7_1, c6);
    or(c7, c7_3, c7_2);


    full_adder FA1(sum[28], c8,   in1[28], in2[28], c7);
    full_adder FA2(sum[28], cout, in1[29], in2[29], c8);

    //ripple_carry_adder_4 RCA14(result8_1, c8_1, in1[31:28], in2[31:28], 1'b0);
    //ripple_carry_adder_4 RCA15(result8_2, c8_2, in1[31:28], in2[31:28], 1'b1);
    //mux (sum[31:28], result8_1, result8_2, c7);
    //and(c8_3, c8_1, c7);
    //or(cout, c8_3, c8_2);
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
