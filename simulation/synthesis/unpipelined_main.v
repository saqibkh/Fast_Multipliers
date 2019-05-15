module control(input wire[31:0] inp1,
               input wire[31:0] inp2,
               output wire[31:0] out,
               output wire underflow,
               output wire overflow);

  wire sign;
  wire [7:0] exp1;
  wire [7:0] exp2;
  wire [7:0] exp_out;
  wire [7:0] test_exp;
  wire [22:0] mant1;
  wire [22:0] mant2;
  wire [22:0] mant_out;
  wire carry;
  sign_bit sign_bit1(sign,inp1,inp2);
  wire [7:0] temp1;
  wire dummy; // to connect unused cout ports of adder wire carry;
  wire [8:0] sub_temp;
  ripple_8 rip1(temp1,carry,inp1[30:23],inp2[30:23],1'b0);
  subtractor_9 sub1(sub_temp,underflow,{carry,temp1},1'b0);
  // if there is a carry out => underflow
  and(overflow,sub_temp[8],1'b1); // if the exponent has more than 8 bits: overflow
  // taking product of mantissa:
  wire [47:0] prdt;
  product p1(prdt,{1'b1,inp1[22:0]},{1'b1,inp2[22:0]});
  wire norm_flag;
  wire [22:0] adj_mantissa;
  normalize norm1(adj_mantissa,norm_flag,prdt);
  ripple_8 ripple_norm(test_exp,dummy,sub_temp[7:0],{7'b0,norm_flag},1'b0);
  assign out[31] = sign;
  assign out[29:23] = test_exp[6:0];
  assign out[30] = 1'b1;
  assign out[22:0] = adj_mantissa;
endmodule
