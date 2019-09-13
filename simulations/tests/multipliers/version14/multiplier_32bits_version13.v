module test_multiplier_32bits_version14;

  // Inputs
  reg [31:0] A;
  reg [31:0] B;

  // Outputs
  wire [63:0] product;
  
  // Instantiate the Unit test (UUT)
  multiplier_32bits_version14 uut(
    .product(product),
    .A(A),
    .B(B));

  initial begin
    A = 0;
    B = 0;

    // Wait 100 ns for global reset to finish
    #100;
    // Add stimulus here
    #10 A=32'h5829EC10;B=32'h123BBBCF;
    #10 A=32'h3489BE8F;B=32'hFFFFFFFF;
    #10 A=32'hAB5BAFFF;B=32'hFFF10010;
    end
  initial begin
    //$monitor("time=",$time,, "A=%b B=%b : product=%b",A,B,product);
    $monitor("time=",$time,, "A=%d B=%d : product=%d",A,B,product);
  end
endmodule
