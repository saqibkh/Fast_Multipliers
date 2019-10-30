module carry_lookahead_adder_3_8bits(output [7:0] sum,
                                   output cout_1, cout_2,
                                   input [7:0] in1, in2, in3,
                                   input cin);

  wire [7:0] s1;
  wire c1;
  CLA_8      CLA_1(s1,  c1,     in1, in2);
  CLA_8      CLA_2(sum, c2,     s1,   in3);
  half_adder HA_01(cout_1, cout_2, c1, c2);
endmodule

module CLA_8(output [7:0] sum, output cout, input [7:0] in1, input [7:0] in2);
  wire[7:0] G;
  wire[7:0] C;
  wire[7:0] P;

  assign G = in1 & in2;
  assign P = in1 ^ in2;

  assign C[0] = 0;  /* Carry_out = Ci+1 = Gi + Pi*Ci */;
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

module CLA_4(output [3:0] sum, output cout, input [3:0] in1, input [3:0] in2);

    wire[3:0] G;
    wire[3:0] C;
    wire[3:0] P;

    assign G = in1 & in2;
    assign P = in1 ^ in2;

    assign C[0] = 0;  /* Carry_out = Ci+1 = Gi + Pi*Ci */;
    assign C[1] = G[0] | (P[0] & C[0]);
    assign C[2] = G[1] | (P[1] & C[1]);
    assign C[3] = G[2] | (P[2] & C[2]);
    assign cout = G[3] | (P[3] & C[3]);
    assign sum = P ^ C;
endmodule

module half_adder(output wire sum,
                  output wire cout,
                  input wire in1,
                  input wire in2);
    xor(sum, in1, in2);
    and(cout, in1, in2);
endmodule
