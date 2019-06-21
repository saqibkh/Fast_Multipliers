module test_russian_peasant_new_unsigned_multiplier_8;

  // Inputs
  reg [7:0] A;
  reg [7:0] B;

  // Outputs
  wire [15:0] product;
  
  // Instantiate the Unit test (UUT)
  russian_peasant_new_unsigned_multiplier_8 uut(
    .product(product),
    .A(A),
    .B(B));

  initial begin
    A = 56756;
    B = 0;

    // Wait 100 ns for global reset to finish
    #100;
    // Add stimulus here
    //A=4'b0001;B=4'b0000;
    #10 A=8'b01100010;B=8'b01110011;
    #10 A=8'b10101010;B=8'b01100011;
    #10 A=8'b11100101;B=8'b00101010;
    #10 A=8'b00000010;B=8'b00101010;
    #10 A=8'b00000010;B=8'b10111010;
    #10 A=8'b11000101;B=8'b00000010;
    #10 A=8'b10100101;B=8'b00000010;
    end
  initial begin
    //$monitor("time=",$time,, "A=%b B=%b : product=%b",A,B,product);
    $monitor("time=",$time,, "A=%d B=%d : product=%d",A,B,product);
  end
endmodule
