module test_ripple_adder_16;

  // Inputs
  reg [15:0] in1;
  reg [15:0] in2;
  reg cin;

  // Outputs
  wire [15:0] sum;
  wire cout;
  
  // Instantiate the Unit test (UUT)
  ripple_adder_16 uut(
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
    in1=16'b0000000000000001;in2=16'b0000000000000000;cin=1'b0;
    #10 in1=16'b0000000000001010;in2=16'b0000000000000011;cin=1'b0;
    #10 in1=16'b1101000000000000;in2=16'b1010000000000000;cin=1'b1;
    end
  initial begin
    $monitor("time=",$time,, "in1=%b in2=%b cin=%b : sum=%b cout=%b",in1,in2,cin,sum,cout);
  end
endmodule
