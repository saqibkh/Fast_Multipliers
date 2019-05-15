// Verilog implementation of a floating point multiplier for single precision
//
// Name: Saqib Khan


module sign_bit(output wire sign, 
                input wire[31:0] in1,
                input wire[31:0] in2);
  xor(sign,in1[31],in2[31]);
endmodule

// 1 bit Full Adder
module full_adder(output wire sum,
                  output wire cout,
                  input wire in1,
                  input wire in2,
                  input wire cin);
  wire temp1;
  wire temp2;
  wire temp3;
  xor(sum, in1, in2, cin);
  and(temp1,in1,in2);
  and(temp2,in1,cin);
  and(temp3,in2,cin);
  or(cout,temp1,temp2,temp3);
endmodule

// 8 bit Ripple-carry adder
module ripple_8(output wire[7:0] sum,
                output wire cout,
                input wire[7:0] in1,
                input wire[7:0] in2,
                input wire cin);
  wire c1,c2,c3,c4,c5,c6,c7;
  full_adder FA1(sum[0],c1,in1[0],in2[0],cin);
  full_adder FA2(sum[1],c2,in1[1],in2[1],c1);
  full_adder FA3(sum[2],c3,in1[2],in2[2],c2);
  full_adder FA4(sum[3],c4,in1[3],in2[3],c3);
  full_adder FA5(sum[4],c5,in1[4],in2[4],c4);
  full_adder FA6(sum[5],c6,in1[5],in2[5],c5);
  full_adder FA7(sum[6],c7,in1[6],in2[6],c6);
  full_adder FA8(sum[7],cout,in1[7],in2[7],c7);
endmodule

// 1 bit subtractor with subtrahend = 1
module full_subtractor_sub1(output wire diff, // difference
                            output wire bout, // borrow out
                            input wire min, // minuend
                            input wire bin); // borrow in
  // Here the subtrahend is always 1
  xnor(diff,min,bin);
  or(bout,~min,bin);
endmodule

// 1 bit subtractor with subtrahend = 0
module full_subtractor_sub0(output wire diff, // difference
                            output wire bout, // borrow out
                            input wire min, //minuend
                            input wire bin); // borrow in
  // Here the subtrahend is always 0
  xnor(diff,min,bin);
  and(bout,~min,bin);
endmodule

// 9 bit subtractor
module subtractor_9(output wire[8:0] diff,
                    output wire bout,
                    input wire[8:0] min,
                    input wire bin);
  wire b1,b2,b3,b4,b5,b6,b7,b8;
  full_subtractor_sub1 sub1(diff[0],b1,min[0],bin);
  full_subtractor_sub1 sub2(diff[1],b2,min[1],b1);
  full_subtractor_sub1 sub3(diff[2],b3,min[2],b2);
  full_subtractor_sub1 sub4(diff[3],b4,min[3],b3);
  full_subtractor_sub1 sub5(diff[4],b5,min[4],b4);
  full_subtractor_sub1 sub6(diff[5],b6,min[5],b5);
  full_subtractor_sub1 sub7(diff[6],b7,min[6],b6);
  full_subtractor_sub0 sub8(diff[7],b8,min[7],b7); // Two most significand subtrahends are 0 in 001111111
  full_subtractor_sub0 sub9(diff[8],bout,min[8],b8);
endmodule

module block(output wire ppo,
             output wire cout,
             output wire mout,
             input wire min,
             input wire ppi,
             input wire q,
             input wire cin);
  wire temp;
  and(temp,min,q);
  full_adder FA(ppo,cout,ppi,temp,cin);
  or(mout,min,1'b0);
endmodule

module row(output wire[23:0] ppo,
           output wire[23:0] mout,
           output wire sum,
           input wire[23:0] min,
           input wire[23:0] ppi,
           input wire q);
  wire c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,c16,c17,c18,c19,c20,c21,c22,c23;
  block b1(sum,c1,mout[0],min[0],ppi[0],q,1'b0);
  block b2(ppo[0],c2,mout[1],min[1],ppi[1],q,c1);
  block b3(ppo[1],c3,mout[2],min[2],ppi[2],q,c2);
  block b4(ppo[2],c4,mout[3],min[3],ppi[3],q,c3);
  block b5(ppo[3],c5,mout[4],min[4],ppi[4],q,c4);
  block b6(ppo[4],c6,mout[5],min[5],ppi[5],q,c5);
  block b7(ppo[5],c7,mout[6],min[6],ppi[6],q,c6);
  block b8(ppo[6],c8,mout[7],min[7],ppi[7],q,c7);
  block b9(ppo[7],c9,mout[8],min[8],ppi[8],q,c8);
  block b10(ppo[8],c10,mout[9],min[9],ppi[9],q,c9);
  block b11(ppo[9],c11,mout[10],min[10],ppi[10],q,c10);
  block b12(ppo[10],c12,mout[11],min[11],ppi[11],q,c11);
  block b13(ppo[11],c13,mout[12],min[12],ppi[12],q,c12);
  block b14(ppo[12],c14,mout[13],min[13],ppi[13],q,c13);
  block b15(ppo[13],c15,mout[14],min[14],ppi[14],q,c14);
  block b16(ppo[14],c16,mout[15],min[15],ppi[15],q,c15);
  block b17(ppo[15],c17,mout[16],min[16],ppi[16],q,c16);
  block b18(ppo[16],c18,mout[17],min[17],ppi[17],q,c17);
  block b19(ppo[17],c19,mout[18],min[18],ppi[18],q,c18);
  block b20(ppo[18],c20,mout[19],min[19],ppi[19],q,c19);
  block b21(ppo[19],c21,mout[20],min[20],ppi[20],q,c20);
  block b22(ppo[20],c22,mout[21],min[21],ppi[21],q,c21);
  block b23(ppo[21],c23,mout[22],min[22],ppi[22],q,c22);
  block b24(ppo[22],ppo[23],mout[23],min[23],ppi[23],q,c23);
endmodule

module product(output wire[47:0] sum,
               input wire[23:0] min,
               input wire[23:0] q);
  wire [23:0] temp1,temp2,temp3,temp4,temp5,temp6,temp7,temp8,temp9,temp10;
  wire [23:0] temp11,temp12,temp13,temp14,temp15,temp16,temp17,temp18,temp19,temp20;
  wire [23:0] temp21,temp22,temp23,temp24;

  wire [23:0] ptemp1,ptemp2,ptemp3,ptemp4,ptemp5,ptemp6,ptemp7,ptemp8,ptemp9,ptemp10;
  wire [23:0] ptemp11,ptemp12,ptemp13,ptemp14,ptemp15,ptemp16,ptemp17,ptemp18,ptemp19,ptemp20;
  wire [23:0] ptemp21,ptemp22,ptemp23,ptemp24;

  row r1 (ptemp1,temp1,sum[0],min,24'h000000,q[0]);
  row r2 (ptemp2,temp2,sum[1],temp1,ptemp1,q[1]);
  row r3 (ptemp3,temp3,sum[2],temp2,ptemp2,q[2]);
  row r4 (ptemp4,temp4,sum[3],temp3,ptemp3,q[3]);
  row r5 (ptemp5,temp5,sum[4],temp4,ptemp4,q[4]);
  row r6 (ptemp6,temp6,sum[5],temp5,ptemp5,q[5]);
  row r7 (ptemp7,temp7,sum[6],temp6,ptemp6,q[6]);
  row r8 (ptemp8,temp8,sum[7],temp7,ptemp7,q[7]);
  row r9 (ptemp9,temp9,sum[8],temp8,ptemp8,q[8]);
  row r10(ptemp10,temp10,sum[9],temp9,ptemp9,q[9]);
  row r11(ptemp11,temp11,sum[10],temp10,ptemp10,q[10]);
  row r12(ptemp12,temp12,sum[11],temp11,ptemp11,q[11]);
  row r13(ptemp13,temp13,sum[12],temp12,ptemp12,q[12]);
  row r14(ptemp14,temp14,sum[13],temp13,ptemp13,q[13]);
  row r15(ptemp15,temp15,sum[14],temp14,ptemp14,q[14]);
  row r16(ptemp16,temp16,sum[15],temp15,ptemp15,q[15]);
  row r17(ptemp17,temp17,sum[16],temp16,ptemp16,q[16]);
  row r18(ptemp18,temp18,sum[17],temp17,ptemp17,q[17]);
  row r19(ptemp19,temp19,sum[18],temp18,ptemp18,q[18]);
  row r20(ptemp20,temp20,sum[19],temp19,ptemp19,q[19]);
  row r21(ptemp21,temp21,sum[20],temp20,ptemp20,q[20]);
  row r22(ptemp22,temp22,sum[21],temp21,ptemp21,q[21]);
  row r23(ptemp23,temp23,sum[22],temp22,ptemp22,q[22]);
  row r24(sum[47:24],temp24,sum[23],temp23,ptemp23,q[23]); 
endmodule

module normalize(output wire[22:0] adj_mantissa,
                 output wire norm_flag,
                 input wire[47:0] prdt);

  and(norm_flag,prdt[47],1'b1); // sel=1 if leading one is at 47 --- needs normalization
  // if sel = 0, leading zero not at 47 ... no need of normalization
  //wire [1:0][22:0] results;
  //assign results[0] = prdt[45:23];
  //assign results[1] = prdt[46:24];
  //assign adj_mantissa = {results[norm_flag+0]};

  wire [22:0] results;
  assign results = prdt[46:24];
  assign adj_mantissa = {results[norm_flag+0]};

endmodule
