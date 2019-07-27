/* This is the further reduced implementation of the reduced multiplier using
 * the design from attempt 1
 * Area:
 * Power:
 * Timing: 
 */
module reduced_multiplier_2(output wire [3:0] product,
                          input wire [1:0] A, B);

    wire a0b0, a1b1;
    assign a0b0 =  A[0] & B[0]; 
    assign a1b1 =  A[1] & B[1];
    assign product[0] = a0b0;
    assign product[1] = (A[0] & ~A[1] & B[1]) | (A[1] & B[0] & ~B[1]) | (A[0] & ~B[0] & a1b1) | (~A[0] & B[0] & a1b1);
    assign product[2] = a1b1 & (~A[0] | ~B[0]);
    assign product[3] = a1b1 & a0b0;
endmodule



/* This is the base reduced implementation of the reduced multiplier using the
 * equations generated from matlab
 * Area: 24.403599 
 * Power: 5.4703e-03mW
 * Timing: 0.11
 */
module reduced_multiplier_2_attempt1(output wire [3:0] product,
                          input wire [1:0] A, B);
    assign product[0] = A[0] & B[0]; 
    assign product[1] = A[0] & ~A[1] & B[1] | A[1] & B[0] & ~B[1] | A[0] & A[1] & ~B[0] & B[1] | ~A[0] & A[1] & B[0] & B[1];
    assign product[2] = A[1] & B[1] & (~A[0] | ~B[0]);
    assign product[3] = A[0] & A[1] & B[0] & B[1];
endmodule


/* This is the base implementation of the reduced multiplier using the
 * equations generated from matlab
 * Area:  24.403599
 * Power: 5.4703e-03mW
 * Timing: 0.11
 */
module reduced_multiplier_2_attempt2(output wire [3:0] product,
                          input wire [1:0] A, B);

    assign product[0] = (A[0] & ~(A[1]) & B[0] & ~(B[1])) | (A[0] & A[1] & B[0] & ~(B[1])) | (A[0] & ~(A[1]) & B[0] & B[1]) | (A[0] & A[1] & B[0] & B[1]);
    assign product[1] = (~(A[0]) & A[1] & B[0] & ~(B[1])) | (A[0] & A[1] & B[0] & ~(B[1])) | (A[0] & ~(A[1]) & ~(B[0]) & B[1]) | (A[0] & A[1] & ~(B[0]) & B[1]) | (A[0] & ~(A[1]) & B[0] & B[1]) | (~(A[0]) & A[1] & B[0] & B[1]); 
    assign product[2] = (~(A[0]) & A[1] & ~(B[0]) & B[1]) | (A[0] & A[1] & ~(B[0]) & B[1]) | (~(A[0]) & A[1] & B[0] & B[1]); 
    assign product[3] = (A[0] & A[1] & B[0] & B[1]); 
endmodule
