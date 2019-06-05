module russian_peasant_modified_unsigned_multiplier_4(product, A, B);
    input [3:0] A, B;
    output [7:0] product;

    reg [7:0] product, temp, B_mod;
    reg [7:0] P0, P1, P2, P3;

    wire s11, s12, s13, s14, s21, s22, s23, s24;
    wire c11, c12, c13, c14, c21, c22, c23, c24, c31, c32, c33;

    always @ (*) begin
        B_mod = B;

        P0 = A[0] ? B_mod : 8'd00;
        B_mod[4] = B_mod[3];
        B_mod[3] = B_mod[2];
        B_mod[2] = B_mod[1];
        B_mod[1] = B_mod[0];
        B_mod[0] = 0;

        P1 = A[1] ? B_mod : 8'd00;
        B_mod[5] = B_mod[4];
        B_mod[4] = B_mod[3];
        B_mod[3] = B_mod[2];
        B_mod[2] = B_mod[1];
        B_mod[1] = 0;

        P2 = A[2] ? B_mod : 8'd00;
        B_mod[6] = B_mod[5];
        B_mod[5] = B_mod[4];
        B_mod[4] = B_mod[3];
        B_mod[3] = B_mod[2];
        B_mod[2] = 0;

        P3 = A[3] ? B_mod : 8'd00;
        B_mod[7] = B_mod[6];
        B_mod[6] = B_mod[5];
        B_mod[5] = B_mod[4];
        B_mod[4] = B_mod[3];
        B_mod[3] = 0;
    end

    assign product[0] = P0[0];
    half_adder(s11, c11, P0[1], P1[1]);
    full_adder(s12, c12, P0[2], P1[2], P2[2]);
    full_adder(s13, c13, P0[3], P1[3], P2[3]);
    half_adder(s14, c14,        P1[4], P2[4]);

    assign product[1] = s11;
    half_adder(s21,        c21,        s12,   c11);
    full_adder(s22,        c22, P3[3], s13,   c12);
    full_adder(s23,        c23, P3[4], s14,   c13);
    full_adder(s24,        c24, P3[5], P2[5], c14);

    assign product[2] = s21;
    half_adder(product[3], c31,        s22,   c21);
    full_adder(product[4], c32,        s23,   c22, c31);
    full_adder(product[5], c33,        s24,   c23, c32);
    full_adder(product[6], product[7], P3[6], c24, c33);
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
