module multiplier_16bits_version0(product, A, B);

    /* This implementation follows the Dadda multiplier with HA and FAs used
     * for partial product reduction.
     * However, the final two rows are added using a kogge-stone adder of
     * length 
     * Area: 
     * Power: mW
     * Timing: ns
     */

    input [15:0] A, B;
    output [31:0] product;

    wire [15:0] pp0, pp1, pp2, pp3, pp4, pp5, pp6, pp7, pp8, pp9, pp10, pp11, pp12, pp13, pp14, pp15;

    assign pp0  = A[0]  ? B : 16'b0000000000000000;
    assign pp1  = A[1]  ? B : 16'b0000000000000000;
    assign pp2  = A[2]  ? B : 16'b0000000000000000;
    assign pp3  = A[3]  ? B : 16'b0000000000000000;
    assign pp4  = A[4]  ? B : 16'b0000000000000000;
    assign pp5  = A[5]  ? B : 16'b0000000000000000;
    assign pp6  = A[6]  ? B : 16'b0000000000000000;
    assign pp7  = A[7]  ? B : 16'b0000000000000000;
    assign pp8  = A[8]  ? B : 16'b0000000000000000;
    assign pp9  = A[9]  ? B : 16'b0000000000000000;
    assign pp10 = A[10] ? B : 16'b0000000000000000;
    assign pp11 = A[11] ? B : 16'b0000000000000000;
    assign pp12 = A[12] ? B : 16'b0000000000000000;
    assign pp13 = A[13] ? B : 16'b0000000000000000;
    assign pp14 = A[14] ? B : 16'b0000000000000000;
    assign pp15 = A[15] ? B : 16'b0000000000000000;

    assign product[0] = pp0[0];

        wire [240:0] S;
	wire [240:0] Cout;
	Half_Adder HA1 (pp0[13], pp1[12], S[1], Cout[1]);
	Full_Adder FA1 (pp0[14], pp1[13], pp2[12], S[2], Cout[2]);
	Half_Adder HA2 (pp3[11], pp4[10], S[3], Cout[3]);
	Full_Adder FA2 (pp0[15], pp1[14], pp2[13], S[4], Cout[4]);
	Full_Adder FA3 (pp3[12], pp4[11], pp5[10], S[5], Cout[5]);
	Half_Adder HA3 (pp6[9], pp7[8], S[6], Cout[6]);
	Full_Adder FA4 (pp1[15], pp2[14], pp3[13], S[7], Cout[7]);
	Full_Adder FA5 (pp4[12], pp5[11], pp6[10], S[8], Cout[8]);
	Half_Adder HA4 (pp7[9], pp8[8], S[9], Cout[9]);
	Full_Adder FA6 (pp2[15], pp3[14], pp4[13], S[10], Cout[10]);
	Full_Adder FA7 (pp5[12], pp6[11], pp7[10], S[11], Cout[11]);
	Full_Adder FA8 (pp3[15], pp4[14], pp5[13], S[12], Cout[12]);
	Half_Adder HA5 (pp0[9], pp1[8], S[13], Cout[13]);
	Full_Adder FA9 (pp0[10], pp1[9], pp2[8], S[14], Cout[14]);
	Half_Adder HA6 (pp3[7], pp4[6], S[15], Cout[15]);
	Full_Adder FA10 (pp0[11], pp1[10], pp2[9], S[16], Cout[16]);
	Full_Adder FA11 (pp3[8], pp4[7], pp5[6], S[17], Cout[17]);
	Half_Adder HA7 (pp6[5], pp7[4], S[18], Cout[18]);
	Full_Adder FA12 (pp0[12], pp1[11], pp2[10], S[19], Cout[19]);
	Full_Adder FA13 (pp3[9], pp4[8], pp5[7], S[20], Cout[20]);
	Full_Adder FA14 (pp6[6], pp7[5], pp8[4], S[21], Cout[21]);
	Half_Adder HA8 (pp9[3], pp10[2], S[22], Cout[22]);
	Full_Adder FA15 (pp2[11], pp3[10], pp4[9], S[23], Cout[23]);
	Full_Adder FA16 (pp5[8], pp6[7], pp7[6], S[24], Cout[24]);
	Full_Adder FA17 (pp8[5], pp9[4], pp10[3], S[25], Cout[25]);
	Full_Adder FA18 (pp11[2], pp12[1], pp13[0], S[26], Cout[26]);
	Full_Adder FA19 (pp5[9], pp6[8], pp7[7], S[27], Cout[27]);
	Full_Adder FA20 (pp8[6], pp9[5], pp10[4], S[28], Cout[28]);
	Full_Adder FA21 (pp11[3], pp12[2], pp13[1], S[29], Cout[29]);
	Full_Adder FA22 (pp14[0], Cout[1], S[2], S[30], Cout[30]);
	Full_Adder FA23 (pp8[7], pp9[6], pp10[5], S[31], Cout[31]);
	Full_Adder FA24 (pp11[4], pp12[3], pp13[2], S[32], Cout[32]);
	Full_Adder FA25 (pp14[1], pp15[0], Cout[2], S[33], Cout[33]);
	Full_Adder FA26 (Cout[3], S[4], S[5], S[34], Cout[34]);
	Full_Adder FA27 (pp9[7], pp10[6], pp11[5], S[35], Cout[35]);
	Full_Adder FA28 (pp12[4], pp13[3], pp14[2], S[36], Cout[36]);
	Full_Adder FA29 (pp15[1], Cout[4], Cout[5], S[37], Cout[37]);
	Full_Adder FA30 (Cout[6], S[7], S[8], S[38], Cout[38]);
	Full_Adder FA31 (pp8[9], pp9[8], pp10[7], S[39], Cout[39]);
	Full_Adder FA32 (pp11[6], pp12[5], pp13[4], S[40], Cout[40]);
	Full_Adder FA33 (pp14[3], pp15[2], Cout[7], S[41], Cout[41]);
	Full_Adder FA34 (Cout[8], Cout[9], S[10], S[42], Cout[42]);
	Full_Adder FA35 (pp6[12], pp7[11], pp8[10], S[43], Cout[43]);
	Full_Adder FA36 (pp9[9], pp10[8], pp11[7], S[44], Cout[44]);
	Full_Adder FA37 (pp12[6], pp13[5], pp14[4], S[45], Cout[45]);
	Full_Adder FA38 (pp15[3], Cout[10], Cout[11], S[46], Cout[46]);
	Full_Adder FA39 (pp4[15], pp5[14], pp6[13], S[47], Cout[47]);
	Full_Adder FA40 (pp7[12], pp8[11], pp9[10], S[48], Cout[48]);
	Full_Adder FA41 (pp10[9], pp11[8], pp12[7], S[49], Cout[49]);
	Full_Adder FA42 (pp13[6], pp14[5], pp15[4], S[50], Cout[50]);
	Full_Adder FA43 (pp5[15], pp6[14], pp7[13], S[51], Cout[51]);
	Full_Adder FA44 (pp8[12], pp9[11], pp10[10], S[52], Cout[52]);
	Full_Adder FA45 (pp11[9], pp12[8], pp13[7], S[53], Cout[53]);
	Full_Adder FA46 (pp6[15], pp7[14], pp8[13], S[54], Cout[54]);
	Full_Adder FA47 (pp9[12], pp10[11], pp11[10], S[55], Cout[55]);
	Full_Adder FA48 (pp7[15], pp8[14], pp9[13], S[56], Cout[56]);
	Half_Adder HA9 (pp0[6], pp1[5], S[57], Cout[57]);
	Full_Adder FA49 (pp0[7], pp1[6], pp2[5], S[58], Cout[58]);
	Half_Adder HA10 (pp3[4], pp4[3], S[59], Cout[59]);
	Full_Adder FA50 (pp0[8], pp1[7], pp2[6], S[60], Cout[60]);
	Full_Adder FA51 (pp3[5], pp4[4], pp5[3], S[61], Cout[61]);
	Half_Adder HA11 (pp6[2], pp7[1], S[62], Cout[62]);
	Full_Adder FA52 (pp2[7], pp3[6], pp4[5], S[63], Cout[63]);
	Full_Adder FA53 (pp5[4], pp6[3], pp7[2], S[64], Cout[64]);
	Full_Adder FA54 (pp8[1], pp9[0], S[13], S[65], Cout[65]);
	Full_Adder FA55 (pp5[5], pp6[4], pp7[3], S[66], Cout[66]);
	Full_Adder FA56 (pp8[2], pp9[1], pp10[0], S[67], Cout[67]);
	Full_Adder FA57 (Cout[13], S[14], S[15], S[68], Cout[68]);
	Full_Adder FA58 (pp8[3], pp9[2], pp10[1], S[69], Cout[69]);
	Full_Adder FA59 (pp11[0], Cout[14], Cout[15], S[70], Cout[70]);
	Full_Adder FA60 (S[16], S[17], S[18], S[71], Cout[71]);
	Full_Adder FA61 (pp11[1], pp12[0], Cout[16], S[72], Cout[72]);
	Full_Adder FA62 (Cout[17], Cout[18], S[19], S[73], Cout[73]);
	Full_Adder FA63 (S[20], S[21], S[22], S[74], Cout[74]);
	Full_Adder FA64 (S[1], Cout[19], Cout[20], S[75], Cout[75]);
	Full_Adder FA65 (Cout[21], Cout[22], S[23], S[76], Cout[76]);
	Full_Adder FA66 (S[24], S[25], S[26], S[77], Cout[77]);
	Full_Adder FA67 (S[3], Cout[23], Cout[24], S[78], Cout[78]);
	Full_Adder FA68 (Cout[25], Cout[26], S[27], S[79], Cout[79]);
	Full_Adder FA69 (S[28], S[29], S[30], S[80], Cout[80]);
	Full_Adder FA70 (S[6], Cout[27], Cout[28], S[81], Cout[81]);
	Full_Adder FA71 (Cout[29], Cout[30], S[31], S[82], Cout[82]);
	Full_Adder FA72 (S[32], S[33], S[34], S[83], Cout[83]);
	Full_Adder FA73 (S[9], Cout[31], Cout[32], S[84], Cout[84]);
	Full_Adder FA74 (Cout[33], Cout[34], S[35], S[85], Cout[85]);
	Full_Adder FA75 (S[36], S[37], S[38], S[86], Cout[86]);
	Full_Adder FA76 (S[11], Cout[35], Cout[36], S[87], Cout[87]);
	Full_Adder FA77 (Cout[37], Cout[38], S[39], S[88], Cout[88]);
	Full_Adder FA78 (S[40], S[41], S[42], S[89], Cout[89]);
	Full_Adder FA79 (S[12], Cout[39], Cout[40], S[90], Cout[90]);
	Full_Adder FA80 (Cout[41], Cout[42], S[43], S[91], Cout[91]);
	Full_Adder FA81 (S[44], S[45], S[46], S[92], Cout[92]);
	Full_Adder FA82 (Cout[12], Cout[43], Cout[44], S[93], Cout[93]);
	Full_Adder FA83 (Cout[45], Cout[46], S[47], S[94], Cout[94]);
	Full_Adder FA84 (S[48], S[49], S[50], S[95], Cout[95]);
	Full_Adder FA85 (pp14[6], pp15[5], Cout[47], S[96], Cout[96]);
	Full_Adder FA86 (Cout[48], Cout[49], Cout[50], S[97], Cout[97]);
	Full_Adder FA87 (S[51], S[52], S[53], S[98], Cout[98]);
	Full_Adder FA88 (pp12[9], pp13[8], pp14[7], S[99], Cout[99]);
	Full_Adder FA89 (pp15[6], Cout[51], Cout[52], S[100], Cout[100]);
	Full_Adder FA90 (Cout[53], S[54], S[55], S[101], Cout[101]);
	Full_Adder FA91 (pp10[12], pp11[11], pp12[10], S[102], Cout[102]);
	Full_Adder FA92 (pp13[9], pp14[8], pp15[7], S[103], Cout[103]);
	Full_Adder FA93 (Cout[54], Cout[55], S[56], S[104], Cout[104]);
	Full_Adder FA94 (pp8[15], pp9[14], pp10[13], S[105], Cout[105]);
	Full_Adder FA95 (pp11[12], pp12[11], pp13[10], S[106], Cout[106]);
	Full_Adder FA96 (pp14[9], pp15[8], Cout[56], S[107], Cout[107]);
	Full_Adder FA97 (pp9[15], pp10[14], pp11[13], S[108], Cout[108]);
	Full_Adder FA98 (pp12[12], pp13[11], pp14[10], S[109], Cout[109]);
	Full_Adder FA99 (pp10[15], pp11[14], pp12[13], S[110], Cout[110]);
	Half_Adder HA12 (pp0[4], pp1[3], S[111], Cout[111]);
	Full_Adder FA100 (pp0[5], pp1[4], pp2[3], S[112], Cout[112]);
	Half_Adder HA13 (pp3[2], pp4[1], S[113], Cout[113]);
	Full_Adder FA101 (pp2[4], pp3[3], pp4[2], S[114], Cout[114]);
	Full_Adder FA102 (pp5[1], pp6[0], S[57], S[115], Cout[115]);
	Full_Adder FA103 (pp5[2], pp6[1], pp7[0], S[116], Cout[116]);
	Full_Adder FA104 (Cout[57], S[58], S[59], S[117], Cout[117]);
	Full_Adder FA105 (pp8[0], Cout[58], Cout[59], S[118], Cout[118]);
	Full_Adder FA106 (S[60], S[61], S[62], S[119], Cout[119]);
	Full_Adder FA107 (Cout[60], Cout[61], Cout[62], S[120], Cout[120]);
	Full_Adder FA108 (S[63], S[64], S[65], S[121], Cout[121]);
	Full_Adder FA109 (Cout[63], Cout[64], Cout[65], S[122], Cout[122]);
	Full_Adder FA110 (S[66], S[67], S[68], S[123], Cout[123]);
	Full_Adder FA111 (Cout[66], Cout[67], Cout[68], S[124], Cout[124]);
	Full_Adder FA112 (S[69], S[70], S[71], S[125], Cout[125]);
	Full_Adder FA113 (Cout[69], Cout[70], Cout[71], S[126], Cout[126]);
	Full_Adder FA114 (S[72], S[73], S[74], S[127], Cout[127]);
	Full_Adder FA115 (Cout[72], Cout[73], Cout[74], S[128], Cout[128]);
	Full_Adder FA116 (S[75], S[76], S[77], S[129], Cout[129]);
	Full_Adder FA117 (Cout[75], Cout[76], Cout[77], S[130], Cout[130]);
	Full_Adder FA118 (S[78], S[79], S[80], S[131], Cout[131]);
	Full_Adder FA119 (Cout[78], Cout[79], Cout[80], S[132], Cout[132]);
	Full_Adder FA120 (S[81], S[82], S[83], S[133], Cout[133]);
	Full_Adder FA121 (Cout[81], Cout[82], Cout[83], S[134], Cout[134]);
	Full_Adder FA122 (S[84], S[85], S[86], S[135], Cout[135]);
	Full_Adder FA123 (Cout[84], Cout[85], Cout[86], S[136], Cout[136]);
	Full_Adder FA124 (S[87], S[88], S[89], S[137], Cout[137]);
	Full_Adder FA125 (Cout[87], Cout[88], Cout[89], S[138], Cout[138]);
	Full_Adder FA126 (S[90], S[91], S[92], S[139], Cout[139]);
	Full_Adder FA127 (Cout[90], Cout[91], Cout[92], S[140], Cout[140]);
	Full_Adder FA128 (S[93], S[94], S[95], S[141], Cout[141]);
	Full_Adder FA129 (Cout[93], Cout[94], Cout[95], S[142], Cout[142]);
	Full_Adder FA130 (S[96], S[97], S[98], S[143], Cout[143]);
	Full_Adder FA131 (Cout[96], Cout[97], Cout[98], S[144], Cout[144]);
	Full_Adder FA132 (S[99], S[100], S[101], S[145], Cout[145]);
	Full_Adder FA133 (Cout[99], Cout[100], Cout[101], S[146], Cout[146]);
	Full_Adder FA134 (S[102], S[103], S[104], S[147], Cout[147]);
	Full_Adder FA135 (Cout[102], Cout[103], Cout[104], S[148], Cout[148]);
	Full_Adder FA136 (S[105], S[106], S[107], S[149], Cout[149]);
	Full_Adder FA137 (pp15[9], Cout[105], Cout[106], S[150], Cout[150]);
	Full_Adder FA138 (Cout[107], S[108], S[109], S[151], Cout[151]);
	Full_Adder FA139 (pp13[12], pp14[11], pp15[10], S[152], Cout[152]);
	Full_Adder FA140 (Cout[108], Cout[109], S[110], S[153], Cout[153]);
	Full_Adder FA141 (pp11[15], pp12[14], pp13[13], S[154], Cout[154]);
	Full_Adder FA142 (pp14[12], pp15[11], Cout[110], S[155], Cout[155]);
	Full_Adder FA143 (pp12[15], pp13[14], pp14[13], S[156], Cout[156]);
	Half_Adder HA14 (pp0[3], pp1[2], S[157], Cout[157]);
	Full_Adder FA144 (pp2[2], pp3[1], pp4[0], S[158], Cout[158]);
	Full_Adder FA145 (pp5[0], Cout[111], S[112], S[159], Cout[159]);
	Full_Adder FA146 (Cout[112], Cout[113], S[114], S[160], Cout[160]);
	Full_Adder FA147 (Cout[114], Cout[115], S[116], S[161], Cout[161]);
	Full_Adder FA148 (Cout[116], Cout[117], S[118], S[162], Cout[162]);
	Full_Adder FA149 (Cout[118], Cout[119], S[120], S[163], Cout[163]);
	Full_Adder FA150 (Cout[120], Cout[121], S[122], S[164], Cout[164]);
	Full_Adder FA151 (Cout[122], Cout[123], S[124], S[165], Cout[165]);
	Full_Adder FA152 (Cout[124], Cout[125], S[126], S[166], Cout[166]);
	Full_Adder FA153 (Cout[126], Cout[127], S[128], S[167], Cout[167]);
	Full_Adder FA154 (Cout[128], Cout[129], S[130], S[168], Cout[168]);
	Full_Adder FA155 (Cout[130], Cout[131], S[132], S[169], Cout[169]);
	Full_Adder FA156 (Cout[132], Cout[133], S[134], S[170], Cout[170]);
	Full_Adder FA157 (Cout[134], Cout[135], S[136], S[171], Cout[171]);
	Full_Adder FA158 (Cout[136], Cout[137], S[138], S[172], Cout[172]);
	Full_Adder FA159 (Cout[138], Cout[139], S[140], S[173], Cout[173]);
	Full_Adder FA160 (Cout[140], Cout[141], S[142], S[174], Cout[174]);
	Full_Adder FA161 (Cout[142], Cout[143], S[144], S[175], Cout[175]);
	Full_Adder FA162 (Cout[144], Cout[145], S[146], S[176], Cout[176]);
	Full_Adder FA163 (Cout[146], Cout[147], S[148], S[177], Cout[177]);
	Full_Adder FA164 (Cout[148], Cout[149], S[150], S[178], Cout[178]);
	Full_Adder FA165 (Cout[150], Cout[151], S[152], S[179], Cout[179]);
	Full_Adder FA166 (Cout[152], Cout[153], S[154], S[180], Cout[180]);
	Full_Adder FA167 (pp15[12], Cout[154], Cout[155], S[181], Cout[181]);
	Full_Adder FA168 (pp13[15], pp14[14], pp15[13], S[182], Cout[182]);
	Half_Adder HA15 (pp0[2], pp1[1], S[183], Cout[183]);
	Full_Adder FA169 (pp2[1], pp3[0], S[157], S[184], Cout[184]);
	Full_Adder FA170 (S[111], Cout[157], S[158], S[185], Cout[185]);
	Full_Adder FA171 (S[113], Cout[158], S[159], S[186], Cout[186]);
	Full_Adder FA172 (S[115], Cout[159], S[160], S[187], Cout[187]);
	Full_Adder FA173 (S[117], Cout[160], S[161], S[188], Cout[188]);
	Full_Adder FA174 (S[119], Cout[161], S[162], S[189], Cout[189]);
	Full_Adder FA175 (S[121], Cout[162], S[163], S[190], Cout[190]);
	Full_Adder FA176 (S[123], Cout[163], S[164], S[191], Cout[191]);
	Full_Adder FA177 (S[125], Cout[164], S[165], S[192], Cout[192]);
	Full_Adder FA178 (S[127], Cout[165], S[166], S[193], Cout[193]);
	Full_Adder FA179 (S[129], Cout[166], S[167], S[194], Cout[194]);
	Full_Adder FA180 (S[131], Cout[167], S[168], S[195], Cout[195]);
	Full_Adder FA181 (S[133], Cout[168], S[169], S[196], Cout[196]);
	Full_Adder FA182 (S[135], Cout[169], S[170], S[197], Cout[197]);
	Full_Adder FA183 (S[137], Cout[170], S[171], S[198], Cout[198]);
	Full_Adder FA184 (S[139], Cout[171], S[172], S[199], Cout[199]);
	Full_Adder FA185 (S[141], Cout[172], S[173], S[200], Cout[200]);
	Full_Adder FA186 (S[143], Cout[173], S[174], S[201], Cout[201]);
	Full_Adder FA187 (S[145], Cout[174], S[175], S[202], Cout[202]);
	Full_Adder FA188 (S[147], Cout[175], S[176], S[203], Cout[203]);
	Full_Adder FA189 (S[149], Cout[176], S[177], S[204], Cout[204]);
	Full_Adder FA190 (S[151], Cout[177], S[178], S[205], Cout[205]);
	Full_Adder FA191 (S[153], Cout[178], S[179], S[206], Cout[206]);
	Full_Adder FA192 (S[155], Cout[179], S[180], S[207], Cout[207]);
	Full_Adder FA193 (S[156], Cout[180], S[181], S[208], Cout[208]);
	Full_Adder FA194 (Cout[156], Cout[181], S[182], S[209], Cout[209]);
	Full_Adder FA195 (pp14[15], pp15[14], Cout[182], S[210], Cout[210]);

    wire [29:0] s, in_1, in_2;
    wire c;
    assign in_1 = {pp0[1],pp2[0],Cout[183],Cout[184],Cout[185],Cout[186],Cout[187],Cout[188],Cout[189],Cout[190],Cout[191],Cout[192],Cout[193],Cout[194],Cout[195],Cout[196],Cout[197],Cout[198],Cout[199],Cout[200],Cout[201],Cout[202],Cout[203],Cout[204],Cout[205],Cout[206],Cout[207],Cout[208],Cout[209],pp15[15]};
    assign in_2 = {pp1[0],S[183],S[184],S[185],S[186],S[187],S[188],S[189],S[190],S[191],S[192],S[193],S[194],S[195],S[196],S[197],S[198],S[199],S[200],S[201],S[202],S[203],S[204],S[205],S[206],S[207],S[208],S[209],S[210],Cout[210]};
    kogge_stone_30 KS_30(s, c, in_1, in_2);

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
    assign product[16] = s[15];
    assign product[17] = s[16];
    assign product[18] = s[17];
    assign product[19] = s[18];
    assign product[20] = s[19];
    assign product[21] = s[20];
    assign product[22] = s[21];
    assign product[23] = s[22];
    assign product[24] = s[23];
    assign product[25] = s[24];
    assign product[26] = s[25];
    assign product[27] = s[26];
    assign product[28] = s[27];
    assign product[29] = s[28];
    assign product[30] = s[29];
    assign product[31] = c;

endmodule

module Half_Adder(input wire in1,
                  input wire in2,
				  output wire sum,
                  output wire cout);
    xor(sum, in1, in2);
    and(cout, in1, in2);
endmodule

module Full_Adder(input wire in1,
                  input wire in2,
                  input wire cin,
				  output wire sum,
                  output wire cout);
    wire temp1;
    wire temp2;
    wire temp3;
    xor(sum, in1, in2, cin);
    and(temp1,in1,in2);
    and(temp2,in1,cin);
    and(temp3,in2,cin);
    or(cout,temp1,temp2,temp3);
endmodule

module kogge_stone_30(sum, cout, in1, in2);
    input [29:0] in1, in2; //input
    output [29:0] sum; //output
    output cout; //carry-out
    wire [29:0] G_Z, P_Z, //wires
    G_A, P_A,
    G_B, P_B,
    G_C, P_C,
    G_D, P_D,
    G_E, P_E,
    G_F, P_F;

    assign P_Z[0]  = in1[29] ^ in2[29];
    assign P_Z[1]  = in1[28] ^ in2[28];
    assign P_Z[2]  = in1[27] ^ in2[27];
    assign P_Z[3]  = in1[26] ^ in2[26];
    assign P_Z[4]  = in1[25] ^ in2[25];
    assign P_Z[5]  = in1[24] ^ in2[24];
    assign P_Z[6]  = in1[23] ^ in2[23];
    assign P_Z[7]  = in1[22] ^ in2[22];
    assign P_Z[8]  = in1[21] ^ in2[21];
    assign P_Z[9]  = in1[20] ^ in2[20];
    assign P_Z[10] = in1[19] ^ in2[19];
    assign P_Z[11] = in1[18] ^ in2[18];
    assign P_Z[12] = in1[17] ^ in2[17];
    assign P_Z[13] = in1[16] ^ in2[16];
    assign P_Z[14] = in1[15] ^ in2[15];
    assign P_Z[15] = in1[14] ^ in2[14];
    assign P_Z[16] = in1[13] ^ in2[13];
    assign P_Z[17] = in1[12] ^ in2[12];
    assign P_Z[18] = in1[11] ^ in2[11];
    assign P_Z[19] = in1[10] ^ in2[10];
    assign P_Z[20] = in1[9]  ^ in2[9];
    assign P_Z[21] = in1[8]  ^ in2[8];
    assign P_Z[22] = in1[7]  ^ in2[7];
    assign P_Z[23] = in1[6]  ^ in2[6];
    assign P_Z[24] = in1[5]  ^ in2[5];
    assign P_Z[25] = in1[4]  ^ in2[4];
    assign P_Z[26] = in1[3]  ^ in2[3];
    assign P_Z[27] = in1[2]  ^ in2[2];
    assign P_Z[28] = in1[1]  ^ in2[1];
    assign P_Z[29] = in1[0]  ^ in2[0];

    assign G_Z[0]  = in1[29] & in2[29];
    assign G_Z[1]  = in1[28] & in2[28];
    assign G_Z[2]  = in1[27] & in2[27];
    assign G_Z[3]  = in1[26] & in2[26];
    assign G_Z[4]  = in1[25] & in2[25];
    assign G_Z[5]  = in1[24] & in2[24];
    assign G_Z[6]  = in1[23] & in2[23];
    assign G_Z[7]  = in1[22] & in2[22];
    assign G_Z[8]  = in1[21] & in2[21];
    assign G_Z[9]  = in1[20] & in2[20];
    assign G_Z[10]  = in1[19] & in2[19];
    assign G_Z[11] = in1[18] & in2[18];
    assign G_Z[12] = in1[17] & in2[17];
    assign G_Z[13] = in1[16] & in2[16];
    assign G_Z[14] = in1[15] & in2[15];
    assign G_Z[15] = in1[14] & in2[14];
    assign G_Z[16] = in1[13] & in2[13];
    assign G_Z[17] = in1[12] & in2[12];
    assign G_Z[18] = in1[11] & in2[11];
    assign G_Z[19] = in1[10] & in2[10];
    assign G_Z[20] = in1[9]  & in2[9];
    assign G_Z[21] = in1[8]  & in2[8];
    assign G_Z[22] = in1[7]  & in2[7];
    assign G_Z[23] = in1[6]  & in2[6];
    assign G_Z[24] = in1[5]  & in2[5];
    assign G_Z[25] = in1[4]  & in2[4];
    assign G_Z[26] = in1[3]  & in2[3];
    assign G_Z[27] = in1[2]  & in2[2];
    assign G_Z[28] = in1[1]  & in2[1];
    assign G_Z[29] = in1[0]  & in2[0];

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
    black_cell level_FA(G_Z[14], P_Z[15], G_Z[15], P_Z[14], G_A[15], P_A[15]);
    black_cell level_GA(G_Z[15], P_Z[16], G_Z[16], P_Z[15], G_A[16], P_A[16]);
    black_cell level_HA(G_Z[16], P_Z[17], G_Z[17], P_Z[16], G_A[17], P_A[17]);
    black_cell level_IA(G_Z[17], P_Z[18], G_Z[18], P_Z[17], G_A[18], P_A[18]);
    black_cell level_JA(G_Z[18], P_Z[19], G_Z[19], P_Z[18], G_A[19], P_A[19]);
    black_cell level_KA(G_Z[19], P_Z[20], G_Z[20], P_Z[19], G_A[20], P_A[20]);
    black_cell level_LA(G_Z[20], P_Z[21], G_Z[21], P_Z[20], G_A[21], P_A[21]);
    black_cell level_MA(G_Z[21], P_Z[22], G_Z[22], P_Z[21], G_A[22], P_A[22]);
    black_cell level_NA(G_Z[22], P_Z[23], G_Z[23], P_Z[22], G_A[23], P_A[23]);
    black_cell level_OA(G_Z[23], P_Z[24], G_Z[24], P_Z[23], G_A[24], P_A[24]);
    black_cell level_PA(G_Z[24], P_Z[25], G_Z[25], P_Z[24], G_A[25], P_A[25]);
    black_cell level_QA(G_Z[25], P_Z[26], G_Z[26], P_Z[25], G_A[26], P_A[26]);
    black_cell level_RA(G_Z[26], P_Z[27], G_Z[27], P_Z[26], G_A[27], P_A[27]);
    black_cell level_SA(G_Z[27], P_Z[28], G_Z[28], P_Z[27], G_A[28], P_A[28]);
    black_cell level_TA(G_Z[28], P_Z[29], G_Z[29], P_Z[28], G_A[29], P_A[29]);

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
    black_cell level_FB(G_A[13], P_A[15], G_A[15], P_A[13], G_B[15], P_B[15]);
    black_cell level_GB(G_A[14], P_A[16], G_A[16], P_A[14], G_B[16], P_B[16]);
    black_cell level_HB(G_A[15], P_A[17], G_A[17], P_A[15], G_B[17], P_B[17]);
    black_cell level_IB(G_A[16], P_A[18], G_A[18], P_A[16], G_B[18], P_B[18]);
    black_cell level_JB(G_A[17], P_A[19], G_A[19], P_A[17], G_B[19], P_B[19]);
    black_cell level_KB(G_A[18], P_A[20], G_A[20], P_A[18], G_B[20], P_B[20]);
    black_cell level_LB(G_A[19], P_A[21], G_A[21], P_A[19], G_B[21], P_B[21]);
    black_cell level_MB(G_A[20], P_A[22], G_A[22], P_A[20], G_B[22], P_B[22]);
    black_cell level_NB(G_A[21], P_A[23], G_A[23], P_A[21], G_B[23], P_B[23]);
    black_cell level_OB(G_A[22], P_A[24], G_A[24], P_A[22], G_B[24], P_B[24]);
    black_cell level_PB(G_A[23], P_A[25], G_A[25], P_A[23], G_B[25], P_B[25]);
    black_cell level_QB(G_A[24], P_A[26], G_A[26], P_A[24], G_B[26], P_B[26]);
    black_cell level_RB(G_A[25], P_A[27], G_A[27], P_A[25], G_B[27], P_B[27]);
    black_cell level_SB(G_A[26], P_A[28], G_A[28], P_A[26], G_B[28], P_B[28]);
    black_cell level_TB(G_A[27], P_A[29], G_A[29], P_A[27], G_B[29], P_B[29]);

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
    black_cell level_FC(G_B[11], P_B[15], G_B[15], P_B[11], G_C[15], P_C[15]);
    black_cell level_GC(G_B[12], P_B[16], G_B[16], P_B[12], G_C[16], P_C[16]);
    black_cell level_HC(G_B[13], P_B[17], G_B[17], P_B[13], G_C[17], P_C[17]);
    black_cell level_IC(G_B[14], P_B[18], G_B[18], P_B[14], G_C[18], P_C[18]);
    black_cell level_JC(G_B[15], P_B[19], G_B[19], P_B[15], G_C[19], P_C[19]);
    black_cell level_KC(G_B[16], P_B[20], G_B[20], P_B[16], G_C[20], P_C[20]);
    black_cell level_LC(G_B[17], P_B[21], G_B[21], P_B[17], G_C[21], P_C[21]);
    black_cell level_MC(G_B[18], P_B[22], G_B[22], P_B[18], G_C[22], P_C[22]);
    black_cell level_NC(G_B[19], P_B[23], G_B[23], P_B[19], G_C[23], P_C[23]);
    black_cell level_OC(G_B[20], P_B[24], G_B[24], P_B[20], G_C[24], P_C[24]);
    black_cell level_PC(G_B[21], P_B[25], G_B[25], P_B[21], G_C[25], P_C[25]);
    black_cell level_QC(G_B[22], P_B[26], G_B[26], P_B[22], G_C[26], P_C[26]);
    black_cell level_RC(G_B[23], P_B[27], G_B[27], P_B[23], G_C[27], P_C[27]);
    black_cell level_SC(G_B[24], P_B[28], G_B[28], P_B[24], G_C[28], P_C[28]);
    black_cell level_TC(G_B[25], P_B[29], G_B[29], P_B[25], G_C[29], P_C[29]);

    /*level 4*/
    assign G_D[7] = G_C[7];
    gray_cell level_8D(G_A[0],    P_C[8],   G_C[8],            G_D[8]);
    gray_cell level_9D(G_B[1],    P_C[9],   G_C[9],            G_D[9]);
    gray_cell level_AD(G_B[2],    P_C[10],  G_C[10],           G_D[10]);
    gray_cell level_BD(G_C[3],    P_C[11],  G_C[11],           G_D[11]);
    gray_cell level_CD(G_C[4],    P_C[12],  G_C[12],           G_D[12]);
    gray_cell level_DD(G_C[5],    P_C[13],  G_C[13],           G_D[13]);
    gray_cell level_ED(G_C[6],    P_C[14],  G_C[14],           G_D[14]);
    black_cell level_FD(G_C[7],   P_C[15],  G_C[15],  P_C[7],  G_D[15], P_D[15]);
    black_cell level_GD(G_C[8],   P_C[16],  G_C[16],  P_C[8],  G_D[16], P_D[16]);
    black_cell level_HD(G_C[9],   P_C[17],  G_C[17],  P_C[9],  G_D[17], P_D[17]);
    black_cell level_ID(G_C[10],  P_C[18],  G_C[18],  P_C[10], G_D[18], P_D[18]);
    black_cell level_JD(G_C[11],  P_C[19],  G_C[19],  P_C[11], G_D[19], P_D[19]);
    black_cell level_KD(G_C[12],  P_C[20],  G_C[20],  P_C[12], G_D[20], P_D[20]);
    black_cell level_LD(G_C[13],  P_C[21],  G_C[21],  P_C[13], G_D[21], P_D[21]);
    black_cell level_MD(G_C[14],  P_C[22],  G_C[22],  P_C[14], G_D[22], P_D[22]);
    black_cell level_ND(G_C[15],  P_C[23],  G_C[23],  P_C[15], G_D[23], P_D[23]);
    black_cell level_OD(G_C[16],  P_C[24],  G_C[24],  P_C[16], G_D[24], P_D[24]);
    black_cell level_PD(G_C[17],  P_C[25],  G_C[25],  P_C[17], G_D[25], P_D[25]);
    black_cell level_QD(G_C[18],  P_C[26],  G_C[26],  P_C[18], G_D[26], P_D[26]);
    black_cell level_RD(G_C[19],  P_C[27],  G_C[27],  P_C[19], G_D[27], P_D[27]);
    black_cell level_SD(G_C[20],  P_C[28],  G_C[28],  P_C[20], G_D[28], P_D[28]);
    black_cell level_TD(G_C[21],  P_C[29],  G_C[29],  P_C[21], G_D[29], P_D[29]);

    /*level 5*/
    assign G_E[15] = G_D[15];
    gray_cell level_GE(G_A[0],    P_D[16],  G_D[16],           G_E[16]);
    gray_cell level_HE(G_B[1],    P_D[17],  G_D[17],           G_E[17]);
    gray_cell level_IE(G_B[2],    P_D[18],  G_D[18],           G_E[18]);
    gray_cell level_JE(G_C[3],    P_D[19],  G_D[19],           G_E[19]);
    gray_cell level_KE(G_C[4],    P_D[20],  G_D[20],           G_E[20]);
    gray_cell level_LE(G_C[5],    P_D[21],  G_D[21],           G_E[21]);
    gray_cell level_ME(G_C[6],    P_D[22],  G_D[22],           G_E[22]);
    gray_cell level_NE(G_D[7],    P_D[23],  G_D[23],           G_E[23]);
    gray_cell level_OE(G_D[8],    P_D[24],  G_D[24],           G_E[24]);
    gray_cell level_PE(G_D[9],    P_D[25],  G_D[25],           G_E[25]);
    gray_cell level_QE(G_D[10],   P_D[26],  G_D[26],           G_E[26]);
    gray_cell level_RE(G_D[11],   P_D[27],  G_D[27],           G_E[27]);
    gray_cell level_SE(G_D[12],   P_D[28],  G_D[28],           G_E[28]);
    gray_cell level_TE(G_D[13],   P_D[29],  G_D[29],           cout);

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
    assign sum[15] = G_D[14] ^ P_Z[15];
    assign sum[16] = G_D[15] ^ P_Z[16];
    assign sum[17] = G_D[16] ^ P_Z[17];
    assign sum[18] = G_D[17] ^ P_Z[18];
    assign sum[19] = G_D[18] ^ P_Z[19];
    assign sum[20] = G_D[19] ^ P_Z[20];
    assign sum[21] = G_D[20] ^ P_Z[21];
    assign sum[22] = G_D[21] ^ P_Z[22];
    assign sum[23] = G_D[22] ^ P_Z[23];
    assign sum[24] = G_D[23] ^ P_Z[24];
    assign sum[25] = G_D[24] ^ P_Z[25];
    assign sum[26] = G_D[25] ^ P_Z[26];
    assign sum[27] = G_D[26] ^ P_Z[27];
    assign sum[28] = G_D[27] ^ P_Z[28];
    assign sum[29] = G_D[28] ^ P_Z[29];
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
