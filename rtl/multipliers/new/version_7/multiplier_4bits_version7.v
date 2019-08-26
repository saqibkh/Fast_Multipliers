module multiplier_4bits_version7(product, A, B);
    /* This implementation just uses HA for partial product reduction
     * Area: 336.488089
     * Power: 0.1139mW
     * Timing: 0.68ns
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



    //Stage 1
    half_adder HA0(s0, c0, pp2[0], pp1[1]);
    half_adder HA1(s1, c1, pp3[0], pp2[1]);
    half_adder HA2(s2, c2, pp3[1], pp2[2]);
    half_adder HA3(s3, c3, pp3[2], pp2[3]);


    //Stage 2
    half_adder HA4(s4, c4, s1, pp1[2]);
    half_adder HA5(s5, c5, s2, pp1[3]);
    half_adder HA6(s6, c6, s3, c2);
    half_adder HA7(s7, c7, pp3[3], c3);


    //Stage 3
    half_adder HA8(s8, c8, s4, pp0[3]);
    half_adder HA9(s9, c9, s5, c4);
    half_adder HA10(s10, c10, s6, c5);
    half_adder HA11(s11, c11, s7, c6);


    //Stage 4
    half_adder HA12(s12, c12, s9, c8);
    half_adder HA13(s13, c13, s10, c9);
    half_adder HA14(s14, c14, s11, c10);
    half_adder HA15(s15, c15, c7, c11);


    wire[6:0] s, in_1, in_2;
    assign in_1 = {pp1[0],s0,s8,s12,s13,s14,c14};
    assign in_2 = {pp0[1],pp0[2],c0,c1,c12,c13,s15};
    kogge_stone_7 KS(s, in_1, in_2);
    assign product[0] = pp0[0];
    assign product[1] = s[0];
    assign product[2] = s[1];
    assign product[3] = s[2];
    assign product[4] = s[3];
    assign product[5] = s[4];
    assign product[6] = s[5];
    assign product[7] = s[6];

endmodule


module multiplier_4bits_version7_KS(product, A, B);
    /* This implementation follows dadda and wallace but uses half adders only
     * for partial product reduction, and kogge-stone for the last two rows.
     * Area: 
     * Power: 
     * Timing: 
     */

    input [3:0] A, B;
    output [7:0] product;

    wire [3:0] pp0, pp1, pp2, pp3;

    assign pp0 = A[0] ? B : 4'b0000;
    assign pp1 = A[1] ? B : 4'b0000;
    assign pp2 = A[2] ? B : 4'b0000;
    assign pp3 = A[3] ? B : 4'b0000;

    assign product[0] = pp0[0];

    /* Step 1*/
    half_adder HA01(s1,c1,pp0[2],pp1[1]);
    half_adder HA02(s2,c2,pp0[3],pp1[2]);
    half_adder HA03(s3,c3,pp2[1],pp3[0]);
    half_adder HA04(s4,c4,pp1[3],pp2[2]);
    half_adder HA05(s5,c5,pp2[3],pp3[2]);


    /* Step 2*/
    half_adder HA06(s6,c6,s2,s3);
    half_adder HA07(s7,c7,pp3[1],s4);
    half_adder HA08(s8,c8,c2,c3);
    half_adder HA09(s9,c9,s5,c4);
    half_adder HA10(s10,c10,pp3[3],c5);
    /* Step 3*/
    half_adder HA11(s11,c11,s7,s8);
    half_adder HA12(s12,c12,s9,c7);
    half_adder HA13(s13,c13,s10,c9);

    /* Step 4*/
    half_adder HA14(s14,c14,c8,s12);
    half_adder HA15(s15,c15,s13,c12);
    end_adder  HA16(s16,c10,c13);

    wire[6:0] s, in_1, in_2;
    wire c;
    assign in_1 = {pp0[1], pp2[0], s6, c6,  c11, s15, s16};
    assign in_2 = {pp1[0], s1,     c1, s11, s14, c14, c15};
    CLA7 KS(s, in_1, in_2);
    assign product[1] = s[0];
    assign product[2] = s[1];
    assign product[3] = s[2];
    assign product[4] = s[3];
    assign product[5] = s[4];
    assign product[6] = s[5];
    assign product[7] = s[6];
endmodule

module multiplier_4bits_version7_CLA(product, A, B);
    /* This implementation follows dadda and wallace but uses half adders only
     * for partial product reduction, and CLA for the last two rows.
     * Area: 251.544792 
     * Power: 9.3357e-02mW
     * Timing: 0.65ns
     */

    input [3:0] A, B;
    output [7:0] product;

    wire [3:0] pp0, pp1, pp2, pp3;

    assign pp0 = A[0] ? B : 4'b0000;
    assign pp1 = A[1] ? B : 4'b0000;
    assign pp2 = A[2] ? B : 4'b0000;
    assign pp3 = A[3] ? B : 4'b0000;

    assign product[0] = pp0[0];

    /* Step 1*/
    half_adder HA01(s1,c1,pp0[2],pp1[1]);
    half_adder HA02(s2,c2,pp0[3],pp1[2]);
    half_adder HA03(s3,c3,pp2[1],pp3[0]);
    half_adder HA04(s4,c4,pp1[3],pp2[2]);
    half_adder HA05(s5,c5,pp2[3],pp3[2]);


    /* Step 2*/
    half_adder HA06(s6,c6,s2,s3);
    half_adder HA07(s7,c7,pp3[1],s4);
    half_adder HA08(s8,c8,c2,c3);
    half_adder HA09(s9,c9,s5,c4);
    half_adder HA10(s10,c10,pp3[3],c5);
    /* Step 3*/
    half_adder HA11(s11,c11,s7,s8);
    half_adder HA12(s12,c12,s9,c7);
    half_adder HA13(s13,c13,s10,c9);

    /* Step 4*/
    half_adder HA14(s14,c14,c8,s12);
    half_adder HA15(s15,c15,s13,c12);
    end_adder  HA16(s16,c10,c13);

    wire[6:0] s, in_1, in_2;
    wire c;
    assign in_1 = {pp0[1], pp2[0], s6, c6,  c11, s15, s16};
    assign in_2 = {pp1[0], s1,     c1, s11, s14, c14, c15};
    CLA7 KS(s, in_1, in_2);
    assign product[1] = s[0];
    assign product[2] = s[1];
    assign product[3] = s[2];
    assign product[4] = s[3];
    assign product[5] = s[4];
    assign product[6] = s[5];
    assign product[7] = s[6];
endmodule

module half_adder(output wire sum,
                  output wire cout,
                  input wire in1,
                  input wire in2);
    xor(sum, in1, in2);
    and(cout, in1, in2);
endmodule

module end_adder(output wire sum,
                 input wire in1,
                 input wire in2);
    xor(sum, in1, in2);
endmodule

module CLA7(output [6:0] sum,
            input [6:0] in1, in2);
  wire [6:0] G; /* Generate */
  wire [6:0] P; /* Propagate */
  wire [6:0] C; /* Carry */

  assign G[0] = in1[6] & in2[6]; /*Generate    Gi = Ai * Bi */
  assign G[1] = in1[5] & in2[5];
  assign G[2] = in1[4] & in2[4];
  assign G[3] = in1[3] & in2[3];
  assign G[4] = in1[2] & in2[2];
  assign G[5] = in1[1] & in2[1];
  assign G[6] = in1[0] & in2[0];

  assign P[0] = in1[6] ^ in2[6]; /*Propagate   Pi = Ai + Bi */
  assign P[1] = in1[5] ^ in2[5];
  assign P[2] = in1[4] ^ in2[4];
  assign P[3] = in1[3] ^ in2[3];
  assign P[4] = in1[2] ^ in2[2];
  assign P[5] = in1[1] ^ in2[1];
  assign P[6] = in1[0] ^ in2[0];

  assign C[0] = 0;  /* Carry_out = Ci+1 = Gi + Pi*Ci */
  assign C[1] = G[0] | (P[0] & C[0]);
  assign C[2] = G[1] | (P[1] & C[1]);
  assign C[3] = G[2] | (P[2] & C[2]);
  assign C[4] = G[3] | (P[3] & C[3]);
  assign C[5] = G[4] | (P[4] & C[4]);
  assign C[6] = G[5] | (P[5] & C[5]);
  assign sum = P ^ C;
endmodule

module kogge_stone_7(sum, in1, in2);
    input [6:0] in1, in2; //input
    output [6:0] sum; //output
    wire [6:0] G_Z, P_Z, //wires
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

    /*outputs*/
    assign sum[0]  =           P_Z[0];
    assign sum[1]  = G_A[0]  ^ P_Z[1];
    assign sum[2]  = G_B[1]  ^ P_Z[2];
    assign sum[3]  = G_B[2]  ^ P_Z[3];
    assign sum[4]  = G_C[3]  ^ P_Z[4];
    assign sum[5]  = G_C[4]  ^ P_Z[5];
    assign sum[6]  = G_C[5]  ^ P_Z[6];
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
