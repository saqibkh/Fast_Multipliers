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
and AND48(a6b7, A[6, B[7]);
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
half_adder HA1_1(product[1], c1_0, s0_1, a0b2);
full_adder FA1_1(s1_1, c1_1,       s0_2, a1b2, c1_0);
full_adder FA1_2(s1_2, c1_2,       s0_3, a2b2, c1_1);
full_adder FA1_3(s1_3, c1_3,       s0_4, a3b2, c1_2);
full_adder FA1_4(s1_4, c1_4,       s0_5, a4b2, c1_3);
full_adder FA1_5(s1_5, c1_5,       s0_6, a5b2, c1_4);
full_adder FA1_6(s1_6, c1_6,       s0_7, a6b2, c1_5);
full_adder FA1_7(s1_7, c1_7,       c0_7, a7b2, c1_6);

//row 2
half_adder HA2_1(product[2], c2_0, s1_1, a0b3);
full_adder FA1_1(s2_1, c2_1,       s1_2, a1b3, c2_0);
full_adder FA1_2(s2_2, c2_2,       s1_3, a2b3, c2_1);
full_adder FA1_3(s2_3, c2_3,       s1_4, a3b3, c2_2);
full_adder FA1_4(s2_4, c2_4,       s1_5, a4b3, c2_3);
full_adder FA1_5(s2_5, c2_5,       s1_6, a5b3, c2_4);
full_adder FA1_6(s2_6, c2_6,       s1_7, a6b3, c2_5);
full_adder FA1_7(s2_7, c2_7,       c1_7, a7b3, c2_6);

//row 3
half_adder HA3_1(product[3], c3_0, s2_1, a0b4);
full_adder FA3_1(s3_1, c3_1,       s2_2, a1b4, c3_0);
full_adder FA3_2(s3_2, c3_2,       s2_3, a2b4, c3_1);
full_adder FA3_3(s3_3, c3_3,       s2_4, a3b4, c3_2);
full_adder FA3_4(s3_4, c3_4,       s2_5, a4b4, c3_3);
full_adder FA3_5(s3_5, c3_5,       s2_6, a5b4, c3_4);
full_adder FA3_6(s3_6, c3_6,       s2_7, a6b4, c3_5);
full_adder FA3_7(s3_7, c3_7,       c2_7, a7b4, c3_6);

//row 4
half_adder HA4_1(product[4], c4_0, s3_1, a0b5);
full_adder FA4_1(s4_1, c4_1,       s3_2, a1b5, c4_0);
full_adder FA4_2(s4_2, c4_2,       s3_3, a2b5, c4_1);
full_adder FA4_3(s4_3, c4_3,       s3_4, a3b5, c4_2);
full_adder FA4_4(s4_4, c4_4,       s3_5, a4b5, c4_3);
full_adder FA4_5(s4_5, c4_5,       s3_6, a5b5, c4_4);
full_adder FA4_6(s4_6, c4_6,       s3_7, a6b5, c4_5);
full_adder FA4_7(s4_7, c4_7,       c3_7, a7b5, c4_6);

//row 5
half_adder HA5_1(product[5], );
full_adder FA5_1();
full_adder FA5_2();
full_adder FA5_3();
full_adder FA5_4();
full_adder FA5_5();
full_adder FA5_6();
full_adder FA5_7();

//row 6
half_adder HA6_1(product[6], );
full_adder FA6_1();
full_adder FA6_2();
full_adder FA6_3();
full_adder FA6_4();
full_adder FA6_5();
full_adder FA6_6();
full_adder FA6_7();

//row 7
half_adder HA7_1(product[7], );
full_adder FA7_1(product[8], );
full_adder FA7_2(product[9], );
full_adder FA7_3(product[10], );
full_adder FA7_4(product[11], );
full_adder FA7_5(product[12], );
full_adder FA7_6(product[13], );
full_adder FA7_7(product[14], product[15], );
endmodule
