module test_carry_lookahead_adder_3_4bits;

  // Inputs
  reg [3:0] in1;
  reg [3:0] in2;
  reg [3:0] in3;
  reg cin;

  // Outputs
  wire [3:0] sum;
  wire cout_1;
  wire cout_2;
  
  // Instantiate the Unit test (UUT)
  carry_lookahead_adder_3_4bits uut(
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
    in1=4'b0001;in2=4'b0000;in3=4'b0011;cin=1'b0;
    #10 in1=4'b1010;in2=4'b0011;in3=4'b0011;cin=1'b0;
    #10 in1=4'b1101;in2=4'b1010;in3=4'b0011;cin=1'b1;
    end
  initial begin
    $monitor("time=",$time,, "in1=%b in2=%b in3=%b cin=%b : sum=%b cout_1=%b cout_2=%b",in1,in2,in3,cin,sum,cout_1,cout_2);
  end
endmodule
