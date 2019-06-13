module wallace_unsigned_multiplier_CLA_Reduced_8(product, A, B);
    input [7:0] A, B;
    output [15:0] product;

    wire [7:0] pp0, pp1, pp2, pp3, pp4, pp5, pp6, pp7;

    and AND00(pp0[0], A[0], B[0]);
    and AND01(pp0[1], A[1], B[0]);
    and AND02(pp0[2], A[2], B[0]);
    and AND03(pp0[3], A[3], B[0]);
    and AND04(pp0[4], A[4], B[0]);
    and AND05(pp0[5], A[5], B[0]);
    and AND06(pp0[6], A[6], B[0]);
    and AND07(pp0[7], A[7], B[0]);
    and AND08(pp1[0], A[0], B[1]);
    and AND09(pp1[1], A[1], B[1]);
    and AND10(pp1[2], A[2], B[1]);
    and AND11(pp1[3], A[3], B[1]);
    and AND12(pp1[4], A[4], B[1]);
    and AND13(pp1[5], A[5], B[1]);
    and AND14(pp1[6], A[6], B[1]);
    and AND15(pp1[7], A[7], B[1]);
    and AND16(pp2[0], A[0], B[2]);
    and AND17(pp2[1], A[1], B[2]);
    and AND18(pp2[2], A[2], B[2]);
    and AND19(pp2[3], A[3], B[2]);
    and AND20(pp2[4], A[4], B[2]);
    and AND21(pp2[5], A[5], B[2]);
    and AND22(pp2[6], A[6], B[2]);
    and AND23(pp2[7], A[7], B[2]);
    and AND24(pp3[0], A[0], B[3]);
    and AND25(pp3[1], A[1], B[3]);
    and AND26(pp3[2], A[2], B[3]);
    and AND27(pp3[3], A[3], B[3]);
    and AND28(pp3[4], A[4], B[3]);
    and AND29(pp3[5], A[5], B[3]);
    and AND30(pp3[6], A[6], B[3]);
    and AND31(pp3[7], A[7], B[3]);
    and AND32(pp4[0], A[0], B[4]);
    and AND33(pp4[1], A[1], B[4]);
    and AND34(pp4[2], A[2], B[4]);
    and AND35(pp4[3], A[3], B[4]);
    and AND36(pp4[4], A[4], B[4]);
    and AND37(pp4[5], A[5], B[4]);
    and AND38(pp4[6], A[6], B[4]);
    and AND39(pp4[7], A[7], B[4]);
    and AND40(pp5[0], A[0], B[5]);
    and AND41(pp5[1], A[1], B[5]);
    and AND42(pp5[2], A[2], B[5]);
    and AND43(pp5[3], A[3], B[5]);
    and AND44(pp5[4], A[4], B[5]);
    and AND45(pp5[5], A[5], B[5]);
    and AND46(pp5[6], A[6], B[5]);
    and AND47(pp5[7], A[7], B[5]);
    and AND48(pp6[0], A[0], B[6]);
    and AND49(pp6[1], A[1], B[6]);
    and AND50(pp6[2], A[2], B[6]);
    and AND51(pp6[3], A[3], B[6]);
    and AND52(pp6[4], A[4], B[6]);
    and AND53(pp6[5], A[5], B[6]);
    and AND54(pp6[6], A[6], B[6]);
    and AND55(pp6[7], A[7], B[6]);
    and AND56(pp7[0], A[0], B[7]);
    and AND57(pp7[1], A[1], B[7]);
    and AND58(pp7[2], A[2], B[7]);
    and AND59(pp7[3], A[3], B[7]);
    and AND60(pp7[4], A[4], B[7]);
    and AND61(pp7[5], A[5], B[7]);
    and AND62(pp7[6], A[6], B[7]);
    and AND63(pp7[7], A[7], B[7]);

    /* First Stage */
    assign product[0] = pp0[0];

    /* First CLA */
    wire [3:0] G1, P1, C1;
    assign G1[0] = pp0[1] & pp1[0];
    assign G1[1] = pp0[2] & pp1[1];
    assign G1[2] = pp0[3] & pp1[2];
    assign G1[3] = pp0[4] & pp1[3];
    assign P1[0] = pp0[1] ^ pp1[0];
    assign P1[1] = pp0[2] ^ pp1[1];
    assign P1[2] = pp0[3] ^ pp1[2];
    assign P1[3] = pp0[4] ^ pp1[3];
    assign C1[1] = G1[0];
    assign C1[2] = G1[1] | (P1[1] & C1[1]);
    assign C1[3] = G1[2] | (P1[2] & C1[2]);    
    assign c1    = G1[3] | (P1[3] & C1[3]);
    assign s1    = P1[0];
    assign s2    = P1[1] ^ C1[1];
    assign s3    = P1[2] ^ C1[2];
    assign s4    = P1[3] ^ C1[3];
    assign product[1] = s1;   

    /* Second CLA */
    wire [2:0] G2, P2, C2;
    assign G2[0] = pp0[5] & pp1[4];
    assign G2[1] = pp0[6] & pp1[5];
    assign G2[2] = pp0[7] & pp1[6];
    assign P2[0] = pp0[5] ^ pp1[4];
    assign P2[1] = pp0[6] ^ pp1[5];
    assign P2[2] = pp0[7] ^ pp1[6];
    assign C2[1] = G2[0];
    assign C2[2] = G2[1] | (P2[1] & C2[1]);
    assign c2    = G2[2] | (P2[2] & C2[2]);
    assign s5    = P2[0];
    assign s6    = P2[1] ^ C2[1];
    assign s7    = P2[2] ^ C2[2];

    /* Third CLA */
    wire [3:0] G3, P3, C3;
    assign G3[0] = pp2[1] & pp3[0];
    assign G3[1] = pp2[2] & pp3[1];
    assign G3[2] = pp2[3] & pp3[2];
    assign G3[3] = pp2[4] & pp3[3];
    assign P3[0] = pp2[1] ^ pp3[0];
    assign P3[1] = pp2[2] ^ pp3[1];
    assign P3[2] = pp2[3] ^ pp3[2];
    assign P3[3] = pp2[4] ^ pp3[3];
    assign C3[1] = G3[0];
    assign C3[2] = G3[1] | (P3[1] & C3[1]);
    assign C3[3] = G3[2] | (P3[2] & C3[2]);
    assign c3    = G3[3] | (P3[3] & C3[3]);
    assign s8    = P3[0];
    assign s9    = P3[1] ^ C3[1];
    assign s10   = P3[2] ^ C3[2];
    assign s11   = P3[3] ^ C3[3];

    /* Fourth CLA */
    wire [2:0] G4, P4, C4;
    assign G4[0] = pp2[5] & pp3[4];
    assign G4[1] = pp2[6] & pp3[5];
    assign G4[2] = pp2[7] & pp3[6];
    assign P4[0] = pp2[5] ^ pp3[4];
    assign P4[1] = pp2[6] ^ pp3[5];
    assign P4[2] = pp2[7] ^ pp3[6];
    assign C4[1] = G4[0];
    assign C4[2] = G4[1] | (P4[1] & C4[1]);
    assign c4    = G4[2] | (P4[2] & C4[2]);
    assign s12   = P4[0];
    assign s13   = P4[1] ^ C4[1];
    assign s14   = P4[2] ^ C4[2];

    /* Fifth CLA */
    wire [3:0] G5, P5, C5;
    assign G5[0] = pp4[1] & pp5[0];
    assign G5[1] = pp4[2] & pp5[1];
    assign G5[2] = pp4[3] & pp5[2];
    assign G5[3] = pp4[4] & pp5[3];
    assign P5[0] = pp4[1] ^ pp5[0];
    assign P5[1] = pp4[2] ^ pp5[1];
    assign P5[2] = pp4[3] ^ pp5[2];
    assign P5[3] = pp4[4] ^ pp5[3];
    assign C5[1] = G5[0];
    assign C5[2] = G5[1] | (P5[1] & C5[1]);
    assign C5[3] = G5[2] | (P5[2] & C5[2]);
    assign c5    = G5[3] | (P5[3] & C5[3]);
    assign s15   = P5[0];
    assign s16   = P5[1] ^ C5[1];
    assign s17   = P5[2] ^ C5[2];
    assign s18   = P5[3] ^ C5[3];

    /* Sixth CLA */
    wire [3:0] G6, P6, C6;
    assign G6[0] = pp6[1] & pp7[0];
    assign G6[1] = pp6[2] & pp7[1];
    assign G6[2] = pp6[3] & pp7[2];
    assign G6[3] = pp6[4] & pp7[3];
    assign P6[0] = pp6[1] ^ pp7[0];
    assign P6[1] = pp6[2] ^ pp7[1];
    assign P6[2] = pp6[3] ^ pp7[2];
    assign P6[3] = pp6[4] ^ pp7[3];
    assign C6[1] = G6[0];
    assign C6[2] = G6[1] | (P6[1] & C6[1]);
    assign C6[3] = G6[2] | (P6[2] & C6[2]);
    assign c6    = G6[3] | (P6[3] & C6[3]);
    assign s19   = P6[0];
    assign s20   = P6[1] ^ C6[1];
    assign s21   = P6[2] ^ C6[2];
    assign s22   = P6[3] ^ C6[3];

    /* Seventh CLA */
    wire [3:0] G7, P7, C7;
    assign G7[0] = s2 & pp2[0];
    assign G7[1] = s3 & s8;
    assign G7[2] = s4 & pp4[0];
    assign G7[3] = c1 & s5;
    assign P7[0] = s2 ^ pp2[0];
    assign P7[1] = s3 ^ s8;
    assign P7[2] = s4 ^ pp4[0];
    assign P7[3] = c1 ^ s5; 
    assign C7[1] = G7[0];
    assign C7[2] = G7[1] | (P7[1] & C7[1]);
    assign C7[3] = G7[2] | (P7[2] & C7[2]);
    assign c7    = G7[3] | (P7[3] & C7[3]);
    assign s23   = P7[0];
    assign s24   = P7[1] ^ C7[1];
    assign s25   = P7[2] ^ C7[2];
    assign s26   = P7[3] ^ C7[3];
    assign product[2] = s23;
    assign product[3] = s24;

    /* 8th CLA */
    wire [3:0] G8, P8, C8;
    assign G8[0] = pp6[0] & s6;
    assign G8[1] = s7     & c3;
    assign G8[2] = pp1[7] & c2;
    assign G8[3] = pp4[5] & pp5[4];
    assign P8[0] = pp6[0] ^ s6;
    assign P8[1] = s7     ^ c3;
    assign P8[2] = pp1[7] ^ c2;
    assign P8[3] = pp4[5] ^ pp5[4];
    assign C8[1] = G8[0];
    assign C8[2] = G8[1] | (P8[1] & C8[1]);
    assign C8[3] = G8[2] | (P8[2] & C8[2]);
    assign c8    = G8[3] | (P8[3] & C8[3]);
    assign s27   = P8[0];
    assign s28   = P8[1] ^ C8[1];
    assign s29   = P8[2] ^ C8[2];
    assign s30   = P8[3] ^ C8[3];

    /* 9th CLA */
    wire [3:0] G9, P9, C9;
    assign G9[0] = pp3[7] & pp4[6];
    assign G9[1] = pp4[7] & pp5[6];
    assign G9[2] = pp5[7] & pp6[6];
    assign G9[3] = pp6[7] & pp7[6];
    assign P9[0] = pp3[7] ^ pp4[6];
    assign P9[1] = pp4[7] ^ pp5[6];
    assign P9[2] = pp5[7] ^ pp6[6];
    assign P9[3] = pp6[7] ^ pp7[6];
    assign C9[0] = s22;
    assign C9[1] = G9[0] | (P9[0] & C9[0]);
    assign C9[2] = G9[1] | (P9[1] & C9[1]);
    assign C9[3] = G9[2] | (P9[2] & C9[2]);
    assign c9    = G9[3] | (P9[3] & C9[3]);
    assign s31   = P9[0] ^ C9[0];
    assign s32   = P9[1] ^ C9[1];
    assign s33   = P9[2] ^ C9[2];
    assign s34   = P9[3] ^ C9[3];

    /* 10th CLA */
    wire [3:0] GA, PA, CA;
    assign GA[0] = s10 & s15;
    assign GA[1] = s11 & s16;
    assign GA[2] = s12 & s17;
    assign GA[3] = s13 & s18;
    assign PA[0] = s10 ^ s15;
    assign PA[1] = s11 ^ s16;
    assign PA[2] = s12 ^ s17;
    assign PA[3] = s13 ^ s18;
    assign CA[1] = GA[0];
    assign CA[2] = GA[1] | (PA[1] & CA[1]);
    assign CA[3] = GA[2] | (PA[2] & CA[2]);
    assign c10   = GA[3] | (PA[3] & CA[3]);
    assign s35   = PA[0];
    assign s36   = PA[1] ^ CA[1];
    assign s37   = PA[2] ^ CA[2];
    assign s38   = PA[3] ^ CA[3];

    /* 11th CLA */
    wire [2:0] GB, PB, CB;
    assign GB[0] = s14    & c5;
    assign GB[1] = pp5[5] & c4;
    assign GB[2] = pp6[5] & pp7[4];
    assign PB[0] = s14    ^ c5;
    assign PB[1] = pp5[5] ^ c4;
    assign PB[2] = pp6[5] ^ pp7[4];
    assign CB[0] = s21;
    assign CB[1] = GB[0] | (PB[0] & CB[0]);
    assign CB[2] = GB[1] | (PB[1] & CB[1]);
    assign c11   = GB[2] | (PB[2] & CB[2]);
    assign s39   = PB[0] ^ CB[0];
    assign s40   = PB[1] ^ CB[1];
    assign s41   = PB[2] ^ CB[2];

    /* 12th CLA */
    wire [3:0] GC, PC, CC;
    assign GC[0] = c7  & s27;
    assign GC[1] = s28 & s37;
    assign GC[2] = s29 & s38;
    assign GC[3] = s30 & c10;
    assign PC[0] = c7  ^ s27;
    assign PC[1] = s28 ^ s37;
    assign PC[2] = s29 ^ s38;
    assign PC[3] = s30 ^ c10;
    assign CC[1] = GC[0];
    assign CC[2] = GC[1] | (PC[1] & CC[1]);
    assign CC[3] = GC[2] | (PC[2] & CC[2]);
    assign c12   = GC[3] | (PC[3] & CC[3]);
    assign s42   = PC[0];
    assign s43   = PC[1] ^ CC[1];
    assign s44   = PC[2] ^ CC[2];
    assign s45   = PC[3] ^ CC[3];

    /* 13th CLA */
    wire [2:0] GD, PD, CD;
    assign GD[0] = c8  & s31;
    assign GD[1] = s32 & s41;
    assign GD[2] = s33 & c11;
    assign PD[0] = c8  ^ s31;
    assign PD[1] = s32 ^ s41;
    assign PD[2] = s33 ^ c11;
    assign CD[0] = s40;
    assign CD[1] = GD[0] | (PD[0] & CD[0]);
    assign CD[2] = GD[1] | (PD[1] & CD[1]);
    assign c13   = GD[2] | (PD[2] & CD[2]);
    assign s46   = PD[0] ^ CD[0];
    assign s47   = PD[1] ^ CD[1];
    assign s48   = PD[2] ^ CD[2];


    /* Final Stage 14th CLA */
    wire [3:0] GE, PE, CE;
    assign GE[0] = s25 & s9;
    assign GE[1] = s26 & s35;
    assign GE[2] = s42 & s36;
    assign GE[3] = s43 & s19;
    assign PE[0] = s25 ^ s9;
    assign PE[1] = s26 ^ s35;
    assign PE[2] = s42 ^ s36;
    assign PE[3] = s43 ^ s19;
    assign CE[1] = GE[0];
    assign CE[2] = GE[1] | (PE[1] & CE[1]);
    assign CE[3] = GE[2] | (PE[2] & CE[2]);
    assign c14   = GE[3] | (PE[3] & CE[3]);
    assign product[4] = PE[0];
    assign product[5] = PE[1] ^ CE[1];
    assign product[6] = PE[2] ^ CE[2];
    assign product[7] = PE[3] ^ CE[3];

    /* 15th CLA */
    wire [3:0] GF, PF, CF;
    assign GF[0] = s44 & s20;
    assign GF[1] = s45 & s39;
    assign GF[2] = c12 & s46;
    assign GF[3] = c6  & s47;
    assign PF[0] = s44 ^ s20;
    assign PF[1] = s45 ^ s39;
    assign PF[2] = c12 ^ s46;
    assign PF[3] = c6  ^ s47;
    assign CF[0] = c14;
    assign CF[1] = GF[0] | (PF[0] & CF[0]);
    assign CF[2] = GF[1] | (PF[1] & CF[1]);
    assign CF[3] = GF[2] | (PF[2] & CF[2]);
    assign c15   = GF[3] | (PF[3] & CF[3]);
    assign product[8]  = PF[0] ^ CF[0];
    assign product[9]  = PF[1] ^ CF[1];
    assign product[10] = PF[2] ^ CF[2];
    assign product[11] = PF[3] ^ CF[3];

    /* 16th CLA */
    wire [2:0] GG, PG, CG;
    assign GG[0] = pp7[5] & s48;  
    assign GG[1] = s34    & c13;
    assign GG[2] = c9     & pp7[7];
    assign PG[0] = pp7[5] ^ s48;
    assign PG[1] = s34    ^ c13;
    assign PG[2] = c9     ^ pp7[7];
    assign CG[0] = c15;
    assign CG[1] = GG[0] | (PG[0] & CG[0]);
    assign CG[2] = GG[1] | (PG[1] & CG[1]);
    assign product[15] = GG[2] | (PG[2] & CG[2]);
    assign product[12] = PG[0] ^ CG[0];
    assign product[13] = PG[1] ^ CG[1];
    assign product[14] = PG[2] ^ CG[2];
endmodule

module wallace_unsigned_multiplier_CLA_Reduced_8_attempt1(product, A, B);
    /* This attempt uses a RCA at the very last stage
     * Area: 1084.552269
     * Power: 5.06E-01
     * Timing: 1.63 */
    
    input [7:0] A, B;
    output [15:0] product;

    wire [7:0] pp0, pp1, pp2, pp3, pp4, pp5, pp6, pp7;

    and AND00(pp0[0], A[0], B[0]);
    and AND01(pp0[1], A[1], B[0]);
    and AND02(pp0[2], A[2], B[0]);
    and AND03(pp0[3], A[3], B[0]);
    and AND04(pp0[4], A[4], B[0]);
    and AND05(pp0[5], A[5], B[0]);
    and AND06(pp0[6], A[6], B[0]);
    and AND07(pp0[7], A[7], B[0]);
    and AND08(pp1[0], A[0], B[1]);
    and AND09(pp1[1], A[1], B[1]);
    and AND10(pp1[2], A[2], B[1]);
    and AND11(pp1[3], A[3], B[1]);
    and AND12(pp1[4], A[4], B[1]);
    and AND13(pp1[5], A[5], B[1]);
    and AND14(pp1[6], A[6], B[1]);
    and AND15(pp1[7], A[7], B[1]);
    and AND16(pp2[0], A[0], B[2]);
    and AND17(pp2[1], A[1], B[2]);
    and AND18(pp2[2], A[2], B[2]);
    and AND19(pp2[3], A[3], B[2]);
    and AND20(pp2[4], A[4], B[2]);
    and AND21(pp2[5], A[5], B[2]);
    and AND22(pp2[6], A[6], B[2]);
    and AND23(pp2[7], A[7], B[2]);
    and AND24(pp3[0], A[0], B[3]);
    and AND25(pp3[1], A[1], B[3]);
    and AND26(pp3[2], A[2], B[3]);
    and AND27(pp3[3], A[3], B[3]);
    and AND28(pp3[4], A[4], B[3]);
    and AND29(pp3[5], A[5], B[3]);
    and AND30(pp3[6], A[6], B[3]);
    and AND31(pp3[7], A[7], B[3]);
    and AND32(pp4[0], A[0], B[4]);
    and AND33(pp4[1], A[1], B[4]);
    and AND34(pp4[2], A[2], B[4]);
    and AND35(pp4[3], A[3], B[4]);
    and AND36(pp4[4], A[4], B[4]);
    and AND37(pp4[5], A[5], B[4]);
    and AND38(pp4[6], A[6], B[4]);
    and AND39(pp4[7], A[7], B[4]);
    and AND40(pp5[0], A[0], B[5]);
    and AND41(pp5[1], A[1], B[5]);
    and AND42(pp5[2], A[2], B[5]);
    and AND43(pp5[3], A[3], B[5]);
    and AND44(pp5[4], A[4], B[5]);
    and AND45(pp5[5], A[5], B[5]);
    and AND46(pp5[6], A[6], B[5]);
    and AND47(pp5[7], A[7], B[5]);
    and AND48(pp6[0], A[0], B[6]);
    and AND49(pp6[1], A[1], B[6]);
    and AND50(pp6[2], A[2], B[6]);
    and AND51(pp6[3], A[3], B[6]);
    and AND52(pp6[4], A[4], B[6]);
    and AND53(pp6[5], A[5], B[6]);
    and AND54(pp6[6], A[6], B[6]);
    and AND55(pp6[7], A[7], B[6]);
    and AND56(pp7[0], A[0], B[7]);
    and AND57(pp7[1], A[1], B[7]);
    and AND58(pp7[2], A[2], B[7]);
    and AND59(pp7[3], A[3], B[7]);
    and AND60(pp7[4], A[4], B[7]);
    and AND61(pp7[5], A[5], B[7]);
    and AND62(pp7[6], A[6], B[7]);
    and AND63(pp7[7], A[7], B[7]);

    /* First Stage */
    assign product[0] = pp0[0];

    /* First CLA */
    wire [3:0] G1, P1, C1;
    assign G1[0] = pp0[1] & pp1[0];
    assign G1[1] = pp0[2] & pp1[1];
    assign G1[2] = pp0[3] & pp1[2];
    assign G1[3] = pp0[4] & pp1[3];
    assign P1[0] = pp0[1] ^ pp1[0];
    assign P1[1] = pp0[2] ^ pp1[1];
    assign P1[2] = pp0[3] ^ pp1[2];
    assign P1[3] = pp0[4] ^ pp1[3];
    assign C1[1] = G1[0];
    assign C1[2] = G1[1] | (P1[1] & C1[1]);
    assign C1[3] = G1[2] | (P1[2] & C1[2]);    
    assign c1    = G1[3] | (P1[3] & C1[3]);
    assign s1    = P1[0];
    assign s2    = P1[1] ^ C1[1];
    assign s3    = P1[2] ^ C1[2];
    assign s4    = P1[3] ^ C1[3];
    assign product[1] = s1;   

    /* Second CLA */
    wire [2:0] G2, P2, C2;
    assign G2[0] = pp0[5] & pp1[4];
    assign G2[1] = pp0[6] & pp1[5];
    assign G2[2] = pp0[7] & pp1[6];
    assign P2[0] = pp0[5] ^ pp1[4];
    assign P2[1] = pp0[6] ^ pp1[5];
    assign P2[2] = pp0[7] ^ pp1[6];
    assign C2[1] = G2[0];
    assign C2[2] = G2[1] | (P2[1] & C2[1]);
    assign c2    = G2[2] | (P2[2] & C2[2]);
    assign s5    = P2[0];
    assign s6    = P2[1] ^ C2[1];
    assign s7    = P2[2] ^ C2[2];

    /* Third CLA */
    wire [3:0] G3, P3, C3;
    assign G3[0] = pp2[1] & pp3[0];
    assign G3[1] = pp2[2] & pp3[1];
    assign G3[2] = pp2[3] & pp3[2];
    assign G3[3] = pp2[4] & pp3[3];
    assign P3[0] = pp2[1] ^ pp3[0];
    assign P3[1] = pp2[2] ^ pp3[1];
    assign P3[2] = pp2[3] ^ pp3[2];
    assign P3[3] = pp2[4] ^ pp3[3];
    assign C3[1] = G3[0];
    assign C3[2] = G3[1] | (P3[1] & C3[1]);
    assign C3[3] = G3[2] | (P3[2] & C3[2]);
    assign c3    = G3[3] | (P3[3] & C3[3]);
    assign s8    = P3[0];
    assign s9    = P3[1] ^ C3[1];
    assign s10   = P3[2] ^ C3[2];
    assign s11   = P3[3] ^ C3[3];

    /* Fourth CLA */
    wire [2:0] G4, P4, C4;
    assign G4[0] = pp2[5] & pp3[4];
    assign G4[1] = pp2[6] & pp3[5];
    assign G4[2] = pp2[7] & pp3[6];
    assign P4[0] = pp2[5] ^ pp3[4];
    assign P4[1] = pp2[6] ^ pp3[5];
    assign P4[2] = pp2[7] ^ pp3[6];
    assign C4[1] = G4[0];
    assign C4[2] = G4[1] | (P4[1] & C4[1]);
    assign c4    = G4[2] | (P4[2] & C4[2]);
    assign s12   = P4[0];
    assign s13   = P4[1] ^ C4[1];
    assign s14   = P4[2] ^ C4[2];

    /* Fifth CLA */
    wire [3:0] G5, P5, C5;
    assign G5[0] = pp4[1] & pp5[0];
    assign G5[1] = pp4[2] & pp5[1];
    assign G5[2] = pp4[3] & pp5[2];
    assign G5[3] = pp4[4] & pp5[3];
    assign P5[0] = pp4[1] ^ pp5[0];
    assign P5[1] = pp4[2] ^ pp5[1];
    assign P5[2] = pp4[3] ^ pp5[2];
    assign P5[3] = pp4[4] ^ pp5[3];
    assign C5[1] = G5[0];
    assign C5[2] = G5[1] | (P5[1] & C5[1]);
    assign C5[3] = G5[2] | (P5[2] & C5[2]);
    assign c5    = G5[3] | (P5[3] & C5[3]);
    assign s15   = P5[0];
    assign s16   = P5[1] ^ C5[1];
    assign s17   = P5[2] ^ C5[2];
    assign s18   = P5[3] ^ C5[3];

    /* Sixth CLA */
    wire [3:0] G6, P6, C6;
    assign G6[0] = pp6[1] & pp7[0];
    assign G6[1] = pp6[2] & pp7[1];
    assign G6[2] = pp6[3] & pp7[2];
    assign G6[3] = pp6[4] & pp7[3];
    assign P6[0] = pp6[1] ^ pp7[0];
    assign P6[1] = pp6[2] ^ pp7[1];
    assign P6[2] = pp6[3] ^ pp7[2];
    assign P6[3] = pp6[4] ^ pp7[3];
    assign C6[1] = G6[0];
    assign C6[2] = G6[1] | (P6[1] & C6[1]);
    assign C6[3] = G6[2] | (P6[2] & C6[2]);
    assign c6    = G6[3] | (P6[3] & C6[3]);
    assign s19   = P6[0];
    assign s20   = P6[1] ^ C6[1];
    assign s21   = P6[2] ^ C6[2];
    assign s22   = P6[3] ^ C6[3];

    /* Seventh CLA */
    wire [3:0] G7, P7, C7;
    assign G7[0] = s2 & pp2[0];
    assign G7[1] = s3 & s8;
    assign G7[2] = s4 & pp4[0];
    assign G7[3] = c1 & s5;
    assign P7[0] = s2 ^ pp2[0];
    assign P7[1] = s3 ^ s8;
    assign P7[2] = s4 ^ pp4[0];
    assign P7[3] = c1 ^ s5; 
    assign C7[1] = G7[0];
    assign C7[2] = G7[1] | (P7[1] & C7[1]);
    assign C7[3] = G7[2] | (P7[2] & C7[2]);
    assign c7    = G7[3] | (P7[3] & C7[3]);
    assign s23   = P7[0];
    assign s24   = P7[1] ^ C7[1];
    assign s25   = P7[2] ^ C7[2];
    assign s26   = P7[3] ^ C7[3];
    assign product[2] = s23;
    assign product[3] = s24;

    /* 8th CLA */
    wire [3:0] G8, P8, C8;
    assign G8[0] = pp6[0] & s6;
    assign G8[1] = s7     & c3;
    assign G8[2] = pp1[7] & c2;
    assign G8[3] = pp4[5] & pp5[4];
    assign P8[0] = pp6[0] ^ s6;
    assign P8[1] = s7     ^ c3;
    assign P8[2] = pp1[7] ^ c2;
    assign P8[3] = pp4[5] ^ pp5[4];
    assign C8[1] = G8[0];
    assign C8[2] = G8[1] | (P8[1] & C8[1]);
    assign C8[3] = G8[2] | (P8[2] & C8[2]);
    assign c8    = G8[3] | (P8[3] & C8[3]);
    assign s27   = P8[0];
    assign s28   = P8[1] ^ C8[1];
    assign s29   = P8[2] ^ C8[2];
    assign s30   = P8[3] ^ C8[3];

    /* 9th CLA */
    wire [3:0] G9, P9, C9;
    assign G9[0] = pp3[7] & pp4[6];
    assign G9[1] = pp4[7] & pp5[6];
    assign G9[2] = pp5[7] & pp6[6];
    assign G9[3] = pp6[7] & pp7[6];
    assign P9[0] = pp3[7] ^ pp4[6];
    assign P9[1] = pp4[7] ^ pp5[6];
    assign P9[2] = pp5[7] ^ pp6[6];
    assign P9[3] = pp6[7] ^ pp7[6];
    assign C9[0] = s22;
    assign C9[1] = G9[0] | (P9[0] & C9[0]);
    assign C9[2] = G9[1] | (P9[1] & C9[1]);
    assign C9[3] = G9[2] | (P9[2] & C9[2]);
    assign c9    = G9[3] | (P9[3] & C9[3]);
    assign s31   = P9[0] ^ C9[0];
    assign s32   = P9[1] ^ C9[1];
    assign s33   = P9[2] ^ C9[2];
    assign s34   = P9[3] ^ C9[3];

    /* 10th CLA */
    wire [3:0] GA, PA, CA;
    assign GA[0] = s10 & s15;
    assign GA[1] = s11 & s16;
    assign GA[2] = s12 & s17;
    assign GA[3] = s13 & s18;
    assign PA[0] = s10 ^ s15;
    assign PA[1] = s11 ^ s16;
    assign PA[2] = s12 ^ s17;
    assign PA[3] = s13 ^ s18;
    assign CA[1] = GA[0];
    assign CA[2] = GA[1] | (PA[1] & CA[1]);
    assign CA[3] = GA[2] | (PA[2] & CA[2]);
    assign c10   = GA[3] | (PA[3] & CA[3]);
    assign s35   = PA[0];
    assign s36   = PA[1] ^ CA[1];
    assign s37   = PA[2] ^ CA[2];
    assign s38   = PA[3] ^ CA[3];

    /* 11th CLA */
    wire [2:0] GB, PB, CB;
    assign GB[0] = s14    & c5;
    assign GB[1] = pp5[5] & c4;
    assign GB[2] = pp6[5] & pp7[4];
    assign PB[0] = s14    ^ c5;
    assign PB[1] = pp5[5] ^ c4;
    assign PB[2] = pp6[5] ^ pp7[4];
    assign CB[0] = s21;
    assign CB[1] = GB[0] | (PB[0] & CB[0]);
    assign CB[2] = GB[1] | (PB[1] & CB[1]);
    assign c11   = GB[2] | (PB[2] & CB[2]);
    assign s39   = PB[0] ^ CB[0];
    assign s40   = PB[1] ^ CB[1];
    assign s41   = PB[2] ^ CB[2];

    /* 12th CLA */
    wire [3:0] GC, PC, CC;
    assign GC[0] = c7  & s27;
    assign GC[1] = s28 & s37;
    assign GC[2] = s29 & s38;
    assign GC[3] = s30 & c10;
    assign PC[0] = c7  ^ s27;
    assign PC[1] = s28 ^ s37;
    assign PC[2] = s29 ^ s38;
    assign PC[3] = s30 ^ c10;
    assign CC[1] = GC[0];
    assign CC[2] = GC[1] | (PC[1] & CC[1]);
    assign CC[3] = GC[2] | (PC[2] & CC[2]);
    assign c12   = GC[3] | (PC[3] & CC[3]);
    assign s42   = PC[0];
    assign s43   = PC[1] ^ CC[1];
    assign s44   = PC[2] ^ CC[2];
    assign s45   = PC[3] ^ CC[3];

    /* 13th CLA */
    wire [2:0] GD, PD, CD;
    assign GD[0] = c8  & s31;
    assign GD[1] = s32 & s41;
    assign GD[2] = s33 & c11;
    assign PD[0] = c8  ^ s31;
    assign PD[1] = s32 ^ s41;
    assign PD[2] = s33 ^ c11;
    assign CD[0] = s40;
    assign CD[1] = GD[0] | (PD[0] & CD[0]);
    assign CD[2] = GD[1] | (PD[1] & CD[1]);
    assign c13   = GD[2] | (PD[2] & CD[2]);
    assign s46   = PD[0] ^ CD[0];
    assign s47   = PD[1] ^ CD[1];
    assign s48   = PD[2] ^ CD[2];

    half_adder HA01(product[4], r1,      s25, s9);
    full_adder FA01(product[5], r2,  r1, s26, s35);
    full_adder FA02(product[6], r3,  r2, s36, s42);
    full_adder FA03(product[7], r4,  r3, s19, s43);
    full_adder FA04(product[8], r5,  r4, s20, s44);
    full_adder FA05(product[9], r6,  r5, s39, s45);
    full_adder FA06(product[10],r7,  r6, c12, s46);
    full_adder FA07(product[11],r8,  r7, s47, c6);
    full_adder FA08(product[12],r9,  r8, s48, pp7[5]);
    full_adder FA09(product[13],r10, r9, c13, s34);
    full_adder FA11(product[14],product[15], r10,c9,  pp7[7]);
    
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
