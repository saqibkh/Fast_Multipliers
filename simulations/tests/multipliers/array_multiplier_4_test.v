module test_array_multiplier_4;

  // Inputs
  reg [3:0] A;
  reg [3:0] B;

  // Outputs
  wire [8:0] product;
  
  // Instantiate the Unit test (UUT)
  array_multiplier_4 uut(
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
    $monitor("time=",$time,, "A=%b B=%b : product=%b",A,B,product);
  end
endmodule
