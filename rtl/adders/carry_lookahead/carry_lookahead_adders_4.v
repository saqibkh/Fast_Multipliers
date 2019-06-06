/*
 * File: carry_look_ahead_adder_4.v
 * Description: Contains all Carry Look Ahead Adders of different sizes
 * Author: Saqib Khan
 *
 */

///////////////////////////////////////////////////////////////////////
////
//// Module Name: Carry Look Ahead Adder (4-bits)
//// Function: Implements an 4-bit Carry Look Ahead Adder(CLA)
////
///////////////////////////////////////////////////////////////////////
module carry_lookahead_adder_4(output [3:0] sum,
                                output cout,
                                input [3:0] in1, in2,
                                input cin);
  wire [3:0] G; /* Generate */
  wire [3:0] P; /* Propagate */
  wire [3:0] C; /* Carry */

  assign G = in1 & in2; /*Generate    Gi = Ai * Bi */
  assign P = in1 ^ in2; /*Propagate   Pi = Ai + Bi */

  assign C[0] = cin;  /* Carry_out = Ci+1 = Gi + Pi*Ci */
  assign C[1] = G[0] | (P[0] & C[0]);
  assign C[2] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & C[0]);
  assign C[3] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & C[0]);
  assign cout = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) |(P[3] & P[2] & P[1] & P[0] & C[0]);
  assign sum = P ^ C;
endmodule
