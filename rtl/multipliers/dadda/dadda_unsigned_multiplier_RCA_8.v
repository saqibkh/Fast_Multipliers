module dadda_unsigned_multiplier_RCA_8(product, A, B);
	/* Implementation of dadda multiplier with RCA at the end.
	 * Area: 1039.968769
	 * Power: 0.5508
	 * Timing : 1.53
	 */
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

module dadda_unsigned_multiplier_RCA_8_attempt1(product, A, B);
    /* This is HSOgawa's implementation for 8 bit dadda multiplier 
     * with RCA at end.
     * Area: 1039.968769
     * Power: 0.5470
     * Timing: 1.53
     */
    input [7:0] A, B;
    output [15:0] product;

wire [7:0] pp0, pp1, pp2, pp3, pp4, pp5, pp6, pp7;
	
assign pp0[0] = A[0] & B[0];
assign pp0[1] = A[0] & B[1];
assign pp0[2] = A[0] & B[2];
assign pp0[3] = A[0] & B[3];
assign pp0[4] = A[0] & B[4];
assign pp0[5] = A[0] & B[5];
assign pp0[6] = A[0] & B[6];
assign pp0[7] = A[0] & B[7];
assign pp1[0] = A[1] & B[0];
assign pp1[1] = A[1] & B[1];
assign pp1[2] = A[1] & B[2];
assign pp1[3] = A[1] & B[3];
assign pp1[4] = A[1] & B[4];
assign pp1[5] = A[1] & B[5];
assign pp1[6] = A[1] & B[6];
assign pp1[7] = A[1] & B[7];
assign pp2[0] = A[2] & B[0];
assign pp2[1] = A[2] & B[1];
assign pp2[2] = A[2] & B[2];
assign pp2[3] = A[2] & B[3];
assign pp2[4] = A[2] & B[4];
assign pp2[5] = A[2] & B[5];
assign pp2[6] = A[2] & B[6];
assign pp2[7] = A[2] & B[7];
assign pp3[0] = A[3] & B[0];
assign pp3[1] = A[3] & B[1];
assign pp3[2] = A[3] & B[2];
assign pp3[3] = A[3] & B[3];
assign pp3[4] = A[3] & B[4];
assign pp3[5] = A[3] & B[5];
assign pp3[6] = A[3] & B[6];
assign pp3[7] = A[3] & B[7];
assign pp4[0] = A[4] & B[0];
assign pp4[1] = A[4] & B[1];
assign pp4[2] = A[4] & B[2];
assign pp4[3] = A[4] & B[3];
assign pp4[4] = A[4] & B[4];
assign pp4[5] = A[4] & B[5];
assign pp4[6] = A[4] & B[6];
assign pp4[7] = A[4] & B[7];
assign pp5[0] = A[5] & B[0];
assign pp5[1] = A[5] & B[1];
assign pp5[2] = A[5] & B[2];
assign pp5[3] = A[5] & B[3];
assign pp5[4] = A[5] & B[4];
assign pp5[5] = A[5] & B[5];
assign pp5[6] = A[5] & B[6];
assign pp5[7] = A[5] & B[7];
assign pp6[0] = A[6] & B[0];
assign pp6[1] = A[6] & B[1];
assign pp6[2] = A[6] & B[2];
assign pp6[3] = A[6] & B[3];
assign pp6[4] = A[6] & B[4];
assign pp6[5] = A[6] & B[5];
assign pp6[6] = A[6] & B[6];
assign pp6[7] = A[6] & B[7];
assign pp7[0] = A[7] & B[0];
assign pp7[1] = A[7] & B[1];
assign pp7[2] = A[7] & B[2];
assign pp7[3] = A[7] & B[3];
assign pp7[4] = A[7] & B[4];
assign pp7[5] = A[7] & B[5];
assign pp7[6] = A[7] & B[6];
assign pp7[7] = A[7] & B[7];

wire [56:0] S;
wire [56:0] Cout;
Half_Adder HA1 (pp0[6], pp1[5], S[1], Cout[1]);
Full_Adder FA1 (pp0[7], pp1[6], pp2[5], S[2], Cout[2]);
Half_Adder HA2 (pp3[4], pp4[3], S[3], Cout[3]);
Full_Adder FA2 (pp1[7], pp2[6], pp3[5], S[4], Cout[4]);
Half_Adder HA3 (pp4[4], pp5[3], S[5], Cout[5]);
Full_Adder FA3 (pp2[7], pp3[6], pp4[5], S[6], Cout[6]);
Half_Adder HA4 (pp0[4], pp1[3], S[7], Cout[7]);
Full_Adder FA4 (pp0[5], pp1[4], pp2[3], S[8], Cout[8]);
Half_Adder HA5 (pp3[2], pp4[1], S[9], Cout[9]);
Full_Adder FA5 (pp2[4], pp3[3], pp4[2], S[10], Cout[10]);
Full_Adder FA6 (pp5[1], pp6[0], S[1], S[11], Cout[11]);
Full_Adder FA7 (pp5[2], pp6[1], pp7[0], S[12], Cout[12]);
Full_Adder FA8 (Cout[1], S[2], S[3], S[13], Cout[13]);
Full_Adder FA9 (pp6[2], pp7[1], Cout[2], S[14], Cout[14]);
Full_Adder FA10 (Cout[3], S[4], S[5], S[15], Cout[15]);
Full_Adder FA11 (pp5[4], pp6[3], pp7[2], S[16], Cout[16]);
Full_Adder FA12 (Cout[4], Cout[5], S[6], S[17], Cout[17]);
Full_Adder FA13 (pp3[7], pp4[6], pp5[5], S[18], Cout[18]);
Full_Adder FA14 (pp6[4], pp7[3], Cout[6], S[19], Cout[19]);
Full_Adder FA15 (pp4[7], pp5[6], pp6[5], S[20], Cout[20]);
Half_Adder HA6 (pp0[3], pp1[2], S[21], Cout[21]);
Full_Adder FA16 (pp2[2], pp3[1], pp4[0], S[22], Cout[22]);
Full_Adder FA17 (pp5[0], Cout[7], S[8], S[23], Cout[23]);
Full_Adder FA18 (Cout[8], Cout[9], S[10], S[24], Cout[24]);
Full_Adder FA19 (Cout[10], Cout[11], S[12], S[25], Cout[25]);
Full_Adder FA20 (Cout[12], Cout[13], S[14], S[26], Cout[26]);
Full_Adder FA21 (Cout[14], Cout[15], S[16], S[27], Cout[27]);
Full_Adder FA22 (Cout[16], Cout[17], S[18], S[28], Cout[28]);
Full_Adder FA23 (pp7[4], Cout[18], Cout[19], S[29], Cout[29]);
Full_Adder FA24 (pp5[7], pp6[6], pp7[5], S[30], Cout[30]);
Half_Adder HA7 (pp0[2], pp1[1], S[31], Cout[31]);
Full_Adder FA25 (pp2[1], pp3[0], S[21], S[32], Cout[32]);
Full_Adder FA26 (S[7], Cout[21], S[22], S[33], Cout[33]);
Full_Adder FA27 (S[9], Cout[22], S[23], S[34], Cout[34]);
Full_Adder FA28 (S[11], Cout[23], S[24], S[35], Cout[35]);
Full_Adder FA29 (S[13], Cout[24], S[25], S[36], Cout[36]);
Full_Adder FA30 (S[15], Cout[25], S[26], S[37], Cout[37]);
Full_Adder FA31 (S[17], Cout[26], S[27], S[38], Cout[38]);
Full_Adder FA32 (S[19], Cout[27], S[28], S[39], Cout[39]);
Full_Adder FA33 (S[20], Cout[28], S[29], S[40], Cout[40]);
Full_Adder FA34 (Cout[20], Cout[29], S[30], S[41], Cout[41]);
Full_Adder FA35 (pp6[7], pp7[6], Cout[30], S[42], Cout[42]);
Half_Adder HA8 (pp0[1], pp1[0], S[0], Cout[0]);
Full_Adder FA36 (pp2[0], S[31], Cout[0], S[43], Cout[43]);
Full_Adder FA37 (Cout[31], S[32], Cout[43], S[44], Cout[44]);
Full_Adder FA38 (Cout[32], S[33], Cout[44], S[45], Cout[45]);
Full_Adder FA39 (Cout[33], S[34], Cout[45], S[46], Cout[46]);
Full_Adder FA40 (Cout[34], S[35], Cout[46], S[47], Cout[47]);
Full_Adder FA41 (Cout[35], S[36], Cout[47], S[48], Cout[48]);
Full_Adder FA42 (Cout[36], S[37], Cout[48], S[49], Cout[49]);
Full_Adder FA43 (Cout[37], S[38], Cout[49], S[50], Cout[50]);
Full_Adder FA44 (Cout[38], S[39], Cout[50], S[51], Cout[51]);
Full_Adder FA45 (Cout[39], S[40], Cout[51], S[52], Cout[52]);
Full_Adder FA46 (Cout[40], S[41], Cout[52], S[53], Cout[53]);
Full_Adder FA47 (Cout[41], S[42], Cout[53], S[54], Cout[54]);
Full_Adder FA48 (pp7[7], Cout[42], Cout[54], S[55], Cout[55]);

assign product[15] = Cout[55];
assign product[14] = S[55];
assign product[13] = S[54];
assign product[12] = S[53];
assign product[11] = S[52];
assign product[10] = S[51];
assign product[9] = S[50];
assign product[8] = S[49];
assign product[7] = S[48];
assign product[6] = S[47];
assign product[5] = S[46];
assign product[4] = S[45];
assign product[3] = S[44];
assign product[2] = S[43];
assign product[1] = S[0];
assign product[0] = pp0[0];
    
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

module Half_Adder(input wire in1,
                  input wire in2,
                  output wire sum,
                  output wire cout);
    xor(sum, in1, in2);
    and(cout, in1, in2);
endmodule

module Full_Adder(input wire in1,
                  input wire in2,
                  input wire cin,
                  output wire sum,
                  output wire cout);
    wire temp1;
    wire temp2;
    wire temp3;
    xor(sum, in1, in2, cin);
    and(temp1,in1,in2);
    and(temp2,in1,cin);
    and(temp3,in2,cin);
    or(cout,temp1,temp2,temp3);
endmodule
