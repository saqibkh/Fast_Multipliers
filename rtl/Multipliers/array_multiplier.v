module array_multiplier_4(output wire [7:0] product,
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

module array_multiplier_8(output wire [15:0] product,
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


module array_multiplier_16(output wire [31:0] product,
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
and AND17(a2b0, A[2], B[0]);and AND18(a2b1, A[2], B[1]);
and AND19(a2b2, A[2], B[2]);and AND20(a2b3, A[2], B[3]);
and AND21(a2b4, A[2], B[4]);and AND22(a2b5, A[2], B[5]);
and AND23(a2b6, A[2], B[6]);and AND24(a2b7, A[2], B[7]);
and AND25(a2b8, A[2], B[8]);and AND26(a2b9, A[2], B[9]);
and AND27(a2b10, A[2], B[10]);and AND28(a2b11, A[2], B[11]);
and AND29(a2b12, A[2], B[12]);and AND30(a2b13, A[2], B[13]);
and AND31(a2b14, A[2], B[14]);and AND32(a2b15, A[2], B[15]);
and AND33(a3b0, A[3], B[0]);and AND34(a3b1, A[3], B[1]);
and AND35(a3b2, A[3], B[2]);and AND36(a3b3, A[3], B[3]);
and AND37(a3b4, A[3], B[4]);and AND38(a3b5, A[3], B[5]);
and AND39(a3b6, A[3], B[6]);and AND40(a3b7, A[3], B[7]);
and AND41(a3b8, A[3], B[8]);and AND42(a3b9, A[3], B[9]);
and AND43(a3b10, A[3], B[10]);and AND44(a3b11, A[3], B[11]);
and AND45(a3b12, A[3], B[12]);and AND46(a3b13, A[3], B[13]);
and AND47(a3b14, A[3], B[14]);and AND48(a3b15, A[3], B[15]);
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




endmodule
