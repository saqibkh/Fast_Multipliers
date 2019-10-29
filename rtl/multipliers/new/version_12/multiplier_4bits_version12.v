module multiplier_4bits_version12(product, A, B);

    /*
     * Area: 220.570993
     * Power: 7.7897e-02mW
     * TIming: 0.59ns
     */

    output [7:0] product;
    input [3:0] A, B;

    wire [3:0] pp0;
    wire [3:0] pp1;
    wire [3:0] pp2;
    wire [3:0] pp3;


    assign pp0 = A[0] ? B: 4'b0000;
    assign pp1 = A[1] ? B: 4'b0000;
    assign pp2 = A[2] ? B: 4'b0000;
    assign pp3 = A[3] ? B: 4'b0000;


    /*Stage 1*/
    wire[1:0] s1, in1_1, in1_2;
    wire c1;
    assign in1_1 = {pp0[3],pp1[3]};
    assign in1_2 = {pp1[2],pp2[2]};
    CLA_2 KS_1(s1, c1, in1_1, in1_2);

    /*Stage 2*/
    wire[3:0] s2, in2_1, in2_2;
    wire c2;
    assign in2_1 = {pp0[2],pp2[1],pp3[1],pp2[3]};
    assign in2_2 = {pp1[1],pp3[0],1'b0,pp3[2]};
    CLA_4 KS_2(s2, c2, in2_1, in2_2);


    /*Final Stage 2*/
    wire[5:0] s, in_1, in_2;
    wire c;
    assign in_1 = {pp0[1],pp2[0],s1[0],s1[1],c1,pp3[3]};
    assign in_2 = {pp1[0],s2[0],s2[1],s2[2],s2[3],c2};
    CLA_6(s, c, in_1, in_2);

    assign product[0] = pp0[0];
    assign product[1] = s[0];
    assign product[2] = s[1];
    assign product[3] = s[2];
    assign product[4] = s[3];
    assign product[5] = s[4];
    assign product[6] = s[5];
    assign product[7] = c;
endmodule

module CLA_2(output [1:0] sum, output cout, input [1:0] in1, input [1:0] in2);

    wire[1:0] G;
    wire[1:0] C;
    wire[1:0] P;

    assign G[0] = in1[1] & in2[1];
    assign P[0] = in1[1] ^ in2[1];
    assign G[1] = in1[0] & in2[0];
    assign P[1] = in1[0] ^ in2[0];


    assign C[0] = 0;  /* Carry_out = Ci+1 = Gi + Pi*Ci */;
    assign C[1] = G[0] | (P[0] & C[0]);
    assign cout = G[1] | (P[1] & C[1]);
    assign sum = P ^ C;
endmodule
module CLA_4(output [3:0] sum,
            output cout,
            input [3:0] in1, in2);

    wire [3:0] G; /* Generate */
    wire [3:0] P; /* Propagate */
    wire [3:0] C; /* Carry */

    assign G[0] = in1[3] & in2[3]; /*Generate    Gi = Ai * Bi */
    assign G[1] = in1[2] & in2[2];
    assign G[2] = in1[1] & in2[1];
    assign G[3] = in1[0] & in2[0];
    assign P[0] = in1[3] ^ in2[3]; /*Propagate   Pi = Ai + Bi */
    assign P[1] = in1[2] ^ in2[2];
    assign P[2] = in1[1] ^ in2[1];
    assign P[3] = in1[0] ^ in2[0];

    assign C[0] = 0;
    assign C[1] = G[0] | (P[0] & C[0]);
    assign C[2] = G[1] | (P[1] & C[1]);
    assign C[3] = G[2] | (P[2] & C[2]);
    assign cout = G[3] | (P[3] & C[3]);
    assign sum = P ^ C;
endmodule

module CLA_6(output [5:0] sum, output cout, input [5:0] in1, input [5:0] in2);

    wire[5:0] G;
    wire[5:0] C;
    wire[5:0] P;

    assign G[0] = in1[5] & in2[5];
    assign P[0] = in1[5] ^ in2[5];
    assign G[1] = in1[4] & in2[4];
    assign P[1] = in1[4] ^ in2[4];
    assign G[2] = in1[3] & in2[3];
    assign P[2] = in1[3] ^ in2[3];
    assign G[3] = in1[2] & in2[2];
    assign P[3] = in1[2] ^ in2[2];
    assign G[4] = in1[1] & in2[1];
    assign P[4] = in1[1] ^ in2[1];
    assign G[5] = in1[0] & in2[0];
    assign P[5] = in1[0] ^ in2[0];


    assign C[0] = 0;  /* Carry_out = Ci+1 = Gi + Pi*Ci */;
    assign C[1] = G[0] | (P[0] & C[0]);
    assign C[2] = G[1] | (P[1] & C[1]);
    assign C[3] = G[2] | (P[2] & C[2]);
    assign C[4] = G[3] | (P[3] & C[3]);
    assign C[5] = G[4] | (P[4] & C[4]);
    assign cout = G[5] | (P[5] & C[5]);
    assign sum = P ^ C;
endmodule
