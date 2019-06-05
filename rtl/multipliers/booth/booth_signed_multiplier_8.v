module booth_signed_multiplier_8(product, A, B);
       input signed [7:0] A, B;
       output signed [15:0] product;
       reg [15:0] product;
       reg [1:0] temp;
       integer i;
       reg E1;
       reg [7:0] B1;

       always @ (*) begin
         product = 16'd0;
         E1 = 1'd0;
         B1 = -B;
         for (i = 0; i < 8; i = i + 1) begin
           temp = {A[i], E1};
           case (temp)
             2'd2 : product[15:8] = product[15:8] + B1;
             2'd1 : product[15:8] = product[15:8] + B;
           default : begin end
           endcase
           product = product >> 1; // Logical Shift Right
           product[15] = product[14]; // Preserve the sign bit
           E1 = A[i];
         end

         if (B == 8'd16) begin
           product = - product;
         end
       end
endmodule

