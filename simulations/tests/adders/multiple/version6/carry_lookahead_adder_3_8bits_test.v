module test_carry_lookahead_adder_3_8bits;

  // Inputs
  reg [7:0] in1;
  reg [7:0] in2;
  reg [7:0] in3;
  reg cin;

  // Outputs
  wire [7:0] sum;
  wire cout_1;
  wire cout_2;
  
  // Instantiate the Unit test (UUT)
  carry_lookahead_adder_3_8bits uut(
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
        in1=8'b01010001;in2=8'b00001111;in3=8'b01110011;cin=1'b0;
    #10 in1=8'b00111010;in2=8'b00110000;in3=8'b00010111;cin=1'b0;
    #10 in1=8'b00011101;in2=8'b10101010;in3=8'b00001011;cin=1'b1;
    end
  initial begin
    $monitor("time=",$time,, "in1=%b in2=%b in3=%b cin=%b : sum=%b cout_1=%b cout_2=%b",in1,in2,in3,cin,sum,cout_1,cout_2);
  end
endmodule
