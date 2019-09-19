module multiplier_8bits_version10(product, A, B);

    /* This approach tries to use the longest kogge-stone adder as much as
     * possible using the dadda approach of minimum reduction in each step.
     * Area: 1885.178045
     * Power: 0.8216mW
     * Timing: 1.20ns
     */

    output [15:0] product;
    input [7:0] A, B;

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

    /* Stage 1*/
    wire[7:0] s1, in1_1, in1_2;
    wire c1;
    assign in1_1 = {pp0[4], pp0[5], pp0[6], pp0[7], pp1[7], pp2[7], pp3[7], pp4[7]};
    assign in1_2 = {pp1[3], pp1[4], pp1[5], pp1[6], pp2[6], pp3[6], pp4[6], pp5[6]};
    kogge_stone_8 KS_1(s1, c1, in1_1, in1_2);

    wire[5:0] s2, in2_1, in2_2;
    wire c2;
    assign in2_1 = {pp2[3], pp2[4], pp2[5], pp3[5], pp4[5], pp5[5]};
    assign in2_2 = {pp3[2], pp3[3], pp3[4], pp4[4], pp5[4], pp6[4]};
    kogge_stone_6 KS_2(s2, c2, in2_1, in2_2);

    wire[3:0] s3, in3_1, in3_2;
    wire c3;
    assign in3_1 = {pp4[2], pp4[3], pp5[3], pp6[3]};
    assign in3_2 = {pp5[1], pp5[2], pp6[2], pp7[2]};
    kogge_stone_4 KS_3(s3, c3, in3_1, in3_2);

    wire[1:0] s4, in4_1, in4_2;
    wire c4;
    assign in4_1 = {pp6[1], 1'b0};
    assign in4_2 = {pp7[0], pp7[1]};
    kogge_stone_2 KS_4(s4, c4, in4_1, in4_2);

    /* Stage 2*/
    wire[11:0] s5, in5_1, in5_2;
    wire c5;
    assign in5_1 = {pp0[2], pp0[3], pp2[2], pp4[1], pp6[0], s1[3], s1[4], s1[5], pp7[3], pp7[4], pp7[5], pp6[7]};
    assign in5_2 = {pp1[1], pp1[2], pp3[1], pp5[0], s1[2],  s2[2], s2[3], s2[4], s1[6],  pp6[5], pp6[6], pp7[6]};
    kogge_stone_12 KS_5(s5, c5, in5_1, in5_2);

    wire[9:0] s6, in6_1, in6_2;
    wire c6;
    assign in6_1 = {pp2[1], pp4[0], s1[1], s2[1], s3[1], s3[2], s3[3], s2[5], s1[7], pp5[7]};
    assign in6_2 = {pp3[0], s1[0],  s2[0], s3[0], s4[0], s4[1], c4,    c3,    c2,    c1};
    kogge_stone_10 KS_6(s6, c6, in6_1, in6_2);
    
    /* Final Stage */
    wire[13:0] s, in_1, in_2;
    wire c;
    assign in_1 = {pp0[1], pp2[0], s5[1], s5[2], s5[3], s5[4], s5[5], s5[6], s5[7], s5[8], s5[9], s5[10], s5[11], pp7[7]};
    assign in_2 = {pp1[0], s5[0], s6[0],  s6[1], s6[2], s6[3], s6[4], s6[5], s6[6], s6[7], s6[8], s6[9],  c6,     c5};
    kogge_stone_14 KS(s, c, in_1, in_2);

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
