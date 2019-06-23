module russian_peasant_modified_unsigned_multiplier_8(product, A, B);
     /* This implementation uses carry look-ahead adders of variable lengths
     * that are 12-13 bits long, even for final stage, but also uses FA and
     * HAs in the middle.
     * Area: 1046.069668
     * Power: 0.5413
     * Timing: 1.35 */

    input [7:0] A, B;
    output [15:0] product;

    wire [15:0] product;

    wire [7:0] pp0, pp1, pp2, pp3, pp4, pp5, pp6, pp7;
    assign pp0 = A[0] ? B : 8'b00000000;
    assign pp1 = A[1] ? B : 8'b00000000;
    assign pp2 = A[2] ? B : 8'b00000000;
    assign pp3 = A[3] ? B : 8'b00000000;
    assign pp4 = A[4] ? B : 8'b00000000;
    assign pp5 = A[5] ? B : 8'b00000000;
    assign pp6 = A[6] ? B : 8'b00000000;
    assign pp7 = A[7] ? B : 8'b00000000;

    assign product[0] = pp0[0];

    wire [6:0] s1, in1_1, in1_2;
    wire c1;
    assign in1_1 = {pp0[1], pp0[2], pp0[3], pp0[4], pp0[5], pp0[6], pp0[7]};
    assign in1_2 = {pp1[0], pp1[1], pp1[2], pp1[3], pp1[4], pp1[5], pp1[6]};
    CLA7 CLA01(s1, c1, in1_1, in1_2);
    assign product[1] = s1[0];

    wire [6:0] s2, in2_1, in2_2;
    wire c2;
    assign in2_1 = {pp2[1], pp2[2], pp2[3], pp2[4], pp2[5], pp2[6], pp2[7]};
    assign in2_2 = {pp3[0], pp3[1], pp3[2], pp3[3], pp3[4], pp3[5], pp3[6]};
    CLA7 CLA02(s2, c2, in2_1, in2_2); 

    wire [6:0] s3, in3_1, in3_2;
    wire c3;
    assign in3_1 = {pp4[1], pp4[2], pp4[3], pp4[4], pp4[5], pp4[6], pp4[7]};
    assign in3_2 = {pp5[0], pp5[1], pp5[2], pp5[3], pp5[4], pp5[5], pp5[6]};
    CLA7 CLA03(s3, c3, in3_1, in3_2);

    wire [6:0] s4, in4_1, in4_2;
    wire c4;
    assign in4_1 = {pp6[1], pp6[2], pp6[3], pp6[4], pp6[5], pp6[6], pp6[7]};
    assign in4_2 = {pp7[0], pp7[1], pp7[2], pp7[3], pp7[4], pp7[5], pp7[6]};
    CLA7 CLA04(s4, c4, in4_1, in4_2);

    wire [6:0] s5, in5_1, in5_2;
    wire c5;
    assign in5_1 = {pp6[0], s4[0], s2[5], s2[6], s3[5], s3[6], s4[5]};
    assign in5_2 = {s2[3],  s2[4], s3[3], s3[4], s4[3], s4[4], pp5[7]};
    CLA7_c CLA05(s5, c5, in5_1, in5_2, s3[1]);
    
    half_adder ha01(sA, cA, s3[2], s1[6]);
    full_adder fa01(sB, cB, s4[1], pp1[7], c1);

    full_adder fa02(sC, cC, s1[3], s2[1], pp4[0]);
    full_adder fa03(sD, cD, s1[4], s2[2], s3[0]);
    half_adder ha02(sE, cE, s5[0], s1[5]);
    half_adder ha03(sF, cF, s5[1], sA);
    full_adder fa04(sG, cG, s5[2], sB, cA);
    full_adder fa05(sH, cH, s5[3], s4[2], cB);
    full_adder fa06(sI, cI, s5[4], pp3[7], c2);

    /* Final Stage */
    wire [12:0] G, P, C;
    assign G[0]   = s1[1] & pp2[0];
    assign G[1]   = s1[2] & s2[0];
    assign G[2]   = sC    & 0;
    assign G[3]   = sD    & cC;
    assign G[4]   = sE    & cD;
    assign G[5]   = sF    & cE;
    assign G[6]   = sG    & cF;
    assign G[7]   = sH    & cG;
    assign G[8]   = sI    & cH;
    assign G[9]   = s5[5] & cI;
    assign G[10]  = s5[6] & c3;
    assign G[11]  = s4[6] & c5;
    assign G[12]  = pp7[7]& c4;
    assign P[0]   = s1[1] ^ pp2[0];
    assign P[1]   = s1[2] ^ s2[0];
    assign P[2]   = sC    ^ 0;
    assign P[3]   = sD    ^ cC;
    assign P[4]   = sE    ^ cD;
    assign P[5]   = sF    ^ cE;
    assign P[6]   = sG    ^ cF;
    assign P[7]   = sH    ^ cG;
    assign P[8]   = sI    ^ cH;
    assign P[9]   = s5[5] ^ cI;
    assign P[10]  = s5[6] ^ c3;
    assign P[11]  = s4[6] ^ c5;
    assign P[12]  = pp7[7]^ c4;
 
    assign C[0]  = 0;
    assign C[1]  = G[0]  | (P[0] & C[0]);
    assign C[2]  = G[1]  | (P[1] & C[1]);
    assign C[3]  = G[2]  | (P[2] & C[2]);
    assign C[4]  = G[3]  | (P[3] & C[3]);
    assign C[5]  = G[4]  | (P[4] & C[4]);
    assign C[6]  = G[5]  | (P[5] & C[5]);
    assign C[7]  = G[6]  | (P[6] & C[6]);
    assign C[8]  = G[7]  | (P[7] & C[7]);
    assign C[9]  = G[8]  | (P[8] & C[8]);
    assign C[10] = G[9]  | (P[9] & C[9]);
    assign C[11] = G[10] | (P[10] & C[10]);
    assign C[12] = G[11] | (P[11] & C[11]);
    assign product[15] = G[12] | (P[12] & C[12]);
    assign product[2]  = P[0];
    assign product[3]  = P[1]  ^ C[1];
    assign product[4]  = P[2]  ^ C[2];
    assign product[5]  = P[3]  ^ C[3];
    assign product[6]  = P[4]  ^ C[4];
    assign product[7]  = P[5]  ^ C[5];
    assign product[8]  = P[6]  ^ C[6];
    assign product[9]  = P[7]  ^ C[7];
    assign product[10] = P[8]  ^ C[8];
    assign product[11] = P[9]  ^ C[9];
    assign product[12] = P[10] ^ C[10];
    assign product[13] = P[11] ^ C[11];
    assign product[14] = P[12] ^ C[12];
endmodule

module CLA7_c(output [6:0] sum,
            output cout,
            input [6:0] in1, in2,
            input cin);
  wire [6:0] G; /* Generate */
  wire [6:0] P; /* Propagate */
  wire [6:0] C; /* Carry */

  assign G[0] = in1[6] & in2[6]; /*Generate    Gi = Ai * Bi */
  assign G[1] = in1[5] & in2[5];
  assign G[2] = in1[4] & in2[4];
  assign G[3] = in1[3] & in2[3];
  assign G[4] = in1[2] & in2[2];
  assign G[5] = in1[1] & in2[1];
  assign G[6] = in1[0] & in2[0];

  assign P[0] = in1[6] ^ in2[6]; /*Propagate   Pi = Ai + Bi */
  assign P[1] = in1[5] ^ in2[5];
  assign P[2] = in1[4] ^ in2[4];
  assign P[3] = in1[3] ^ in2[3];
  assign P[4] = in1[2] ^ in2[2];
  assign P[5] = in1[1] ^ in2[1];
  assign P[6] = in1[0] ^ in2[0];

  assign C[0] = cin;  /* Carry_out = Ci+1 = Gi + Pi*Ci */
  assign C[1] = G[0] | (P[0] & C[0]);
  assign C[2] = G[1] | (P[1] & C[1]);
  assign C[3] = G[2] | (P[2] & C[2]);
  assign C[4] = G[3] | (P[3] & C[3]);
  assign C[5] = G[4] | (P[4] & C[4]);
  assign C[6] = G[5] | (P[5] & C[5]);
  assign cout = G[6] | (P[6] & C[6]);
  assign sum = P ^ C;
endmodule

module CLA7(output [6:0] sum,
            output cout,
            input [6:0] in1, in2);
  wire [6:0] G; /* Generate */
  wire [6:0] P; /* Propagate */
  wire [6:0] C; /* Carry */

  assign G[0] = in1[6] & in2[6]; /*Generate    Gi = Ai * Bi */
  assign G[1] = in1[5] & in2[5];
  assign G[2] = in1[4] & in2[4];
  assign G[3] = in1[3] & in2[3];
  assign G[4] = in1[2] & in2[2];
  assign G[5] = in1[1] & in2[1];
  assign G[6] = in1[0] & in2[0];

  assign P[0] = in1[6] ^ in2[6]; /*Propagate   Pi = Ai + Bi */
  assign P[1] = in1[5] ^ in2[5];
  assign P[2] = in1[4] ^ in2[4];
  assign P[3] = in1[3] ^ in2[3];
  assign P[4] = in1[2] ^ in2[2];
  assign P[5] = in1[1] ^ in2[1];
  assign P[6] = in1[0] ^ in2[0];

  assign C[0] = 0;  /* Carry_out = Ci+1 = Gi + Pi*Ci */
  assign C[1] = G[0] | (P[0] & C[0]);
  assign C[2] = G[1] | (P[1] & C[1]);
  assign C[3] = G[2] | (P[2] & C[2]);
  assign C[4] = G[3] | (P[3] & C[3]);
  assign C[5] = G[4] | (P[4] & C[4]);
  assign C[6] = G[5] | (P[5] & C[5]);
  assign cout = G[6] | (P[6] & C[6]);
  assign sum = P ^ C;
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
