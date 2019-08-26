module dadda_unsigned_multiplier_KS_4(product, A, B);
    input [3:0] A, B;
    output [7:0] product;

    /* This is a dadda implementation of a 4bit multiplier which uses 
     * kogge-stone in the final addition of last two rows.
     * Area: 267.500992
     * Power: 9.6507e-02mW
     * Timing: 0.59ns
     */

    wire [3:0] pp0, pp1, pp2, pp3;

    and AND01(pp0[0], A[0], B[0]);
    and AND02(pp0[1], A[1], B[0]);
    and AND03(pp0[2], A[2], B[0]);
    and AND04(pp0[3], A[3], B[0]);
    and AND05(pp1[0], A[0], B[1]);
    and AND06(pp1[1], A[1], B[1]);
    and AND07(pp1[2], A[2], B[1]);
    and AND08(pp1[3], A[3], B[1]);
    and AND09(pp2[0], A[0], B[2]);
    and AND10(pp2[1], A[1], B[2]);
    and AND11(pp2[2], A[2], B[2]);
    and AND12(pp2[3], A[3], B[2]);
    and AND13(pp3[0], A[0], B[3]);
    and AND14(pp3[1], A[1], B[3]);
    and AND15(pp3[2], A[2], B[3]);
    and AND16(pp3[3], A[3], B[3]);

    assign product[0] = pp0[0];

    /* First Stage */
    half_adder ha1(s11, c11, pp3[0], pp2[1]);
    half_adder ha2(s12, c12, pp3[1], pp2[2]);

    /* Second Stage */
    half_adder ha3(s21, c21, pp2[0], pp1[1]);
    full_adder fa1(s22, c22, pp1[2], pp0[3], s11);
    full_adder fa2(s23, c23, pp1[3], s12,    c11);
    full_adder fa3(s24, c24, pp2[3], pp3[2], c12);


    wire [5:0] s, in_1, in_2;
    wire c;
    assign in_1 = {pp0[1],s21,s22,s23,s24,pp3[3]};
    assign in_2 = {pp1[0],pp0[2],c21,c22,c23,c24};
    kogge_stone_6 KS(s, c, in_1, in_2);

    assign product[7] = c;
    assign product[1] = s[0];
    assign product[2] = s[1];
    assign product[3] = s[2];
    assign product[4] = s[3];
    assign product[5] = s[4];
    assign product[6] = s[5];
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

module kogge_stone_6(sum, cout, in1, in2);
    input [5:0] in1, in2; //input
    output [5:0] sum; //output
    output cout; //carry-out
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
