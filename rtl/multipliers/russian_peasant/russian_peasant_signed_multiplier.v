/* Note: This implementation of signed russian peasant multiplication is
incomplete and is thus giving wrong results. */

module russian_peasant_signed_multiplier_4(product, A, B);
    input signed [3:0] A, B;
    output signed [7:0] product;

    integer i;
    reg signed [7:0] product, temp, B_mod;

    always @ (*) begin
        product = 0;
        B_mod = B;
        for(i=0; i<4; i=i+1) begin
          temp = A[i] ? B_mod : 4'b0000;
          B_mod = B_mod <<< 1;
          $display("B_mod is %b", B_mod);
          product = product + temp;
          $display("product is %b", product);
        end
    end
endmodule

module russian_peasant_signed_multiplier_8(product, A, B);
    input [7:0] A, B;
    output [15:0] product;

    integer i;
    reg [15:0] product, temp, B_mod;

    always @ (*) begin
        product = 0;
        B_mod = B;
        for(i=0; i<8; i=i+1) begin
          temp = A[i] ? B_mod : 4'b00000000;
          B_mod = B_mod << 1;
          product = product + temp;
        end
    end
endmodule

module russian_peasant_signed_multiplier_16(product, A, B);
    input [15:0] A, B;
    output [31:0] product;

    integer i;
    reg [31:0] product, temp, B_mod;

    always @ (*) begin
        product = 0;
        B_mod = B;
        for(i=0; i<16; i=i+1) begin
          temp = A[i] ? B_mod : 4'd0000;
          B_mod = B_mod << 1;
          product = product + temp;
        end
    end
endmodule
