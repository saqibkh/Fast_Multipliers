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
