module test_dadda_unsigned_multiplier_RCA_64;

  // Inputs
  reg [63:0] A;
  reg [63:0] B;

  // Outputs
  wire [127:0] product;
  
  // Instantiate the Unit test (UUT)
  dadda_unsigned_multiplier_RCA_64 uut(
    .product(product),
    .A(A),
    .B(B));

  initial begin
    A = 0;
    B = 0;

    // Wait 100 ns for global reset to finish
    #100;
    // Add stimulus here
    #10 A=64'h000000005829EC10;B=64'h123BBBCF00000000;
    #10 A=64'h3489BE8F00000000;B=64'h00000000FFFFFFFF;
    #10 A=64'hAB5BAFFF00000FD3;B=64'hFFF1001000000000;
    #10 A=64'b0000000000000000000000000000000000000000000000000000000000000001;B=64'b0000000000000000000000000000000000000000000000000000000000000001;
    end
  initial begin
    //$monitor("time=",$time,, "A=%b B=%b : product=%b",A,B,product);
    $monitor("time=",$time,, "A=%d B=%d : product=%d",A,B,product);
  end
endmodule
