module carry_lookahead_adder_3_2bits(output [1:0] sum,
                                   output cout_1, cout_2,
                                   input [1:0] in1, in2, in3,
                                   input cin);


  wire a,b, c,d,e,f,g,h,c1, c2;
  wire i,j,k,l,m,n;
  wire [1:0] C;
  wire [3:0] P;

  xor3 XOR0(P[0], in1[0], in2[0], in3[0]);
  xor3 XOR1(P[1], in1[1], in2[1], in3[1]);
  and4 AND1(P[2],in1[0],in2[0],in3[0],C[0]);
  and4 AND2(P[3],in1[1],in2[1],in3[1],C[1]);

  assign C[0]   = cin;
  assign C[1]   = (C[0] & ((in1[0] ^ in2[0]) | (in1[0] ^ in3[0]))) | (~C[0] & ((in1[0] & in2[0]) | (in1[0] & in3[0]) | (in2[0] & in3[0])));
  //xor2 XOR4(a, in1[0], in2[0]);
  //xor2 XOR5(b, in1[0], in3[0]);
  //and2 AND4(c, in1[0], in2[0]);
  //and2 AND5(d, in1[0], in3[0]);
  //and2 AND6(e, in2[0], in3[0]);
  //or3  OR01(f, c,d,e);
  //and2 AND7(g,C[0], a | b);
  //assign C[1]   = g | (~C[0] & (f));


  assign c1     = (C[1] & ((in1[1] ^ in2[1]) | (in1[1] ^ in3[1]))) | (~C[1] & ((in1[1] & in2[1]) | (in1[1] & in3[1]) | (in2[1] & in3[1])));
  //xor2   XOR6(h, in1[1], in2[1]);
  //xor2   XOR7(i, in1[1], in3[1]);
  //and2   AND8(j, in1[1], in2[1]);
  //and2   AND9(k, in1[1], in3[1]);
  //and2  AND10(l, in2[1], in3[1]);
  //or3    OR02(m, j,k,l);
  //and2  AND11(n,C[1], h | i);
  //assign c1   = n | (~C[1] & (m));


  and2 AND12(c2, P[2], c1);

  assign sum[0] = P[0] ^ C[0];
  assign sum[1] = P[1] ^ C[1];
  assign cout_1 = P[2] ^ c1;
  xor XOR10(cout_2,P[3],c2);
endmodule


module carry_lookahead_adder_3_2bits_part3(output [1:0] sum,
                                   output cout_1, cout_2,
                                   input [1:0] in1, in2, in3,
                                   input cin);


  /* This implementation is wrong */
  wire c1, c2;
  wire [3:0] P;
  wire [1:0] C, G, D;

  assign D = in1 & in2 & in3;

  assign G[0] = (in1[0] & in2[0]) ^ (in1[0] & in3[0]) ^ (in2[0] & in3[0]);
  assign G[1] = (in1[1] & in2[1]) ^ (in1[1] & in3[1]) ^ (in2[1] & in3[1]);
  
  xor3 XOR0(P[0], in1[0], in2[0], in3[0]); //assign P[0] = in1[0] ^ in2[0] ^ in3[0];
  xor3 XOR1(P[1], in1[1], in2[1], in3[1]); //assign P[1] = in1[1] ^ in2[1] ^ in3[1];
  assign P[2] = D[0] & C[0];
  assign P[3] = D[1] & C[1];
  

  assign C[0] = cin;
  xor2 XOR3(C[1], G[0], P[0] & C[0]); //assign C[1] = G[0] ^ (P[0] & C[0]);
  xor2 XOR4(c1, G[1], P[1] & C[1]); //assign c1   = G[1] ^ (P[1] & C[1]);
  
  //xor2 XOR3(c2, G[2], P[2] & C[0]); 
  //assign c2   = G[2] ^ (P[2] & c1);
  assign c2   = P[2] & c1;  

  assign sum[0] = P[0] ^ C[0];
  assign sum[1] = P[1] ^ C[1];
  assign cout_1 = P[2] ^ c1;
  assign cout_2 = P[3] ^ c2;

endmodule

module carry_lookahead_adder_3_2bits_part2(output [1:0] sum,
                                   output cout_1, cout_2,
                                   input [1:0] in1, in2, in3,
                                   input cin);

  wire a,b,c,d,e,f,g;
  wire [1:0] G, P, C, D;

  assign D = in1 & in2 & in3;
  //and3 AND1(D[0], in1[0], in2[0], in3[0]);
  //and3 AND2(D[1], in1[1], in2[1], in3[1]);

  assign G = (in1 & in2) ^ (in1 & in3) ^ (in2 & in3);

  //assign P = in1 ^ in2 ^ in3;
  xor3 XOR1(P[0], in1[0], in2[0], in3[0]);
  xor3 XOR2(P[1], in1[1], in2[1], in3[1]);

  assign C[0]   = cin;

  //assign C[1]   = G[0] ^ (P[0] & C[0]);
  //and2 AND3(a, P[0], C[0]);
  xor2 XOR3(C[1], G[0], P[0] & C[0]);
  //assign C[1] = (C[0] & (G[0] ^ P[0])) | (!C[0] & G[0]);
  //xor2 XOR3(a, G[0], P[0]);
  //and2 AND4(b, C[0], a);
  //and2 AND5(c, !C[0], G[0]);
  //or2  OR01(C[1], b, c);



  assign cout_1 = (G[1] ^ (P[1] & C[1])) | (D[0] & C[0]);
  //and2 AND4(b, P[1], C[1]);
  //and2 AND5(c, D[0], C[0]);
  //xor2 XOR4(d, G[1], b);
  //or2   OR1(cout_1, c, d);


  assign cout_2 = D[1] & C[1];

  //assign sum = P ^ C;
  assign sum = P ^ C;
  //xor2 XOR10(sum[0], P[0], C[0]);
  //xor2 XOR11(sum[1], P[1], C[1]);
endmodule

module carry_lookahead_adder_3_2bits_part1(output [1:0] sum,
                                   output cout_1, cout_2,
                                   input [1:0] in1, in2, in3,
                                   input cin);


  wire a,b,c,d,e,f,g,h,i,j,k,l,m,n;

  wire [1:0] G, P, C;

  and AND1(G[0], in1[0], in2[0], in3[0]);
  and AND2(G[1], in1[1], in2[1], in3[1]);
 
  xor XOR1(P[0], in1[0], in2[0], in3[0]);
  xor XOR2(P[1], in1[1], in2[1], in3[1]);

  assign C[0]   = cin;
  
  //assign C[1]   = ((in1[0] & in2[0]) ^ (in1[0] & in3[0]) ^ (in2[0] & in3[0])) ^ ((in1[0] & C[0]) ^ (in2[0] & C[0]) ^ (in3[0] & C[0]));
  and2 AND3(a, in1[0], in2[0]);
  and2 AND4(b, in1[0], in3[0]);
  and2 AND5(c, in2[0], in3[0]);
  and2 AND6(d, in1[0], C[0]);
  and2 AND7(e, in2[0], C[0]);
  and2 AND8(f, in3[0], C[0]);
  xor6 XOR3(C[1], a, b, c, d, e, f);


  assign cout_1 = ((in1[1] & in2[1]) ^ (in1[1] & in3[1]) ^ (in2[1] & in3[1]) ^ (in1[1] & C[1]) ^ (in2[1] & C[1]) ^ (in3[1] & C[1])) | (G[0] & C[0]); 
  //and2 AND09(g, in1[1], in2[1]);
  //and2 AND10(h, in1[1], in3[1]);
  //and2 AND11(i, in2[1], in3[1]);
  //and2 AND12(j, in1[1], C[1]);
  //and2 AND13(k, in2[1], C[1]);
  //and2 AND14(l, in3[1], C[1]);
  //and2 AND15(m, G[0],   C[0]);
  //xor XOR4( n, g,h,i,j,k,l);
  //or2  OR1(cout_1, n,m);


  //assign cout_2 = G[1] & C[1];
  and AND16(cout_2, G[1], C[1]);

  assign sum = P ^ C;
  //xor XOR10(sum[0], P[0], C[0]);
  //xor XOR11(sum[1], P[1], C[1]);
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

module or3(output wire z,
           input wire w,
           input wire x,
           input wire y);
  assign z = w | x | y;
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

module and4(output wire z,
           input wire v,
           input wire w,
           input wire x,
           input wire y);
  assign z = v & w & x & y;
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

module xor6(output wire z,
           input wire t,
           input wire u,
           input wire v,
           input wire w,
           input wire x,
           input wire y);
  assign z = t ^ u ^ v ^ w ^ x ^ y;
endmodule
