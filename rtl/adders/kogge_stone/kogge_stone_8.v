module kogge_stone_8(in1, in2, sum, cin, cout);
    /* This is a 8 bit kogge-stone parallel prefix adder
     * Area: 262.338693
     * Power: 9.9864e-02 mW
     * Timing: 0.37ns
     */
    input [7:0] in1, in2; //input
    output [7:0] sum; //output
    input cin; //carry-in
    output cout; //carry-out
    wire [7:0] G_Z, P_Z, //wires
    G_A, P_A,
    G_B, P_B,
    G_C, P_C;

    assign P_Z = in1 ^ in2;
    assign G_Z = in1 & in2;

    //level 1
    gray_cell level_0A(cin, P_Z[0], G_Z[0], G_A[0]);
    black_cell level_1A(G_Z[0], P_Z[1], G_Z[1], P_Z[0], G_A[1], P_A[1]);
    black_cell level_2A(G_Z[1], P_Z[2], G_Z[2], P_Z[1], G_A[2], P_A[2]);
    black_cell level_3A(G_Z[2], P_Z[3], G_Z[3], P_Z[2], G_A[3], P_A[3]);
    black_cell level_4A(G_Z[3], P_Z[4], G_Z[4], P_Z[3], G_A[4], P_A[4]);
    black_cell level_5A(G_Z[4], P_Z[5], G_Z[5], P_Z[4], G_A[5], P_A[5]);
    black_cell level_6A(G_Z[5], P_Z[6], G_Z[6], P_Z[5], G_A[6], P_A[6]);
    black_cell level_7A(G_Z[6], P_Z[7], G_Z[7], P_Z[6], G_A[7], P_A[7]);

    //level 2 
    gray_cell level_1B(cin, P_A[1], G_A[1], G_B[1]);
    gray_cell level_2B(G_A[0], P_A[2], G_A[2], G_B[2]);
    black_cell level_3B(G_A[1], P_A[3], G_A[3], P_A[1], G_B[3], P_B[3]);
    black_cell level_4B(G_A[2], P_A[4], G_A[4], P_A[2], G_B[4], P_B[4]);
    black_cell level_5B(G_A[3], P_A[5], G_A[5], P_A[3], G_B[5], P_B[5]);
    black_cell level_6B(G_A[4], P_A[6], G_A[6], P_A[4], G_B[6], P_B[6]);
    black_cell level_7B(G_A[5], P_A[7], G_A[7], P_A[5], G_B[7], P_B[7]);

    //level 3
    gray_cell level_3C(cin, P_B[3], G_B[3], G_C[3]);
    gray_cell level_4C(G_A[0], P_B[4], G_B[4], G_C[4]);
    gray_cell level_5C(G_B[1], P_B[5], G_B[5], G_C[5]);
    gray_cell level_6C(G_B[2], P_B[6], G_B[6], G_C[6]);
    black_cell level_7C(G_B[3], P_B[7], G_B[7], P_B[3], G_C[7], P_C[7]);

    //level 4
    gray_cell level_7D(cin, P_C[7], G_C[7], cout);

    //outputs
    assign sum[0] = cin    ^ P_Z[0];
    assign sum[1] = G_A[0] ^ P_Z[1];
    assign sum[2] = G_B[1] ^ P_Z[2];
    assign sum[3] = G_B[2] ^ P_Z[3];
    assign sum[4] = G_C[3] ^ P_Z[4];
    assign sum[5] = G_C[4] ^ P_Z[5];
    assign sum[6] = G_C[5] ^ P_Z[6];
    assign sum[7] = G_C[6] ^ P_Z[7];

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
