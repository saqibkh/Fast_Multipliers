module carry_lookahead_adder_3_4bits(output [3:0] sum,
                                   output cout_1, cout_2,
                                   input [3:0] in1, in2, in3,
                                   input cin);

  /*
   * Area: 264.685196
   * Power: 0.1007
   * Timing: 0.74ns
   */

  wire a,b,c,d,e,f,g,h,i,j,k,l,m,n,o;

  wire [5:0] P, C;
  wire [3:0] D;

  xor3 XOR1(P[0], in1[0], in2[0], in3[0]);
  xor3 XOR2(P[1], in1[1], in2[1], in3[1]);
  xor4 XOR3(P[2], in1[2], in2[2], in3[2], D[0]);
  xor4 XOR4(P[3], in1[3], in2[3], in3[3], D[1]);
  assign P[4] =  D[2];
  assign P[5] =  D[3];

  and AND1(D[0], in1[0], in2[0], in3[0], C[0]);
  and AND2(D[1], in1[1], in2[1], in3[1], C[1]);

  assign D[2] = (in1[2] & in2[2] & in3[2] & D[0]) ^ (in1[2] & in2[2] & in3[2] & C[2]) ^ (in1[2] & in2[2] & D[0] & C[2]) ^ (in1[2] & in3[2] & D[0] & C[2]) ^ (in2[2] & in3[2] & D[0] & C[2]);
  assign D[3] = (in1[3] & in2[3] & in3[3] & D[1]) ^ (in1[3] & in2[3] & in3[3] & C[3]) ^ (in1[3] & in2[3] & D[1] & C[3]) ^ (in1[3] & in3[3] & D[1] & C[3]) ^ (in2[3] & in3[3] & D[1] & C[3]);


  assign C[0]   = cin;
  assign C[1]   = (in1[0] & in2[0]) ^ (in1[0] & in3[0]) ^ (in1[0] & C[0]) ^ (in2[0] & in3[0]) ^ (in2[0] & C[0])   ^ (in3[0] & C[0]);
  //xor2 XOR6(a, in1[0] & in2[0], in1[0] & in3[0]);
  //xor2 XOR7(b, in1[0] & C[0], in2[0] & in3[0]);
  //xor2 XOR8(c, in2[0] & C[0], in3[0] & C[0]);
  //xor3 XOR9(C[1], a, b, c);
  


  //assign C[2]   = (in1[1] & in2[1]) ^ (in1[1] & in3[1]) ^ (in1[1] & C[1]) ^ (in2[1] & in3[1]) ^ (in2[1] & C[1])   ^ (in3[1] & C[1]);
  //xor2 XOR10(d, in1[1] & in2[1], in1[1] & in3[1]);
  //xor2 XOR11(e, in1[1] & C[1], in2[1] & in3[1]);
  //xor2 XOR12(f, in2[1] & C[1], in3[1] & C[1]);
  //xor3 XOR13(C[2], d, e, f); 
  assign C[2] = (C[1] & (in1[1] ^ in2[1] ^ in3[1] ^ (in1[1] & in2[1]) ^ (in1[1] & in3[1]) ^ (in2[1] & in3[1]))) + (~C[1] & ((in1[1] & in2[1]) ^ (in1[1] & in3[1]) ^ (in2[1] & in3[1])));


  //assign C[3]   = (in1[2] & in2[2]) ^ (in1[2] & in3[2]) ^ (in1[2] & C[2]) ^ (in1[2] & D[0])   ^ (in2[2] & in3[2]) ^ (in2[2] & C[2]) ^ (in2[2] & D[0]) ^ (in3[2] & C[2]) ^ (in3[2] & D[0]) ^ (C[2] & D[0]);
  assign C[3]   = (C[2] & (in1[2] ^ in2[2] ^ in3[2] ^ D[0] ^ (in1[2] & in2[2]) ^ (in1[2] & in3[2]) ^ (in1[2] & D[0]) ^ (in2[2] & in3[2]) ^ (in2[2] & D[0]) ^ (in3[2] & D[0]))) + (~C[2] & ((in1[2] & in2[2]) ^ (in1[2] & in3[2]) ^  (in1[2] & D[0]) ^ (in2[2] & in3[2]) ^ (in2[2] & D[0]) ^ (in3[2] & D[0])));



  //assign C[4]   = (in1[3] & in2[3]) ^ (in1[3] & in3[3]) ^ (in1[3] & C[3]) ^ (in1[3] & D[1])   ^ (in2[3] & in3[3]) ^ (in2[3] & C[3]) ^ (in2[3] & D[1]) ^ (in3[3] & C[3]) ^ (in3[3] & D[1]) ^ (C[3] & D[2]);
  assign C[4]   = (C[3] & (in1[3] ^ in2[3] ^ in3[3] ^ D[1] ^ (in1[3] & in2[3]) ^ (in1[3] & in3[3]) ^ (in1[3] & D[1]) ^ (in2[3] & in3[3]) ^ (in2[3] & D[1]) ^ (in3[3] & D[1]))) + (~C[3] & ((in1[3] & in2[3]) ^ (in1[3] & in3[3]) ^  (in1[3] & D[1]) ^ (in2[3] & in3[3]) ^ (in2[3] & D[1]) ^ (in3[3] & D[1])));

  assign C[5]   = D[2] & C[4];

  xor2 XOR20(sum[0], P[0], C[0]);
  xor2 XOR21(sum[1], P[1], C[1]);
  xor2 XOR22(sum[2], P[2], C[2]);
  xor2 XOR23(sum[3], P[3], C[3]);
  xor2 XOR24(cout_1, P[4], C[4]);
  or XOR25(cout_2, P[5], C[5]);
endmodule

module carry_lookahead_adder_3_4bits_part3(output [3:0] sum,
                                   output cout_1, cout_2,
                                   input [3:0] in1, in2, in3,
                                   input cin);


  wire c1, c2;
  wire [5:0] P;
  wire [3:0] C, G, D;

  assign D[0] = in1[0] & in2[0] & in3[0] & C[0];
  assign D[1] = in1[1] & in2[1] & in3[1] & C[1];
  assign D[2] = in1[2] & in2[2] & in3[2];
  assign D[3] = in1[3] & in2[3] & in3[3];
  

  assign G[0] = (in1[0] & in2[0]) ^ (in1[0] & in3[0]) ^ (in2[0] & in3[0]);
  assign G[1] = (in1[1] & in2[1]) ^ (in1[1] & in3[1]) ^ (in2[1] & in3[1]);
  assign G[2] = (in1[2] & in2[2]) ^ (in1[2] & in3[2]) ^ (in2[2] & in3[2]) ^ (in1[2] & (D[0] & C[0])) ^ (in2[2] & (D[0] & C[0])) ^ (in3[2] & (D[0] & C[0]));
  assign G[3] = (in1[3] & in2[3]) ^ (in1[3] & in3[3]) ^ (in2[3] & in3[3]) ^ (in1[3] & (D[1] & C[1])) ^ (in2[3] & (D[1] & C[1])) ^ (in3[3] & (D[1] & C[1]));

  xor3 XOR0(P[0], in1[0], in2[0], in3[0]); //assign P[0] = in1[0] ^ in2[0] ^ in3[0];
  xor3 XOR1(P[1], in1[1], in2[1], in3[1]); //assign P[1] = in1[1] ^ in2[1] ^ in3[1];
  xor4 XOR2(P[2], in1[2], in2[2], in3[2], D[0]);
  xor4 XOR3(P[3], in1[3], in2[3], in3[3], D[1]);

  assign P[4] = D[2] & C[2];
  assign P[5] = D[3] & C[3];
  
  assign C[0] = cin;
  xor2 XOR5(C[1], G[0], P[0] & C[0]); //assign C[1] = G[0] ^ (P[0] & C[0]);
  xor2 XOR6(C[2], G[1], P[1] & C[1]); //assign c1   = G[1] ^ (P[1] & C[1]);
  xor2 XOR7(C[3], G[2], P[2] & C[2]);
  xor2 XOR8(c1,   G[3], P[3] & C[3]);
  assign c2   = P[4] & c1;

  assign sum[0] = P[0] ^ C[0];
  assign sum[1] = P[1] ^ C[1];
  assign sum[2] = P[2] ^ C[2];
  assign sum[3] = P[3] ^ C[3];
  assign cout_1 = P[4] ^ c1;
  assign cout_2 = P[5] ^ c2;
endmodule


module carry_lookahead_adder_3_4bits_part2(output [3:0] sum,
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

module time_cal(output wire z,
           input wire x);
  assign z = x;
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
