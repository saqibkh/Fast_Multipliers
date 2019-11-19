module carry_lookahead_adder_3_4bits(output [3:0] sum,
                                   output cout_1, cout_2,
                                   input [3:0] in1, in2, in3,
                                   input cin);

  /* 
   * Area: 215.408694
   * Power: 0.1080mW
   * Timing: 0.58ns
   */

  wire [3:0] s1;
  wire c1;
  kogge_stone_4      CLA_1(s1,  c1,     in1, in2);
  kogge_stone_4      CLA_2(sum, c2,     s1,   in3);
  half_adder HA_01(cout_1, cout_2, c1, c2);
endmodule

module CLA_4(output [3:0] sum, output cout, input [3:0] in1, input [3:0] in2);

    wire[3:0] G;
    wire[3:0] C;
    wire[3:0] P;

    assign G = in1 & in2;
    assign P = in1 ^ in2;

    assign C[0] = 0;  /* Carry_out = Ci+1 = Gi + Pi*Ci */;
    assign C[1] = G[0] | (P[0] & C[0]);
    assign C[2] = G[1] | (P[1] & C[1]);
    assign C[3] = G[2] | (P[2] & C[2]);
    assign cout = G[3] | (P[3] & C[3]);
    assign sum = P ^ C;
endmodule

module half_adder(output wire sum,
                  output wire cout,
                  input wire in1,
                  input wire in2);
    xor(sum, in1, in2);
    and(cout, in1, in2);
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

    assign G_0 = in1 & in2;
    assign P_0 = in1 ^ in2;

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
