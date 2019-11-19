module carry_lookahead_adder_3_4bits(output [3:0] sum,
                                   output cout_1, cout_2,
                                   input [3:0] in1, in2, in3,
                                   input cin);

  wire [5:0] P, C;
  wire [3:0] D;

  assign C[0] = cin;
  three_bits cel1(sum[0], C[1], D[0], in1[0], in2[0], in3[0], C[0]);
  three_bits cel2(sum[1], C[2], D[1], in1[1], in2[1], in3[1], C[1]);
  four_bits  cel3(sum[2], C[3], D[2], in1[2], in2[2], in3[2], D[0], C[2]);
  four_bits  cel4(sum[3], C[4], D[3], in1[3], in2[3], in3[3], D[1], C[3]);

  assign P[4] =  D[2]; assign C[5]   = D[2] & C[4];
  assign P[5] =  D[3];    

  xor XOR24(cout_1, P[4], C[4]);
  or XOR25(cout_2, P[5], C[5]);

endmodule

module one_bit(output sum,
               output c1,
               input a,
               input cin);

  assign sum = a ^ cin;
  assign c1  = a & cin;
endmodule

module two_bit(output sum,
               output c1,
               input a,
               input b,
               input cin);

  assign sum = (a ^ b) ^ cin;
  assign c1  = (a & b) ^ (a & cin) ^ (b & cin);
endmodule

module three_bits(output sum,
               output c1,
               output c2,
               input a,
               input b,
               input c,
               input cin);

  wire P, G;

  assign P = a ^ b ^ c;
  assign G = (a & b) ^ (a & c) ^ (b & c);

  assign sum = P ^ cin;
  assign c1  = (cin & (P ^ G)) | (!cin & G);
  assign c2  = (a & b & c) & cin;
endmodule

module four_bits(output sum,
               output c1,
               output c2,
               input a,
               input b,
               input c,
               input d,
               input cin);

  wire e, f, g, h ,i, j, k, l, m, n, o;
  wire P, G, D;

  assign P = (a ^ b ^ c) ^ d;
  //xor XOR1(P, a, b, c, d);

  assign G = (a & b) ^ (a & c) ^ (a & d) ^ (b & c) ^ (b & d) ^ (c & d);
  //and AND3(h, a, b);
  //and AND4(i, a, c);
  //and AND5(j, a, d);
  //and AND6(k, b, c);
  //and AND7(l, b, d);
  //and AND8(m, c, d);
  //xor XOR3(G, h, i, j, k, l, m);

  assign D = a & b & c & d;


  assign sum = P ^ cin;
  assign c1 = (cin & (P ^ G)) + (!cin & (G));
  //xor XOR2(e, P, G);
  //and AND1(f, cin, e);
  //and AND2(g, !cin, G);
  //or  OR1(c1, f, g);



  assign c2  = (a & b & c & d) ^ (a & b & c & cin) ^ (a & b & d & cin) ^ (a & c & d & cin) ^ (b & c & d & cin);
  //assign c2  = (cin & ((a & b & c) ^ (a & b & d) ^ (a & c & d) ^ (b & c & d) ^ D)) | (!cin & (D));

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
