module booth_multiplier_4(output wire [7:0] product,
                          input wire [3:0] A, B);

  reg [3:0] Neg_B;
  reg[1:0] temp;
  reg E1;
  integer i;

  assign product = 8'd0;
  assign Neg_B = -B;
  assign E1 = 1'd0;


  for (i=0; i<4; i=i+1)begin
    assign temp = {A[i], E1};
    case(temp)
      2'b10 : assign product[7 : 3] = product[7 : 3] + Neg_B;
      2'b01 : assign product[7 : 3] = product[7 : 3] + B;
    default : begin end
    endcase
    assign product = product >> 1;
    assign product[7] = product[6];
    assign E1 = A[i];
  end
endmodule
