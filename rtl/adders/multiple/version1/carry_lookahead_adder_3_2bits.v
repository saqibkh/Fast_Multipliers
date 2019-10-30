module carry_lookahead_adder_3_2bits(output [1:0] sum,
                                   output cout_1, cout_2,
                                   input [1:0] in1, in2, in3,
                                   input cin);


  wire [1:0] G, P, C;

  assign G = in1 & in2 & in3;
  assign P = in1 ^ in2 ^ in3;

  assign C[0]   = cin;
  assign C[1]   = (in1[0] & in2[0]) ^ (in1[0] & in3[0]) ^ (in2[0] & in3[0]) ^ (in1[0] & C[0]) ^ (in2[0] & C[0]) ^ (in3[0] & C[0]);
  assign cout_1 = ((in1[1] & in2[1]) ^ (in1[1] & in3[1]) ^ (in2[1] & in3[1]) ^ (in1[1] & C[1]) ^ (in2[1] & C[1]) ^ (in3[1] & C[1])) | (G[0] & C[0]); 
  assign cout_2 = G[1] & C[1];

  assign sum[0] = P[0] ^ C[0];
  assign sum[1] = P[1] ^ C[1];
endmodule
