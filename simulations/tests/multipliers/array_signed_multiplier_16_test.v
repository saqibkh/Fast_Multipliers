module test_array_signed_multiplier_16;

  // Inputs
  reg signed [15:0] A;
  reg signed [15:0] B;

  // Outputs
  wire signed [31:0] product;
  
  // Instantiate the Unit test (UUT)
  array_signed_multiplier_16 uut(
    .product(product),
    .A(A),
    .B(B));

  initial begin
    A = 0;
    B = 0;

    // Wait 100 ns for global reset to finish
    #100;
    // Add stimulus here
    A=16'b0000000000000001;B=16'b0000000000000000;
    #10 A=16'b0000101000000000;B=16'b0000001100000000;
    #10 A=16'b0000000011010000;B=16'b1010000000000000;
    #10 A=16'b1111111100000000;B=16'b0000000011111111;
    end
  initial begin
    $monitor("time=",$time,, "A=%D B=%d : product=%d",A,B,product);
  end
endmodule
