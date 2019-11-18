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

  xor2 XOR24(cout_1, P[4], C[4]);
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

  assign sum = (a ^ b ^ c) ^ cin;
  assign c1  = (a & b) ^ (a & c) ^ (a & cin) ^ (b & c) ^ (b & cin) ^ (c & cin);
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

  assign sum = (a ^ b ^ c ^ d) ^ cin;
  assign c1  = (a & b) ^ (a & c) ^ (a & d) ^ (a & cin) ^ (b & c) ^ (b & d) ^ (b & cin) ^ (c & d) ^ (c & cin) ^ (d & cin);
  assign c2  = (a & b & c & d) ^ (a & b & c & cin) ^ (a & b & d & cin) ^ (a & c & d & cin) ^ (b & c & d & cin);
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
