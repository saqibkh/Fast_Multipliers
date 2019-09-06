module multiplier_4bits_version11(product, A, B);

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
    wire[3:0] s1, in1_1, in1_2;
    wire c1;
    assign in1_1 = {pp0[2],pp0[3],pp1[3],pp2[3]};
    assign in1_2 = {pp1[1],pp1[2],pp2[2],pp3[2]};
    CLA_4 KS_1(s1, c1, in1_1, in1_2);
    wire[1:0] s2, in2_1, in2_2;
    wire c2;
    assign in2_1 = {pp2[1],pp3[1]};
    assign in2_2 = {pp3[0],1'b0};
    CLA_2 KS_2(s2, c2, in2_1, in2_2);


    wire[5:0] s, in_1, in_2;
    wire c;
    assign in_1 = {pp0[1],pp2[0],s1[1],s1[2],s1[3],pp3[3]};
    assign in_2 = {pp1[0],s1[0],s2[0],s2[1],c2,c1};
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
