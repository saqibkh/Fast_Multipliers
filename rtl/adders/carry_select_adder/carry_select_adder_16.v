/* This implementation is a 16bit Carry Select Adder made from
 * 4-bit Ripple Carry Adder
 * Area: 567.852986 
 * Power: 0.2488mW
 * Timing: 0.79ns
 */

module carry_select_adder_16(output [15:0] sum,
                            output cout,
                            input [15:0] in1, in2,
                            input cin);

    wire [15:0] sum;
    wire cout;
    wire [3:0] result2_1, result2_2, result3_1,result3_2,result4_1,result4_2;
    wire c1, c2_1, c2_2, c2_3,c3_1,c3_2,c4_1,c4_2,c4_3,c3_3;

    /* 1st 4 bits */
    ripple_carry_adder_4 RCA01(sum[3:0], c1, in1[3:0], in2[3:0], cin);

    /* 2nd 4 bits */
    ripple_carry_adder_4 RCA02(result2_1, c2_1, in1[7:4], in2[7:4], 1'b0);
    ripple_carry_adder_4 RCA03(result2_2, c2_2, in1[7:4], in2[7:4], 1'b1);
    mux(sum[7:4], result2_1, result2_2, c1);
    and(c2_3, c2_1, c1);
    or(c2, c2_3, c2_2);

    /* 3rd 4 bits */
    ripple_carry_adder_4 RCA04(result3_1, c3_1, in1[11:8], in2[11:8], 1'b0);
    ripple_carry_adder_4 RCA05(result3_2, c3_2, in1[11:8], in2[11:8], 1'b1);
    mux(sum[11:8], result3_1, result3_2, c2);
    and(c3_3, c3_1, c2);
    or(c3, c3_3, c3_2);

    /* 4th 4 bits */
    ripple_carry_adder_4 RCA06(result4_1, c4_1, in1[15:12], in2[15:12], 1'b0);
    ripple_carry_adder_4 RCA07(result4_2, c4_2, in1[15:12], in2[15:12], 1'b1);
    mux(sum[15:12], result4_1, result4_2, c3);
    and(c4_3, c4_1, c3);
    or(cout, c4_3, c4_2);
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
