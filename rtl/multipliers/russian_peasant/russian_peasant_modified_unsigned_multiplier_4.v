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

    assign product[0] = P0[0];

    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    wire [2:0] G1;
    wire [3:0] PP1, C1, sum1;
    assign G1[0] = P0[1] & P1[0];
    assign G1[1] = P0[2] & P1[1];
    assign G1[2] = P0[3] & P1[2];
    //assign G1[3] = 0     & P1[3];
    assign PP1[0] = P0[1] ^ P1[0];
    assign PP1[1] = P0[2] ^ P1[1];
    assign PP1[2] = P0[3] ^ P1[2];
    assign PP1[3] = P1[3];
    //assign PP1[3] = 0     ^ P1[3];

    assign C1[0] = 0;
    assign C1[1] = G1[0];// | (PP1[0] & C1[0]);
    assign C1[2] = G1[1] | (PP1[1] & C1[1]);
    assign C1[3] = G1[2] | (PP1[2] & C1[2]);
    assign cout1 = (PP1[3] & C1[3]);
    //assign cout1 = G1[3] | (PP1[3] & C1[3]);
    assign sum1[0] = PP1[0] ^ C1[0];
    assign sum1[1] = PP1[1] ^ C1[1];
    assign sum1[2] = PP1[2] ^ C1[2];
    assign sum1[3] = PP1[3] ^ C1[3];
   
    assign product[1] = sum1[0];

    /*always @(*) begin
        $display("sum[0]=%b",sum[0]);
        $display("sum[1]=%b",sum[1]);
        $display("sum[2]=%b",sum[2]);
        $display("sum[3]=%b",sum[3]);

        $display("C[0]=%b",C[0]);
        $display("C[1]=%b",C[0]);
        $display("C[2]=%b",C[0]);
        $display("C[3]=%b",C[0]);
        $display("cout=%b",cout);
    end*/
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    wire [2:0] G2, PP2, C2, sum2;
    assign G2[0] = P2[1] & P3[0];
    assign G2[1] = P2[2] & P3[1];
    assign G2[2] = P2[3] & P3[2];
    assign PP2[0] = P2[1] ^ P3[0];
    assign PP2[1] = P2[2] ^ P3[1];
    assign PP2[2] = P2[3] ^ P3[2];
    //assign C2[0] = 0;
    assign C2[1] = G2[0];// | (PP2[0] & C2[0]);
    assign C2[2] = G2[1] | (PP2[1] & C2[1]);
    assign cout2 = G2[2] | (PP2[2] & C2[2]);
    assign sum2[0] = PP2[0];
    assign sum2[1] = PP2[1] ^ C2[1];
    assign sum2[2] = PP2[2] ^ C2[2];

    /*always @(*) begin
        $display("sum[0]=%b",sum[0]);
        $display("sum[1]=%b",sum[1]);
        $display("sum[2]=%b",sum[2]);

        $display("C[0]=%b",C[0]);
        $display("C[1]=%b",C[0]);
        $display("C[2]=%b",C[0]);
        $display("cout=%b",cout);
    end*/


    wire [4:0] G, P, C, sum;
    assign G[0] = sum1[1]  & P2[0];
    assign G[1] = sum1[2] & sum2[0];
    assign G[2] = sum1[3] & sum2[1];
    assign G[3] = cout1   & sum2[2];
    assign G[4] = P3[3]   & cout2;
    assign P[0] = sum1[1] ^ P2[0];
    assign P[1] = sum1[2] ^ sum2[0];
    assign P[2] = sum1[3] ^ sum2[1];
    assign P[3] = cout1   ^ sum2[2];
    assign P[4] = P3[3]   ^ cout2;

    //assign C[0] = 0;
    assign C[1] = G[0];// | (P[0] & C[0]);
    assign C[2] = G[1] | (P[1] & C[1]);
    assign C[3] = G[2] | (P[2] & C[2]);
    assign C[4] = G[3] | (P[3] & C[3]);
    assign cout = G[4] | (P[4] & C[4]);
    assign sum[0] = P[0];
    assign sum[1] = P[1] ^ C[1];
    assign sum[2] = P[2] ^ C[2];
    assign sum[3] = P[3] ^ C[3];
    assign sum[4] = P[4] ^ C[4];

    assign product[2] = sum[0];
    assign product[3] = sum[1];
    assign product[4] = sum[2];
    assign product[5] = sum[3];
    assign product[6] = sum[4];
    assign product[7] = cout;
endmodule


module russian_peasant_modified_unsigned_multiplier_4_attempt3(product, A, B);
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

module russian_peasant_modified_unsigned_multiplier_4_attemp2(product, A, B);
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

    half_adder HA01(product[3], c31,        s22,   c21);
    full_adder FA01(product[4], c32,        s23,   c22, c31);
    full_adder FA02(product[5], c33,        s24,   c23, c32);
    full_adder FA03(product[6], product[7], P3[3], c24, c33);
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
