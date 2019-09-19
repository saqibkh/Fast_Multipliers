module multiplier_4bits_version10(product, A, B);

    /* This approach tries to use the longest kogge-stone adder as much as
     * possible using the dadda approach of minimum reduction in each step.
     * Area: 324.286290
     * Power: 0.1007mW
     * Timing: 0.67ns
     */

    output [7:0] product;
    input [3:0] A, B;

    wire [3:0] pp0;
    wire [3:0] pp1;
    wire [3:0] pp2;
    wire [3:0] pp3;


    assign pp0 = A[0] ? B: 4'b0000;
    assign pp1 = A[1] ? B: 4'b0000;
    assign pp2 = A[2] ? B: 4'b0000;
    assign pp3 = A[3] ? B: 4'b0000;


    /*Stage 1*/
    wire[3:0] s1, in1_1, in1_2;
    wire c1;
    assign in1_1 = {pp0[2],pp0[3],pp1[3], pp2[3]};
    assign in1_2 = {pp1[1],pp1[2],pp2[2], pp3[2]};
    kogge_stone_4 KS_1(s1, c1, in1_1, in1_2);

    wire[1:0] s2, in2_1, in2_2;
    assign in2_1 = {pp2[1], pp3[1]};
    assign in2_2 = {pp3[0], 1'b0};
    kogge_stone_2 KS_2(s2, c2, in2_1, in2_2);

    /*Final Stage */
    wire[5:0] s, in_1, in_2;
    wire c;
    assign in_1 = {pp0[1],pp2[0],s1[1],s1[2], s1[3],pp3[3]};
    assign in_2 = {pp1[0],s1[0], s2[0],s2[1], c2,   c1};
    kogge_stone_6 KS(s, c, in_1, in_2);

    assign product[0] = pp0[0];
    assign product[1] = s[0];
    assign product[2] = s[1];
    assign product[3] = s[2];
    assign product[4] = s[3];
    assign product[5] = s[4];
    assign product[6] = s[5];
    assign product[7] = c;
endmodule

module multiplier_4bits_version10_attempt1(product, A, B);

    /* This approach tries to use the longest kogge-stone adder as much as
     * possible using the dadda approach of minimum reduction in each step.
     * Area: 283.926491
     * Power: 0.1013mW
     * Timing: 0.69ns
     */

    output [7:0] product;
    input [3:0] A, B;

    wire [3:0] pp0;
    wire [3:0] pp1;
    wire [3:0] pp2;
    wire [3:0] pp3;


    assign pp0 = A[0] ? B: 4'b0000;
    assign pp1 = A[1] ? B: 4'b0000;
    assign pp2 = A[2] ? B: 4'b0000;
    assign pp3 = A[3] ? B: 4'b0000;


    /*Stage 1*/
    wire[2:0] s0, in0_1, in0_2;
    wire c0;
    assign in0_1 = {pp0[2],pp0[3],pp1[3]};
    assign in0_2 = {pp1[1],pp1[2],pp2[2]};
    kogge_stone_3 KS_0(s0, c0, in0_1, in0_2);

    /*Stage 2*/
    half_adder HA1(s1, c1, pp2[1], pp3[0]);

    /*Stage 3*/
    wire[1:0] s2, in2_1, in2_2;
    wire c2;
    assign in2_1 = {pp3[1],pp2[3]};
    assign in2_2 = {s0[2],pp3[2]};
    kogge_stone_2 KS_2(s2, c2, in2_1, in2_2);


    wire[5:0] s, in_1, in_2;
    wire c;
    assign in_1 = {pp0[1],pp2[0],s0[1],c1,c0,pp3[3]};
    assign in_2 = {pp1[0],s0[0],s1,s2[0],s2[1],c2};
    kogge_stone_6 KS(s, c, in_1, in_2);

    assign product[0] = pp0[0];
    assign product[1] = s[0];
    assign product[2] = s[1];
    assign product[3] = s[2];
    assign product[4] = s[3];
    assign product[5] = s[4];
    assign product[6] = s[5];
    assign product[7] = c;
endmodule


module CLA2(sum, cout, in1, in2);
    input [1:0] in1, in2; //input
    output [1:0] sum; //output
    output cout; //carry-out

    wire [1:0] G; /* Generate */
    wire [1:0] P; /* Propagate */
    wire [1:0] C; /* Carry */

    assign G[0] = in1[1] & in2[1]; /*Generate    Gi = Ai * Bi */
    assign G[1] = in1[0] & in2[0];

    assign P[0] = in1[1] ^ in2[1];
    assign P[1] = in1[0] ^ in2[0];

    assign C[0] = 0;
    assign C[1] = G[0] | (P[0] & C[0]);
    assign cout = G[1] | (P[1] & C[1]);
    assign sum = P ^ C;
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
