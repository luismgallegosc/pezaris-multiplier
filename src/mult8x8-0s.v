module mult8x8 (
        input wire [7:0] a,
        input wire [7:0] b,
        output wire [15:0] p
        );

    wire [7:0] row1;
    wire [7:0] row2;
    wire [7:0] row3;
    wire [7:0] row4;
    wire [7:0] row5;
    wire [7:0] row6;
    wire [7:0] row7;
    wire [7:0] row8;

    wire [6:0] u1;
    wire [6:0] u2;
    wire [6:0] u3;
    wire [6:0] u4;
    wire [6:0] u5;
    wire [6:0] u6;
    wire [6:0] u7;
    wire [6:0] u8;

    wire [6:0] c_oU1;
    wire [6:0] c_oU2;
    wire [6:0] c_oU3;
    wire [6:0] c_oU4;
    wire [6:0] c_oU5;
    wire [6:0] c_oU6;
    wire [6:0] c_oU7;
    wire [6:0] c_oU8;

    assign row1 = a & {8{b[0]}};
    assign row2 = a & {8{b[1]}};
    assign row3 = a & {8{b[2]}};
    assign row4 = a & {8{b[3]}};
    assign row5 = a & {8{b[4]}};
    assign row6 = a & {8{b[5]}};
    assign row7 = a & {8{b[6]}};
    assign row8 = a & {8{b[7]}};

    generateU1 genU1(        row1[7:1], row2[6:0], {7{1'b0}}, u1, c_oU1);
    generateU2 genU2({row2[7],u1[6:1]}, row3[6:0],     c_oU1, u2, c_oU2);
    generateU3 genU3({row3[7],u2[6:1]}, row4[6:0],     c_oU2, u3, c_oU3);
    generateU4 genU4({row4[7],u3[6:1]}, row5[6:0],     c_oU3, u4, c_oU4);
    generateU5 genU5({row5[7],u4[6:1]}, row6[6:0],     c_oU4, u5, c_oU5);
    generateU6 genU6({row6[7],u5[6:1]}, row7[6:0],     c_oU5, u6, c_oU6);
    generateU7 genU7({row7[7],u6[6:1]}, row8[6:0],     c_oU6, u7, c_oU7);
    generateU8 genU8({row8[7],u7[6:1]},                c_oU7, u8, c_oU8);

    assign p = {c_oU8[6], u8[6:0], u7[0], u6[0], u5[0], u4[0], u3[0], u2[0], u1[0], row1[0]};

endmodule
