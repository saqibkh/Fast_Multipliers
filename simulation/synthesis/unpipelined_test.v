`timescale 1 ns/1ps
module stimulus;

  reg [31:0] in1;
  reg [31:0] in2;
  wire [31:0] prdct;
  wire overflow;
  wire underflow;
  wire [7:0] test_exp;
  wire [22:0] mant;
  wire normy;
  control control1(.inp1(in1),.inp2(in2),.out(prdct),.underflow(underflow),.overflow(overflow));

  initial begin
  $dumpfile("multiply.vcd");
  $dumpvars(0,stimulus);
  in1 = 32'b01000010110111010110001010110010;
  in2 = 32'b01000011001001100111010110110110;
  // product = 0 10001101 00011111111001111001010

  #10
  in1 = 32'b11010110110110100101011101000110;
  in2 = 32'b01001010101110100101110001110010;

  #20
  in1 = 32'h40E80000;
  in2 = 32'h3FE00000;

  #30
  $finish;
  end

  initial begin
  $monitor("Multiplicand = %32b, Multiplier = %32b, Product = %32b, Underflow = %1b, Overflow = %1b",in1,in2,prdct,underflow,overflow);
  end
endmodule
