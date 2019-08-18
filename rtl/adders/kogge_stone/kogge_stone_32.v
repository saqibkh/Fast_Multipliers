module kogge_stone_32(in1, in2, sum, cin, cout);

    /* This is a 32 bit kogge-stone parallel prefix adder
     * Area: 631.677782
     * Power: mW
     * Timing: ns
     */
    input [31:0] in1, in2; //input
    output [31:0] sum; //output
    input cin; //carry-in
    output cout; //carry-out
    wire [31:0] G_Z, P_Z, //wires
    G_A, P_A,
    G_B, P_B,
    G_C, P_C,
    G_D, P_D,
    G_E, P_E,
    G_F, P_F;

    assign P_Z = in1 ^ in2;
    assign G_Z = in1 & in2;

    /*level 1*/
    gray_cell level_0A(cin, P_Z[0], G_Z[0], G_A[0]);
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
    black_cell level_UA(G_Z[29], P_Z[30], G_Z[30], P_Z[29], G_A[30], P_A[30]);
    black_cell level_VA(G_Z[30], P_Z[31], G_Z[31], P_Z[30], G_A[31], P_A[31]);

    /*level 2*/
    gray_cell level_1B(cin,      P_A[1],  G_A[1],  G_B[1]);
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
    black_cell level_UB(G_A[28], P_A[30], G_A[30], P_A[28], G_B[30], P_B[30]);
    black_cell level_VB(G_A[29], P_A[31], G_A[31], P_A[29], G_B[31], P_B[31]);

    /*level 3*/
    gray_cell level_3C(cin,      P_B[3],  G_B[3],  G_C[3]);
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
    black_cell level_UC(G_B[26], P_B[30], G_B[30], P_B[26], G_C[30], P_C[30]);
    black_cell level_VC(G_B[27], P_B[31], G_B[31], P_B[27], G_C[31], P_C[31]);

    /*level 4*/
    gray_cell level_7D(cin,       P_C[7],   G_C[7],            G_D[7]);
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
    black_cell level_UD(G_C[22],  P_C[30],  G_C[30],  P_C[22], G_D[30], P_D[30]);
    black_cell level_VD(G_C[23],  P_C[31],  G_C[31],  P_C[23], G_D[31], P_D[31]);

    /*level 5*/
    gray_cell level_FE(cin,       P_D[15],  G_D[15],           G_E[15]);
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
    gray_cell level_TE(G_D[13],   P_D[29],  G_D[29],           G_E[29]);
    gray_cell level_UE(G_D[14],   P_D[30],  G_D[30],           G_E[30]);
    black_cell level_VE(G_D[15],  P_D[31],  G_D[31],  P_D[15],  G_E[31], P_E[31]);
    
    /*level 6*/
    gray_cell level_VF(cin, P_E[31], G_E[31], cout);

    /*outputs*/
    assign sum[0]  = cin     ^ P_Z[0];
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
    assign sum[30] = G_D[29] ^ P_Z[30];
    assign sum[31] = G_D[30] ^ P_Z[31];
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
