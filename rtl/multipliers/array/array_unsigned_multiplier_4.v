module array_unsigned_multiplier_4(output wire [7:0] product,
                          input wire [3:0] A, B);

  wire c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10;
  wire s1,s2,s3,s5,s6,s7;
  wire [3:0] a0b, a1b, a2b, a3b;

  /* Generate all dot products of A x B */
  and AND1(a0b[0], A[0], B[0]);
  and AND2(a0b[1], A[0], B[1]);
  and AND3(a0b[2], A[0], B[2]);
  and AND4(a0b[3], A[0], B[3]);
  and AND5(a1b[0], A[1], B[0]);
  and AND6(a1b[1], A[1], B[1]);
  and AND7(a1b[2], A[1], B[2]);
  and AND8(a1b[3], A[1], B[3]);
  and AND9(a2b[0], A[2], B[0]);
  and AND10(a2b[1], A[2], B[1]);
  and AND11(a2b[2], A[2], B[2]);
  and AND12(a2b[3], A[2], B[3]);
  and AND13(a3b[0], A[3], B[0]);
  and AND14(a3b[1], A[3], B[1]);
  and AND15(a3b[2], A[3], B[2]);
  and AND16(a3b[3], A[3], B[3]);


  assign product[0] = a0b[0];
  half_adder HA1(product[1], c0, a0b[1], a1b[0]);
  full_adder FA1(s1, c1, a1b[1], a2b[0], c0);
  full_adder FA2(s2, c2, a2b[1], a3b[0], c1);
  half_adder HA2(s3, c3, a3b[1], c2);
  half_adder HA3(product[2], c4, a0b[2], s1);
  full_adder FA3(s5, c5, a1b[2], s2, c4);
  full_adder FA4(s6, c6, a2b[2], s3, c5);
  full_adder FA5(s7, c7, a3b[2], c3, c6);
  half_adder HA4(product[3], c8, s5, a0b[3]);
  full_adder FA6(product[4], c9, s6, a1b[3], c8);
  full_adder FA7(product[5], c10, s7, a2b[3], c9);
  full_adder FA8(product[6], product[7], a3b[3], c7, c10);
endmodule

module half_adder(output wire sum,
                  output wire cout,
                  input wire in1,
                  input wire in2);
    xor(sum, in1, in2);
    and(cout, in1, in2);
endmodule

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
