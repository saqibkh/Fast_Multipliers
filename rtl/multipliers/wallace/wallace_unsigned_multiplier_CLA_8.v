module wallace_unsigned_multiplier_CLA_8_attempt1(product, A, B);
    /* This attempt tries to use long CLA for adding partial products */
    /* Some CLAs are 9 bits long */
    /* Area: 1074.696969
     * Power : 0.49mW
     * Timing: 1.29
     */

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
    wire [7:0] G3, P3, C3;
    assign G3[0] = pp4[1] & pp5[0];
    assign G3[1] = pp4[2] & pp5[1];
    assign G3[2] = pp4[3] & pp5[2];
    assign G3[3] = pp4[4] & pp5[3];
    assign G3[4] = pp4[5] & pp5[4];
    assign G3[5] = pp4[6] & pp5[5];
    assign G3[6] = pp4[7] & pp5[6];
    assign G3[7] = 0      & pp5[7];
    assign P3[0] = pp4[1] ^ pp5[0];
    assign P3[1] = pp4[2] ^ pp5[1];
    assign P3[2] = pp4[3] ^ pp5[2];
    assign P3[3] = pp4[4] ^ pp5[3];
    assign P3[4] = pp4[5] ^ pp5[4];
    assign P3[5] = pp4[6] ^ pp5[5];
    assign P3[6] = pp4[7] ^ pp5[6];
    assign P3[7] = 0      ^ pp5[7];
    assign C3[0] = 0;
    assign C3[1] = G3[0] | (P3[0] & C3[0]);
    assign C3[2] = G3[1] | (P3[1] & C3[1]);
    assign C3[3] = G3[2] | (P3[2] & C3[2]);
    assign C3[4] = G3[3] | (P3[3] & C3[3]);
    assign C3[5] = G3[4] | (P3[4] & C3[4]);
    assign C3[6] = G3[5] | (P3[5] & C3[5]);
    assign C3[7] = G3[6] | (P3[6] & C3[6]);
    assign c3    = G3[7] | (P3[7] & C3[7]);
    assign s31   = P3[0];
    assign s32   = P3[1] ^ C3[1];
    assign s33   = P3[2] ^ C3[2];
    assign s34   = P3[3] ^ C3[3];
    assign s35   = P3[4] ^ C3[4];
    assign s36   = P3[5] ^ C3[5];
    assign s37   = P3[6] ^ C3[6];
    assign s38   = P3[7] ^ C3[7];

    /* 4nd CLA */
    wire [6:0] G4, P4, C4;
    assign G4[0] = pp6[1] & pp7[0];
    assign G4[1] = pp6[2] & pp7[1];
    assign G4[2] = pp6[3] & pp7[2];
    assign G4[3] = pp6[4] & pp7[3];
    assign G4[4] = pp6[5] & pp7[4];
    assign G4[5] = pp6[6] & pp7[5];
    assign G4[6] = pp6[7] & pp7[6];
    assign P4[0] = pp6[1] ^ pp7[0];
    assign P4[1] = pp6[2] ^ pp7[1];
    assign P4[2] = pp6[3] ^ pp7[2];
    assign P4[3] = pp6[4] ^ pp7[3];
    assign P4[4] = pp6[5] ^ pp7[4];
    assign P4[5] = pp6[6] ^ pp7[5];
    assign P4[6] = pp6[7] ^ pp7[6];
    assign C4[0] = 0;
    assign C4[1] = G4[0] | (P4[0] & C4[0]);
    assign C4[2] = G4[1] | (P4[1] & C4[1]);
    assign C4[3] = G4[2] | (P4[2] & C4[2]);
    assign C4[4] = G4[3] | (P4[3] & C4[3]);
    assign C4[5] = G4[4] | (P4[4] & C4[4]);
    assign C4[6] = G4[5] | (P4[5] & C4[5]);
    assign c4    = G4[6] | (P4[6] & C4[6]);
    assign s41   = P4[0];
    assign s42   = P4[1] ^ C4[1];
    assign s43   = P4[2] ^ C4[2];
    assign s44   = P4[3] ^ C4[3];
    assign s45   = P4[4] ^ C4[4];
    assign s46   = P4[5] ^ C4[5];
    assign s47   = P4[6] ^ C4[6];

    /* 5th CLA */
    wire [8:0] G5, P5, C5;
    assign G5[0] = s12 & pp2[0];
    assign G5[1] = s13 & s21;
    assign G5[2] = s14 & s22;
    assign G5[3] = s15 & s23;
    assign G5[4] = s16 & s24;
    assign G5[5] = s17 & s25;
    assign G5[6] = s18 & s26;
    assign G5[7] = c1  & s27;
    assign G5[8] = c2  & pp3[7];
    assign P5[0] = s12 ^ pp2[0];
    assign P5[1] = s13 ^ s21;
    assign P5[2] = s14 ^ s22;
    assign P5[3] = s15 ^ s23;
    assign P5[4] = s16 ^ s24;
    assign P5[5] = s17 ^ s25;
    assign P5[6] = s18 ^ s26;
    assign P5[7] = c1  ^ s27;
    assign P5[8] = c2  ^ pp3[7];
    assign C5[0] = 0;
    assign C5[1] = G5[0] | (P5[0] & C5[0]);
    assign C5[2] = G5[1] | (P5[1] & C5[1]);
    assign C5[3] = G5[2] | (P5[2] & C5[2]);
    assign C5[4] = G5[3] | (P5[3] & C5[3]);
    assign C5[5] = G5[4] | (P5[4] & C5[4]);
    assign C5[6] = G5[5] | (P5[5] & C5[5]);
    assign C5[7] = G5[6] | (P5[6] & C5[6]);
    assign C5[8] = G5[7] | (P5[7] & C5[7]);
    assign c5    = G5[8] | (P5[8] & C5[8]);
    assign s51   = P5[0];
    assign s52   = P5[1] ^ C5[1];
    assign s53   = P5[2] ^ C5[2];
    assign s54   = P5[3] ^ C5[3];
    assign s55   = P5[4] ^ C5[4];
    assign s56   = P5[5] ^ C5[5];
    assign s57   = P5[6] ^ C5[6];
    assign s58   = P5[7] ^ C5[7];
    assign s59   = P5[8] ^ C5[8];

    assign product[2] = s51;
    assign product[3] = s52;

    /* 6th CLA */
    wire [8:0] G6, P6, C6;
    assign G6[0] = s32 & pp6[0];
    assign G6[1] = s33 & s41;
    assign G6[2] = s34 & s42;
    assign G6[3] = s35 & s43;
    assign G6[4] = s36 & s44;
    assign G6[5] = s37 & s45;
    assign G6[6] = s38 & s46;
    assign G6[7] = c3  & s47;
    assign G6[8] = c4  & pp7[7];
    assign P6[0] = s32 ^ pp6[0];
    assign P6[1] = s33 ^ s41;
    assign P6[2] = s34 ^ s42;
    assign P6[3] = s35 ^ s43;
    assign P6[4] = s36 ^ s44;
    assign P6[5] = s37 ^ s45;
    assign P6[6] = s38 ^ s46;
    assign P6[7] = c3  ^ s47;
    assign P6[8] = c4  ^ pp7[7];
    assign C6[0] = 0;
    assign C6[1] = G6[0] | (P6[0] & C6[0]);
    assign C6[2] = G6[1] | (P6[1] & C6[1]);
    assign C6[3] = G6[2] | (P6[2] & C6[2]);
    assign C6[4] = G6[3] | (P6[3] & C6[3]);
    assign C6[5] = G6[4] | (P6[4] & C6[4]);
    assign C6[6] = G6[5] | (P6[5] & C6[5]);
    assign C6[7] = G6[6] | (P6[6] & C6[6]);
    assign C6[8] = G6[7] | (P6[7] & C6[7]);
    assign c6    = G6[8] | (P6[8] & C6[8]);
    assign s61   = P6[0];
    assign s62   = P6[1] ^ C6[1];
    assign s63   = P6[2] ^ C6[2];
    assign s64   = P6[3] ^ C6[3];
    assign s65   = P6[4] ^ C6[4];
    assign s66   = P6[5] ^ C6[5];
    assign s67   = P6[6] ^ C6[6];
    assign s68   = P6[7] ^ C6[7];
    assign s69   = P6[8] ^ C6[8];

    /* 7th CLA */
    wire [7:0] G7, P7, C7;
    assign G7[0] = s53 & pp4[0];
    assign G7[1] = s54 & s31;
    assign G7[2] = s55 & s61;
    assign G7[3] = s56 & s62;
    assign G7[4] = s57 & s63;
    assign G7[5] = s58 & s64;
    assign G7[6] = s59 & s65;
    assign G7[7] = c5  & s66;
    assign P7[0] = s53 ^ pp4[0];
    assign P7[1] = s54 ^ s31;
    assign P7[2] = s55 ^ s61;
    assign P7[3] = s56 ^ s62;
    assign P7[4] = s57 ^ s63;
    assign P7[5] = s58 ^ s64;
    assign P7[6] = s59 ^ s65;
    assign P7[7] = c5  ^ s66;
    assign C7[0] = 0;
    assign C7[1] = G7[0] | (P7[0] & C7[0]);
    assign C7[2] = G7[1] | (P7[1] & C7[1]);
    assign C7[3] = G7[2] | (P7[2] & C7[2]);
    assign C7[4] = G7[3] | (P7[3] & C7[3]);
    assign C7[5] = G7[4] | (P7[4] & C7[4]);
    assign C7[6] = G7[5] | (P7[5] & C7[5]);
    assign C7[7] = G7[6] | (P7[6] & C7[6]);
    assign c7    = G7[7] | (P7[7] & C7[7]);
    assign product[4]  = P7[0];
    assign product[5]  = P7[1] ^ C7[1];
    assign product[6]  = P7[2] ^ C7[2];
    assign product[7]  = P7[3] ^ C7[3];
    assign product[8]  = P7[4] ^ C7[4];
    assign product[9]  = P7[5] ^ C7[5];
    assign product[10] = P7[6] ^ C7[6];
    assign product[11] = P7[7] ^ C7[7];

    half_adder HA1(product[12], c8,  s67, c7);
    half_adder HA2(product[13], c9,  s68, c8);
    half_adder HA3(product[14], c10, s69, c9);
    half_adder HA4(product[15], c11, c6,  c10);

endmodule

module wallace_unsigned_multiplier_CLA_8_attempt1(product, A, B);
    input [7:0] A, B;
    output [15:0] product;

    wire [7:0] pp0, pp1, pp2, pp3, pp4, pp5, pp6, pp7;
    /* First Stage */
    assign product[0] = pp0[0];
    half_adder ha01(s111, c111, pp0[1], pp1[0]);
    full_adder fa01(s112, c112, pp0[2], pp1[1], pp2[0]);
    full_adder fa02(s113, c113, pp0[3], pp1[2], pp2[1]);
    full_adder fa03(s114, c114, pp0[4], pp1[3], pp2[2]);
    full_adder fa04(s115, c115, pp0[5], pp1[4], pp2[3]);
    full_adder fa05(s116, c116, pp0[6], pp1[5], pp2[4]);
    full_adder fa06(s117, c117, pp0[7], pp1[6], pp2[5]);
    half_adder ha02(s118, c118,         pp1[7], pp2[6]);

    half_adder ha03(s119, c119, pp3[1], pp4[0]);
    full_adder fa07(s120, c120, pp3[2], pp4[1], pp5[0]);
    full_adder fa08(s121, c121, pp3[3], pp4[2], pp5[1]);
    full_adder fa09(s122, c122, pp3[4], pp4[3], pp5[2]);
    full_adder fa10(s123, c123, pp3[5], pp4[4], pp5[3]);
    full_adder fa11(s124, c124, pp3[6], pp4[5], pp5[4]);
    full_adder fa12(s125, c125, pp3[7], pp4[6], pp5[5]);
    half_adder ha04(s126, c126,         pp4[7], pp5[6]);


    /* Second Stage */
    assign product[1] = s111;
    half_adder ha05(s221, c221, s112, c111);
    full_adder fa13(s222, c222, s113, c112, pp3[0]);
    full_adder fa14(s223, c223, s114, c113, s119);
    full_adder fa15(s224, c224, s115, c114, s120);
    full_adder fa16(s225, c225, s116, c115, s121);
    full_adder fa17(s226, c226, s117, c116, s122);
    full_adder fa18(s227, c227, s118, c117, s123);
    full_adder fa19(s228, c228, s119, c118, s124);

    half_adder ha06(s229, c229, c120, pp6[0]);
    full_adder fa20(s230, c230, c121, pp6[1], pp7[0]);
    full_adder fa21(s231, c231, c122, pp6[2], pp7[1]);
    full_adder fa22(s232, c232, c123, pp6[3], pp7[2]);
    full_adder fa23(s233, c233, c124, pp6[4], pp7[3]);
    full_adder fa24(s234, c234, c125, pp6[5], pp7[4]);
    full_adder fa25(s235, c235, c126, pp6[6], pp7[5]);
    half_adder ha07(s236, c236,      pp6[7], pp7[6]);

    /* Third Stage */
    assign product[2] = s221;
    half_adder ha08(s301, c301, s222, c221);
    half_adder ha09(s302, c302, s223, c222);
    full_adder fa26(s303, c303, s224, c223, c119);
    full_adder fa27(s304, c304, s225, c224, s229);
    full_adder fa28(s305, c305, s226, c225, s230);
    full_adder fa29(s306, c306, s227, c226, s231);
    full_adder fa30(s307, c307, s228, c227, s232);
    full_adder fa31(s308, c308, s125, c228, s233);
    half_adder ha10(s309, c309, s126,       s234);
    half_adder ha11(s310, c310, pp5[7],     s235);

    /* Fourth Stage */
    assign product[3] = s301;
    half_adder ha12(product[4], c401, s302, c301);
    half_adder ha13(s402,       c402, s303, c302);
    half_adder ha14(s403,       c403, s304, c303);
    full_adder fa32(s404,       c404, s305, c304, c229);
    full_adder fa33(s405,       c405, s306, c305, c230);
    full_adder fa34(s406,       c406, s307, c306, c231);
    full_adder fa35(s407,       c407, s308, c307, c232);
    full_adder fa36(s408,       c408, s309, c308, c233);
    full_adder fa37(s409,       c409, s310, c309, c234);
    full_adder fa38(s410,       c410, s236, c310, c235);
    half_adder ha15(s411,       c411, pp7[7],     c236);

    /* Final Stage is a Carry Look-Ahead Adder */
    wire [9:0] G; /* Generate */
    wire [9:0] P; /* Propagate */
    wire [9:0] C; /* Carry */

    assign G[0] = s402 & c401;
    assign G[1] = s403 & c402;
    assign G[2] = s404 & c403;
    assign G[3] = s405 & c404;
    assign G[4] = s406 & c405;
    assign G[5] = s407 & c406;
    assign G[6] = s408 & c407;
    assign G[7] = s409 & c408;
    assign G[8] = s410 & c409;
    assign G[9] = s411 & c410;
    assign P[0] = s402 ^ c401;
    assign P[1] = s403 ^ c402;
    assign P[2] = s404 ^ c403;
    assign P[3] = s405 ^ c404;
    assign P[4] = s406 ^ c405;
    assign P[5] = s407 ^ c406;
    assign P[6] = s408 ^ c407;
    assign P[7] = s409 ^ c408;
    assign P[8] = s410 ^ c409;
    assign P[9] = s411 ^ c410;

    //assign C[0] = 0;
    assign C[1]        = G[0];// | (P[0] & C[0]);
    assign C[2]        = G[1] | (P[1] & C[1]);
    assign C[3]        = G[2] | (P[2] & C[2]);
    assign C[4]        = G[3] | (P[3] & C[3]);
    assign C[5]        = G[4] | (P[4] & C[4]);
    assign C[6]        = G[5] | (P[5] & C[5]);
    assign C[7]        = G[6] | (P[6] & C[6]);
    assign C[8]        = G[7] | (P[7] & C[7]);
    assign C[9]        = G[8] | (P[8] & C[8]);
    assign product[15] = G[9] | (P[9] & C[9]);

    assign product[5]  = P[0];
    assign product[6]  = P[1] ^ C[1];
    assign product[7]  = P[2] ^ C[2];
    assign product[8]  = P[3] ^ C[3];
    assign product[9]  = P[4] ^ C[4];
    assign product[10] = P[5] ^ C[5];
    assign product[11] = P[6] ^ C[6];
    assign product[12] = P[7] ^ C[7];
    assign product[13] = P[8] ^ C[8];
    assign product[14] = P[9] ^ C[9];
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
