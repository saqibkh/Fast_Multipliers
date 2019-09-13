module test_multiplier_16bits_version14;

  // Inputs
  reg [15:0] A;
  reg [15:0] B;

  // Outputs
  wire [31:0] product;
  
  // Instantiate the Unit test (UUT)
  multiplier_16bits_version14 uut(
    .product(product),
    .A(A),
    .B(B));

  initial begin
    A = 0;
    B = 0;

    // Wait 100 ns for global reset to finish
    #100;
    // Add stimulus here
    //A=4'b0001;B=4'b0000;
    #10 A=16'b0010011101110001;B=16'b0000111101100111;
    #10 A=16'b1010000000000000;B=16'b0011000011001101;
    #10 A=16'b1101101001010000;B=16'b1010010100010010;
    //#10 A=16'b1111111111111111;B=16'b0000000000000001;
    //#10 A=16'b0000000000000001;B=16'b1111111111111111;
    end
  initial begin
    //$monitor("time=",$time,, "A=%b B=%b : product=%b",A,B,product);
    $monitor("time=",$time,, "A=%d B=%d : product=%d",A,B,product);
  end
endmodule
