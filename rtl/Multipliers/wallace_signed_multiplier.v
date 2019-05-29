module wallace_signed_multiplier_4(product, A, B);
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


module wallace_signed_multiplier_8(product, A, B);
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

    /* Final Stage */
    half_adder ha16(product[5],  c51,         s402, c401);
    full_adder fa39(product[6],  c52,         s403, c402, c51);
    full_adder fa40(product[7],  c53,         s404, c403, c52);
    full_adder fa41(product[8],  c54,         s405, c404, c53);
    full_adder fa42(product[9],  c55,         s406, c405, c54);
    full_adder fa43(product[10], c56,         s407, c406, c55);
    full_adder fa44(product[11], c57,         s408, c407, c56);
    full_adder fa45(product[12], c58,         s409, c408, c57);
    full_adder fa46(product[13], c59,         s410, c409, c58);
    full_adder fa47(product[14], product[15], s411, c410, c59);

endmodule
