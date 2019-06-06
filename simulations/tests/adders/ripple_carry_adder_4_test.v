module test_ripple_carry_adder_4;

  // Inputs
  reg [3:0] in1;
  reg [3:0] in2;
  reg cin;

  // Outputs
  wire [3:0] sum;
  wire cout;
  
  // Instantiate the Unit test (UUT)
  ripple_carry_adder_4 uut(
    .sum(sum),
    .cout(cout),
    .in1(in1),
    .in2(in2),
    .cin(cin));

  initial begin
    in1 = 0;
    in2 = 0;
    cin = 0;

    // Wait 100 ns for global reset to finish
    #100;
    // Add stimulus here
    in1=4'b0001;in2=4'b0000;cin=1'b0;
    #10 in1=4'b1010;in2=4'b0011;cin=1'b0;
    #10 in1=4'b1101;in2=4'b1010;cin=1'b1;
    end
  initial begin
    $monitor("time=",$time,, "in1=%b in2=%b cin=%b : sum=%b cout=%b",in1,in2,cin,sum,cout);
  end
endmodule
