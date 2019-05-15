/*
 * File: carry_look_ahead_adder.v
 * Description: Contains all Carry Look Ahead Adders of different sizes
 * Author: Saqib Khan
 *
 */


///////////////////////////////////////////////////////////////////////
//
// Module Name: Carry Look Ahead Adder (4-bits)
// Function: Implements an 4-bit Carry Look Ahead Adder(CLA)
//
///////////////////////////////////////////////////////////////////////
module carry_look_ahead_adder_4(output [3:0] sum,
                                output cout,
                                input [3:0] in1, in2,
                                input cin);

wire [3:0] G; // Generate
wire [3:0] P; // Propagate
wire [3:0] C; // Carry

assign G = in1 & in2; //Generate
assign P = in1 ^ in2; //Propagate

assign C[0] = cin;
assign C[1] = G[0] | (P[0] & C[0]);
assign C[2] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & C[0]);
assign C[3] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & C[0]);
assign cout = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) |(P[3] & P[2] & P[1] & P[0] & C[0]);
assign sum = P ^ C;
endmodule


///////////////////////////////////////////////////////////////////////
//
// Module Name: Carry Look Ahead Adder (8-bits)
// Function: Implements an 8-bit Carry Look Ahead Adder(CLA)
//
///////////////////////////////////////////////////////////////////////
module carry_look_ahead_adder_8(output [7:0] sum,
                                output cout,
                                input [7:0] in1, in2,
                                input cin);

wire [7:0] G; // Generate
wire [7:0] P; // Propagate
wire [7:0] C; // Carry

assign G = in1 & in2; //Generate
assign P = in1 ^ in2; //Propagate

assign C[0] = cin;
assign C[1] = G[0] | (P[0] & C[0]);
assign C[2] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & C[0]);
assign C[3] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & C[0]);
assign c[4] = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) |(P[3] & P[2] & P[1] & P[0] & C[0]);
assign c[4] = G[4] | (P[4] & G[3]) | (P[4] & P[4] & G[1]) | (P[3] & P[2] & P[1] & G[0]) |(P[3] & P[2] & P[1] & P[0] & C[0]);


assign sum = P ^ C;
endmodule
