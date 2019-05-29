module array_unsigned_multiplier_4(output wire [7:0] product,
                          input wire [3:0] A, B);

  wire c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10;
  wire s1,s2,s3,s5,s6,s7;
  wire [3:0] a0b, a1b, a2b, a3b;

  // Generate all dot products of A x B
  and AND1(a0b[0], A[0], B[0]);
  and AND2(a0b[1], A[0], B[1]);
  and AND3(a0b[2], A[0], B[2]);
  and AND4(a0b[3], A[0], B[3]);
  and AND5(a1b[0], A[1], B[0]);
  and AND6(a1b[1], A[1], B[1]);
  and AND7(a1b[2], A[1], B[2]);
  and AND8(a1b[3], A[1], B[3]);
  and AND9(a2b[0], A[2], B[0]);
  and AND10(a2b[1], A[2], B[1]);
  and AND11(a2b[2], A[2], B[2]);
  and AND12(a2b[3], A[2], B[3]);
  and AND13(a3b[0], A[3], B[0]);
  and AND14(a3b[1], A[3], B[1]);
  and AND15(a3b[2], A[3], B[2]);
  and AND16(a3b[3], A[3], B[3]);

  
  assign product[0] = a0b[0];
  half_adder HA1(product[1], c0, a0b[1], a1b[0]);
  full_adder FA1(s1, c1, a1b[1], a2b[0], c0);
  full_adder FA2(s2, c2, a2b[1], a3b[0], c1);
  half_adder HA2(s3, c3, a3b[1], c2);
  half_adder HA3(product[2], c4, a0b[2], s1);
  full_adder FA3(s5, c5, a1b[2], s2, c4);
  full_adder FA4(s6, c6, a2b[2], s3, c5);
  full_adder FA5(s7, c7, a3b[2], c3, c6);
  half_adder HA4(product[3], c8, s5, a0b[3]);
  full_adder FA6(product[4], c9, s6, a1b[3], c8);
  full_adder FA7(product[5], c10, s7, a2b[3], c9);
  full_adder FA8(product[6], product[7], a3b[3], c7, c10);
endmodule

module array_unsigned_multiplier_8(output wire [15:0] product,
                          input wire [7:0] A, B);


and AND1(a0b0, A[0], B[0]);
and AND2(a0b1, A[0], B[1]);
and AND3(a0b2, A[0], B[2]);
and AND4(a0b3, A[0], B[3]);
and AND5(a0b4, A[0], B[4]);
and AND6(a0b5, A[0], B[5]);
and AND7(a0b6, A[0], B[6]);
and AND8(a0b7, A[0], B[7]);
and AND9(a1b0, A[1], B[0]);
and AND10(a1b1, A[1], B[1]);
and AND11(a1b2, A[1], B[2]);
and AND12(a1b3, A[1], B[3]);
and AND13(a1b4, A[1], B[4]);
and AND14(a1b5, A[1], B[5]);
and AND15(a1b6, A[1], B[6]);
and AND16(a1b7, A[1], B[7]);
and AND17(a2b0, A[2], B[0]);
and AND18(a2b1, A[2], B[1]);
and AND19(a2b2, A[2], B[2]);
and AND20(a2b3, A[2], B[3]);
and AND21(a2b4, A[2], B[4]);
and AND22(a2b5, A[2], B[5]);
and AND23(a2b6, A[2], B[6]);
and AND24(a2b7, A[2], B[7]);
and AND25(a3b0, A[3], B[0]);
and AND26(a3b1, A[3], B[1]);
and AND27(a3b2, A[3], B[2]);
and AND28(a3b3, A[3], B[3]);
and AND29(a3b4, A[3], B[4]);
and AND30(a3b5, A[3], B[5]);
and AND31(a3b6, A[3], B[6]);
and AND32(a3b7, A[3], B[7]);
and AND33(a4b0, A[4], B[0]);
and AND34(a4b1, A[4], B[1]);
and AND35(a4b2, A[4], B[2]);
and AND36(a4b3, A[4], B[3]);
and AND37(a4b4, A[4], B[4]);
and AND38(a4b5, A[4], B[5]);
and AND39(a4b6, A[4], B[6]);
and AND40(a4b7, A[4], B[7]);
and AND41(a5b0, A[5], B[0]);
and AND42(a5b1, A[5], B[1]);
and AND43(a5b2, A[5], B[2]);
and AND44(a5b3, A[5], B[3]);
and AND45(a5b4, A[5], B[4]);
and AND46(a5b5, A[5], B[5]);
and AND47(a5b6, A[5], B[6]);
and AND48(a5b7, A[5], B[7]);
and AND49(a6b0, A[6], B[0]);
and AND50(a6b1, A[6], B[1]);
and AND51(a6b2, A[6], B[2]);
and AND52(a6b3, A[6], B[3]);
and AND53(a6b4, A[6], B[4]);
and AND54(a6b5, A[6], B[5]);
and AND55(a6b6, A[6], B[6]);
and AND56(a6b7, A[6], B[7]);
and AND57(a7b0, A[7], B[0]);
and AND58(a7b1, A[7], B[1]);
and AND59(a7b2, A[7], B[2]);
and AND60(a7b3, A[7], B[3]);
and AND61(a7b4, A[7], B[4]);
and AND62(a7b5, A[7], B[5]);
and AND63(a7b6, A[7], B[6]);
and AND64(a7b7, A[7], B[7]);

assign product[0] = a0b0;

//row 0
half_adder HA0_1(product[1], c0_0, a1b0, a0b1);
full_adder FA0_1(s0_1, c0_1,       a2b0, a1b1, c0_0);
full_adder FA0_2(s0_2, c0_2,       a3b0, a2b1, c0_1);
full_adder FA0_3(s0_3, c0_3,       a4b0, a3b1, c0_2);
full_adder FA0_4(s0_4, c0_4,       a5b0, a4b1, c0_3);
full_adder FA0_5(s0_5, c0_5,       a6b0, a5b1, c0_4);
full_adder FA0_6(s0_6, c0_6,       a7b0, a6b1, c0_5);
half_adder HA0_2(s0_7, c0_7,             a7b1, c0_6);

//row 1
half_adder HA1_1(product[2], c1_0, s0_1, a0b2);
full_adder FA1_1(s1_1, c1_1,       s0_2, a1b2, c1_0);
full_adder FA1_2(s1_2, c1_2,       s0_3, a2b2, c1_1);
full_adder FA1_3(s1_3, c1_3,       s0_4, a3b2, c1_2);
full_adder FA1_4(s1_4, c1_4,       s0_5, a4b2, c1_3);
full_adder FA1_5(s1_5, c1_5,       s0_6, a5b2, c1_4);
full_adder FA1_6(s1_6, c1_6,       s0_7, a6b2, c1_5);
full_adder FA1_7(s1_7, c1_7,       c0_7, a7b2, c1_6);

//row 2
half_adder HA2_1(product[3], c2_0, s1_1, a0b3);
full_adder FA2_1(s2_1, c2_1,       s1_2, a1b3, c2_0);
full_adder FA2_2(s2_2, c2_2,       s1_3, a2b3, c2_1);
full_adder FA2_3(s2_3, c2_3,       s1_4, a3b3, c2_2);
full_adder FA2_4(s2_4, c2_4,       s1_5, a4b3, c2_3);
full_adder FA2_5(s2_5, c2_5,       s1_6, a5b3, c2_4);
full_adder FA2_6(s2_6, c2_6,       s1_7, a6b3, c2_5);
full_adder FA2_7(s2_7, c2_7,       c1_7, a7b3, c2_6);

//row 3
half_adder HA3_1(product[4], c3_0, s2_1, a0b4);
full_adder FA3_1(s3_1, c3_1,       s2_2, a1b4, c3_0);
full_adder FA3_2(s3_2, c3_2,       s2_3, a2b4, c3_1);
full_adder FA3_3(s3_3, c3_3,       s2_4, a3b4, c3_2);
full_adder FA3_4(s3_4, c3_4,       s2_5, a4b4, c3_3);
full_adder FA3_5(s3_5, c3_5,       s2_6, a5b4, c3_4);
full_adder FA3_6(s3_6, c3_6,       s2_7, a6b4, c3_5);
full_adder FA3_7(s3_7, c3_7,       c2_7, a7b4, c3_6);

//row 4
half_adder HA4_1(product[5], c4_0, s3_1, a0b5);
full_adder FA4_1(s4_1, c4_1,       s3_2, a1b5, c4_0);
full_adder FA4_2(s4_2, c4_2,       s3_3, a2b5, c4_1);
full_adder FA4_3(s4_3, c4_3,       s3_4, a3b5, c4_2);
full_adder FA4_4(s4_4, c4_4,       s3_5, a4b5, c4_3);
full_adder FA4_5(s4_5, c4_5,       s3_6, a5b5, c4_4);
full_adder FA4_6(s4_6, c4_6,       s3_7, a6b5, c4_5);
full_adder FA4_7(s4_7, c4_7,       c3_7, a7b5, c4_6);

//row 5
half_adder HA5_1(product[6], c5_0, s4_1, a0b6);
full_adder FA5_1(s5_1, c5_1,       s4_2, a1b6, c5_0);
full_adder FA5_2(s5_2, c5_2,       s4_3, a2b6, c5_1);
full_adder FA5_3(s5_3, c5_3,       s4_4, a3b6, c5_2);
full_adder FA5_4(s5_4, c5_4,       s4_5, a4b6, c5_3);
full_adder FA5_5(s5_5, c5_5,       s4_6, a5b6, c5_4);
full_adder FA5_6(s5_6, c5_6,       s4_7, a6b6, c5_5);
full_adder FA5_7(s5_7, c5_7,       c4_7, a7b6, c5_6);

//row 6
half_adder HA6_1(product[7],  c6_0,         s5_1, a0b7);
full_adder FA6_1(product[8],  c6_1,         s5_2, a1b7, c6_0);
full_adder FA6_2(product[9],  c6_2,         s5_3, a2b7, c6_1);
full_adder FA6_3(product[10], c6_3,         s5_4, a3b7, c6_2);
full_adder FA6_4(product[11], c6_4,         s5_5, a4b7, c6_3);
full_adder FA6_5(product[12], c6_5,         s5_6, a5b7, c6_4);
full_adder FA6_6(product[13], c6_6,         s5_7, a6b7, c6_5);
full_adder FA6_7(product[14], product[15],  c5_7, a7b7, c6_6);
endmodule


module array_unsigned_multiplier_16(output wire [31:0] product,
                          input wire [15:0] A, B);

and AND1(a0b0, A[0], B[0]);and AND2(a0b1, A[0], B[1]);
and AND3(a0b2, A[0], B[2]);and AND4(a0b3, A[0], B[3]);
and AND5(a0b4, A[0], B[4]);and AND6(a0b5, A[0], B[5]);
and AND7(a0b6, A[0], B[6]);and AND8(a0b7, A[0], B[7]);
and AND9(a0b8, A[0], B[8]);and AND10(a0b9, A[0], B[9]);
and AND11(a0b10, A[0], B[10]);and AND12(a0b11, A[0], B[11]);
and AND13(a0b12, A[0], B[12]);and AND14(a0b13, A[0], B[13]);
and AND15(a0b14, A[0], B[14]);and AND16(a0b15, A[0], B[15]);
and AND18(a1b0, A[1], B[0]);and AND19(a1b1, A[1], B[1]);
and AND20(a1b2, A[1], B[2]);and AND21(a1b3, A[1], B[3]);
and AND22(a1b4, A[1], B[4]);and AND23(a1b5, A[1], B[5]);
and AND24(a1b6, A[1], B[6]);and AND25(a1b7, A[1], B[7]);
and AND26(a1b8, A[1], B[8]);and AND27(a1b9, A[1], B[9]);
and AND28(a1b10, A[1], B[10]);and AND29(a1b11, A[1], B[11]);
and AND30(a1b12, A[1], B[12]);and AND31(a1b13, A[1], B[13]);
and AND32(a1b14, A[1], B[14]);and AND33(a1b15, A[1], B[15]);
and AND017(a2b0, A[2], B[0]);and AND018(a2b1, A[2], B[1]);
and AND019(a2b2, A[2], B[2]);and AND020(a2b3, A[2], B[3]);
and AND021(a2b4, A[2], B[4]);and AND022(a2b5, A[2], B[5]);
and AND023(a2b6, A[2], B[6]);and AND024(a2b7, A[2], B[7]);
and AND025(a2b8, A[2], B[8]);and AND026(a2b9, A[2], B[9]);
and AND027(a2b10, A[2], B[10]);and AND028(a2b11, A[2], B[11]);
and AND029(a2b12, A[2], B[12]);and AND030(a2b13, A[2], B[13]);
and AND031(a2b14, A[2], B[14]);and AND032(a2b15, A[2], B[15]);
and AND033(a3b0, A[3], B[0]);and AND34(a3b1, A[3], B[1]);
and AND35(a3b2, A[3], B[2]);and AND36(a3b3, A[3], B[3]);
and AND37(a3b4, A[3], B[4]);and AND38(a3b5, A[3], B[5]);
and AND39(a3b6, A[3], B[6]);and AND40(a3b7, A[3], B[7]);
and AND41(a3b8, A[3], B[8]);and AND42(a3b9, A[3], B[9]);
and AND43(a3b10, A[3], B[10]);and AND44(a3b11, A[3], B[11]);
and AND45(a3b12, A[3], B[12]);and AND46(a3b13, A[3], B[13]);
and AND47(a3b14, A[3], B[14]);and AND048(a3b15, A[3], B[15]);
and AND48(a4b0, A[4], B[0]);
and AND49(a4b1, A[4], B[1]);
and AND50(a4b2, A[4], B[2]);
and AND51(a4b3, A[4], B[3]);
and AND52(a4b4, A[4], B[4]);
and AND53(a4b5, A[4], B[5]);
and AND54(a4b6, A[4], B[6]);
and AND55(a4b7, A[4], B[7]);
and AND56(a4b8, A[4], B[8]);
and AND57(a4b9, A[4], B[9]);
and AND58(a4b10, A[4], B[10]);
and AND59(a4b11, A[4], B[11]);
and AND60(a4b12, A[4], B[12]);
and AND61(a4b13, A[4], B[13]);
and AND62(a4b14, A[4], B[14]);
and AND63(a4b15, A[4], B[15]);
and AND64(a5b0, A[5], B[0]);
and AND65(a5b1, A[5], B[1]);
and AND66(a5b2, A[5], B[2]);
and AND67(a5b3, A[5], B[3]);
and AND68(a5b4, A[5], B[4]);
and AND69(a5b5, A[5], B[5]);
and AND70(a5b6, A[5], B[6]);
and AND71(a5b7, A[5], B[7]);
and AND72(a5b8, A[5], B[8]);
and AND73(a5b9, A[5], B[9]);
and AND74(a5b10, A[5], B[10]);
and AND75(a5b11, A[5], B[11]);
and AND76(a5b12, A[5], B[12]);
and AND77(a5b13, A[5], B[13]);
and AND78(a5b14, A[5], B[14]);
and AND79(a5b15, A[5], B[15]);
and AND80(a6b0, A[6], B[0]);
and AND81(a6b1, A[6], B[1]);
and AND82(a6b2, A[6], B[2]);
and AND83(a6b3, A[6], B[3]);
and AND84(a6b4, A[6], B[4]);
and AND85(a6b5, A[6], B[5]);
and AND86(a6b6, A[6], B[6]);
and AND87(a6b7, A[6], B[7]);
and AND88(a6b8, A[6], B[8]);
and AND89(a6b9, A[6], B[9]);
and AND90(a6b10, A[6], B[10]);
and AND91(a6b11, A[6], B[11]);
and AND92(a6b12, A[6], B[12]);
and AND93(a6b13, A[6], B[13]);
and AND94(a6b14, A[6], B[14]);
and AND95(a6b15, A[6], B[15]);
and AND96(a7b0, A[7], B[0]);
and AND97(a7b1, A[7], B[1]);
and AND98(a7b2, A[7], B[2]);
and AND99(a7b3, A[7], B[3]);
and AND100(a7b4, A[7], B[4]);
and AND101(a7b5, A[7], B[5]);
and AND102(a7b6, A[7], B[6]);
and AND103(a7b7, A[7], B[7]);
and AND104(a7b8, A[7], B[8]);
and AND105(a7b9, A[7], B[9]);
and AND106(a7b10, A[7], B[10]);
and AND107(a7b11, A[7], B[11]);
and AND108(a7b12, A[7], B[12]);
and AND109(a7b13, A[7], B[13]);
and AND110(a7b14, A[7], B[14]);
and AND111(a7b15, A[7], B[15]);
and AND112(a8b0, A[8], B[0]);
and AND113(a8b1, A[8], B[1]);
and AND114(a8b2, A[8], B[2]);
and AND115(a8b3, A[8], B[3]);
and AND116(a8b4, A[8], B[4]);
and AND117(a8b5, A[8], B[5]);
and AND118(a8b6, A[8], B[6]);
and AND119(a8b7, A[8], B[7]);
and AND120(a8b8, A[8], B[8]);
and AND121(a8b9, A[8], B[9]);
and AND122(a8b10, A[8], B[10]);
and AND123(a8b11, A[8], B[11]);
and AND124(a8b12, A[8], B[12]);
and AND125(a8b13, A[8], B[13]);
and AND126(a8b14, A[8], B[14]);
and AND127(a8b15, A[8], B[15]);
and AND128(a9b0, A[9], B[0]);
and AND129(a9b1, A[9], B[1]);
and AND130(a9b2, A[9], B[2]);
and AND131(a9b3, A[9], B[3]);
and AND132(a9b4, A[9], B[4]);
and AND133(a9b5, A[9], B[5]);
and AND134(a9b6, A[9], B[6]);
and AND135(a9b7, A[9], B[7]);
and AND136(a9b8, A[9], B[8]);
and AND137(a9b9, A[9], B[9]);
and AND138(a9b10, A[9], B[10]);
and AND139(a9b11, A[9], B[11]);
and AND140(a9b12, A[9], B[12]);
and AND141(a9b13, A[9], B[13]);
and AND142(a9b14, A[9], B[14]);
and AND143(a9b15, A[9], B[15]);
and AND144(a10b0, A[10], B[0]);
and AND145(a10b1, A[10], B[1]);
and AND146(a10b2, A[10], B[2]);
and AND147(a10b3, A[10], B[3]);
and AND148(a10b4, A[10], B[4]);
and AND149(a10b5, A[10], B[5]);
and AND150(a10b6, A[10], B[6]);
and AND151(a10b7, A[10], B[7]);
and AND152(a10b8, A[10], B[8]);
and AND153(a10b9, A[10], B[9]);
and AND154(a10b10, A[10], B[10]);
and AND155(a10b11, A[10], B[11]);
and AND156(a10b12, A[10], B[12]);
and AND157(a10b13, A[10], B[13]);
and AND158(a10b14, A[10], B[14]);
and AND159(a10b15, A[10], B[15]);
and AND160(a11b0, A[11], B[0]);
and AND161(a11b1, A[11], B[1]);
and AND162(a11b2, A[11], B[2]);
and AND163(a11b3, A[11], B[3]);
and AND164(a11b4, A[11], B[4]);
and AND165(a11b5, A[11], B[5]);
and AND166(a11b6, A[11], B[6]);
and AND167(a11b7, A[11], B[7]);
and AND168(a11b8, A[11], B[8]);
and AND169(a11b9, A[11], B[9]);
and AND170(a11b10, A[11], B[10]);
and AND171(a11b11, A[11], B[11]);
and AND172(a11b12, A[11], B[12]);
and AND173(a11b13, A[11], B[13]);
and AND174(a11b14, A[11], B[14]);
and AND175(a11b15, A[11], B[15]);
and AND176(a12b0, A[12], B[0]);
and AND177(a12b1, A[12], B[1]);
and AND178(a12b2, A[12], B[2]);
and AND179(a12b3, A[12], B[3]);
and AND180(a12b4, A[12], B[4]);
and AND181(a12b5, A[12], B[5]);
and AND182(a12b6, A[12], B[6]);
and AND183(a12b7, A[12], B[7]);
and AND184(a12b8, A[12], B[8]);
and AND185(a12b9, A[12], B[9]);
and AND186(a12b10, A[12], B[10]);
and AND187(a12b11, A[12], B[11]);
and AND188(a12b12, A[12], B[12]);
and AND189(a12b13, A[12], B[13]);
and AND190(a12b14, A[12], B[14]);
and AND191(a12b15, A[12], B[15]);
and AND192(a13b0, A[13], B[0]);
and AND193(a13b1, A[13], B[1]);
and AND194(a13b2, A[13], B[2]);
and AND195(a13b3, A[13], B[3]);
and AND196(a13b4, A[13], B[4]);
and AND197(a13b5, A[13], B[5]);
and AND198(a13b6, A[13], B[6]);
and AND199(a13b7, A[13], B[7]);
and AND200(a13b8, A[13], B[8]);
and AND201(a13b9, A[13], B[9]);
and AND202(a13b10, A[13], B[10]);
and AND203(a13b11, A[13], B[11]);
and AND204(a13b12, A[13], B[12]);
and AND205(a13b13, A[13], B[13]);
and AND206(a13b14, A[13], B[14]);
and AND207(a13b15, A[13], B[15]);
and AND208(a14b0, A[14], B[0]);
and AND209(a14b1, A[14], B[1]);
and AND210(a14b2, A[14], B[2]);
and AND211(a14b3, A[14], B[3]);
and AND212(a14b4, A[14], B[4]);
and AND213(a14b5, A[14], B[5]);
and AND214(a14b6, A[14], B[6]);
and AND215(a14b7, A[14], B[7]);
and AND216(a14b8, A[14], B[8]);
and AND217(a14b9, A[14], B[9]);
and AND218(a14b10, A[14], B[10]);
and AND219(a14b11, A[14], B[11]);
and AND220(a14b12, A[14], B[12]);
and AND221(a14b13, A[14], B[13]);
and AND222(a14b14, A[14], B[14]);
and AND223(a14b15, A[14], B[15]);
and AND224(a15b0, A[15], B[0]);
and AND225(a15b1, A[15], B[1]);
and AND226(a15b2, A[15], B[2]);
and AND227(a15b3, A[15], B[3]);
and AND228(a15b4, A[15], B[4]);
and AND229(a15b5, A[15], B[5]);
and AND230(a15b6, A[15], B[6]);
and AND231(a15b7, A[15], B[7]);
and AND232(a15b8, A[15], B[8]);
and AND233(a15b9, A[15], B[9]);
and AND234(a15b10, A[15], B[10]);
and AND235(a15b11, A[15], B[11]);
and AND236(a15b12, A[15], B[12]);
and AND237(a15b13, A[15], B[13]);
and AND238(a15b14, A[15], B[14]);
and AND239(a15b15, A[15], B[15]);

assign product[0] = a0b0;

//row 0
half_adder HA0_1(product[1], c0_0,   a1b0,  a0b1);
full_adder FA0_1(s0_1,   c0_1,       a2b0,  a1b1, c0_0);
full_adder FA0_2(s0_2,   c0_2,       a3b0,  a2b1, c0_1);
full_adder FA0_3(s0_3,   c0_3,       a4b0,  a3b1, c0_2);
full_adder FA0_4(s0_4,   c0_4,       a5b0,  a4b1, c0_3);
full_adder FA0_5(s0_5,   c0_5,       a6b0,  a5b1, c0_4);
full_adder FA0_6(s0_6,   c0_6,       a7b0,  a6b1, c0_5);
full_adder FA0_7(s0_7,   c0_7,       a8b0,  a7b1, c0_6);
full_adder FA0_8(s0_8,   c0_8,       a9b0,  a8b1, c0_7);
full_adder FA0_9(s0_9,   c0_9,       a10b0, a9b1, c0_8);
full_adder FA0_10(s0_10, c0_10,      a11b0, a10b1, c0_9);
full_adder FA0_11(s0_11, c0_11,      a12b0, a11b1, c0_10);
full_adder FA0_12(s0_12, c0_12,      a13b0, a12b1, c0_11);
full_adder FA0_13(s0_13, c0_13,      a14b0, a13b1, c0_12);
full_adder FA0_14(s0_14, c0_14,      a15b0, a14b1, c0_13);
half_adder HA0_2(s0_15, c0_15,              a15b1, c0_14);

//row 1
half_adder HA1_1(product[2], c1_0,   s0_1, a0b2);
full_adder FA1_1(s1_1,   c1_1,       s0_2,  a1b2,  c1_0);
full_adder FA1_2(s1_2,   c1_2,       s0_3,  a2b2,  c1_1);
full_adder FA1_3(s1_3,   c1_3,       s0_4,  a3b2,  c1_2);
full_adder FA1_4(s1_4,   c1_4,       s0_5,  a4b2,  c1_3);
full_adder FA1_5(s1_5,   c1_5,       s0_6,  a5b2,  c1_4);
full_adder FA1_6(s1_6,   c1_6,       s0_7,  a6b2,  c1_5);
full_adder FA1_7(s1_7,   c1_7,       s0_8,  a7b2,  c1_6);
full_adder FA1_8(s1_8,   c1_8,       s0_9,  a8b2,  c1_7);
full_adder FA1_9(s1_9,   c1_9,       s0_10, a9b2,  c1_8);
full_adder FA1_10(s1_10, c1_10,      s0_11, a10b2, c1_9);
full_adder FA1_11(s1_11, c1_11,      s0_12, a11b2, c1_10);
full_adder FA1_12(s1_12, c1_12,      s0_13, a12b2, c1_11);
full_adder FA1_13(s1_13, c1_13,      s0_14, a13b2, c1_12);
full_adder FA1_14(s1_14, c1_14,      s0_15, a14b2, c1_13);
full_adder FA1_15(s1_15, c1_15,      c0_15, a15b2, c1_14);

//row2
half_adder HA2_1(product[3], c2_0,   s1_1,  a0b3);
full_adder FA2_1(s2_1,   c2_1,       s1_2,  a1b3,  c2_0);
full_adder FA2_2(s2_2,   c2_2,       s1_3,  a2b3,  c2_1);
full_adder FA2_3(s2_3,   c2_3,       s1_4,  a3b3,  c2_2);
full_adder FA2_4(s2_4,   c2_4,       s1_5,  a4b3,  c2_3);
full_adder FA2_5(s2_5,   c2_5,       s1_6,  a5b3,  c2_4);
full_adder FA2_6(s2_6,   c2_6,       s1_7,  a6b3,  c2_5);
full_adder FA2_7(s2_7,   c2_7,       s1_8,  a7b3,  c2_6);
full_adder FA2_8(s2_8,   c2_8,       s1_9,  a8b3,  c2_7);
full_adder FA2_9(s2_9,   c2_9,       s1_10, a9b3,  c2_8);
full_adder FA2_10(s2_10, c2_10,      s1_11, a10b3, c2_9);
full_adder FA2_11(s2_11, c2_11,      s1_12, a11b3, c2_10);
full_adder FA2_12(s2_12, c2_12,      s1_13, a12b3, c2_11);
full_adder FA2_13(s2_13, c2_13,      s1_14, a13b3, c2_12);
full_adder FA2_14(s2_14, c2_14,      s1_15, a14b3, c2_13);
full_adder FA2_15(s2_15, c2_15,      c1_15, a15b3, c2_14);

//row3
half_adder HA3_1(product[4], c3_0,   s2_1,  a0b4);
full_adder FA3_1(s3_1,   c3_1,       s2_2,  a1b4,  c3_0);
full_adder FA3_2(s3_2,   c3_2,       s2_3,  a2b4,  c3_1);
full_adder FA3_3(s3_3,   c3_3,       s2_4,  a3b4,  c3_2);
full_adder FA3_4(s3_4,   c3_4,       s2_5,  a4b4,  c3_3);
full_adder FA3_5(s3_5,   c3_5,       s2_6,  a5b4,  c3_4);
full_adder FA3_6(s3_6,   c3_6,       s2_7,  a6b4,  c3_5);
full_adder FA3_7(s3_7,   c3_7,       s2_8,  a7b4,  c3_6);
full_adder FA3_8(s3_8,   c3_8,       s2_9,  a8b4,  c3_7);
full_adder FA3_9(s3_9,   c3_9,       s2_10, a9b4,  c3_8);
full_adder FA3_10(s3_10, c3_10,      s2_11, a10b4, c3_9);
full_adder FA3_11(s3_11, c3_11,      s2_12, a11b4, c3_10);
full_adder FA3_12(s3_12, c3_12,      s2_13, a12b4, c3_11);
full_adder FA3_13(s3_13, c3_13,      s2_14, a13b4, c3_12);
full_adder FA3_14(s3_14, c3_14,      s2_15, a14b4, c3_13);
full_adder FA3_15(s3_15, c3_15,      c2_15, a15b4, c3_14);

//row4
half_adder HA4_1(product[5], c4_0,   s3_1,  a0b5);
full_adder FA4_1(s4_1,   c4_1,       s3_2,  a1b5,  c4_0);
full_adder FA4_2(s4_2,   c4_2,       s3_3,  a2b5,  c4_1);
full_adder FA4_3(s4_3,   c4_3,       s3_4,  a3b5,  c4_2);
full_adder FA4_4(s4_4,   c4_4,       s3_5,  a4b5,  c4_3);
full_adder FA4_5(s4_5,   c4_5,       s3_6,  a5b5,  c4_4);
full_adder FA4_6(s4_6,   c4_6,       s3_7,  a6b5,  c4_5);
full_adder FA4_7(s4_7,   c4_7,       s3_8,  a7b5,  c4_6);
full_adder FA4_8(s4_8,   c4_8,       s3_9,  a8b5,  c4_7);
full_adder FA4_9(s4_9,   c4_9,       s3_10, a9b5,  c4_8);
full_adder FA4_10(s4_10, c4_10,      s3_11, a10b5, c4_9);
full_adder FA4_11(s4_11, c4_11,      s3_12, a11b5, c4_10);
full_adder FA4_12(s4_12, c4_12,      s3_13, a12b5, c4_11);
full_adder FA4_13(s4_13, c4_13,      s3_14, a13b5, c4_12);
full_adder FA4_14(s4_14, c4_14,      s3_15, a14b5, c4_13);
full_adder FA4_15(s4_15, c4_15,      c3_15, a15b5, c4_14);

//row5
half_adder HA5_1(product[6], c5_0,   s4_1,  a0b6);
full_adder FA5_1(s5_1,   c5_1,       s4_2,  a1b6,  c5_0);
full_adder FA5_2(s5_2,   c5_2,       s4_3,  a2b6,  c5_1);
full_adder FA5_3(s5_3,   c5_3,       s4_4,  a3b6,  c5_2);
full_adder FA5_4(s5_4,   c5_4,       s4_5,  a4b6,  c5_3);
full_adder FA5_5(s5_5,   c5_5,       s4_6,  a5b6,  c5_4);
full_adder FA5_6(s5_6,   c5_6,       s4_7,  a6b6,  c5_5);
full_adder FA5_7(s5_7,   c5_7,       s4_8,  a7b6,  c5_6);
full_adder FA5_8(s5_8,   c5_8,       s4_9,  a8b6,  c5_7);
full_adder FA5_9(s5_9,   c5_9,       s4_10, a9b6,  c5_8);
full_adder FA5_10(s5_10, c5_10,      s4_11, a10b6, c5_9);
full_adder FA5_11(s5_11, c5_11,      s4_12, a11b6, c5_10);
full_adder FA5_12(s5_12, c5_12,      s4_13, a12b6, c5_11);
full_adder FA5_13(s5_13, c5_13,      s4_14, a13b6, c5_12);
full_adder FA5_14(s5_14, c5_14,      s4_15, a14b6, c5_13);
full_adder FA5_15(s5_15, c5_15,      c4_15, a15b6, c5_14);

//row6
half_adder HA6_1(product[7], c6_0,   s5_1,  a0b7);
full_adder FA6_1(s6_1,   c6_1,       s5_2,  a1b7,  c6_0);
full_adder FA6_2(s6_2,   c6_2,       s5_3,  a2b7,  c6_1);
full_adder FA6_3(s6_3,   c6_3,       s5_4,  a3b7,  c6_2);
full_adder FA6_4(s6_4,   c6_4,       s5_5,  a4b7,  c6_3);
full_adder FA6_5(s6_5,   c6_5,       s5_6,  a5b7,  c6_4);
full_adder FA6_6(s6_6,   c6_6,       s5_7,  a6b7,  c6_5);
full_adder FA6_7(s6_7,   c6_7,       s5_8,  a7b7,  c6_6);
full_adder FA6_8(s6_8,   c6_8,       s5_9,  a8b7,  c6_7);
full_adder FA6_9(s6_9,   c6_9,       s5_10, a9b7,  c6_8);
full_adder FA6_10(s6_10, c6_10,      s5_11, a10b7, c6_9);
full_adder FA6_11(s6_11, c6_11,      s5_12, a11b7, c6_10);
full_adder FA6_12(s6_12, c6_12,      s5_13, a12b7, c6_11);
full_adder FA6_13(s6_13, c6_13,      s5_14, a13b7, c6_12);
full_adder FA6_14(s6_14, c6_14,      s5_15, a14b7, c6_13);
full_adder FA6_15(s6_15, c6_15,      c5_15, a15b7, c6_14);

//row7
half_adder HA7_1(product[8], c7_0,   s6_1,  a0b8);
full_adder FA7_1(s7_1,   c7_1,       s6_2,  a1b8,  c7_0);
full_adder FA7_2(s7_2,   c7_2,       s6_3,  a2b8,  c7_1);
full_adder FA7_3(s7_3,   c7_3,       s6_4,  a3b8,  c7_2);
full_adder FA7_4(s7_4,   c7_4,       s6_5,  a4b8,  c7_3);
full_adder FA7_5(s7_5,   c7_5,       s6_6,  a5b8,  c7_4);
full_adder FA7_6(s7_6,   c7_6,       s6_7,  a6b8,  c7_5);
full_adder FA7_7(s7_7,   c7_7,       s6_8,  a7b8,  c7_6);
full_adder FA7_8(s7_8,   c7_8,       s6_9,  a8b8,  c7_7);
full_adder FA7_9(s7_9,   c7_9,       s6_10, a9b8,  c7_8);
full_adder FA7_10(s7_10, c7_10,      s6_11, a10b8, c7_9);
full_adder FA7_11(s7_11, c7_11,      s6_12, a11b8, c7_10);
full_adder FA7_12(s7_12, c7_12,      s6_13, a12b8, c7_11);
full_adder FA7_13(s7_13, c7_13,      s6_14, a13b8, c7_12);
full_adder FA7_14(s7_14, c7_14,      s6_15, a14b8, c7_13);
full_adder FA7_15(s7_15, c7_15,      c6_15, a15b8, c7_14);


//row8
half_adder HA8_1(product[9], c8_0,   s7_1,  a0b9);
full_adder FA8_1(s8_1,   c8_1,       s7_2,  a1b9,  c8_0);
full_adder FA8_2(s8_2,   c8_2,       s7_3,  a2b9,  c8_1);
full_adder FA8_3(s8_3,   c8_3,       s7_4,  a3b9,  c8_2);
full_adder FA8_4(s8_4,   c8_4,       s7_5,  a4b9,  c8_3);
full_adder FA8_5(s8_5,   c8_5,       s7_6,  a5b9,  c8_4);
full_adder FA8_6(s8_6,   c8_6,       s7_7,  a6b9,  c8_5);
full_adder FA8_7(s8_7,   c8_7,       s7_8,  a7b9,  c8_6);
full_adder FA8_8(s8_8,   c8_8,       s7_9,  a8b9,  c8_7);
full_adder FA8_9(s8_9,   c8_9,       s7_10, a9b9,  c8_8);
full_adder FA8_10(s8_10, c8_10,      s7_11, a10b9, c8_9);
full_adder FA8_11(s8_11, c8_11,      s7_12, a11b9, c8_10);
full_adder FA8_12(s8_12, c8_12,      s7_13, a12b9, c8_11);
full_adder FA8_13(s8_13, c8_13,      s7_14, a13b9, c8_12);
full_adder FA8_14(s8_14, c8_14,      s7_15, a14b9, c8_13);
full_adder FA8_15(s8_15, c8_15,      c7_15, a15b9, c8_14);

//row9
half_adder HA9_1(product[10], c9_0,  s8_1,  a0b10);
full_adder FA9_1(s9_1,   c9_1,       s8_2,  a1b10,  c9_0);
full_adder FA9_2(s9_2,   c9_2,       s8_3,  a2b10,  c9_1);
full_adder FA9_3(s9_3,   c9_3,       s8_4,  a3b10,  c9_2);
full_adder FA9_4(s9_4,   c9_4,       s8_5,  a4b10,  c9_3);
full_adder FA9_5(s9_5,   c9_5,       s8_6,  a5b10,  c9_4);
full_adder FA9_6(s9_6,   c9_6,       s8_7,  a6b10,  c9_5);
full_adder FA9_7(s9_7,   c9_7,       s8_8,  a7b10,  c9_6);
full_adder FA9_8(s9_8,   c9_8,       s8_9,  a8b10,  c9_7);
full_adder FA9_9(s9_9,   c9_9,       s8_10, a9b10,  c9_8);
full_adder FA9_10(s9_10, c9_10,      s8_11, a10b10, c9_9);
full_adder FA9_11(s9_11, c9_11,      s8_12, a11b10, c9_10);
full_adder FA9_12(s9_12, c9_12,      s8_13, a12b10, c9_11);
full_adder FA9_13(s9_13, c9_13,      s8_14, a13b10, c9_12);
full_adder FA9_14(s9_14, c9_14,      s8_15, a14b10, c9_13);
full_adder FA9_15(s9_15, c9_15,      c8_15, a15b10, c9_14);

//row10
half_adder HA10_1(product[11], c10_0,   s9_1,  a0b11);
full_adder FA10_1(s10_1,   c10_1,       s9_2,  a1b11,  c10_0);
full_adder FA10_2(s10_2,   c10_2,       s9_3,  a2b11,  c10_1);
full_adder FA10_3(s10_3,   c10_3,       s9_4,  a3b11,  c10_2);
full_adder FA10_4(s10_4,   c10_4,       s9_5,  a4b11,  c10_3);
full_adder FA10_5(s10_5,   c10_5,       s9_6,  a5b11,  c10_4);
full_adder FA10_6(s10_6,   c10_6,       s9_7,  a6b11,  c10_5);
full_adder FA10_7(s10_7,   c10_7,       s9_8,  a7b11,  c10_6);
full_adder FA10_8(s10_8,   c10_8,       s9_9,  a8b11,  c10_7);
full_adder FA10_9(s10_9,   c10_9,       s9_10, a9b11,  c10_8);
full_adder FA10_10(s10_10, c10_10,      s9_11, a10b11, c10_9);
full_adder FA10_11(s10_11, c10_11,      s9_12, a11b11, c10_10);
full_adder FA10_12(s10_12, c10_12,      s9_13, a12b11, c10_11);
full_adder FA10_13(s10_13, c10_13,      s9_14, a13b11, c10_12);
full_adder FA10_14(s10_14, c10_14,      s9_15, a14b11, c10_13);
full_adder FA10_15(s10_15, c10_15,      c9_15, a15b11, c10_14);

//row11
half_adder HA11_1(product[12], c11_0,   s10_1,  a0b12);
full_adder FA11_1(s11_1,   c11_1,       s10_2,  a1b12,  c11_0);
full_adder FA11_2(s11_2,   c11_2,       s10_3,  a2b12,  c11_1);
full_adder FA11_3(s11_3,   c11_3,       s10_4,  a3b12,  c11_2);
full_adder FA11_4(s11_4,   c11_4,       s10_5,  a4b12,  c11_3);
full_adder FA11_5(s11_5,   c11_5,       s10_6,  a5b12,  c11_4);
full_adder FA11_6(s11_6,   c11_6,       s10_7,  a6b12,  c11_5);
full_adder FA11_7(s11_7,   c11_7,       s10_8,  a7b12,  c11_6);
full_adder FA11_8(s11_8,   c11_8,       s10_9,  a8b12,  c11_7);
full_adder FA11_9(s11_9,   c11_9,       s10_10, a9b12,  c11_8);
full_adder FA11_10(s11_10, c11_10,      s10_11, a10b12, c11_9);
full_adder FA11_11(s11_11, c11_11,      s10_12, a11b12, c11_10);
full_adder FA11_12(s11_12, c11_12,      s10_13, a12b12, c11_11);
full_adder FA11_13(s11_13, c11_13,      s10_14, a13b12, c11_12);
full_adder FA11_14(s11_14, c11_14,      s10_15, a14b12, c11_13);
full_adder FA11_15(s11_15, c11_15,      c10_15, a15b12, c11_14);

//row12
half_adder HA12_1(product[13], c12_0,   s11_1,  a0b13);
full_adder FA12_1(s12_1,   c12_1,       s11_2,  a1b13,  c12_0);
full_adder FA12_2(s12_2,   c12_2,       s11_3,  a2b13,  c12_1);
full_adder FA12_3(s12_3,   c12_3,       s11_4,  a3b13,  c12_2);
full_adder FA12_4(s12_4,   c12_4,       s11_5,  a4b13,  c12_3);
full_adder FA12_5(s12_5,   c12_5,       s11_6,  a5b13,  c12_4);
full_adder FA12_6(s12_6,   c12_6,       s11_7,  a6b13,  c12_5);
full_adder FA12_7(s12_7,   c12_7,       s11_8,  a7b13,  c12_6);
full_adder FA12_8(s12_8,   c12_8,       s11_9,  a8b13,  c12_7);
full_adder FA12_9(s12_9,   c12_9,       s11_10, a9b13,  c12_8);
full_adder FA12_10(s12_10, c12_10,      s11_11, a10b13, c12_9);
full_adder FA12_11(s12_11, c12_11,      s11_12, a11b13, c12_10);
full_adder FA12_12(s12_12, c12_12,      s11_13, a12b13, c12_11);
full_adder FA12_13(s12_13, c12_13,      s11_14, a13b13, c12_12);
full_adder FA12_14(s12_14, c12_14,      s11_15, a14b13, c12_13);
full_adder FA12_15(s12_15, c12_15,      c11_15, a15b13, c12_14);

//row13
half_adder HA13_1(product[14], c13_0,   s12_1,  a0b14);
full_adder FA13_1(s13_1,   c13_1,       s12_2,  a1b14,  c13_0);
full_adder FA13_2(s13_2,   c13_2,       s12_3,  a2b14,  c13_1);
full_adder FA13_3(s13_3,   c13_3,       s12_4,  a3b14,  c13_2);
full_adder FA13_4(s13_4,   c13_4,       s12_5,  a4b14,  c13_3);
full_adder FA13_5(s13_5,   c13_5,       s12_6,  a5b14,  c13_4);
full_adder FA13_6(s13_6,   c13_6,       s12_7,  a6b14,  c13_5);
full_adder FA13_7(s13_7,   c13_7,       s12_8,  a7b14,  c13_6);
full_adder FA13_8(s13_8,   c13_8,       s12_9,  a8b14,  c13_7);
full_adder FA13_9(s13_9,   c13_9,       s12_10, a9b14,  c13_8);
full_adder FA13_10(s13_10, c13_10,      s12_11, a10b14, c13_9);
full_adder FA13_11(s13_11, c13_11,      s12_12, a11b14, c13_10);
full_adder FA13_12(s13_12, c13_12,      s12_13, a12b14, c13_11);
full_adder FA13_13(s13_13, c13_13,      s12_14, a13b14, c13_12);
full_adder FA13_14(s13_14, c13_14,      s12_15, a14b14, c13_13);
full_adder FA13_15(s13_15, c13_15,      c12_15, a15b14, c13_14);

//row14
half_adder HA14_1(product[15],  c14_0,       s13_1,  a0b15);
full_adder FA14_1(product[16],  c14_1,       s13_2,  a1b15,  c14_0);
full_adder FA14_2(product[17],  c14_2,       s13_3,  a2b15,  c14_1);
full_adder FA14_3(product[18],  c14_3,       s13_4,  a3b15,  c14_2);
full_adder FA14_4(product[19],  c14_4,       s13_5,  a4b15,  c14_3);
full_adder FA14_5(product[20],  c14_5,       s13_6,  a5b15,  c14_4);
full_adder FA14_6(product[21],  c14_6,       s13_7,  a6b15,  c14_5);
full_adder FA14_7(product[22],  c14_7,       s13_8,  a7b15,  c14_6);
full_adder FA14_8(product[23],  c14_8,       s13_9,  a8b15,  c14_7);
full_adder FA14_9(product[24],  c14_9,       s13_10, a9b15,  c14_8);
full_adder FA14_10(product[25], c14_10,      s13_11, a10b15, c14_9);
full_adder FA14_11(product[26], c14_11,      s13_12, a11b15, c14_10);
full_adder FA14_12(product[27], c14_12,      s13_13, a12b15, c14_11);
full_adder FA14_13(product[28], c14_13,      s13_14, a13b15, c14_12);
full_adder FA14_14(product[29], c14_14,      s13_15, a14b15, c14_13);
full_adder FA14_15(product[30], product[31], c13_15, a15b15, c14_14);
endmodule
