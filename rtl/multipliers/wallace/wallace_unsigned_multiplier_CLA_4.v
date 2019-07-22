module wallace_unsigned_multiplier_CLA_4(product, A, B);
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
    half_adder ha1(s11, c11, pp0[1], pp1[0]);
    full_adder fa1(s12, c12, pp0[2], pp1[1], pp2[0]);
    full_adder fa2(s13, c13, pp0[3], pp1[2], pp2[1]);
    half_adder ha2(s14, c14,         pp1[3], pp2[2]);

/* Second Stage */
    assign product[1] = s11;
    half_adder ha3(s21,        c21,         s12,    c11);
    full_adder fa3(s22,        c22, pp3[0], s13,    c12);
    full_adder fa4(s23,        c23, pp3[1], s14,    c13);
    full_adder fa5(s24,        c24, pp3[2], pp2[3], c14);

/* Final Stage uses Carry Look-Ahead Adder */
    assign product[2] = s21;

    wire [3:0] G; /* Generate */
    wire [3:0] P; /* Propagate */
    wire [3:0] C; /* Carry */
    assign G[0] = s22    & c21;
    assign G[1] = s23    & c22;
    assign G[2] = s24    & c23;
    assign G[3] = pp3[3] & c24;
    assign P[0] = s22    ^ c21;
    assign P[1] = s23    ^ c22;
    assign P[2] = s24    ^ c23;
    assign P[3] = pp3[3] ^ c24;

    //assign C[0] = 0;
    assign C[1] = G[0];
    assign C[2] = G[1] | (P[1] & C[1]);
    assign C[3] = G[2] | (P[2] & C[2]);
    assign product[7]  = G[3] | (P[3] & C[3]);

    assign product[3] = P[0]; 
    assign product[4] = P[1] ^ C[1];
    assign product[5] = P[2] ^ C[2];
    assign product[6] = P[3] ^ C[3];
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
