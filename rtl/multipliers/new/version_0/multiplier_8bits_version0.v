module multiplier_8bits_version0(product, A, B);

    /* This implementation follows the Dadda multiplier with HA and FAs used for partial product reduction.
     * However, the final two rows are added using a kogge-stone adder of length 14
     * Area: 1308.877662
     * Power: 0.7126mW
     * Timing: 1.00ns
     */
    input [7:0] A, B;
    output [15:0] product;

    wire [7:0] pp0, pp1, pp2, pp3, pp4, pp5, pp6, pp7;

    assign pp0 = A[0] ? B : 8'b00000000;
    assign pp1 = A[1] ? B : 8'b00000000;
    assign pp2 = A[2] ? B : 8'b00000000;
    assign pp3 = A[3] ? B : 8'b00000000;
    assign pp4 = A[4] ? B : 8'b00000000;
    assign pp5 = A[5] ? B : 8'b00000000;
    assign pp6 = A[6] ? B : 8'b00000000;
    assign pp7 = A[7] ? B : 8'b00000000;

    /* First Stage */
    half_adder ha01(s11, c11, pp6[0], pp5[1]);
    full_adder fa01(s12, c12, pp7[0], pp6[1], pp5[2]);
    full_adder fa02(s13, c13, pp7[1], pp6[2], pp5[3]);
    full_adder fa03(s14, c14, pp7[2], pp6[3], pp5[4]);

    half_adder ha02(s15, c15, pp4[3], pp3[4]);
    half_adder ha03(s16, c16, pp4[4], pp3[5]);

    /* Second Stage */
    half_adder ha04(s201, c201, pp3[1], pp4[0]);
    full_adder fa04(s202, c202, pp3[2], pp4[1], pp5[0]);
    full_adder fa05(s203, c203, pp2[4], pp3[3], pp4[2]);
    full_adder fa06(s204, c204, pp0[7], pp1[6], pp2[5]);
    full_adder fa07(s205, c205, pp1[7], pp2[6], s13);
    full_adder fa08(s206, c206, pp4[5], pp3[6], pp2[7]);
    full_adder fa09(s207, c207, pp5[5], pp6[4], pp7[3]);
    full_adder fa10(s208, c208, pp5[6], pp6[5], pp7[4]);

    half_adder ha05(s209, c209, pp2[3], pp1[4]);
    full_adder fa11(s210, c210, pp1[5], pp0[6], s11);
    full_adder fa12(s211, c211, s12,    c11,    s15);
    full_adder fa13(s212, c212, c12,    s16,    c15);
    full_adder fa14(s213, c213, s14,    c13,    c16);
    full_adder fa15(s214, c214, pp4[6], pp3[7], c14);
    
    /* Third Stage */
    half_adder ha06(s301, c301, pp3[0], pp2[1]);
    full_adder fa16(s302, c302, pp2[2], pp1[3], pp0[4]);
    full_adder fa17(s303, c303, pp0[5], s202,   c201);
    full_adder fa18(s304, c304, s203, c202, s210);
    full_adder fa19(s305, c305, s204, c203, s211);
    full_adder fa20(s306, c306, s205, c204, s212);
    full_adder fa21(s307, c307, s206, c205, s213);
    full_adder fa22(s308, c308, s207, c206, s214);
    full_adder fa23(s309, c309, s208, c207, pp4[7]);
    full_adder fa24(s310, c310, pp7[5], pp6[6], pp5[7]);

    /* Fourth Stage */
    half_adder ha07(s401, c401, pp2[0], pp1[1]);
    full_adder fa25(s402, c402, pp1[2], pp0[3], s301);
    full_adder fa26(s403, c403, s201,   s302,   c301);
    full_adder fa27(s404, c404, s209,   s303,   c302);
    full_adder fa28(s405, c405, c209,   s304,   c303);
    full_adder fa29(s406, c406, c210,   s305,   c304);
    full_adder fa30(s407, c407, c211,   s306,   c305);
    full_adder fa31(s408, c408, c212,   s307,   c306);
    full_adder fa32(s409, c409, c213,   s308,   c307);
    full_adder fa33(s410, c410, c214,   s309,   c308);
    full_adder fa34(s411, c411, c208,   s310,   c309);
    full_adder fa35(s412, c412, pp7[6], pp6[7], c310);

    /* Final Stage is a Kogge-stone adder of length 14 */
    assign product[0] = pp0[0];

    wire [13:0] s, in_1, in_2;
    wire c;
    assign in_1 = {pp1[0],pp0[2],c401,c402,c403,c404,c405,c406,c407,c408,c409,c410,c411,c412};
    assign in_2 = {pp0[1],s401,  s402,s403,s404,s405,s406,s407,s408,s409,s410,s411,s412,pp7[7]};
    kogge_stone_14 KS_14(s, c, in_1, in_2);
    
    assign product[1]  = s[0];
    assign product[2]  = s[1];
    assign product[3]  = s[2];
    assign product[4]  = s[3];
    assign product[5]  = s[4];
    assign product[6]  = s[5];
    assign product[7]  = s[6];
    assign product[8]  = s[7];
    assign product[9]  = s[8];
    assign product[10] = s[9];
    assign product[11] = s[10];
    assign product[12] = s[11];
    assign product[13] = s[12];
    assign product[14] = s[13];
    assign product[15] = c;
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

module kogge_stone_14(sum, cout, in1, in2);
    input [13:0] in1, in2; //input
    output [13:0] sum; //output
    output cout; //carry-out
    wire [13:0] G_Z, P_Z, //wires
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
