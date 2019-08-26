module multiplier_8bits_version7(product, A, B);

    /* This implementation uses HAs for partial product reduction and uses 
     * kogge_stone adder at the end
     * Area: 2949.550403
     * Power: 1.8428mW
     * Timing: 3.09ns

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
    half_adder HA0(s0, c0, pp2[0], pp1[1]);
    half_adder HA1(s1, c1, pp3[0], pp2[1]);
    half_adder HA2(s2, c2, pp4[0], pp3[1]);
    half_adder HA3(s3, c3, pp5[0], pp4[1]);
    half_adder HA4(s4, c4, pp6[0], pp5[1]);
    half_adder HA5(s5, c5, pp7[0], pp6[1]);
    half_adder HA6(s6, c6, pp7[1], pp6[2]);
    half_adder HA7(s7, c7, pp7[2], pp6[3]);
    half_adder HA8(s8, c8, pp7[3], pp6[4]);
    half_adder HA9(s9, c9, pp7[4], pp6[5]);
    half_adder HA10(s10, c10, pp7[5], pp6[6]);
    half_adder HA11(s11, c11, pp7[6], pp6[7]);


    /*Stage 2*/
    half_adder HA12(s12, c12, s1, pp1[2]);
    half_adder HA13(s13, c13, s2, pp2[2]);
    half_adder HA14(s14, c14, s3, pp3[2]);
    half_adder HA15(s15, c15, s4, pp4[2]);
    half_adder HA16(s16, c16, s5, pp5[2]);
    half_adder HA17(s17, c17, s6, pp5[3]);
    half_adder HA18(s18, c18, s7, pp5[4]);
    half_adder HA19(s19, c19, s8, pp5[5]);
    half_adder HA20(s20, c20, s9, pp5[6]);
    half_adder HA21(s21, c21, s10, pp5[7]);
    half_adder HA22(s22, c22, s11, c10);
    half_adder HA23(s23, c23, pp7[7], c11);


    /*Stage 3*/
    half_adder HA24(s24, c24, s12, pp0[3]);
    half_adder HA25(s25, c25, s13, pp1[3]);
    half_adder HA26(s26, c26, s14, pp2[3]);
    half_adder HA27(s27, c27, s15, pp3[3]);
    half_adder HA28(s28, c28, s16, pp4[3]);
    half_adder HA29(s29, c29, s17, pp4[4]);
    half_adder HA30(s30, c30, s18, pp4[5]);
    half_adder HA31(s31, c31, s19, pp4[6]);
    half_adder HA32(s32, c32, s20, pp4[7]);
    half_adder HA33(s33, c33, s21, c9);
    half_adder HA34(s34, c34, s22, c21);
    half_adder HA35(s35, c35, s23, c22);


    /*Stage 4*/
    half_adder HA36(s36, c36, s25, pp0[4]);
    half_adder HA37(s37, c37, s26, pp1[4]);
    half_adder HA38(s38, c38, s27, pp2[4]);
    half_adder HA39(s39, c39, s28, pp3[4]);
    half_adder HA40(s40, c40, s29, pp3[5]);
    half_adder HA41(s41, c41, s30, pp3[6]);
    half_adder HA42(s42, c42, s31, pp3[7]);
    half_adder HA43(s43, c43, s32, c8);
    half_adder HA44(s44, c44, s33, c32);
    half_adder HA45(s45, c45, s34, c33);
    half_adder HA46(s46, c46, s35, c34);
    half_adder HA47(s47, c47, c35, c23);


    /*Stage 5*/
    half_adder HA48(s48, c48, s36, c24);
    half_adder HA49(s49, c49, s37, pp0[5]);
    half_adder HA50(s50, c50, s38, pp1[5]);
    half_adder HA51(s51, c51, s39, pp2[5]);
    half_adder HA52(s52, c52, s40, pp2[6]);
    half_adder HA53(s53, c53, s41, pp2[7]);
    half_adder HA54(s54, c54, s42, c7);
    half_adder HA55(s55, c55, s43, c42);
    half_adder HA56(s56, c56, s44, c43);
    half_adder HA57(s57, c57, s45, c44);
    half_adder HA58(s58, c58, s46, c45);
    half_adder HA59(s59, c59, s47, c46);


    /*Stage 6*/
    half_adder HA60(s60, c60, s48, c12);
    half_adder HA61(s61, c61, s49, c48);
    half_adder HA62(s62, c62, s50, pp0[6]);
    half_adder HA63(s63, c63, s51, pp1[6]);
    half_adder HA64(s64, c64, s52, pp1[7]);
    half_adder HA65(s65, c65, s53, c6);
    half_adder HA66(s66, c66, s54, c53);
    half_adder HA67(s67, c67, s55, c54);
    half_adder HA68(s68, c68, s56, c55);
    half_adder HA69(s69, c69, s57, c56);
    half_adder HA70(s70, c70, s58, c57);
    half_adder HA71(s71, c71, s59, c58);


    /*Stage 7*/
    half_adder HA72(s72, c72, s61, c60);
    half_adder HA73(s73, c73, s62, c61);
    half_adder HA74(s74, c74, s63, pp0[7]);
    half_adder HA75(s75, c75, s64, c63);
    half_adder HA76(s76, c76, s65, c64);
    half_adder HA77(s77, c77, s66, c65);
    half_adder HA78(s78, c78, s67, c66);
    half_adder HA79(s79, c79, s68, c67);
    half_adder HA80(s80, c80, s69, c68);
    half_adder HA81(s81, c81, s70, c69);
    half_adder HA82(s82, c82, s71, c70);


    /*Stage 8*/
    half_adder HA83(s83, c83, s72, c36);
    half_adder HA84(s84, c84, s73, c72);
    half_adder HA85(s85, c85, s74, c73);
    half_adder HA86(s86, c86, s75, c74);
    half_adder HA87(s87, c87, s76, c75);
    half_adder HA88(s88, c88, s77, c76);
    half_adder HA89(s89, c89, s78, c77);
    half_adder HA90(s90, c90, s79, c78);
    half_adder HA91(s91, c91, s80, c79);
    half_adder HA92(s92, c92, s81, c80);
    half_adder HA93(s93, c93, s82, c81);


    /*Stage 9*/
    half_adder HA94(s94, c94, s83, c25);
    half_adder HA95(s95, c95, s84, c83);
    half_adder HA96(s96, c96, s85, c84);
    half_adder HA97(s97, c97, s86, c85);
    half_adder HA98(s98, c98, s87, c86);
    half_adder HA99(s99, c99, s88, c87);
    half_adder HA100(s100, c100, s89, c88);
    half_adder HA101(s101, c101, s90, c89);
    half_adder HA102(s102, c102, s91, c90);
    half_adder HA103(s103, c103, s92, c91);
    half_adder HA104(s104, c104, s93, c92);


    /*Stage 10*/
    half_adder HA105(s105, c105, s94, c2);
    half_adder HA106(s106, c106, s95, c94);
    half_adder HA107(s107, c107, s96, c95);
    half_adder HA108(s108, c108, s97, c96);
    half_adder HA109(s109, c109, s98, c97);
    half_adder HA110(s110, c110, s99, c98);
    half_adder HA111(s111, c111, s100, c99);
    half_adder HA112(s112, c112, s101, c20);
    half_adder HA113(s113, c113, s102, c101);
    half_adder HA114(s114, c114, s103, c102);
    half_adder HA115(s115, c115, s104, c103);


    /*Stage 11*/
    half_adder HA116(s116, c116, s106, c49);
    half_adder HA117(s117, c117, s107, c62);
    half_adder HA118(s118, c118, s108, c51);
    half_adder HA119(s119, c119, s109, c52);
    half_adder HA120(s120, c120, s110, c41);
    half_adder HA121(s121, c121, s111, c31);
    half_adder HA122(s122, c122, s112, c111);
    half_adder HA123(s123, c123, s113, c112);
    half_adder HA124(s124, c124, s114, c113);
    half_adder HA125(s125, c125, s115, c114);


    /*Stage 12*/
    half_adder HA126(s126, c126, s116, c37);
    half_adder HA127(s127, c127, s117, c50);
    half_adder HA128(s128, c128, s118, c5);
    half_adder HA129(s129, c129, s119, c40);
    half_adder HA130(s130, c130, s120, c30);
    half_adder HA131(s131, c131, s121, c19);
    half_adder HA132(s132, c132, s122, c121);
    half_adder HA133(s133, c133, s123, c122);
    half_adder HA134(s134, c134, s124, c123);
    half_adder HA135(s135, c135, s125, c124);


    /*Stage 13*/
    half_adder HA136(s136, c136, s126, c3);
    half_adder HA137(s137, c137, s127, c4);
    half_adder HA138(s138, c138, s128, c39);
    half_adder HA139(s139, c139, s129, c29);
    half_adder HA140(s140, c140, s130, c18);
    half_adder HA141(s141, c141, s131, c130);
    half_adder HA142(s142, c142, s132, c131);
    half_adder HA143(s143, c143, s133, c132);
    half_adder HA144(s144, c144, s134, c133);
    half_adder HA145(s145, c145, s135, c134);


    /*Stage 14*/
    half_adder HA146(s146, c146, s136, c26);
    half_adder HA147(s147, c147, s137, c38);
    half_adder HA148(s148, c148, s138, c28);
    half_adder HA149(s149, c149, s139, c17);
    half_adder HA150(s150, c150, s140, c139);
    half_adder HA151(s151, c151, s141, c140);
    half_adder HA152(s152, c152, s142, c141);
    half_adder HA153(s153, c153, s143, c142);
    half_adder HA154(s154, c154, s144, c143);
    half_adder HA155(s155, c155, s145, c144);


    /*Stage 15*/
    half_adder HA156(s156, c156, s146, c14);
    half_adder HA157(s157, c157, s147, c27);
    half_adder HA158(s158, c158, s148, c16);
    half_adder HA159(s159, c159, s149, c148);
    half_adder HA160(s160, c160, s150, c149);
    half_adder HA161(s161, c161, s151, c150);
    half_adder HA162(s162, c162, s152, c151);
    half_adder HA163(s163, c163, s153, c152);
    half_adder HA164(s164, c164, s154, c153);
    half_adder HA165(s165, c165, s155, c154);


    /*Stage 16*/
    half_adder HA166(s166, c166, s157, c156);
    half_adder HA167(s167, c167, s158, c157);
    half_adder HA168(s168, c168, s159, c158);
    half_adder HA169(s169, c169, s160, c159);
    half_adder HA170(s170, c170, s161, c160);
    half_adder HA171(s171, c171, s162, c161);
    half_adder HA172(s172, c172, s163, c162);
    half_adder HA173(s173, c173, s164, c163);
    half_adder HA174(s174, c174, s165, c164);


    /*Stage 17*/
    half_adder HA175(s175, c175, s166, c15);
    half_adder HA176(s176, c176, s167, c166);
    half_adder HA177(s177, c177, s168, c167);
    half_adder HA178(s178, c178, s169, c168);
    half_adder HA179(s179, c179, s170, c169);
    half_adder HA180(s180, c180, s171, c170);
    half_adder HA181(s181, c181, s172, c171);
    half_adder HA182(s182, c182, s173, c172);
    half_adder HA183(s183, c183, s174, c173);


    /*Stage 18*/
    half_adder HA184(s184, c184, s175, c146);
    half_adder HA185(s185, c185, s176, c175);
    half_adder HA186(s186, c186, s177, c176);
    half_adder HA187(s187, c187, s178, c177);
    half_adder HA188(s188, c188, s179, c178);
    half_adder HA189(s189, c189, s180, c179);
    half_adder HA190(s190, c190, s181, c180);
    half_adder HA191(s191, c191, s182, c181);
    half_adder HA192(s192, c192, s183, c182);


    /*Stage 19*/
    half_adder HA193(s193, c193, s184, c136);
    half_adder HA194(s194, c194, s185, c184);
    half_adder HA195(s195, c195, s186, c185);
    half_adder HA196(s196, c196, s187, c186);
    half_adder HA197(s197, c197, s188, c187);
    half_adder HA198(s198, c198, s189, c188);
    half_adder HA199(s199, c199, s190, c189);
    half_adder HA200(s200, c200, s191, c190);
    half_adder HA201(s201, c201, s192, c191);


    /*Stage 20*/
    half_adder HA202(s202, c202, s193, c126);
    half_adder HA203(s203, c203, s194, c193);
    half_adder HA204(s204, c204, s195, c194);
    half_adder HA205(s205, c205, s196, c195);
    half_adder HA206(s206, c206, s197, c196);
    half_adder HA207(s207, c207, s198, c197);
    half_adder HA208(s208, c208, s199, c198);
    half_adder HA209(s209, c209, s200, c199);
    half_adder HA210(s210, c210, s201, c200);


    /*Stage 21*/
    half_adder HA211(s211, c211, s202, c116);
    half_adder HA212(s212, c212, s203, c202);
    half_adder HA213(s213, c213, s204, c203);
    half_adder HA214(s214, c214, s205, c204);
    half_adder HA215(s215, c215, s206, c205);
    half_adder HA216(s216, c216, s207, c206);
    half_adder HA217(s217, c217, s208, c207);
    half_adder HA218(s218, c218, s209, c208);
    half_adder HA219(s219, c219, s210, c209);


    /*Stage 22*/
    half_adder HA220(s220, c220, s212, c211);
    half_adder HA221(s221, c221, s213, c212);
    half_adder HA222(s222, c222, s214, c213);
    half_adder HA223(s223, c223, s215, c214);
    half_adder HA224(s224, c224, s216, c215);
    half_adder HA225(s225, c225, s217, c216);
    half_adder HA226(s226, c226, s218, c217);
    half_adder HA227(s227, c227, s219, c218);


    /*Stage 23*/
    half_adder HA228(s228, c228, s220, c147);
    half_adder HA229(s229, c229, s221, c220);
    half_adder HA230(s230, c230, s222, c221);
    half_adder HA231(s231, c231, s223, c222);
    half_adder HA232(s232, c232, s224, c223);
    half_adder HA233(s233, c233, s225, c224);
    half_adder HA234(s234, c234, s226, c225);
    half_adder HA235(s235, c235, s227, c226);


    /*Stage 24*/
    half_adder HA236(s236, c236, s228, c137);
    half_adder HA237(s237, c237, s229, c228);
    half_adder HA238(s238, c238, s230, c229);
    half_adder HA239(s239, c239, s231, c230);
    half_adder HA240(s240, c240, s232, c231);
    half_adder HA241(s241, c241, s233, c232);
    half_adder HA242(s242, c242, s234, c233);
    half_adder HA243(s243, c243, s235, c234);


    /*Stage 25*/
    half_adder HA244(s244, c244, s236, c127);
    half_adder HA245(s245, c245, s237, c236);
    half_adder HA246(s246, c246, s238, c237);
    half_adder HA247(s247, c247, s239, c238);
    half_adder HA248(s248, c248, s240, c239);
    half_adder HA249(s249, c249, s241, c240);
    half_adder HA250(s250, c250, s242, c241);
    half_adder HA251(s251, c251, s243, c242);


    /*Stage 26*/
    half_adder HA252(s252, c252, s244, c117);
    half_adder HA253(s253, c253, s245, c244);
    half_adder HA254(s254, c254, s246, c245);
    half_adder HA255(s255, c255, s247, c246);
    half_adder HA256(s256, c256, s248, c247);
    half_adder HA257(s257, c257, s249, c248);
    half_adder HA258(s258, c258, s250, c249);
    half_adder HA259(s259, c259, s251, c250);


    /*Stage 27*/
    half_adder HA260(s260, c260, s253, c252);
    half_adder HA261(s261, c261, s254, c253);
    half_adder HA262(s262, c262, s255, c254);
    half_adder HA263(s263, c263, s256, c255);
    half_adder HA264(s264, c264, s257, c256);
    half_adder HA265(s265, c265, s258, c257);
    half_adder HA266(s266, c266, s259, c258);


    /*Stage 28*/
    half_adder HA267(s267, c267, s260, c138);
    half_adder HA268(s268, c268, s261, c260);
    half_adder HA269(s269, c269, s262, c261);
    half_adder HA270(s270, c270, s263, c262);
    half_adder HA271(s271, c271, s264, c263);
    half_adder HA272(s272, c272, s265, c264);
    half_adder HA273(s273, c273, s266, c265);


    /*Stage 29*/
    half_adder HA274(s274, c274, s267, c128);
    half_adder HA275(s275, c275, s268, c267);
    half_adder HA276(s276, c276, s269, c268);
    half_adder HA277(s277, c277, s270, c269);
    half_adder HA278(s278, c278, s271, c270);
    half_adder HA279(s279, c279, s272, c271);
    half_adder HA280(s280, c280, s273, c272);


    /*Stage 30*/
    half_adder HA281(s281, c281, s274, c118);
    half_adder HA282(s282, c282, s275, c274);
    half_adder HA283(s283, c283, s276, c275);
    half_adder HA284(s284, c284, s277, c276);
    half_adder HA285(s285, c285, s278, c277);
    half_adder HA286(s286, c286, s279, c278);
    half_adder HA287(s287, c287, s280, c279);


    /*Stage 31*/
    half_adder HA288(s288, c288, s282, c281);
    half_adder HA289(s289, c289, s283, c282);
    half_adder HA290(s290, c290, s284, c283);
    half_adder HA291(s291, c291, s285, c284);
    half_adder HA292(s292, c292, s286, c285);
    half_adder HA293(s293, c293, s287, c286);


    /*Stage 32*/
    half_adder HA294(s294, c294, s288, c129);
    half_adder HA295(s295, c295, s289, c288);
    half_adder HA296(s296, c296, s290, c289);
    half_adder HA297(s297, c297, s291, c290);
    half_adder HA298(s298, c298, s292, c291);
    half_adder HA299(s299, c299, s293, c292);


    /*Stage 33*/
    half_adder HA300(s300, c300, s294, c119);
    half_adder HA301(s301, c301, s295, c294);
    half_adder HA302(s302, c302, s296, c295);
    half_adder HA303(s303, c303, s297, c296);
    half_adder HA304(s304, c304, s298, c297);
    half_adder HA305(s305, c305, s299, c298);


    /*Stage 34*/
    half_adder HA306(s306, c306, s301, c300);
    half_adder HA307(s307, c307, s302, c301);
    half_adder HA308(s308, c308, s303, c302);
    half_adder HA309(s309, c309, s304, c303);
    half_adder HA310(s310, c310, s305, c304);


    /*Stage 35*/
    half_adder HA311(s311, c311, s306, c120);
    half_adder HA312(s312, c312, s307, c306);
    half_adder HA313(s313, c313, s308, c307);
    half_adder HA314(s314, c314, s309, c308);
    half_adder HA315(s315, c315, s310, c309);


    /*Stage 36*/
    half_adder HA316(s316, c316, s312, c311);
    half_adder HA317(s317, c317, s313, c312);
    half_adder HA318(s318, c318, s314, c313);
    half_adder HA319(s319, c319, s315, c314);


    wire[14:0] s, in_1, in_2;
    wire c;
    assign in_1 = {pp1[0],s0,s24,s60,s105,s156,s211,s252,s281,s300,s311,s316,s317,s318,c318};
    assign in_2 = {pp0[1],pp0[2],c0,c1,c13,c105,c106,c107,c108,c109,c110,c100,c316,c317,s319};
    kogge_stone_15 KS(s, c, in_1, in_2);
    assign product[0]  = pp0[0];
    assign product[1]  = s[0];
    assign product[2]  = s[1];
    assign product[3]  = s[2];
    assign product[4]  = s[3];
    assign product[5]  = s[4];
    assign product[6]  = s[5];
    assign product[7]  = s[6];
    assign product[8]  = s[7];
    assign product[9]  = s[8];
    assign product[10] = s[9];
    assign product[11] = s[10];
    assign product[12] = s[11];
    assign product[13] = s[12];
    assign product[14] = s[13];
    assign product[15] = s[14];

endmodule

module half_adder(output wire sum,
                  output wire cout,
                  input wire in1,
                  input wire in2);
    xor(sum, in1, in2);
    and(cout, in1, in2);
endmodule


module kogge_stone_15(sum, cout, in1, in2);
    input [14:0] in1, in2; //input
    output [14:0] sum; //output
    output cout; //carry-out
    wire [14:0] G_Z, P_Z, //wires
    G_A, P_A,
    G_B, P_B,
    G_C, P_C,
    G_D, P_D,
    G_E, P_E,
    G_F, P_F;

    assign P_Z[0]  = in1[14] ^ in2[14];
    assign P_Z[1]  = in1[13] ^ in2[13];
    assign P_Z[2]  = in1[12] ^ in2[12];
    assign P_Z[3]  = in1[11] ^ in2[11];
    assign P_Z[4]  = in1[10] ^ in2[10];
    assign P_Z[5] = in1[9]  ^ in2[9];
    assign P_Z[6] = in1[8]  ^ in2[8];
    assign P_Z[7] = in1[7]  ^ in2[7];
    assign P_Z[8] = in1[6]  ^ in2[6];
    assign P_Z[9] = in1[5]  ^ in2[5];
    assign P_Z[10] = in1[4]  ^ in2[4];
    assign P_Z[11] = in1[3]  ^ in2[3];
    assign P_Z[12] = in1[2]  ^ in2[2];
    assign P_Z[13] = in1[1]  ^ in2[1];
    assign P_Z[14] = in1[0]  ^ in2[0];

    assign G_Z[0]  = in1[14] & in2[14];
    assign G_Z[1]  = in1[13] & in2[13];
    assign G_Z[2]  = in1[12] & in2[12];
    assign G_Z[3]  = in1[11] & in2[11];
    assign G_Z[4]  = in1[10] & in2[10];
    assign G_Z[5] = in1[9]  & in2[9];
    assign G_Z[6] = in1[8]  & in2[8];
    assign G_Z[7] = in1[7]  & in2[7];
    assign G_Z[8] = in1[6]  & in2[6];
    assign G_Z[9] = in1[5]  & in2[5];
    assign G_Z[10] = in1[4]  & in2[4];
    assign G_Z[11] = in1[3]  & in2[3];
    assign G_Z[12] = in1[2]  & in2[2];
    assign G_Z[13] = in1[1]  & in2[1];
    assign G_Z[14] = in1[0]  & in2[0];
    
    /*level 1*/
    assign G_A[0] = G_Z[0];
    black_cell level_1A(G_Z[0],  P_Z[1],  G_Z[1],  P_Z[0],  G_A[1],  P_A[1]);
    black_cell level_2A(G_Z[1],  P_Z[2],  G_Z[2],  P_Z[1],  G_A[2],  P_A[2]);
    black_cell level_3A(G_Z[2],  P_Z[3],  G_Z[3],  P_Z[2],  G_A[3],  P_A[3]);
    black_cell level_4A(G_Z[3],  P_Z[4],  G_Z[4],  P_Z[3],  G_A[4],  P_A[4]);
    black_cell level_5A(G_Z[4],  P_Z[5],  G_Z[5],  P_Z[4],  G_A[5],  P_A[5]);
    black_cell level_6A(G_Z[5],  P_Z[6],  G_Z[6],  P_Z[5],  G_A[6],  P_A[6]);
    black_cell level_7A(G_Z[6],  P_Z[7],  G_Z[7],  P_Z[6],  G_A[7],  P_A[7]);
    black_cell level_8A(G_Z[7],  P_Z[8],  G_Z[8],  P_Z[7],  G_A[8],  P_A[8]);
    black_cell level_9A(G_Z[8],  P_Z[9],  G_Z[9],  P_Z[8],  G_A[9],  P_A[9]);
    black_cell level_AA(G_Z[9],  P_Z[10], G_Z[10], P_Z[9],  G_A[10], P_A[10]);
    black_cell level_BA(G_Z[10], P_Z[11], G_Z[11], P_Z[10], G_A[11], P_A[11]);
    black_cell level_CA(G_Z[11], P_Z[12], G_Z[12], P_Z[11], G_A[12], P_A[12]);
    black_cell level_DA(G_Z[12], P_Z[13], G_Z[13], P_Z[12], G_A[13], P_A[13]);
    black_cell level_EA(G_Z[13], P_Z[14], G_Z[14], P_Z[13], G_A[14], P_A[14]);

    /*level 2*/
    assign G_B[1] = G_A[1];
    gray_cell level_2B(G_A[0],   P_A[2],  G_A[2],  G_B[2]);
    black_cell level_3B(G_A[1],  P_A[3],  G_A[3],  P_A[1],  G_B[3],  P_B[3]);
    black_cell level_4B(G_A[2],  P_A[4],  G_A[4],  P_A[2],  G_B[4],  P_B[4]);
    black_cell level_5B(G_A[3],  P_A[5],  G_A[5],  P_A[3],  G_B[5],  P_B[5]);
    black_cell level_6B(G_A[4],  P_A[6],  G_A[6],  P_A[4],  G_B[6],  P_B[6]);
    black_cell level_7B(G_A[5],  P_A[7],  G_A[7],  P_A[5],  G_B[7],  P_B[7]);
    black_cell level_8B(G_A[6],  P_A[8],  G_A[8],  P_A[6],  G_B[8],  P_B[8]);
    black_cell level_9B(G_A[7],  P_A[9],  G_A[9],  P_A[7],  G_B[9],  P_B[9]);
    black_cell level_AB(G_A[8],  P_A[10], G_A[10], P_A[8],  G_B[10], P_B[10]);
    black_cell level_BB(G_A[9],  P_A[11], G_A[11], P_A[9],  G_B[11], P_B[11]);
    black_cell level_CB(G_A[10], P_A[12], G_A[12], P_A[10], G_B[12], P_B[12]);
    black_cell level_DB(G_A[11], P_A[13], G_A[13], P_A[11], G_B[13], P_B[13]);
    black_cell level_EB(G_A[12], P_A[14], G_A[14], P_A[12], G_B[14], P_B[14]);

    /*level 3*/
    assign G_C[3] = G_B[3];
    gray_cell level_4C(G_A[0],   P_B[4],  G_B[4],  G_C[4]);
    gray_cell level_5C(G_B[1],   P_B[5],  G_B[5],  G_C[5]);
    gray_cell level_6C(G_B[2],   P_B[6],  G_B[6],  G_C[6]);
    black_cell level_7C(G_B[3],  P_B[7],  G_B[7],  P_B[3],  G_C[7],  P_C[7]);
    black_cell level_8C(G_B[4],  P_B[8],  G_B[8],  P_B[4],  G_C[8],  P_C[8]);
    black_cell level_9C(G_B[5],  P_B[9],  G_B[9],  P_B[5],  G_C[9],  P_C[9]);
    black_cell level_AC(G_B[6],  P_B[10], G_B[10], P_B[6],  G_C[10], P_C[10]);
    black_cell level_BC(G_B[7],  P_B[11], G_B[11], P_B[7],  G_C[11], P_C[11]);
    black_cell level_CC(G_B[8],  P_B[12], G_B[12], P_B[8],  G_C[12], P_C[12]);
    black_cell level_DC(G_B[9],  P_B[13], G_B[13], P_B[9],  G_C[13], P_C[13]);
    black_cell level_EC(G_B[10], P_B[14], G_B[14], P_B[10], G_C[14], P_C[14]);
    
    /*level 4*/
    assign G_D[7] = G_C[7];
    gray_cell level_8D(G_A[0],    P_C[8],   G_C[8],            G_D[8]);
    gray_cell level_9D(G_B[1],    P_C[9],   G_C[9],            G_D[9]);
    gray_cell level_AD(G_B[2],    P_C[10],  G_C[10],           G_D[10]);
    gray_cell level_BD(G_C[3],    P_C[11],  G_C[11],           G_D[11]);
    gray_cell level_CD(G_C[4],    P_C[12],  G_C[12],           G_D[12]);
    gray_cell level_DD(G_C[5],    P_C[13],  G_C[13],           G_D[13]);
    gray_cell level_ED(G_C[6],    P_C[14],  G_C[14],           cout);

    /*outputs*/
    assign sum[0]  =           P_Z[0];
    assign sum[1]  = G_A[0]  ^ P_Z[1];
    assign sum[2]  = G_B[1]  ^ P_Z[2];
    assign sum[3]  = G_B[2]  ^ P_Z[3];
    assign sum[4]  = G_C[3]  ^ P_Z[4];
    assign sum[5]  = G_C[4]  ^ P_Z[5];
    assign sum[6]  = G_C[5]  ^ P_Z[6];
    assign sum[7]  = G_C[6]  ^ P_Z[7];
    assign sum[8]  = G_D[7]  ^ P_Z[8];
    assign sum[9]  = G_D[8]  ^ P_Z[9];
    assign sum[10] = G_D[9]  ^ P_Z[10];
    assign sum[11] = G_D[10] ^ P_Z[11];
    assign sum[12] = G_D[11] ^ P_Z[12];
    assign sum[13] = G_D[12] ^ P_Z[13];
    assign sum[14] = G_D[13] ^ P_Z[14];
endmodule

module gray_cell(Gk_j, Pi_k, Gi_k, G);
    input Gk_j, Pi_k, Gi_k;
    output G;
    wire Y;
    and(Y, Gk_j, Pi_k);
    or(G, Y, Gi_k);
endmodule

module black_cell(Gk_j, Pi_k, Gi_k, Pk_j, G, P);
    input Gk_j, Pi_k, Gi_k, Pk_j;
    output G, P;
    wire Y;
    and(Y, Gk_j, Pi_k);
    or(G, Gi_k, Y);
    and(P, Pk_j, Pi_k);
endmodule
