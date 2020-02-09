module carry_lookahead_adder_3_8bits(output [7:0] sum,
                                   output cout_1, cout_2,
                                   input [7:0] in1, in2, in3,
                                   input cin);

  wire [9:0] P, G, C;
  wire [7:0] D, E, F;

  assign C[0] = cin;
  three_bits_P cel_1(P[0], in1[0], in2[0], in3[0]);
  three_bits_P cel_2(P[1], in1[1], in2[1], in3[1]);
  four_bits_P  cel_3(P[2], in1[2], in2[2], in3[2], D[0]);
  four_bits_P  cel_4(P[3], in1[3], in2[3], in3[3], D[1]);
  four_bits_P  cel_5(P[4], in1[4], in2[4], in3[4], D[2]);
  four_bits_P  cel_6(P[5], in1[5], in2[5], in3[5], D[3]);
  four_bits_P  cel_7(P[6], in1[6], in2[6], in3[6], D[4]);
  four_bits_P  cel_8(P[7], in1[7], in2[7], in3[7], D[5]);

  three_bits_G cel_11(G[0], in1[0], in2[0], in3[0]);
  three_bits_G cel_12(G[1], in1[1], in2[1], in3[1]);
  four_bits_G  cel_13(G[2], in1[2], in2[2], in3[2], D[0]);
  four_bits_G  cel_14(G[3], in1[3], in2[3], in3[3], D[1]);
  four_bits_G  cel_15(G[4], in1[4], in2[4], in3[4], D[2]);
  four_bits_G  cel_16(G[5], in1[5], in2[5], in3[5], D[3]);
  four_bits_G  cel_17(G[6], in1[6], in2[6], in3[6], D[4]);
  four_bits_G  cel_18(G[7], in1[7], in2[7], in3[7], D[5]);
 
  three_bits_E cel_21(E[0], in1[0], in2[0], in3[0]);
  three_bits_E cel_22(E[1], in1[1], in2[1], in3[1]);
  four_bits_E  cel_23(E[2], in1[2], in2[2], in3[2], D[0]);
  four_bits_E  cel_24(E[3], in1[3], in2[3], in3[3], D[1]);
  four_bits_E  cel_25(E[4], in1[4], in2[4], in3[4], D[2]);
  four_bits_E  cel_26(E[5], in1[5], in2[5], in3[5], D[3]);
  four_bits_E  cel_27(E[6], in1[6], in2[6], in3[6], D[4]);
  four_bits_E  cel_28(E[7], in1[7], in2[7], in3[7], D[5]);


  four_bits_F  cel_33(F[2], in1[2], in2[2], in3[2], D[0]);
  four_bits_F  cel_34(F[3], in1[3], in2[3], in3[3], D[1]);
  four_bits_F  cel_35(F[4], in1[4], in2[4], in3[4], D[2]);
  four_bits_F  cel_36(F[5], in1[5], in2[5], in3[5], D[3]);
  four_bits_F  cel_37(F[6], in1[6], in2[6], in3[6], D[4]);
  four_bits_F  cel_38(F[7], in1[7], in2[7], in3[7], D[5]);


  assign P[8] = D[6];
  assign P[9] = D[7];


  //assign C[1] = (C[0] & (P[0] ^ G[0])) + (!C[0] & G[0]); 
  get_C cel_40(C[1], C[0], P[0] ^ G[0], G[0]);
  get_C cel_41(C[2], C[1], P[1] ^ G[1], G[1]);
  get_C cel_42(C[3], C[2], P[2] ^ G[2], G[2]);
  get_C cel_43(C[4], C[3], P[3] ^ G[3], G[3]);
  get_C cel_44(C[5], C[4], P[4] ^ G[4], G[4]);
  get_C cel_45(C[6], C[5], P[5] ^ G[5], G[5]);
  get_C cel_46(C[7], C[6], P[6] ^ G[6], G[6]);
  get_C cel_47(C[8], C[7], P[7] ^ G[7], G[7]);
  and2  AND09(C[9], D[6], C[8]);

  and2 AND10(D[0], C[0], E[0]);
  and2 AND11(D[1], C[1], E[1]);
  assign D[2] = (C[2] & E[2]) | (!C[2] & F[2]);
  assign D[3] = (C[3] & E[3]) | (!C[3] & F[3]);
  assign D[4] = (C[4] & E[4]) | (!C[4] & F[4]);
  assign D[5] = (C[5] & E[5]) | (!C[5] & F[5]);
  assign D[6] = (C[6] & E[6]) | (!C[6] & F[6]);
  assign D[7] = (C[7] & E[7]) | (!C[7] & F[7]);

  xor2 XOR10(sum[0], P[0], C[0]);
  xor2 XOR11(sum[1], P[1], C[1]);
  xor2 XOR12(sum[2], P[2], C[2]);
  xor2 XOR13(sum[3], P[3], C[3]);
  xor2 XOR14(sum[4], P[4], C[4]);
  xor2 XOR15(sum[5], P[5], C[5]);
  xor2 XOR16(sum[6], P[6], C[6]);
  xor2 XOR17(sum[7], P[7], C[7]);
  xor2 XOR18(cout_1, P[8], C[8]);
  xor2 XOR19(cout_2, P[9], C[9]);
endmodule

module get_C(output cout,
             input cin,
             input P,
             input G);

  assign cout = (cin & (P)) + (!cin & G);
endmodule

module three_bits_P(output P,
                    input a,
                    input b,
                    input c);

  assign P = a ^ b ^ c;
endmodule

module three_bits_G(output G,
                    input a,
                    input b,
                    input c);
  assign G = (a & b) ^ (a & c) ^ (b & c);
endmodule

module three_bits_E(output E,
                    input a,
                    input b,
                    input c);
  assign E = a & b & c;
endmodule

module four_bits_P(output P,
               input a,
               input b,
               input c,
               input d);

  assign P = a ^ b ^ c ^ d;
endmodule

module four_bits_G(output G,
               input a,
               input b,
               input c,
               input d);
  assign G = (a & b) ^ (a & c) ^ (a & d) ^ (b & c) ^ (b & d) ^ (c & d);
endmodule

module four_bits_F(output F,
               input a,
               input b,
               input c,
               input d);
  assign F = a & b & c & d;
endmodule

module four_bits_E(output E,
               input a,
               input b,
               input c,
               input d);
  assign E = (a & b & c) ^ (a & b & d) ^ (a & c & d) ^ (b & c & d) ^ (a & b & c & d);
endmodule

module and2(output wire z,
           input wire x,
           input wire y);
  assign z = x & y;
endmodule

module or2(output wire z,
           input wire x,
           input wire y);
  assign z = x | y;
endmodule

module xor2(output wire z,
           input wire x,
           input wire y);
  assign z = x ^ y;
endmodule

module and3(output wire z,
           input wire w,
           input wire x,
           input wire y);
  assign z = w & x & y;
endmodule

module xor3(output wire z,
           input wire w,
           input wire x,
           input wire y);
  assign z = w ^ x ^ y;
endmodule

module xor4(output wire z,
           input wire v,
           input wire w,
           input wire x,
           input wire y);
  assign z = v ^ w ^ x ^ y;
endmodule

module xor5(output wire z,
           input wire u,
           input wire v,
           input wire w,
           input wire x,
           input wire y);
  assign z = u ^ v ^ w ^ x ^ y;
endmodule

module xor6(output wire z,
           input wire t,
           input wire u,
           input wire v,
           input wire w,
           input wire x,
           input wire y);
  assign z = t ^ u ^ v ^ w ^ x ^ y;
endmodule
