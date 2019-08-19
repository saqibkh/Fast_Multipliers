module multiplier_16bits_version4(product, A, B);


     input  [15:0] A, B;
    output [31:0] product;

    wire [31:0] product;
    wire [15:0] pp0, pp1, pp2, pp3, pp4, pp5, pp6, pp7, pp8, pp9, pp10, pp11, pp12, pp13, pp14, pp15;

    assign pp0 = A[0] ? B : 16'b00000000;
    assign pp1 = A[1] ? B : 16'b00000000;
    assign pp2 = A[2] ? B : 16'b00000000;
    assign pp3 = A[3] ? B : 16'b00000000;
    assign pp4 = A[4] ? B : 16'b00000000;
    assign pp5 = A[5] ? B : 16'b00000000;
    assign pp6 = A[6] ? B : 16'b00000000;
    assign pp7 = A[7] ? B : 16'b00000000;
    assign pp8 = A[8] ? B : 16'b00000000;
    assign pp9 = A[9] ? B : 16'b00000000;
    assign pp10 = A[10] ? B : 16'b00000000;
    assign pp11 = A[11] ? B : 16'b00000000;
    assign pp12 = A[12] ? B : 16'b00000000;
    assign pp13 = A[13] ? B : 16'b00000000;
    assign pp14 = A[14] ? B : 16'b00000000;
    assign pp15 = A[15] ? B : 16'b00000000;

    assign product[0] = pp0[0];

    /* 1st CLA */
    wire [15:0] s1, in1_1, in1_2;
    wire c1;
    assign in1_1 = {pp0[1],pp0[2],pp0[3],pp0[4],pp0[5],pp0[6],pp0[7],pp0[8],pp0[9],pp0[10],pp0[11],pp0[12],pp0[13],pp0[14],pp0[15],1'b0};
    assign in1_2 = {pp1[0],pp1[1],pp1[2],pp1[3],pp1[4],pp1[5],pp1[6],pp1[7],pp1[8],pp1[9], pp1[10],pp1[11],pp1[12],pp1[13],pp1[14],pp1[15]};
    CLA16 CLA01(s1, c1, in1_1, in1_2);
    assign product[1] = s1[0];

    /* 2nd CLA */
    wire [14:0] s2, in2_1, in2_2;
    wire c2;
    assign in2_1 = {pp2[1],pp2[2],pp2[3],pp2[4],pp2[5],pp2[6],pp2[7],pp2[8],pp2[9],pp2[10],pp2[11],pp2[12],pp2[13],pp2[14],pp2[15]};
    assign in2_2 = {pp3[0],pp3[1],pp3[2],pp3[3],pp3[4],pp3[5],pp3[6],pp3[7],pp3[8],pp3[9], pp3[10],pp3[11],pp3[12],pp3[13],pp3[14]};
    CLA15 CLA02(s2, c2, in2_1, in2_2);

    /* 3rd CLA */
    wire [14:0] s3, in3_1, in3_2;
    wire c3;
    assign in3_1 = {pp4[1],pp4[2],pp4[3],pp4[4],pp4[5],pp4[6],pp4[7],pp4[8],pp4[9],pp4[10],pp4[11],pp4[12],pp4[13],pp4[14],pp4[15]};
    assign in3_2 = {pp5[0],pp5[1],pp5[2],pp5[3],pp5[4],pp5[5],pp5[6],pp5[7],pp5[8],pp5[9], pp5[10],pp5[11],pp5[12],pp5[13],pp5[14]};
    CLA15 CLA03(s3, c3, in3_1, in3_2);

    /* 4th CLA */
    wire [14:0] s4, in4_1, in4_2;
    wire c4;
    assign in4_1 = {pp6[1],pp6[2],pp6[3],pp6[4],pp6[5],pp6[6],pp6[7],pp6[8],pp6[9],pp6[10],pp6[11],pp6[12],pp6[13],pp6[14],pp6[15]};
    assign in4_2 = {pp7[0],pp7[1],pp7[2],pp7[3],pp7[4],pp7[5],pp7[6],pp7[7],pp7[8],pp7[9], pp7[10],pp7[11],pp7[12],pp7[13],pp7[14]};
    CLA15 CLA04(s4, c4, in4_1, in4_2);
    
    /* 5th CLA */
    wire [14:0] s5, in5_1, in5_2;
    wire c5;
    assign in5_1 = {pp8[1],pp8[2],pp8[3],pp8[4],pp8[5],pp8[6],pp8[7],pp8[8],pp8[9],pp8[10],pp8[11],pp8[12],pp8[13],pp8[14],pp8[15]};
    assign in5_2 = {pp9[0],pp9[1],pp9[2],pp9[3],pp9[4],pp9[5],pp9[6],pp9[7],pp9[8],pp9[9], pp9[10],pp9[11],pp9[12],pp9[13],pp9[14]};
    CLA15 CLA05(s5, c5, in5_1, in5_2);
    
    /* 6th CLA */
    wire [11:0] s6, in6_1, in6_2;
    wire c6;
    assign in6_1 = {pp10[1],pp10[2],pp10[3],pp10[4],pp10[5],pp10[6],pp10[7],pp10[8],pp10[9],pp10[10],pp10[11],pp10[12]};
    assign in6_2 = {pp11[0],pp11[1],pp11[2],pp11[3],pp11[4],pp11[5],pp11[6],pp11[7],pp11[8],pp11[9], pp11[10],pp11[11]};
    CLA12 CLA06(s6, c6, in6_1, in6_2);

    /* 7th CLA */
    wire [7:0] s7, in7_1, in7_2;
    wire c7;
    assign in7_1 = {pp12[1],pp12[2],pp12[3],pp12[4],pp12[5],pp12[6],pp12[7],pp12[8]};
    assign in7_2 = {pp13[0],pp13[1],pp13[2],pp13[3],pp13[4],pp13[5],pp13[6],pp13[7]};
    CLA8 CLA07(s7, c7, in7_1, in7_2);

    /* 8th CLA */
    wire [3:0] s8, in8_1, in8_2;
    wire c8;
    assign in8_1 = {pp14[1],pp14[2],pp14[3],pp14[4]};
    assign in8_2 = {pp15[0],pp15[1],pp15[2],pp15[3]};
    CLA4 CLA08(s8, c8, in8_1, in8_2);

     /* 9th CLA */
    wire [19:0] s9, in9_1, in9_2;
    wire c9;
    assign in9_1 = {s1[7],s1[8],s1[9],s1[10],s1[11],s1[12],s1[13],s1[14],s1[15],c1,    c2,     pp14[5],pp14[6],pp14[7],pp14[8],pp14[9],pp14[10],pp14[11],pp14[12],pp14[13]};
    assign in9_2 = {s2[5],s2[6],s2[7],s2[8], s2[9],s2[10],s2[11],s2[12],s2[13], s2[14],pp3[15],pp15[4],pp15[5],pp15[6],pp15[7],pp15[8],pp15[9], pp15[10],pp15[11],pp15[12]};
    CLA20 CLA09(s9, c9, in9_1, in9_2);

    /* 10th CLA */
    wire [16:0] sA, inA_1, inA_2;
    wire cA;
    assign inA_1 = {s3[5],s3[6],s3[7],s3[8],s3[9],s3[10],s3[11],s3[12],s3[13],s3[14],c3,    c7,    pp7[15],pp12[11],pp12[12],pp12[13],pp12[14]};
    assign inA_2 = {s4[3],s4[4],s4[5],s4[6],s4[7],s4[8], s4[9], s4[10],s4[11],s4[12],s4[13],s4[14],c4,     pp13[10],pp13[11],pp13[12],pp13[13]};
    CLA17 CLA0A(sA, cA, inA_1, inA_2);

    /* 11th CLA */
    wire [13:0] sB, inB_1, inB_2;
    wire cB;
    assign inB_1 = {s5[3],s5[4],s5[5],s5[6],s5[7],s5[8],s5[9],s5[10],s5[11],s5[12],s5[13],s5[14],pp9[15],pp10[15]};
    assign inB_2 = {s6[1],s6[2],s6[3],s6[4],s6[5],s6[6],s6[7],s6[8], s6[9], s6[10],s6[11],c6,    c5,     pp11[14]};
    CLA14 CLA0B(sB, cB, inB_1, inB_2);

    /* 12th CLA */
    wire [10:0] sC, inC_1, inC_2;
    wire cC;
    assign inC_1 = {s7[1],  s7[2],s7[3],s7[4],s7[5],s7[6],s7[7],  pp12[9],pp12[10],pp10[13],pp10[14]};
    assign inC_2 = {pp15[0],s8[0],s8[1],s8[2],s8[3],c8,   pp5[15],pp13[8],pp13[9], pp11[12],pp11[13]};
    CLA11 CLA0C(sC, cC, inC_1, inC_2);

    /* 13th CLA */
    wire [25:0] sD, inD_1, inD_2;
    wire cD;
    assign inD_1={s1[3],s1[4],s1[5],s1[6],s9[0],s9[1],s9[2],s9[3],s9[4],s9[5],s9[6],s9[7],s9[8],s9[9],s9[10],s9[11],s9[12],s9[13],s9[14],s9[15],s9[16],s9[17],s9[18],s9[19],c9,  pp14[15]};
    assign inD_2={s2[1],s2[2],s2[3],s2[4],s3[3],s3[4],sA[0],sA[1],sA[2],sA[3],sA[4],sA[5],sA[6],sA[7],sA[8], sA[9], sA[10],sA[11],sA[12],sA[13],sA[14],sA[15],sA[16],cA,pp13[15],pp15[14]};
    CLA26 CLA0D(sD, cD, inD_1, inD_2);

    /* 14th CLA */
    wire [22:0] sE, inE_1, inE_2;
    wire cE;
    assign inE_1 = {s3[1], s3[2],s4[1], s4[2],s5[1],  s5[2],sB[0],  sB[1],sB[2],sB[3],sB[4],sB[5],sB[6],sB[7],sB[8],sB[9],sB[10],sB[11],sB[12],sB[13],cB,     pp12[15],pp14[14]};
    assign inE_2 = {pp6[0],s4[0],pp8[0],s5[0],pp10[0],s6[0],pp12[0],s7[0],sC[0],sC[1],sC[2],sC[3],sC[4],sC[5],sC[6],sC[7],sC[8], sC[9], sC[10],cC,   pp11[15],pp13[14],pp15[13]};
    CLA23 CLA0E(sE, cE, inE_1, inE_2);

    /* Final Stage */
    wire [28:0] s, in_1, in_2;
    wire c;
    assign in_1 = {s1[1], s1[2],sD[0], sD[1],sD[2],sD[3],sD[4],sD[5],sD[6],sD[7],sD[8],sD[9],sD[10],sD[11],sD[12],sD[13],sD[14],sD[15],sD[16],sD[17],sD[18],sD[19],sD[20],sD[21],sD[22],sD[23],sD[24],sD[25],pp15[15]};
    assign in_2 = {pp2[0],s2[0],pp4[0],s3[0],sE[0],sE[1],sE[2],sE[3],sE[4],sE[5],sE[6],sE[7],sE[8], sE[9], sE[10],sE[11],sE[12],sE[13],sE[14],sE[15],sE[16],sE[17],sE[18],sE[19],sE[20],sE[21],sE[22],cE,   cD};
    CLA29 CLA(s, c, in_1, in_2);

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
    assign product[15] = s[13];
    assign product[16] = s[14];
    assign product[17] = s[15];
    assign product[18] = s[16];
    assign product[19] = s[17];
    assign product[20] = s[18];
    assign product[21] = s[19];
    assign product[22] = s[20];
    assign product[23] = s[21];
    assign product[24] = s[22];
    assign product[25] = s[23];
    assign product[26] = s[24];
    assign product[27] = s[25];
    assign product[28] = s[26];
    assign product[29] = s[27];
    assign product[30] = s[28];
    assign product[31] = c;
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

module CLA14(output [13:0] sum,
            output cout,
            input [13:0] in1, in2);

    wire [13:0] G;
    wire [13:0] P; // Propagate
    wire [13:0] C;

    assign G[0]  = in1[13] & in2[13];
    assign G[1]  = in1[12] & in2[12];
    assign G[2]  = in1[11] & in2[11];
    assign G[3]  = in1[10] & in2[10];
    assign G[4]  = in1[9]  & in2[9];
    assign G[5]  = in1[8]  & in2[8];
    assign G[6]  = in1[7]  & in2[7];
    assign G[7]  = in1[6]  & in2[6];
    assign G[8]  = in1[5]  & in2[5];
    assign G[9]  = in1[4]  & in2[4];
    assign G[10] = in1[3]  & in2[3];
    assign G[11] = in1[2]  & in2[2];
    assign G[12] = in1[1]  & in2[1];
    assign G[13] = in1[0]  & in2[0];
    assign P[0]  = in1[13] ^ in2[13];
    assign P[1]  = in1[12] ^ in2[12];
    assign P[2]  = in1[11] ^ in2[11];
    assign P[3]  = in1[10] ^ in2[10];
    assign P[4]  = in1[9]  ^ in2[9];
    assign P[5]  = in1[8]  ^ in2[8];
    assign P[6]  = in1[7]  ^ in2[7];
    assign P[7]  = in1[6]  ^ in2[6];
    assign P[8]  = in1[5]  ^ in2[5];
    assign P[9]  = in1[4]  ^ in2[4];
    assign P[10] = in1[3]  ^ in2[3];
    assign P[11] = in1[2]  ^ in2[2];
    assign P[12] = in1[1]  ^ in2[1];
    assign P[13] = in1[0]  ^ in2[0];

    assign C[0] = 0; 
    assign C[1] = G[0];
    assign C[2] = G[1] | (P[1] & C[1]);
    assign C[3] = G[2] | (P[2] & C[2]);
    assign C[4] = G[3] | (P[3] & C[3]);
    assign C[5] = G[4] | (P[4] & C[4]);
    assign C[6] = G[5] | (P[5] & C[5]);
    assign C[7] = G[6] | (P[6] & C[6]);
    assign C[8] = G[7] | (P[7] & C[7]);
    assign C[9] = G[8] | (P[8] & C[8]);
    assign C[10]= G[9] | (P[9] & C[9]);
    assign C[11]= G[10] | (P[10] & C[10]);
    assign C[12]= G[11] | (P[11] & C[11]);
    assign C[13]= G[12] | (P[12] & C[12]);
    assign cout = G[13] | (P[13] & C[13]);
    assign sum = P ^ C;
endmodule

             output cout,
             input [28:0] in1, in2);

    wire [28:0] G;
    wire [28:0] P;
    wire [28:0] C;

    assign G[0]  = in1[28] & in2[28];
    assign G[1]  = in1[27] & in2[27];
    assign G[2]  = in1[26] & in2[26];
    assign G[3]  = in1[25] & in2[25];
    assign G[4]  = in1[24] & in2[24];
    assign G[5]  = in1[23] & in2[23];
    assign G[6]  = in1[22] & in2[22];
    assign G[7]  = in1[21] & in2[21];
    assign G[8]  = in1[20] & in2[20];
    assign G[9] = in1[19] & in2[19];
    assign G[10] = in1[18] & in2[18];
    assign G[11] = in1[17] & in2[17];
    assign G[12] = in1[16] & in2[16];
    assign G[13] = in1[15] & in2[15];
    assign G[14] = in1[14] & in2[14];
    assign G[15] = in1[13] & in2[13];
    assign G[16] = in1[12] & in2[12];
    assign G[17] = in1[11] & in2[11];
    assign G[18] = in1[10] & in2[10];
    assign G[19] = in1[9]  & in2[9];
    assign G[20] = in1[8]  & in2[8];
    assign G[21] = in1[7]  & in2[7];
    assign G[22] = in1[6]  & in2[6];
    assign G[23] = in1[5]  & in2[5];
    assign G[24] = in1[4]  & in2[4];
    assign G[25] = in1[3]  & in2[3];
    assign G[26] = in1[2]  & in2[2];
    assign G[27] = in1[1]  & in2[1];
    assign G[28] = in1[0]  & in2[0];

    assign P[0]  = in1[28] ^ in2[28];
    assign P[1]  = in1[27] ^ in2[27];
    assign P[2]  = in1[26] ^ in2[26];
    assign P[3]  = in1[25] ^ in2[25];
    assign P[4]  = in1[24] ^ in2[24];
    assign P[5]  = in1[23] ^ in2[23];
    assign P[6]  = in1[22] ^ in2[22];
    assign P[7]  = in1[21] ^ in2[21];
    assign P[8]  = in1[20] ^ in2[20];
    assign P[9] = in1[19] ^ in2[19];
    assign P[10] = in1[18] ^ in2[18];
    assign P[11] = in1[17] ^ in2[17];
    assign P[12] = in1[16] ^ in2[16];
    assign P[13] = in1[15] ^ in2[15];
    assign P[14] = in1[14] ^ in2[14];
    assign P[15] = in1[13] ^ in2[13];
    assign P[16] = in1[12] ^ in2[12];
    assign P[17] = in1[11] ^ in2[11];
    assign P[18] = in1[10] ^ in2[10];
    assign P[19] = in1[9]  ^ in2[9];
    assign P[20] = in1[8]  ^ in2[8];
    assign P[21] = in1[7]  ^ in2[7];
    assign P[22] = in1[6]  ^ in2[6];
    assign P[23] = in1[5]  ^ in2[5];
    assign P[24] = in1[4]  ^ in2[4];
    assign P[25] = in1[3]  ^ in2[3];
    assign P[26] = in1[2]  ^ in2[2];
    assign P[27] = in1[1]  ^ in2[1];
    assign P[28] = in1[0]  ^ in2[0];

    assign C[0]  = 0;
    assign C[1]  = G[0];
    assign C[2]  = G[1]  | (P[1] & C[1]);
    assign C[3]  = G[2]  | (P[2] & C[2]);
    assign C[4]  = G[3]  | (P[3] & C[3]);
    assign C[5]  = G[4]  | (P[4] & C[4]);
    assign C[6]  = G[5]  | (P[5] & C[5]);
    assign C[7]  = G[6]  | (P[6] & C[6]);
    assign C[8]  = G[7]  | (P[7] & C[7]);
    assign C[9]  = G[8]  | (P[8] & C[8]);
    assign C[10] = G[9]  | (P[9] & C[9]);
    assign C[11] = G[10] | (P[10] & C[10]);
    assign C[12] = G[11] | (P[11] & C[11]);
    assign C[13] = G[12] | (P[12] & C[12]);
    assign C[14] = G[13] | (P[13] & C[13]);
    assign C[15] = G[14] | (P[14] & C[14]);
    assign C[16] = G[15] | (P[15] & C[15]);
    assign C[17] = G[16] | (P[16] & C[16]);
    assign C[18] = G[17] | (P[17] & C[17]);
    assign C[19] = G[18] | (P[18] & C[18]);
    assign C[20] = G[19] | (P[19] & C[19]);
    assign C[21] = G[20] | (P[20] & C[20]);
    assign C[22] = G[21] | (P[21] & C[21]);
    assign C[23] = G[22] | (P[22] & C[22]);
    assign C[24] = G[23] | (P[23] & C[23]);
    assign C[25] = G[24] | (P[24] & C[24]);
    assign C[26] = G[25] | (P[25] & C[25]);
    assign C[27] = G[26] | (P[26] & C[26]);
    assign C[28] = G[27] | (P[27] & C[27]);
    assign cout  = G[28] | (P[28] & C[28]);
    assign sum   = P ^ C;
endmodule
