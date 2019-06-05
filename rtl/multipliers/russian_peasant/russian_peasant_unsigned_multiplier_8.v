module russian_peasant_unsigned_multiplier_8(product, A, B);
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
