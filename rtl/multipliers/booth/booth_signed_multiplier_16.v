module booth_signed_multiplier_16(product, A, B);
       input signed [15:0] A, B;
       output signed [31:0] product;
       reg [31:0] product;
       reg [1:0] temp;
       integer i;
       reg E1;
       reg [15:0] B1;

       always @ (*) begin
         product = 32'd0;
         E1 = 1'd0;
         B1 = -B;
         for (i = 0; i < 16; i = i + 1) begin
           temp = {A[i], E1};
           case (temp)
             2'd2 : product[31:16] = product[31:16] + B1;
             2'd1 : product[31:16] = product[31:16] + B;
           default : begin end
           endcase
           product = product >> 1; // Logical Shift Right
           product[31] = product[30]; // Preserve the sign bit
           E1 = A[i];
         end

         if (B == 16'd32) begin
           product = - product;
         end
       end
endmodule
