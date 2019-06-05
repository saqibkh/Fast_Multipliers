module russian_peasant_unsigned_multiplier_4(product, A, B);
    input [3:0] A, B;
    output [7:0] product;

    integer i;
    reg [7:0] product, temp, B_mod;

    always @ (*) begin
        product = 0;
        B_mod = B;
        for(i=0; i<4; i=i+1) begin
          temp = A[i] ? B_mod : 4'b0000;
          B_mod = B_mod << 1;
          product = product + temp;
        end
    end
endmodule
