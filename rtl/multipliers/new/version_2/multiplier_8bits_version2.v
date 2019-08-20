module multiplier_8bits_version2(product, A, B);
    
    /* This implementation is similar to 8bit dadda with CLA reduction, but uses kogge-stone adder at the end 
     * Area: 1283.066162 
     * Power: 0.6689mW
     * Timing: 1.27
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
 
    assign product[0] = pp0[0];

    /* 1st CLA*/ 
    wire [3:0] s1, in1_1, in1_2;
    wire c1;
    assign in1_1 = {pp2[4],pp2[5],pp2[6],pp2[7]};
    assign in1_2 = {pp3[3],pp3[4],pp3[5],pp3[6]};
    CLA4 CLA01(s1, c1, in1_1, in1_2);

    /* 2nd CLA */
    wire [3:0] s2, in2_1, in2_2;
    wire c2;
    assign in2_1 = {pp4[1],pp4[2],pp4[3],pp4[4]};
    assign in2_2 = {pp5[0],pp5[1],pp5[2],pp5[3]};
    CLA4 CLA02(s2, c2, in2_1, in2_2);

    /* 3rd CLA */
    wire [3:0] s3, in3_1, in3_2;
    wire c3;
    assign in3_1 = {pp6[1],pp6[2],pp6[3],pp6[4]};
    assign in3_2 = {pp7[0],pp7[1],pp7[2],pp7[3]};
    CLA4 CLA03(s3, c3, in3_1, in3_2);

    /* 4th CLA */
    wire [3:0] s4, in4_1, in4_2;
    wire c4;
    assign in4_1 = {pp0[3],pp0[4],pp0[5],pp0[6]};
    assign in4_2 = {pp1[2],pp1[3],pp1[4],pp1[5]};
    CLA4 CLA04(s4, c4, in4_1, in4_2);

    /* 5th CLA */
    wire [3:0] s5, in5_1, in5_2;
    wire c5;
    assign in5_1 = {pp0[7],pp1[7],pp4[5],pp3[7]};
    assign in5_2 = {pp1[6],s1[2],pp5[4],pp4[6]};
    CLA4_c CLA05(s5, c5, in5_1, in5_2, s3[0]);

     /* 6th CLA */
    wire [1:0] s6, in6_1, in6_2;
    wire c6;
    assign in6_1 = {pp4[7],pp5[7]};
    assign in6_2 = {pp5[6],pp6[6]};
    CLA2_c CLA06(s6, c6, in6_1, in6_2, pp6[5]);

    /* 7th CLA */
    wire [3:0] s7, in7_1, in7_2;
    wire c7;
    assign in7_1 = {pp2[2],pp2[3],pp6[0],s1[1]};
    assign in7_2 = {pp3[1],pp3[2],s1[0],s2[2]};
    CLA4 CLA07(s7, c7, in7_1, in7_2);

    /* 8th CLA */
    wire [3:0] s8, in8_1, in8_2;
    wire c8;
    assign in8_1 = {s2[3],s1[3],pp5[5],c3};
    assign in8_2 = {s3[1],c2,c1,pp7[4]};
    CLA4 CLA08(s8, c8, in8_1, in8_2);

    half_adder ha01(product[1], cA, pp0[1], pp1[0]);
    full_adder fa01(sB, cB, pp0[2], pp1[1], pp2[0]);
    full_adder fa02(sC, cC, pp2[1], pp3[0], s4[0]);
    full_adder fa03(sD, cD, pp4[0], s4[1],  s7[0]);
    full_adder fa04(sE, cE, s2[0],  s4[2],  s7[1]);
    full_adder fa05(sF, cF, s2[1],  s4[3],  s7[2]);
    full_adder fa06(sG, cG, c4,     s5[0],  s7[3]);
    full_adder fa07(sH, cH, s5[1],  c7,     s8[0]);
    full_adder fa08(sI, cI, s3[2],  s5[2],  s8[1]);
   

    /* CLA */
    wire [3:0] s9, in9_1, in9_2;
    wire c9;
    assign in9_1 = {s3[3],c5,pp7[5],pp6[7]};
    assign in9_2 = {s5[3],s6[0],s6[1],pp7[6]};
    CLA4_c CLA09(s9, c9, in9_1, in9_2, s8[2]);  

    /* Final Stage */
    wire [12:0] s, in_1, in_2;
    wire c;
    assign in_1 = {pp7[7],s9[3],s9[2],s9[1],s9[0],sI,sH,sG,sF,sE,sD,sC,sB};
    assign in_2 = {c9,c6,c8,s8[3],cI,cH,cG,cF,cE,cD,cC,cB,cA};
    kogge_stone_13 KS_13(s, c, in_1, in_2);
    assign product[15] = c;
    assign product[2]  = s[0];
    assign product[3]  = s[1];
    assign product[4]  = s[2];
    assign product[5]  = s[3];
    assign product[6]  = s[4];
    assign product[7]  = s[5];
    assign product[8]  = s[6];
    assign product[9]  = s[7];
    assign product[10] = s[8];
    assign product[11] = s[9];
    assign product[12] = s[10];
    assign product[13] = s[11];
    assign product[14] = s[12];
endmodule

module CLA2_c(output [1:0] sum,
            output cout,
            input [1:0] in1, in2,
            input cin);

    wire [1:0] G; /* Generate */
    wire [1:0] P; /* Propagate */
    wire [1:0] C; /* Carry */

    assign G[0] = in1[1] & in2[1]; /*Generate    Gi = Ai * Bi */
    assign G[1] = in1[0] & in2[0];

    assign P[0] = in1[1] ^ in2[1];
    assign P[1] = in1[0] ^ in2[0];

    assign C[0] = cin;
    assign C[1] = G[0] | (P[0] & C[0]);
    assign cout = G[1] | (P[1] & C[1]);
    assign sum = P ^ C;
endmodule

module CLA4(output [3:0] sum,
            output cout,
            input [3:0] in1, in2);

    wire [3:0] G; /* Generate */
    wire [3:0] P; /* Propagate */
    wire [3:0] C; /* Carry */

    assign G[0] = in1[3] & in2[3]; /*Generate    Gi = Ai * Bi */
    assign G[1] = in1[2] & in2[2];
    assign G[2] = in1[1] & in2[1];
    assign G[3] = in1[0] & in2[0];
    assign P[0] = in1[3] ^ in2[3]; /*Propagate   Pi = Ai + Bi */
    assign P[1] = in1[2] ^ in2[2];
    assign P[2] = in1[1] ^ in2[1];
    assign P[3] = in1[0] ^ in2[0];

    assign C[0] = 0;
    assign C[1] = G[0] | (P[0] & C[0]);
    assign C[2] = G[1] | (P[1] & C[1]);
    assign C[3] = G[2] | (P[2] & C[2]);
    assign cout = G[3] | (P[3] & C[3]);
    assign sum = P ^ C;
endmodule

module CLA4_c(output [3:0] sum,
            output cout,
            input [3:0] in1, in2,
            input cin);

    wire [3:0] G; /* Generate */
    wire [3:0] P; /* Propagate */
    wire [3:0] C; /* Carry */

    assign G[0] = in1[3] & in2[3]; /*Generate    Gi = Ai * Bi */
    assign G[1] = in1[2] & in2[2];
    assign G[2] = in1[1] & in2[1];
    assign G[3] = in1[0] & in2[0];
    assign P[0] = in1[3] ^ in2[3]; /*Propagate   Pi = Ai + Bi */
    assign P[1] = in1[2] ^ in2[2];
    assign P[2] = in1[1] ^ in2[1];
    assign P[3] = in1[0] ^ in2[0];

    assign C[0] = cin;
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

module kogge_stone_13(sum, cout, in1, in2);
    input [12:0] in1, in2; //input
    output [12:0] sum; //output
    output cout; //carry-out
    wire [12:0] G_Z, P_Z, //wires
    G_A, P_A,
    G_B, P_B,
    G_C, P_C,
    G_D, P_D;

    assign P_Z = in1 ^ in2;
    assign G_Z = in1 & in2;

    /*level 1*/
    assign G_A[0] = G_Z[0];
    //gray_cell level_0A(1'b0, P_Z[0], G_Z[0], G_A[0]);
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

    /*level 2*/
    assign G_B[1] = G_A[1];
    //gray_cell level_1B(1'b0,      P_A[1],  G_A[1],  G_B[1]);
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

    /*level 3*/
    assign G_C[3] = G_B[3];
    //gray_cell level_3C(1'b0,      P_B[3],  G_B[3],  G_C[3]);
    gray_cell level_4C(G_A[0],   P_B[4],  G_B[4],  G_C[4]);
    gray_cell level_5C(G_B[1],   P_B[5],  G_B[5],  G_C[5]);
    gray_cell level_6C(G_B[2],   P_B[6],  G_B[6],  G_C[6]);
    black_cell level_7C(G_B[3],  P_B[7],  G_B[7],  P_B[3],  G_C[7],  P_C[7]);
    black_cell level_8C(G_B[4],  P_B[8],  G_B[8],  P_B[4],  G_C[8],  P_C[8]);
    black_cell level_9C(G_B[5],  P_B[9],  G_B[9],  P_B[5],  G_C[9],  P_C[9]);
    black_cell level_AC(G_B[6],  P_B[10], G_B[10], P_B[6],  G_C[10], P_C[10]);
    black_cell level_BC(G_B[7],  P_B[11], G_B[11], P_B[7],  G_C[11], P_C[11]);
    black_cell level_CC(G_B[8],  P_B[12], G_B[12], P_B[8],  G_C[12], P_C[12]);

    /*level 4*/
    assign G_D[7] = G_C[7];
    //gray_cell level_7D(1'b0,     P_C[7],   G_C[7],           G_D[7]);
    gray_cell level_8D(G_A[0],   P_C[8],   G_C[8],           G_D[8]);
    gray_cell level_9D(G_B[1],   P_C[9],   G_C[9],           G_D[9]);
    gray_cell level_AD(G_B[2],   P_C[10],  G_C[10],          G_D[10]);
    gray_cell level_BD(G_C[3],   P_C[11],  G_C[11],          G_D[11]);
    gray_cell level_CD(G_C[4],   P_C[12],  G_C[12],          cout);

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
