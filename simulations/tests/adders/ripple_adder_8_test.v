module test_ripple_adder_8;

  // Inputs
  reg [7:0] in1;
  reg [7:0] in2;
  reg cin;

  // Outputs
  wire [7:0] sum;
  wire cout;
  
  // Instantiate the Unit test (UUT)
  ripple_adder_8 uut(
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
    in1=8'b00000001;in2=8'b00000000;cin=1'b0;
    #10 in1=4'b00001010;in2=8'b00000011;cin=1'b0;
    #10 in1=4'b11010000;in2=8'b10100000;cin=1'b1;
    end
  initial begin
    $monitor("time=",$time,, "in1=%b in2=%b cin=%b : sum=%b cout=%b",in1,in2,cin,sum,cout);
  end
endmodule
