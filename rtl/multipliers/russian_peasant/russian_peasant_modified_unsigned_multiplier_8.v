module russian_peasant_modified_unsigned_multiplier_8(product, A, B);
    /* This implementation uses carry look-ahead adders of max length 4 even
     * for final stage */

    input [3:0] A, B;
    output [7:0] product;

    wire [7:0] product;
    wire s11, s12, s13, s14, s21, s22, s23, s24;
    wire c11, c12, c13, c14, c21, c22, c23, c24, c31, c32, c33;

    wire [3:0] PP0, PP1, PP2, PP3;
    assign PP0 = A[0] ? B : 4'b0000;
    assign PP1 = A[1] ? B : 4'b0000;
    assign PP2 = A[2] ? B : 4'b0000;
    assign PP3 = A[3] ? B : 4'b0000;

    assign product[0] = PP0[0];


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
