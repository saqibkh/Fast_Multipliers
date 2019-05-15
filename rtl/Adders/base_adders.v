/*
 * File base_adders.v
 * Description: Contains all the base adder modules that will be used
 *              in the design of more complex adder modules
 * Author: Saqib Khan
 */

/////////////////////////////////////////////////////////////////////////////
//
// Module Name: sign bit
// Function: Calculates the sign bit based on two inputs
//
/////////////////////////////////////////////////////////////////////////////
module sign_bit(output wire sign,
                input wire[31:0] in1,
                input wire[31:0] in2);
    xor(sign,in1[31],in2[31]);
endmodule


/////////////////////////////////////////////////////////////////////////////
//
// Module Name: Half Adder (1-bit)
// Function: Generate the Sum and Carry out based on the just the operands
//
/////////////////////////////////////////////////////////////////////////////
module half_adder(output wire sum,
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
    wire s1,c1,c2;
    half_adder HA1(s1, c1, in1, in2);
    half_adder HA2(sum, c2, s1, cin);
    or OR1(count, c1, c2);
endmodule
