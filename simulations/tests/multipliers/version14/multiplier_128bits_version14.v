module test_multiplier_128bits_version14;

  // Inputs
  reg [127:0] A;
  reg [127:0] B;

  // Outputs
  wire [255:0] product;
  
  // Instantiate the Unit test (UUT)
  multiplier_128bits_version14 uut(
    .product(product),
    .A(A),
    .B(B));

  initial begin
    A = 0;
    B = 0;

    // Wait 100 ns for global reset to finish
    #100;
    // Add stimulus here
    #10 A=128'h000000005829EC10;B=128'h123BBBCF00000000;
    #10 A=128'h3489BE8F00000000;B=128'h00000000FFFFFFFF;
    #10 A=128'hAB5BAFFF00000FD3;B=128'hFFF1001000000000;
    end
  initial begin
    //$monitor("time=",$time,, "A=%b B=%b : product=%b",A,B,product);
    $monitor("time=",$time,, "A=%d B=%d : product=%d",A,B,product);
  end
endmodule
