module wallace_unsigned_multiplier_4(product, A, B);
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

// First Stage
    half_adder ha1(s11, c11, pp0[1], pp1[0]);
    full_adder fa1(s12, c12, pp0[2], pp1[1], pp2[0]);
    full_adder fa2(s13, c13, pp0[3], pp1[2], pp2[1]);
    half_adder ha2(s14, c14,         pp1[3], pp2[2]);

// Second Stage
    assign product[1] = s11;
    half_adder ha3(s21,        c21,         s12,    c11);
    full_adder fa4(s22,        c22, pp3[0], s13,    c12);
    full_adder fa5(s23,        c23, pp3[1], s14,    c13);
    full_adder fa6(s24,        c24, pp3[2], pp2[3], c14);

// Final Stage uses ripple carry adder
    assign product[2] = s21;
    half_adder ha4(product[3], c31,        s22,    c21);
    full_adder fa7(product[4], c32,        s23,    c22, c31);
    full_adder fa8(product[5], c33,        s24,    c23, c32);
    full_adder fa9(product[6], product[7], pp3[3], c24, c33);
endmodule


module wallace_unsigned_multiplier_8(product, A, B);
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

endmodule
