/*
 * File base_adders.v
 * Description: Contains all the base adder modules that will be used
 *              in the design of more complex adder modules
 * Author: Saqib Khan
 */

/////////////////////////////////////////////////////////////////////////////
//
// Module Name: sign bit (32-bits)
// Function: Calculates the sign bit based on two inputs
//
/////////////////////////////////////////////////////////////////////////////
module sign_bit_32(output wire sign,
                input wire[31:0] in1,
                input wire[31:0] in2);
    xor(sign,in1[31],in2[31]);
endmodule


module half_adder(output wire sign,
                  output wire cout,
                  input wire in1,
                  input wire in2);
    xor(sum, in1, in2);
    and(cout, in1, in2);
endmodule


///////////////////////////////////////////////////////////////////////////////////
//
// Module Name: Full Adder (1-bit)
// Function: Generate the Sum and Carry out based on input operands and carry in
//
///////////////////////////////////////////////////////////////////////////////////
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
