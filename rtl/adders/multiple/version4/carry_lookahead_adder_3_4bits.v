module carry_lookahead_adder_3_4bits(output [3:0] sum,
                                   output cout_1, cout_2,
                                   input [3:0] in1, in2, in3,
                                   input cin);

  wire [5:0] P, G, C;
  wire [3:0] D, E, F;

  assign C[0] = cin;
  three_bits_P cel1(P[0], in1[0], in2[0], in3[0]);
  three_bits_P cel2(P[1], in1[1], in2[1], in3[1]);
  four_bits_P  cel3(P[2], in1[2], in2[2], in3[2], D[0]);
  four_bits_P  cel4(P[3], in1[3], in2[3], in3[3], D[1]);

  three_bits_G cel5(G[0], in1[0], in2[0], in3[0]);
  three_bits_G cel6(G[1], in1[1], in2[1], in3[1]);
  four_bits_G  cel7(G[2], in1[2], in2[2], in3[2], D[0]);
  four_bits_G  cel8(G[3], in1[3], in2[3], in3[3], D[1]);

  three_bits_E cel10(E[0], in1[0], in2[0], in3[0]);
  three_bits_E cel11(E[1], in1[1], in2[1], in3[1]);
  four_bits_E  cel12(E[2], in1[2], in2[2], in3[2], D[0]);
  four_bits_E  cel13(E[3], in1[3], in2[3], in3[3], D[1]);

  four_bits_F  cel14(F[2], in1[2], in2[2], in3[2], D[0]);
  four_bits_F  cel15(F[3], in1[3], in2[3], in3[3], D[1]);




  assign P[4] = D[2];
  assign P[5] = D[3];


  //assign C[1] = (C[0] & (P[0] ^ G[0])) + (!C[0] & G[0]); 
  get_C cell6(C[1], C[0], P[0] ^ G[0], G[0]);
  get_C cell7(C[2], C[1], P[1] ^ G[1], G[1]);
  get_C cell8(C[3], C[2], P[2] ^ G[2], G[2]);
  get_C cell9(C[4], C[3], P[3] ^ G[3], G[3]);
  and2  AND09(C[5], D[2], C[4]);

  and2 AND10(D[0], C[0], E[0]);
  and2 AND11(D[1], C[1], E[1]);
  assign D[2] = (C[2] & E[2]) | (!C[2] & F[2]);
  assign D[3] = (C[3] & E[3]) | (!C[3] & F[3]);

  xor2 XOR10(sum[0], P[0], C[0]);
  xor2 XOR11(sum[1], P[1], C[1]);
  xor2 XOR12(sum[2], P[2], C[2]);
  xor2 XOR13(sum[3], P[3], C[3]);
  xor2 XOR14(cout_1, P[4], C[4]);
  xor2 XOR15(cout_2, P[5], C[5]);
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
