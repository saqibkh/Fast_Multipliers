module multiplier_4bits_version14(product, A, B);

    output [7:0] product;
    input [3:0] A, B;

    /*
     * Area: 204.614794
     * Power: 7.7837e-02mW
     * Timing: 0.58ns
     */

    wire [3:0] pp0;
    wire [3:0] pp1;
    wire [3:0] pp2;
    wire [3:0] pp3;


    assign pp0 = A[0] ? B: 4'b0000;
    assign pp1 = A[1] ? B: 4'b0000;
    assign pp2 = A[2] ? B: 4'b0000;
    assign pp3 = A[3] ? B: 4'b0000;


    /*Stage 1*/
    wire[0:0] s1, in1_1, in1_2;
    wire c1;
    assign in1_1 = {pp0[3]};
    assign in1_2 = {pp1[2]};
    Half_Adder HA_1(s1, c1, in1_1, in1_2);
    wire[0:0] s2, in2_1, in2_2;
    wire c2;
    assign in2_1 = {pp1[3]};
    assign in2_2 = {pp2[2]};
    Half_Adder HA_2(s2, c2, in2_1, in2_2);

    /*Stage 2*/
    wire[0:0] s3, in3_1, in3_2;
    wire c3;
    assign in3_1 = {pp0[2]};
    assign in3_2 = {pp1[1]};
    Half_Adder HA_3(s3, c3, in3_1, in3_2);
    wire[0:0] s4, in4_1, in4_2;
    wire c4;
    assign in4_1 = {pp3[0]};
    assign in4_2 = {s1[0]};
    Full_Adder FA_4(s4, c4, in4_1, in4_2, pp2[1]);
    wire[0:0] s5, in5_1, in5_2;
    wire c5;
    assign in5_1 = {c1};
    assign in5_2 = {s2[0]};
    Full_Adder FA_5(s5, c5, in5_1, in5_2, pp3[1]);
    wire[0:0] s6, in6_1, in6_2;
    wire c6;
    assign in6_1 = {pp3[2]};
    assign in6_2 = {c2};
    Full_Adder FA_6(s6, c6, in6_1, in6_2, pp2[3]);


    /*Final Stage 2*/
    wire[5:0] s, in_1, in_2;
    wire c;
    assign in_1 = {pp0[1],pp2[0],c3,c4,c5,pp3[3]};
    assign in_2 = {pp1[0],s3[0],s4[0],s5[0],s6[0],c6};
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


module Half_Adder(output wire sum,
                  output wire cout,
                  input wire in1,
                  input wire in2);
    xor(sum, in1, in2);
    and(cout, in1, in2);
endmodule

module Full_Adder(output wire sum,
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

