module multiplier_8bits_version4(product, A, B);

    /* This implementation is similar to 8bit russian peasant multiplication
     * that uses long CLA for partial product reduction and for the 
     * final stage.
     * Area: 1040.907368
     * Power: 0.4991mW
     * Timing: 1.34
     */

    input [7:0] A, B;
    output [15:0] product;

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

    /* 1st CLA*/
    wire [7:0] s1, in1_1, in1_2;
    wire c1;
    assign in1_1 = {pp0[1],pp0[2],pp0[3],pp0[4],pp0[5],pp0[6],pp0[7],1'b0};
    assign in1_2 = {pp1[0],pp1[1],pp1[2],pp1[3],pp1[4],pp1[5],pp1[6], pp1[7]};
    CLA8 CLA01(s1, c1, in1_1, in1_2);

    assign product[1] = s1[0];

    /* 2nd CLA */
    wire [6:0] s2, in2_1, in2_2;
    wire c2;
    assign in2_1 = {pp2[1],pp2[2],pp2[3],pp2[4],pp2[5],pp2[6],pp2[7]};
    assign in2_2 = {pp3[0],pp3[1],pp3[2],pp3[3],pp3[4],pp3[5],pp3[6]};
    CLA7 CLA02(s2, c2, in2_1, in2_2);

    /* 3rd CLA */
    wire [6:0] s3, in3_1, in3_2;
    wire c3;
    assign in3_1 = {pp4[1],pp4[2],pp4[3],pp4[4],pp4[5],pp4[6],pp4[7]};
    assign in3_2 = {pp5[0],pp5[1],pp5[2],pp5[3],pp5[4],pp5[5],pp5[6]};
    CLA7 CLA03(s3, c3, in3_1, in3_2);    

    /* 4th CLA */
    wire [3:0] s4, in4_1, in4_2;
    wire c4;
    assign in4_1 = {pp6[1],pp6[2],pp6[3],pp6[4]};
    assign in4_2 = {pp7[0],pp7[1],pp7[2],pp7[3]};
    CLA4 CLA04(s4, c4, in4_1, in4_2);

    /* 5th CLA */
    wire [9:0] s5, in5_1, in5_2;
    wire c5;
    assign in5_1 = {s1[3],s1[4],s1[5],s1[6],s1[7],c1,pp3[7],pp6[5],pp5[7],pp6[7]};
    assign in5_2 = {s2[1],s2[2],s2[3],s2[4],s2[5],s2[6],c2,pp7[4],pp6[6],pp7[6]};
    CLA10 CLA05(s5, c5, in5_1, in5_2);

    /* 6th CLA */
    wire [6:0] s6, in6_1, in6_2;
    wire c6;
    assign in6_1 = {s3[1],s3[2],s3[3],s3[4],s3[5],s3[6],pp7[5]};
    assign in6_2 = {pp6[0],s4[0],s4[1],s4[2],s4[3],c4,c3};
    CLA7 CLA06(s6, c6, in6_1, in6_2);

    /* Final CLA */
    wire [12:0] s, in_1, in_2;
    wire c;
    assign in_1 = {s1[1],s1[2],s5[0],s5[1],s5[2],s5[3],s5[4],s5[5],s5[6],s5[7],s5[8],s5[9],pp7[7]};
    assign in_2 = {pp2[0],s2[0],pp4[0],s3[0],s6[0],s6[1],s6[2],s6[3],s6[4],s6[5],s6[6],c6,c5};
    CLA13 CLA(s, c, in_1, in_2);
    
    assign product[2]  = s[0];
    assign product[3]  = s[1];
    assign product[4]  = s[2];
    assign product[5]  = s[3];
    assign product[6]  = s[4];
    assign product[7]  = s[5];
    assign product[8]  = s[6];
    assign product[9]  = s[7];
    assign product[10] = s[8];
    assign product[11] = s[9];
    assign product[12] = s[10];
    assign product[13] = s[11];
    assign product[14] = s[12];
    assign product[15] = c;
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

module CLA8(output [7:0] sum,
            output cout,
            input [7:0] in1, in2);
  wire [7:0] G; /* Generate */
  wire [7:0] P; /* Propagate */
  wire [7:0] C; /* Carry */

  assign G[0] = in1[7] & in2[7];
  assign G[1] = in1[6] & in2[6]; /*Generate    Gi = Ai * Bi */
  assign G[2] = in1[5] & in2[5];
  assign G[3] = in1[4] & in2[4];
  assign G[4] = in1[3] & in2[3];
  assign G[5] = in1[2] & in2[2];
  assign G[6] = in1[1] & in2[1];
  assign G[7] = in1[0] & in2[0];
  
  assign P[0] = in1[7] ^ in2[7];
  assign P[1] = in1[6] ^ in2[6]; /*Propagate   Pi = Ai + Bi */
  assign P[2] = in1[5] ^ in2[5];
  assign P[3] = in1[4] ^ in2[4];
  assign P[4] = in1[3] ^ in2[3];
  assign P[5] = in1[2] ^ in2[2];
  assign P[6] = in1[1] ^ in2[1];
  assign P[7] = in1[0] ^ in2[0];

  assign C[0] = 0;  /* Carry_out = Ci+1 = Gi + Pi*Ci */
  assign C[1] = G[0] | (P[0] & C[0]);
  assign C[2] = G[1] | (P[1] & C[1]);
  assign C[3] = G[2] | (P[2] & C[2]);
  assign C[4] = G[3] | (P[3] & C[3]);
  assign C[5] = G[4] | (P[4] & C[4]);
  assign C[6] = G[5] | (P[5] & C[5]);
  assign C[7] = G[6] | (P[6] & C[6]);
  assign cout = G[7] | (P[7] & C[7]);
  assign sum = P ^ C;
endmodule

module CLA10(output [9:0] sum,
            output cout,
            input [9:0] in1, in2);
  wire [9:0] G; /* Generate */
  wire [9:0] P; /* Propagate */
  wire [9:0] C; /* Carry */

  assign G[0] = in1[9] & in2[9];
  assign G[1] = in1[8] & in2[8];
  assign G[2] = in1[7] & in2[7];
  assign G[3] = in1[6] & in2[6]; /*Generate    Gi = Ai * Bi */
  assign G[4] = in1[5] & in2[5];
  assign G[5] = in1[4] & in2[4];
  assign G[6] = in1[3] & in2[3];
  assign G[7] = in1[2] & in2[2];
  assign G[8] = in1[1] & in2[1];
  assign G[9] = in1[0] & in2[0];

  assign P[0] = in1[9] ^ in2[9];
  assign P[1] = in1[8] ^ in2[8];
  assign P[2] = in1[7] ^ in2[7];
  assign P[3] = in1[6] ^ in2[6]; /*Propagate   Pi = Ai + Bi */
  assign P[4] = in1[5] ^ in2[5];
  assign P[5] = in1[4] ^ in2[4];
  assign P[6] = in1[3] ^ in2[3];
  assign P[7] = in1[2] ^ in2[2];
  assign P[8] = in1[1] ^ in2[1];
  assign P[9] = in1[0] ^ in2[0];

  assign C[0] = 0;  /* Carry_out = Ci+1 = Gi + Pi*Ci */
  assign C[1] = G[0] | (P[0] & C[0]);
  assign C[2] = G[1] | (P[1] & C[1]);
  assign C[3] = G[2] | (P[2] & C[2]);
  assign C[4] = G[3] | (P[3] & C[3]);
  assign C[5] = G[4] | (P[4] & C[4]);
  assign C[6] = G[5] | (P[5] & C[5]);
  assign C[7] = G[6] | (P[6] & C[6]);
  assign C[8] = G[7] | (P[7] & C[7]);
  assign C[9] = G[8] | (P[8] & C[8]);
  assign cout = G[9] | (P[9] & C[9]);
  assign sum = P ^ C;
endmodule

module CLA4(output [3:0] sum,
            output cout,
            input [3:0] in1, in2);

    wire [3:0] G; /* Generate */
    wire [3:0] P; /* Propagate */
    wire [3:0] C; /* Carry */

    assign G[0] = in1[3] & in2[3]; /*Generate    Gi = Ai * Bi */
    assign G[1] = in1[2] & in2[2];
    assign G[2] = in1[1] & in2[1];
    assign G[3] = in1[0] & in2[0];
    assign P[0] = in1[3] ^ in2[3]; /*Propagate   Pi = Ai + Bi */
    assign P[1] = in1[2] ^ in2[2];
    assign P[2] = in1[1] ^ in2[1];
    assign P[3] = in1[0] ^ in2[0];

    assign C[0] = 0;
    assign C[1] = G[0] | (P[0] & C[0]);
    assign C[2] = G[1] | (P[1] & C[1]);
    assign C[3] = G[2] | (P[2] & C[2]);
    assign cout = G[3] | (P[3] & C[3]);
    assign sum = P ^ C;
endmodule

module CLA13(output [12:0] sum,
            output cout,
            input [12:0] in1, in2);

    wire [12:0] G;
    wire [12:0] P; // Propagate
    wire [12:0] C;

    assign G[0]  = in1[12] & in2[12];
    assign G[1]  = in1[11] & in2[11];
    assign G[2]  = in1[10] & in2[10];
    assign G[3]  = in1[9]  & in2[9];
    assign G[4]  = in1[8]  & in2[8];
    assign G[5]  = in1[7]  & in2[7];
    assign G[6]  = in1[6]  & in2[6];
    assign G[7]  = in1[5]  & in2[5];
    assign G[8]  = in1[4]  & in2[4];
    assign G[9]  = in1[3]  & in2[3];
    assign G[10] = in1[2]  & in2[2];
    assign G[11] = in1[1]  & in2[1];
    assign G[12] = in1[0]  & in2[0];

    assign P[0]  = in1[12] ^ in2[12];
    assign P[1]  = in1[11] ^ in2[11];
    assign P[2]  = in1[10] ^ in2[10];
    assign P[3]  = in1[9]  ^ in2[9];
    assign P[4]  = in1[8]  ^ in2[8];
    assign P[5]  = in1[7]  ^ in2[7];
    assign P[6]  = in1[6]  ^ in2[6];
    assign P[7]  = in1[5]  ^ in2[5];
    assign P[8]  = in1[4]  ^ in2[4];
    assign P[9]  = in1[3]  ^ in2[3];
    assign P[10] = in1[2]  ^ in2[2];
    assign P[11] = in1[1]  ^ in2[1];
    assign P[12] = in1[0]  ^ in2[0];

    assign C[0]  = 0;
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
    assign cout  = G[12] | (P[12] & C[12]);
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
