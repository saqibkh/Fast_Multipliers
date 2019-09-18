module test_carry_select_adder_64;

  // Inputs
  reg [63:0] in1;
  reg [63:0] in2;
  reg cin;

  // Outputs
  wire [63:0] sum;
  wire cout;
  
  // Instantiate the Unit test (UUT)
  carry_select_adder_64 uut(
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
    in1=64'h0000000000000001;in2=64'h0000000000000000;cin=1'b0;
    #10 in1=64'h0000000000001010;in2=64'h0000000000000011;cin=1'b0;
    #10 in1=64'h1101000000000000;in2=64'h1010000000000000;cin=1'b1;
    end
  initial begin
    $monitor("time=",$time,, "in1=%d in2=%d cin=%d : sum=%d cout=%d",in1,in2,cin,sum,cout);
  end
endmodule
