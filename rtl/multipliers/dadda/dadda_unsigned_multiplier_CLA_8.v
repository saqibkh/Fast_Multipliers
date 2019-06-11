module dadda_unsigned_multiplier_CLA_8(product, A, B);
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

    /* Final Stage is a Carry Look-Ahead Adder */
    assign product[0] = pp0[0];

    wire [13:0] G; /* Generate */
    wire [13:0] P; /* Propagate */
    wire [13:0] C; /* Carry */

    assign G[0]  = pp1[0] & pp0[1];
    assign G[1]  = pp0[2] & s401;
    assign G[2]  = c401   & s402;
    assign G[3]  = c402   & s403;
    assign G[4]  = c403   & s404;
    assign G[5]  = c404   & s405;
    assign G[6]  = c405   & s406;
    assign G[7]  = c406   & s407;
    assign G[8]  = c407   & s408;
    assign G[9]  = c408   & s409;
    assign G[10] = c409   & s410;
    assign G[11] = c410   & s411;
    assign G[12] = c411   & s412;
    assign G[13] = c412   & pp7[7];
    assign P[0]  = pp1[0] ^ pp0[1];
    assign P[1]  = pp0[2] ^ s401;
    assign P[2]  = c401   ^ s402;
    assign P[3]  = c402   ^ s403;
    assign P[4]  = c403   ^ s404;
    assign P[5]  = c404   ^ s405;
    assign P[6]  = c405   ^ s406;
    assign P[7]  = c406   ^ s407;
    assign P[8]  = c407   ^ s408;
    assign P[9]  = c408   ^ s409;
    assign P[10] = c409   ^ s410;
    assign P[11] = c410   ^ s411;
    assign P[12] = c411   ^ s412;
    assign P[13] = c412   ^ pp7[7];

    //assign C[0] = 0;
    assign C[1]  = G[0];
    assign C[2]  = G[1]  | (P[1]  & C[1]);
    assign C[3]  = G[2]  | (P[2]  & C[2]);
    assign C[4]  = G[3]  | (P[3]  & C[3]);
    assign C[5]  = G[4]  | (P[4]  & C[4]);
    assign C[6]  = G[5]  | (P[5]  & C[5]);
    assign C[7]  = G[6]  | (P[6]  & C[6]);
    assign C[8]  = G[7]  | (P[7]  & C[7]);
    assign C[9]  = G[8]  | (P[8]  & C[8]);
    assign C[10] = G[9]  | (P[9]  & C[9]);
    assign C[11] = G[10] | (P[10] & C[10]);
    assign C[12] = G[11] | (P[11] & C[11]);
    assign C[13] = G[12] | (P[12] & C[12]);
    assign product[15] = G[13] | (P[13] & C[13]);

    assign product[1]  = P[0];
    assign product[2]  = P[1]  ^ C[1];
    assign product[3]  = P[2]  ^ C[2];
    assign product[4]  = P[3]  ^ C[3];
    assign product[5]  = P[4]  ^ C[4];
    assign product[6]  = P[5]  ^ C[5];
    assign product[7]  = P[6]  ^ C[6];
    assign product[8]  = P[7]  ^ C[7];
    assign product[9]  = P[8]  ^ C[8];
    assign product[10] = P[9]  ^ C[9];
    assign product[11] = P[10] ^ C[10];
    assign product[12] = P[11] ^ C[11];
    assign product[13] = P[12] ^ C[12];
    assign product[14] = P[13] ^ C[13];
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
