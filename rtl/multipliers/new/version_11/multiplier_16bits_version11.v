module multiplier_16bits_version11(product, A, B);

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
    CLA_16 KS_1(s1, c1, in1_1, in1_2);
    wire[13:0] s2, in2_1, in2_2;
    wire c2;
    assign in2_1 = {pp2[7],pp2[8],pp2[9],pp2[10],pp2[11],pp2[12],pp2[13],pp3[13],pp4[13],pp5[13],pp6[13],pp7[13],pp8[13],pp9[13]};
    assign in2_2 = {pp3[6],pp3[7],pp3[8],pp3[9],pp3[10],pp3[11],pp3[12],pp4[12],pp5[12],pp6[12],pp7[12],pp8[12],pp9[12],pp10[12]};
    CLA_14 KS_2(s2, c2, in2_1, in2_2);
    wire[11:0] s3, in3_1, in3_2;
    wire c3;
    assign in3_1 = {pp4[6],pp4[7],pp4[8],pp4[9],pp4[10],pp4[11],pp5[11],pp6[11],pp7[11],pp8[11],pp9[11],pp10[11]};
    assign in3_2 = {pp5[5],pp5[6],pp5[7],pp5[8],pp5[9],pp5[10],pp6[10],pp7[10],pp8[10],pp9[10],pp10[10],pp11[10]};
    CLA_12 KS_3(s3, c3, in3_1, in3_2);
    wire[9:0] s4, in4_1, in4_2;
    wire c4;
    assign in4_1 = {pp6[5],pp6[6],pp6[7],pp6[8],pp6[9],pp7[9],pp8[9],pp9[9],pp10[9],pp11[9]};
    assign in4_2 = {pp7[4],pp7[5],pp7[6],pp7[7],pp7[8],pp8[8],pp9[8],pp10[8],pp11[8],pp12[8]};
    CLA_10 KS_4(s4, c4, in4_1, in4_2);
    wire[7:0] s5, in5_1, in5_2;
    wire c5;
    assign in5_1 = {pp8[4],pp8[5],pp8[6],pp8[7],pp9[7],pp10[7],pp11[7],pp12[7]};
    assign in5_2 = {pp9[3],pp9[4],pp9[5],pp9[6],pp10[6],pp11[6],pp12[6],pp13[6]};
    CLA_8 KS_5(s5, c5, in5_1, in5_2);
    wire[5:0] s6, in6_1, in6_2;
    wire c6;
    assign in6_1 = {pp10[3],pp10[4],pp10[5],pp11[5],pp12[5],pp13[5]};
    assign in6_2 = {pp11[2],pp11[3],pp11[4],pp12[4],pp13[4],pp14[4]};
    CLA_6 KS_6(s6, c6, in6_1, in6_2);
    wire[3:0] s7, in7_1, in7_2;
    wire c7;
    assign in7_1 = {pp12[2],pp12[3],pp13[3],pp14[3]};
    assign in7_2 = {pp13[1],pp13[2],pp14[2],pp15[2]};
    CLA_4 KS_7(s7, c7, in7_1, in7_2);
    wire[1:0] s8, in8_1, in8_2;
    wire c8;
    assign in8_1 = {pp14[1],pp15[1]};
    assign in8_2 = {pp15[0],1'b0};
    CLA_2 KS_8(s8, c8, in8_1, in8_2);

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

module CLA_16(output [15:0] sum, output cout, input [15:0] in1, input [15:0] in2);

    wire[15:0] G;
    wire[15:0] C;
    wire[15:0] P;

    assign G[0] = in[15] & in2[15];
    assign P[0] = in[15] ^ in2[15];
    assign G[1] = in[14] & in2[14];
    assign P[1] = in[14] ^ in2[14];
    assign G[2] = in[13] & in2[13];
    assign P[2] = in[13] ^ in2[13];
    assign G[3] = in[12] & in2[12];
    assign P[3] = in[12] ^ in2[12];
    assign G[4] = in[11] & in2[11];
    assign P[4] = in[11] ^ in2[11];
    assign G[5] = in[10] & in2[10];
    assign P[5] = in[10] ^ in2[10];
    assign G[6] = in[9] & in2[9];
    assign P[6] = in[9] ^ in2[9];
    assign G[7] = in[8] & in2[8];
    assign P[7] = in[8] ^ in2[8];
    assign G[8] = in[7] & in2[7];
    assign P[8] = in[7] ^ in2[7];
    assign G[9] = in[6] & in2[6];
    assign P[9] = in[6] ^ in2[6];
    assign G[10] = in[5] & in2[5];
    assign P[10] = in[5] ^ in2[5];
    assign G[11] = in[4] & in2[4];
    assign P[11] = in[4] ^ in2[4];
    assign G[12] = in[3] & in2[3];
    assign P[12] = in[3] ^ in2[3];
    assign G[13] = in[2] & in2[2];
    assign P[13] = in[2] ^ in2[2];
    assign G[14] = in[1] & in2[1];
    assign P[14] = in[1] ^ in2[1];
    assign G[15] = in[0] & in2[0];
    assign P[15] = in[0] ^ in2[0];


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

    assign G[0] = in[14] & in2[14];
    assign P[0] = in[14] ^ in2[14];
    assign G[1] = in[13] & in2[13];
    assign P[1] = in[13] ^ in2[13];
    assign G[2] = in[12] & in2[12];
    assign P[2] = in[12] ^ in2[12];
    assign G[3] = in[11] & in2[11];
    assign P[3] = in[11] ^ in2[11];
    assign G[4] = in[10] & in2[10];
    assign P[4] = in[10] ^ in2[10];
    assign G[5] = in[9] & in2[9];
    assign P[5] = in[9] ^ in2[9];
    assign G[6] = in[8] & in2[8];
    assign P[6] = in[8] ^ in2[8];
    assign G[7] = in[7] & in2[7];
    assign P[7] = in[7] ^ in2[7];
    assign G[8] = in[6] & in2[6];
    assign P[8] = in[6] ^ in2[6];
    assign G[9] = in[5] & in2[5];
    assign P[9] = in[5] ^ in2[5];
    assign G[10] = in[4] & in2[4];
    assign P[10] = in[4] ^ in2[4];
    assign G[11] = in[3] & in2[3];
    assign P[11] = in[3] ^ in2[3];
    assign G[12] = in[2] & in2[2];
    assign P[12] = in[2] ^ in2[2];
    assign G[13] = in[1] & in2[1];
    assign P[13] = in[1] ^ in2[1];
    assign G[14] = in[0] & in2[0];
    assign P[14] = in[0] ^ in2[0];


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

    assign G[0] = in[13] & in2[13];
    assign P[0] = in[13] ^ in2[13];
    assign G[1] = in[12] & in2[12];
    assign P[1] = in[12] ^ in2[12];
    assign G[2] = in[11] & in2[11];
    assign P[2] = in[11] ^ in2[11];
    assign G[3] = in[10] & in2[10];
    assign P[3] = in[10] ^ in2[10];
    assign G[4] = in[9] & in2[9];
    assign P[4] = in[9] ^ in2[9];
    assign G[5] = in[8] & in2[8];
    assign P[5] = in[8] ^ in2[8];
    assign G[6] = in[7] & in2[7];
    assign P[6] = in[7] ^ in2[7];
    assign G[7] = in[6] & in2[6];
    assign P[7] = in[6] ^ in2[6];
    assign G[8] = in[5] & in2[5];
    assign P[8] = in[5] ^ in2[5];
    assign G[9] = in[4] & in2[4];
    assign P[9] = in[4] ^ in2[4];
    assign G[10] = in[3] & in2[3];
    assign P[10] = in[3] ^ in2[3];
    assign G[11] = in[2] & in2[2];
    assign P[11] = in[2] ^ in2[2];
    assign G[12] = in[1] & in2[1];
    assign P[12] = in[1] ^ in2[1];
    assign G[13] = in[0] & in2[0];
    assign P[13] = in[0] ^ in2[0];


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

    assign G[0] = in[12] & in2[12];
    assign P[0] = in[12] ^ in2[12];
    assign G[1] = in[11] & in2[11];
    assign P[1] = in[11] ^ in2[11];
    assign G[2] = in[10] & in2[10];
    assign P[2] = in[10] ^ in2[10];
    assign G[3] = in[9] & in2[9];
    assign P[3] = in[9] ^ in2[9];
    assign G[4] = in[8] & in2[8];
    assign P[4] = in[8] ^ in2[8];
    assign G[5] = in[7] & in2[7];
    assign P[5] = in[7] ^ in2[7];
    assign G[6] = in[6] & in2[6];
    assign P[6] = in[6] ^ in2[6];
    assign G[7] = in[5] & in2[5];
    assign P[7] = in[5] ^ in2[5];
    assign G[8] = in[4] & in2[4];
    assign P[8] = in[4] ^ in2[4];
    assign G[9] = in[3] & in2[3];
    assign P[9] = in[3] ^ in2[3];
    assign G[10] = in[2] & in2[2];
    assign P[10] = in[2] ^ in2[2];
    assign G[11] = in[1] & in2[1];
    assign P[11] = in[1] ^ in2[1];
    assign G[12] = in[0] & in2[0];
    assign P[12] = in[0] ^ in2[0];


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

    assign G[0] = in[11] & in2[11];
    assign P[0] = in[11] ^ in2[11];
    assign G[1] = in[10] & in2[10];
    assign P[1] = in[10] ^ in2[10];
    assign G[2] = in[9] & in2[9];
    assign P[2] = in[9] ^ in2[9];
    assign G[3] = in[8] & in2[8];
    assign P[3] = in[8] ^ in2[8];
    assign G[4] = in[7] & in2[7];
    assign P[4] = in[7] ^ in2[7];
    assign G[5] = in[6] & in2[6];
    assign P[5] = in[6] ^ in2[6];
    assign G[6] = in[5] & in2[5];
    assign P[6] = in[5] ^ in2[5];
    assign G[7] = in[4] & in2[4];
    assign P[7] = in[4] ^ in2[4];
    assign G[8] = in[3] & in2[3];
    assign P[8] = in[3] ^ in2[3];
    assign G[9] = in[2] & in2[2];
    assign P[9] = in[2] ^ in2[2];
    assign G[10] = in[1] & in2[1];
    assign P[10] = in[1] ^ in2[1];
    assign G[11] = in[0] & in2[0];
    assign P[11] = in[0] ^ in2[0];


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

    assign G[0] = in[10] & in2[10];
    assign P[0] = in[10] ^ in2[10];
    assign G[1] = in[9] & in2[9];
    assign P[1] = in[9] ^ in2[9];
    assign G[2] = in[8] & in2[8];
    assign P[2] = in[8] ^ in2[8];
    assign G[3] = in[7] & in2[7];
    assign P[3] = in[7] ^ in2[7];
    assign G[4] = in[6] & in2[6];
    assign P[4] = in[6] ^ in2[6];
    assign G[5] = in[5] & in2[5];
    assign P[5] = in[5] ^ in2[5];
    assign G[6] = in[4] & in2[4];
    assign P[6] = in[4] ^ in2[4];
    assign G[7] = in[3] & in2[3];
    assign P[7] = in[3] ^ in2[3];
    assign G[8] = in[2] & in2[2];
    assign P[8] = in[2] ^ in2[2];
    assign G[9] = in[1] & in2[1];
    assign P[9] = in[1] ^ in2[1];
    assign G[10] = in[0] & in2[0];
    assign P[10] = in[0] ^ in2[0];


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

    assign G[0] = in[9] & in2[9];
    assign P[0] = in[9] ^ in2[9];
    assign G[1] = in[8] & in2[8];
    assign P[1] = in[8] ^ in2[8];
    assign G[2] = in[7] & in2[7];
    assign P[2] = in[7] ^ in2[7];
    assign G[3] = in[6] & in2[6];
    assign P[3] = in[6] ^ in2[6];
    assign G[4] = in[5] & in2[5];
    assign P[4] = in[5] ^ in2[5];
    assign G[5] = in[4] & in2[4];
    assign P[5] = in[4] ^ in2[4];
    assign G[6] = in[3] & in2[3];
    assign P[6] = in[3] ^ in2[3];
    assign G[7] = in[2] & in2[2];
    assign P[7] = in[2] ^ in2[2];
    assign G[8] = in[1] & in2[1];
    assign P[8] = in[1] ^ in2[1];
    assign G[9] = in[0] & in2[0];
    assign P[9] = in[0] ^ in2[0];


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

    assign G[0] = in[8] & in2[8];
    assign P[0] = in[8] ^ in2[8];
    assign G[1] = in[7] & in2[7];
    assign P[1] = in[7] ^ in2[7];
    assign G[2] = in[6] & in2[6];
    assign P[2] = in[6] ^ in2[6];
    assign G[3] = in[5] & in2[5];
    assign P[3] = in[5] ^ in2[5];
    assign G[4] = in[4] & in2[4];
    assign P[4] = in[4] ^ in2[4];
    assign G[5] = in[3] & in2[3];
    assign P[5] = in[3] ^ in2[3];
    assign G[6] = in[2] & in2[2];
    assign P[6] = in[2] ^ in2[2];
    assign G[7] = in[1] & in2[1];
    assign P[7] = in[1] ^ in2[1];
    assign G[8] = in[0] & in2[0];
    assign P[8] = in[0] ^ in2[0];


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

    assign G[0] = in[7] & in2[7];
    assign P[0] = in[7] ^ in2[7];
    assign G[1] = in[6] & in2[6];
    assign P[1] = in[6] ^ in2[6];
    assign G[2] = in[5] & in2[5];
    assign P[2] = in[5] ^ in2[5];
    assign G[3] = in[4] & in2[4];
    assign P[3] = in[4] ^ in2[4];
    assign G[4] = in[3] & in2[3];
    assign P[4] = in[3] ^ in2[3];
    assign G[5] = in[2] & in2[2];
    assign P[5] = in[2] ^ in2[2];
    assign G[6] = in[1] & in2[1];
    assign P[6] = in[1] ^ in2[1];
    assign G[7] = in[0] & in2[0];
    assign P[7] = in[0] ^ in2[0];


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

    assign G[0] = in[6] & in2[6];
    assign P[0] = in[6] ^ in2[6];
    assign G[1] = in[5] & in2[5];
    assign P[1] = in[5] ^ in2[5];
    assign G[2] = in[4] & in2[4];
    assign P[2] = in[4] ^ in2[4];
    assign G[3] = in[3] & in2[3];
    assign P[3] = in[3] ^ in2[3];
    assign G[4] = in[2] & in2[2];
    assign P[4] = in[2] ^ in2[2];
    assign G[5] = in[1] & in2[1];
    assign P[5] = in[1] ^ in2[1];
    assign G[6] = in[0] & in2[0];
    assign P[6] = in[0] ^ in2[0];


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

    assign G[0] = in[5] & in2[5];
    assign P[0] = in[5] ^ in2[5];
    assign G[1] = in[4] & in2[4];
    assign P[1] = in[4] ^ in2[4];
    assign G[2] = in[3] & in2[3];
    assign P[2] = in[3] ^ in2[3];
    assign G[3] = in[2] & in2[2];
    assign P[3] = in[2] ^ in2[2];
    assign G[4] = in[1] & in2[1];
    assign P[4] = in[1] ^ in2[1];
    assign G[5] = in[0] & in2[0];
    assign P[5] = in[0] ^ in2[0];


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

    assign G[0] = in[4] & in2[4];
    assign P[0] = in[4] ^ in2[4];
    assign G[1] = in[3] & in2[3];
    assign P[1] = in[3] ^ in2[3];
    assign G[2] = in[2] & in2[2];
    assign P[2] = in[2] ^ in2[2];
    assign G[3] = in[1] & in2[1];
    assign P[3] = in[1] ^ in2[1];
    assign G[4] = in[0] & in2[0];
    assign P[4] = in[0] ^ in2[0];


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

    assign G[0] = in[3] & in2[3];
    assign P[0] = in[3] ^ in2[3];
    assign G[1] = in[2] & in2[2];
    assign P[1] = in[2] ^ in2[2];
    assign G[2] = in[1] & in2[1];
    assign P[2] = in[1] ^ in2[1];
    assign G[3] = in[0] & in2[0];
    assign P[3] = in[0] ^ in2[0];


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

    assign G[0] = in[2] & in2[2];
    assign P[0] = in[2] ^ in2[2];
    assign G[1] = in[1] & in2[1];
    assign P[1] = in[1] ^ in2[1];
    assign G[2] = in[0] & in2[0];
    assign P[2] = in[0] ^ in2[0];


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

    assign G[0] = in[1] & in2[1];
    assign P[0] = in[1] ^ in2[1];
    assign G[1] = in[0] & in2[0];
    assign P[1] = in[0] ^ in2[0];


    assign C[0] = 0;  /* Carry_out = Ci+1 = Gi + Pi*Ci */;
    assign C[1] = G[0] | (P[0] & C[0]);
    assign cout = G[1] | (P[1] & C[1]);
    assign sum = P ^ C;
endmodule

