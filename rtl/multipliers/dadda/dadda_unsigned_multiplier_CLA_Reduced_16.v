module dadda_unsigned_multiplier_CLA_Reduced_16(product, A, B);
    /* This attempt uses CLA of max length 4 but the 2nd last stage uses FA
     * and HAs and
     * the final stage addition is done using CLA of length 13.
     */

    input [15:0] A, B;
    output [31:0] product;

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

    /* CLA 1 */
    wire [3:0] s1, in1_1, in1_2;
    wire c1;
    assign in1_1 = {pp2[12], pp2[13], pp2[14], pp2[15]};
    assign in1_2 = {pp3[11], pp3[12], pp3[13], pp3[14]};
    CLA4_c CLA01(s1, c1, in1_1, in1_2, pp14[0]);

    /* CLA 2 */
    wire [3:0] s2, in2_1, in2_2;
    wire c2;
    assign in2_1 = {pp4[8], pp4[9], pp4[10], pp4[11]};
    assign in2_2 = {pp5[7], pp5[8], pp5[9],  pp5[10]};
    CLA4 CLA02(s2, c2, in2_1, in2_2);

    wire [3:0] s3, in3_1, in3_2;
    wire c3;
    assign in3_1 = {pp4[12], pp4[13], pp4[14], pp4[15]};
    assign in3_2 = {pp5[11], pp5[12], pp5[13], pp5[14]};
    CLA4 CLA03(s3, c3, in3_1, in3_2);

    wire [3:0] s4, in4_1, in4_2;
    wire c4;
    assign in4_1 = {pp6[4], pp6[5], pp6[6], pp6[7]};
    assign in4_2 = {pp7[3], pp7[4], pp7[5], pp7[6]};
    CLA4 CLA04(s4, c4, in4_1, in4_2);

    wire [3:0] s5, in5_1, in5_2;
    wire c5;
    assign in5_1 = {pp6[8], pp6[9], pp6[10], pp6[11]};
    assign in5_2 = {pp7[7], pp7[8], pp7[9],  pp7[10]};
    CLA4 CLA05(s5, c5, in5_1, in5_2);

    wire [3:0] s6, in6_1, in6_2;
    wire c6;
    assign in6_1 = {pp6[12], pp6[13], pp6[14], pp6[15]};
    assign in6_2 = {pp7[11], pp7[12], pp7[13], pp7[14]};
    CLA4 CLA06(s6, c6, in6_1, in6_2);

    wire [3:0] s7, in7_1, in7_2;
    wire c7;
    assign in7_1 = {pp8[1], pp8[2], pp8[3], pp8[4]};
    assign in7_2 = {pp9[0], pp9[1], pp9[2], pp9[3]};
    CLA4 CLA07(s7, c7, in7_1, in7_2);

    wire [3:0] s8, in8_1, in8_2;
    wire c8;
    assign in8_1 = {pp8[5], pp8[6], pp8[7], pp8[8]};
    assign in8_2 = {pp9[4], pp9[5], pp9[6], pp9[7]};
    CLA4 CLA08(s8, c8, in8_1, in8_2);

    wire [3:0] s9, in9_1, in9_2;
    wire c9;
    assign in9_1 = {pp8[9], pp8[10], pp8[11], pp8[12]};
    assign in9_2 = {pp9[8], pp9[9],  pp9[10], pp9[11]};
    CLA4 CLA09(s9, c9, in9_1, in9_2);

    wire [3:0] sA, inA_1, inA_2;
    wire cA;
    assign inA_1 = {pp10[1], pp10[2], pp10[3], pp10[4]};
    assign inA_2 = {pp11[0], pp11[1], pp11[2], pp11[3]};
    CLA4 CLA0A(sA, cA, inA_1, inA_2);

    wire [3:0] sB, inB_1, inB_2;
    wire cB;
    assign inB_1 = {pp10[5], pp10[6], pp10[7], pp10[8]};
    assign inB_2 = {pp11[4], pp11[5], pp11[6], pp11[7]};
    CLA4 CLA0B(sB, cB, inB_1, inB_2);

    wire [3:0] sC, inC_1, inC_2;
    wire cC;
    assign inC_1 = {pp10[9], pp10[10], pp10[11], pp10[12]};
    assign inC_2 = {pp11[8], pp11[9],  pp11[10], pp11[11]};
    CLA4 CLA0C(sC, cC, inC_1, inC_2);


    wire [3:0] sD, inD_1, inD_2;
    wire cD;
    assign inD_1 = {pp12[1], pp12[2], pp12[3], pp12[4]};
    assign inD_2 = {pp13[0], pp13[1], pp13[2], pp13[3]};
    CLA4_c CLA0D(sD, cD, inD_1, inD_2, pp3[10]);

    wire [3:0] sE, inE_1, inE_2;
    wire cE;
    assign inE_1 = {pp12[5], pp12[6], pp12[7], pp12[8]};
    assign inE_2 = {pp13[4], pp13[5], pp13[6], pp13[7]};
    CLA4 CLA0E(sE, cE, inE_1, inE_2);

    wire [2:0] sF, inF_1, inF_2;
    wire cF;
    assign inF_1 = {pp12[9], pp12[10], pp12[11]};
    assign inF_2 = {pp13[8], pp13[9],  pp13[10]};
    CLA3 CLA0F(sF, cF, inF_1, inF_2);

    wire [3:0] sG, inG_1, inG_2;
    wire cG;
    assign inG_1 = {pp14[1], pp14[2], pp14[3], pp14[4]};
    assign inG_2 = {pp15[0], pp15[1], pp15[2], pp15[3]};
    CLA4_c CLA0G(sG, cG, inG_1, inG_2, pp1[14]);


    /* 2nd Stage */

    wire [3:0] sH, inH_1, inH_2;
    wire cH;
    assign inH_1 = {pp0[5], pp0[6], pp0[7], pp0[8]};
    assign inH_2 = {pp1[4], pp1[5], pp1[6], pp1[7]};
    CLA4 CLA0H(sH, cH, inH_1, inH_2);

    wire [3:0] sI, inI_1, inI_2;
    wire cI;
    assign inI_1 = {pp0[9], pp0[10], pp0[11], pp0[12]};
    assign inI_2 = {pp1[8], pp1[9],  pp1[10], pp1[11]};
    CLA4_c CLA0I(sI, cI, inI_1, inI_2, s7[0]);

    wire [3:0] sJ, inJ_1, inJ_2;
    wire cJ;
    assign inJ_1 = {pp0[13], pp0[14], pp0[15], pp1[15]};
    assign inJ_2 = {pp1[12], pp1[13], s1[1],   s1[2]};
    CLA4_c CLA0J(sJ, cJ, inJ_1, inJ_2, sD[0]);
 
    wire [3:0] sK, inK_1, inK_2;
    wire cK;
    assign inK_1 = {s1[3], c1,    pp14[5], pp14[6]};
    assign inK_2 = {s3[1], s3[2], pp15[4], pp15[5]};
    CLA4_c CLA0K(sK, cK, inK_1, inK_2, sG[2]);

    wire [3:0] sL, inL_1, inL_2;
    wire cL;
    assign inL_1 = {pp14[7], pp14[8], pp14[9], pp14[10]};
    assign inL_2 = {pp15[6], pp15[7], pp15[8], pp15[9]};
    CLA4_c CLA0L(sL, cL, inL_1, inL_2, pp8[13]);


    wire [3:0] sM, inM_1, inM_2;
    wire cM;
    assign inM_1 = {pp2[4], pp2[5], pp2[6], pp2[7]};
    assign inM_2 = {pp3[3], pp3[4], pp3[5], pp3[6]};
    CLA4 CLA0M(sM, cM, inM_1, inM_2);

    wire [3:0] sN, inN_1, inN_2;
    wire cN;
    assign inN_1 = {pp2[8], pp2[9], pp2[10], pp2[11]};
    assign inN_2 = {pp3[7], pp3[8], pp3[9],  s2[1]};
    CLA4_c CLA0N(sN, cN, inN_1, inN_2, pp10[0]);

    wire [3:0] sO, inO_1, inO_2;
    wire cO;
    assign inO_1 = {s1[0], s2[3], c2,    s5[3]};
    assign inO_2 = {s2[2], s5[1], s3[0], c8};
    CLA4_c CLA0O(sO, cO, inO_1, inO_2, sD[1]);

    wire [3:0] sP, inP_1, inP_2;
    wire cP;
    assign inP_1 = {c5,    s3[3], c3,    s6[3]};
    assign inP_2 = {s6[0], s6[1], s6[2], pp9[12]};
    CLA4_c CLA0P(sP, cP, inP_1, inP_2, pp3[15]);


    wire [3:0] sQ, inQ_1, inQ_2;
    wire cQ;
    assign inQ_1 = {pp9[13], pp9[14], pp9[15],  pp10[15]};
    assign inQ_2 = {pp8[14], pp8[15], pp10[14], pp11[14]};
    CLA4 CLA0Q(sQ, cQ, inQ_1, inQ_2);

    wire [3:0] sR, inR_1, inR_2;
    wire cR;
    assign inR_1 = {pp4[3], pp4[4], pp4[5], pp4[6]};
    assign inR_2 = {pp5[2], pp5[3], pp5[4], pp5[5]};
    CLA4 CLA0R(sR, cR, inR_1, inR_2);

    wire [3:0] sS, inS_1, inS_2;
    wire cS;
    assign inS_1 = {pp4[7], s2[0], s4[3], c4};
    assign inS_2 = {pp5[6], s4[2], c7,    s5[0]};
    CLA4_c CLA0S(sS, cS, inS_1, inS_2, sA[0]);

    wire [3:0] sT, inT_1, inT_2;
    wire cT;
    assign inT_1 = {s8[2], s5[2], s9[0], s9[1]};
    assign inT_2 = {cA,    s8[3], sB[2], sB[3]};
    CLA4_c CLA0T(sT, cT, inT_1, inT_2, sG[0]);

    wire [3:0] sU, inU_1, inU_2;
    wire cU;
    assign inU_1 = {s9[2], s9[3], c9, sC[3]};
    assign inU_2 = {cB, sC[1], sC[2], sF[1]};
    CLA4_c CLA0U(sU, cU, inU_1, inU_2, cG);

    wire [3:0] sV, inV_1, inV_2;
    wire cV;
    assign inV_1 = {pp10[13], pp11[13], pp12[13], pp12[14]};
    assign inV_2 = {pp11[12], pp12[12], pp13[12], pp13[13]};
    CLA4 CLA0V(sV, cV, inV_1, inV_2);


    wire [3:0] sW, inW_1, inW_2;
    wire cW;
    assign inW_1 = {pp6[2], pp6[3], s4[0], s4[1]};
    assign inW_2 = {pp7[1], pp7[2], s7[1], s7[2]};
    CLA4 CLA0W(sW, cW, inW_1, inW_2);


    wire [3:0] sX, inX_1, inX_2;
    wire cX;
    assign inX_1 = {s7[3], s8[0], s8[1], sB[0]};
    assign inX_2 = {sA[1], sA[2], sA[3], sD[2]};
    CLA4_c CLA0X(sX, cX, inX_1, inX_2, pp12[0]);


    wire [3:0] sY, inY_1, inY_2;
    wire cY;
    assign inY_1 = {sB[1], cD, sE[1], sC[0]};
    assign inY_2 = {sD[3], sE[0], sG[3], sE[2]};
    CLA4_c CLA0Y(sY, cY, inY_1, inY_2, sG[1]);

    wire [3:0] sZ, inZ_1, inZ_2;
    wire cZ;
    assign inZ_1 = {sE[3], cE, pp7[15], cC};
    assign inZ_2 = {pp5[15], sF[0], c6, sF[2]};
    CLA4 CLA0Z(sZ, cZ, inZ_1, inZ_2);

    wire [3:0] s11, in11_1, in11_2;
    wire c11;
    assign in11_1 = {pp13[11], pp14[11], pp14[12], pp14[13]};
    assign in11_2 = {cF,       pp15[10], pp15[11], pp15[12]};
    CLA4 CLA11(s11, c11, in11_1, in11_2);

    /* 2nd Stage */
    wire [3:0] s12, in12_1, in12_2;
    wire c12;
    assign in12_1 = {pp0[3], pp0[4], sH[0], sH[1]};
    assign in12_2 = {pp1[2], pp1[3], pp2[3], sM[0]};
    CLA4 CLA12(s12, c12, in12_1, in12_2);


    wire [3:0] s13, in13_1, in13_2;
    wire c13;
    assign in13_1 = {sH[2], sH[3], cH,    sI[1]};
    assign in13_2 = {sM[1], sM[2], sI[0], cM};
    CLA4_c CLA13(s13, c13, in13_1, in13_2, pp7[0]);

    wire [3:0] s14, in14_1, in14_2;
    wire c14;
    assign in14_1 = {sI[2], sI[3], cI,    sJ[1]};
    assign in14_2 = {sN[1], sN[2], sI[0], cN};
    CLA4_c CLA14(s14, c14, in14_1, in14_2, sW[3]);

    wire [3:0] s15, in15_1, in15_2;
    wire c15;
    assign in15_1 = {sJ[2], sJ[3], cJ,    sK[1]};
    assign in15_2 = {sO[1], sO[2], sK[0], cO};
    CLA4_c CLA15(s15, c15, in15_1, in15_2, sX[3]);

    wire [3:0] s16, in16_1, in16_2;
    wire c16;
    assign in16_1 = {sK[2], sK[3], cK,    sL[0]};
    assign in16_2 = {sP[1], sP[2], sL[0], cP};
    CLA4_c CLA16(s16, c16, in16_1, in16_2, sY[3]);

    wire [3:0] s17, in17_1, in17_2;
    wire c17;
    assign in17_1 = {sL[2], sL[3], cL,    cQ};
    assign in17_2 = {sQ[1], sQ[2], sQ[3], sV[3]};
    CLA4_c CLA17(s17, c17, in17_1, in17_2, sZ[3]);

    wire [3:0] s18, in18_1, in18_2;
    wire c18;
    assign in18_1 = {pp2[2], pp3[2], pp4[2], sR[0]};
    assign in18_2 = {pp3[1], pp4[1], pp5[1], pp6[1]};
    CLA4 CLA18(s18, c18, in18_1, in18_2);

    wire [3:0] s19, in19_1, in19_2;
    wire c19;
    assign in19_1 = {sR[1], sM[3], sN[0], cR};
    assign in19_2 = {sW[0], sR[2], sR[3], sS[0]};
    CLA4_c CLA19(s19, c19, in19_1, in19_2, pp8[0]);

    wire [3:0] s20, in20_1, in20_2;
    wire c20;
    assign in20_1 = {sS[1], sN[3], sO[0], cS};
    assign in20_2 = {cW,    sS[2], sS[3], sT[0]};
    CLA4_c CLA20(s20, c20, in20_1, in20_2, sX[0]);

    wire [3:0] s21, in21_1, in21_2;
    wire c21;
    assign in21_1 = {sT[1], sO[3], sP[0], cT};
    assign in21_2 = {cX,    sT[2], sT[3], sU[0]};
    CLA4_c CLA21(s21, c21, in21_1, in21_2, sY[0]);


    wire [3:0] s22, in22_1, in22_2;
    wire c22;
    assign in22_1 = {sU[1], sP[3], sQ[0], cU};
    assign in22_2 = {cY,    sU[2], sU[3], sV[0]};
    CLA4_c CLA22(s22, c22, in22_1, in22_2, sZ[0]);


    wire [3:0] s23, in23_1, in23_2;
    wire c23;
    assign in23_1 = {sV[1], sV[2],  s11[2], cV};
    assign in23_2 = {cZ,    s11[1], pp11[15], s11[3]};
    CLA4_c CLA23(s23, c23, in23_1, in23_2, s11[0]);


    wire [2:0] s24, in24_1, in24_2;
    wire c24;
    assign in24_1 = {pp12[15], pp14[14], pp14[15]};
    assign in24_2 = {pp13[14], pp15[13], pp15[14]};
    CLA3 CLA24(s24, c24, in24_1, in24_2);

    half_adder HA01(s25, c25, c11, pp13[15]);

    /* 3rd Stage */
    full_adder fa01(s31, c31, pp0[2], pp1[1], pp2[0]);
    full_adder fa02(s32, c32, s12[0], pp2[1], pp3[0]);
    full_adder fa03(s33, c33, s12[1], s18[0], pp4[0]);
    full_adder fa04(s34, c34, s12[2], s18[1], pp5[0]);
    full_adder fa05(s35, c35, s12[3], s18[2], pp6[0]);
    full_adder fa06(s36, c36, s13[0], s18[3], c12);
    full_adder fa07(s37, c37, s13[1], s19[0], c18);
    full_adder fa08(s38, c38, s13[2], s19[1], sW[1]);
    full_adder fa09(s39, c39, s13[3], s19[2], sW[2]);
    full_adder fa10(s40, c40, s14[0], s19[3], c13);
    full_adder fa11(s41, c41, s14[1], s20[0], c19);
    full_adder fa12(s42, c42, s14[2], s20[1], sX[1]);
    full_adder fa13(s43, c43, s14[3], s20[2], sX[2]);
    full_adder fa14(s44, c44, s15[0], s20[3], c14);
    full_adder fa15(s45, c45, s15[1], s21[0], c20);
    full_adder fa16(s46, c46, s15[2], s21[1], sY[1]);
    full_adder fa17(s47, c47, s15[3], s21[2], sY[2]);
    full_adder fa18(s48, c48, s16[0], s21[3], c15);
    full_adder fa19(s49, c49, s16[1], s22[0], c21);
    full_adder fa20(s50, c50, s16[2], s22[1], sZ[1]);
    full_adder fa21(s51, c51, s16[3], s22[2], sZ[2]);
    full_adder fa22(s52, c52, s17[0], s22[3], c16);
    full_adder fa23(s53, c53, s17[1], s23[0], c22);
    half_adder ha02(s54, c54, s17[2], s23[1]);
    half_adder ha03(s55, c55, s17[3], s23[2]);
    full_adder fa24(s56, c56, s24[0], s23[3], c17);
    full_adder fa25(s57, c57, s24[1], s25,    c23);
    half_adder ha04(s58, c58, s24[2], c25);
    half_adder ha05(s59, c59, c24,    pp15[15]);

    /* Final Stage */
    wire [30:0] G, P, C;
    assign G[0]  = pp0[1] & pp1[0];
    assign G[1]  = s31    & 0;
    assign G[2]  = s32    & c31;
    assign G[3]  = s33    & c32;
    assign G[4]  = s34    & c33;
    assign G[5]  = s35    & c34;
    assign G[6]  = s36    & c35;
    assign G[7]  = s37    & c36;
    assign G[8]  = s38    & c37;
    assign G[9]  = s39    & c38;
    assign G[10] = s40    & c39;
    assign G[11] = s41    & c40;
    assign G[12] = s42    & c41;
    assign G[13] = s43    & c42;
    assign G[14] = s44    & c43;
    assign G[15] = s45    & c44;
    assign G[16] = s46    & c45;
    assign G[17] = s47    & c46;
    assign G[18] = s48    & c47;
    assign G[19] = s49    & c48;
    assign G[20] = s50    & c49;
    assign G[21] = s51    & c50;
    assign G[22] = s52    & c51;
    assign G[23] = s53    & c52;
    assign G[24] = s54    & c53;
    assign G[25] = s55    & c54;
    assign G[26] = s56    & c55;
    assign G[27] = s57    & c56;
    assign G[28] = s58    & c57;
    assign G[29] = s59    & c58;
    assign G[30] = 0      & c59;
    assign P[0]  = pp0[1] ^ pp1[0];
    assign P[1]  = s31    ^ 0;
    assign P[2]  = s32    ^ c31;
    assign P[3]  = s33    ^ c32;
    assign P[4]  = s34    ^ c33;
    assign P[5]  = s35    ^ c34;
    assign P[6]  = s36    ^ c35;
    assign P[7]  = s37    ^ c36;
    assign P[8]  = s38    ^ c37;
    assign P[9]  = s39    ^ c38;
    assign P[10] = s40    ^ c39;
    assign P[11] = s41    ^ c40;
    assign P[12] = s42    ^ c41;
    assign P[13] = s43    ^ c42;
    assign P[14] = s44    ^ c43;
    assign P[15] = s45    ^ c44;
    assign P[16] = s46    ^ c45;
    assign P[17] = s47    ^ c46;
    assign P[18] = s48    ^ c47;
    assign P[19] = s49    ^ c48;
    assign P[20] = s50    ^ c49;
    assign P[21] = s51    ^ c50;
    assign P[22] = s52    ^ c51;
    assign P[23] = s53    ^ c52;
    assign P[24] = s54    ^ c53;
    assign P[25] = s55    ^ c54;
    assign P[26] = s56    ^ c55;
    assign P[27] = s57    ^ c56;
    assign P[28] = s58    ^ c57;
    assign P[29] = s59    ^ c58;
    assign P[30] = 0      ^ c59;
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
    assign C[29] = G[28] | (P[28] & C[28]);
    assign C[30] = G[29] | (P[29] & C[29]);
    assign product[31] = G[30] | (P[30] & C[30]);

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
    assign product[15] = P[14] ^ C[14];
    assign product[16] = P[15] ^ C[15];
    assign product[17] = P[16] ^ C[16];
    assign product[18] = P[17] ^ C[17];
    assign product[19] = P[18] ^ C[18];
    assign product[20] = P[19] ^ C[19];
    assign product[21] = P[20] ^ C[20];
    assign product[22] = P[21] ^ C[21];
    assign product[23] = P[22] ^ C[22];
    assign product[24] = P[23] ^ C[23];
    assign product[25] = P[24] ^ C[24];
    assign product[26] = P[25] ^ C[25];
    assign product[27] = P[26] ^ C[26];
    assign product[28] = P[27] ^ C[27];
    assign product[29] = P[28] ^ C[28];
    assign product[30] = P[29] ^ C[29];
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

module CLA3(output [2:0] sum,
            output cout,
            input [2:0] in1, in2);

    wire [2:0] G; /* Generate */
    wire [2:0] P; /* Propagate */
    wire [2:0] C; /* Carry */

    assign G[0] = in1[2] & in2[2]; /*Generate    Gi = Ai * Bi */
    assign G[1] = in1[1] & in2[1];
    assign G[2] = in1[0] & in2[0];

    assign P[0] = in1[2] ^ in2[2];
    assign P[1] = in1[1] ^ in2[1];
    assign P[2] = in1[0] ^ in2[0];

    assign C[0] = 0;
    assign C[1] = G[0] | (P[0] & C[0]);
    assign C[2] = G[1] | (P[1] & C[1]);
    assign cout = G[2] | (P[2] & C[2]);
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
