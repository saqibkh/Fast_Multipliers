module multiplier_4bits_version9(product, A, B);

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

module kogge_stone_6(sum, in1, in2);
    input [5:0] in1, in2; //input
    output [5:0] sum; //output
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
    gray_cell level_5C(G_B[1],   P_B[5],  G_B[5],  G_C[5]);

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
