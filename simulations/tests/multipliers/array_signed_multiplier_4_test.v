module test_array_signed_multiplier_4;

  // Inputs
  reg signed [3:0] A;
  reg signed [3:0] B;

  // Outputs
  wire signed [7:0] product;
  
  // Instantiate the Unit test (UUT)
  array_signed_multiplier_4 uut(
    .product(product),
    .A(A),
    .B(B));

  initial begin
    A = 0;
    B = 0;

    // Wait 100 ns for global reset to finish
    #100;
    // Add stimulus here
    A=4'b0001;B=4'b0000;
    #10 A=4'b1010;B=4'b0011;
    #10 A=4'b1101;B=4'b1010;
    end
  initial begin
    $monitor("time=",$time,, "A=%d B=%d : product=%d",A,B,product);
  end
endmodule