module test_reduced_multiplier_2;

  // Inputs
  reg [1:0] A;
  reg [1:0] B;

  // Outputs
  wire [3:0] product;
  
  // Instantiate the Unit test (UUT)
  reduced_multiplier_2 uut(
    .product(product),
    .A(A),
    .B(B));

  initial begin
    A = 0;
    B = 0;

    // Wait 100 ns for global reset to finish
    #100;
    // Add stimulus here
    A=4'b01;B=4'b00;
    #10 A=4'b10;B=4'b11;
    #10 A=4'b01;B=4'b10;
    #10 A=4'b01;B=4'b11;
    #10 A=4'b11;B=4'b10;
    #10 A=4'b11;B=4'b11;
    end
  initial begin
    $monitor("time=",$time,, "A=%d B=%d : product=%d",A,B,product);
  end
endmodule
