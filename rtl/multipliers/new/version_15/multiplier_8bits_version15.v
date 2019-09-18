module multiplier_8bits_version15(product, A, B);

    output [15:0] product;
    input [7:0] A, B;

    /*
     * Area: 1639.734152 
     * Power: 0.7782mW
     * Timing: 1.25ns
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
    wire[3:0] s1, in1_1, in1_2;
    wire c1;
    assign in1_1 = {pp0[5],pp0[6],pp0[7],pp1[7]};
    assign in1_2 = {pp1[4],pp1[5],pp1[6],pp2[6]};
    Kogge_stone_4 KS_1(s1, c1, in1_1, in1_2);
    wire[3:0] s2, in2_1, in2_2;
    wire c2;
    assign in2_1 = {pp2[4],pp2[5],pp3[5],pp2[7]};
    assign in2_2 = {pp3[3],pp3[4],pp4[4],pp3[6]};
    Kogge_stone_4 KS_2(s2, c2, in2_1, in2_2);
    wire[3:0] s3, in3_1, in3_2;
    wire c3;
    assign in3_1 = {pp4[3],pp5[3],pp4[5],pp3[7]};
    assign in3_2 = {pp5[2],pp6[2],pp5[4],pp4[6]};
    Kogge_stone_4 KS_3(s3, c3, in3_1, in3_2);

    /*Stage 2*/
    wire[3:0] s4, in4_1, in4_2;
    wire c4;
    assign in4_1 = {pp0[3],pp0[4],pp2[3],pp4[2]};
    assign in4_2 = {pp1[2],pp1[3],pp3[2],pp5[1]};
    Kogge_stone_4 KS_4(s4, c4, in4_1, in4_2);
    wire[3:0] s5, in5_1, in5_2;
    wire c5;
    assign in5_1 = {pp2[2],pp4[1],pp6[0],pp6[1]};
    assign in5_2 = {pp3[1],pp5[0],s1[1],pp7[0]};
    Kogge_stone_4 KS_5(s5, c5, in5_1, in5_2);
    wire[3:0] s6, in6_1, in6_2;
    wire c6;
    assign in6_1 = {s2[1],pp7[1],pp6[3],pp5[5]};
    assign in6_2 = {s3[0],1'b0,pp7[2],pp6[4]};
    Kogge_stone_4_c KS_6(s6, c6, in6_1, in6_2, s1[2]);
    wire[3:0] s7, in7_1, in7_2;
    wire c7;
    assign in7_1 = {s2[2],c1,pp7[3],pp4[7]};
    assign in7_2 = {s3[1],s2[3],c2,pp5[6]};
    Kogge_stone_4_c KS_7(s7, c7, in7_1, in7_2, s1[3]);
    wire[1:0] s8, in8_1, in8_2;
    wire c8;
    assign in8_1 = {pp7[4],pp5[7]};
    assign in8_2 = {c3,pp6[6]};
    Kogge_stone_2_c KS_8(s8, c8, in8_1, in8_2, pp6[5]);

    /*Stage 3*/
    wire[3:0] s9, in9_1, in9_2;
    wire c9;
    assign in9_1 = {pp0[2],pp2[1],pp4[0],s1[0]};
    assign in9_2 = {pp1[1],pp3[0],s4[1],s4[2]};
    Kogge_stone_4 KS_9(s9, c9, in9_1, in9_2);
    wire[3:0] s10, in10_1, in10_2;
    wire c10;
    assign in10_1 = {s4[3],c4,c5,s3[2]};
    assign in10_2 = {s5[2],s5[3],s6[1],s6[2]};
    Kogge_stone_4_c KS_10(s10, c10, in10_1, in10_2, s2[0]);
    wire[3:0] s11, in11_1, in11_2;
    wire c11;
    assign in11_1 = {s6[3],c6,pp7[5],pp6[7]};
    assign in11_2 = {s7[2],s7[3],c7,pp7[6]};
    Kogge_stone_4_c KS_11(s11, c11, in11_1, in11_2, s3[3]);


    /*Final Stage 3*/
    wire[13:0] s, in_1, in_2;
    wire c;
    assign in_1 = {pp0[1],pp2[0],s4[0],s5[0],s5[1],c9,s6[0],s7[0],s7[1],c10,s8[0],s8[1],c8,pp7[7]};
    assign in_2 = {pp1[0],s9[0],s9[1],s9[2],s9[3],s10[0],s10[1],s10[2],s10[3],s11[0],s11[1],s11[2],s11[3],c11};
    Kogge_stone_14(s, c, in_1, in_2);

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

module Kogge_stone_2(sum, cout, in1, in2);
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

module Kogge_stone_3(sum, cout, in1, in2);
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

module Kogge_stone_4(sum, cout, in1, in2);
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


module Kogge_stone_2_c(sum, cout, in1, in2, cin);
    input [1:0] in1, in2; //input
	input cin;
    output [1:0] sum; //output
    output cout; //carry-out
    wire [1:0] G_Z, P_Z, //wires
    G_A, P_A,
    G_B, P_B;

    assign P_Z[0] = in1[1] ^ in2[1];
    assign P_Z[1] = in1[0] ^ in2[0];
    assign G_Z[0] = in1[1] & in2[1];
    assign G_Z[1] = in1[0] & in2[0];

    gray_cell level_0A(cin, P_Z[0], G_Z[0], G_A[0]);
    black_cell level_1A(G_Z[0], P_Z[1], G_Z[1], P_Z[0], G_A[1], P_A[1]);

    gray_cell level_1B(cin, P_A[1], G_A[1], cout);

    assign sum[0] = cin    ^ P_Z[0];
    assign sum[1] = G_A[0] ^ P_Z[1];
endmodule

module Kogge_stone_3_c(sum, cout, in1, in2, cin);
    input [2:0] in1, in2;
	input cin;
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

    gray_cell level_0A(cin, P_Z[0], G_Z[0], G_A[0]);
    black_cell level_1A(G_Z[0], P_Z[1], G_Z[1], P_Z[0], G_A[1], P_A[1]);
    black_cell level_2A(G_Z[1], P_Z[2], G_Z[2], P_Z[1], G_A[2], P_A[2]);

    gray_cell level_1B(cin, P_A[1], G_A[1], G_B[1]);
    gray_cell level_2B(G_A[0], P_A[2], G_A[2], cout);

    assign sum[0] = cin    ^ P_Z[0];
    assign sum[1] = G_A[0] ^ P_Z[1];
    assign sum[2] = G_B[1] ^ P_Z[2];
endmodule

module Kogge_stone_4_c(sum, cout, in1, in2, cin);
    input [3:0] in1, in2; //input
    output [3:0] sum; //output
    input cin; //carry-in
    output cout; //carry-out
    wire [3:0] G_Z, P_Z, //wires
    G_A, P_A,
    G_B, P_B,
    G_C, P_C;

    assign P_Z[0] = in1[3] ^ in2[3];
    assign P_Z[1] = in1[2] ^ in2[2];
    assign P_Z[2] = in1[1] ^ in2[1];
    assign P_Z[3] = in1[0] ^ in2[0];
    assign G_Z[0] = in1[3] & in2[3];
    assign G_Z[1] = in1[2] & in2[2];
    assign G_Z[2] = in1[1] & in2[1];
    assign G_Z[3] = in1[0] & in2[0];

    gray_cell level_0A(cin, P_Z[0], G_Z[0], G_A[0]);
    black_cell level_1A(G_Z[0], P_Z[1], G_Z[1], P_Z[0], G_A[1], P_A[1]);
    black_cell level_2A(G_Z[1], P_Z[2], G_Z[2], P_Z[1], G_A[2], P_A[2]);
    black_cell level_3A(G_Z[2], P_Z[3], G_Z[3], P_Z[2], G_A[3], P_A[3]);

    gray_cell level_1B(cin, P_A[1], G_A[1], G_B[1]);
    gray_cell level_2B(G_A[0], P_A[2], G_A[2], G_B[2]);
    black_cell level_3B(G_A[1], P_A[3], G_A[3], P_A[1], G_B[3], P_B[3]);

    gray_cell level_3C(cin, P_B[3], G_B[3], cout);

    assign sum[0] = cin    ^ P_Z[0];
    assign sum[1] = G_A[0] ^ P_Z[1];
    assign sum[2] = G_B[1] ^ P_Z[2];
    assign sum[3] = G_B[2] ^ P_Z[3];
endmodule


module Kogge_stone_14(sum, cout, in1, in2);
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
