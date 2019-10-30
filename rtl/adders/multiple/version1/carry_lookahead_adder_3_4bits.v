module carry_lookahead_adder_3_4bits(output [3:0] sum,
                                   output cout_1, cout_2,
                                   input [3:0] in1, in2, in3,
                                   input cin);


  wire [3:0] G, P, C, D;

  assign D = in1 & in2 & in3;
  assign G = (in1 & in2) ^ (in1 & in3) ^ (in2 & in3);

  xor3 XOR1(P[0], in1[0], in2[0], in3[0]);
  xor3 XOR2(P[1], in1[1], in2[1], in3[1]);
  xor3 XOR3(P[2], in1[2], in2[2], in3[2]);
  xor3 XOR4(P[3], in1[3], in2[3], in3[3]);

  assign C[0]   = cin;
  xor2 XOR5(C[1], G[0], P[0] & C[0]);

  assign C[2]   = (G[1] ^ (P[1] & C[1])) | (D[0] & C[0]);
  assign C[3]   = (G[2] ^ (P[2] & C[2])) | (D[1] & C[1]);
  assign cout_1 = (G[3] ^ (P[3] & C[3])) | (D[2] & C[2]);
  assign cout_2 =                           D[3] & C[3];

  assign sum = P ^ C;



endmodule

module carry_lookahead_adder_3_4bits_part1(output [3:0] sum,
                                   output cout_1, cout_2,
                                   input [3:0] in1, in2, in3,
                                   input cin);


  wire [3:0] G, P, C;

  assign G = in1 & in2 & in3;
  assign P = in1 ^ in2 ^ in3;

  assign C[0]   =   cin;
  assign C[1]   =  (in1[0] & in2[0]) ^ (in1[0] & in3[0]) ^ (in2[0] & in3[0]) ^ (in1[0] & C[0]) ^ (in2[0] & C[0]) ^ (in3[0] & C[0]);
  assign C[2]   = ((in1[1] & in2[1]) ^ (in1[1] & in3[1]) ^ (in2[1] & in3[1]) ^ (in1[1] & C[1]) ^ (in2[1] & C[1]) ^ (in3[1] & C[1])) | (G[0] & C[0]); 
  assign C[3]   = ((in1[2] & in2[2]) ^ (in1[2] & in3[2]) ^ (in2[2] & in3[2]) ^ (in1[2] & C[2]) ^ (in2[2] & C[2]) ^ (in3[2] & C[2])) | (G[1] & C[1]);
  assign cout_1 = ((in1[3] & in2[3]) ^ (in1[3] & in3[3]) ^ (in2[3] & in3[3]) ^ (in1[3] & C[3]) ^ (in2[3] & C[3]) ^ (in3[3] & C[3])) | (G[2] & C[2]);
  assign cout_2 =  (G[3] & C[3]);

  assign sum[0] = P[0] ^ C[0];
  assign sum[1] = P[1] ^ C[1];
  assign sum[2] = P[2] ^ C[2];
  assign sum[3] = P[3] ^ C[3];
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
