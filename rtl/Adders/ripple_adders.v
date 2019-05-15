/*
 * File: ripple_adders.v
 * Description: Contains all Ripple Carry Adders for different sizes
 * Author: Saqib Khan
 *
 */

/////////////////////////////////////////////////////////////////////////////
//
// Module Name: Ripple Carry Adder (4-bits)
// Function: Implements an 4-bit Ripple Carry Adder
//
/////////////////////////////////////////////////////////////////////////////
module ripple_adder_4(output wire [3:0] sum,
                      output wire cout,
                      input wire [3:0] in1, in2,
                      input wire cin);
    wire c1, c2, c3;
    full_adder FA1(sum[0], c1, in1[0], in2[0], cin);
    full_adder FA2(sum[1], c2, in1[1], in2[1], c1);
    full_adder FA3(sum[2], c3, in1[2], in2[2], c2);
    full_adder FA4(sum[3], cout, in1[3], in2[3], c3);
endmodule


/////////////////////////////////////////////////////////////////////////
//
// Module Name: Ripple Carry Adder (8-bits)
// Function: Implements an 8-bit Ripple Carry Adder
//
/////////////////////////////////////////////////////////////////////////////
module ripple_adder_8(output [7:0] sum,
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


/////////////////////////////////////////////////////////////////////////
//
// Module Name: Ripple Carry Adder (16-bits)
// Function: Implements an 16-bit Ripple Carry Adder
//
/////////////////////////////////////////////////////////////////////////
//module ripple_adder_16(output [15:0] sum,
//                      output cout,
//                      input [15:0] in1, in2,
//                      input cin);
//    wire c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15;
//    full_adder FA1(sum[0], c1, in1[0], in2[0], cin);
//    full_adder FA2(sum[1], c2, in1[1], in2[1], c1);
//    full_adder FA3(sum[2], c3, in1[2], in2[2], c2);
//    full_adder FA4(sum[3], c4, in1[3], in2[3], c3);
//    full_adder FA5(sum[4], c5, in1[4], in2[4], c4);
//    full_adder FA6(sum[5], c6, in1[5], in2[5], c5);
//    full_adder FA7(sum[6], c7, in1[6], in2[6], c6);
//    full_adder FA8(sum[7], c8, in1[7], in2[7], c7);
//    full_adder FA9(sum[8], c9, in1[8], in2[8], c8);
//    full_adder FA10(sum[9], c10, in1[9], in2[9], c9);
//    full_adder FA11(sum[10], c11, in1[10], in2[10], c10);
//    full_adder FA12(sum[11], c12, in1[11], in2[11], c11);
//    full_adder FA13(sum[12], c13, in1[12], in2[12], c12);
//    full_adder FA14(sum[13], c14, in1[13], in2[13], c13);
//    full_adder FA15(sum[14], c15, in1[14], in2[14], c14);
//    full_adder FA16(sum[15], cout, in1[15], in2[15], c15);
//endmodule
