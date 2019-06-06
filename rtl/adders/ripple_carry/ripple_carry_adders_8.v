/////////////////////////////////////////////////////////////////////////
////
//// Module Name: Ripple Carry Adder (8-bits)
//// Function: Implements an 8-bit Ripple Carry Adder
////
////////////////////////////////////////////////////////////////////////
module ripple_carry_adder_8(output [7:0] sum,
                      output cout,
                      input [7:0] in1, in2,
                      input cin);
    wire c1, c2, c3, c4, c5, c6, c7;
    full_adder FA1(sum[0], c1, in1[0], in2[0], cin);
    full_adder FA2(sum[1], c2, in1[1], in2[1], c1);
    full_adder FA3(sum[2], c3, in1[2], in2[2], c2);
    full_adder FA4(sum[3], c4, in1[3], in2[3], c3);
    full_adder FA5(sum[4], c5, in1[4], in2[4], c4);
    full_adder FA6(sum[5], c6, in1[5], in2[5], c5);
    full_adder FA7(sum[6], c7, in1[6], in2[6], c6);
    full_adder FA8(sum[7], cout, in1[7], in2[7], c7);
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

