module test_multiplier_4bits_version7;

  // Inputs
  reg [3:0] A;
  reg [3:0] B;

  // Outputs
  wire [7:0] product;
  
  // Instantiate the Unit test (UUT)
  multiplier_4bits_version7 uut(
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
    #10 A=4'b0010;B=4'b0011;
    #10 A=4'b1010;B=4'b0011;
    #10 A=4'b1101;B=4'b1010;
    end
  initial begin
    //$monitor("time=",$time,, "A=%b B=%b : product=%b",A,B,product);
    $monitor("time=",$time,, "A=%d B=%d : product=%d",A,B,product);
  end
endmodule
