module mult8x8 (
        input wire clk,
        input wire [7:0] a,
        input wire [7:0] b,
        output reg [15:0] p
        );

    // Declare rows
    reg [7:0] row1_s1;
    reg [7:0] row1_s2;
    reg [7:0] row1_s3;
    reg [7:0] row1_s4;
    reg [7:0] row1_s5;
    reg [7:0] row1_s6;
    reg [7:0] row1_s7;
    reg [7:0] row1_s8;

    reg [7:0] row2_s1;
    reg [7:0] row2_s2;

    reg [7:0] row3_s1;
    reg [7:0] row3_s2;
    reg [7:0] row3_s3;

    reg [7:0] row4_s1;
    reg [7:0] row4_s2;
    reg [7:0] row4_s3;
    reg [7:0] row4_s4;

    reg [7:0] row5_s1;
    reg [7:0] row5_s2;
    reg [7:0] row5_s3;
    reg [7:0] row5_s4;
    reg [7:0] row5_s5;

    reg [7:0] row6_s1;
    reg [7:0] row6_s2;
    reg [7:0] row6_s3;
    reg [7:0] row6_s4;
    reg [7:0] row6_s5;
    reg [7:0] row6_s6;

    reg [7:0] row7_s1;
    reg [7:0] row7_s2;
    reg [7:0] row7_s3;
    reg [7:0] row7_s4;
    reg [7:0] row7_s5;
    reg [7:0] row7_s6;
    reg [7:0] row7_s7;

    reg [7:0] row8_s1;
    reg [7:0] row8_s2;
    reg [7:0] row8_s3;
    reg [7:0] row8_s4;
    reg [7:0] row8_s5;
    reg [7:0] row8_s6;
    reg [7:0] row8_s7;
    reg [7:0] row8_s8;


    // Declare multiplication results
    reg [6:0] u1_s2;
    reg [6:0] u1_s3;
    reg [6:0] u1_s4;
    reg [6:0] u1_s5;
    reg [6:0] u1_s6;
    reg [6:0] u1_s7;
    reg [6:0] u1_s8;

    reg [6:0] u2_s3;
    reg [6:0] u2_s4;
    reg [6:0] u2_s5;
    reg [6:0] u2_s6;
    reg [6:0] u2_s7;
    reg [6:0] u2_s8;

    reg [6:0] u3_s4;
    reg [6:0] u3_s5;
    reg [6:0] u3_s6;
    reg [6:0] u3_s7;
    reg [6:0] u3_s8;

    reg [6:0] u4_s5;
    reg [6:0] u4_s6;
    reg [6:0] u4_s7;
    reg [6:0] u4_s8;

    reg [6:0] u5_s6;
    reg [6:0] u5_s7;
    reg [6:0] u5_s8;

    reg [6:0] u6_s7;
    reg [6:0] u6_s8;

    reg [6:0] u7_s8;


    // Declare carries
    reg [6:0] coU1_reg;
    reg [6:0] coU2_reg;
    reg [6:0] coU3_reg;
    reg [6:0] coU4_reg;
    reg [6:0] coU5_reg;
    reg [6:0] coU6_reg;
    reg [6:0] coU7_reg;


    // Declare combinational results
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
    wire [6:0] coU1;
    wire [6:0] coU2;
    wire [6:0] coU3;
    wire [6:0] coU4;
    wire [6:0] coU5;
    wire [6:0] coU6;
    wire [6:0] coU7;
    wire [6:0] coU8;


    // Initialize registers
    initial begin
        row1_s1 <= 0;
        row1_s2 <= 0;
        row1_s3 <= 0;
        row1_s4 <= 0;
        row1_s5 <= 0;
        row1_s6 <= 0;
        row1_s7 <= 0;
        row1_s8 <= 0;

        row2_s1 <= 0;
        row2_s2 <= 0;

        row3_s1 <= 0;
        row3_s2 <= 0;
        row3_s3 <= 0;

        row4_s1 <= 0;
        row4_s2 <= 0;
        row4_s3 <= 0;
        row4_s4 <= 0;

        row5_s1 <= 0;
        row5_s2 <= 0;
        row5_s3 <= 0;
        row5_s4 <= 0;
        row5_s5 <= 0;

        row6_s1 <= 0;
        row6_s2 <= 0;
        row6_s3 <= 0;
        row6_s4 <= 0;
        row6_s5 <= 0;
        row6_s6 <= 0;

        row7_s1 <= 0;
        row7_s2 <= 0;
        row7_s3 <= 0;
        row7_s4 <= 0;
        row7_s5 <= 0;
        row7_s6 <= 0;
        row7_s7 <= 0;

        row8_s1 <= 0;
        row8_s2 <= 0;
        row8_s3 <= 0;
        row8_s4 <= 0;
        row8_s5 <= 0;
        row8_s6 <= 0;
        row8_s7 <= 0;
        row8_s8 <= 0;


        u1_s2 <= 0;
        u1_s3 <= 0;
        u1_s4 <= 0;
        u1_s5 <= 0;
        u1_s6 <= 0;
        u1_s7 <= 0;
        u1_s8 <= 0;

        u2_s3 <= 0;
        u2_s4 <= 0;
        u2_s5 <= 0;
        u2_s6 <= 0;
        u2_s7 <= 0;
        u2_s8 <= 0;

        u3_s4 <= 0;
        u3_s5 <= 0;
        u3_s6 <= 0;
        u3_s7 <= 0;
        u3_s8 <= 0;

        u4_s5 <= 0;
        u4_s6 <= 0;
        u4_s7 <= 0;
        u4_s8 <= 0;

        u5_s6 <= 0;
        u5_s7 <= 0;
        u5_s8 <= 0;

        u6_s7 <= 0;
        u6_s8 <= 0;

        u7_s8 <= 0;


        coU1_reg <= 0;
        coU2_reg <= 0;
        coU3_reg <= 0;
        coU4_reg <= 0;
        coU5_reg <= 0;
        coU6_reg <= 0;
        coU7_reg <= 0;


        p <= 0;
    end

    // Assign rows
    assign row1 = a & {8{b[0]}};
    assign row2 = a & {8{b[1]}};
    assign row3 = a & {8{b[2]}};
    assign row4 = a & {8{b[3]}};
    assign row5 = a & {8{b[4]}};
    assign row6 = a & {8{b[5]}};
    assign row7 = a & {8{b[6]}};
    assign row8 = a & {8{b[7]}};

    // Operations (8 stages)
    generateU1 genU1(           row1_s1[7:1], row2_s1[6:0],  {7{1'b0}}, u1, coU1);
    generateU2 genU2({row2_s2[7],u1_s2[6:1]}, row3_s2[6:0],   coU1_reg, u2, coU2);
    generateU3 genU3({row3_s3[7],u2_s3[6:1]}, row4_s3[6:0],   coU2_reg, u3, coU3);
    generateU4 genU4({row4_s4[7],u3_s4[6:1]}, row5_s4[6:0],   coU3_reg, u4, coU4);
    generateU5 genU5({row5_s5[7],u4_s5[6:1]}, row6_s5[6:0],   coU4_reg, u5, coU5);
    generateU6 genU6({row6_s6[7],u5_s6[6:1]}, row7_s6[6:0],   coU5_reg, u6, coU6);
    generateU7 genU7({row7_s7[7],u6_s7[6:1]}, row8_s7[6:0],   coU6_reg, u7, coU7);
    generateU8 genU8({row8_s8[7],u7_s8[6:1]},                 coU7_reg, u8, coU8);

    always @(posedge clk) begin
        // Update row registers
        row1_s1 <= row1;
        row1_s2 <= row1_s1;
        row1_s3 <= row1_s2;
        row1_s4 <= row1_s3;
        row1_s5 <= row1_s4;
        row1_s6 <= row1_s5;
        row1_s7 <= row1_s6;
        row1_s8 <= row1_s7;

        row2_s1 <= row2;
        row2_s2 <= row2_s1;

        row3_s1 <= row3;
        row3_s2 <= row3_s1;
        row3_s3 <= row3_s2;

        row4_s1 <= row4;
        row4_s2 <= row4_s1;
        row4_s3 <= row4_s2;
        row4_s4 <= row4_s3;

        row5_s1 <= row5;
        row5_s2 <= row5_s1;
        row5_s3 <= row5_s2;
        row5_s4 <= row5_s3;
        row5_s5 <= row5_s4;

        row6_s1 <= row6;
        row6_s2 <= row6_s1;
        row6_s3 <= row6_s2;
        row6_s4 <= row6_s3;
        row6_s5 <= row6_s4;
        row6_s6 <= row6_s5;

        row7_s1 <= row7;
        row7_s2 <= row7_s1;
        row7_s3 <= row7_s2;
        row7_s4 <= row7_s3;
        row7_s5 <= row7_s4;
        row7_s6 <= row7_s5;
        row7_s7 <= row7_s6;

        row8_s1 <= row8;
        row8_s2 <= row8_s1;
        row8_s3 <= row8_s2;
        row8_s4 <= row8_s3;
        row8_s5 <= row8_s4;
        row8_s6 <= row8_s5;
        row8_s7 <= row8_s6;
        row8_s8 <= row8_s7;

        // Update multiplication registers
        u1_s2 <= u1;
        u1_s3 <= u1_s2;
        u1_s4 <= u1_s3;
        u1_s5 <= u1_s4;
        u1_s6 <= u1_s5;
        u1_s7 <= u1_s6;
        u1_s8 <= u1_s7;

        u2_s3 <= u2;
        u2_s4 <= u2_s3;
        u2_s5 <= u2_s4;
        u2_s6 <= u2_s5;
        u2_s7 <= u2_s6;
        u2_s8 <= u2_s7;

        u3_s4 <= u3;
        u3_s5 <= u3_s4;
        u3_s6 <= u3_s5;
        u3_s7 <= u3_s6;
        u3_s8 <= u3_s7;

        u4_s5 <= u4;
        u4_s6 <= u4_s5;
        u4_s7 <= u4_s6;
        u4_s8 <= u4_s7;

        u5_s6 <= u5;
        u5_s7 <= u5_s6;
        u5_s8 <= u5_s7;

        u6_s7 <= u6;
        u6_s8 <= u6_s7;

        u7_s8 <= u7;

        // Update carry registers
        coU1_reg <= coU1;
        coU2_reg <= coU2;
        coU3_reg <= coU3;
        coU4_reg <= coU4;
        coU5_reg <= coU5;
        coU6_reg <= coU6;
        coU7_reg <= coU7;

        // Update results
        p <= {coU8[6], u8[6:0], u7_s8[0], u6_s8[0], u5_s8[0], u4_s8[0], u3_s8[0], u2_s8[0], u1_s8[0], row1_s8[0]};
    end

endmodule
