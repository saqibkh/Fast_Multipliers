module russian_peasant_new_unsigned_multiplier_8(product, A, B);
    /* This implementation uses carry look-ahead adders of variable lengths
     * that are 12-13 bits long, even for final stage. 
     * Area: 1069.065369
     * Power: 0.4808
     * Timing: 1.27 */

    input [7:0] A, B;
    output [15:0] product;

    wire [15:0] product;

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

    /* 1st CLA */
    wire [7:0] G1, P1, C1;
    assign G1[0] = pp0[1] & pp1[0];
    assign G1[1] = pp0[2] & pp1[1];
    assign G1[2] = pp0[3] & pp1[2];
    assign G1[3] = pp0[4] & pp1[3];
    assign G1[4] = pp0[5] & pp1[4];
    assign G1[5] = pp0[6] & pp1[5];
    assign G1[6] = pp0[7] & pp1[6];
    assign G1[7] = 0      & pp1[7];
    assign P1[0] = pp0[1] ^ pp1[0];
    assign P1[1] = pp0[2] ^ pp1[1];
    assign P1[2] = pp0[3] ^ pp1[2];
    assign P1[3] = pp0[4] ^ pp1[3];
    assign P1[4] = pp0[5] ^ pp1[4];
    assign P1[5] = pp0[6] ^ pp1[5];
    assign P1[6] = pp0[7] ^ pp1[6];
    assign P1[7] = 0      ^ pp1[7];
    assign C1[0] = 0;
    assign C1[1] = G1[0] | (P1[0] & C1[0]);
    assign C1[2] = G1[1] | (P1[1] & C1[1]);
    assign C1[3] = G1[2] | (P1[2] & C1[2]);
    assign C1[4] = G1[3] | (P1[3] & C1[3]);
    assign C1[5] = G1[4] | (P1[4] & C1[4]);
    assign C1[6] = G1[5] | (P1[5] & C1[5]);
    assign C1[7] = G1[6] | (P1[6] & C1[6]);
    assign c1    = G1[7] | (P1[7] & C1[7]);
    assign s11  = P1[0];
    assign s12  = P1[1] ^ C1[1];
    assign s13  = P1[2] ^ C1[2];
    assign s14  = P1[3] ^ C1[3];
    assign s15  = P1[4] ^ C1[4];
    assign s16  = P1[5] ^ C1[5];
    assign s17  = P1[6] ^ C1[6];
    assign s18  = P1[7] ^ C1[7];

    assign product[1] = s11;
    
    /* 2nd CLA */
    wire [6:0] G2, P2, C2;
    assign G2[0] = pp2[1] & pp3[0];
    assign G2[1] = pp2[2] & pp3[1];
    assign G2[2] = pp2[3] & pp3[2];
    assign G2[3] = pp2[4] & pp3[3];
    assign G2[4] = pp2[5] & pp3[4];
    assign G2[5] = pp2[6] & pp3[5];
    assign G2[6] = pp2[7] & pp3[6];
    assign P2[0] = pp2[1] ^ pp3[0];
    assign P2[1] = pp2[2] ^ pp3[1];
    assign P2[2] = pp2[3] ^ pp3[2];
    assign P2[3] = pp2[4] ^ pp3[3];
    assign P2[4] = pp2[5] ^ pp3[4];
    assign P2[5] = pp2[6] ^ pp3[5];
    assign P2[6] = pp2[7] ^ pp3[6];
    assign C2[0] = 0;
    assign C2[1] = G2[0] | (P2[0] & C2[0]);
    assign C2[2] = G2[1] | (P2[1] & C2[1]);
    assign C2[3] = G2[2] | (P2[2] & C2[2]);
    assign C2[4] = G2[3] | (P2[3] & C2[3]);
    assign C2[5] = G2[4] | (P2[4] & C2[4]);
    assign C2[6] = G2[5] | (P2[5] & C2[5]);
    assign c2    = G2[6] | (P2[6] & C2[6]);
    assign s21   = P2[0];
    assign s22   = P2[1] ^ C2[1];
    assign s23   = P2[2] ^ C2[2];
    assign s24   = P2[3] ^ C2[3];
    assign s25   = P2[4] ^ C2[4];
    assign s26   = P2[5] ^ C2[5];
    assign s27   = P2[6] ^ C2[6];

    /* 3rd CLA */
    wire [6:0] G3, P3, C3;
    assign G3[0] = pp4[1] & pp5[0];
    assign G3[1] = pp4[2] & pp5[1];
    assign G3[2] = pp4[3] & pp5[2];
    assign G3[3] = pp4[4] & pp5[3];
    assign G3[4] = pp4[5] & pp5[4];
    assign G3[5] = pp4[6] & pp5[5];
    assign G3[6] = pp4[7] & pp5[6];
    assign P3[0] = pp4[1] ^ pp5[0];
    assign P3[1] = pp4[2] ^ pp5[1];
    assign P3[2] = pp4[3] ^ pp5[2];
    assign P3[3] = pp4[4] ^ pp5[3];
    assign P3[4] = pp4[5] ^ pp5[4];
    assign P3[5] = pp4[6] ^ pp5[5];
    assign P3[6] = pp4[7] ^ pp5[6];
    assign C3[0] = 0;
    assign C3[1] = G3[0] | (P3[0] & C3[0]);
    assign C3[2] = G3[1] | (P3[1] & C3[1]);
    assign C3[3] = G3[2] | (P3[2] & C3[2]);
    assign C3[4] = G3[3] | (P3[3] & C3[3]);
    assign C3[5] = G3[4] | (P3[4] & C3[4]);
    assign C3[6] = G3[5] | (P3[5] & C3[5]);
    assign c3    = G3[6] | (P3[6] & C3[6]);
    assign s31   = P3[0];
    assign s32   = P3[1] ^ C3[1];
    assign s33   = P3[2] ^ C3[2];
    assign s34   = P3[3] ^ C3[3];
    assign s35   = P3[4] ^ C3[4];
    assign s36   = P3[5] ^ C3[5];
    assign s37   = P3[6] ^ C3[6];

    /* 4th CLA */
    wire [3:0] G4, P4, C4;
    assign G4[0] = pp6[1] & pp7[0];
    assign G4[1] = pp6[2] & pp7[1];
    assign G4[2] = pp6[3] & pp7[2];
    assign G4[3] = pp6[4] & pp7[3];
    assign P4[0] = pp6[1] ^ pp7[0];
    assign P4[1] = pp6[2] ^ pp7[1];
    assign P4[2] = pp6[3] ^ pp7[2];
    assign P4[3] = pp6[4] ^ pp7[3];
    assign C4[0] = 0;
    assign C4[1] = G4[0] | (P4[0] & C4[0]);
    assign C4[2] = G4[1] | (P4[1] & C4[1]);
    assign C4[3] = G4[2] | (P4[2] & C4[2]);
    assign c4    = G4[3] | (P4[3] & C4[3]);
    assign s41   = P4[0];
    assign s42   = P4[1] ^ C4[1];
    assign s43   = P4[2] ^ C4[2];
    assign s44   = P4[3] ^ C4[3];

    /* 5th CLA */
    wire [9:0] G5, P5, C5;
    assign G5[0] = s14    & s22;
    assign G5[1] = s15    & s23;
    assign G5[2] = s16    & s24;
    assign G5[3] = s17    & s25;
    assign G5[4] = s18    & s26;
    assign G5[5] = c1     & s27;
    assign G5[6] = pp3[7] & c2;
    assign G5[7] = pp6[5] & pp7[4];
    assign G5[8] = pp5[7] & pp6[6];
    assign G5[9] = pp6[7] & pp7[6];
    assign P5[0] = s14    ^ s22;
    assign P5[1] = s15    ^ s23;
    assign P5[2] = s16    ^ s24;
    assign P5[3] = s17    ^ s25;
    assign P5[4] = s18    ^ s26;
    assign P5[5] = c1     ^ s27;
    assign P5[6] = pp3[7] ^ c2;
    assign P5[7] = pp6[5] ^ pp7[4];
    assign P5[8] = pp5[7] ^ pp6[6];
    assign P5[9] = pp6[7] ^ pp7[6];
    assign C5[0] = 0;
    assign C5[1] = G5[0] | (P5[0] & C5[0]);
    assign C5[2] = G5[1] | (P5[1] & C5[1]);
    assign C5[3] = G5[2] | (P5[2] & C5[2]);
    assign C5[4] = G5[3] | (P5[3] & C5[3]);
    assign C5[5] = G5[4] | (P5[4] & C5[4]);
    assign C5[6] = G5[5] | (P5[5] & C5[5]);
    assign C5[7] = G5[6] | (P5[6] & C5[6]);
    assign C5[8] = G5[7] | (P5[7] & C5[7]);
    assign C5[9] = G5[8] | (P5[8] & C5[8]);
    assign c5    = G5[9] | (P5[9] & C5[9]);
    assign s51   = P5[0];
    assign s52   = P5[1] ^ C5[1];
    assign s53   = P5[2] ^ C5[2];
    assign s54   = P5[3] ^ C5[3];
    assign s55   = P5[4] ^ C5[4];
    assign s56   = P5[5] ^ C5[5];
    assign s57   = P5[6] ^ C5[6];
    assign s58   = P5[7] ^ C5[7];
    assign s59   = P5[8] ^ C5[8];
    assign s510  = P5[9] ^ C5[9];

    /* 6th CLA */
    wire [6:0] G6, P6, C6;
    assign G6[0] = s32    & pp6[0];
    assign G6[1] = s33    & s41;
    assign G6[2] = s34    & s42;
    assign G6[3] = s35    & s43;
    assign G6[4] = s36    & s44;
    assign G6[5] = s37    & c4;
    assign G6[6] = pp7[5] & c3;
    assign P6[0] = s32    ^ pp6[0];
    assign P6[1] = s33    ^ s41;
    assign P6[2] = s34    ^ s42;
    assign P6[3] = s35    ^ s43;
    assign P6[4] = s36    ^ s44;
    assign P6[5] = s37    ^ c4;
    assign P6[6] = pp7[5] ^ c3;
    assign C6[0] = 0;
    assign C6[1] = G6[0] | (P6[0] & C6[0]);
    assign C6[2] = G6[1] | (P6[1] & C6[1]);
    assign C6[3] = G6[2] | (P6[2] & C6[2]);
    assign C6[4] = G6[3] | (P6[3] & C6[3]);
    assign C6[5] = G6[4] | (P6[4] & C6[4]);
    assign C6[6] = G6[5] | (P6[5] & C6[5]);
    assign c6    = G6[6] | (P6[6] & C6[6]);
    assign s61   = P6[0];
    assign s62   = P6[1] ^ C6[1];
    assign s63   = P6[2] ^ C6[2];
    assign s64   = P6[3] ^ C6[3];
    assign s65   = P6[4] ^ C6[4];
    assign s66   = P6[5] ^ C6[5];
    assign s67   = P6[6] ^ C6[6];

    /* Final CLA */
    wire [12:0] G, P, C;
    assign G[0]  = s12    & pp2[0];
    assign G[1]  = s13    & s21;
    assign G[2]  = s51    & pp4[0];
    assign G[3]  = s52    & s31;
    assign G[4]  = s53    & s61;
    assign G[5]  = s54    & s62;
    assign G[6]  = s55    & s63;
    assign G[7]  = s56    & s64;
    assign G[8]  = s57    & s65;
    assign G[9]  = s58    & s66;
    assign G[10] = s59    & s67;
    assign G[11] = s510   & c6;
    assign G[12] = pp7[7] & c5;
    assign P[0]  = s12    ^ pp2[0];
    assign P[1]  = s13    ^ s21;
    assign P[2]  = s51    ^ pp4[0];
    assign P[3]  = s52    ^ s31;
    assign P[4]  = s53    ^ s61;
    assign P[5]  = s54    ^ s62;
    assign P[6]  = s55    ^ s63;
    assign P[7]  = s56    ^ s64;
    assign P[8]  = s57    ^ s65;
    assign P[9]  = s58    ^ s66;
    assign P[10] = s59    ^ s67;
    assign P[11] = s510   ^ c6;
    assign P[12] = pp7[7] ^ c5;
    assign C[0]  = 0;
    assign C[1]  = G[0]  | (P[0] & C[0]);
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
    assign product[15] = G[12] | (P[12] & C[12]);
    assign product[2]  = P[0];
    assign product[3]  = P[1]  ^ C[1];
    assign product[4]  = P[2]  ^ C[2];
    assign product[5]  = P[3]  ^ C[3];
    assign product[6]  = P[4]  ^ C[4];
    assign product[7]  = P[5]  ^ C[5];
    assign product[8]  = P[6]  ^ C[6];
    assign product[9]  = P[7]  ^ C[7];
    assign product[10] = P[8]  ^ C[8];
    assign product[11] = P[9]  ^ C[9];
    assign product[12] = P[10] ^ C[10];
    assign product[13] = P[11] ^ C[11];
    assign product[14] = P[12] ^ C[12];
endmodule


module russian_peasant_new_unsigned_multiplier_8_attempt2(product, A, B);
    /* This attempt is from Wesley Chu design of using CLA4 for partial
     * product reduction. It uses only CLA4 with and without carry and uses HA
     * and FAs with a 14bit CLA at the end 
     * Area: 1017.911669
     * Power: 0.5495
     * Timing: 1.25*/
    input [7:0] A, B;
    output [15:0] product;

    wire [15:0] product;

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

    /* 1st CLA */
    wire [3:0] s1, in1_1, in1_2;
    wire c1;
    assign in1_1 = {pp0[2], pp0[3], pp0[4], pp0[5]};
    assign in1_2 = {pp1[1], pp1[2], pp1[3], pp1[4]};
    CLA4_c CLA01(s1, c1, in1_1, in1_2, pp2[0]);

    /* 2nd CLA */
    wire [3:0] s2, in2_1, in2_2;
    wire c2;
    assign in2_1 = {pp0[6], pp0[7], pp1[7], pp2[7]};
    assign in2_2 = {pp1[5], pp1[6], pp2[6], pp3[6]};
    CLA4 CLA02(s2, c2, in2_1, in2_2);

    /* 3rd CLA */
    wire [3:0] s3, in3_1, in3_2;
    wire c3;
    assign in3_1 = {pp2[2], pp2[3], pp2[4], pp2[5]};
    assign in3_2 = {pp3[1], pp3[2], pp3[3], pp3[4]};
    CLA4_c CLA03(s3, c3, in3_1, in3_2, pp4[0]);

    /* 4th CLA */
    wire [3:0] s4, in4_1, in4_2;
    wire c4;
    assign in4_1 = {pp4[2], pp4[3], pp4[4], pp4[5]};
    assign in4_2 = {pp5[1], pp5[2], pp5[3], pp5[4]};
    CLA4_c CLA04(s4, c4, in4_1, in4_2, pp6[0]);

    /* 5th CLA */
    wire [3:0] s5, in5_1, in5_2;
    wire c5;
    assign in5_1 = {pp4[6], pp4[7], pp5[7], pp6[7]};
    assign in5_2 = {pp5[5], pp5[6], pp6[6], pp7[6]};
    CLA4_c CLA05(s5, c5, in5_1, in5_2, pp3[7]);

    /* 6th CLA */
    wire [3:0] s6, in6_1, in6_2;
    wire c6;
    assign in6_1 = {pp6[2], pp6[3], pp6[4], pp6[5]};
    assign in6_2 = {pp7[1], pp7[2], pp7[3], pp7[4]};
    CLA4_c CLA06(s6, c6, in6_1, in6_2, pp3[5]);

    /* 7th CLA */
    wire [3:0] s7, in7_1, in7_2;
    wire c7;
    assign in7_1 = {s1[1], s1[2], s1[3], c1};
    assign in7_2 = {pp2[1], s3[0], s3[1], s2[0]};
    CLA4_c CLA07(s7, c7, in7_1, in7_2, pp3[0]);

    /*8th CLA */
    wire [3:0] s8, in8_1, in8_2;
    wire c8;
    assign in8_1 = {s2[1],  s2[2], s6[1], s5[0]};
    assign in8_2 = {pp6[1], s6[0], s4[3], s6[2]};
    CLA4_c CLA08(s8, c8, in8_1, in8_2, pp7[0]);

    /* 9th CLA */
    wire [3:0] s9, in9_1, in9_2;
    wire c9;
    assign in9_1 = {pp4[1], s3[2], s3[3], c3};
    assign in9_2 = {pp5[0], s4[0], s4[1], s4[2]};
    CLA4 CLA09(s9, c9, in9_1, in9_2);

    wire sA, sB, sC, sD, sE, sF;
    wire cA, cB, cC, cD, cE, cF;
    full_adder fa01(sA, cA, s8[0], s9[2], c7);
    half_adder ha01(sB, cB, s8[1], s9[3]);
    full_adder fa02(sC, cC, s8[2], s2[3], c9);
    full_adder fa03(sD, cD, s8[3], c4,    c2);
    full_adder fa04(sE, cE, s5[1], s6[3], c8);
    full_adder fa05(sF, cF, s5[2], c6,    pp7[5]);

    /*Final Stage*/
    wire [13:0] G, P, C;
    and AND01(G[0], pp0[1], pp1[0]);
    and AND02(G[1], s1[0] , 0);
    and AND03(G[2], s7[0] , 0);
    and AND04(G[3], s7[1] , 0);
    and AND05(G[4], s7[2] , s9[0]);
    and AND06(G[5], s7[3] , s9[1]);
    and AND07(G[6], sA    , 0);
    and AND08(G[7], sB    , cA);
    and AND09(G[8], sC    , cB);
    and AND10(G[9], sD    , cC);
    and AND11(G[10],sE    , cD);
    and AND12(G[11],sF    , cE);
    and AND13(G[12],s5[3] , cF);
    and AND14(G[13],pp7[7], c5);

    xor XOR01(P[0],  pp0[1], pp1[0]);
    xor XOR02(P[1],  s1[0],  0);
    xor XOR03(P[2],  s7[0],  0);
    xor XOR04(P[3],  s7[1],  0);
    xor XOR05(P[4],  s7[2],  s9[0]);
    xor XOR06(P[5],  s7[3],  s9[1]);
    xor XOR07(P[6],  sA,     0);
    xor XOR08(P[7],  sB,     cA);
    xor XOR09(P[8],  sC,     cB);
    xor XOR10(P[9],  sD,     cC);
    xor XOR11(P[10], sE,     cD);
    xor XOR12(P[11], sF,     cE);
    xor XOR13(P[12], s5[3],  cF);
    xor XOR14(P[13], pp7[7], c5);

    assign C[0]  = 0;
    assign C[1]  = G[0]  | (P[0]  & C[0]);
    assign C[2]  = G[1]  | (P[1]  & C[1]);
    assign C[3]  = G[2]  | (P[2]  & C[2]);
    assign C[4]  = G[3]  | (P[3]  & C[3]);
    assign C[5]  = G[4]  | (P[4]  & C[4]);
    assign C[6]  = G[5]  | (P[5]  & C[5]);
    assign C[7]  = G[6]  | (P[6]  & C[6]);
    assign C[8]  = G[7]  | (P[7]  & C[7]);
    assign C[9]  = G[8]  | (P[8]  & C[8]);
    assign C[10] = G[9]  | (P[9]  & C[9]);
    assign C[11] = G[10] | (P[10] & C[10]);
    assign C[12] = G[11] | (P[11] & C[11]);
    assign C[13] = G[12] | (P[12] & C[12]);
    assign product[15] = G[13] | (P[13] & C[13]);
    assign product[1]  = P[0];
    assign product[2]  = P[1]  ^ C[1];
    assign product[3]  = P[2]  ^ C[2];
    assign product[4]  = P[3]  ^ C[3];
    assign product[5]  = P[4]  ^ C[4];
    assign product[6]  = P[5]  ^ C[5];
    assign product[7]  = P[6]  ^ C[6];
    assign product[8]  = P[7]  ^ C[7];
    assign product[9]  = P[8]  ^ C[8];
    assign product[10] = P[9]  ^ C[9];
    assign product[11] = P[10] ^ C[10];
    assign product[12] = P[11] ^ C[11];
    assign product[13] = P[12] ^ C[12];
    assign product[14] = P[13] ^ C[13];
endmodule


module russian_peasant_new_unsigned_multiplier_8_attempt1(product, A, B);
    /* This attempt is from Wesley Chu design of using CLA4 for partial
     * product reduction. It uses only CLA4 with and without carry and uses
     * HA and FAs with a 14bit RCA at the end
     * Area: 1011.810769
     * Power: 0.5463 
     * Timing: 1.57*/
    input [7:0] A, B;
    output [15:0] product;

    wire [15:0] product;

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

/* 1st CLA */
    wire [3:0] s1, in1_1, in1_2;
    wire c1;
    assign in1_1 = {pp0[2], pp0[3], pp0[4], pp0[5]};
    assign in1_2 = {pp1[1], pp1[2], pp1[3], pp1[4]};
    CLA4_c CLA01(s1, c1, in1_1, in1_2, pp2[0]);

    /* 2nd CLA */
    wire [3:0] s2, in2_1, in2_2;
    wire c2;
    assign in2_1 = {pp0[6], pp0[7], pp1[7], pp2[7]};
    assign in2_2 = {pp1[5], pp1[6], pp2[6], pp3[6]};
    CLA4 CLA02(s2, c2, in2_1, in2_2);

    /* 3rd CLA */
    wire [3:0] s3, in3_1, in3_2;
    wire c3;
    assign in3_1 = {pp2[2], pp2[3], pp2[4], pp2[5]};
    assign in3_2 = {pp3[1], pp3[2], pp3[3], pp3[4]};
    CLA4_c CLA03(s3, c3, in3_1, in3_2, pp4[0]);

    /* 4th CLA */
    wire [3:0] s4, in4_1, in4_2;
    wire c4;
    assign in4_1 = {pp4[2], pp4[3], pp4[4], pp4[5]};
    assign in4_2 = {pp5[1], pp5[2], pp5[3], pp5[4]};
    CLA4_c CLA04(s4, c4, in4_1, in4_2, pp6[0]);

    /* 5th CLA */
    wire [3:0] s5, in5_1, in5_2;
    wire c5;
    assign in5_1 = {pp4[6], pp4[7], pp5[7], pp6[7]};
    assign in5_2 = {pp5[5], pp5[6], pp6[6], pp7[6]};
    CLA4_c CLA05(s5, c5, in5_1, in5_2, pp3[7]);

    /* 6th CLA */
    wire [3:0] s6, in6_1, in6_2;
    wire c6;
    assign in6_1 = {pp6[2], pp6[3], pp6[4], pp6[5]};
    assign in6_2 = {pp7[1], pp7[2], pp7[3], pp7[4]};
    CLA4_c CLA06(s6, c6, in6_1, in6_2, pp3[5]);

    /* 7th CLA */
    wire [3:0] s7, in7_1, in7_2;
    wire c7;
    assign in7_1 = {s1[1], s1[2], s1[3], c1};
    assign in7_2 = {pp2[1], s3[0], s3[1], s2[0]};
    CLA4_c CLA07(s7, c7, in7_1, in7_2, pp3[0]);

    /*8th CLA */
    wire [3:0] s8, in8_1, in8_2;
    wire c8;
    assign in8_1 = {s2[1],  s2[2], s6[1], s5[0]};
    assign in8_2 = {pp6[1], s6[0], s4[3], s6[2]};
    CLA4_c CLA08(s8, c8, in8_1, in8_2, pp7[0]);

    /* 9th CLA */
    wire [3:0] s9, in9_1, in9_2;
    wire c9;
    assign in9_1 = {pp4[1], s3[2], s3[3], c3};
    assign in9_2 = {pp5[0], s4[0], s4[1], s4[2]};
    CLA4 CLA09(s9, c9, in9_1, in9_2);

    wire sA, sB, sC, sD, sE, sF;
    wire cA, cB, cC, cD, cE, cF;
    full_adder fa01(sA, cA, s8[0], s9[2], c7);
    half_adder ha01(sB, cB, s8[1], s9[3]);
    full_adder fa02(sC, cC, s8[2], s2[3], c9);
    full_adder fa03(sD, cD, s8[3], c4,    c2);
    full_adder fa04(sE, cE, s5[1], s6[3], c8);
    full_adder fa05(sF, cF, s5[2], c6,    pp7[5]);

    /*Final Stage*/
    wire [13:0] G, P, C;
    and AND01(G[0], pp0[1], pp1[0]);
    and AND02(G[1], s1[0] , 0);
    and AND03(G[2], s7[0] , 0);
    and AND04(G[3], s7[1] , 0);
    and AND05(G[4], s7[2] , s9[0]);
    and AND06(G[5], s7[3] , s9[1]);
    and AND07(G[6], sA    , 0);
    and AND08(G[7], sB    , cA);
    and AND09(G[8], sC    , cB);
    and AND10(G[9], sD    , cC);
    and AND11(G[10],sE    , cD);
    and AND12(G[11],sF    , cE);
    and AND13(G[12],s5[3] , cF);
    and AND14(G[13],pp7[7], c5);


    half_adder ha02(product[1],  cc1,         pp0[1], pp1[0]);
    half_adder ha03(product[2],  cc2,         s1[0], cc1);
    half_adder ha04(product[3],  cc3,         s7[0], cc2);
    half_adder ha05(product[4],  cc4,         s7[1], cc3);
    full_adder fa06(product[5],  cc5,         s7[2], s9[0], cc4);
    full_adder fa07(product[6],  cc6,         s7[3], s9[1], cc5);
    half_adder ha06(product[7],  cc7,         sA,    cc6);
    full_adder fa08(product[8],  cc8,         sB,    cA, cc7);
    full_adder fa09(product[9],  cc9,         sC,    cB, cc8);
    full_adder fa10(product[10], cc10,        sD,    cC, cc9);
    full_adder fa11(product[11], cc11,        sE,    cD, cc10);
    full_adder fa12(product[12], cc12,        sF,    cE, cc11);
    full_adder fa13(product[13], cc13,        s5[3], cF, cc12);
    full_adder fa14(product[14], product[15], pp7[7],c5, cc13);
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

  assign C[0] = 0;  /* Carry_out = Ci+1 = Gi + Pi*Ci */
  assign C[1] = G[0] | (P[0] & C[0]);
  assign C[2] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & C[0]);
  assign C[3] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & C[0]);
  assign cout = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) |(P[3] & P[2] & P[1] & P[0] & C[0]);
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


  assign C[0] = cin;  /* Carry_out = Ci+1 = Gi + Pi*Ci */
  assign C[1] = G[0] | (P[0] & C[0]);
  assign C[2] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & C[0]);
  assign C[3] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & C[0]);
  assign cout = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) |(P[3] & P[2] & P[1] & P[0] & C[0]);
  assign sum = P ^ C;
endmodule
