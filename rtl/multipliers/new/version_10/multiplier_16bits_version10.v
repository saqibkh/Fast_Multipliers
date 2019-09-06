module multiplier_16bits_version10(product, A, B);

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
    assign in1_1 = {pp0[8],pp0[9],pp0[10],pp0[11],pp0[12],pp0[13],pp0[14],pp0[15],pp1[15],pp2[15],pp3[15],pp4[15],pp10[10],pp10[11],pp10[12],pp10[13]};
    assign in1_2 = {pp1[7],pp1[8],pp10[0],pp1[10],pp1[11],pp1[12],pp1[13],pp1[14],pp2[14],pp3[14],pp4[14],pp5[14],pp5[15],pp11[10],pp11[11],pp11[12]};
    kogge_stone_16 KS_1(s1, c1, in1_1, in1_2);
    wire[13:0] s2, in2_1, in2_2;
    wire c2;
    assign in2_1 = {pp2[7],pp1[9],pp10[1],pp2[10],pp2[11],pp2[12],pp2[13],pp3[13],pp4[13],pp5[13],pp6[13],pp6[14],pp6[15],pp12[10]};
    assign in2_2 = {pp3[6],pp2[8],pp11[0],pp10[2],pp3[10],pp3[11],pp3[12],pp4[12],pp5[12],pp6[12],pp7[12],pp7[13],pp7[14],pp7[15]};
    kogge_stone_14 KS_2(s2, c2, in2_1, in2_2);
    wire[11:0] s3, in3_1, in3_2;
    wire c3;
    assign in3_1 = {pp3[7],pp2[9],pp11[1],pp10[3],pp4[10],pp4[11],pp5[11],pp6[11],pp7[11],pp8[11],pp8[12],pp8[13]};
    assign in3_2 = {pp4[6],pp3[8],pp12[0],pp11[2],pp10[4],pp5[10],pp6[10],pp7[10],pp8[10],pp9[10],pp9[11],pp9[12]};
    kogge_stone_12 KS_3(s3, c3, in3_1, in3_2);
    wire[9:0] s4, in4_1, in4_2;
    wire c4;
    assign in4_1 = {pp4[7],pp3[9],pp12[1],pp11[3],pp10[5],pp10[6],pp10[7],pp10[8],pp10[9],pp11[9]};
    assign in4_2 = {pp5[6],pp4[8],pp13[0],pp12[2],pp11[4],pp11[5],pp11[6],pp11[7],pp11[8],pp12[8]};
    kogge_stone_10 KS_4(s4, c4, in4_1, in4_2);
    wire[7:0] s5, in5_1, in5_2;
    wire c5;
    assign in5_1 = {pp5[7],pp4[9],pp13[1],pp12[3],pp12[4],pp12[5],pp12[6],pp12[7]};
    assign in5_2 = {pp6[6],pp5[8],pp14[0],pp13[2],pp13[3],pp13[4],pp13[5],pp13[6]};
    kogge_stone_8 KS_5(s5, c5, in5_1, in5_2);
    wire[5:0] s6, in6_1, in6_2;
    wire c6;
    assign in6_1 = {pp6[7],pp5[9],pp14[1],pp14[2],pp14[3],pp14[4]};
    assign in6_2 = {pp7[6],pp6[8],pp15[0],pp15[1],pp15[2],pp15[3]};
    kogge_stone_6 KS_6(s6, c6, in6_1, in6_2);
    wire[3:0] s7, in7_1, in7_2;
    wire c7;
    assign in7_1 = {pp7[7],pp6[9],pp7[9],pp8[9]};
    assign in7_2 = {pp8[6],pp7[8],pp8[8],pp9[8]};
    kogge_stone_4 KS_7(s7, c7, in7_1, in7_2);
    wire[1:0] s8, in8_1, in8_2;
    wire c8;
    assign in8_1 = {pp8[7],pp9[7]};
    assign in8_2 = {pp9[6],1'b0};
    kogge_stone_2 KS_8(s8, c8, in8_1, in8_2);

    /*Stage 2*/
    wire[23:0] s9, in9_1, in9_2;
    wire c9;
    assign in9_1 = {pp0[4],pp0[5],pp0[6],pp0[7],pp2[6],pp4[5],pp5[5],pp6[5],pp7[5],pp8[5],pp9[5],s1[7],s1[8],s1[9],pp9[9],pp14[5],pp13[7],pp12[9],pp8[14],pp12[11],pp10[14],pp10[15],pp11[15],pp12[15]};
    assign in9_2 = {pp1[3],pp1[4],pp1[5],pp1[6],pp3[5],pp5[4],pp6[4],pp7[4],pp8[4],pp9[4],s1[6],s2[6],s2[7],s2[8],s1[10],pp15[4],pp14[6],pp13[8],pp9[13],pp13[10],pp11[13],pp11[14],pp12[14],pp13[14]};
    kogge_stone_24 KS_9(s9, c9, in9_1, in9_2);
    wire[21:0] s10, in10_1, in10_2;
    wire c10;
    assign in10_1 = {pp2[3],pp2[4],pp2[5],pp4[4],pp6[3],pp7[3],pp8[3],pp9[3],s1[5],s9[10],s9[11],s9[12],s9[13],s9[14],s1[11],pp15[5],pp14[7],pp13[9],pp8[15],pp12[12],pp12[13],pp13[13]};
    assign in10_2 = {pp3[2],pp3[3],pp3[4],pp5[3],pp7[2],pp8[2],pp9[2],s1[4],s2[4],s2[5],s3[5],s3[6],s3[7],s2[9],s2[10],s1[12],pp15[6],pp14[8],pp9[14],pp13[11],pp13[12],pp14[12]};
    kogge_stone_22 KS_10(s10, c10, in10_1, in10_2);
    wire[19:0] s11, in11_1, in11_2;
    wire c11;
    assign in11_1 = {pp4[2],pp4[3],pp6[2],pp8[1],pp9[1],s10[6],s10[7],s10[8],s10[9],s10[10],s10[11],s10[12],s10[13],s10[14],s10[15],s10[16],pp15[7],pp14[9],pp14[10],pp14[11]};
    assign in11_2 = {pp5[1],pp5[2],pp7[1],pp9[0],s10[5],s1[3],s2[3],s3[3],s3[4],s4[4],s4[5],s4[6],s3[8],s9[15],s2[11],s1[13],s10[17],pp15[8],pp9[15],pp15[10]};
    kogge_stone_20 KS_11(s11, c11, in11_1, in11_2);
    wire[17:0] s12, in12_1, in12_2;
    wire c12;
    assign in12_1 = {pp6[1],pp8[0],s10[4],s11[4],s11[5],s11[6],s11[7],s11[8],s11[9],s11[10],s11[11],s11[12],s11[13],s11[14],s11[15],s11[16],s10[18],pp15[9]};
    assign in12_2 = {pp7[0],s10[3],s11[3],s1[2],s2[2],s3[2],s4[2],s4[3],s5[3],s5[4],s5[5],s4[7],s3[9],s3[10],s2[12],s1[14],s11[17],s10[19]};
    kogge_stone_18 KS_12(s12, c12, in12_1, in12_2);

    /*Stage 3*/
    wire[27:0] s13, in13_1, in13_2;
    wire c13;
    assign in13_1 = {pp0[2],pp0[3],pp2[2],pp4[1],pp6[0],s10[2],s11[2],s12[2],s12[3],s12[4],s12[5],s12[6],s12[7],s12[8],s12[9],s12[10],s12[11],s12[12],s12[13],s12[14],s12[15],s12[16],s11[18],s10[20],pp15[11],pp14[13],pp13[15],pp14[15]};
    assign in13_2 = {pp1[1],pp1[2],pp3[1],pp5[0],s10[1],s11[1],s12[1],s1[1],s2[1],s3[1],s4[1],s5[1],s5[2],s6[2],s6[3],s6[4],s5[6],s4[8],s9[16],s3[11],s2[13],s1[15],s12[17],s11[19],s10[21],pp15[12],pp14[14],pp15[14]};
    kogge_stone_28 KS_13(s13, c13, in13_1, in13_2);
    wire[25:0] s14, in14_1, in14_2;
    wire c14;
    assign in14_1 = {pp2[1],pp4[0],s10[0],s11[0],s12[0],s13[6],s13[7],s13[8],s13[9],s13[10],s13[11],s13[12],s13[13],s13[14],s13[15],s13[16],s13[17],s13[18],s13[19],s13[20],s13[21],s13[22],s13[23],s13[24],s13[25],pp15[13]};
    assign in14_2 = {pp3[0],s13[2],s13[3],s13[4],s13[5],s1[0],s2[0],s3[0],s4[0],s5[0],s6[0],s6[1],s7[1],s7[2],s7[3],s6[5],s5[7],s4[9],s9[17],s9[18],s9[19],s9[20],s9[21],s9[22],s9[23],s13[26]};
    kogge_stone_26 KS_14(s14, c14, in14_1, in14_2);


    /*Final Stage 3*/
    wire[29:0] s, in_1, in_2;
    wire c;
    assign in_1 = {pp0[1],pp2[0],s13[1],s9[0],s9[1],s9[2],s9[3],s9[4],s9[5],s9[6],s9[7],s9[8],s9[9],s7[0],s8[0],s8[1],c8,c7,c6,c5,c4,c3,c2,c1,c12,c11,c10,c9,s13[27],pp15[15]};
    assign in_2 = {pp1[0],s13[0],s14[0],s14[1],s14[2],s14[3],s14[4],s14[5],s14[6],s14[7],s14[8],s14[9],s14[10],s14[11],s14[12],s14[13],s14[14],s14[15],s14[16],s14[17],s14[18],s14[19],s14[20],s14[21],s14[22],s14[23],s14[24],s14[25],c14,c13};
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

module kogge_stone_2(sum, cout, in1, in2);
    input [1:0] in1, in2; //input
    output [1:0] sum; //output
    output cout; //carry-out
    wire [1:0] G_Z, P_Z, //wires
    G_A, P_A,
    G_B, P_B;


    assign P_Z[0] = in1[1] ^ in2[1];
    assign P_Z[1] = in1[0] ^ in2[0];

    assign G_Z[0] = in1[1] & in2[1];
    assign G_Z[1] = in1[0] & in2[0];

    /*level 1*/
    assign G_A[0] = G_Z[0];
    /*gray_cell level_0A(cin, P_Z[0], G_Z[0], G_A[0]);*/
    black_cell level_1A(G_Z[0],  P_Z[1],  G_Z[1],  P_Z[0],  G_A[1],  P_A[1]);

    /*level 2*/
    assign cout = G_A[1];

    /*outputs*/
    assign sum[0]  =           P_Z[0];
    assign sum[1]  = G_A[0]  ^ P_Z[1];
endmodule

module kogge_stone_3(sum, cout, in1, in2);
    input [2:0] in1, in2; 
    output [2:0] sum; 
    output cout; 
    wire [2:0] G_Z, P_Z, 
    G_A, P_A,
    G_B, P_B;

    assign P_Z[0] = in1[2] ^ in2[2];
    assign P_Z[1] = in1[1] ^ in2[1];
    assign P_Z[2] = in1[0] ^ in2[0];
    assign G_Z[0] = in1[2] & in2[2];
    assign G_Z[1] = in1[1] & in2[1];
    assign G_Z[2] = in1[0] & in2[0];

    /*level 1*/
    assign G_A[0] = G_Z[0];
    black_cell level_1A(G_Z[0],  P_Z[1],  G_Z[1],  P_Z[0],  G_A[1],  P_A[1]);
    black_cell level_2A(G_Z[1],  P_Z[2],  G_Z[2],  P_Z[1],  G_A[2],  P_A[2]);

    /*level 2*/
    assign G_B[1] = G_A[1];
    gray_cell level_2B(G_A[0],   P_A[2],  G_A[2],  cout);

    /*outputs*/
    assign sum[0]  =           P_Z[0];
    assign sum[1]  = G_A[0]  ^ P_Z[1];
    assign sum[2]  = G_B[1]  ^ P_Z[2];
endmodule

module kogge_stone_4(sum, cout, in1, in2);
    input [3:0] in1, in2; //input
    output [3:0] sum; //output
    output cout; //carry-out
    wire [3:0] G_Z, P_Z, //wires
    G_A, P_A,
    G_B, P_B;

    assign P_Z[0] = in1[3] ^ in2[3];
    assign P_Z[1] = in1[2] ^ in2[2];
    assign P_Z[2] = in1[1] ^ in2[1];
    assign P_Z[3] = in1[0] ^ in2[0];
    assign G_Z[0] = in1[3] & in2[3];
    assign G_Z[1] = in1[2] & in2[2];
    assign G_Z[2] = in1[1] & in2[1];
    assign G_Z[3] = in1[0] & in2[0];

    /*level 1*/
    assign G_A[0] = G_Z[0];
    /*gray_cell level_0A(1'b0, P_Z[0], G_Z[0], G_A[0]);*/
    black_cell level_1A(G_Z[0],  P_Z[1],  G_Z[1],  P_Z[0],  G_A[1],  P_A[1]);
    black_cell level_2A(G_Z[1],  P_Z[2],  G_Z[2],  P_Z[1],  G_A[2],  P_A[2]);
    black_cell level_3A(G_Z[2],  P_Z[3],  G_Z[3],  P_Z[2],  G_A[3],  P_A[3]);

    /*level 2*/
    assign G_B[1] = G_A[1];
    /*gray_cell level_1B(1'b0,      P_A[1],  G_A[1],  G_B[1]);*/
    gray_cell level_2B(G_A[0],   P_A[2],  G_A[2],  G_B[2]);
    black_cell level_3B(G_A[1],  P_A[3],  G_A[3],  P_A[1],  G_B[3],  P_B[3]);

    /*level 3*/
    assign cout = G_B[3];
    /*gray_cell level_3C(1'b0,      P_B[3],  G_B[3],  cout);*/

    /*outputs*/
    assign sum[0]  =           P_Z[0];
    assign sum[1]  = G_A[0]  ^ P_Z[1];
    assign sum[2]  = G_B[1]  ^ P_Z[2];
    assign sum[3]  = G_B[2]  ^ P_Z[3];
endmodule

module kogge_stone_5(sum, cout, in1, in2);
    input [4:0] in1, in2; 
    output [4:0] sum; 
    output cout;
    wire [4:0] G_Z, P_Z, 
    G_A, P_A,
    G_B, P_B,
    G_C, P_C,
    G_D, P_D;

    assign P_Z[0]  = in1[4]  ^ in2[4];
    assign P_Z[1]  = in1[3]  ^ in2[3];
    assign P_Z[2]  = in1[2]  ^ in2[2];
    assign P_Z[3]  = in1[1]  ^ in2[1];
    assign P_Z[4]  = in1[0]  ^ in2[0];

    assign G_Z[0]  = in1[4]  & in2[4];
    assign G_Z[1]  = in1[3]  & in2[3];
    assign G_Z[2] = in1[2]  & in2[2];
    assign G_Z[3] = in1[1]  & in2[1];
    assign G_Z[4] = in1[0]  & in2[0];

    /*level 1*/
    assign G_A[0] = G_Z[0];
    black_cell level_1A(G_Z[0],  P_Z[1],  G_Z[1],  P_Z[0],  G_A[1],  P_A[1]);
    black_cell level_2A(G_Z[1],  P_Z[2],  G_Z[2],  P_Z[1],  G_A[2],  P_A[2]);
    black_cell level_3A(G_Z[2],  P_Z[3],  G_Z[3],  P_Z[2],  G_A[3],  P_A[3]);
    black_cell level_4A(G_Z[3],  P_Z[4],  G_Z[4],  P_Z[3],  G_A[4],  P_A[4]);

    /*level 2*/
    assign G_B[1] = G_A[1];
    gray_cell level_2B(G_A[0],   P_A[2],  G_A[2],  G_B[2]);
    black_cell level_3B(G_A[1],  P_A[3],  G_A[3],  P_A[1],  G_B[3],  P_B[3]);
    black_cell level_4B(G_A[2],  P_A[4],  G_A[4],  P_A[2],  G_B[4],  P_B[4]);

    /*level 3*/
    assign G_C[3] = G_B[3];
    gray_cell level_4C(G_A[0],   P_B[4],  G_B[4],  cout);

    /*outputs*/
    assign sum[0]  =           P_Z[0];
    assign sum[1]  = G_A[0]  ^ P_Z[1];
    assign sum[2]  = G_B[1]  ^ P_Z[2];
    assign sum[3]  = G_B[2]  ^ P_Z[3];
    assign sum[4]  = G_C[3]  ^ P_Z[4];
endmodule

module kogge_stone_6(sum, cout, in1, in2);
    input [5:0] in1, in2; 
    output [5:0] sum; 
    output cout;
    wire [5:0] G_Z, P_Z, 
    G_A, P_A,
    G_B, P_B,
    G_C, P_C,
    G_D, P_D;

    assign P_Z[0]  = in1[5]  ^ in2[5];
    assign P_Z[1]  = in1[4]  ^ in2[4];
    assign P_Z[2]  = in1[3]  ^ in2[3];
    assign P_Z[3]  = in1[2]  ^ in2[2];
    assign P_Z[4]  = in1[1]  ^ in2[1];
    assign P_Z[5]  = in1[0]  ^ in2[0];

    assign G_Z[0]  = in1[5]  & in2[5];
    assign G_Z[1]  = in1[4]  & in2[4];
    assign G_Z[2]  = in1[3]  & in2[3];
    assign G_Z[3] = in1[2]  & in2[2];
    assign G_Z[4] = in1[1]  & in2[1];
    assign G_Z[5] = in1[0]  & in2[0];

    /*level 1*/
    assign G_A[0] = G_Z[0];
    black_cell level_1A(G_Z[0],  P_Z[1],  G_Z[1],  P_Z[0],  G_A[1],  P_A[1]);
    black_cell level_2A(G_Z[1],  P_Z[2],  G_Z[2],  P_Z[1],  G_A[2],  P_A[2]);
    black_cell level_3A(G_Z[2],  P_Z[3],  G_Z[3],  P_Z[2],  G_A[3],  P_A[3]);
    black_cell level_4A(G_Z[3],  P_Z[4],  G_Z[4],  P_Z[3],  G_A[4],  P_A[4]);
    black_cell level_5A(G_Z[4],  P_Z[5],  G_Z[5],  P_Z[4],  G_A[5],  P_A[5]);


    /*level 2*/
    assign G_B[1] = G_A[1];
    gray_cell level_2B(G_A[0],   P_A[2],  G_A[2],  G_B[2]);
    black_cell level_3B(G_A[1],  P_A[3],  G_A[3],  P_A[1],  G_B[3],  P_B[3]);
    black_cell level_4B(G_A[2],  P_A[4],  G_A[4],  P_A[2],  G_B[4],  P_B[4]);
    black_cell level_5B(G_A[3],  P_A[5],  G_A[5],  P_A[3],  G_B[5],  P_B[5]);

    /*level 3*/
    assign G_C[3] = G_B[3];
    gray_cell level_4C(G_A[0],   P_B[4],  G_B[4],  G_C[4]);
    gray_cell level_5C(G_B[1],   P_B[5],  G_B[5],  cout);

    /*outputs*/
    assign sum[0]  =           P_Z[0];
    assign sum[1]  = G_A[0]  ^ P_Z[1];
    assign sum[2]  = G_B[1]  ^ P_Z[2];
    assign sum[3]  = G_B[2]  ^ P_Z[3];
    assign sum[4]  = G_C[3]  ^ P_Z[4];
    assign sum[5]  = G_C[4]  ^ P_Z[5];
endmodule

module kogge_stone_7(sum, cout, in1, in2);
    input [6:0] in1, in2; 
    output [6:0] sum; 
    output cout; 
    wire [6:0] G_Z, P_Z, 
    G_A, P_A,
    G_B, P_B,
    G_C, P_C,
    G_D, P_D;

    assign P_Z[0]  = in1[6]  ^ in2[6];
    assign P_Z[1]  = in1[5]  ^ in2[5];
    assign P_Z[2]  = in1[4]  ^ in2[4];
    assign P_Z[3]  = in1[3]  ^ in2[3];
    assign P_Z[4]  = in1[2]  ^ in2[2];
    assign P_Z[5]  = in1[1]  ^ in2[1];
    assign P_Z[6]  = in1[0]  ^ in2[0];

    assign G_Z[0]  = in1[6]  & in2[6];
    assign G_Z[1]  = in1[5]  & in2[5];
    assign G_Z[2]  = in1[4]  & in2[4];
    assign G_Z[3]  = in1[3]  & in2[3];
    assign G_Z[4] = in1[2]  & in2[2];
    assign G_Z[5] = in1[1]  & in2[1];
    assign G_Z[6] = in1[0]  & in2[0];

    /*level 1*/
    assign G_A[0] = G_Z[0];
    black_cell level_1A(G_Z[0],  P_Z[1],  G_Z[1],  P_Z[0],  G_A[1],  P_A[1]);
    black_cell level_2A(G_Z[1],  P_Z[2],  G_Z[2],  P_Z[1],  G_A[2],  P_A[2]);
    black_cell level_3A(G_Z[2],  P_Z[3],  G_Z[3],  P_Z[2],  G_A[3],  P_A[3]);
    black_cell level_4A(G_Z[3],  P_Z[4],  G_Z[4],  P_Z[3],  G_A[4],  P_A[4]);
    black_cell level_5A(G_Z[4],  P_Z[5],  G_Z[5],  P_Z[4],  G_A[5],  P_A[5]);
    black_cell level_6A(G_Z[5],  P_Z[6],  G_Z[6],  P_Z[5],  G_A[6],  P_A[6]);

    /*level 2*/
    assign G_B[1] = G_A[1];
    gray_cell level_2B(G_A[0],   P_A[2],  G_A[2],  G_B[2]);
    black_cell level_3B(G_A[1],  P_A[3],  G_A[3],  P_A[1],  G_B[3],  P_B[3]);
    black_cell level_4B(G_A[2],  P_A[4],  G_A[4],  P_A[2],  G_B[4],  P_B[4]);
    black_cell level_5B(G_A[3],  P_A[5],  G_A[5],  P_A[3],  G_B[5],  P_B[5]);
    black_cell level_6B(G_A[4],  P_A[6],  G_A[6],  P_A[4],  G_B[6],  P_B[6]);

    /*level 3*/
    assign G_C[3] = G_B[3];
    gray_cell level_4C(G_A[0],   P_B[4],  G_B[4],  G_C[4]);
    gray_cell level_5C(G_B[1],   P_B[5],  G_B[5],  G_C[5]);
    gray_cell level_6C(G_B[2],   P_B[6],  G_B[6],  cout);

    /*outputs*/
    assign sum[0]  =           P_Z[0];
    assign sum[1]  = G_A[0]  ^ P_Z[1];
    assign sum[2]  = G_B[1]  ^ P_Z[2];
    assign sum[3]  = G_B[2]  ^ P_Z[3];
    assign sum[4]  = G_C[3]  ^ P_Z[4];
    assign sum[5]  = G_C[4]  ^ P_Z[5];
    assign sum[6]  = G_C[5]  ^ P_Z[6];
endmodule

module kogge_stone_8(sum, cout, in1, in2);
    input [7:0] in1, in2; //input
    output [7:0] sum; //output
    output cout; //carry-out
    wire [7:0] G_Z, P_Z, //wires
    G_A, P_A,
    G_B, P_B,
    G_C, P_C,
    G_D, P_D;

    assign P_Z[0]  = in1[7]  ^ in2[7];
    assign P_Z[1]  = in1[6]  ^ in2[6];
    assign P_Z[2]  = in1[5]  ^ in2[5];
    assign P_Z[3]  = in1[4]  ^ in2[4];
    assign P_Z[4]  = in1[3]  ^ in2[3];
    assign P_Z[5]  = in1[2]  ^ in2[2];
    assign P_Z[6]  = in1[1]  ^ in2[1];
    assign P_Z[7]  = in1[0]  ^ in2[0];

    assign G_Z[0]  = in1[7]  & in2[7];
    assign G_Z[1]  = in1[6]  & in2[6];
    assign G_Z[2]  = in1[5]  & in2[5];
    assign G_Z[3]  = in1[4]  & in2[4];
    assign G_Z[4]  = in1[3]  & in2[3];
    assign G_Z[5] = in1[2]  & in2[2];
    assign G_Z[6] = in1[1]  & in2[1];
    assign G_Z[7] = in1[0]  & in2[0];

    /*level 1*/
    assign G_A[0] = G_Z[0];
    /*gray_cell level_0A(1'b0, P_Z[0], G_Z[0], G_A[0]);*/
    black_cell level_1A(G_Z[0],  P_Z[1],  G_Z[1],  P_Z[0],  G_A[1],  P_A[1]);
    black_cell level_2A(G_Z[1],  P_Z[2],  G_Z[2],  P_Z[1],  G_A[2],  P_A[2]);
    black_cell level_3A(G_Z[2],  P_Z[3],  G_Z[3],  P_Z[2],  G_A[3],  P_A[3]);
    black_cell level_4A(G_Z[3],  P_Z[4],  G_Z[4],  P_Z[3],  G_A[4],  P_A[4]);
    black_cell level_5A(G_Z[4],  P_Z[5],  G_Z[5],  P_Z[4],  G_A[5],  P_A[5]);
    black_cell level_6A(G_Z[5],  P_Z[6],  G_Z[6],  P_Z[5],  G_A[6],  P_A[6]);
    black_cell level_7A(G_Z[6],  P_Z[7],  G_Z[7],  P_Z[6],  G_A[7],  P_A[7]);

    /*level 2*/
    assign G_B[1] = G_A[1];
    /*gray_cell level_1B(1'b0,      P_A[1],  G_A[1],  G_B[1]);*/
    gray_cell level_2B(G_A[0],   P_A[2],  G_A[2],  G_B[2]);
    black_cell level_3B(G_A[1],  P_A[3],  G_A[3],  P_A[1],  G_B[3],  P_B[3]);
    black_cell level_4B(G_A[2],  P_A[4],  G_A[4],  P_A[2],  G_B[4],  P_B[4]);
    black_cell level_5B(G_A[3],  P_A[5],  G_A[5],  P_A[3],  G_B[5],  P_B[5]);
    black_cell level_6B(G_A[4],  P_A[6],  G_A[6],  P_A[4],  G_B[6],  P_B[6]);
    black_cell level_7B(G_A[5],  P_A[7],  G_A[7],  P_A[5],  G_B[7],  P_B[7]);

    /*level 3*/
    assign G_C[3] = G_B[3];
    /*gray_cell level_3C(1'b0,      P_B[3],  G_B[3],  G_C[3]);*/
    gray_cell level_4C(G_A[0],   P_B[4],  G_B[4],  G_C[4]);
    gray_cell level_5C(G_B[1],   P_B[5],  G_B[5],  G_C[5]);
    gray_cell level_6C(G_B[2],   P_B[6],  G_B[6],  G_C[6]);
    black_cell level_7C(G_B[3],  P_B[7],  G_B[7],  P_B[3],  G_C[7],  P_C[7]);

    /*level 4*/
    assign cout = G_C[7];
    /*gray_cell level_7D(1'b0,     P_C[7],   G_C[7],           cout);*/

    /*outputs*/
    assign sum[0]  =           P_Z[0];
    assign sum[1]  = G_A[0]  ^ P_Z[1];
    assign sum[2]  = G_B[1]  ^ P_Z[2];
    assign sum[3]  = G_B[2]  ^ P_Z[3];
    assign sum[4]  = G_C[3]  ^ P_Z[4];
    assign sum[5]  = G_C[4]  ^ P_Z[5];
    assign sum[6]  = G_C[5]  ^ P_Z[6];
    assign sum[7]  = G_C[6]  ^ P_Z[7];
endmodule

module kogge_stone_9(sum, cout, in1, in2);
    input [8:0] in1, in2; 
    output [8:0] sum; 
    output cout; 
    wire [8:0] G_Z, P_Z, 
    G_A, P_A,
    G_B, P_B,
    G_C, P_C,
    G_D, P_D;

    assign P_Z[0]  = in1[8]  ^ in2[8];
    assign P_Z[1]  = in1[7]  ^ in2[7];
    assign P_Z[2]  = in1[6]  ^ in2[6];
    assign P_Z[3]  = in1[5]  ^ in2[5];
    assign P_Z[4]  = in1[4]  ^ in2[4];
    assign P_Z[5]  = in1[3]  ^ in2[3];
    assign P_Z[6]  = in1[2]  ^ in2[2];
    assign P_Z[7]  = in1[1]  ^ in2[1];
    assign P_Z[8]  = in1[0]  ^ in2[0];    

    assign G_Z[0]  = in1[8]  & in2[8];
    assign G_Z[1]  = in1[7]  & in2[7];
    assign G_Z[2]  = in1[6]  & in2[6];
    assign G_Z[3]  = in1[5]  & in2[5];
    assign G_Z[4]  = in1[4]  & in2[4];
    assign G_Z[5]  = in1[3]  & in2[3];
    assign G_Z[6] = in1[2]  & in2[2];
    assign G_Z[7] = in1[1]  & in2[1];
    assign G_Z[8] = in1[0]  & in2[0];

    /*level 1*/
    assign G_A[0] = G_Z[0];
    black_cell level_1A(G_Z[0],  P_Z[1],  G_Z[1],  P_Z[0],  G_A[1],  P_A[1]);
    black_cell level_2A(G_Z[1],  P_Z[2],  G_Z[2],  P_Z[1],  G_A[2],  P_A[2]);
    black_cell level_3A(G_Z[2],  P_Z[3],  G_Z[3],  P_Z[2],  G_A[3],  P_A[3]);
    black_cell level_4A(G_Z[3],  P_Z[4],  G_Z[4],  P_Z[3],  G_A[4],  P_A[4]);
    black_cell level_5A(G_Z[4],  P_Z[5],  G_Z[5],  P_Z[4],  G_A[5],  P_A[5]);
    black_cell level_6A(G_Z[5],  P_Z[6],  G_Z[6],  P_Z[5],  G_A[6],  P_A[6]);
    black_cell level_7A(G_Z[6],  P_Z[7],  G_Z[7],  P_Z[6],  G_A[7],  P_A[7]);
    black_cell level_8A(G_Z[7],  P_Z[8],  G_Z[8],  P_Z[7],  G_A[8],  P_A[8]);


    /*level 2*/
    assign G_B[1] = G_A[1];
    gray_cell level_2B(G_A[0],   P_A[2],  G_A[2],  G_B[2]);
    black_cell level_3B(G_A[1],  P_A[3],  G_A[3],  P_A[1],  G_B[3],  P_B[3]);
    black_cell level_4B(G_A[2],  P_A[4],  G_A[4],  P_A[2],  G_B[4],  P_B[4]);
    black_cell level_5B(G_A[3],  P_A[5],  G_A[5],  P_A[3],  G_B[5],  P_B[5]);
    black_cell level_6B(G_A[4],  P_A[6],  G_A[6],  P_A[4],  G_B[6],  P_B[6]);
    black_cell level_7B(G_A[5],  P_A[7],  G_A[7],  P_A[5],  G_B[7],  P_B[7]);
    black_cell level_8B(G_A[6],  P_A[8],  G_A[8],  P_A[6],  G_B[8],  P_B[8]);


    /*level 3*/
    assign G_C[3] = G_B[3];
    gray_cell level_4C(G_A[0],   P_B[4],  G_B[4],  G_C[4]);
    gray_cell level_5C(G_B[1],   P_B[5],  G_B[5],  G_C[5]);
    gray_cell level_6C(G_B[2],   P_B[6],  G_B[6],  G_C[6]);
    black_cell level_7C(G_B[3],  P_B[7],  G_B[7],  P_B[3],  G_C[7],  P_C[7]);
    black_cell level_8C(G_B[4],  P_B[8],  G_B[8],  P_B[4],  G_C[8],  P_C[8]);

    /*level 4*/
    assign G_D[7] = G_C[7];
    gray_cell level_8D(G_A[0],   P_C[8],   G_C[8],           cout);

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
endmodule

module kogge_stone_10(sum, cout, in1, in2);
    input [9:0] in1, in2; 
    output [9:0] sum; 
    output cout; 
    wire [9:0] G_Z, P_Z, 
    G_A, P_A,
    G_B, P_B,
    G_C, P_C,
    G_D, P_D;

    assign P_Z[0]  = in1[9]  ^ in2[9];
    assign P_Z[1]  = in1[8]  ^ in2[8];
    assign P_Z[2]  = in1[7]  ^ in2[7];
    assign P_Z[3]  = in1[6]  ^ in2[6];
    assign P_Z[4]  = in1[5]  ^ in2[5];
    assign P_Z[5]  = in1[4]  ^ in2[4];
    assign P_Z[6]  = in1[3]  ^ in2[3];
    assign P_Z[7]  = in1[2]  ^ in2[2];
    assign P_Z[8]  = in1[1]  ^ in2[1];
    assign P_Z[9]  = in1[0]  ^ in2[0];    

    assign G_Z[0]  = in1[9]  & in2[9];
    assign G_Z[1]  = in1[8]  & in2[8];
    assign G_Z[2]  = in1[7]  & in2[7];
    assign G_Z[3]  = in1[6]  & in2[6];
    assign G_Z[4]  = in1[5]  & in2[5];
    assign G_Z[5]  = in1[4]  & in2[4];
    assign G_Z[6]  = in1[3]  & in2[3];
    assign G_Z[7] = in1[2]  & in2[2];
    assign G_Z[8] = in1[1]  & in2[1];
    assign G_Z[9] = in1[0]  & in2[0];

    /*level 1*/
    assign G_A[0] = G_Z[0];
    /*gray_cell level_0A(1'b0, P_Z[0], G_Z[0], G_A[0]);*/
    black_cell level_1A(G_Z[0],  P_Z[1],  G_Z[1],  P_Z[0],  G_A[1],  P_A[1]);
    black_cell level_2A(G_Z[1],  P_Z[2],  G_Z[2],  P_Z[1],  G_A[2],  P_A[2]);
    black_cell level_3A(G_Z[2],  P_Z[3],  G_Z[3],  P_Z[2],  G_A[3],  P_A[3]);
    black_cell level_4A(G_Z[3],  P_Z[4],  G_Z[4],  P_Z[3],  G_A[4],  P_A[4]);
    black_cell level_5A(G_Z[4],  P_Z[5],  G_Z[5],  P_Z[4],  G_A[5],  P_A[5]);
    black_cell level_6A(G_Z[5],  P_Z[6],  G_Z[6],  P_Z[5],  G_A[6],  P_A[6]);
    black_cell level_7A(G_Z[6],  P_Z[7],  G_Z[7],  P_Z[6],  G_A[7],  P_A[7]);
    black_cell level_8A(G_Z[7],  P_Z[8],  G_Z[8],  P_Z[7],  G_A[8],  P_A[8]);
    black_cell level_9A(G_Z[8],  P_Z[9],  G_Z[9],  P_Z[8],  G_A[9],  P_A[9]);

    /*level 2*/
    assign G_B[1] = G_A[1];
    /*gray_cell level_1B(1'b0,      P_A[1],  G_A[1],  G_B[1]);*/
    gray_cell level_2B(G_A[0],   P_A[2],  G_A[2],  G_B[2]);
    black_cell level_3B(G_A[1],  P_A[3],  G_A[3],  P_A[1],  G_B[3],  P_B[3]);
    black_cell level_4B(G_A[2],  P_A[4],  G_A[4],  P_A[2],  G_B[4],  P_B[4]);
    black_cell level_5B(G_A[3],  P_A[5],  G_A[5],  P_A[3],  G_B[5],  P_B[5]);
    black_cell level_6B(G_A[4],  P_A[6],  G_A[6],  P_A[4],  G_B[6],  P_B[6]);
    black_cell level_7B(G_A[5],  P_A[7],  G_A[7],  P_A[5],  G_B[7],  P_B[7]);
    black_cell level_8B(G_A[6],  P_A[8],  G_A[8],  P_A[6],  G_B[8],  P_B[8]);
    black_cell level_9B(G_A[7],  P_A[9],  G_A[9],  P_A[7],  G_B[9],  P_B[9]);

    /*level 3*/
    assign G_C[3] = G_B[3];
    /*gray_cell level_3C(1'b0,      P_B[3],  G_B[3],  G_C[3]);*/
    gray_cell level_4C(G_A[0],   P_B[4],  G_B[4],  G_C[4]);
    gray_cell level_5C(G_B[1],   P_B[5],  G_B[5],  G_C[5]);
    gray_cell level_6C(G_B[2],   P_B[6],  G_B[6],  G_C[6]);
    black_cell level_7C(G_B[3],  P_B[7],  G_B[7],  P_B[3],  G_C[7],  P_C[7]);
    black_cell level_8C(G_B[4],  P_B[8],  G_B[8],  P_B[4],  G_C[8],  P_C[8]);
    black_cell level_9C(G_B[5],  P_B[9],  G_B[9],  P_B[5],  G_C[9],  P_C[9]);

    /*level 4*/
    assign G_D[7] = G_C[7];
    /*gray_cell level_7D(1'b0,     P_C[7],   G_C[7],           G_D[7]);*/
    gray_cell level_8D(G_A[0],   P_C[8],   G_C[8],           G_D[8]);
    gray_cell level_9D(G_B[1],   P_C[9],   G_C[9],           cout);

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
endmodule

module kogge_stone_11(sum, cout, in1, in2);
    input [10:0] in1, in2; 
    output [10:0] sum; 
    output cout; 
    wire [10:0] G_Z, P_Z, 
    G_A, P_A,
    G_B, P_B,
    G_C, P_C,
    G_D, P_D;

    assign P_Z[0]  = in1[10] ^ in2[10];
    assign P_Z[1]  = in1[9]  ^ in2[9];
    assign P_Z[2]  = in1[8]  ^ in2[8];
    assign P_Z[3]  = in1[7]  ^ in2[7];
    assign P_Z[4]  = in1[6]  ^ in2[6];
    assign P_Z[5]  = in1[5]  ^ in2[5];
    assign P_Z[6]  = in1[4]  ^ in2[4];
    assign P_Z[7]  = in1[3]  ^ in2[3];
    assign P_Z[8] = in1[2]  ^ in2[2];
    assign P_Z[9] = in1[1]  ^ in2[1];
    assign P_Z[10] = in1[0]  ^ in2[0];    

    assign G_Z[0]  = in1[10] & in2[10];
    assign G_Z[1]  = in1[9]  & in2[9];
    assign G_Z[2]  = in1[8]  & in2[8];
    assign G_Z[3]  = in1[7]  & in2[7];
    assign G_Z[4]  = in1[6]  & in2[6];
    assign G_Z[5]  = in1[5]  & in2[5];
    assign G_Z[6]  = in1[4]  & in2[4];
    assign G_Z[7]  = in1[3]  & in2[3];
    assign G_Z[8] = in1[2]  & in2[2];
    assign G_Z[9] = in1[1]  & in2[1];
    assign G_Z[10] = in1[0]  & in2[0];

    /*level 1*/
    assign G_A[0] = G_Z[0];
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


    /*level 2*/
    assign G_B[1] = G_A[1];
    gray_cell level_2B(G_A[0],   P_A[2],  G_A[2],  G_B[2]);
    black_cell level_3B(G_A[1],  P_A[3],  G_A[3],  P_A[1],  G_B[3],  P_B[3]);
    black_cell level_4B(G_A[2],  P_A[4],  G_A[4],  P_A[2],  G_B[4],  P_B[4]);
    black_cell level_5B(G_A[3],  P_A[5],  G_A[5],  P_A[3],  G_B[5],  P_B[5]);
    black_cell level_6B(G_A[4],  P_A[6],  G_A[6],  P_A[4],  G_B[6],  P_B[6]);
    black_cell level_7B(G_A[5],  P_A[7],  G_A[7],  P_A[5],  G_B[7],  P_B[7]);
    black_cell level_8B(G_A[6],  P_A[8],  G_A[8],  P_A[6],  G_B[8],  P_B[8]);
    black_cell level_9B(G_A[7],  P_A[9],  G_A[9],  P_A[7],  G_B[9],  P_B[9]);
    black_cell level_AB(G_A[8],  P_A[10], G_A[10], P_A[8],  G_B[10], P_B[10]);


    /*level 3*/
    assign G_C[3] = G_B[3];
    gray_cell level_4C(G_A[0],   P_B[4],  G_B[4],  G_C[4]);
    gray_cell level_5C(G_B[1],   P_B[5],  G_B[5],  G_C[5]);
    gray_cell level_6C(G_B[2],   P_B[6],  G_B[6],  G_C[6]);
    black_cell level_7C(G_B[3],  P_B[7],  G_B[7],  P_B[3],  G_C[7],  P_C[7]);
    black_cell level_8C(G_B[4],  P_B[8],  G_B[8],  P_B[4],  G_C[8],  P_C[8]);
    black_cell level_9C(G_B[5],  P_B[9],  G_B[9],  P_B[5],  G_C[9],  P_C[9]);
    black_cell level_AC(G_B[6],  P_B[10], G_B[10], P_B[6],  G_C[10], P_C[10]);

    /*level 4*/
    assign G_D[7] = G_C[7];
    gray_cell level_8D(G_A[0],   P_C[8],   G_C[8],           G_D[8]);
    gray_cell level_9D(G_B[1],   P_C[9],   G_C[9],           G_D[9]);
    gray_cell level_AD(G_B[2],   P_C[10],  G_C[10],          cout);

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
endmodule

module kogge_stone_12(sum, cout, in1, in2);
    input [11:0] in1, in2;
    output [11:0] sum;
    output cout;
    wire [11:0] G_Z, P_Z,
    G_A, P_A,
    G_B, P_B,
    G_C, P_C,
    G_D, P_D;

    assign P_Z[0]  = in1[11] ^ in2[11];
    assign P_Z[1]  = in1[10] ^ in2[10];
    assign P_Z[2]  = in1[9]  ^ in2[9];
    assign P_Z[3]  = in1[8]  ^ in2[8];
    assign P_Z[4]  = in1[7]  ^ in2[7];
    assign P_Z[5]  = in1[6]  ^ in2[6];
    assign P_Z[6]  = in1[5]  ^ in2[5];
    assign P_Z[7]  = in1[4]  ^ in2[4];
    assign P_Z[8]  = in1[3]  ^ in2[3];
    assign P_Z[9]  = in1[2]  ^ in2[2];
    assign P_Z[10] = in1[1]  ^ in2[1];
    assign P_Z[11] = in1[0]  ^ in2[0];    

    assign G_Z[0]  = in1[11] & in2[11];
    assign G_Z[1]  = in1[10] & in2[10];
    assign G_Z[2]  = in1[9]  & in2[9];
    assign G_Z[3]  = in1[8]  & in2[8];
    assign G_Z[4]  = in1[7]  & in2[7];
    assign G_Z[5]  = in1[6]  & in2[6];
    assign G_Z[6]  = in1[5]  & in2[5];
    assign G_Z[7]  = in1[4]  & in2[4];
    assign G_Z[8]  = in1[3]  & in2[3];
    assign G_Z[9]  = in1[2]  & in2[2];
    assign G_Z[10] = in1[1]  & in2[1];
    assign G_Z[11] = in1[0]  & in2[0];

    /*level 1*/
    assign G_A[0] = G_Z[0];
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

    /*level 2*/
    assign G_B[1] = G_A[1];
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

    /*level 3*/
    assign G_C[3] = G_B[3];
    gray_cell level_4C(G_A[0],   P_B[4],  G_B[4],  G_C[4]);
    gray_cell level_5C(G_B[1],   P_B[5],  G_B[5],  G_C[5]);
    gray_cell level_6C(G_B[2],   P_B[6],  G_B[6],  G_C[6]);
    black_cell level_7C(G_B[3],  P_B[7],  G_B[7],  P_B[3],  G_C[7],  P_C[7]);
    black_cell level_8C(G_B[4],  P_B[8],  G_B[8],  P_B[4],  G_C[8],  P_C[8]);
    black_cell level_9C(G_B[5],  P_B[9],  G_B[9],  P_B[5],  G_C[9],  P_C[9]);
    black_cell level_AC(G_B[6],  P_B[10], G_B[10], P_B[6],  G_C[10], P_C[10]);
    black_cell level_BC(G_B[7],  P_B[11], G_B[11], P_B[7],  G_C[11], P_C[11]);

    /*level 4*/
    assign G_D[7] = G_C[7];
    gray_cell level_8D(G_A[0],   P_C[8],   G_C[8],           G_D[8]);
    gray_cell level_9D(G_B[1],   P_C[9],   G_C[9],           G_D[9]);
    gray_cell level_AD(G_B[2],   P_C[10],  G_C[10],          G_D[10]);
    gray_cell level_BD(G_C[3],   P_C[11],  G_C[11],          cout);

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
endmodule

module kogge_stone_13(sum, cout, in1, in2);
    input [12:0] in1, in2; //input
    output [12:0] sum; //output
    output cout; //carry-out
    wire [12:0] G_Z, P_Z, //wires
    G_A, P_A,
    G_B, P_B,
    G_C, P_C,
    G_D, P_D;

    assign P_Z[0]  = in1[12] ^ in2[12];
    assign P_Z[1]  = in1[11] ^ in2[11];
    assign P_Z[2]  = in1[10] ^ in2[10];
    assign P_Z[3]  = in1[9]  ^ in2[9];
    assign P_Z[4]  = in1[8]  ^ in2[8];
    assign P_Z[5]  = in1[7]  ^ in2[7];
    assign P_Z[6]  = in1[6]  ^ in2[6];
    assign P_Z[7]  = in1[5]  ^ in2[5];
    assign P_Z[8]  = in1[4]  ^ in2[4];
    assign P_Z[9]  = in1[3]  ^ in2[3];
    assign P_Z[10] = in1[2]  ^ in2[2];
    assign P_Z[11] = in1[1]  ^ in2[1];
    assign P_Z[12] = in1[0]  ^ in2[0];    

    assign G_Z[0]  = in1[12] & in2[12];
    assign G_Z[1]  = in1[11] & in2[11];
    assign G_Z[2]  = in1[10] & in2[10];
    assign G_Z[3]  = in1[9]  & in2[9];
    assign G_Z[4]  = in1[8]  & in2[8];
    assign G_Z[5]  = in1[7]  & in2[7];
    assign G_Z[6]  = in1[6]  & in2[6];
    assign G_Z[7]  = in1[5]  & in2[5];
    assign G_Z[8]  = in1[4]  & in2[4];
    assign G_Z[9]  = in1[3]  & in2[3];
    assign G_Z[10] = in1[2]  & in2[2];
    assign G_Z[11] = in1[1]  & in2[1];
    assign G_Z[12] = in1[0]  & in2[0];

    /*level 1*/
    assign G_A[0] = G_Z[0];
    /*gray_cell level_0A(1'b0, P_Z[0], G_Z[0], G_A[0]);*/
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

    /*level 2*/
    assign G_B[1] = G_A[1];
    /*gray_cell level_1B(1'b0,      P_A[1],  G_A[1],  G_B[1]);*/
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

    /*level 3*/
    assign G_C[3] = G_B[3];
    /*gray_cell level_3C(1'b0,      P_B[3],  G_B[3],  G_C[3]);*/
    gray_cell level_4C(G_A[0],   P_B[4],  G_B[4],  G_C[4]);
    gray_cell level_5C(G_B[1],   P_B[5],  G_B[5],  G_C[5]);
    gray_cell level_6C(G_B[2],   P_B[6],  G_B[6],  G_C[6]);
    black_cell level_7C(G_B[3],  P_B[7],  G_B[7],  P_B[3],  G_C[7],  P_C[7]);
    black_cell level_8C(G_B[4],  P_B[8],  G_B[8],  P_B[4],  G_C[8],  P_C[8]);
    black_cell level_9C(G_B[5],  P_B[9],  G_B[9],  P_B[5],  G_C[9],  P_C[9]);
    black_cell level_AC(G_B[6],  P_B[10], G_B[10], P_B[6],  G_C[10], P_C[10]);
    black_cell level_BC(G_B[7],  P_B[11], G_B[11], P_B[7],  G_C[11], P_C[11]);
    black_cell level_CC(G_B[8],  P_B[12], G_B[12], P_B[8],  G_C[12], P_C[12]);

    /*level 4*/
    assign G_D[7] = G_C[7];
    /*gray_cell level_7D(1'b0,     P_C[7],   G_C[7],           G_D[7]);*/
    gray_cell level_8D(G_A[0],   P_C[8],   G_C[8],           G_D[8]);
    gray_cell level_9D(G_B[1],   P_C[9],   G_C[9],           G_D[9]);
    gray_cell level_AD(G_B[2],   P_C[10],  G_C[10],          G_D[10]);
    gray_cell level_BD(G_C[3],   P_C[11],  G_C[11],          G_D[11]);
    gray_cell level_CD(G_C[4],   P_C[12],  G_C[12],          cout);

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
endmodule

module kogge_stone_14(sum, cout, in1, in2);
    input [13:0] in1, in2; 
    output [13:0] sum; 
    output cout; 
    wire [13:0] G_Z, P_Z, 
    G_A, P_A,
    G_B, P_B,
    G_C, P_C,
    G_D, P_D,
    G_E, P_E,
    G_F, P_F;

    assign P_Z[0]  = in1[13] ^ in2[13];
    assign P_Z[1]  = in1[12] ^ in2[12];
    assign P_Z[2]  = in1[11] ^ in2[11];
    assign P_Z[3]  = in1[10] ^ in2[10];
    assign P_Z[4] = in1[9]  ^ in2[9];
    assign P_Z[5] = in1[8]  ^ in2[8];
    assign P_Z[6] = in1[7]  ^ in2[7];
    assign P_Z[7] = in1[6]  ^ in2[6];
    assign P_Z[8] = in1[5]  ^ in2[5];
    assign P_Z[9] = in1[4]  ^ in2[4];
    assign P_Z[10] = in1[3]  ^ in2[3];
    assign P_Z[11] = in1[2]  ^ in2[2];
    assign P_Z[12] = in1[1]  ^ in2[1];
    assign P_Z[13] = in1[0]  ^ in2[0];

    assign G_Z[0]  = in1[13] & in2[13];
    assign G_Z[1]  = in1[12] & in2[12];
    assign G_Z[2]  = in1[11] & in2[11];
    assign G_Z[3]  = in1[10] & in2[10];
    assign G_Z[4] = in1[9]  & in2[9];
    assign G_Z[5] = in1[8]  & in2[8];
    assign G_Z[6] = in1[7]  & in2[7];
    assign G_Z[7] = in1[6]  & in2[6];
    assign G_Z[8] = in1[5]  & in2[5];
    assign G_Z[9] = in1[4]  & in2[4];
    assign G_Z[10] = in1[3]  & in2[3];
    assign G_Z[11] = in1[2]  & in2[2];
    assign G_Z[12] = in1[1]  & in2[1];
    assign G_Z[13] = in1[0]  & in2[0];

    /*level 1*/
    assign G_A[0] = G_Z[0];
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

    /*level 2*/
    assign G_B[1] = G_A[1];
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

    /*level 3*/
    assign G_C[3] = G_B[3];
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

    /*level 4*/
    assign G_D[7] = G_C[7];
    gray_cell level_8D(G_A[0],    P_C[8],   G_C[8],            G_D[8]);
    gray_cell level_9D(G_B[1],    P_C[9],   G_C[9],            G_D[9]);
    gray_cell level_AD(G_B[2],    P_C[10],  G_C[10],           G_D[10]);
    gray_cell level_BD(G_C[3],    P_C[11],  G_C[11],           G_D[11]);
    gray_cell level_CD(G_C[4],    P_C[12],  G_C[12],           G_D[12]);
    gray_cell level_DD(G_C[5],    P_C[13],  G_C[13],           cout);

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
endmodule

module kogge_stone_15(sum, cout, in1, in2);
    input [14:0] in1, in2; 
    output [14:0] sum; 
    output cout; 
    wire [14:0] G_Z, P_Z, 
    G_A, P_A,
    G_B, P_B,
    G_C, P_C,
    G_D, P_D,
    G_E, P_E,
    G_F, P_F;

    assign P_Z[0]  = in1[14] ^ in2[14];
    assign P_Z[1]  = in1[13] ^ in2[13];
    assign P_Z[2]  = in1[12] ^ in2[12];
    assign P_Z[3]  = in1[11] ^ in2[11];
    assign P_Z[4]  = in1[10] ^ in2[10];
    assign P_Z[5] = in1[9]  ^ in2[9];
    assign P_Z[6] = in1[8]  ^ in2[8];
    assign P_Z[7] = in1[7]  ^ in2[7];
    assign P_Z[8] = in1[6]  ^ in2[6];
    assign P_Z[9] = in1[5]  ^ in2[5];
    assign P_Z[10] = in1[4]  ^ in2[4];
    assign P_Z[11] = in1[3]  ^ in2[3];
    assign P_Z[12] = in1[2]  ^ in2[2];
    assign P_Z[13] = in1[1]  ^ in2[1];
    assign P_Z[14] = in1[0]  ^ in2[0];

    assign G_Z[0]  = in1[14] & in2[14];
    assign G_Z[1]  = in1[13] & in2[13];
    assign G_Z[2]  = in1[12] & in2[12];
    assign G_Z[3]  = in1[11] & in2[11];
    assign G_Z[4]  = in1[10] & in2[10];
    assign G_Z[5] = in1[9]  & in2[9];
    assign G_Z[6] = in1[8]  & in2[8];
    assign G_Z[7] = in1[7]  & in2[7];
    assign G_Z[8] = in1[6]  & in2[6];
    assign G_Z[9] = in1[5]  & in2[5];
    assign G_Z[10] = in1[4]  & in2[4];
    assign G_Z[11] = in1[3]  & in2[3];
    assign G_Z[12] = in1[2]  & in2[2];
    assign G_Z[13] = in1[1]  & in2[1];
    assign G_Z[14] = in1[0]  & in2[0];

    /*level 1*/
    assign G_A[0] = G_Z[0];
    /*gray_cell level_0A(1'b0, P_Z[0], G_Z[0], G_A[0]);*/
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

    /*level 2*/
    assign G_B[1] = G_A[1];
    /*gray_cell level_1B(1'b0,      P_A[1],  G_A[1],  G_B[1]);*/
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

    /*level 3*/
    assign G_C[3] = G_B[3];
    /*gray_cell level_3C(1'b0,      P_B[3],  G_B[3],  G_C[3]);*/
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

    /*level 4*/
    assign G_D[7] = G_C[7];
    /*gray_cell level_7D(1'b0,       P_C[7],   G_C[7],            G_D[7]);*/
    gray_cell level_8D(G_A[0],    P_C[8],   G_C[8],            G_D[8]);
    gray_cell level_9D(G_B[1],    P_C[9],   G_C[9],            G_D[9]);
    gray_cell level_AD(G_B[2],    P_C[10],  G_C[10],           G_D[10]);
    gray_cell level_BD(G_C[3],    P_C[11],  G_C[11],           G_D[11]);
    gray_cell level_CD(G_C[4],    P_C[12],  G_C[12],           G_D[12]);
    gray_cell level_DD(G_C[5],    P_C[13],  G_C[13],           G_D[13]);
    gray_cell level_ED(G_C[6],    P_C[14],  G_C[14],           cout);

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
endmodule

module kogge_stone_16(sum, cout, in1, in2);
    input [15:0] in1, in2; 
    output [15:0] sum; 
    output cout; 
    wire [15:0] G_Z, P_Z, 
    G_A, P_A,
    G_B, P_B,
    G_C, P_C,
    G_D, P_D,
    G_E, P_E,
    G_F, P_F;

    assign P_Z[0]  = in1[15] ^ in2[15];
    assign P_Z[1]  = in1[14] ^ in2[14];
    assign P_Z[2]  = in1[13] ^ in2[13];
    assign P_Z[3]  = in1[12] ^ in2[12];
    assign P_Z[4]  = in1[11] ^ in2[11];
    assign P_Z[5]  = in1[10] ^ in2[10];
    assign P_Z[6] = in1[9]  ^ in2[9];
    assign P_Z[7] = in1[8]  ^ in2[8];
    assign P_Z[8] = in1[7]  ^ in2[7];
    assign P_Z[9] = in1[6]  ^ in2[6];
    assign P_Z[10] = in1[5]  ^ in2[5];
    assign P_Z[11] = in1[4]  ^ in2[4];
    assign P_Z[12] = in1[3]  ^ in2[3];
    assign P_Z[13] = in1[2]  ^ in2[2];
    assign P_Z[14] = in1[1]  ^ in2[1];
    assign P_Z[15] = in1[0]  ^ in2[0];

    assign G_Z[0]  = in1[15] & in2[15];
    assign G_Z[1]  = in1[14] & in2[14];
    assign G_Z[2]  = in1[13] & in2[13];
    assign G_Z[3]  = in1[12] & in2[12];
    assign G_Z[4]  = in1[11] & in2[11];
    assign G_Z[5]  = in1[10] & in2[10];
    assign G_Z[6] = in1[9]  & in2[9];
    assign G_Z[7] = in1[8]  & in2[8];
    assign G_Z[8] = in1[7]  & in2[7];
    assign G_Z[9] = in1[6]  & in2[6];
    assign G_Z[10] = in1[5]  & in2[5];
    assign G_Z[11] = in1[4]  & in2[4];
    assign G_Z[12] = in1[3]  & in2[3];
    assign G_Z[13] = in1[2]  & in2[2];
    assign G_Z[14] = in1[1]  & in2[1];
    assign G_Z[15] = in1[0]  & in2[0];

    /*level 1*/
    assign G_A[0] = G_Z[0];
    /*gray_cell level_0A(1'b0, P_Z[0], G_Z[0], G_A[0]);*/
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

    /*level 2*/
    assign G_B[1] = G_A[1];
    /*gray_cell level_1B(1'b0,      P_A[1],  G_A[1],  G_B[1]);*/
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

    /*level 3*/
    assign G_C[3] = G_B[3];
    /*gray_cell level_3C(1'b0,      P_B[3],  G_B[3],  G_C[3]);*/
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

    /*level 4*/
    assign G_D[7] = G_C[7];
    /*gray_cell level_7D(1'b0,       P_C[7],   G_C[7],            G_D[7]);*/
    gray_cell level_8D(G_A[0],    P_C[8],   G_C[8],            G_D[8]);
    gray_cell level_9D(G_B[1],    P_C[9],   G_C[9],            G_D[9]);
    gray_cell level_AD(G_B[2],    P_C[10],  G_C[10],           G_D[10]);
    gray_cell level_BD(G_C[3],    P_C[11],  G_C[11],           G_D[11]);
    gray_cell level_CD(G_C[4],    P_C[12],  G_C[12],           G_D[12]);
    gray_cell level_DD(G_C[5],    P_C[13],  G_C[13],           G_D[13]);
    gray_cell level_ED(G_C[6],    P_C[14],  G_C[14],           G_D[14]);
    black_cell level_FD(G_C[7],   P_C[15],  G_C[15],  P_C[7],  G_D[15], P_D[15]);

    /*level 5*/
    assign cout = G_D[15];
    /*gray_cell level_FE(1'b0,       P_D[15],  G_D[15],           G_E[15]);*/

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
endmodule


module kogge_stone_17(sum, cout, in1, in2);
    input [16:0] in1, in2; 
    output [16:0] sum; 
    output cout; 
    wire [16:0] G_Z, P_Z, 
    G_A, P_A,
    G_B, P_B,
    G_C, P_C,
    G_D, P_D,
    G_E, P_E,
    G_F, P_F;

    assign P_Z[0]  = in1[16] ^ in2[16];
    assign P_Z[1]  = in1[15] ^ in2[15];
    assign P_Z[2]  = in1[14] ^ in2[14];
    assign P_Z[3]  = in1[13] ^ in2[13];
    assign P_Z[4]  = in1[12] ^ in2[12];
    assign P_Z[5]  = in1[11] ^ in2[11];
    assign P_Z[6]  = in1[10] ^ in2[10];
    assign P_Z[7] = in1[9]  ^ in2[9];
    assign P_Z[8] = in1[8]  ^ in2[8];
    assign P_Z[9] = in1[7]  ^ in2[7];
    assign P_Z[10] = in1[6]  ^ in2[6];
    assign P_Z[11] = in1[5]  ^ in2[5];
    assign P_Z[12] = in1[4]  ^ in2[4];
    assign P_Z[13] = in1[3]  ^ in2[3];
    assign P_Z[14] = in1[2]  ^ in2[2];
    assign P_Z[15] = in1[1]  ^ in2[1];
    assign P_Z[16] = in1[0]  ^ in2[0];

    assign G_Z[0]  = in1[16] & in2[16];
    assign G_Z[1]  = in1[15] & in2[15];
    assign G_Z[2]  = in1[14] & in2[14];
    assign G_Z[3]  = in1[13] & in2[13];
    assign G_Z[4]  = in1[12] & in2[12];
    assign G_Z[5]  = in1[11] & in2[11];
    assign G_Z[6]  = in1[10] & in2[10];
    assign G_Z[7] = in1[9]  & in2[9];
    assign G_Z[8] = in1[8]  & in2[8];
    assign G_Z[9] = in1[7]  & in2[7];
    assign G_Z[10] = in1[6]  & in2[6];
    assign G_Z[11] = in1[5]  & in2[5];
    assign G_Z[12] = in1[4]  & in2[4];
    assign G_Z[13] = in1[3]  & in2[3];
    assign G_Z[14] = in1[2]  & in2[2];
    assign G_Z[15] = in1[1]  & in2[1];
    assign G_Z[16] = in1[0]  & in2[0];

    /*level 1*/
    assign G_A[0] = G_Z[0];
    /*gray_cell level_0A(1'b0, P_Z[0], G_Z[0], G_A[0]);*/
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

    /*level 2*/
    assign G_B[1] = G_A[1];
    /*gray_cell level_1B(1'b0,      P_A[1],  G_A[1],  G_B[1]);*/
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

    /*level 3*/
    assign G_C[3] = G_B[3];
    /*gray_cell level_3C(1'b0,      P_B[3],  G_B[3],  G_C[3]);*/
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

    /*level 4*/
    assign G_D[7] = G_C[7];
    /*gray_cell level_7D(1'b0,       P_C[7],   G_C[7],            G_D[7]);*/
    gray_cell level_8D(G_A[0],    P_C[8],   G_C[8],            G_D[8]);
    gray_cell level_9D(G_B[1],    P_C[9],   G_C[9],            G_D[9]);
    gray_cell level_AD(G_B[2],    P_C[10],  G_C[10],           G_D[10]);
    gray_cell level_BD(G_C[3],    P_C[11],  G_C[11],           G_D[11]);
    gray_cell level_CD(G_C[4],    P_C[12],  G_C[12],           G_D[12]);
    gray_cell level_DD(G_C[5],    P_C[13],  G_C[13],           G_D[13]);
    gray_cell level_ED(G_C[6],    P_C[14],  G_C[14],           G_D[14]);
    black_cell level_FD(G_C[7],   P_C[15],  G_C[15],  P_C[7],  G_D[15], P_D[15]);
    black_cell level_GD(G_C[8],   P_C[16],  G_C[16],  P_C[8],  G_D[16], P_D[16]);

    /*level 5*/
    assign G_E[15] = G_D[15];
    /*gray_cell level_FE(1'b0,       P_D[15],  G_D[15],           G_E[15]);*/
    gray_cell level_GE(G_A[0],    P_D[16],  G_D[16],           cout);

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
endmodule

module kogge_stone_18(sum, cout, in1, in2);
    input [17:0] in1, in2; 
    output [17:0] sum; 
    output cout; 
    wire [17:0] G_Z, P_Z, 
    G_A, P_A,
    G_B, P_B,
    G_C, P_C,
    G_D, P_D,
    G_E, P_E,
    G_F, P_F;

    assign P_Z[0]  = in1[17] ^ in2[17];
    assign P_Z[1]  = in1[16] ^ in2[16];
    assign P_Z[2]  = in1[15] ^ in2[15];
    assign P_Z[3]  = in1[14] ^ in2[14];
    assign P_Z[4]  = in1[13] ^ in2[13];
    assign P_Z[5]  = in1[12] ^ in2[12];
    assign P_Z[6]  = in1[11] ^ in2[11];
    assign P_Z[7]  = in1[10] ^ in2[10];
    assign P_Z[8] = in1[9]  ^ in2[9];
    assign P_Z[9] = in1[8]  ^ in2[8];
    assign P_Z[10] = in1[7]  ^ in2[7];
    assign P_Z[11] = in1[6]  ^ in2[6];
    assign P_Z[12] = in1[5]  ^ in2[5];
    assign P_Z[13] = in1[4]  ^ in2[4];
    assign P_Z[14] = in1[3]  ^ in2[3];
    assign P_Z[15] = in1[2]  ^ in2[2];
    assign P_Z[16] = in1[1]  ^ in2[1];
    assign P_Z[17] = in1[0]  ^ in2[0];

    assign G_Z[0]  = in1[17] & in2[17];
    assign G_Z[1]  = in1[16] & in2[16];
    assign G_Z[2]  = in1[15] & in2[15];
    assign G_Z[3]  = in1[14] & in2[14];
    assign G_Z[4]  = in1[13] & in2[13];
    assign G_Z[5]  = in1[12] & in2[12];
    assign G_Z[6]  = in1[11] & in2[11];
    assign G_Z[7]  = in1[10] & in2[10];
    assign G_Z[8] = in1[9]  & in2[9];
    assign G_Z[9] = in1[8]  & in2[8];
    assign G_Z[10] = in1[7]  & in2[7];
    assign G_Z[11] = in1[6]  & in2[6];
    assign G_Z[12] = in1[5]  & in2[5];
    assign G_Z[13] = in1[4]  & in2[4];
    assign G_Z[14] = in1[3]  & in2[3];
    assign G_Z[15] = in1[2]  & in2[2];
    assign G_Z[16] = in1[1]  & in2[1];
    assign G_Z[17] = in1[0]  & in2[0];

    /*level 1*/
    assign G_A[0] = G_Z[0];
    /*gray_cell level_0A(1'b0, P_Z[0], G_Z[0], G_A[0]);*/
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

    /*level 2*/
    assign G_B[1] = G_A[1];
    /*gray_cell level_1B(1'b0,      P_A[1],  G_A[1],  G_B[1]);*/
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

    /*level 3*/
    assign G_C[3] = G_B[3];
    /*gray_cell level_3C(1'b0,      P_B[3],  G_B[3],  G_C[3]);*/
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

    /*level 4*/
    assign G_D[7] = G_C[7];
    /*gray_cell level_7D(1'b0,       P_C[7],   G_C[7],            G_D[7]);*/
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

    /*level 5*/
    assign G_E[15] = G_D[15];
    /*gray_cell level_FE(1'b0,       P_D[15],  G_D[15],           G_E[15]);*/
    gray_cell level_GE(G_A[0],    P_D[16],  G_D[16],           G_E[16]);
    gray_cell level_HE(G_B[1],    P_D[17],  G_D[17],           cout);

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
endmodule

module kogge_stone_19(sum, cout, in1, in2);
    input [18:0] in1, in2; 
    output [18:0] sum; 
    output cout; 
    wire [18:0] G_Z, P_Z, 
    G_A, P_A,
    G_B, P_B,
    G_C, P_C,
    G_D, P_D,
    G_E, P_E,
    G_F, P_F;

    assign P_Z[0]  = in1[18] ^ in2[18];
    assign P_Z[1]  = in1[17] ^ in2[17];
    assign P_Z[2]  = in1[16] ^ in2[16];
    assign P_Z[3]  = in1[15] ^ in2[15];
    assign P_Z[4]  = in1[14] ^ in2[14];
    assign P_Z[5]  = in1[13] ^ in2[13];
    assign P_Z[6]  = in1[12] ^ in2[12];
    assign P_Z[7]  = in1[11] ^ in2[11];
    assign P_Z[8]  = in1[10] ^ in2[10];
    assign P_Z[9] = in1[9]  ^ in2[9];
    assign P_Z[10] = in1[8]  ^ in2[8];
    assign P_Z[11] = in1[7]  ^ in2[7];
    assign P_Z[12] = in1[6]  ^ in2[6];
    assign P_Z[13] = in1[5]  ^ in2[5];
    assign P_Z[14] = in1[4]  ^ in2[4];
    assign P_Z[15] = in1[3]  ^ in2[3];
    assign P_Z[16] = in1[2]  ^ in2[2];
    assign P_Z[17] = in1[1]  ^ in2[1];
    assign P_Z[18] = in1[0]  ^ in2[0];

    assign G_Z[0]  = in1[18] & in2[18];
    assign G_Z[1]  = in1[17] & in2[17];
    assign G_Z[2]  = in1[16] & in2[16];
    assign G_Z[3]  = in1[15] & in2[15];
    assign G_Z[4]  = in1[14] & in2[14];
    assign G_Z[5]  = in1[13] & in2[13];
    assign G_Z[6]  = in1[12] & in2[12];
    assign G_Z[7]  = in1[11] & in2[11];
    assign G_Z[8]  = in1[10] & in2[10];
    assign G_Z[9] = in1[9]  & in2[9];
    assign G_Z[10] = in1[8]  & in2[8];
    assign G_Z[11] = in1[7]  & in2[7];
    assign G_Z[12] = in1[6]  & in2[6];
    assign G_Z[13] = in1[5]  & in2[5];
    assign G_Z[14] = in1[4]  & in2[4];
    assign G_Z[15] = in1[3]  & in2[3];
    assign G_Z[16] = in1[2]  & in2[2];
    assign G_Z[17] = in1[1]  & in2[1];
    assign G_Z[18] = in1[0]  & in2[0];

    /*level 1*/
    assign G_A[0] = G_Z[0];
    /*gray_cell level_0A(1'b0, P_Z[0], G_Z[0], G_A[0]);*/
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

    /*level 2*/
    assign G_B[1] = G_A[1];
    /*gray_cell level_1B(1'b0,      P_A[1],  G_A[1],  G_B[1]);*/
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

    /*level 3*/
    assign G_C[3] = G_B[3];
    /*gray_cell level_3C(1'b0,      P_B[3],  G_B[3],  G_C[3]);*/
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

    /*level 4*/
    assign G_D[7] = G_C[7];
    /*gray_cell level_7D(1'b0,       P_C[7],   G_C[7],            G_D[7]);*/
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

    /*level 5*/
    assign G_E[15] = G_D[15];
    /*gray_cell level_FE(1'b0,       P_D[15],  G_D[15],           G_E[15]);*/
    gray_cell level_GE(G_A[0],    P_D[16],  G_D[16],           G_E[16]);
    gray_cell level_HE(G_B[1],    P_D[17],  G_D[17],           G_E[17]);
    gray_cell level_IE(G_B[2],    P_D[18],  G_D[18],           cout);

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
endmodule


module kogge_stone_20(sum, cout, in1, in2);
    input [19:0] in1, in2; 
    output [19:0] sum; 
    output cout; 
    wire [19:0] G_Z, P_Z, 
    G_A, P_A,
    G_B, P_B,
    G_C, P_C,
    G_D, P_D,
    G_E, P_E,
    G_F, P_F;

    assign P_Z[0]  = in1[19] ^ in2[19];
    assign P_Z[1]  = in1[18] ^ in2[18];
    assign P_Z[2]  = in1[17] ^ in2[17];
    assign P_Z[3]  = in1[16] ^ in2[16];
    assign P_Z[4]  = in1[15] ^ in2[15];
    assign P_Z[5]  = in1[14] ^ in2[14];
    assign P_Z[6]  = in1[13] ^ in2[13];
    assign P_Z[7]  = in1[12] ^ in2[12];
    assign P_Z[8]  = in1[11] ^ in2[11];
    assign P_Z[9]  = in1[10] ^ in2[10];
    assign P_Z[10] = in1[9]  ^ in2[9];
    assign P_Z[11] = in1[8]  ^ in2[8];
    assign P_Z[12] = in1[7]  ^ in2[7];
    assign P_Z[13] = in1[6]  ^ in2[6];
    assign P_Z[14] = in1[5]  ^ in2[5];
    assign P_Z[15] = in1[4]  ^ in2[4];
    assign P_Z[16] = in1[3]  ^ in2[3];
    assign P_Z[17] = in1[2]  ^ in2[2];
    assign P_Z[18] = in1[1]  ^ in2[1];
    assign P_Z[19] = in1[0]  ^ in2[0];

    assign G_Z[0]  = in1[19] & in2[19];
    assign G_Z[1]  = in1[18] & in2[18];
    assign G_Z[2]  = in1[17] & in2[17];
    assign G_Z[3]  = in1[16] & in2[16];
    assign G_Z[4]  = in1[15] & in2[15];
    assign G_Z[5]  = in1[14] & in2[14];
    assign G_Z[6]  = in1[13] & in2[13];
    assign G_Z[7]  = in1[12] & in2[12];
    assign G_Z[8]  = in1[11] & in2[11];
    assign G_Z[9]  = in1[10] & in2[10];
    assign G_Z[10] = in1[9]  & in2[9];
    assign G_Z[11] = in1[8]  & in2[8];
    assign G_Z[12] = in1[7]  & in2[7];
    assign G_Z[13] = in1[6]  & in2[6];
    assign G_Z[14] = in1[5]  & in2[5];
    assign G_Z[15] = in1[4]  & in2[4];
    assign G_Z[16] = in1[3]  & in2[3];
    assign G_Z[17] = in1[2]  & in2[2];
    assign G_Z[18] = in1[1]  & in2[1];
    assign G_Z[19] = in1[0]  & in2[0];

    /*level 1*/
    assign G_A[0] = G_Z[0];
    /*gray_cell level_0A(1'b0, P_Z[0], G_Z[0], G_A[0]);*/
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

    /*level 2*/
    assign G_B[1] = G_A[1];
    /*gray_cell level_1B(1'b0,      P_A[1],  G_A[1],  G_B[1]);*/
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

    /*level 3*/
    assign G_C[3] = G_B[3];
    /*gray_cell level_3C(1'b0,      P_B[3],  G_B[3],  G_C[3]);*/
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

    /*level 4*/
    assign G_D[7] = G_C[7];
    /*gray_cell level_7D(1'b0,       P_C[7],   G_C[7],            G_D[7]);*/
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

    /*level 5*/
    assign G_E[15] = G_D[15];
    /*gray_cell level_FE(1'b0,       P_D[15],  G_D[15],           G_E[15]);*/
    gray_cell level_GE(G_A[0],    P_D[16],  G_D[16],           G_E[16]);
    gray_cell level_HE(G_B[1],    P_D[17],  G_D[17],           G_E[17]);
    gray_cell level_IE(G_B[2],    P_D[18],  G_D[18],           G_E[18]);
    gray_cell level_JE(G_C[3],    P_D[19],  G_D[19],           cout);

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
endmodule

module kogge_stone_21(sum, cout, in1, in2);
    input [20:0] in1, in2; 
    output [20:0] sum; 
    output cout; 
    wire [20:0] G_Z, P_Z, 
    G_A, P_A,
    G_B, P_B,
    G_C, P_C,
    G_D, P_D,
    G_E, P_E,
    G_F, P_F;

    assign P_Z[0]  = in1[20] ^ in2[20];
    assign P_Z[1]  = in1[19] ^ in2[19];
    assign P_Z[2]  = in1[18] ^ in2[18];
    assign P_Z[3]  = in1[17] ^ in2[17];
    assign P_Z[4]  = in1[16] ^ in2[16];
    assign P_Z[5]  = in1[15] ^ in2[15];
    assign P_Z[6]  = in1[14] ^ in2[14];
    assign P_Z[7]  = in1[13] ^ in2[13];
    assign P_Z[8] = in1[12] ^ in2[12];
    assign P_Z[9] = in1[11] ^ in2[11];
    assign P_Z[10] = in1[10] ^ in2[10];
    assign P_Z[11] = in1[9]  ^ in2[9];
    assign P_Z[12] = in1[8]  ^ in2[8];
    assign P_Z[13] = in1[7]  ^ in2[7];
    assign P_Z[14] = in1[6]  ^ in2[6];
    assign P_Z[15] = in1[5]  ^ in2[5];
    assign P_Z[16] = in1[4]  ^ in2[4];
    assign P_Z[17] = in1[3]  ^ in2[3];
    assign P_Z[18] = in1[2]  ^ in2[2];
    assign P_Z[19] = in1[1]  ^ in2[1];
    assign P_Z[20] = in1[0]  ^ in2[0];

    assign G_Z[0]  = in1[20] & in2[20];
    assign G_Z[1]  = in1[19] & in2[19];
    assign G_Z[2]  = in1[18] & in2[18];
    assign G_Z[3]  = in1[17] & in2[17];
    assign G_Z[4]  = in1[16] & in2[16];
    assign G_Z[5]  = in1[15] & in2[15];
    assign G_Z[6]  = in1[14] & in2[14];
    assign G_Z[7]  = in1[13] & in2[13];
    assign G_Z[8] = in1[12] & in2[12];
    assign G_Z[9] = in1[11] & in2[11];
    assign G_Z[10] = in1[10] & in2[10];
    assign G_Z[11] = in1[9]  & in2[9];
    assign G_Z[12] = in1[8]  & in2[8];
    assign G_Z[13] = in1[7]  & in2[7];
    assign G_Z[14] = in1[6]  & in2[6];
    assign G_Z[15] = in1[5]  & in2[5];
    assign G_Z[16] = in1[4]  & in2[4];
    assign G_Z[17] = in1[3]  & in2[3];
    assign G_Z[18] = in1[2]  & in2[2];
    assign G_Z[19] = in1[1]  & in2[1];
    assign G_Z[20] = in1[0]  & in2[0];

    /*level 1*/
    assign G_A[0] = G_Z[0];
    /*gray_cell level_0A(1'b0, P_Z[0], G_Z[0], G_A[0]);*/
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

    /*level 2*/
    assign G_B[1] = G_A[1];
    /*gray_cell level_1B(1'b0,      P_A[1],  G_A[1],  G_B[1]);*/
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

    /*level 3*/
    assign G_C[3] = G_B[3];
    /*gray_cell level_3C(1'b0,      P_B[3],  G_B[3],  G_C[3]);*/
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

    /*level 4*/
    assign G_D[7] = G_C[7];
    /*gray_cell level_7D(1'b0,       P_C[7],   G_C[7],            G_D[7]);*/
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

    /*level 5*/
    assign G_E[15] = G_D[15];
    /*gray_cell level_FE(1'b0,       P_D[15],  G_D[15],           G_E[15]);*/
    gray_cell level_GE(G_A[0],    P_D[16],  G_D[16],           G_E[16]);
    gray_cell level_HE(G_B[1],    P_D[17],  G_D[17],           G_E[17]);
    gray_cell level_IE(G_B[2],    P_D[18],  G_D[18],           G_E[18]);
    gray_cell level_JE(G_C[3],    P_D[19],  G_D[19],           G_E[19]);
    gray_cell level_KE(G_C[4],    P_D[20],  G_D[20],           cout);

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
endmodule

module kogge_stone_22(sum, cout, in1, in2);
    input [21:0] in1, in2; 
    output [21:0] sum; 
    output cout; 
    wire [21:0] G_Z, P_Z, 
    G_A, P_A,
    G_B, P_B,
    G_C, P_C,
    G_D, P_D,
    G_E, P_E,
    G_F, P_F;

    assign P_Z[0]  = in1[21] ^ in2[21];
    assign P_Z[1]  = in1[20] ^ in2[20];
    assign P_Z[2]  = in1[19] ^ in2[19];
    assign P_Z[3]  = in1[18] ^ in2[18];
    assign P_Z[4]  = in1[17] ^ in2[17];
    assign P_Z[5]  = in1[16] ^ in2[16];
    assign P_Z[6]  = in1[15] ^ in2[15];
    assign P_Z[7]  = in1[14] ^ in2[14];
    assign P_Z[8]  = in1[13] ^ in2[13];
    assign P_Z[9] = in1[12] ^ in2[12];
    assign P_Z[10] = in1[11] ^ in2[11];
    assign P_Z[11] = in1[10] ^ in2[10];
    assign P_Z[12] = in1[9]  ^ in2[9];
    assign P_Z[13] = in1[8]  ^ in2[8];
    assign P_Z[14] = in1[7]  ^ in2[7];
    assign P_Z[15] = in1[6]  ^ in2[6];
    assign P_Z[16] = in1[5]  ^ in2[5];
    assign P_Z[17] = in1[4]  ^ in2[4];
    assign P_Z[18] = in1[3]  ^ in2[3];
    assign P_Z[19] = in1[2]  ^ in2[2];
    assign P_Z[20] = in1[1]  ^ in2[1];
    assign P_Z[21] = in1[0]  ^ in2[0];

    assign G_Z[0]  = in1[21] & in2[21];
    assign G_Z[1]  = in1[20] & in2[20];
    assign G_Z[2]  = in1[19] & in2[19];
    assign G_Z[3]  = in1[18] & in2[18];
    assign G_Z[4]  = in1[17] & in2[17];
    assign G_Z[5]  = in1[16] & in2[16];
    assign G_Z[6]  = in1[15] & in2[15];
    assign G_Z[7]  = in1[14] & in2[14];
    assign G_Z[8]  = in1[13] & in2[13];
    assign G_Z[9] = in1[12] & in2[12];
    assign G_Z[10] = in1[11] & in2[11];
    assign G_Z[11] = in1[10] & in2[10];
    assign G_Z[12] = in1[9]  & in2[9];
    assign G_Z[13] = in1[8]  & in2[8];
    assign G_Z[14] = in1[7]  & in2[7];
    assign G_Z[15] = in1[6]  & in2[6];
    assign G_Z[16] = in1[5]  & in2[5];
    assign G_Z[17] = in1[4]  & in2[4];
    assign G_Z[18] = in1[3]  & in2[3];
    assign G_Z[19] = in1[2]  & in2[2];
    assign G_Z[20] = in1[1]  & in2[1];
    assign G_Z[21] = in1[0]  & in2[0];

    /*level 1*/
    assign G_A[0] = G_Z[0];
    /*gray_cell level_0A(1'b0, P_Z[0], G_Z[0], G_A[0]);*/
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

    /*level 2*/
    assign G_B[1] = G_A[1];
    /*gray_cell level_1B(1'b0,      P_A[1],  G_A[1],  G_B[1]);*/
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

    /*level 3*/
    assign G_C[3] = G_B[3];
    /*gray_cell level_3C(1'b0,      P_B[3],  G_B[3],  G_C[3]);*/
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

    /*level 4*/
    assign G_D[7] = G_C[7];
    /*gray_cell level_7D(1'b0,       P_C[7],   G_C[7],            G_D[7]);*/
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

    /*level 5*/
    assign G_E[15] = G_D[15];
    /*gray_cell level_FE(1'b0,       P_D[15],  G_D[15],           G_E[15]);*/
    gray_cell level_GE(G_A[0],    P_D[16],  G_D[16],           G_E[16]);
    gray_cell level_HE(G_B[1],    P_D[17],  G_D[17],           G_E[17]);
    gray_cell level_IE(G_B[2],    P_D[18],  G_D[18],           G_E[18]);
    gray_cell level_JE(G_C[3],    P_D[19],  G_D[19],           G_E[19]);
    gray_cell level_KE(G_C[4],    P_D[20],  G_D[20],           G_E[20]);
    gray_cell level_LE(G_C[5],    P_D[21],  G_D[21],           cout);

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
endmodule

module kogge_stone_23(sum, cout, in1, in2);
    input [22:0] in1, in2; 
    output [22:0] sum; 
    output cout; 
    wire [22:0] G_Z, P_Z, 
    G_A, P_A,
    G_B, P_B,
    G_C, P_C,
    G_D, P_D,
    G_E, P_E,
    G_F, P_F;

    assign P_Z[0]  = in1[22] ^ in2[22];
    assign P_Z[1]  = in1[21] ^ in2[21];
    assign P_Z[2]  = in1[20] ^ in2[20];
    assign P_Z[3]  = in1[19] ^ in2[19];
    assign P_Z[4]  = in1[18] ^ in2[18];
    assign P_Z[5]  = in1[17] ^ in2[17];
    assign P_Z[6]  = in1[16] ^ in2[16];
    assign P_Z[7]  = in1[15] ^ in2[15];
    assign P_Z[8]  = in1[14] ^ in2[14];
    assign P_Z[9]  = in1[13] ^ in2[13];
    assign P_Z[10] = in1[12] ^ in2[12];
    assign P_Z[11] = in1[11] ^ in2[11];
    assign P_Z[12] = in1[10] ^ in2[10];
    assign P_Z[13] = in1[9]  ^ in2[9];
    assign P_Z[14] = in1[8]  ^ in2[8];
    assign P_Z[15] = in1[7]  ^ in2[7];
    assign P_Z[16] = in1[6]  ^ in2[6];
    assign P_Z[17] = in1[5]  ^ in2[5];
    assign P_Z[18] = in1[4]  ^ in2[4];
    assign P_Z[19] = in1[3]  ^ in2[3];
    assign P_Z[20] = in1[2]  ^ in2[2];
    assign P_Z[21] = in1[1]  ^ in2[1];
    assign P_Z[22] = in1[0]  ^ in2[0];

    assign G_Z[0]  = in1[22] & in2[22];
    assign G_Z[1]  = in1[21] & in2[21];
    assign G_Z[2]  = in1[20] & in2[20];
    assign G_Z[3]  = in1[19] & in2[19];
    assign G_Z[4]  = in1[18] & in2[18];
    assign G_Z[5]  = in1[17] & in2[17];
    assign G_Z[6]  = in1[16] & in2[16];
    assign G_Z[7]  = in1[15] & in2[15];
    assign G_Z[8]  = in1[14] & in2[14];
    assign G_Z[9]  = in1[13] & in2[13];
    assign G_Z[10] = in1[12] & in2[12];
    assign G_Z[11] = in1[11] & in2[11];
    assign G_Z[12] = in1[10] & in2[10];
    assign G_Z[13] = in1[9]  & in2[9];
    assign G_Z[14] = in1[8]  & in2[8];
    assign G_Z[15] = in1[7]  & in2[7];
    assign G_Z[16] = in1[6]  & in2[6];
    assign G_Z[17] = in1[5]  & in2[5];
    assign G_Z[18] = in1[4]  & in2[4];
    assign G_Z[19] = in1[3]  & in2[3];
    assign G_Z[20] = in1[2]  & in2[2];
    assign G_Z[21] = in1[1]  & in2[1];
    assign G_Z[22] = in1[0]  & in2[0];

    /*level 1*/
    assign G_A[0] = G_Z[0];
    /*gray_cell level_0A(1'b0, P_Z[0], G_Z[0], G_A[0]);*/
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

    /*level 2*/
    assign G_B[1] = G_A[1];
    /*gray_cell level_1B(1'b0,      P_A[1],  G_A[1],  G_B[1]);*/
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

    /*level 3*/
    assign G_C[3] = G_B[3];
    /*gray_cell level_3C(1'b0,      P_B[3],  G_B[3],  G_C[3]);*/
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

    /*level 4*/
    assign G_D[7] = G_C[7];
    /*gray_cell level_7D(1'b0,       P_C[7],   G_C[7],            G_D[7]);*/
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

    /*level 5*/
    assign G_E[15] = G_D[15];
    /*gray_cell level_FE(1'b0,       P_D[15],  G_D[15],           G_E[15]);*/
    gray_cell level_GE(G_A[0],    P_D[16],  G_D[16],           G_E[16]);
    gray_cell level_HE(G_B[1],    P_D[17],  G_D[17],           G_E[17]);
    gray_cell level_IE(G_B[2],    P_D[18],  G_D[18],           G_E[18]);
    gray_cell level_JE(G_C[3],    P_D[19],  G_D[19],           G_E[19]);
    gray_cell level_KE(G_C[4],    P_D[20],  G_D[20],           G_E[20]);
    gray_cell level_LE(G_C[5],    P_D[21],  G_D[21],           G_E[21]);
    gray_cell level_ME(G_C[6],    P_D[22],  G_D[22],           cout);

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
endmodule

module kogge_stone_24(sum, cout, in1, in2);
    input [23:0] in1, in2; 
    output [23:0] sum; 
    output cout; 
    wire [23:0] G_Z, P_Z, 
    G_A, P_A,
    G_B, P_B,
    G_C, P_C,
    G_D, P_D,
    G_E, P_E,
    G_F, P_F;

    assign P_Z[0]  = in1[23] ^ in2[23];
    assign P_Z[1]  = in1[22] ^ in2[22];
    assign P_Z[2]  = in1[21] ^ in2[21];
    assign P_Z[3]  = in1[20] ^ in2[20];
    assign P_Z[4]  = in1[19] ^ in2[19];
    assign P_Z[5] = in1[18] ^ in2[18];
    assign P_Z[6] = in1[17] ^ in2[17];
    assign P_Z[7] = in1[16] ^ in2[16];
    assign P_Z[8] = in1[15] ^ in2[15];
    assign P_Z[9] = in1[14] ^ in2[14];
    assign P_Z[10] = in1[13] ^ in2[13];
    assign P_Z[11] = in1[12] ^ in2[12];
    assign P_Z[12] = in1[11] ^ in2[11];
    assign P_Z[13] = in1[10] ^ in2[10];
    assign P_Z[14] = in1[9]  ^ in2[9];
    assign P_Z[15] = in1[8]  ^ in2[8];
    assign P_Z[16] = in1[7]  ^ in2[7];
    assign P_Z[17] = in1[6]  ^ in2[6];
    assign P_Z[18] = in1[5]  ^ in2[5];
    assign P_Z[19] = in1[4]  ^ in2[4];
    assign P_Z[20] = in1[3]  ^ in2[3];
    assign P_Z[21] = in1[2]  ^ in2[2];
    assign P_Z[22] = in1[1]  ^ in2[1];
    assign P_Z[23] = in1[0]  ^ in2[0];

    assign G_Z[0]  = in1[23] & in2[23];
    assign G_Z[1]  = in1[22] & in2[22];
    assign G_Z[2]  = in1[21] & in2[21];
    assign G_Z[3]  = in1[20] & in2[20];
    assign G_Z[4]  = in1[19] & in2[19];
    assign G_Z[5] = in1[18] & in2[18];
    assign G_Z[6] = in1[17] & in2[17];
    assign G_Z[7] = in1[16] & in2[16];
    assign G_Z[8] = in1[15] & in2[15];
    assign G_Z[9] = in1[14] & in2[14];
    assign G_Z[10] = in1[13] & in2[13];
    assign G_Z[11] = in1[12] & in2[12];
    assign G_Z[12] = in1[11] & in2[11];
    assign G_Z[13] = in1[10] & in2[10];
    assign G_Z[14] = in1[9]  & in2[9];
    assign G_Z[15] = in1[8]  & in2[8];
    assign G_Z[16] = in1[7]  & in2[7];
    assign G_Z[17] = in1[6]  & in2[6];
    assign G_Z[18] = in1[5]  & in2[5];
    assign G_Z[19] = in1[4]  & in2[4];
    assign G_Z[20] = in1[3]  & in2[3];
    assign G_Z[21] = in1[2]  & in2[2];
    assign G_Z[22] = in1[1]  & in2[1];
    assign G_Z[23] = in1[0]  & in2[0];

    /*level 1*/
    assign G_A[0] = G_Z[0];
    /*gray_cell level_0A(1'b0, P_Z[0], G_Z[0], G_A[0]);*/
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

    /*level 2*/
    assign G_B[1] = G_A[1];
    /*gray_cell level_1B(1'b0,      P_A[1],  G_A[1],  G_B[1]);*/
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

    /*level 3*/
    assign G_C[3] = G_B[3];
    /*gray_cell level_3C(1'b0,      P_B[3],  G_B[3],  G_C[3]);*/
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

    /*level 4*/
    assign G_D[7] = G_C[7];
    /*gray_cell level_7D(1'b0,       P_C[7],   G_C[7],            G_D[7]);*/
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

    /*level 5*/
    assign G_E[15] = G_D[15];
    /*gray_cell level_FE(1'b0,       P_D[15],  G_D[15],           G_E[15]);*/
    gray_cell level_GE(G_A[0],    P_D[16],  G_D[16],           G_E[16]);
    gray_cell level_HE(G_B[1],    P_D[17],  G_D[17],           G_E[17]);
    gray_cell level_IE(G_B[2],    P_D[18],  G_D[18],           G_E[18]);
    gray_cell level_JE(G_C[3],    P_D[19],  G_D[19],           G_E[19]);
    gray_cell level_KE(G_C[4],    P_D[20],  G_D[20],           G_E[20]);
    gray_cell level_LE(G_C[5],    P_D[21],  G_D[21],           G_E[21]);
    gray_cell level_ME(G_C[6],    P_D[22],  G_D[22],           G_E[22]);
    gray_cell level_NE(G_D[7],    P_D[23],  G_D[23],           cout);

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
endmodule


module kogge_stone_25(sum, cout, in1, in2);
    input [24:0] in1, in2; 
    output [24:0] sum; 
    output cout; 
    wire [24:0] G_Z, P_Z, 
    G_A, P_A,
    G_B, P_B,
    G_C, P_C,
    G_D, P_D,
    G_E, P_E,
    G_F, P_F;

    assign P_Z[0]  = in1[24] ^ in2[24];
    assign P_Z[1]  = in1[23] ^ in2[23];
    assign P_Z[2]  = in1[22] ^ in2[22];
    assign P_Z[3]  = in1[21] ^ in2[21];
    assign P_Z[4]  = in1[20] ^ in2[20];
    assign P_Z[5]  = in1[19] ^ in2[19];
    assign P_Z[6] = in1[18] ^ in2[18];
    assign P_Z[7] = in1[17] ^ in2[17];
    assign P_Z[8] = in1[16] ^ in2[16];
    assign P_Z[9] = in1[15] ^ in2[15];
    assign P_Z[10] = in1[14] ^ in2[14];
    assign P_Z[11] = in1[13] ^ in2[13];
    assign P_Z[12] = in1[12] ^ in2[12];
    assign P_Z[13] = in1[11] ^ in2[11];
    assign P_Z[14] = in1[10] ^ in2[10];
    assign P_Z[15] = in1[9]  ^ in2[9];
    assign P_Z[16] = in1[8]  ^ in2[8];
    assign P_Z[17] = in1[7]  ^ in2[7];
    assign P_Z[18] = in1[6]  ^ in2[6];
    assign P_Z[19] = in1[5]  ^ in2[5];
    assign P_Z[20] = in1[4]  ^ in2[4];
    assign P_Z[21] = in1[3]  ^ in2[3];
    assign P_Z[22] = in1[2]  ^ in2[2];
    assign P_Z[23] = in1[1]  ^ in2[1];
    assign P_Z[24] = in1[0]  ^ in2[0];

    assign G_Z[0]  = in1[24] & in2[24];
    assign G_Z[1]  = in1[23] & in2[23];
    assign G_Z[2]  = in1[22] & in2[22];
    assign G_Z[3]  = in1[21] & in2[21];
    assign G_Z[4]  = in1[20] & in2[20];
    assign G_Z[5]  = in1[19] & in2[19];
    assign G_Z[6] = in1[18] & in2[18];
    assign G_Z[7] = in1[17] & in2[17];
    assign G_Z[8] = in1[16] & in2[16];
    assign G_Z[9] = in1[15] & in2[15];
    assign G_Z[10] = in1[14] & in2[14];
    assign G_Z[11] = in1[13] & in2[13];
    assign G_Z[12] = in1[12] & in2[12];
    assign G_Z[13] = in1[11] & in2[11];
    assign G_Z[14] = in1[10] & in2[10];
    assign G_Z[15] = in1[9]  & in2[9];
    assign G_Z[16] = in1[8]  & in2[8];
    assign G_Z[17] = in1[7]  & in2[7];
    assign G_Z[18] = in1[6]  & in2[6];
    assign G_Z[19] = in1[5]  & in2[5];
    assign G_Z[20] = in1[4]  & in2[4];
    assign G_Z[21] = in1[3]  & in2[3];
    assign G_Z[22] = in1[2]  & in2[2];
    assign G_Z[23] = in1[1]  & in2[1];
    assign G_Z[24] = in1[0]  & in2[0];

    /*level 1*/
    assign G_A[0] = G_Z[0];
    /*gray_cell level_0A(1'b0, P_Z[0], G_Z[0], G_A[0]);*/
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

    /*level 2*/
    assign G_B[1] = G_A[1];
    /*gray_cell level_1B(1'b0,      P_A[1],  G_A[1],  G_B[1]);*/
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

    /*level 3*/
    assign G_C[3] = G_B[3];
    /*gray_cell level_3C(1'b0,      P_B[3],  G_B[3],  G_C[3]);*/
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

    /*level 4*/
    assign G_D[7] = G_C[7];
    /*gray_cell level_7D(1'b0,       P_C[7],   G_C[7],            G_D[7]);*/
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

    /*level 5*/
    assign G_E[15] = G_D[15];
    /*gray_cell level_FE(1'b0,       P_D[15],  G_D[15],           G_E[15]);*/
    gray_cell level_GE(G_A[0],    P_D[16],  G_D[16],           G_E[16]);
    gray_cell level_HE(G_B[1],    P_D[17],  G_D[17],           G_E[17]);
    gray_cell level_IE(G_B[2],    P_D[18],  G_D[18],           G_E[18]);
    gray_cell level_JE(G_C[3],    P_D[19],  G_D[19],           G_E[19]);
    gray_cell level_KE(G_C[4],    P_D[20],  G_D[20],           G_E[20]);
    gray_cell level_LE(G_C[5],    P_D[21],  G_D[21],           G_E[21]);
    gray_cell level_ME(G_C[6],    P_D[22],  G_D[22],           G_E[22]);
    gray_cell level_NE(G_D[7],    P_D[23],  G_D[23],           G_E[23]);
    gray_cell level_OE(G_D[8],    P_D[24],  G_D[24],           cout);

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
endmodule

module kogge_stone_26(sum, cout, in1, in2);
    input [25:0] in1, in2; 
    output [25:0] sum; 
    output cout; 
    wire [25:0] G_Z, P_Z, 
    G_A, P_A,
    G_B, P_B,
    G_C, P_C,
    G_D, P_D,
    G_E, P_E,
    G_F, P_F;

    assign P_Z[0]  = in1[25] ^ in2[25];
    assign P_Z[1]  = in1[24] ^ in2[24];
    assign P_Z[2]  = in1[23] ^ in2[23];
    assign P_Z[3]  = in1[22] ^ in2[22];
    assign P_Z[4]  = in1[21] ^ in2[21];
    assign P_Z[5]  = in1[20] ^ in2[20];
    assign P_Z[6]  = in1[19] ^ in2[19];
    assign P_Z[7] = in1[18] ^ in2[18];
    assign P_Z[8] = in1[17] ^ in2[17];
    assign P_Z[9] = in1[16] ^ in2[16];
    assign P_Z[10] = in1[15] ^ in2[15];
    assign P_Z[11] = in1[14] ^ in2[14];
    assign P_Z[12] = in1[13] ^ in2[13];
    assign P_Z[13] = in1[12] ^ in2[12];
    assign P_Z[14] = in1[11] ^ in2[11];
    assign P_Z[15] = in1[10] ^ in2[10];
    assign P_Z[16] = in1[9]  ^ in2[9];
    assign P_Z[17] = in1[8]  ^ in2[8];
    assign P_Z[18] = in1[7]  ^ in2[7];
    assign P_Z[19] = in1[6]  ^ in2[6];
    assign P_Z[20] = in1[5]  ^ in2[5];
    assign P_Z[21] = in1[4]  ^ in2[4];
    assign P_Z[22] = in1[3]  ^ in2[3];
    assign P_Z[23] = in1[2]  ^ in2[2];
    assign P_Z[24] = in1[1]  ^ in2[1];
    assign P_Z[25] = in1[0]  ^ in2[0];

    assign G_Z[0]  = in1[25] & in2[25];
    assign G_Z[1]  = in1[24] & in2[24];
    assign G_Z[2]  = in1[23] & in2[23];
    assign G_Z[3]  = in1[22] & in2[22];
    assign G_Z[4]  = in1[21] & in2[21];
    assign G_Z[5]  = in1[20] & in2[20];
    assign G_Z[6]  = in1[19] & in2[19];
    assign G_Z[7] = in1[18] & in2[18];
    assign G_Z[8] = in1[17] & in2[17];
    assign G_Z[9] = in1[16] & in2[16];
    assign G_Z[10] = in1[15] & in2[15];
    assign G_Z[11] = in1[14] & in2[14];
    assign G_Z[12] = in1[13] & in2[13];
    assign G_Z[13] = in1[12] & in2[12];
    assign G_Z[14] = in1[11] & in2[11];
    assign G_Z[15] = in1[10] & in2[10];
    assign G_Z[16] = in1[9]  & in2[9];
    assign G_Z[17] = in1[8]  & in2[8];
    assign G_Z[18] = in1[7]  & in2[7];
    assign G_Z[19] = in1[6]  & in2[6];
    assign G_Z[20] = in1[5]  & in2[5];
    assign G_Z[21] = in1[4]  & in2[4];
    assign G_Z[22] = in1[3]  & in2[3];
    assign G_Z[23] = in1[2]  & in2[2];
    assign G_Z[24] = in1[1]  & in2[1];
    assign G_Z[25] = in1[0]  & in2[0];

    /*level 1*/
    assign G_A[0] = G_Z[0];
    /*gray_cell level_0A(1'b0, P_Z[0], G_Z[0], G_A[0]);*/
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

    /*level 2*/
    assign G_B[1] = G_A[1];
    /*gray_cell level_1B(1'b0,      P_A[1],  G_A[1],  G_B[1]);*/
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

    /*level 3*/
    assign G_C[3] = G_B[3];
    /*gray_cell level_3C(1'b0,      P_B[3],  G_B[3],  G_C[3]);*/
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

    /*level 4*/
    assign G_D[7] = G_C[7];
    /*gray_cell level_7D(1'b0,       P_C[7],   G_C[7],            G_D[7]);*/
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

    /*level 5*/
    assign G_E[15] = G_D[15];
    /*gray_cell level_FE(1'b0,       P_D[15],  G_D[15],           G_E[15]);*/
    gray_cell level_GE(G_A[0],    P_D[16],  G_D[16],           G_E[16]);
    gray_cell level_HE(G_B[1],    P_D[17],  G_D[17],           G_E[17]);
    gray_cell level_IE(G_B[2],    P_D[18],  G_D[18],           G_E[18]);
    gray_cell level_JE(G_C[3],    P_D[19],  G_D[19],           G_E[19]);
    gray_cell level_KE(G_C[4],    P_D[20],  G_D[20],           G_E[20]);
    gray_cell level_LE(G_C[5],    P_D[21],  G_D[21],           G_E[21]);
    gray_cell level_ME(G_C[6],    P_D[22],  G_D[22],           G_E[22]);
    gray_cell level_NE(G_D[7],    P_D[23],  G_D[23],           G_E[23]);
    gray_cell level_OE(G_D[8],    P_D[24],  G_D[24],           G_E[24]);
    gray_cell level_PE(G_D[9],    P_D[25],  G_D[25],           cout);

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
endmodule

module kogge_stone_27(sum, cout, in1, in2);
    input [26:0] in1, in2; 
    output [26:0] sum; 
    output cout; 
    wire [26:0] G_Z, P_Z, 
    G_A, P_A,
    G_B, P_B,
    G_C, P_C,
    G_D, P_D,
    G_E, P_E,
    G_F, P_F;
    
    assign P_Z[0]  = in1[26] ^ in2[26];
    assign P_Z[1]  = in1[25] ^ in2[25];
    assign P_Z[2]  = in1[24] ^ in2[24];
    assign P_Z[3]  = in1[23] ^ in2[23];
    assign P_Z[4]  = in1[22] ^ in2[22];
    assign P_Z[5]  = in1[21] ^ in2[21];
    assign P_Z[6]  = in1[20] ^ in2[20];
    assign P_Z[7]  = in1[19] ^ in2[19];
    assign P_Z[8] = in1[18] ^ in2[18];
    assign P_Z[9] = in1[17] ^ in2[17];
    assign P_Z[10] = in1[16] ^ in2[16];
    assign P_Z[11] = in1[15] ^ in2[15];
    assign P_Z[12] = in1[14] ^ in2[14];
    assign P_Z[13] = in1[13] ^ in2[13];
    assign P_Z[14] = in1[12] ^ in2[12];
    assign P_Z[15] = in1[11] ^ in2[11];
    assign P_Z[16] = in1[10] ^ in2[10];
    assign P_Z[17] = in1[9]  ^ in2[9];
    assign P_Z[18] = in1[8]  ^ in2[8];
    assign P_Z[19] = in1[7]  ^ in2[7];
    assign P_Z[20] = in1[6]  ^ in2[6];
    assign P_Z[21] = in1[5]  ^ in2[5];
    assign P_Z[22] = in1[4]  ^ in2[4];
    assign P_Z[23] = in1[3]  ^ in2[3];
    assign P_Z[24] = in1[2]  ^ in2[2];
    assign P_Z[25] = in1[1]  ^ in2[1];
    assign P_Z[26] = in1[0]  ^ in2[0];

    assign G_Z[0]  = in1[26] & in2[26];
    assign G_Z[1]  = in1[25] & in2[25];
    assign G_Z[2]  = in1[24] & in2[24];
    assign G_Z[3]  = in1[23] & in2[23];
    assign G_Z[4]  = in1[22] & in2[22];
    assign G_Z[5]  = in1[21] & in2[21];
    assign G_Z[6]  = in1[20] & in2[20];
    assign G_Z[7]  = in1[19] & in2[19];
    assign G_Z[8] = in1[18] & in2[18];
    assign G_Z[9] = in1[17] & in2[17];
    assign G_Z[10] = in1[16] & in2[16];
    assign G_Z[11] = in1[15] & in2[15];
    assign G_Z[12] = in1[14] & in2[14];
    assign G_Z[13] = in1[13] & in2[13];
    assign G_Z[14] = in1[12] & in2[12];
    assign G_Z[15] = in1[11] & in2[11];
    assign G_Z[16] = in1[10] & in2[10];
    assign G_Z[17] = in1[9]  & in2[9];
    assign G_Z[18] = in1[8]  & in2[8];
    assign G_Z[19] = in1[7]  & in2[7];
    assign G_Z[20] = in1[6]  & in2[6];
    assign G_Z[21] = in1[5]  & in2[5];
    assign G_Z[22] = in1[4]  & in2[4];
    assign G_Z[23] = in1[3]  & in2[3];
    assign G_Z[24] = in1[2]  & in2[2];
    assign G_Z[25] = in1[1]  & in2[1];
    assign G_Z[26] = in1[0]  & in2[0];

    /*level 1*/
    assign G_A[0] = G_Z[0];
    /*gray_cell level_0A(1'b0, P_Z[0], G_Z[0], G_A[0]);*/
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

    /*level 2*/
    assign G_B[1] = G_A[1];
    /*gray_cell level_1B(1'b0,      P_A[1],  G_A[1],  G_B[1]);*/
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

    /*level 3*/
    assign G_C[3] = G_B[3];
    /*gray_cell level_3C(1'b0,      P_B[3],  G_B[3],  G_C[3]);*/
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

    /*level 4*/
    assign G_D[7] = G_C[7];
    /*gray_cell level_7D(1'b0,       P_C[7],   G_C[7],            G_D[7]);*/
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

    /*level 5*/
    assign G_E[15] = G_D[15];
    /*gray_cell level_FE(1'b0,       P_D[15],  G_D[15],           G_E[15]);*/
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
    gray_cell level_QE(G_D[10],   P_D[26],  G_D[26],           cout);

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
endmodule


module kogge_stone_28(sum, cout, in1, in2);
    input [27:0] in1, in2; 
    output [27:0] sum; 
    output cout; 
    wire [27:0] G_Z, P_Z, 
    G_A, P_A,
    G_B, P_B,
    G_C, P_C,
    G_D, P_D,
    G_E, P_E,
    G_F, P_F;
    
    assign P_Z[0]  = in1[27] ^ in2[27];
    assign P_Z[1]  = in1[26] ^ in2[26];
    assign P_Z[2]  = in1[25] ^ in2[25];
    assign P_Z[3]  = in1[24] ^ in2[24];
    assign P_Z[4]  = in1[23] ^ in2[23];
    assign P_Z[5]  = in1[22] ^ in2[22];
    assign P_Z[6]  = in1[21] ^ in2[21];
    assign P_Z[7]  = in1[20] ^ in2[20];
    assign P_Z[8]  = in1[19] ^ in2[19];
    assign P_Z[9] = in1[18] ^ in2[18];
    assign P_Z[10] = in1[17] ^ in2[17];
    assign P_Z[11] = in1[16] ^ in2[16];
    assign P_Z[12] = in1[15] ^ in2[15];
    assign P_Z[13] = in1[14] ^ in2[14];
    assign P_Z[14] = in1[13] ^ in2[13];
    assign P_Z[15] = in1[12] ^ in2[12];
    assign P_Z[16] = in1[11] ^ in2[11];
    assign P_Z[17] = in1[10] ^ in2[10];
    assign P_Z[18] = in1[9]  ^ in2[9];
    assign P_Z[19] = in1[8]  ^ in2[8];
    assign P_Z[20] = in1[7]  ^ in2[7];
    assign P_Z[21] = in1[6]  ^ in2[6];
    assign P_Z[22] = in1[5]  ^ in2[5];
    assign P_Z[23] = in1[4]  ^ in2[4];
    assign P_Z[24] = in1[3]  ^ in2[3];
    assign P_Z[25] = in1[2]  ^ in2[2];
    assign P_Z[26] = in1[1]  ^ in2[1];
    assign P_Z[27] = in1[0]  ^ in2[0];

    assign G_Z[0]  = in1[27] & in2[27];
    assign G_Z[1]  = in1[26] & in2[26];
    assign G_Z[2]  = in1[25] & in2[25];
    assign G_Z[3]  = in1[24] & in2[24];
    assign G_Z[4]  = in1[23] & in2[23];
    assign G_Z[5]  = in1[22] & in2[22];
    assign G_Z[6]  = in1[21] & in2[21];
    assign G_Z[7]  = in1[20] & in2[20];
    assign G_Z[8]  = in1[19] & in2[19];
    assign G_Z[9] = in1[18] & in2[18];
    assign G_Z[10] = in1[17] & in2[17];
    assign G_Z[11] = in1[16] & in2[16];
    assign G_Z[12] = in1[15] & in2[15];
    assign G_Z[13] = in1[14] & in2[14];
    assign G_Z[14] = in1[13] & in2[13];
    assign G_Z[15] = in1[12] & in2[12];
    assign G_Z[16] = in1[11] & in2[11];
    assign G_Z[17] = in1[10] & in2[10];
    assign G_Z[18] = in1[9]  & in2[9];
    assign G_Z[19] = in1[8]  & in2[8];
    assign G_Z[20] = in1[7]  & in2[7];
    assign G_Z[21] = in1[6]  & in2[6];
    assign G_Z[22] = in1[5]  & in2[5];
    assign G_Z[23] = in1[4]  & in2[4];
    assign G_Z[24] = in1[3]  & in2[3];
    assign G_Z[25] = in1[2]  & in2[2];
    assign G_Z[26] = in1[1]  & in2[1];
    assign G_Z[27] = in1[0]  & in2[0];

    /*level 1*/
    assign G_A[0] = G_Z[0];
    /*gray_cell level_0A(1'b0, P_Z[0], G_Z[0], G_A[0]);*/
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

    /*level 2*/
    assign G_B[1] = G_A[1];
    /*gray_cell level_1B(1'b0,      P_A[1],  G_A[1],  G_B[1]);*/
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

    /*level 3*/
    assign G_C[3] = G_B[3];
    /*gray_cell level_3C(1'b0,      P_B[3],  G_B[3],  G_C[3]);*/
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

    /*level 4*/
    assign G_D[7] = G_C[7];
    /*gray_cell level_7D(1'b0,       P_C[7],   G_C[7],            G_D[7]);*/
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

    /*level 5*/
    assign G_E[15] = G_D[15];
    /*gray_cell level_FE(1'b0,       P_D[15],  G_D[15],           G_E[15]);*/
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
    gray_cell level_RE(G_D[11],   P_D[27],  G_D[27],           cout);

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
endmodule

module kogge_stone_29(sum, cout, in1, in2);
    input [28:0] in1, in2; 
    output [28:0] sum; 
    output cout; 
    wire [28:0] G_Z, P_Z, 
    G_A, P_A,
    G_B, P_B,
    G_C, P_C,
    G_D, P_D,
    G_E, P_E,
    G_F, P_F;

    assign P_Z[0]  = in1[28] ^ in2[28];
    assign P_Z[1]  = in1[27] ^ in2[27];
    assign P_Z[2]  = in1[26] ^ in2[26];
    assign P_Z[3]  = in1[25] ^ in2[25];
    assign P_Z[4]  = in1[24] ^ in2[24];
    assign P_Z[5]  = in1[23] ^ in2[23];
    assign P_Z[6]  = in1[22] ^ in2[22];
    assign P_Z[7]  = in1[21] ^ in2[21];
    assign P_Z[8]  = in1[20] ^ in2[20];
    assign P_Z[9]  = in1[19] ^ in2[19];
    assign P_Z[10] = in1[18] ^ in2[18];
    assign P_Z[11] = in1[17] ^ in2[17];
    assign P_Z[12] = in1[16] ^ in2[16];
    assign P_Z[13] = in1[15] ^ in2[15];
    assign P_Z[14] = in1[14] ^ in2[14];
    assign P_Z[15] = in1[13] ^ in2[13];
    assign P_Z[16] = in1[12] ^ in2[12];
    assign P_Z[17] = in1[11] ^ in2[11];
    assign P_Z[18] = in1[10] ^ in2[10];
    assign P_Z[19] = in1[9]  ^ in2[9];
    assign P_Z[20] = in1[8]  ^ in2[8];
    assign P_Z[21] = in1[7]  ^ in2[7];
    assign P_Z[22] = in1[6]  ^ in2[6];
    assign P_Z[23] = in1[5]  ^ in2[5];
    assign P_Z[24] = in1[4]  ^ in2[4];
    assign P_Z[25] = in1[3]  ^ in2[3];
    assign P_Z[26] = in1[2]  ^ in2[2];
    assign P_Z[27] = in1[1]  ^ in2[1];
    assign P_Z[28] = in1[0]  ^ in2[0];

    assign G_Z[0]  = in1[28] & in2[28];
    assign G_Z[1]  = in1[27] & in2[27];
    assign G_Z[2]  = in1[26] & in2[26];
    assign G_Z[3]  = in1[25] & in2[25];
    assign G_Z[4]  = in1[24] & in2[24];
    assign G_Z[5]  = in1[23] & in2[23];
    assign G_Z[6]  = in1[22] & in2[22];
    assign G_Z[7]  = in1[21] & in2[21];
    assign G_Z[8]  = in1[20] & in2[20];
    assign G_Z[9]  = in1[19] & in2[19];
    assign G_Z[10] = in1[18] & in2[18];
    assign G_Z[11] = in1[17] & in2[17];
    assign G_Z[12] = in1[16] & in2[16];
    assign G_Z[13] = in1[15] & in2[15];
    assign G_Z[14] = in1[14] & in2[14];
    assign G_Z[15] = in1[13] & in2[13];
    assign G_Z[16] = in1[12] & in2[12];
    assign G_Z[17] = in1[11] & in2[11];
    assign G_Z[18] = in1[10] & in2[10];
    assign G_Z[19] = in1[9]  & in2[9];
    assign G_Z[20] = in1[8]  & in2[8];
    assign G_Z[21] = in1[7]  & in2[7];
    assign G_Z[22] = in1[6]  & in2[6];
    assign G_Z[23] = in1[5]  & in2[5];
    assign G_Z[24] = in1[4]  & in2[4];
    assign G_Z[25] = in1[3]  & in2[3];
    assign G_Z[26] = in1[2]  & in2[2];
    assign G_Z[27] = in1[1]  & in2[1];
    assign G_Z[28] = in1[0]  & in2[0];

    /*level 1*/
    assign G_A[0] = G_Z[0];
    /*gray_cell level_0A(1'b0, P_Z[0], G_Z[0], G_A[0]);*/
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

    /*level 2*/
    assign G_B[1] = G_A[1];
    /*gray_cell level_1B(1'b0,      P_A[1],  G_A[1],  G_B[1]);*/
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

    /*level 3*/
    assign G_C[3] = G_B[3];
    /*gray_cell level_3C(1'b0,      P_B[3],  G_B[3],  G_C[3]);*/
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

    /*level 4*/
    assign G_D[7] = G_C[7];
    /*gray_cell level_7D(1'b0,       P_C[7],   G_C[7],            G_D[7]);*/
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

    /*level 5*/
    assign G_E[15] = G_D[15];
    /*gray_cell level_FE(1'b0,       P_D[15],  G_D[15],           G_E[15]);*/
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
    gray_cell level_SE(G_D[12],   P_D[28],  G_D[28],           cout);

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

module kogge_stone_13(sum, cout, in1, in2);
    input [12:0] in1, in2; 
    output [12:0] sum; 
    output cout; 
    wire [12:0] G_Z, P_Z, 
    G_A, P_A,
    G_B, P_B,
    G_C, P_C,
    G_D, P_D;

    assign P_Z[0]  = in1[12] ^ in2[12];
    assign P_Z[1]  = in1[11] ^ in2[11];
    assign P_Z[2]  = in1[10] ^ in2[10];
    assign P_Z[3]  = in1[9]  ^ in2[9];
    assign P_Z[4]  = in1[8]  ^ in2[8];
    assign P_Z[5]  = in1[7]  ^ in2[7];
    assign P_Z[6]  = in1[6]  ^ in2[6];
    assign P_Z[7]  = in1[5]  ^ in2[5];
    assign P_Z[8]  = in1[4]  ^ in2[4];
    assign P_Z[9]  = in1[3]  ^ in2[3];
    assign P_Z[10] = in1[2]  ^ in2[2];
    assign P_Z[11] = in1[1]  ^ in2[1];
    assign P_Z[12] = in1[0]  ^ in2[0];    

    assign G_Z[0]  = in1[12] & in2[12];
    assign G_Z[1]  = in1[11] & in2[11];
    assign G_Z[2]  = in1[10] & in2[10];
    assign G_Z[3]  = in1[9]  & in2[9];
    assign G_Z[4]  = in1[8]  & in2[8];
    assign G_Z[5]  = in1[7]  & in2[7];
    assign G_Z[6]  = in1[6]  & in2[6];
    assign G_Z[7]  = in1[5]  & in2[5];
    assign G_Z[8]  = in1[4]  & in2[4];
    assign G_Z[9]  = in1[3]  & in2[3];
    assign G_Z[10] = in1[2]  & in2[2];
    assign G_Z[11] = in1[1]  & in2[1];
    assign G_Z[12] = in1[0]  & in2[0];

    /*level 1*/
    assign G_A[0] = G_Z[0];
    /*gray_cell level_0A(1'b0, P_Z[0], G_Z[0], G_A[0]);*/
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

    /*level 2*/
    assign G_B[1] = G_A[1];
    /*gray_cell level_1B(1'b0,      P_A[1],  G_A[1],  G_B[1]);*/
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

    /*level 3*/
    assign G_C[3] = G_B[3];
    /*gray_cell level_3C(1'b0,      P_B[3],  G_B[3],  G_C[3]);*/
    gray_cell level_4C(G_A[0],   P_B[4],  G_B[4],  G_C[4]);
    gray_cell level_5C(G_B[1],   P_B[5],  G_B[5],  G_C[5]);
    gray_cell level_6C(G_B[2],   P_B[6],  G_B[6],  G_C[6]);
    black_cell level_7C(G_B[3],  P_B[7],  G_B[7],  P_B[3],  G_C[7],  P_C[7]);
    black_cell level_8C(G_B[4],  P_B[8],  G_B[8],  P_B[4],  G_C[8],  P_C[8]);
    black_cell level_9C(G_B[5],  P_B[9],  G_B[9],  P_B[5],  G_C[9],  P_C[9]);
    black_cell level_AC(G_B[6],  P_B[10], G_B[10], P_B[6],  G_C[10], P_C[10]);
    black_cell level_BC(G_B[7],  P_B[11], G_B[11], P_B[7],  G_C[11], P_C[11]);
    black_cell level_CC(G_B[8],  P_B[12], G_B[12], P_B[8],  G_C[12], P_C[12]);

    /*level 4*/
    assign G_D[7] = G_C[7];
    /*gray_cell level_7D(1'b0,     P_C[7],   G_C[7],           G_D[7]);*/
    gray_cell level_8D(G_A[0],   P_C[8],   G_C[8],           G_D[8]);
    gray_cell level_9D(G_B[1],   P_C[9],   G_C[9],           G_D[9]);
    gray_cell level_AD(G_B[2],   P_C[10],  G_C[10],          G_D[10]);
    gray_cell level_BD(G_C[3],   P_C[11],  G_C[11],          G_D[11]);
    gray_cell level_CD(G_C[4],   P_C[12],  G_C[12],          cout);

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
