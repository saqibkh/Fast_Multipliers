module test_carry_lookahead_adder_3_2bits;

  // Inputs
  reg [1:0] in1;
  reg [1:0] in2;
  reg [1:0] in3;
  reg cin;

  // Outputs
  wire [1:0] sum;
  wire cout_1;
  wire cout_2;
  
  // Instantiate the Unit test (UUT)
  carry_lookahead_adder_3_2bits uut(
    .sum(sum),
    .cout_1(cout_1),
    .cout_2(cout_2),
    .in1(in1),
    .in2(in2),
    .in3(in3),
    .cin(cin));

  initial begin
    in1 = 0;
    in2 = 0;
    in3 = 0;
    cin = 0;

    // Wait 100 ns for global reset to finish
    #100;
    // Add stimulus here
    in1=2'b01;in2=2'b00;in3=2'b01;cin=1'b0;
    #10 in1=2'b10;in2=2'b11;in3=2'b01;cin=1'b0;
    #10 in1=2'b01;in2=2'b10;in3=2'b01;cin=1'b1;
    #10 in1=2'b11;in2=2'b10;in3=2'b10;cin=1'b1;
    #10 in1=2'b11;in2=2'b11;in3=2'b11;cin=1'b1;
    end
  initial begin
    $monitor("time=",$time,, "in1=%b in2=%b in3=%b cin=%b : sum=%b cout_1=%b cout_2=%b",in1,in2,in3,cin,sum,cout_1,cout_2);
  end
endmodule
