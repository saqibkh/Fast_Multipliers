module multiplier_8bits_version11(product, A, B);

    output [15:0] product;
    input [7:0] A, B;

    wire [7:0] pp0;
    wire [7:0] pp1;
    wire [7:0] pp2;
    wire [7:0] pp3;
    wire [7:0] pp4;
    wire [7:0] pp5;
    wire [7:0] pp6;
    wire [7:0] pp7;


    assign pp0 = A[0] ? B: 8'b00000000;
    assign pp1 = A[1] ? B: 8'b00000000;
    assign pp2 = A[2] ? B: 8'b00000000;
    assign pp3 = A[3] ? B: 8'b00000000;
    assign pp4 = A[4] ? B: 8'b00000000;
    assign pp5 = A[5] ? B: 8'b00000000;
    assign pp6 = A[6] ? B: 8'b00000000;
    assign pp7 = A[7] ? B: 8'b00000000;


    /*Stage 1*/
    wire[7:0] s1, in1_1, in1_2;
    wire c1;
    assign in1_1 = {pp0[4],pp0[5],pp0[6],pp0[7],pp1[7],pp2[7],pp3[7],pp4[7]};
    assign in1_2 = {pp1[3],pp1[4],pp1[5],pp1[6],pp2[6],pp3[6],pp4[6],pp5[6]};
    CLA_8 KS_1(s1, c1, in1_1, in1_2);
    wire[5:0] s2, in2_1, in2_2;
    wire c2;
    assign in2_1 = {pp2[3],pp2[4],pp2[5],pp3[5],pp4[5],pp5[5]};
    assign in2_2 = {pp3[2],pp3[3],pp3[4],pp4[4],pp5[4],pp6[4]};
    CLA_6 KS_2(s2, c2, in2_1, in2_2);
    wire[3:0] s3, in3_1, in3_2;
    wire c3;
    assign in3_1 = {pp4[2],pp4[3],pp5[3],pp6[3]};
    assign in3_2 = {pp5[1],pp5[2],pp6[2],pp7[2]};
    CLA_4 KS_3(s3, c3, in3_1, in3_2);
    wire[1:0] s4, in4_1, in4_2;
    wire c4;
    assign in4_1 = {pp6[1],pp7[1]};
    assign in4_2 = {pp7[0],1'b0};
    CLA_2 KS_4(s4, c4, in4_1, in4_2);

    /*Stage 2*/
    wire[11:0] s5, in5_1, in5_2;
    wire c5;
    assign in5_1 = {pp0[2],pp0[3],pp2[2],pp4[1],pp6[0],s1[3],s1[4],s1[5],pp7[3],pp6[5],pp5[7],pp6[7]};
    assign in5_2 = {pp1[1],pp1[2],pp3[1],pp5[0],s1[2],s2[2],s2[3],s2[4],s1[6],pp7[4],pp6[6],pp7[6]};
    CLA_12 KS_5(s5, c5, in5_1, in5_2);
    wire[9:0] s6, in6_1, in6_2;
    wire c6;
    assign in6_1 = {pp2[1],pp4[0],s1[1],s2[1],s3[1],s3[2],s3[3],s2[5],s1[7],pp7[5]};
    assign in6_2 = {pp3[0],s1[0],s2[0],s3[0],s4[0],s4[1],s5[7],s5[8],s5[9],s5[10]};
    CLA_10 KS_6(s6, c6, in6_1, in6_2);


    /*Final Stage 2*/
    wire[13:0] s, in_1, in_2;
    wire c;
    assign in_1 = {pp0[1],pp2[0],s5[1],s5[2],s5[3],s5[4],s5[5],s5[6],c4,c3,c2,c1,s5[11],pp7[7]};
    assign in_2 = {pp1[0],s5[0],s6[0],s6[1],s6[2],s6[3],s6[4],s6[5],s6[6],s6[7],s6[8],s6[9],c6,c5};
    CLA_14(s, c, in_1, in_2);

    assign product[0] = pp0[0];
    assign product[1] = s[0];
    assign product[2] = s[1];
    assign product[3] = s[2];
    assign product[4] = s[3];
    assign product[5] = s[4];
    assign product[6] = s[5];
    assign product[7] = s[6];
    assign product[8] = s[7];
    assign product[9] = s[8];
    assign product[10] = s[9];
    assign product[11] = s[10];
    assign product[12] = s[11];
    assign product[13] = s[12];
    assign product[14] = s[13];
    assign product[15] = c;
endmodule

