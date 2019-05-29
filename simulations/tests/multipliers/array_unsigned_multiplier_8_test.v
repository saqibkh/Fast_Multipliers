module test_array_unsigned_multiplier_8;

  // Inputs
  reg [7:0] A;
  reg [7:0] B;

  // Outputs
  wire [15:0] product;
  
  // Instantiate the Unit test (UUT)
  array_unsigned_multiplier_8 uut(
    .product(product),
    .A(A),
    .B(B));

  initial begin
    A = 0;
    B = 0;

    // Wait 100 ns for global reset to finish
    #100;
    // Add stimulus here
    A=8'b00000001;B=8'b00000000;
    #10 A=8'b00001010;B=8'b00000011;
    #10 A=8'b11010000;B=8'b10100000;
    #10 A=8'b11111111;B=8'b11111111;
    end
  initial begin
    $monitor("time=",$time,, "A=%D B=%d : product=%d",A,B,product);
  end
endmodule
