/* This implementation is a 8bit Carry Select Adder made from
 * 4-bit Ripple Carry Adder
 * Area: 235.588594
 * Power: 0.1046mW
 * Timing: 0.54ns
 */

module carry_select_adder_8(output [7:0] sum,
                            output cout,
                            input [7:0] in1, in2,
                            input cin);

    wire [7:0] sum;
    wire cout;
    wire [3:0] result2_1, result2_2;
    wire c1, c2_1, c2_2, c2_3;

    /* 1st 4 bits */
    ripple_carry_adder_4 RCA01(sum[3:0], c1, in1[3:0], in2[3:0], cin);

    /* 2nd 4 bits */
    ripple_carry_adder_4 RCA02(result2_1, c2_1, in1[7:4], in2[7:4], 1'b0);
    ripple_carry_adder_4 RCA03(result2_2, c2_2, in1[7:4], in2[7:4], 1'b1);
    mux MUX01(sum[7:4], result2_1, result2_2, c1);
    and(c2_3, c2_1, c1);
    or(cout, c2_3, c2_2);
endmodule

module mux(result, in1, in2, key);
    input [3:0] in1, in2;
    input key;
    output [3:0] result;
    assign result = key ? in2 : in1;
endmodule

module ripple_carry_adder_4(output wire [3:0] sum,
                      output wire cout,
                      input wire [3:0] in1, in2,
                      input wire cin);
    wire c1, c2, c3;
    full_adder FA1(sum[0], c1, in1[0], in2[0], cin);
    full_adder FA2(sum[1], c2, in1[1], in2[1], c1);
    full_adder FA3(sum[2], c3, in1[2], in2[2], c2);
    full_adder FA4(sum[3], cout, in1[3], in2[3], c3);
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
