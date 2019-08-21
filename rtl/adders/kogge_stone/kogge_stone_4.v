module kogge_stone_4(in1, in2, sum, cin, cout);

    input [3:0] in1, in2; //input
    output [3:0] sum; //output
    input cin; //carry-in
    output cout; //carry-out
    wire [3:0] G_Z, P_Z, //wires
    G_A, P_A,
    G_B, P_B,
    G_C, P_C;

    assign P_Z = in1 ^ in2;
    assign G_Z = in1 & in2;

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
