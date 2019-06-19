module test_dadda_unsigned_multiplier_RCA_32;

  // Inputs
  reg [31:0] A;
  reg [31:0] B;

  // Outputs
  wire [63:0] product;
  
  // Instantiate the Unit test (UUT)
  dadda_unsigned_multiplier_RCA_32 uut(
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
    #10 A=32'b00100111011100010010011101110001;B=32'b00001111011001110000111101100111;
    #10 A=32'b10100000000000001010000000000000;B=32'b00110000110011010011000011001101;
    #10 A=32'b11011010010100001101101001010000;B=32'b10100101000100101010010100010010;
    end
  initial begin
    //$monitor("time=",$time,, "A=%b B=%b : product=%b",A,B,product);
    $monitor("time=",$time,, "A=%d B=%d : product=%d",A,B,product);
  end
endmodule
