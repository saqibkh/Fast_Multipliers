module carry_lookahead_adder_3_8bits(output [7:0] sum,
                                   output cout_1, cout_2,
                                   input [7:0] in1, in2, in3,
                                   input cin);

  wire [7:0] G, P, C, D;

  assign D = in1 & in2 & in3;
  assign G = (in1 & in2) ^ (in1 & in3) ^ (in2 & in3);

  xor3(P[0], in1[0], in2[0], in3[0]);
  xor3(P[1], in1[1], in2[1], in3[1]);
  xor3(P[2], in1[2], in2[2], in3[2]);
  xor3(P[3], in1[3], in2[3], in3[3]);
  xor3(P[4], in1[4], in2[4], in3[4]);
  xor3(P[5], in1[5], in2[5], in3[5]);
  xor3(P[6], in1[6], in2[6], in3[6]);
  xor3(P[7], in1[7], in2[7], in3[7]);

  assign C[0]   = cin;
  xor2 XOR5(C[1], G[0], P[0] & C[0]);

  assign C[2]   = (G[1] ^ (P[1] & C[1])) | (D[0] & C[0]);
  assign C[3]   = (G[2] ^ (P[2] & C[2])) | (D[1] & C[1]);
  assign C[4]   = (G[3] ^ (P[3] & C[3])) | (D[2] & C[2]);
  assign C[5]   = (G[4] ^ (P[4] & C[4])) | (D[3] & C[3]);
  assign C[6]   = (G[5] ^ (P[5] & C[5])) | (D[4] & C[4]);
  assign C[7]   = (G[6] ^ (P[6] & C[6])) | (D[5] & C[5]);
  assign cout_1 = (G[7] ^ (P[7] & C[7])) | (D[6] & C[6]);
  assign cout_2 =                           D[7] & C[7];

  assign sum = P ^ C;



endmodule


module carry_lookahead_adder_3_8bits_part1(output [7:0] sum,
                                   output cout_1, cout_2,
                                   input [7:0] in1, in2, in3,
                                   input cin);


  wire [7:0] G, P, C;

  assign G = in1 & in2 & in3;
  assign P = in1 ^ in2 ^ in3;

  assign C[0]   =   cin;
  assign C[1]   =  (in1[0] & in2[0]) ^ (in1[0] & in3[0]) ^ (in2[0] & in3[0]) ^ (in1[0] & C[0]) ^ (in2[0] & C[0]) ^ (in3[0] & C[0]);
  assign C[2]   = ((in1[1] & in2[1]) ^ (in1[1] & in3[1]) ^ (in2[1] & in3[1]) ^ (in1[1] & C[1]) ^ (in2[1] & C[1]) ^ (in3[1] & C[1])) | (G[0] & C[0]); 
  assign C[3]   = ((in1[2] & in2[2]) ^ (in1[2] & in3[2]) ^ (in2[2] & in3[2]) ^ (in1[2] & C[2]) ^ (in2[2] & C[2]) ^ (in3[2] & C[2])) | (G[1] & C[1]);
  assign C[4]   = ((in1[3] & in2[3]) ^ (in1[3] & in3[3]) ^ (in2[3] & in3[3]) ^ (in1[3] & C[3]) ^ (in2[3] & C[3]) ^ (in3[3] & C[3])) | (G[2] & C[2]);
  assign C[5]   = ((in1[4] & in2[4]) ^ (in1[4] & in3[4]) ^ (in2[4] & in3[4]) ^ (in1[4] & C[4]) ^ (in2[4] & C[4]) ^ (in3[4] & C[4])) | (G[3] & C[3]);
  assign C[6]   = ((in1[5] & in2[5]) ^ (in1[5] & in3[5]) ^ (in2[5] & in3[5]) ^ (in1[5] & C[5]) ^ (in2[5] & C[5]) ^ (in3[5] & C[5])) | (G[4] & C[4]);
  assign C[7]   = ((in1[6] & in2[6]) ^ (in1[6] & in3[6]) ^ (in2[6] & in3[6]) ^ (in1[6] & C[6]) ^ (in2[6] & C[6]) ^ (in3[6] & C[6])) | (G[5] & C[5]);
  assign cout_1 = ((in1[7] & in2[7]) ^ (in1[7] & in3[7]) ^ (in2[7] & in3[7]) ^ (in1[7] & C[7]) ^ (in2[7] & C[7]) ^ (in3[7] & C[7])) | (G[6] & C[6]);
  assign cout_2 =  (G[7] & C[7]);

  assign sum = P ^ C;
endmodule
