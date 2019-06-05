module booth_signed_multiplier_4(product, A, B);
       input signed [3:0] A, B;
       output signed [7:0] product;
       reg [7:0] product;
       reg [1:0] temp;
       integer i;
       reg E1;
       reg [3:0] B1;

       always @ (*) begin
         product = 8'd0;
         E1 = 1'd0;
         B1 = -B;
         for (i = 0; i < 4; i = i + 1) begin
           temp = {A[i], E1};
           case (temp)
             2'd2 : product[7:4] = product[7:4] + B1;
             2'd1 : product[7:4] = product[7:4] + B;
           default : begin end
           endcase
           product = product >> 1; // Logical Shift Right
           product[7] = product[6]; // Preserve the sign bit
           E1 = A[i];
         end

         if (B == 4'd8) begin
           product = - product;
         end
       end
endmodule
