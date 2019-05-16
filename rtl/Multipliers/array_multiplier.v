module array_multiplier_4(output wire [8:0] product,
                          input wire [3:0] A, B);

  // row 0
  wire [3:0] row_0;
  and AND1(row_0[0], A[0], B[0]);
  and AND2(row_0[1], A[1], B[0]);
  and AND3(row_0[2], A[2], B[0]);
  and AND4(row_0[3], A[3], B[0]);
  assign product[0] = row_0[0];

  // row 1
  wire row_1_3;
  wire [2:0] row_1_s, row_1_c;
  half_adder HA1(row_1_s[0], row_1_c[0], row_0[0], row_0[1]);
  half_adder HA2(row_1_s[1], row_1_c[1], row_0[1], row_0[2]);
  half_adder HA3(row_1_s[2], row_1_c[2], row_0[2], row_0[3]);
  and AND5(row_1_3, row_0[3],  B[1]);
  assign product[1] = row_1_s[0];

  // row 2
  wire row_2_3;
  wire [2:0] row_2_s, row_2_c;
  full_adder FA1(row_2_s[0], row_2_c[0], row_1_s[0], row_1_c[0], row_1_s[1]);
  full_adder FA2(row_2_s[1], row_2_c[1], row_1_s[1], row_1_c[1], row_1_s[2]);
  full_adder FA3(row_2_s[2], row_2_c[2], row_1_s[2], row_1_c[2], row_1_s[3]);
  and AND6(row_2_3, row_1_3[3],  B[2]);
  assign product[2] = row_2_s[0];

  // row 3
  wire row_3_3;
  wire [2:0] row_3_s, row_3_c;
  full_adder FA4(row_3_s[0], row_3_c[0], row_2_s[0], row_2_c[0], row_2_s[1]);
  full_adder FA5(row_3_s[1], row_3_c[1], row_2_s[1], row_2_c[1], row_2_s[2]);
  full_adder FA6(row_3_s[2], row_3_c[2], row_2_s[2], row_2_c[2], row_2_s[3]);
  and AND7(row_3_3, row_2_3[3],  B[3]);
  assign product[3] = row_3_s[0];

  // row 4
  wire [2:0] row_4_s, row_4_c;
  half_adder HA4(row_4_s[0], row_4_c[0], row_3_c[0], row_2_s[1]);
  full_adder FA7(row_4_s[1], row_4_c[1], row_3_s[1], row_3_c[1], row_3_s[2]);
  full_adder FA8(row_4_s[2], row_4_c[2], row_3_s[2], row_3_c[2], row_3_3);
  assign product[4] = row_4_s[0];
  assign product[5] = row_4_c[0];
  assign product[6] = row_4_s[1];
  assign product[7] = row_4_s[2];
  assign product[8] = row_4_c[2];
endmodule
