module russian_peasant_modified_unsigned_multiplier_4(product, A, B);
    input [3:0] A, B;
    output [7:0] product;

    wire [7:0] product;
    wire s11, s12, s13, s14, s21, s22, s23, s24;
    wire c11, c12, c13, c14, c21, c22, c23, c24, c31, c32, c33;

    wire [3:0] P0, P1, P2, P3;
    assign P0 = A[0] ? B : 4'b0000;
    assign P1 = A[1] ? B : 4'b0000; 
    assign P2 = A[2] ? B : 4'b0000;
    assign P3 = A[3] ? B : 4'b0000;

    /* First stage of Wallace Tree Reduction */
    assign product[0] = P0[0];
    half_adder HA1(product[1], c11, P0[1], P1[0]);
    full_adder FA1(s12,        c12, P0[2], P1[1], P2[0]);
    full_adder FA2(s13,        c13, P0[3], P1[2], P2[1]);
    half_adder HA2(s14,        c14,        P1[3], P2[2]);

    /* Second stage of Wallace Tree Reduction */
    half_adder HA3(product[2], c21,        s12,   c11);
    full_adder FA3(s22,        c22, P3[0], s13,   c12);
    full_adder FA4(s23,        c23, P3[1], s14,   c13);
    full_adder FA5(s24,        c24, P3[2], P2[3], c14);

    /* Final Stage of adding products using Carry-Look-Ahead(CLA) Adder */
    wire [3:0] sum;
    wire [3:0] G; /* Generate */
    wire [3:0] P; /* Propagate */
    wire [3:0] C; /* Carry */

    assign G[0] = s22 & c21; assign G[1] = s23 & c22; assign G[2] = s24 & c23; assign G[3] = P3[3] & c24;
    assign P[0] = s22 ^ c21; assign P[1] = s23 ^ c22; assign P[2] = s24 ^ c23; assign P[3] = P3[3] ^ c24;
    //assign C[0] = 0;
    assign C[1] = G[0];
    assign C[2] = G[1] | (P[1] & G[0]);
    assign C[3] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]);
    assign product[7] = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]);
    assign product[3] = P[0];
    assign product[4] = P[1] ^ C[1];
    assign product[5] = P[2] ^ C[2];
    assign product[6] = P[3] ^ C[3];
endmodule

module russian_peasant_modified_unsigned_multiplier_4_attempt1(product, A, B);
    input [3:0] A, B;
    output [7:0] product;

    wire [7:0] product;
    reg [7:0] temp, B_mod;
    reg [7:0] P0, P1, P2, P3;

    wire s11, s12, s13, s14, s21, s22, s23, s24;
    wire c11, c12, c13, c14, c21, c22, c23, c24, c31, c32, c33;

    always @ (*) begin
        B_mod = B;

        P0 = A[0] ? B_mod : 8'd00;

        B_mod = B_mod << 1;
        P1 = A[1] ? B_mod : 8'd00;

        B_mod = B_mod << 1;
        P2 = A[2] ? B_mod : 8'd00;

        B_mod = B_mod << 1;
        P3 = A[3] ? B_mod : 8'd00;
    end

    /* First stage of Wallace Tree Reduction */
    assign product[0] = P0[0];
    half_adder HA1(product[1], c11, P0[1], P1[1]);
    full_adder FA1(s12,        c12, P0[2], P1[2], P2[2]);
    full_adder FA2(s13,        c13, P0[3], P1[3], P2[3]);
    half_adder HA2(s14,        c14,        P1[4], P2[4]);

    /* Second stage of Wallace Tree Reduction */
    half_adder HA3(product[2], c21,        s12,   c11);
    full_adder FA3(s22,        c22, P3[3], s13,   c12);
    full_adder FA4(s23,        c23, P3[4], s14,   c13);
    full_adder FA5(s24,        c24, P3[5], P2[5], c14);

    /* Final Stage of adding products using Carry-Look-Ahead(CLA) Adder */
    wire [3:0] sum;
    wire [3:0] G; /* Generate */
    wire [3:0] P; /* Propagate */
    wire [3:0] C; /* Carry */

    assign G[0] = s22 & c21; assign G[1] = s23 & c22; assign G[2] = s24 & c23; assign G[3] = P3[6] & c24;
    assign P[0] = s22 ^ c21; assign P[1] = s23 ^ c22; assign P[2] = s24 ^ c23; assign P[3] = P3[6] ^ c24;

    assign C[0] = 0;  /* Carry_out = Ci+1 = Gi + Pi*Ci */
    assign C[1] = G[0];// | (P[0] & C[0]);
    assign C[2] = G[1] | (P[1] & G[0]);// | (P[1] & P[0] & C[0]);
    assign C[3] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]);// | (P[2] & P[1] & P[0] & C[0]); 
    assign product[7] = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]);// |(P[3] & P[2] & P[1] & P[0] & C[0]);
    assign sum = P ^ C;
    assign product[3] = sum[0];
    assign product[4] = sum[1];
    assign product[5] = sum[2];
    assign product[6] = sum[3];
endmodule

module half_adder(output wire sum,
                  output wire cout,
                  input wire in1,
                  input wire in2);
    xor(sum, in1, in2);
    and(cout, in1, in2);
endmodule

module full_adder(output wire sum,
                  output wire cout,
                  input wire in1,
                  input wire in2,
                  input wire cin);
    wire temp1;
    wire temp2;
    wire temp3;
    xor(sum, in1, in2, cin);
    and(temp1,in1,in2);
    and(temp2,in1,cin);
    and(temp3,in2,cin);
    or(cout,temp1,temp2,temp3);
endmodule
