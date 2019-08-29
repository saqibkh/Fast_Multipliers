module multiplier_4bits_version9(product, A, B);

    /* This approach uses long kogge-stone adder and FAs
     * Area: 301.290591 
     * Power: 7.1289e-02mW
     * Timing: 0.73ns
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

    full_adder HA1(s1, c1, pp2[1], pp3[0], s0[1]);

    full_adder HA2(s2, c2, pp2[3], pp3[2], c0);

    /*Stage 3*/

    full_adder HA3(s3, c3, pp3[1], s0[2], c1);


    wire[5:0] s, in_1, in_2;
    wire c;
    assign in_1 = {pp0[1],pp2[0],s1,s3,s2,pp3[3]};
    assign in_2 = {pp1[0],s0[0],1'b0,1'b0,c3,c2};
    kogge_stone_6(s, c, in_1, in_2);

    assign product[0] = pp0[0];
    assign product[1] = s[0];
    assign product[2] = s[1];
    assign product[3] = s[2];
    assign product[4] = s[3];
    assign product[5] = s[4];
    assign product[6] = s[5];
    assign product[7] = c;
endmodule

module multiplier_4bits_version9_HA(product, A, B);

    /* This approach uses long kogge-stone adder and HAs
     * Area: 284.395791
     * Power: 9.9972e-02mW
     * Timing: 0.64ns
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

    half_adder HA2(s2, c2, pp2[3], pp3[2]);

    /*Stage 3*/

    half_adder HA3(s3, c3, pp3[1], s0[2]);

    /*Stage 4*/

    half_adder HA4(s4, c4, c0, s2);

    /*Stage 5*/

    half_adder HA5(s5, c5, pp3[3], c2);


    wire[5:0] s, in_1, in_2;
    wire c;
    assign in_1 = {pp0[1],pp2[0],s0[1],c1,c3,c4};
    assign in_2 = {pp1[0],s0[0],s1,s3,s4,s5};
    kogge_stone_6(s, c, in_1, in_2);

    assign product[0] = pp0[0];
    assign product[1] = s[0];
    assign product[2] = s[1];
    assign product[3] = s[2];
    assign product[4] = s[3];
    assign product[5] = s[4];
    assign product[6] = s[5];
    assign product[7] = c;
endmodule

module multiplier_4bits_version9_version4(product, A, B);

    /*
     * Area: 365.584689
     * Power: 0.1226mW
     * Timing: 0.86ns
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
    wire[3:0] s0, in0_1, in0_2;
    wire c0;
    assign in0_1 = {pp0[2],pp0[3],pp1[3],pp2[3]};
    assign in0_2 = {pp1[1],pp1[2],pp2[2],pp3[2]};
    kogge_stone_4 KS_0(s0, c0, in0_1, in0_2);

    half_adder HA1(s1, c1, pp2[1], pp3[0]);

    /*Stage 2*/
    wire[2:0] s2, in2_1, in2_2;
    wire c2;
    assign in2_1 = {pp2[0],s0[1],pp3[1]};
    assign in2_2 = {s0[0],s1,s0[2]};
    kogge_stone_3 KS_2(s2, c2, in2_1, in2_2);

    half_adder HA3(s3, c3, pp3[3], c0);


    wire[5:0] s, in_1, in_2;
    wire c;
    assign in_1 = {pp0[1],s2[0],s2[1],c1,s0[3],s3};
    assign in_2 = {pp1[0],1'b0,1'b0,s2[2],c2,1'b0};
    kogge_stone_6(s, c, in_1, in_2);

    assign product[0] = pp0[0];
    assign product[1] = s[0];
    assign product[2] = s[1];
    assign product[3] = s[2];
    assign product[4] = s[3];
    assign product[5] = s[4];
    assign product[6] = s[5];
    assign product[7] = c;
endmodule

module multiplier_4bits_version9_version3(product, A, B);

    /* This approach tries to use the longest kogge-stone adder as much as
     * possible.
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


module multiplier_4bits_version9_attemp2(product, A, B);
    /* Area: 284.395791
     * Power: 0.1003mW
     * Timing: 0.71ns
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
    assign in0_1 = {pp2[0],pp3[0],pp3[1]};
    assign in0_2 = {pp1[1],pp2[1],pp2[2]};
    kogge_stone_3 KS_0(s0, c0, in0_1, in0_2);

    /*Stage 2*/
    half_adder HA1(s1, c1, pp1[2], pp0[3]);

    /*Stage 3*/
    wire[1:0] s2, in2_1, in2_2;
    wire c2;
    assign in2_1 = {s0[2],pp3[2]};
    assign in2_2 = {pp1[3],pp2[3]};
    kogge_stone_2 KS_2(s2, c2, in2_1, in2_2);


    wire[5:0] s, in_1, in_2;
    wire c;
    assign in_1 = {pp1[0],s0[0], s1,   c1,   c0,   pp3[3]};
    assign in_2 = {pp0[1],pp0[2],s0[1],s2[0],s2[1],c2};
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

module multiplier_4bits_version9_version2(product, A, B);

    /* Area: 315.838891
     * Power: 0.1057mW
     * Timing: 0.79ns
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
    wire[3:0] s0, in0_1, in0_2;
    wire c0;
    assign in0_1 = {pp2[0],pp3[0],pp3[1],pp3[2]};
    assign in0_2 = {pp1[1],pp2[1],pp2[2],pp2[3]};
    kogge_stone_4 KS_0(s0, c0, in0_1, in0_2);

    /*Stage 2*/
    wire[1:0] s1, in1_1, in1_2;
    wire c1;
    assign in1_1 = {pp1[2],s0[2]};
    assign in1_2 = {pp0[3],pp1[3]};
    kogge_stone_2 KS_1(s1, c1, in1_1, in1_2);


    wire[5:0] s, in_1, in_2;
    wire c;
    assign in_1 = {pp1[0],s0[0],s0[1],s1[1],s0[3],pp3[3]};
    assign in_2 = {pp0[1],pp0[2],s1[0],1'b0,c1,c0};
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

module multiplier_4bits_version9_version1(product, A, B);

    /* This uses long kogge-stone adder for partial product reduction and
     * then uses kogge-stone adder for final stage too.
     * Area: 253.891292
     * Power: 8.4648e-02mW
     * Timing: 0.57ns
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

    assign product[0] = pp0[0];

    wire[2:0] s1, in1_1, in1_2;
    wire c1;
    assign in1_1 = {pp0[2], pp0[3], pp1[3]};
    assign in1_2 = {pp1[1], pp1[2], pp2[2]};
    kogge_stone_3 KS01(s1, c1, in1_1, in1_2);

    half_adder(s2, c2, pp2[3], pp3[2]);
    wire[5:0] s, in_1, in_2;
    wire c;
    assign in_1 = {pp0[1], pp2[0], pp2[1], pp3[1], s2, pp3[4]};
    assign in_2 = {pp1[0], s1[0],  s1[1],  s1[2],  c1, c2};
    kogge_stone_6 KS(s, in_1, in_2);
    assign product[1] = s[0];
    assign product[2] = s[1];
    assign product[3] = s[2];
    assign product[4] = s[3];
    assign product[5] = s[4];
    assign product[6] = s[5];
    assign product[7] = s[6];
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
    //gray_cell level_0A(cin, P_Z[0], G_Z[0], G_A[0]);
    black_cell level_1A(G_Z[0],  P_Z[1],  G_Z[1],  P_Z[0],  G_A[1],  P_A[1]);

    /*level 2*/
    assign cout = G_A[1];

    /*outputs*/
    assign sum[0]  =           P_Z[0];
    assign sum[1]  = G_A[0]  ^ P_Z[1];
endmodule

module kogge_stone_3(sum, cout, in1, in2);
    input [2:0] in1, in2; //input
    output [2:0] sum; //output
    output cout; //carry-out
    wire [2:0] G_Z, P_Z, //wires
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
    //gray_cell level_0A(1'b0, P_Z[0], G_Z[0], G_A[0]);
    black_cell level_1A(G_Z[0],  P_Z[1],  G_Z[1],  P_Z[0],  G_A[1],  P_A[1]);
    black_cell level_2A(G_Z[1],  P_Z[2],  G_Z[2],  P_Z[1],  G_A[2],  P_A[2]);
    black_cell level_3A(G_Z[2],  P_Z[3],  G_Z[3],  P_Z[2],  G_A[3],  P_A[3]);

    /*level 2*/
    assign G_B[1] = G_A[1];
    gray_cell level_1B(1'b0,      P_A[1],  G_A[1],  G_B[1]);
    gray_cell level_2B(G_A[0],   P_A[2],  G_A[2],  G_B[2]);
    black_cell level_3B(G_A[1],  P_A[3],  G_A[3],  P_A[1],  G_B[3],  P_B[3]);

    /*level 3*/
    assign cout = G_B[3];
    gray_cell level_3C(1'b0,      P_B[3],  G_B[3],  cout);

    /*outputs*/
    assign sum[0]  =           P_Z[0];
    assign sum[1]  = G_A[0]  ^ P_Z[1];
    assign sum[2]  = G_B[1]  ^ P_Z[2];
    assign sum[3]  = G_B[2]  ^ P_Z[3];
endmodule

module kogge_stone_5(sum, cout, in1, in2);
    input [4:0] in1, in2; //input
    output [4:0] sum; //output
    output cout;
    wire [4:0] G_Z, P_Z, //wires
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
    input [5:0] in1, in2; //input
    output [5:0] sum; //output
    output cout;
    wire [5:0] G_Z, P_Z, //wires
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
