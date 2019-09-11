module multiplier_8bits_version12(product, A, B);

    output [15:0] product;
    input [7:0] A, B;

    wire [7:0] pp0;
    wire [7:0] pp1;
    wire [7:0] pp2;
    wire [7:0] pp3;
    wire [7:0] pp4;
    wire [7:0] pp5;
    wire [7:0] pp6;
    wire [7:0] pp7;


    assign pp0 = A[0] ? B: 8'b00000000;
    assign pp1 = A[1] ? B: 8'b00000000;
    assign pp2 = A[2] ? B: 8'b00000000;
    assign pp3 = A[3] ? B: 8'b00000000;
    assign pp4 = A[4] ? B: 8'b00000000;
    assign pp5 = A[5] ? B: 8'b00000000;
    assign pp6 = A[6] ? B: 8'b00000000;
    assign pp7 = A[7] ? B: 8'b00000000;


    /*Stage 1*/
    wire[3:0] s1, in1_1, in1_2;
    wire c1;
    assign in1_1 = {pp0[5],pp0[6],pp0[7],pp1[7]};
    assign in1_2 = {pp1[4],pp1[5],pp1[6],pp2[6]};
    CLA_4 KS_1(s1, c1, in1_1, in1_2);
    wire[3:0] s2, in2_1, in2_2;
    wire c2;
    assign in2_1 = {pp2[4],pp2[5],pp3[5],pp2[7]};
    assign in2_2 = {pp3[3],pp3[4],pp4[4],pp3[6]};
    CLA_4 KS_2(s2, c2, in2_1, in2_2);
    wire[3:0] s3, in3_1, in3_2;
    wire c3;
    assign in3_1 = {pp4[3],pp5[3],pp4[5],pp3[7]};
    assign in3_2 = {pp5[2],pp6[2],pp5[4],pp4[6]};
    CLA_4 KS_3(s3, c3, in3_1, in3_2);

    /*Stage 2*/
    wire[3:0] s4, in4_1, in4_2;
    wire c4;
    assign in4_1 = {pp0[3],pp0[4],pp2[3],pp4[2]};
    assign in4_2 = {pp1[2],pp1[3],pp3[2],pp5[1]};
    CLA_4 KS_4(s4, c4, in4_1, in4_2);
    wire[3:0] s5, in5_1, in5_2;
    wire c5;
    assign in5_1 = {pp2[2],pp4[1],pp6[0],pp6[1]};
    assign in5_2 = {pp3[1],pp5[0],s1[1],pp7[0]};
    CLA_4 KS_5(s5, c5, in5_1, in5_2);
    wire[3:0] s6, in6_1, in6_2;
    wire c6;
    assign in6_1 = {s2[1],pp7[1],pp6[3],pp5[5]};
    assign in6_2 = {s3[0],1'b0,pp7[2],pp6[4]};
    CLA_4_c KS_6(s6, c6, in6_1, in6_2, s1[2]);
    wire[3:0] s7, in7_1, in7_2;
    wire c7;
    assign in7_1 = {s2[2],s2[3],pp7[3],pp4[7]};
    assign in7_2 = {s3[1],s3[2],s3[3],pp5[6]};
    CLA_4_c KS_7(s7, c7, in7_1, in7_2, s1[3]);
    wire[1:0] s8, in8_1, in8_2;
    wire c8;
    assign in8_1 = {pp7[4],pp5[7]};
    assign in8_2 = {s7[3],pp6[6]};
    CLA_2_c KS_8(s8, c8, in8_1, in8_2, pp6[5]);

    /*Stage 3*/
    wire[3:0] s9, in9_1, in9_2;
    wire c9;
    assign in9_1 = {pp0[2],pp2[1],pp4[0],s1[0]};
    assign in9_2 = {pp1[1],pp3[0],s4[1],s4[2]};
    CLA_4 KS_9(s9, c9, in9_1, in9_2);
    wire[3:0] s10, in10_1, in10_2;
    wire c10;
    assign in10_1 = {s4[3],s5[3],s6[1],s6[2]};
    assign in10_2 = {s5[2],s6[0],s7[0],s7[1]};
    CLA_4_c KS_10(s10, c10, in10_1, in10_2, s2[0]);
    wire[3:0] s11, in11_1, in11_2;
    wire c11;
    assign in11_1 = {s7[2],s8[0],pp7[5],pp6[7]};
    assign in11_2 = {c10,c3,s8[1],pp7[6]};
    CLA_4_c KS_11(s11, c11, in11_1, in11_2, s6[3]);


    /*Final Stage 3*/
    wire[13:0] s, in_1, in_2;
    wire c;
    assign in_1 = {pp0[1],pp2[0],s4[0],s5[0],s5[1],s10[0],s10[1],s10[2],s10[3],c2,c6,c7,c8,pp7[7]};
    assign in_2 = {pp1[0],s9[0],s9[1],s9[2],s9[3],c9,c4,c5,c1,s11[0],s11[1],s11[2],s11[3],c11};
    CLA_14(s, c, in_1, in_2);

    assign product[0] = pp0[0];
    assign product[1] = s[0];
    assign product[2] = s[1];
    assign product[3] = s[2];
    assign product[4] = s[3];
    assign product[5] = s[4];
    assign product[6] = s[5];
    assign product[7] = s[6];
    assign product[8] = s[7];
    assign product[9] = s[8];
    assign product[10] = s[9];
    assign product[11] = s[10];
    assign product[12] = s[11];
    assign product[13] = s[12];
    assign product[14] = s[13];
    assign product[15] = c;
endmodule

module CLA_2_c(output [1:0] sum,
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

module CLA_4(output [3:0] sum,
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

module CLA_4_c(output [3:0] sum,
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


module CLA_14(output [13:0] sum, output cout, input [13:0] in1, input [13:0] in2);

    wire[13:0] G;
    wire[13:0] C;
    wire[13:0] P;

    assign G[0] = in1[13] & in2[13];
    assign P[0] = in1[13] ^ in2[13];
    assign G[1] = in1[12] & in2[12];
    assign P[1] = in1[12] ^ in2[12];
    assign G[2] = in1[11] & in2[11];
    assign P[2] = in1[11] ^ in2[11];
    assign G[3] = in1[10] & in2[10];
    assign P[3] = in1[10] ^ in2[10];
    assign G[4] = in1[9] & in2[9];
    assign P[4] = in1[9] ^ in2[9];
    assign G[5] = in1[8] & in2[8];
    assign P[5] = in1[8] ^ in2[8];
    assign G[6] = in1[7] & in2[7];
    assign P[6] = in1[7] ^ in2[7];
    assign G[7] = in1[6] & in2[6];
    assign P[7] = in1[6] ^ in2[6];
    assign G[8] = in1[5] & in2[5];
    assign P[8] = in1[5] ^ in2[5];
    assign G[9] = in1[4] & in2[4];
    assign P[9] = in1[4] ^ in2[4];
    assign G[10] = in1[3] & in2[3];
    assign P[10] = in1[3] ^ in2[3];
    assign G[11] = in1[2] & in2[2];
    assign P[11] = in1[2] ^ in2[2];
    assign G[12] = in1[1] & in2[1];
    assign P[12] = in1[1] ^ in2[1];
    assign G[13] = in1[0] & in2[0];
    assign P[13] = in1[0] ^ in2[0];


    assign C[0] = 0;  /* Carry_out = Ci+1 = Gi + Pi*Ci */;
    assign C[1] = G[0] | (P[0] & C[0]);
    assign C[2] = G[1] | (P[1] & C[1]);
    assign C[3] = G[2] | (P[2] & C[2]);
    assign C[4] = G[3] | (P[3] & C[3]);
    assign C[5] = G[4] | (P[4] & C[4]);
    assign C[6] = G[5] | (P[5] & C[5]);
    assign C[7] = G[6] | (P[6] & C[6]);
    assign C[8] = G[7] | (P[7] & C[7]);
    assign C[9] = G[8] | (P[8] & C[8]);
    assign C[10] = G[9] | (P[9] & C[9]);
    assign C[11] = G[10] | (P[10] & C[10]);
    assign C[12] = G[11] | (P[11] & C[11]);
    assign C[13] = G[12] | (P[12] & C[12]);
    assign cout = G[13] | (P[13] & C[13]);
    assign sum = P ^ C;
endmodule
