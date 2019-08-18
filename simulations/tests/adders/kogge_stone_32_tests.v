module test_kogge_stone_32;

  // Inputs
  reg [31:0] in1;
  reg [31:0] in2;
  reg cin;

  // Outputs
  wire [31:0] sum;
  wire cout;
  
  // Instantiate the Unit test (UUT)
  kogge_stone_32 uut(
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
    in1=32'b00000000000000010000000000000001;in2=32'b00000000000000000000000000000000;cin=1'b0;
    #10 in1=32'b00000000000010100000000000001010;in2=32'b00000000000010100000000000000011;cin=1'b0;
    #10 in1=32'b11010000000000001010000000000000;in2=32'b10100000000000001010000000000000;cin=1'b1;
    end
  initial begin
    //$monitor("time=",$time,, "in1=%b in2=%b cin=%b : sum=%b cout=%b",in1,in2,cin,sum,cout);
    $monitor("time=",$time,, "in1=%d in2=%d cin=%d : sum=%d cout=%d",in1,in2,cin,sum,cout);
  end
endmodule
