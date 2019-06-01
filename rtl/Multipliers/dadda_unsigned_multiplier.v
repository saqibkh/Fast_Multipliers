module dadda_unsigned_multiplier_4(product, A, B);
    input [3:0] A, B;
    output [7:0] product;

    wire [3:0] pp0, pp1, pp2, pp3;

    and AND01(pp0[0], A[0], B[0]);    
    and AND02(pp0[1], A[1], B[0]);
    and AND03(pp0[2], A[2], B[0]);
    and AND04(pp0[3], A[3], B[0]);
    and AND05(pp1[0], A[0], B[1]);
    and AND06(pp1[1], A[1], B[1]);
    and AND07(pp1[2], A[2], B[1]);
    and AND08(pp1[3], A[3], B[1]);
    and AND09(pp2[0], A[0], B[2]);
    and AND10(pp2[1], A[1], B[2]);
    and AND11(pp2[2], A[2], B[2]);
    and AND12(pp2[3], A[3], B[2]);
    and AND13(pp3[0], A[0], B[3]);
    and AND14(pp3[1], A[1], B[3]);
    and AND15(pp3[2], A[2], B[3]);
    and AND16(pp3[3], A[3], B[3]);

    assign product[0] = pp0[0];

    /* First Stage */
    half_adder ha1(s11, c11, pp3[0], pp2[1]);
    half_adder ha2(s12, c12, pp3[1], pp2[2]);

    /* Second Stage */
    half_adder ha3(s21, c21, pp2[0], pp1[1]);
    full_adder fa1(s22, c22, pp1[2], pp0[3], s11);
    full_adder fa2(s23, c23, pp1[3], s12,    c11);
    full_adder fa3(s24, c24, pp2[3], pp3[2], c12);

    /* Final Stage */
    half_adder ha4(product[1], c31,        pp0[1], pp1[0]);
    full_adder fa4(product[2], c32,        s21,    pp0[2], c31);
    full_adder fa5(product[3], c33,        s22,    c21,    c32);
    full_adder fa6(product[4], c34,        s23,    c22,    c33);
    full_adder fa7(product[5], c35,        s24,    c23,    c34);
    full_adder fa8(product[6], product[7], pp3[3], c24,    c35);
endmodule


module dadda_unsigned_multiplier_8(product, A, B);
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
    half_adder ha01(s11, c11, pp6[0], pp5[1]);
    full_adder fa01(s12, c12, pp7[0], pp6[1], pp5[2]);
    full_adder fa02(s13, c13, pp7[1], pp6[2], pp5[3]);
    full_adder fa03(s14, c14, pp7[2], pp6[3], pp5[4]);

    half_adder ha02(s15, c15, pp4[3], pp3[4]);
    half_adder ha03(s16, c16, pp4[4], pp3[5]);

    /* Second Stage */
    half_adder ha04(s201, c201, pp3[1], pp4[0]);
    full_adder fa04(s202, c202, pp3[2], pp4[1], pp5[0]);
    full_adder fa05(s203, c203, pp2[4], pp3[3], pp4[2]);
    full_adder fa06(s204, c204, pp0[7], pp1[6], pp2[5]);
    full_adder fa07(s205, c205, pp1[7], pp2[6], s13);
    full_adder fa08(s206, c206, pp4[5], pp3[6], pp2[7]);
    full_adder fa09(s207, c207, pp5[5], pp6[4], pp7[3]);
    full_adder fa10(s208, c208, pp5[6], pp6[5], pp7[4]);

    half_adder ha05(s209, c209, pp2[3], pp1[4]);
    full_adder fa11(s210, c210, pp1[5], pp0[6], s11);
    full_adder fa12(s211, c211, s12,    c11,    s15);
    full_adder fa13(s212, c212, c12,    s16,    c15);
    full_adder fa14(s213, c213, s14,    c13,    c16);
    full_adder fa15(s214, c214, pp4[6], pp3[7], c14);
    
    /* Third Stage */
    half_adder ha06(s301, c301, pp3[0], pp2[1]);
    full_adder fa16(s302, c302, pp2[2], pp1[3], pp0[4]);
    full_adder fa17(s303, c303, pp0[5], s202,   c201);
    full_adder fa18(s304, c304, s203, c202, s210);
    full_adder fa19(s305, c305, s204, c203, s211);
    full_adder fa20(s306, c306, s205, c204, s212);
    full_adder fa21(s307, c307, s206, c205, s213);
    full_adder fa22(s308, c308, s207, c206, s214);
    full_adder fa23(s309, c309, s208, c207, pp4[7]);
    full_adder fa24(s310, c310, pp7[5], pp6[6], pp5[7]);

    /* Fourth Stage */
    half_adder ha07(s401, c401, pp2[0], pp1[1]);
    full_adder fa25(s402, c402, pp1[2], pp0[3], s301);
    full_adder fa26(s403, c403, s201,   s302,   c301);
    full_adder fa27(s404, c404, s209,   s303,   c302);
    full_adder fa28(s405, c405, c209,   s304,   c303);
    full_adder fa29(s406, c406, c210,   s305,   c304);
    full_adder fa30(s407, c407, c211,   s306,   c305);
    full_adder fa31(s408, c408, c212,   s307,   c306);
    full_adder fa32(s409, c409, c213,   s308,   c307);
    full_adder fa33(s410, c410, c214,   s309,   c308);
    full_adder fa34(s411, c411, c208,   s310,   c309);
    full_adder fa35(s412, c412, pp7[6], pp6[7], c310);

    /* Final Stage */
    assign product[0] = pp0[0];
    half_adder ha08(product[1],  c501,        pp1[0], pp0[1]);
    full_adder fa36(product[2],  c502,        pp0[2], s401,   c501);
    full_adder fa37(product[3],  c503,        c401,   s402,   c502);
    full_adder fa38(product[4],  c504,        c402,   s403,   c503);
    full_adder fa39(product[5],  c505,        c403,   s404,   c504);
    full_adder fa40(product[6],  c506,        c404,   s405,   c505);
    full_adder fa41(product[7],  c507,        c405,   s406,   c506);
    full_adder fa42(product[8],  c508,        c406,   s407,   c507);
    full_adder fa43(product[9],  c509,        c407,   s408,   c508);
    full_adder fa44(product[10], c510,        c408,   s409,   c509);
    full_adder fa45(product[11], c511,        c409,   s410,   c510);
    full_adder fa46(product[12], c512,        c410,   s411,   c511);
    full_adder fa47(product[13], c513,        c411,   s412,   c512);
    full_adder fa48(product[14], product[15], c412,   pp7[7], c513);

endmodule


module dadda_unsigned_multiplier_16(product, A, B);
    input [15:0] A, B;
    output [31:0] product;

    wire [15:0] pp00, pp01, pp02, pp03, pp04, pp05, pp06, pp07, pp08, pp09, pp10, pp11, pp12, pp13, pp14, pp15;

    and AND0(pp00[0], A[0], B[0]);
    and AND1(pp00[1], A[1], B[0]);
    and AND2(pp00[2], A[2], B[0]);
    and AND3(pp00[3], A[3], B[0]);
    and AND4(pp00[4], A[4], B[0]);
    and AND5(pp00[5], A[5], B[0]);
    and AND6(pp00[6], A[6], B[0]);
    and AND7(pp00[7], A[7], B[0]);
    and AND8(pp00[8], A[8], B[0]);
    and AND9(pp00[9], A[9], B[0]);
    and AND10(pp00[10], A[10], B[0]);
    and AND11(pp00[11], A[11], B[0]);
    and AND12(pp00[12], A[12], B[0]);
    and AND13(pp00[13], A[13], B[0]);
    and AND14(pp00[14], A[14], B[0]);
    and AND15(pp00[15], A[15], B[0]);

    and AND16(pp01[0], A[0], B[1]);
    and AND17(pp01[1], A[1], B[1]);
    and AND18(pp01[2], A[2], B[1]);
    and AND19(pp01[3], A[3], B[1]);
    and AND20(pp01[4], A[4], B[1]);
    and AND21(pp01[5], A[5], B[1]);
    and AND22(pp01[6], A[6], B[1]);
    and AND23(pp01[7], A[7], B[1]);
    and AND24(pp01[8], A[8], B[1]);
    and AND25(pp01[9], A[9], B[1]);
    and AND26(pp01[10], A[10], B[1]);
    and AND27(pp01[11], A[11], B[1]);
    and AND28(pp01[12], A[12], B[1]);
    and AND29(pp01[13], A[13], B[1]);
    and AND30(pp01[14], A[14], B[1]);
    and AND31(pp01[15], A[15], B[1]);
    and AND32(pp02[0], A[0], B[2]);
    and AND33(pp02[1], A[1], B[2]);
    and AND34(pp02[2], A[2], B[2]);
    and AND35(pp02[3], A[3], B[2]);
    and AND36(pp02[4], A[4], B[2]);
    and AND37(pp02[5], A[5], B[2]);
    and AND38(pp02[6], A[6], B[2]);
    and AND39(pp02[7], A[7], B[2]);
    and AND40(pp02[8], A[8], B[2]);
    and AND41(pp02[9], A[9], B[2]);
    and AND42(pp02[10], A[10], B[2]);
    and AND43(pp02[11], A[11], B[2]);
    and AND44(pp02[12], A[12], B[2]);
    and AND45(pp02[13], A[13], B[2]);
    and AND46(pp02[14], A[14], B[2]);
    and AND47(pp02[15], A[15], B[2]);
    and AND48(pp03[0], A[0], B[3]);
    and AND49(pp03[1], A[1], B[3]);
    and AND50(pp03[2], A[2], B[3]);
    and AND51(pp03[3], A[3], B[3]);
    and AND52(pp03[4], A[4], B[3]);
    and AND53(pp03[5], A[5], B[3]);
    and AND54(pp03[6], A[6], B[3]);
    and AND55(pp03[7], A[7], B[3]);
    and AND56(pp03[8], A[8], B[3]);
    and AND57(pp03[9], A[9], B[3]);
    and AND58(pp03[10], A[10], B[3]);
    and AND59(pp03[11], A[11], B[3]);
    and AND60(pp03[12], A[12], B[3]);
    and AND61(pp03[13], A[13], B[3]);
    and AND62(pp03[14], A[14], B[3]);
    and AND63(pp03[15], A[15], B[3]);
    and AND64(pp04[0], A[0], B[4]);
    and AND65(pp04[1], A[1], B[4]);
    and AND66(pp04[2], A[2], B[4]);
    and AND67(pp04[3], A[3], B[4]);
    and AND68(pp04[4], A[4], B[4]);
    and AND69(pp04[5], A[5], B[4]);
    and AND70(pp04[6], A[6], B[4]);
    and AND71(pp04[7], A[7], B[4]);
    and AND72(pp04[8], A[8], B[4]);
    and AND73(pp04[9], A[9], B[4]);
    and AND74(pp04[10], A[10], B[4]);
    and AND75(pp04[11], A[11], B[4]);
    and AND76(pp04[12], A[12], B[4]);
    and AND77(pp04[13], A[13], B[4]);
    and AND78(pp04[14], A[14], B[4]);
    and AND79(pp04[15], A[15], B[4]);
    and AND80(pp05[0], A[0], B[5]);
    and AND81(pp05[1], A[1], B[5]);
    and AND82(pp05[2], A[2], B[5]);
    and AND83(pp05[3], A[3], B[5]);
    and AND84(pp05[4], A[4], B[5]);
    and AND85(pp05[5], A[5], B[5]);
    and AND86(pp05[6], A[6], B[5]);
    and AND87(pp05[7], A[7], B[5]);
    and AND88(pp05[8], A[8], B[5]);
    and AND89(pp05[9], A[9], B[5]);
    and AND90(pp05[10], A[10], B[5]);
    and AND91(pp05[11], A[11], B[5]);
    and AND92(pp05[12], A[12], B[5]);
    and AND93(pp05[13], A[13], B[5]);
    and AND94(pp05[14], A[14], B[5]);
    and AND95(pp05[15], A[15], B[5]);
    and AND96(pp06[0], A[0], B[6]);
    and AND97(pp06[1], A[1], B[6]);
    and AND98(pp06[2], A[2], B[6]);
    and AND99(pp06[3], A[3], B[6]);
    and AND100(pp06[4], A[4], B[6]);
    and AND101(pp06[5], A[5], B[6]);
    and AND102(pp06[6], A[6], B[6]);
    and AND103(pp06[7], A[7], B[6]);
    and AND104(pp06[8], A[8], B[6]);
    and AND105(pp06[9], A[9], B[6]);
    and AND106(pp06[10], A[10], B[6]);
    and AND107(pp06[11], A[11], B[6]);
    and AND108(pp06[12], A[12], B[6]);
    and AND109(pp06[13], A[13], B[6]);
    and AND110(pp06[14], A[14], B[6]);
    and AND111(pp06[15], A[15], B[6]);
    and AND112(pp07[0], A[0], B[7]);
    and AND113(pp07[1], A[1], B[7]);
    and AND114(pp07[2], A[2], B[7]);
    and AND115(pp07[3], A[3], B[7]);
    and AND116(pp07[4], A[4], B[7]);
    and AND117(pp07[5], A[5], B[7]);
    and AND118(pp07[6], A[6], B[7]);
    and AND119(pp07[7], A[7], B[7]);
    and AND120(pp07[8], A[8], B[7]);
    and AND121(pp07[9], A[9], B[7]);
    and AND122(pp07[10], A[10], B[7]);
    and AND123(pp07[11], A[11], B[7]);
    and AND124(pp07[12], A[12], B[7]);
    and AND125(pp07[13], A[13], B[7]);
    and AND126(pp07[14], A[14], B[7]);
    and AND127(pp07[15], A[15], B[7]);
    and AND128(pp08[0], A[0], B[8]);
    and AND129(pp08[1], A[1], B[8]);
    and AND130(pp08[2], A[2], B[8]);
    and AND131(pp08[3], A[3], B[8]);
    and AND132(pp08[4], A[4], B[8]);
    and AND133(pp08[5], A[5], B[8]);
    and AND134(pp08[6], A[6], B[8]);
    and AND135(pp08[7], A[7], B[8]);
    and AND136(pp08[8], A[8], B[8]);
    and AND137(pp08[9], A[9], B[8]);
    and AND138(pp08[10], A[10], B[8]);
    and AND139(pp08[11], A[11], B[8]);
    and AND140(pp08[12], A[12], B[8]);
    and AND141(pp08[13], A[13], B[8]);
    and AND142(pp08[14], A[14], B[8]);
    and AND143(pp08[15], A[15], B[8]);
    and AND144(pp09[0], A[0], B[9]);
    and AND145(pp09[1], A[1], B[9]);
    and AND146(pp09[2], A[2], B[9]);
    and AND147(pp09[3], A[3], B[9]);
    and AND148(pp09[4], A[4], B[9]);
    and AND149(pp09[5], A[5], B[9]);
    and AND150(pp09[6], A[6], B[9]);
    and AND151(pp09[7], A[7], B[9]);
    and AND152(pp09[8], A[8], B[9]);
    and AND153(pp09[9], A[9], B[9]);
    and AND154(pp09[10], A[10], B[9]);
    and AND155(pp09[11], A[11], B[9]);
    and AND156(pp09[12], A[12], B[9]);
    and AND157(pp09[13], A[13], B[9]);
    and AND158(pp09[14], A[14], B[9]);
    and AND159(pp09[15], A[15], B[9]);
    and AND160(pp10[0], A[0], B[10]);
    and AND161(pp10[1], A[1], B[10]);
    and AND162(pp10[2], A[2], B[10]);
    and AND163(pp10[3], A[3], B[10]);
    and AND164(pp10[4], A[4], B[10]);
    and AND165(pp10[5], A[5], B[10]);
    and AND166(pp10[6], A[6], B[10]);
    and AND167(pp10[7], A[7], B[10]);
    and AND168(pp10[8], A[8], B[10]);
    and AND169(pp10[9], A[9], B[10]);
    and AND170(pp10[10], A[10], B[10]);
    and AND171(pp10[11], A[11], B[10]);
    and AND172(pp10[12], A[12], B[10]);
    and AND173(pp10[13], A[13], B[10]);
    and AND174(pp10[14], A[14], B[10]);
    and AND175(pp10[15], A[15], B[10]);
    and AND176(pp11[0], A[0], B[11]);
    and AND177(pp11[1], A[1], B[11]);
    and AND178(pp11[2], A[2], B[11]);
    and AND179(pp11[3], A[3], B[11]);
    and AND180(pp11[4], A[4], B[11]);
    and AND181(pp11[5], A[5], B[11]);
    and AND182(pp11[6], A[6], B[11]);
    and AND183(pp11[7], A[7], B[11]);
    and AND184(pp11[8], A[8], B[11]);
    and AND185(pp11[9], A[9], B[11]);
    and AND186(pp11[10], A[10], B[11]);
    and AND187(pp11[11], A[11], B[11]);
    and AND188(pp11[12], A[12], B[11]);
    and AND189(pp11[13], A[13], B[11]);
    and AND190(pp11[14], A[14], B[11]);
    and AND191(pp11[15], A[15], B[11]);
    and AND192(pp12[0], A[0], B[12]);
    and AND193(pp12[1], A[1], B[12]);
    and AND194(pp12[2], A[2], B[12]);
    and AND195(pp12[3], A[3], B[12]);
    and AND196(pp12[4], A[4], B[12]);
    and AND197(pp12[5], A[5], B[12]);
    and AND198(pp12[6], A[6], B[12]);
    and AND199(pp12[7], A[7], B[12]);
    and AND200(pp12[8], A[8], B[12]);
    and AND201(pp12[9], A[9], B[12]);
    and AND202(pp12[10], A[10], B[12]);
    and AND203(pp12[11], A[11], B[12]);
    and AND204(pp12[12], A[12], B[12]);
    and AND205(pp12[13], A[13], B[12]);
    and AND206(pp12[14], A[14], B[12]);
    and AND207(pp12[15], A[15], B[12]);
    and AND208(pp13[0], A[0], B[13]);
    and AND209(pp13[1], A[1], B[13]);
    and AND210(pp13[2], A[2], B[13]);
    and AND211(pp13[3], A[3], B[13]);
    and AND212(pp13[4], A[4], B[13]);
    and AND213(pp13[5], A[5], B[13]);
    and AND214(pp13[6], A[6], B[13]);
    and AND215(pp13[7], A[7], B[13]);
    and AND216(pp13[8], A[8], B[13]);
    and AND217(pp13[9], A[9], B[13]);
    and AND218(pp13[10], A[10], B[13]);
    and AND219(pp13[11], A[11], B[13]);
    and AND220(pp13[12], A[12], B[13]);
    and AND221(pp13[13], A[13], B[13]);
    and AND222(pp13[14], A[14], B[13]);
    and AND223(pp13[15], A[15], B[13]);
    and AND224(pp14[0], A[0], B[14]);
    and AND225(pp14[1], A[1], B[14]);
    and AND226(pp14[2], A[2], B[14]);
    and AND227(pp14[3], A[3], B[14]);
    and AND228(pp14[4], A[4], B[14]);
    and AND239(pp14[5], A[5], B[14]);
    and AND230(pp14[6], A[6], B[14]);
    and AND231(pp14[7], A[7], B[14]);
    and AND232(pp14[8], A[8], B[14]);
    and AND233(pp14[9], A[9], B[14]);
    and AND234(pp14[10], A[10], B[14]);
    and AND235(pp14[11], A[11], B[14]);
    and AND236(pp14[12], A[12], B[14]);
    and AND237(pp14[13], A[13], B[14]);
    and AND238(pp14[14], A[14], B[14]);
    and AND239(pp14[15], A[15], B[14]);
    and AND240(pp15[0], A[0], B[15]);
    and AND241(pp15[1], A[1], B[15]);
    and AND242(pp15[2], A[2], B[15]);
    and AND243(pp15[3], A[3], B[15]);
    and AND244(pp15[4], A[4], B[15]);
    and AND245(pp15[5], A[5], B[15]);
    and AND246(pp15[6], A[6], B[15]);
    and AND247(pp15[7], A[7], B[15]);
    and AND248(pp15[8], A[8], B[15]);
    and AND249(pp15[9], A[9], B[15]);
    and AND250(pp15[10], A[10], B[15]);
    and AND251(pp15[11], A[11], B[15]);
    and AND252(pp15[12], A[12], B[15]);
    and AND253(pp15[13], A[13], B[15]);
    and AND254(pp15[14], A[14], B[15]);
    and AND255(pp15[15], A[15], B[15]);

    /* First Stage */
    half_adder ha1(s101, c101, pp13[0], pp12[1]);
    full adder fa1(s102, c102, pp14[0], pp13[1], pp12[2]);
    full adder fa2(s103, c103, pp15[0], pp14[1], pp13[2]);
    full adder fa3(s104, c104, pp15[1], pp14[2], pp13[3]);
    full adder fa4(s105, c105, pp15[2], pp14[3], pp13[4]);
    full adder fa5(s106, c106, pp15[3], pp14[4], pp13[5]);

    half_adder ha2(s107, c107, pp11[3], pp10[4]);
    full_adder fa6(s108, c108, pp12[3], pp11[4], pp10[5]);
    full_adder fa7(s109, c109, pp12[4], pp11[5], pp10[6]);
    full_adder fa8(s110, c110, pp12[5], pp11[6], pp10[7]);

    half_adder ha3(s111, c111, pp9[6], pp8[7]);
    half_adder ha4(s112, c112, pp9[7], pp8[8]);

    /* Second Stage */
    half_adder ha5(s201, c201, );
    full_adder fa9(s202, c202, );
    full_adder fa10(s203, c203, );
    full_adder fa11(s204, c204, );
    full_adder fa12(s205, c205, );
    full_adder fa13(s206, c206, );
    full_adder fa14(s207, c207, );
    full_adder fa15(s208, c208, );
    full_adder fa16(s209, c209, );
    full_adder fa17(s210, c210, );
    full_adder fa18(s211, c211, );
    full_adder fa29(s212, c212, );
    full_adder fa20(s213, c213, );
    full_adder fa21(s214, c214, );

    half_adder ha6(s215, c215, );
    full_adder fa22(s216, c216, );
    full_adder fa23(s217, c217, );
    full_adder fa24(s218, c218, );
    full_adder fa25(s219, c219, );
    full_adder fa26(s220, c220, );
    full_adder fa27(s221, c221, );
    full_adder fa28(s222, c222, );
    full_adder fa29(s223, c223, );
    full_adder fa30(s224, c224, );
    full_adder fa31(s225, c225, );
    full_adder fa32(s226, c226, );

    half_adder ha7(s227, c226, );
    full_adder fa33(s228, c226, );
    full_adder fa34(s229, c226, );
    full_adder fa35(s230, c230, );
    full_adder fa36(s231, c231, );
    full_adder fa37(s232, c232, );
    full_adder fa38(s233, c233, );
    full_adder fa39(s234, c234, );
    full_adder fa40(s235, c235, );
    full_adder fa41(s236, c236, );

    half_adder ha8(s237, c237, );
    full_adder fa42(s238, c238, );
    full_adder fa43(s239, c239, );
    full_adder fa44(s240, c240, );
    full_adder fa45(s241, c241, );
    full_adder fa46(s242, c242, );
    full_adder fa47(s243, c243, );
    full_adder fa48(s244, c244, );

    /* Third Stage */
    half_adder ha9(s301, c301, );
    full_adder fa49(s302, c302, );
    full_adder fa50(s303, c303, );
    full_adder fa51(s304, c304, );
    full_adder fa52(s305, c305, );
    full_adder fa53(s306, c306, );
    full_adder fa54(s307, c307, );
    full_adder fa55(s308, c308, );
    full_adder fa56(s309, c309, );
    full_adder fa57(s310, c310, );
    full_adder fa58(s311, c311, );
    full_adder fa59(s312, c312, );
    full_adder fa60(s313, c313, );
    full_adder fa61(s314, c314, );

    half_adder ha10(s315, c315, );
    full_adder fa62(s316, c316, );
    full_adder fa63(s317, c317, );
    full_adder fa64(s318, c318, );
    full_adder fa65(s319, c319, );
    full_adder fa66(s320, c320, );
    full_adder fa67(s321, c321, );
    full_adder fa68(s322, c322, );
    full_adder fa69(s323, c323, );
    full_adder fa71(s324, c324, );
    full_adder fa72(s325, c325, );
    full_adder fa73(s326, c326, );

    half_adder ha11(s327, c327, );
    full_adder fa74(s328, c328, );
    full_adder fa75(s329, c329, );
    full_adder fa76(s330, c330, );
    full_adder fa77(s331, c331, );
    full_adder fa78(s332, c332, );
    full_adder fa79(s333, c333, );
    full_adder fa80(s334, c334, );
    full_adder fa81(s335, c335, );
    full_adder fa82(s336, c336, );

    half_adder ha12(s337, c337, );
    full_adder fa83(s338, c338, );
    full_adder fa84(s339, c339, );
    full_adder fa85(s340, c340, );
    full_adder fa86(s341, c341, );
    full_adder fa87(s342, c342, );
    full_adder fa88(s343, c343, );
    full_adder fa89(s344, c344, );    

    /* Fourth Stage */

    /* Fifth Stage */

    /* Sixth Stage */
endmodule


endmodule













