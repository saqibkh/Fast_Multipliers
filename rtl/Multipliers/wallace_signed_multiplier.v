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
    half_adder ha1(product[1], c11, pp0[1], pp1[0]);
    full_adder fa1(s12,        c12, pp0[2], pp1[1], pp2[0]);
    full_adder fa2(s13,        c13, pp0[3], pp1[2], pp2[1]);
    half_adder ha2(s14,        c14,         pp1[3], pp2[2]);

// Second Stage
    full_adder fa3(s21,        c21, pp3[0], s12,    c11);
    full_adder fa4(s22,        c22, pp3[1], s13,    c12);
    full_adder fa5(s23,        c23, pp3[2], s14,    c13);
    full_adder fa6(s24,        c24, pp3[3], pp2[3], c14);

// Final Stage uses ripple carry adder
    assign product[2] = s21;
    half_adder ha3(product[3], c31,        s22,    c21);
    full_adder fa7(product[4], c32,        s23,    c22, c31);
    full_adder fa8(product[5], c33,        s24,    c23, c32);
    full_adder fa9(product[6], product[7], pp3[3], c24, c33);
endmodule
