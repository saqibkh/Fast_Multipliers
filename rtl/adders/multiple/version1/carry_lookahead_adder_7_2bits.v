module carry_lookahead_adder_7_2bits(output [1:0] sum,
                                   output cout_1, cout_2,
                                   input [1:0] in1, in2, in3, in4, in5, in6, in7,
                                   input cin);

  Note Complete

  wire c1, c2;
  wire [3:0] G, P, C, D;

  assign D = (in1 & in2 & in3) ^ (in1 & in2 & in4) ^ (in1 & in2 & in5) ^ (in1 & in2 & in6) ^ (in1 & in2 & in7) ^ (in1 & in3 & in4) ^ (in1 & in3 & in5) ^ (in1 & in3 & in6) ^ (in1 & in3 & in7) ^ (in1 & in4 & in5) ^ (in1 & in4 & in6) ^ (in1 & in4 & in7) ^ (in1 & in5 & in6) ^  (in1 & in5 & in7) ^(in1 & in6 & in7); 

  assign G[0] = (in1[0] & in2[0]) ^ (in1[0] & in3[0]) ^ (in1[0] & in4[0]) ^ (in1[0] & in5[0]) ^ (in1[0] & in6[0]) ^ (in1[0] & in7[0]) ^ (in2[0] & in3[0]) ^ (in2[0] & in4[0]) ^ (in2[0] & in5[0]) ^ (in2[0] & in6[0]) ^ (in2[0] & in7[0]) ^ (in3[0] & in4[0]) ^ (in3[0] & in5[0]) ^ (in3[0] & in6[0]) ^ (in3[0] & in7[0]) ^ (in4[0] & in5[0]) ^ (in4[0] & in6[0]) ^ (in4[0] & in7[0]) ^ (in5[0] & in6[0]) ^ (in5[0] & in7[0]) ^ (in6[0] & in7[0]);
  assign G[1] = (in1[1] & in2[1]) ^ (in1[1] & in3[1]) ^ (in1[1] & in4[1]) ^ (in1[1] & in5[1]) ^ (in1[1] & in6[1]) ^ (in1[1] & in7[1]) ^ (in2[1] & in3[1]) ^ (in2[1] & in4[1]) ^ (in2[1] & in5[1]) ^ (in2[1] & in6[1]) ^ (in2[1] & in7[1]) ^ (in3[1] & in4[1]) ^ (in3[1] & in5[1]) ^ (in3[1] & in6[1]) ^ (in3[1] & in7[1]) ^ (in4[1] & in5[1]) ^ (in4[1] & in6[1]) ^ (in4[1] & in7[1]) ^ (in5[1] & in6[1]) ^ (in5[1] & in7[1]) ^ (in6[1] & in7[1]);
  assign G[2] = 0;
  assign G[3] = 0;
  
  xor7 XOR0(P[0], in1[0], in2[0], in3[0], in4[0], in5[0], in6[0], in7[0]);
  xor7 XOR1(P[1], in1[1], in2[1], in3[1], in4[1], in5[1], in6[1], in7[1]);
  assign P[2] = D[0] & C[0];
  assign P[3] = D[1] & C[1];
  

  assign C[0] = cin;
  xor2 XOR3(C[1], G[0], P[0] & C[0]);
  xor2 XOR4(c1, G[1], P[1] & C[1]);
  assign c2   = P[2] & c1;  

  assign sum[0] = P[0] ^ C[0];
  assign sum[1] = P[1] ^ C[1];
  assign cout_1 = P[2] ^ c1;
  assign cout_2 = P[3] ^ c2;
endmodule

module xor2(output wire z,
           input wire x,
           input wire y);
  assign z = x ^ y;
endmodule

module xor7(output wire z,
           input wire p,
           input wire q,
           input wire u,
           input wire v,
           input wire w,
           input wire x,
           input wire y);
  assign z = p ^ q ^ u ^ v ^ w ^ x ^ y;
endmodule
