module test_reduced_multiplier_4;

  // Inputs
  reg [3:0] A;
  reg [3:0] B;

  // Outputs
  wire [7:0] product;
  
  // Instantiate the Unit test (UUT)
  reduced_multiplier_4 uut(
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
    #10 A=4'b10;B=4'b0101;
    #10 A=4'b1001;B=4'b1000;
    #10 A=4'b0101;B=4'b1001;
    #10 A=4'b1010;B=4'b0100;
    #10 A=4'b1100;B=4'b1001;
    end
  initial begin
    $monitor("time=",$time,, "A=%d B=%d : product=%d",A,B,product);
  end
endmodule
