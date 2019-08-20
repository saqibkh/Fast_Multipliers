module multiplier_16bits_version3(product, A, B);

    /* This implementation is similar to 16bit dadda with kogge-stone reduction, and
     * uses kogge-stone for carry propagating adder
     * Area: 7368.479084 
     * Power: 4.235mW
     * Timing: 1.60ns 
     */
 
    input [15:0] A, B;
    output [31:0] product;

    wire [15:0] pp0, pp1, pp2, pp3, pp4, pp5, pp6, pp7, pp8, pp9, pp10, pp11, pp12, pp13, pp14, pp15;

    assign pp0  = A[0]  ? B : 16'b0000000000000000;
    assign pp1  = A[1]  ? B : 16'b0000000000000000;
    assign pp2  = A[2]  ? B : 16'b0000000000000000;
    assign pp3  = A[3]  ? B : 16'b0000000000000000;
    assign pp4  = A[4]  ? B : 16'b0000000000000000;
    assign pp5  = A[5]  ? B : 16'b0000000000000000;
    assign pp6  = A[6]  ? B : 16'b0000000000000000;
    assign pp7  = A[7]  ? B : 16'b0000000000000000;
    assign pp8  = A[8]  ? B : 16'b0000000000000000;
    assign pp9  = A[9]  ? B : 16'b0000000000000000;
    assign pp10 = A[10] ? B : 16'b0000000000000000;
    assign pp11 = A[11] ? B : 16'b0000000000000000;
    assign pp12 = A[12] ? B : 16'b0000000000000000;
    assign pp13 = A[13] ? B : 16'b0000000000000000;
    assign pp14 = A[14] ? B : 16'b0000000000000000;
    assign pp15 = A[15] ? B : 16'b0000000000000000;

    assign product[0] = pp0[0];

    /* CLA 1 */
    wire [3:0] s1, in1_1, in1_2;
    wire c1;
    assign in1_1 = {pp2[12], pp2[13], pp2[14], pp2[15]};
    assign in1_2 = {pp3[11], pp3[12], pp3[13], pp3[14]};
    kogge_stone_4_c CLA01(s1, c1, in1_1, in1_2, pp14[0]);

    /* CLA 2 */
    wire [3:0] s2, in2_1, in2_2;
    wire c2;
    assign in2_1 = {pp4[8], pp4[9], pp4[10], pp4[11]};
    assign in2_2 = {pp5[7], pp5[8], pp5[9],  pp5[10]};
    kogge_stone_4 CLA02(s2, c2, in2_1, in2_2);

    wire [3:0] s3, in3_1, in3_2;
    wire c3;
    assign in3_1 = {pp4[12], pp4[13], pp4[14], pp4[15]};
    assign in3_2 = {pp5[11], pp5[12], pp5[13], pp5[14]};
    kogge_stone_4 CLA03(s3, c3, in3_1, in3_2);

    wire [3:0] s4, in4_1, in4_2;
    wire c4;
    assign in4_1 = {pp6[4], pp6[5], pp6[6], pp6[7]};
    assign in4_2 = {pp7[3], pp7[4], pp7[5], pp7[6]};
    kogge_stone_4 CLA04(s4, c4, in4_1, in4_2);

    wire [3:0] s5, in5_1, in5_2;
    wire c5;
    assign in5_1 = {pp6[8], pp6[9], pp6[10], pp6[11]};
    assign in5_2 = {pp7[7], pp7[8], pp7[9],  pp7[10]};
    kogge_stone_4 CLA05(s5, c5, in5_1, in5_2);

    wire [3:0] s6, in6_1, in6_2;
    wire c6;
    assign in6_1 = {pp6[12], pp6[13], pp6[14], pp6[15]};
    assign in6_2 = {pp7[11], pp7[12], pp7[13], pp7[14]};
    kogge_stone_4 CLA06(s6, c6, in6_1, in6_2);

    wire [3:0] s7, in7_1, in7_2;
    wire c7;
    assign in7_1 = {pp8[1], pp8[2], pp8[3], pp8[4]};
    assign in7_2 = {pp9[0], pp9[1], pp9[2], pp9[3]};
    kogge_stone_4 CLA07(s7, c7, in7_1, in7_2);

    wire [3:0] s8, in8_1, in8_2;
    wire c8;
    assign in8_1 = {pp8[5], pp8[6], pp8[7], pp8[8]};
    assign in8_2 = {pp9[4], pp9[5], pp9[6], pp9[7]};
    kogge_stone_4 CLA08(s8, c8, in8_1, in8_2);

    wire [3:0] s9, in9_1, in9_2;
    wire c9;
    assign in9_1 = {pp8[9], pp8[10], pp8[11], pp8[12]};
    assign in9_2 = {pp9[8], pp9[9],  pp9[10], pp9[11]};
    kogge_stone_4 CLA09(s9, c9, in9_1, in9_2);

    wire [3:0] sA, inA_1, inA_2;
    wire cA;
    assign inA_1 = {pp10[1], pp10[2], pp10[3], pp10[4]};
    assign inA_2 = {pp11[0], pp11[1], pp11[2], pp11[3]};
    kogge_stone_4 CLA0A(sA, cA, inA_1, inA_2);

    wire [3:0] sB, inB_1, inB_2;
    wire cB;
    assign inB_1 = {pp10[5], pp10[6], pp10[7], pp10[8]};
    assign inB_2 = {pp11[4], pp11[5], pp11[6], pp11[7]};
    kogge_stone_4 CLA0B(sB, cB, inB_1, inB_2);

    wire [3:0] sC, inC_1, inC_2;
    wire cC;
    assign inC_1 = {pp10[9], pp10[10], pp10[11], pp10[12]};
    assign inC_2 = {pp11[8], pp11[9],  pp11[10], pp11[11]};
    kogge_stone_4 CLA0C(sC, cC, inC_1, inC_2);


    wire [3:0] sD, inD_1, inD_2;
    wire cD;
    assign inD_1 = {pp12[1], pp12[2], pp12[3], pp12[4]};
    assign inD_2 = {pp13[0], pp13[1], pp13[2], pp13[3]};
    kogge_stone_4_c CLA0D(sD, cD, inD_1, inD_2, pp3[10]);

    wire [3:0] sE, inE_1, inE_2;
    wire cE;
    assign inE_1 = {pp12[5], pp12[6], pp12[7], pp12[8]};
    assign inE_2 = {pp13[4], pp13[5], pp13[6], pp13[7]};
    kogge_stone_4 CLA0E(sE, cE, inE_1, inE_2);

    wire [2:0] sF, inF_1, inF_2;
    wire cF;
    assign inF_1 = {pp12[9], pp12[10], pp12[11]};
    assign inF_2 = {pp13[8], pp13[9],  pp13[10]};
    kogge_stone_3 CLA0F(sF, cF, inF_1, inF_2);

    wire [3:0] sG, inG_1, inG_2;
    wire cG;
    assign inG_1 = {pp14[1], pp14[2], pp14[3], pp14[4]};
    assign inG_2 = {pp15[0], pp15[1], pp15[2], pp15[3]};
    kogge_stone_4_c CLA0G(sG, cG, inG_1, inG_2, pp1[14]);


    /* 2nd Stage */

    wire [3:0] sH, inH_1, inH_2;
    wire cH;
    assign inH_1 = {pp0[5], pp0[6], pp0[7], pp0[8]};
    assign inH_2 = {pp1[4], pp1[5], pp1[6], pp1[7]};
    kogge_stone_4 CLA0H(sH, cH, inH_1, inH_2);

    wire [3:0] sI, inI_1, inI_2;
    wire cI;
    assign inI_1 = {pp0[9], pp0[10], pp0[11], pp0[12]};
    assign inI_2 = {pp1[8], pp1[9],  pp1[10], pp1[11]};
    kogge_stone_4_c CLA0I(sI, cI, inI_1, inI_2, s7[0]);

    wire [3:0] sJ, inJ_1, inJ_2;
    wire cJ;
    assign inJ_1 = {pp0[13], pp0[14], pp0[15], pp1[15]};
    assign inJ_2 = {pp1[12], pp1[13], s1[1],   s1[2]};
    kogge_stone_4_c CLA0J(sJ, cJ, inJ_1, inJ_2, sD[0]);
 
    wire [3:0] sK, inK_1, inK_2;
    wire cK;
    assign inK_1 = {s1[3], c1,    pp14[5], pp14[6]};
    assign inK_2 = {s3[1], s3[2], pp15[4], pp15[5]};
    kogge_stone_4_c CLA0K(sK, cK, inK_1, inK_2, sG[2]);

    wire [3:0] sL, inL_1, inL_2;
    wire cL;
    assign inL_1 = {pp14[7], pp14[8], pp14[9], pp14[10]};
    assign inL_2 = {pp15[6], pp15[7], pp15[8], pp15[9]};
    kogge_stone_4_c CLA0L(sL, cL, inL_1, inL_2, pp8[13]);


    wire [3:0] sM, inM_1, inM_2;
    wire cM;
    assign inM_1 = {pp2[4], pp2[5], pp2[6], pp2[7]};
    assign inM_2 = {pp3[3], pp3[4], pp3[5], pp3[6]};
    kogge_stone_4 CLA0M(sM, cM, inM_1, inM_2);

    wire [3:0] sN, inN_1, inN_2;
    wire cN;
    assign inN_1 = {pp2[8], pp2[9], pp2[10], pp2[11]};
    assign inN_2 = {pp3[7], pp3[8], pp3[9],  s2[1]};
    kogge_stone_4_c CLA0N(sN, cN, inN_1, inN_2, pp10[0]);

    wire [3:0] sO, inO_1, inO_2;
    wire cO;
    assign inO_1 = {s1[0], s2[3], c2,    s5[3]};
    assign inO_2 = {s2[2], s5[1], s3[0], c8};
    kogge_stone_4_c CLA0O(sO, cO, inO_1, inO_2, sD[1]);

    wire [3:0] sP, inP_1, inP_2;
    wire cP;
    assign inP_1 = {c5,    s3[3], c3,    s6[3]};
    assign inP_2 = {s6[0], s6[1], s6[2], pp9[12]};
    kogge_stone_4_c CLA0P(sP, cP, inP_1, inP_2, pp3[15]);


    wire [3:0] sQ, inQ_1, inQ_2;
    wire cQ;
    assign inQ_1 = {pp9[13], pp9[14], pp9[15],  pp10[15]};
    assign inQ_2 = {pp8[14], pp8[15], pp10[14], pp11[14]};
    kogge_stone_4 CLA0Q(sQ, cQ, inQ_1, inQ_2);

    wire [3:0] sR, inR_1, inR_2;
    wire cR;
    assign inR_1 = {pp4[3], pp4[4], pp4[5], pp4[6]};
    assign inR_2 = {pp5[2], pp5[3], pp5[4], pp5[5]};
    kogge_stone_4 CLA0R(sR, cR, inR_1, inR_2);

    wire [3:0] sS, inS_1, inS_2;
    wire cS;
    assign inS_1 = {pp4[7], s2[0], s4[3], c4};
    assign inS_2 = {pp5[6], s4[2], c7,    s5[0]};
    kogge_stone_4_c CLA0S(sS, cS, inS_1, inS_2, sA[0]);

    wire [3:0] sT, inT_1, inT_2;
    wire cT;
    assign inT_1 = {s8[2], s5[2], s9[0], s9[1]};
    assign inT_2 = {cA,    s8[3], sB[2], sB[3]};
    kogge_stone_4_c CLA0T(sT, cT, inT_1, inT_2, sG[0]);

    wire [3:0] sU, inU_1, inU_2;
    wire cU;
    assign inU_1 = {s9[2], s9[3], c9, sC[3]};
    assign inU_2 = {cB, sC[1], sC[2], sF[1]};
    kogge_stone_4_c CLA0U(sU, cU, inU_1, inU_2, cG);

    wire [3:0] sV, inV_1, inV_2;
    wire cV;
    assign inV_1 = {pp10[13], pp11[13], pp12[13], pp12[14]};
    assign inV_2 = {pp11[12], pp12[12], pp13[12], pp13[13]};
    kogge_stone_4 CLA0V(sV, cV, inV_1, inV_2);


    wire [3:0] sW, inW_1, inW_2;
    wire cW;
    assign inW_1 = {pp6[2], pp6[3], s4[0], s4[1]};
    assign inW_2 = {pp7[1], pp7[2], s7[1], s7[2]};
    kogge_stone_4 CLA0W(sW, cW, inW_1, inW_2);


    wire [3:0] sX, inX_1, inX_2;
    wire cX;
    assign inX_1 = {s7[3], s8[0], s8[1], sB[0]};
    assign inX_2 = {sA[1], sA[2], sA[3], sD[2]};
    kogge_stone_4_c CLA0X(sX, cX, inX_1, inX_2, pp12[0]);


    wire [3:0] sY, inY_1, inY_2;
    wire cY;
    assign inY_1 = {sB[1], cD, sE[1], sC[0]};
    assign inY_2 = {sD[3], sE[0], sG[3], sE[2]};
    kogge_stone_4_c CLA0Y(sY, cY, inY_1, inY_2, sG[1]);

    wire [3:0] sZ, inZ_1, inZ_2;
    wire cZ;
    assign inZ_1 = {sE[3], cE, pp7[15], cC};
    assign inZ_2 = {pp5[15], sF[0], c6, sF[2]};
    kogge_stone_4 CLA0Z(sZ, cZ, inZ_1, inZ_2);

    wire [3:0] s11, in11_1, in11_2;
    wire c11;
    assign in11_1 = {pp13[11], pp14[11], pp14[12], pp14[13]};
    assign in11_2 = {cF,       pp15[10], pp15[11], pp15[12]};
    kogge_stone_4 CLA11(s11, c11, in11_1, in11_2);

    /* 2nd Stage */
    wire [3:0] s12, in12_1, in12_2;
    wire c12;
    assign in12_1 = {pp0[3], pp0[4], sH[0], sH[1]};
    assign in12_2 = {pp1[2], pp1[3], pp2[3], sM[0]};
    kogge_stone_4 CLA12(s12, c12, in12_1, in12_2);


    wire [3:0] s13, in13_1, in13_2;
    wire c13;
    assign in13_1 = {sH[2], sH[3], cH,    sI[1]};
    assign in13_2 = {sM[1], sM[2], sI[0], cM};
    kogge_stone_4_c CLA13(s13, c13, in13_1, in13_2, pp7[0]);

    wire [3:0] s14, in14_1, in14_2;
    wire c14;
    assign in14_1 = {sI[2], sI[3], cI,    sJ[1]};
    assign in14_2 = {sN[1], sN[2], sJ[0], cN};
    kogge_stone_4_c CLA14(s14, c14, in14_1, in14_2, sW[3]);

    wire [3:0] s15, in15_1, in15_2;
    wire c15;
    assign in15_1 = {sJ[2], sJ[3], cJ,    sK[1]};
    assign in15_2 = {sO[1], sO[2], sK[0], cO};
    kogge_stone_4_c CLA15(s15, c15, in15_1, in15_2, sX[3]);

    wire [3:0] s16, in16_1, in16_2;
    wire c16;
    assign in16_1 = {sK[2], sK[3], cK,    sL[1]};
    assign in16_2 = {sP[1], sP[2], sL[0], cP};
    kogge_stone_4_c CLA16(s16, c16, in16_1, in16_2, sY[3]);

    wire [3:0] s17, in17_1, in17_2;
    wire c17;
    assign in17_1 = {sL[2], sL[3], cL,    cQ};
    assign in17_2 = {sQ[1], sQ[2], sQ[3], sV[3]};
    kogge_stone_4_c CLA17(s17, c17, in17_1, in17_2, sZ[3]);

    wire [3:0] s18, in18_1, in18_2;
    wire c18;
    assign in18_1 = {pp2[2], pp3[2], pp4[2], sR[0]};
    assign in18_2 = {pp3[1], pp4[1], pp5[1], pp6[1]};
    kogge_stone_4 CLA18(s18, c18, in18_1, in18_2);

    wire [3:0] s19, in19_1, in19_2;
    wire c19;
    assign in19_1 = {sR[1], sM[3], sN[0], cR};
    assign in19_2 = {sW[0], sR[2], sR[3], sS[0]};
    kogge_stone_4_c CLA19(s19, c19, in19_1, in19_2, pp8[0]);

    wire [3:0] s20, in20_1, in20_2;
    wire c20;
    assign in20_1 = {sS[1], sN[3], sO[0], cS};
    assign in20_2 = {cW,    sS[2], sS[3], sT[0]};
    kogge_stone_4_c CLA20(s20, c20, in20_1, in20_2, sX[0]);

    wire [3:0] s21, in21_1, in21_2;
    wire c21;
    assign in21_1 = {sT[1], sO[3], sP[0], cT};
    assign in21_2 = {cX,    sT[2], sT[3], sU[0]};
    kogge_stone_4_c CLA21(s21, c21, in21_1, in21_2, sY[0]);


    wire [3:0] s22, in22_1, in22_2;
    wire c22;
    assign in22_1 = {sU[1], sP[3], sQ[0], cU};
    assign in22_2 = {cY,    sU[2], sU[3], sV[0]};
    kogge_stone_4_c CLA22(s22, c22, in22_1, in22_2, sZ[0]);


    wire [3:0] s23, in23_1, in23_2;
    wire c23;
    assign in23_1 = {sV[1], sV[2],  s11[2], cV};
    assign in23_2 = {cZ,    s11[1], pp11[15], s11[3]};
    kogge_stone_4_c CLA23(s23, c23, in23_1, in23_2, s11[0]);


    wire [2:0] s24, in24_1, in24_2;
    wire c24;
    assign in24_1 = {pp12[15], pp14[14], pp14[15]};
    assign in24_2 = {pp13[14], pp15[13], pp15[14]};
    kogge_stone_3 CLA24(s24, c24, in24_1, in24_2);

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

    wire [3:0] s26, in26_1, in26_2;
    wire c26;
    assign in26_1 = {s24[0], s24[1], s24[2], c24};
    assign in26_2 = {s23[3], s25, c25, pp15[15]};
    kogge_stone_4_c CLA26(s26, c26, in26_1, in26_2, c17);


    wire [29:0] s, in_1, in_2;
    wire c;
    assign in_1 = {s26[3],s26[2],s26[1],s26[0],s55,s54,s53,s52,s51,s50,s49,s48,s47,s46,s45,s44,s43,s42,s41,s40,s39,s38,s37,s36,s35,s34,s33,s32,s31,pp0[1]};
    assign in_2 = {1'b0,1'b0,c23,c55,c54,c53,c52,c51,c50,c49,c48,c47,c46,c45,c44,c43,c42,c41,c40,c39,c38,c37,c36,c35,c34,c33,c32,c31,1'b0,pp1[0]};
    kogge_stone_30 KS_27(s, c, in_1, in_2);
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
    assign product[15] = s[14];
    assign product[16] = s[15];
    assign product[17] = s[16];
    assign product[18] = s[17];
    assign product[19] = s[18];
    assign product[20] = s[19];
    assign product[21] = s[20];
    assign product[22] = s[21];
    assign product[23] = s[22];
    assign product[24] = s[23];
    assign product[25] = s[24];
    assign product[26] = s[25];
    assign product[27] = s[26];
    assign product[28] = s[27];
    assign product[29] = s[28];
    assign product[30] = s[29];
    or(product[31], c, c26);
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
    //gray_cell level_0A(1'b0, P_Z[0], G_Z[0], G_A[0]);
    black_cell level_1A(G_Z[0],  P_Z[1],  G_Z[1],  P_Z[0],  G_A[1],  P_A[1]);
    black_cell level_2A(G_Z[1],  P_Z[2],  G_Z[2],  P_Z[1],  G_A[2],  P_A[2]);

    /*level 2*/
    assign G_B[1] = G_A[1];
    //gray_cell level_1B(1'b0,      P_A[1],  G_A[1],  G_B[1]);
    gray_cell level_2B(G_A[0],   P_A[2],  G_A[2],  cout);

    /*outputs*/
    assign sum[0]  =           P_Z[0];
    assign sum[1]  = G_A[0]  ^ P_Z[1];
    assign sum[2]  = G_B[1]  ^ P_Z[2];
endmodule


module kogge_stone_4(sum, cout, in1, in2);
    input [3:0] in1, in2; //input
    output [3:0] sum; //output
    output cout; //carry-out
    wire [3:0] G_Z, P_Z, //wires
    G_A, P_A,
    G_B, P_B;

    assign P_Z[0] = in1[3] ^ in2[3];
    assign P_Z[1] = in1[2] ^ in2[2];
    assign P_Z[2] = in1[1] ^ in2[1];
    assign P_Z[3] = in1[0] ^ in2[0];
    assign G_Z[0] = in1[3] & in2[3];
    assign G_Z[1] = in1[2] & in2[2];
    assign G_Z[2] = in1[1] & in2[1];
    assign G_Z[3] = in1[0] & in2[0];

    /*level 1*/
    assign G_A[0] = G_Z[0];
    //gray_cell level_0A(1'b0, P_Z[0], G_Z[0], G_A[0]);
    black_cell level_1A(G_Z[0],  P_Z[1],  G_Z[1],  P_Z[0],  G_A[1],  P_A[1]);
    black_cell level_2A(G_Z[1],  P_Z[2],  G_Z[2],  P_Z[1],  G_A[2],  P_A[2]);
    black_cell level_3A(G_Z[2],  P_Z[3],  G_Z[3],  P_Z[2],  G_A[3],  P_A[3]);

    /*level 2*/
    assign G_B[1] = G_A[1];
    gray_cell level_1B(1'b0,      P_A[1],  G_A[1],  G_B[1]);
    gray_cell level_2B(G_A[0],   P_A[2],  G_A[2],  G_B[2]);
    black_cell level_3B(G_A[1],  P_A[3],  G_A[3],  P_A[1],  G_B[3],  P_B[3]);

    /*level 3*/
    assign cout = G_B[3];
    //gray_cell level_3C(1'b0,      P_B[3],  G_B[3],  cout);

    /*outputs*/
    assign sum[0]  =           P_Z[0];
    assign sum[1]  = G_A[0]  ^ P_Z[1];
    assign sum[2]  = G_B[1]  ^ P_Z[2];
    assign sum[3]  = G_B[2]  ^ P_Z[3];
endmodule

module kogge_stone_4_c(sum, cout, in1, in2, cin);
    input [3:0] in1, in2; //input
    input cin;
    output [3:0] sum; //output
    output cout; //carry-out
    wire [3:0] G_Z, P_Z, //wires
    G_A, P_A,
    G_B, P_B;

    assign P_Z[0] = in1[3] ^ in2[3];
    assign P_Z[1] = in1[2] ^ in2[2];
    assign P_Z[2] = in1[1] ^ in2[1];
    assign P_Z[3] = in1[0] ^ in2[0];
    assign G_Z[0] = in1[3] & in2[3];
    assign G_Z[1] = in1[2] & in2[2];
    assign G_Z[2] = in1[1] & in2[1];
    assign G_Z[3] = in1[0] & in2[0];

    /*level 1*/
    gray_cell level_0A(cin, P_Z[0], G_Z[0], G_A[0]);
    black_cell level_1A(G_Z[0],  P_Z[1],  G_Z[1],  P_Z[0],  G_A[1],  P_A[1]);
    black_cell level_2A(G_Z[1],  P_Z[2],  G_Z[2],  P_Z[1],  G_A[2],  P_A[2]);
    black_cell level_3A(G_Z[2],  P_Z[3],  G_Z[3],  P_Z[2],  G_A[3],  P_A[3]);

    /*level 2*/
    gray_cell level_1B(cin,      P_A[1],  G_A[1],  G_B[1]);
    gray_cell level_2B(G_A[0],   P_A[2],  G_A[2],  G_B[2]);
    black_cell level_3B(G_A[1],  P_A[3],  G_A[3],  P_A[1],  G_B[3],  P_B[3]);

    /*level 3*/
    gray_cell level_3C(cin,      P_B[3],  G_B[3],  cout);

    /*outputs*/
    assign sum[0]  = cin     ^ P_Z[0];
    assign sum[1]  = G_A[0]  ^ P_Z[1];
    assign sum[2]  = G_B[1]  ^ P_Z[2];
    assign sum[3]  = G_B[2]  ^ P_Z[3];
endmodule

module kogge_stone_2_c(sum, cout, in1, in2, cin);
    input [1:0] in1, in2; //input
    input cin;
    output [1:0] sum; //output
    output cout; //carry-out
    wire [1:0] G_Z, P_Z, //wires
    G_A, P_A,
    G_B, P_B;

    assign P_Z[0] = in1[1] ^ in2[1];
    assign P_Z[1] = in1[0] ^ in2[0];
    assign G_Z[0] = in1[1] & in2[1];
    assign G_Z[1] = in1[0] & in2[0];

    /*level 1*/
    gray_cell level_0A(cin, P_Z[0], G_Z[0], G_A[0]);
    black_cell level_1A(G_Z[0],  P_Z[1],  G_Z[1],  P_Z[0],  G_A[1],  P_A[1]);

    /*level 3*/
    gray_cell level_1B(cin,      P_A[1],  G_A[1],  cout);

    /*outputs*/
    assign sum[0]  = cin     ^ P_Z[0];
    assign sum[1]  = G_A[0]  ^ P_Z[1];
endmodule

module kogge_stone_30(sum, cout, in1, in2);
    input [29:0] in1, in2; //input
    output [29:0] sum; //output
    output cout; //carry-out
    wire [29:0] G_Z, P_Z, //wires
    G_A, P_A,
    G_B, P_B,
    G_C, P_C,
    G_D, P_D,
    G_E, P_E,
    G_F, P_F;

    assign P_Z = in1 ^ in2;
    assign G_Z = in1 & in2;

    /*level 1*/
    assign G_A[0] = G_Z[0];
    //gray_cell level_0A(cin, P_Z[0], G_Z[0], G_A[0]);
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
    black_cell level_EA(G_Z[13], P_Z[14], G_Z[14], P_Z[13], G_A[14], P_A[14]);
    black_cell level_FA(G_Z[14], P_Z[15], G_Z[15], P_Z[14], G_A[15], P_A[15]);
    black_cell level_GA(G_Z[15], P_Z[16], G_Z[16], P_Z[15], G_A[16], P_A[16]);
    black_cell level_HA(G_Z[16], P_Z[17], G_Z[17], P_Z[16], G_A[17], P_A[17]);
    black_cell level_IA(G_Z[17], P_Z[18], G_Z[18], P_Z[17], G_A[18], P_A[18]);
    black_cell level_JA(G_Z[18], P_Z[19], G_Z[19], P_Z[18], G_A[19], P_A[19]);
    black_cell level_KA(G_Z[19], P_Z[20], G_Z[20], P_Z[19], G_A[20], P_A[20]);
    black_cell level_LA(G_Z[20], P_Z[21], G_Z[21], P_Z[20], G_A[21], P_A[21]);
    black_cell level_MA(G_Z[21], P_Z[22], G_Z[22], P_Z[21], G_A[22], P_A[22]);
    black_cell level_NA(G_Z[22], P_Z[23], G_Z[23], P_Z[22], G_A[23], P_A[23]);
    black_cell level_OA(G_Z[23], P_Z[24], G_Z[24], P_Z[23], G_A[24], P_A[24]);
    black_cell level_PA(G_Z[24], P_Z[25], G_Z[25], P_Z[24], G_A[25], P_A[25]);
    black_cell level_QA(G_Z[25], P_Z[26], G_Z[26], P_Z[25], G_A[26], P_A[26]);
    black_cell level_RA(G_Z[26], P_Z[27], G_Z[27], P_Z[26], G_A[27], P_A[27]);
    black_cell level_SA(G_Z[27], P_Z[28], G_Z[28], P_Z[27], G_A[28], P_A[28]);
    black_cell level_TA(G_Z[28], P_Z[29], G_Z[29], P_Z[28], G_A[29], P_A[29]);

    /*level 2*/
    assign G_B[1] = G_A[1];
    //gray_cell level_1B(cin,      P_A[1],  G_A[1],  G_B[1]);
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
    black_cell level_EB(G_A[12], P_A[14], G_A[14], P_A[12], G_B[14], P_B[14]);
    black_cell level_FB(G_A[13], P_A[15], G_A[15], P_A[13], G_B[15], P_B[15]);
    black_cell level_GB(G_A[14], P_A[16], G_A[16], P_A[14], G_B[16], P_B[16]);
    black_cell level_HB(G_A[15], P_A[17], G_A[17], P_A[15], G_B[17], P_B[17]);
    black_cell level_IB(G_A[16], P_A[18], G_A[18], P_A[16], G_B[18], P_B[18]);
    black_cell level_JB(G_A[17], P_A[19], G_A[19], P_A[17], G_B[19], P_B[19]);
    black_cell level_KB(G_A[18], P_A[20], G_A[20], P_A[18], G_B[20], P_B[20]);
    black_cell level_LB(G_A[19], P_A[21], G_A[21], P_A[19], G_B[21], P_B[21]);
    black_cell level_MB(G_A[20], P_A[22], G_A[22], P_A[20], G_B[22], P_B[22]);
    black_cell level_NB(G_A[21], P_A[23], G_A[23], P_A[21], G_B[23], P_B[23]);
    black_cell level_OB(G_A[22], P_A[24], G_A[24], P_A[22], G_B[24], P_B[24]);
    black_cell level_PB(G_A[23], P_A[25], G_A[25], P_A[23], G_B[25], P_B[25]);
    black_cell level_QB(G_A[24], P_A[26], G_A[26], P_A[24], G_B[26], P_B[26]);
    black_cell level_RB(G_A[25], P_A[27], G_A[27], P_A[25], G_B[27], P_B[27]);
    black_cell level_SB(G_A[26], P_A[28], G_A[28], P_A[26], G_B[28], P_B[28]);
    black_cell level_TB(G_A[27], P_A[29], G_A[29], P_A[27], G_B[29], P_B[29]);

    /*level 3*/
    assign G_C[3] = G_B[3];
    //gray_cell level_3C(cin,      P_B[3],  G_B[3],  G_C[3]);
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
    black_cell level_EC(G_B[10], P_B[14], G_B[14], P_B[10], G_C[14], P_C[14]);
    black_cell level_FC(G_B[11], P_B[15], G_B[15], P_B[11], G_C[15], P_C[15]);
    black_cell level_GC(G_B[12], P_B[16], G_B[16], P_B[12], G_C[16], P_C[16]);
    black_cell level_HC(G_B[13], P_B[17], G_B[17], P_B[13], G_C[17], P_C[17]);
    black_cell level_IC(G_B[14], P_B[18], G_B[18], P_B[14], G_C[18], P_C[18]);
    black_cell level_JC(G_B[15], P_B[19], G_B[19], P_B[15], G_C[19], P_C[19]);
    black_cell level_KC(G_B[16], P_B[20], G_B[20], P_B[16], G_C[20], P_C[20]);
    black_cell level_LC(G_B[17], P_B[21], G_B[21], P_B[17], G_C[21], P_C[21]);
    black_cell level_MC(G_B[18], P_B[22], G_B[22], P_B[18], G_C[22], P_C[22]);
    black_cell level_NC(G_B[19], P_B[23], G_B[23], P_B[19], G_C[23], P_C[23]);
    black_cell level_OC(G_B[20], P_B[24], G_B[24], P_B[20], G_C[24], P_C[24]);
    black_cell level_PC(G_B[21], P_B[25], G_B[25], P_B[21], G_C[25], P_C[25]);
    black_cell level_QC(G_B[22], P_B[26], G_B[26], P_B[22], G_C[26], P_C[26]);
    black_cell level_RC(G_B[23], P_B[27], G_B[27], P_B[23], G_C[27], P_C[27]);
    black_cell level_SC(G_B[24], P_B[28], G_B[28], P_B[24], G_C[28], P_C[28]);
    black_cell level_TC(G_B[25], P_B[29], G_B[29], P_B[25], G_C[29], P_C[29]);

    /*level 4*/
    assign G_D[7] = G_C[7];
    //gray_cell level_7D(cin,       P_C[7],   G_C[7],            G_D[7]);
    gray_cell level_8D(G_A[0],    P_C[8],   G_C[8],            G_D[8]);
    gray_cell level_9D(G_B[1],    P_C[9],   G_C[9],            G_D[9]);
    gray_cell level_AD(G_B[2],    P_C[10],  G_C[10],           G_D[10]);
    gray_cell level_BD(G_C[3],    P_C[11],  G_C[11],           G_D[11]);
    gray_cell level_CD(G_C[4],    P_C[12],  G_C[12],           G_D[12]);
    gray_cell level_DD(G_C[5],    P_C[13],  G_C[13],           G_D[13]);
    gray_cell level_ED(G_C[6],    P_C[14],  G_C[14],           G_D[14]);
    black_cell level_FD(G_C[7],   P_C[15],  G_C[15],  P_C[7],  G_D[15], P_D[15]);
    black_cell level_GD(G_C[8],   P_C[16],  G_C[16],  P_C[8],  G_D[16], P_D[16]);
    black_cell level_HD(G_C[9],   P_C[17],  G_C[17],  P_C[9],  G_D[17], P_D[17]);
    black_cell level_ID(G_C[10],  P_C[18],  G_C[18],  P_C[10], G_D[18], P_D[18]);
    black_cell level_JD(G_C[11],  P_C[19],  G_C[19],  P_C[11], G_D[19], P_D[19]);
    black_cell level_KD(G_C[12],  P_C[20],  G_C[20],  P_C[12], G_D[20], P_D[20]);
    black_cell level_LD(G_C[13],  P_C[21],  G_C[21],  P_C[13], G_D[21], P_D[21]);
    black_cell level_MD(G_C[14],  P_C[22],  G_C[22],  P_C[14], G_D[22], P_D[22]);
    black_cell level_ND(G_C[15],  P_C[23],  G_C[23],  P_C[15], G_D[23], P_D[23]);
    black_cell level_OD(G_C[16],  P_C[24],  G_C[24],  P_C[16], G_D[24], P_D[24]);
    black_cell level_PD(G_C[17],  P_C[25],  G_C[25],  P_C[17], G_D[25], P_D[25]);
    black_cell level_QD(G_C[18],  P_C[26],  G_C[26],  P_C[18], G_D[26], P_D[26]);
    black_cell level_RD(G_C[19],  P_C[27],  G_C[27],  P_C[19], G_D[27], P_D[27]);
    black_cell level_SD(G_C[20],  P_C[28],  G_C[28],  P_C[20], G_D[28], P_D[28]);
    black_cell level_TD(G_C[21],  P_C[29],  G_C[29],  P_C[21], G_D[29], P_D[29]);

    /*level 5*/
    assign G_E[15] = G_D[15];
    //gray_cell level_FE(cin,       P_D[15],  G_D[15],           G_E[15]);
    gray_cell level_GE(G_A[0],    P_D[16],  G_D[16],           G_E[16]);
    gray_cell level_HE(G_B[1],    P_D[17],  G_D[17],           G_E[17]);
    gray_cell level_IE(G_B[2],    P_D[18],  G_D[18],           G_E[18]);
    gray_cell level_JE(G_C[3],    P_D[19],  G_D[19],           G_E[19]);
    gray_cell level_KE(G_C[4],    P_D[20],  G_D[20],           G_E[20]);
    gray_cell level_LE(G_C[5],    P_D[21],  G_D[21],           G_E[21]);
    gray_cell level_ME(G_C[6],    P_D[22],  G_D[22],           G_E[22]);
    gray_cell level_NE(G_D[7],    P_D[23],  G_D[23],           G_E[23]);
    gray_cell level_OE(G_D[8],    P_D[24],  G_D[24],           G_E[24]);
    gray_cell level_PE(G_D[9],    P_D[25],  G_D[25],           G_E[25]);
    gray_cell level_QE(G_D[10],   P_D[26],  G_D[26],           G_E[26]);
    gray_cell level_RE(G_D[11],   P_D[27],  G_D[27],           G_E[27]);
    gray_cell level_SE(G_D[12],   P_D[28],  G_D[28],           G_E[28]);
    gray_cell level_TE(G_D[13],   P_D[29],  G_D[29],           cout);

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
    assign sum[14] = G_D[13] ^ P_Z[14];
    assign sum[15] = G_D[14] ^ P_Z[15];
    assign sum[16] = G_D[15] ^ P_Z[16];
    assign sum[17] = G_D[16] ^ P_Z[17];
    assign sum[18] = G_D[17] ^ P_Z[18];
    assign sum[19] = G_D[18] ^ P_Z[19];
    assign sum[20] = G_D[19] ^ P_Z[20];
    assign sum[21] = G_D[20] ^ P_Z[21];
    assign sum[22] = G_D[21] ^ P_Z[22];
    assign sum[23] = G_D[22] ^ P_Z[23];
    assign sum[24] = G_D[23] ^ P_Z[24];
    assign sum[25] = G_D[24] ^ P_Z[25];
    assign sum[26] = G_D[25] ^ P_Z[26];
    assign sum[27] = G_D[26] ^ P_Z[27];
    assign sum[28] = G_D[27] ^ P_Z[28];
    assign sum[29] = G_D[28] ^ P_Z[29];
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


