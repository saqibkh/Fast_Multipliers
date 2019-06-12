module wallace_unsigned_multiplier_CLA_Reduced_4(product, A, B);
    /* This implementation uses a 4bit CLA adder for the final stage along
     * with a half adder */
    input [3:0] A, B;
    output [7:0] product;

    wire [3:0] pp0, pp1, pp2, pp3;
    wire s1,s2,s3,s4,s5,s6,s7,c1,c2;

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

    /*  First Carry Look-Ahead Adder */
    wire [3:0] G1; /* Generate */
    wire [3:0] P1; /* Propagate */
    wire [3:0] C1; /* Carry */
    assign G1[0] = pp0[1] & pp1[0];
    assign G1[1] = pp0[2] & pp1[1];
    assign G1[2] = pp0[3] & pp1[2];
    /*assign G[3] = 0      & pp1[3]; */
    assign P1[0] = pp0[1] ^ pp1[0];
    assign P1[1] = pp0[2] ^ pp1[1];
    assign P1[2] = pp0[3] ^ pp1[2];
    assign P1[3] = pp1[3]; //0      ^ pp1[3];
    /*assign C[0] = 0; */
    assign C1[1] = G1[0];
    assign C1[2] = G1[1] | (P1[1] & C1[1]);
    assign C1[3] = G1[2] | (P1[2] & C1[2]);
    assign c1    = P1[3] & C1[3]; //G[3] | (P[3] & C[3]);
    assign s1    = P1[0];
    assign s2    = P1[1] ^ C1[1];
    assign s3    = P1[2] ^ C1[2];
    assign s4    = P1[3] ^ C1[3];

    /* Second Carry Look-Ahead Adder */
    wire [2:0] G2; /* Generate */
    wire [2:0] P2; /* Propagate */
    wire [2:0] C2; /* Carry */
    assign G2[0] = pp2[1] & pp3[0];
    assign G2[1] = pp2[2] & pp3[1];
    assign G2[2] = pp2[3] & pp3[2];
    assign P2[0] = pp2[1] ^ pp3[0];
    assign P2[1] = pp2[2] ^ pp3[1];
    assign P2[2] = pp2[3] ^ pp3[2];
    /*assign C[0] = 0; */
    assign C2[1] = G2[0];
    assign C2[2] = G2[1] | (P2[1] & C2[1]);
    assign c2    = G2[2] | (P2[2] & C2[2]);
    assign s5    = P2[0];
    assign s6    = P2[1] ^ C2[1];
    assign s7    = P2[2] ^ C2[2];

    /* Final Stage of Carry Look-Ahead Adder */
    assign product[1] = s1;

    half_adder HA1(product[2], c3, s2, pp2[0]);

    wire [3:0] G; /* Generate */
    wire [3:0] P; /* Propagate */
    wire [3:0] C; /* Carry */
    //assign G[0] = s2     & pp2[0];
    assign G[0] = s3     & s5;
    assign G[1] = s4     & s6;
    assign G[2] = c1     & s7;
    assign G[3] = pp3[3] & c2;
    //assign P[0] = s2     ^ pp2[0];
    assign P[0] = s3     ^ s5;
    assign P[1] = s4     ^ s6;
    assign P[2] = c1     ^ s7;
    assign P[3] = pp3[3] ^ c2;
    assign C[0] = c3;
    assign C[1] = G[0] | (P[0] & C[0]);
    assign C[2] = G[1] | (P[1] & C[1]);
    assign C[3] = G[2] | (P[2] & C[2]);
    assign product[7] = G[3] | (P[3] & C[3]);
    assign product[3] = P[0] ^ C[0];
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
