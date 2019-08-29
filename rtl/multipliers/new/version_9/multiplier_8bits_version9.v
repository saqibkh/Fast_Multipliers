module multiplier_8bits_version9(product, A, B);

    /* This approach uses long kogge-stone adder and FAs
     * Area: 1784.747848
     * Power: 0.7815mW
     * Timing: 1.33ns
     */
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
    wire[10:0] s0, in0_1, in0_2;
    wire c0;
    assign in0_1 = {pp0[2],pp0[3],pp0[4],pp0[5],pp0[6],pp0[7],pp1[7],pp2[7],pp3[7],pp4[7],pp5[7]};
    assign in0_2 = {pp1[1],pp1[2],pp1[3],pp1[4],pp1[5],pp1[6],pp2[6],pp3[6],pp4[6],pp5[6],pp6[6]};
    kogge_stone_11 KS_0(s0, c0, in0_1, in0_2);

    /*Stage 2*/
    wire[8:0] s1, in1_1, in1_2;
    wire c1;
    assign in1_1 = {pp2[1],pp2[2],pp2[3],pp2[4],pp2[5],pp3[5],pp4[5],pp5[5],pp6[5]};
    assign in1_2 = {pp3[0],pp3[1],pp3[2],pp3[3],pp3[4],pp4[4],pp5[4],pp6[4],pp7[4]};
    kogge_stone_9 KS_1(s1, c1, in1_1, in1_2);

    full_adder HA2(s2, c2, pp6[7], pp7[6], c0);

    /*Stage 3*/
    wire[6:0] s3, in3_1, in3_2;
    wire c3;
    assign in3_1 = {pp4[0],pp4[1],pp4[2],pp4[3],pp5[3],pp6[3],pp7[3]};
    assign in3_2 = {s0[2],pp5[0],pp5[1],pp5[2],pp6[2],pp7[2],s0[8]};
    kogge_stone_7 KS_3(s3, c3, in3_1, in3_2);

    full_adder HA4(s4, c4, pp7[5], s0[10], c1);

    /*Stage 4*/
    wire[4:0] s5, in5_1, in5_2;
    wire c5;
    assign in5_1 = {s0[3],pp6[0],pp6[1],pp7[1],s0[7]};
    assign in5_2 = {s1[2],s0[4],pp7[0],s0[6],s1[6]};
    kogge_stone_5 KS_5(s5, c5, in5_1, in5_2);

    full_adder HA6(s6, c6, s0[9], s1[8], c3);

    /*Stage 5*/
    wire[2:0] s7, in7_1, in7_2;
    wire c7;
    assign in7_1 = {s1[3],s0[5],s1[5]};
    assign in7_2 = {s3[2],s1[4],s3[4]};
    kogge_stone_3 KS_7(s7, c7, in7_1, in7_2);

    full_adder HA8(s8, c8, s1[7], s3[6], c5);

    /*Stage 6*/

    full_adder HA9(s9, c9, s3[3], s5[2], s7[1]);

    full_adder HA10(s10, c10, s3[5], s5[4], c7);

    /*Stage 7*/

    full_adder HA11(s11, c11, s5[3], s7[2], c9);


    wire[13:0] s, in_1, in_2;
    wire c;
    assign in_1 = {pp0[1],pp2[0],s0[1],s1[1],s3[1],s5[1],s9,s11,s10,c10,s6,s4,s2,pp7[7]};
    assign in_2 = {pp1[0],s0[0],s1[0],s3[0],s5[0],s7[0],1'b0,1'b0,c11,s8,c8,c6,c4,c2};
    kogge_stone_14 KS(s, c, in_1, in_2);

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


module multiplier_8bits_version9_version5(product, A, B);

    /* This approach uses long kogge-stone adder and HAs
     * Area: 1853.265645
     * Power: 0.8191mW
     * Timing: 1.44ns
     */

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
    wire[10:0] s0, in0_1, in0_2;
    wire c0;
    assign in0_1 = {pp0[2],pp0[3],pp0[4],pp0[5],pp0[6],pp0[7],pp1[7],pp2[7],pp3[7],pp4[7],pp5[7]};
    assign in0_2 = {pp1[1],pp1[2],pp1[3],pp1[4],pp1[5],pp1[6],pp2[6],pp3[6],pp4[6],pp5[6],pp6[6]};
    kogge_stone_11 KS_0(s0, c0, in0_1, in0_2);

    /*Stage 2*/
    wire[8:0] s1, in1_1, in1_2;
    wire c1;
    assign in1_1 = {pp2[1],pp2[2],pp2[3],pp2[4],pp2[5],pp3[5],pp4[5],pp5[5],pp6[5]};
    assign in1_2 = {pp3[0],pp3[1],pp3[2],pp3[3],pp3[4],pp4[4],pp5[4],pp6[4],pp7[4]};
    kogge_stone_9 KS_1(s1, c1, in1_1, in1_2);

    half_adder HA2(s2, c2, pp6[7], pp7[6]);

    /*Stage 3*/
    wire[6:0] s3, in3_1, in3_2;
    wire c3;
    assign in3_1 = {pp4[0],pp4[1],pp4[2],pp4[3],pp5[3],pp6[3],pp7[3]};
    assign in3_2 = {s0[2],pp5[0],pp5[1],pp5[2],pp6[2],pp7[2],s0[8]};
    kogge_stone_7 KS_3(s3, c3, in3_1, in3_2);

    half_adder HA4(s4, c4, pp7[5], s0[10]);

    /*Stage 4*/
    wire[4:0] s5, in5_1, in5_2;
    wire c5;
    assign in5_1 = {s0[3],pp6[0],pp6[1],pp7[1],s0[7]};
    assign in5_2 = {s1[2],s0[4],pp7[0],s0[6],s1[6]};
    kogge_stone_5 KS_5(s5, c5, in5_1, in5_2);

    half_adder HA6(s6, c6, s0[9], s1[8]);

    half_adder HA7(s7, c7, c0, s2);

    /*Stage 5*/
    wire[2:0] s8, in8_1, in8_2;
    wire c8;
    assign in8_1 = {s1[3],s0[5],s1[5]};
    assign in8_2 = {s3[2],s1[4],s3[4]};
    kogge_stone_3 KS_8(s8, c8, in8_1, in8_2);

    half_adder HA9(s9, c9, s1[7], s3[6]);

    half_adder HA10(s10, c10, c1, s4);

    half_adder HA11(s11, c11, pp7[7], c2);

    /*Stage 6*/

    half_adder HA12(s12, c12, s3[3], s5[2]);

    half_adder HA13(s13, c13, s3[5], s5[4]);

    half_adder HA14(s14, c14, c3, s6);

    half_adder HA15(s15, c15, c10, c4);

    /*Stage 7*/

    half_adder HA16(s16, c16, s5[3], s8[2]);

    half_adder HA17(s17, c17, c13, c5);

    half_adder HA18(s18, c18, s10, c14);

    half_adder HA19(s19, c19, s11, c15);

    /*Stage 8*/

    half_adder HA20(s20, c20, s13, c8);

    half_adder HA21(s21, c21, s14, c17);

    half_adder HA22(s22, c22, s15, c18);

    /*Stage 9*/

    half_adder HA23(s23, c23, s17, s9);

    half_adder HA24(s24, c24, s18, c21);

    half_adder HA25(s25, c25, s19, c22);

    /*Stage 10*/

    half_adder HA26(s26, c26, s21, c9);

    half_adder HA27(s27, c27, s22, c24);

    /*Stage 11*/

    half_adder HA28(s28, c28, s24, c6);

    half_adder HA29(s29, c29, s25, c27);

    /*Stage 12*/

    half_adder HA30(s30, c30, s27, s7);

    /*Stage 13*/

    half_adder HA31(s31, c31, s29, c7);


    wire[13:0] s, in_1, in_2;
    wire c;
    assign in_1 = {pp0[1],pp2[0],s0[1],s1[1],s3[1],s5[1],s8[1],c12,c16,c20,c23,c26,c28,c30};
    assign in_2 = {pp1[0],s0[0],s1[0],s3[0],s5[0],s8[0],s12,s16,s20,s23,s26,s28,s30,s31};
    kogge_stone_14 KS(s, c, in_1, in_2);

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

module multiplier_8bits_version9_version4_version4(product, A, B);

    /*
     * Area; 2224.481936
     * Power: 0.9679mW
     * Timing: 1.59ns
     */

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
    wire[11:0] s0, in0_1, in0_2;
    wire c0;
    assign in0_1 = {pp0[2],pp0[3],pp0[4],pp0[5],pp0[6],pp0[7],pp1[7],pp2[7],pp3[7],pp4[7],pp5[7],pp6[7]};
    assign in0_2 = {pp1[1],pp1[2],pp1[3],pp1[4],pp1[5],pp1[6],pp2[6],pp3[6],pp4[6],pp5[6],pp6[6],pp7[6]};
    kogge_stone_12 KS_0(s0, c0, in0_1, in0_2);
    wire[8:0] s1, in1_1, in1_2;
    wire c1;
    assign in1_1 = {pp2[1],pp2[2],pp2[3],pp2[4],pp2[5],pp3[5],pp4[5],pp5[5],pp6[5]};
    assign in1_2 = {pp3[0],pp3[1],pp3[2],pp3[3],pp3[4],pp4[4],pp5[4],pp6[4],pp7[4]};
    kogge_stone_9 KS_1(s1, c1, in1_1, in1_2);
    wire[4:0] s2, in2_1, in2_2;
    wire c2;
    assign in2_1 = {pp4[1],pp4[2],pp4[3],pp5[3],pp6[3]};
    assign in2_2 = {pp5[0],pp5[1],pp5[2],pp6[2],pp7[2]};
    kogge_stone_5 KS_2(s2, c2, in2_1, in2_2);

    half_adder HA3(s3, c3, pp6[1], pp7[0]);

    /*Stage 2*/
    wire[10:0] s4, in4_1, in4_2;
    wire c4;
    assign in4_1 = {pp2[0],s0[1],pp4[0],s0[3],pp6[0],s0[5],pp7[1],s0[7],pp7[3],s0[9],pp7[5]};
    assign in4_2 = {s0[0],s1[0],s0[2],s1[2],s0[4],s1[4],s0[6],s1[6],s0[8],s1[8],s0[10]};
    kogge_stone_11 KS_4(s4, c4, in4_1, in4_2);

    half_adder HA5(s5, c5, pp7[7], c0);
    wire[2:0] s6, in6_1, in6_2;
    wire c6;
    assign in6_1 = {s1[3],s2[2],s1[5]};
    assign in6_2 = {s2[1],s3,s2[3]};
    kogge_stone_3 KS_6(s6, c6, in6_1, in6_2);

    half_adder HA7(s7, c7, s1[7], c2);

    /*Stage 3*/
    wire[9:0] s8, in8_1, in8_2;
    wire c8;
    assign in8_1 = {s1[1],s2[0],s4[4],s4[5],s4[6],s2[4],s4[8],s4[9],s4[10],s0[11]};
    assign in8_2 = {s4[2],s4[3],s6[0],s6[1],s6[2],s4[7],s7,c7,c1,c4};
    kogge_stone_10 KS_8(s8, c8, in8_1, in8_2);


    wire[13:0] s, in_1, in_2;
    wire c;
    assign in_1 = {pp0[1],s4[0],s4[1],s8[0],s8[1],s8[2],s8[3],c3,c6,s8[6],s8[7],s8[8],s8[9],s5};
    assign in_2 = {pp1[0],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,s8[4],s8[5],1'b0,1'b0,1'b0,1'b0,c8};
    kogge_stone_14(s, c, in_1, in_2);

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


module multiplier_8bits_version9_version3(product, A, B);
    /* Area: 1826.984847
     * Power: 0.8171mW
     * Timing: 1.43ns
     */ 

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
    wire[10:0] s0, in0_1, in0_2;
    wire c0;
    assign in0_1 = {pp0[2],pp0[3],pp0[4],pp0[5],pp0[6],pp0[7],pp1[7],pp2[7],pp3[7],pp4[7],pp5[7]};
    assign in0_2 = {pp1[1],pp1[2],pp1[3],pp1[4],pp1[5],pp1[6],pp2[6],pp3[6],pp4[6],pp5[6],pp6[6]};
    kogge_stone_11 KS_0(s0, c0, in0_1, in0_2);

    /*Stage 2*/
    wire[8:0] s1, in1_1, in1_2;
    wire c1;
    assign in1_1 = {pp2[1],pp2[2],pp2[3],pp2[4],pp2[5],pp3[5],pp4[5],pp5[5],pp6[5]};
    assign in1_2 = {pp3[0],pp3[1],pp3[2],pp3[3],pp3[4],pp4[4],pp5[4],pp6[4],pp7[4]};
    kogge_stone_9 KS_1(s1, c1, in1_1, in1_2);

    /*Stage 3*/
    wire[6:0] s2, in2_1, in2_2;
    wire c2;
    assign in2_1 = {pp4[0],pp4[1],pp4[2],pp4[3],pp5[3],pp6[3],pp7[3]};
    assign in2_2 = {s0[2],pp5[0],pp5[1],pp5[2],pp6[2],pp7[2],s0[8]};
    kogge_stone_7 KS_2(s2, c2, in2_1, in2_2);

    /*Stage 4*/
    wire[4:0] s3, in3_1, in3_2;
    wire c3;
    assign in3_1 = {s0[3],pp6[0],pp6[1],pp7[1],s0[7]};
    assign in3_2 = {s1[2],s0[4],pp7[0],s0[6],s1[6]};
    kogge_stone_5 KS_3(s3, c3, in3_1, in3_2);

    /*Stage 5*/
    wire[2:0] s4, in4_1, in4_2;
    wire c4;
    assign in4_1 = {s1[3],s0[5],s1[5]};
    assign in4_2 = {s2[2],s1[4],s2[4]};
    kogge_stone_3 KS_4(s4, c4, in4_1, in4_2);

    /*Stage 6*/
    half_adder HA5(s5, c5, s2[3], s3[2]);

    /*Stage 7*/
    wire[5:0] s6, in6_1, in6_2;
    wire c6;
    assign in6_1 = {s3[3],s2[5],s1[7],s0[9],pp7[5],pp6[7]};
    assign in6_2 = {s4[2],s3[4],s2[6],s1[8],s0[10],pp7[6]};
    kogge_stone_6 KS_6(s6, c6, in6_1, in6_2);


    wire[13:0] s, in_1, in_2;
    wire c;
    assign in_1 = {pp0[1],pp2[0],s0[1],s1[1],s2[1],s3[1],s4[1],c5,c4,c3,c2,c1,c0,pp7[7]};
    assign in_2 = {pp1[0],s0[0],s1[0],s2[0],s3[0],s4[0],s5,s6[0],s6[1],s6[2],s6[3],s6[4],s6[5],c6};
    kogge_stone_14 KS(s, c, in_1, in_2);

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

module multiplier_8bits_version9_attempt2(product, A, B);

    /* Area: 1826.984847
     * Power: 0.8891mW
     * Timing: 1.98ns
     */

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
    wire[10:0] s0, in0_1, in0_2;
    wire c0;
    assign in0_1 = {pp2[0],pp3[0],pp4[0],pp5[0],pp6[0],pp7[0],pp7[1],pp7[2],pp7[3],pp7[4],pp7[5]};
    assign in0_2 = {pp1[1],pp2[1],pp3[1],pp4[1],pp5[1],pp6[1],pp6[2],pp6[3],pp6[4],pp6[5],pp6[6]};
    kogge_stone_11 KS_0(s0, c0, in0_1, in0_2);

    /*Stage 2*/
    wire[8:0] s1, in1_1, in1_2;
    wire c1;
    assign in1_1 = {pp1[2],s0[2],s0[3],s0[4],s0[5],s0[6],s0[7],s0[8],s0[9]};
    assign in1_2 = {pp0[3],pp2[2],pp3[2],pp4[2],pp5[2],pp5[3],pp5[4],pp5[5],pp5[6]};
    kogge_stone_9 KS_1(s1, c1, in1_1, in1_2);

    /*Stage 3*/
    wire[6:0] s2, in2_1, in2_2;
    wire c2;
    assign in2_1 = {pp1[3],s1[2],s1[3],s1[4],s1[5],s1[6],s1[7]};
    assign in2_2 = {pp0[4],pp2[3],pp3[3],pp4[3],pp4[4],pp4[5],pp4[6]};
    kogge_stone_7 KS_2(s2, c2, in2_1, in2_2);

    /*Stage 4*/
    wire[4:0] s3, in3_1, in3_2;
    wire c3;
    assign in3_1 = {pp1[4],s2[2],s2[3],s2[4],s2[5]};
    assign in3_2 = {pp0[5],pp2[4],pp3[4],pp3[5],pp3[6]};
    kogge_stone_5 KS_3(s3, c3, in3_1, in3_2);

    /*Stage 5*/
    wire[2:0] s4, in4_1, in4_2;
    wire c4;
    assign in4_1 = {pp1[5],s3[2],s3[3]};
    assign in4_2 = {pp0[6],pp2[5],pp2[6]};
    kogge_stone_3 KS_4(s4, c4, in4_1, in4_2);

    /*Stage 6*/
    half_adder HA5(s5, c5, pp1[6], pp0[7]);

    /*Stage 7*/
    wire[5:0] s6, in6_1, in6_2;
    wire c6;
    assign in6_1 = {s4[2],s3[4],s2[6],s1[8],s0[10],pp7[6]};
    assign in6_2 = {pp1[7],pp2[7],pp3[7],pp4[7],pp5[7],pp6[7]};
    kogge_stone_6 KS_6(s6, c6, in6_1, in6_2);


    wire[13:0] s, in_1, in_2;
    wire c;
    assign in_1 = {pp1[0],s0[0],s1[0],s2[0],s3[0],s4[0],s5,c5,c4,c3,c2,c1,c0,pp7[7]};
    assign in_2 = {pp0[1],pp0[2],s0[1],s1[1],s2[1],s3[1],s4[1],s6[0],s6[1],s6[2],s6[3],s6[4],s6[5],c6};
    kogge_stone_14 KS(s, c, in_1, in_2);

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

module CLA2(sum, cout, in1, in2);
    input [1:0] in1, in2; //input
    output [1:0] sum; //output
    output cout; //carry-out

    wire [1:0] G; /* Generate */
    wire [1:0] P; /* Propagate */
    wire [1:0] C; /* Carry */

    assign G[0] = in1[1] & in2[1]; /*Generate    Gi = Ai * Bi */
    assign G[1] = in1[0] & in2[0];

    assign P[0] = in1[1] ^ in2[1];
    assign P[1] = in1[0] ^ in2[0];

    assign C[0] = 0;
    assign C[1] = G[0] | (P[0] & C[0]);
    assign cout = G[1] | (P[1] & C[1]);
    assign sum = P ^ C;
endmodule

module kogge_stone_3(sum, cout, in1, in2);
    input [2:0] in1, in2; //input
    output [2:0] sum; //output
    output cout; //carry-out
    wire [2:0] G_Z, P_Z, //wires
    G_A, P_A,
    G_B, P_B;

    assign P_Z[0] = in1[2] ^ in2[2];
    assign P_Z[1] = in1[1] ^ in2[1];
    assign P_Z[2] = in1[0] ^ in2[0];
    assign G_Z[0] = in1[2] & in2[2];
    assign G_Z[1] = in1[1] & in2[1];
    assign G_Z[2] = in1[0] & in2[0];

    /*level 1*/
    assign G_A[0] = G_Z[0];
    black_cell level_1A(G_Z[0],  P_Z[1],  G_Z[1],  P_Z[0],  G_A[1],  P_A[1]);
    black_cell level_2A(G_Z[1],  P_Z[2],  G_Z[2],  P_Z[1],  G_A[2],  P_A[2]);

    /*level 2*/
    assign G_B[1] = G_A[1];
    gray_cell level_2B(G_A[0],   P_A[2],  G_A[2],  cout);

    /*outputs*/
    assign sum[0]  =           P_Z[0];
    assign sum[1]  = G_A[0]  ^ P_Z[1];
    assign sum[2]  = G_B[1]  ^ P_Z[2];
endmodule

module kogge_stone_5(sum, cout, in1, in2);
    input [4:0] in1, in2; //input
    output [4:0] sum; //output
    output cout;
    wire [4:0] G_Z, P_Z, //wires
    G_A, P_A,
    G_B, P_B,
    G_C, P_C,
    G_D, P_D;

    assign P_Z[0]  = in1[4]  ^ in2[4];
    assign P_Z[1]  = in1[3]  ^ in2[3];
    assign P_Z[2]  = in1[2]  ^ in2[2];
    assign P_Z[3]  = in1[1]  ^ in2[1];
    assign P_Z[4]  = in1[0]  ^ in2[0];

    assign G_Z[0]  = in1[4]  & in2[4];
    assign G_Z[1]  = in1[3]  & in2[3];
    assign G_Z[2] = in1[2]  & in2[2];
    assign G_Z[3] = in1[1]  & in2[1];
    assign G_Z[4] = in1[0]  & in2[0];

    /*level 1*/
    assign G_A[0] = G_Z[0];
    black_cell level_1A(G_Z[0],  P_Z[1],  G_Z[1],  P_Z[0],  G_A[1],  P_A[1]);
    black_cell level_2A(G_Z[1],  P_Z[2],  G_Z[2],  P_Z[1],  G_A[2],  P_A[2]);
    black_cell level_3A(G_Z[2],  P_Z[3],  G_Z[3],  P_Z[2],  G_A[3],  P_A[3]);
    black_cell level_4A(G_Z[3],  P_Z[4],  G_Z[4],  P_Z[3],  G_A[4],  P_A[4]);

    /*level 2*/
    assign G_B[1] = G_A[1];
    gray_cell level_2B(G_A[0],   P_A[2],  G_A[2],  G_B[2]);
    black_cell level_3B(G_A[1],  P_A[3],  G_A[3],  P_A[1],  G_B[3],  P_B[3]);
    black_cell level_4B(G_A[2],  P_A[4],  G_A[4],  P_A[2],  G_B[4],  P_B[4]);

    /*level 3*/
    assign G_C[3] = G_B[3];
    gray_cell level_4C(G_A[0],   P_B[4],  G_B[4],  cout);

    /*outputs*/
    assign sum[0]  =           P_Z[0];
    assign sum[1]  = G_A[0]  ^ P_Z[1];
    assign sum[2]  = G_B[1]  ^ P_Z[2];
    assign sum[3]  = G_B[2]  ^ P_Z[3];
    assign sum[4]  = G_C[3]  ^ P_Z[4];
endmodule

module kogge_stone_6(sum, cout, in1, in2);
    input [5:0] in1, in2; //input
    output [5:0] sum; //output
    output cout;
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

module kogge_stone_7(sum, cout, in1, in2);
    input [6:0] in1, in2; //input
    output [6:0] sum; //output
    output cout; //carry-out
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
    gray_cell level_6C(G_B[2],   P_B[6],  G_B[6],  cout);

    /*outputs*/
    assign sum[0]  =           P_Z[0];
    assign sum[1]  = G_A[0]  ^ P_Z[1];
    assign sum[2]  = G_B[1]  ^ P_Z[2];
    assign sum[3]  = G_B[2]  ^ P_Z[3];
    assign sum[4]  = G_C[3]  ^ P_Z[4];
    assign sum[5]  = G_C[4]  ^ P_Z[5];
    assign sum[6]  = G_C[5]  ^ P_Z[6];
endmodule

module kogge_stone_9(sum, cout, in1, in2);
    input [8:0] in1, in2; //input
    output [8:0] sum; //output
    output cout; //carry-out
    wire [8:0] G_Z, P_Z, //wires
    G_A, P_A,
    G_B, P_B,
    G_C, P_C,
    G_D, P_D;

    assign P_Z[0]  = in1[8]  ^ in2[8];
    assign P_Z[1]  = in1[7]  ^ in2[7];
    assign P_Z[2]  = in1[6]  ^ in2[6];
    assign P_Z[3]  = in1[5]  ^ in2[5];
    assign P_Z[4]  = in1[4]  ^ in2[4];
    assign P_Z[5]  = in1[3]  ^ in2[3];
    assign P_Z[6]  = in1[2]  ^ in2[2];
    assign P_Z[7]  = in1[1]  ^ in2[1];
    assign P_Z[8]  = in1[0]  ^ in2[0];    

    assign G_Z[0]  = in1[8]  & in2[8];
    assign G_Z[1]  = in1[7]  & in2[7];
    assign G_Z[2]  = in1[6]  & in2[6];
    assign G_Z[3]  = in1[5]  & in2[5];
    assign G_Z[4]  = in1[4]  & in2[4];
    assign G_Z[5]  = in1[3]  & in2[3];
    assign G_Z[6] = in1[2]  & in2[2];
    assign G_Z[7] = in1[1]  & in2[1];
    assign G_Z[8] = in1[0]  & in2[0];

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


    /*level 2*/
    assign G_B[1] = G_A[1];
    gray_cell level_2B(G_A[0],   P_A[2],  G_A[2],  G_B[2]);
    black_cell level_3B(G_A[1],  P_A[3],  G_A[3],  P_A[1],  G_B[3],  P_B[3]);
    black_cell level_4B(G_A[2],  P_A[4],  G_A[4],  P_A[2],  G_B[4],  P_B[4]);
    black_cell level_5B(G_A[3],  P_A[5],  G_A[5],  P_A[3],  G_B[5],  P_B[5]);
    black_cell level_6B(G_A[4],  P_A[6],  G_A[6],  P_A[4],  G_B[6],  P_B[6]);
    black_cell level_7B(G_A[5],  P_A[7],  G_A[7],  P_A[5],  G_B[7],  P_B[7]);
    black_cell level_8B(G_A[6],  P_A[8],  G_A[8],  P_A[6],  G_B[8],  P_B[8]);


    /*level 3*/
    assign G_C[3] = G_B[3];
    gray_cell level_4C(G_A[0],   P_B[4],  G_B[4],  G_C[4]);
    gray_cell level_5C(G_B[1],   P_B[5],  G_B[5],  G_C[5]);
    gray_cell level_6C(G_B[2],   P_B[6],  G_B[6],  G_C[6]);
    black_cell level_7C(G_B[3],  P_B[7],  G_B[7],  P_B[3],  G_C[7],  P_C[7]);
    black_cell level_8C(G_B[4],  P_B[8],  G_B[8],  P_B[4],  G_C[8],  P_C[8]);

    /*level 4*/
    assign G_D[7] = G_C[7];
    gray_cell level_8D(G_A[0],   P_C[8],   G_C[8],           cout);

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
endmodule

module kogge_stone_10(sum, cout, in1, in2);
    input [9:0] in1, in2; //input
    output [9:0] sum; //output
    output cout; //carry-out
    wire [9:0] G_Z, P_Z, //wires
    G_A, P_A,
    G_B, P_B,
    G_C, P_C,
    G_D, P_D;

    assign P_Z[0]  = in1[9]  ^ in2[9];
    assign P_Z[1]  = in1[8]  ^ in2[8];
    assign P_Z[2]  = in1[7]  ^ in2[7];
    assign P_Z[3]  = in1[6]  ^ in2[6];
    assign P_Z[4]  = in1[5]  ^ in2[5];
    assign P_Z[5]  = in1[4]  ^ in2[4];
    assign P_Z[6]  = in1[3]  ^ in2[3];
    assign P_Z[7]  = in1[2]  ^ in2[2];
    assign P_Z[8]  = in1[1]  ^ in2[1];
    assign P_Z[9]  = in1[0]  ^ in2[0];    

    assign G_Z[0]  = in1[9]  & in2[9];
    assign G_Z[1]  = in1[8]  & in2[8];
    assign G_Z[2]  = in1[7]  & in2[7];
    assign G_Z[3]  = in1[6]  & in2[6];
    assign G_Z[4]  = in1[5]  & in2[5];
    assign G_Z[5]  = in1[4]  & in2[4];
    assign G_Z[6]  = in1[3]  & in2[3];
    assign G_Z[7] = in1[2]  & in2[2];
    assign G_Z[8] = in1[1]  & in2[1];
    assign G_Z[9] = in1[0]  & in2[0];

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

    /*level 3*/
    assign G_C[3] = G_B[3];
    //gray_cell level_3C(1'b0,      P_B[3],  G_B[3],  G_C[3]);
    gray_cell level_4C(G_A[0],   P_B[4],  G_B[4],  G_C[4]);
    gray_cell level_5C(G_B[1],   P_B[5],  G_B[5],  G_C[5]);
    gray_cell level_6C(G_B[2],   P_B[6],  G_B[6],  G_C[6]);
    black_cell level_7C(G_B[3],  P_B[7],  G_B[7],  P_B[3],  G_C[7],  P_C[7]);
    black_cell level_8C(G_B[4],  P_B[8],  G_B[8],  P_B[4],  G_C[8],  P_C[8]);
    black_cell level_9C(G_B[5],  P_B[9],  G_B[9],  P_B[5],  G_C[9],  P_C[9]);

    /*level 4*/
    assign G_D[7] = G_C[7];
    //gray_cell level_7D(1'b0,     P_C[7],   G_C[7],           G_D[7]);
    gray_cell level_8D(G_A[0],   P_C[8],   G_C[8],           G_D[8]);
    gray_cell level_9D(G_B[1],   P_C[9],   G_C[9],           cout);

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

module kogge_stone_11(sum, cout, in1, in2);
    input [10:0] in1, in2; //input
    output [10:0] sum; //output
    output cout; //carry-out
    wire [10:0] G_Z, P_Z, //wires
    G_A, P_A,
    G_B, P_B,
    G_C, P_C,
    G_D, P_D;

    assign P_Z[0]  = in1[10] ^ in2[10];
    assign P_Z[1]  = in1[9]  ^ in2[9];
    assign P_Z[2]  = in1[8]  ^ in2[8];
    assign P_Z[3]  = in1[7]  ^ in2[7];
    assign P_Z[4]  = in1[6]  ^ in2[6];
    assign P_Z[5]  = in1[5]  ^ in2[5];
    assign P_Z[6]  = in1[4]  ^ in2[4];
    assign P_Z[7]  = in1[3]  ^ in2[3];
    assign P_Z[8] = in1[2]  ^ in2[2];
    assign P_Z[9] = in1[1]  ^ in2[1];
    assign P_Z[10] = in1[0]  ^ in2[0];    

    assign G_Z[0]  = in1[10] & in2[10];
    assign G_Z[1]  = in1[9]  & in2[9];
    assign G_Z[2]  = in1[8]  & in2[8];
    assign G_Z[3]  = in1[7]  & in2[7];
    assign G_Z[4]  = in1[6]  & in2[6];
    assign G_Z[5]  = in1[5]  & in2[5];
    assign G_Z[6]  = in1[4]  & in2[4];
    assign G_Z[7]  = in1[3]  & in2[3];
    assign G_Z[8] = in1[2]  & in2[2];
    assign G_Z[9] = in1[1]  & in2[1];
    assign G_Z[10] = in1[0]  & in2[0];

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


    /*level 3*/
    assign G_C[3] = G_B[3];
    gray_cell level_4C(G_A[0],   P_B[4],  G_B[4],  G_C[4]);
    gray_cell level_5C(G_B[1],   P_B[5],  G_B[5],  G_C[5]);
    gray_cell level_6C(G_B[2],   P_B[6],  G_B[6],  G_C[6]);
    black_cell level_7C(G_B[3],  P_B[7],  G_B[7],  P_B[3],  G_C[7],  P_C[7]);
    black_cell level_8C(G_B[4],  P_B[8],  G_B[8],  P_B[4],  G_C[8],  P_C[8]);
    black_cell level_9C(G_B[5],  P_B[9],  G_B[9],  P_B[5],  G_C[9],  P_C[9]);
    black_cell level_AC(G_B[6],  P_B[10], G_B[10], P_B[6],  G_C[10], P_C[10]);

    /*level 4*/
    assign G_D[7] = G_C[7];
    gray_cell level_8D(G_A[0],   P_C[8],   G_C[8],           G_D[8]);
    gray_cell level_9D(G_B[1],   P_C[9],   G_C[9],           G_D[9]);
    gray_cell level_AD(G_B[2],   P_C[10],  G_C[10],          cout);

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
endmodule

module kogge_stone_12(sum, cout, in1, in2);
    input [11:0] in1, in2; //input
    output [11:0] sum; //output
    output cout; //carry-out
    wire [11:0] G_Z, P_Z, //wires
    G_A, P_A,
    G_B, P_B,
    G_C, P_C,
    G_D, P_D;

    assign P_Z[0]  = in1[11] ^ in2[11];
    assign P_Z[1]  = in1[10] ^ in2[10];
    assign P_Z[2]  = in1[9]  ^ in2[9];
    assign P_Z[3]  = in1[8]  ^ in2[8];
    assign P_Z[4]  = in1[7]  ^ in2[7];
    assign P_Z[5]  = in1[6]  ^ in2[6];
    assign P_Z[6]  = in1[5]  ^ in2[5];
    assign P_Z[7]  = in1[4]  ^ in2[4];
    assign P_Z[8]  = in1[3]  ^ in2[3];
    assign P_Z[9]  = in1[2]  ^ in2[2];
    assign P_Z[10] = in1[1]  ^ in2[1];
    assign P_Z[11] = in1[0]  ^ in2[0];    

    assign G_Z[0]  = in1[11] & in2[11];
    assign G_Z[1]  = in1[10] & in2[10];
    assign G_Z[2]  = in1[9]  & in2[9];
    assign G_Z[3]  = in1[8]  & in2[8];
    assign G_Z[4]  = in1[7]  & in2[7];
    assign G_Z[5]  = in1[6]  & in2[6];
    assign G_Z[6]  = in1[5]  & in2[5];
    assign G_Z[7]  = in1[4]  & in2[4];
    assign G_Z[8]  = in1[3]  & in2[3];
    assign G_Z[9]  = in1[2]  & in2[2];
    assign G_Z[10] = in1[1]  & in2[1];
    assign G_Z[11] = in1[0]  & in2[0];

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

    /*level 4*/
    assign G_D[7] = G_C[7];
    //gray_cell level_7D(1'b0,     P_C[7],   G_C[7],           G_D[7]);
    gray_cell level_8D(G_A[0],   P_C[8],   G_C[8],           G_D[8]);
    gray_cell level_9D(G_B[1],   P_C[9],   G_C[9],           G_D[9]);
    gray_cell level_AD(G_B[2],   P_C[10],  G_C[10],          G_D[10]);
    gray_cell level_BD(G_C[3],   P_C[11],  G_C[11],          cout);

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
