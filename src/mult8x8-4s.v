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

    reg [7:0] row2_s1;

    reg [7:0] row3_s1;
    reg [7:0] row3_s2;

    reg [7:0] row4_s1;
    reg [7:0] row4_s2;

    reg [7:0] row5_s1;
    reg [7:0] row5_s2;
    reg [7:0] row5_s3;

    reg [7:0] row6_s1;
    reg [7:0] row6_s2;
    reg [7:0] row6_s3;

    reg [7:0] row7_s1;
    reg [7:0] row7_s2;
    reg [7:0] row7_s3;
    reg [7:0] row7_s4;

    reg [7:0] row8_s1;
    reg [7:0] row8_s2;
    reg [7:0] row8_s3;
    reg [7:0] row8_s4;


    // Declare multiplication results
    reg [6:0] u1_s2;
    reg [6:0] u1_s3;
    reg [6:0] u1_s4;

    reg [6:0] u2_s2;
    reg [6:0] u2_s3;
    reg [6:0] u2_s4;
    
    reg [6:0] u3_s3;
    reg [6:0] u3_s4;

    reg [6:0] u4_s3;
    reg [6:0] u4_s4;

    reg [6:0] u5_s4;

    reg [6:0] u6_s4;


    // Declare carries
    reg [6:0] coU2_reg;
    reg [6:0] coU4_reg;
    reg [6:0] coU6_reg;


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

        row2_s1 <= 0;
        
        row3_s1 <= 0;
        row3_s2 <= 0;

        row4_s1 <= 0;
        row4_s2 <= 0;
        
        row5_s1 <= 0;
        row5_s2 <= 0;
        row5_s3 <= 0;

        row6_s1 <= 0;
        row6_s2 <= 0;
        row6_s3 <= 0;

        row7_s1 <= 0;
        row7_s2 <= 0;
        row7_s3 <= 0;
        row7_s4 <= 0;

        row8_s1 <= 0;
        row8_s2 <= 0;
        row8_s3 <= 0;
        row8_s4 <= 0;


        u1_s2 <= 0;
        u1_s3 <= 0;
        u1_s4 <= 0;

        u2_s2 <= 0;
        u2_s3 <= 0;
        u2_s4 <= 0;

        u3_s3 <= 0;
        u3_s4 <= 0;

        u4_s3 <= 0;
        u4_s4 <= 0;

        u5_s4 <= 0;

        u6_s4 <= 0;


        coU2_reg <= 0;
        coU4_reg <= 0;
        coU6_reg <= 0;


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

    // Stage 1 operations
    generateU1 genU1(        row1_s1[7:1], row2_s1[6:0], {7{1'b0}}, u1, coU1);
    generateU2 genU2({row2_s1[7],u1[6:1]}, row3_s1[6:0],      coU1, u2, coU2);

    // Stage 2 operations
    generateU3 genU3({row3_s2[7],u2_s2[6:1]}, row4_s2[6:0],  coU2_reg, u3, coU3);
    generateU4 genU4({row4_s2[7],   u3[6:1]}, row5_s2[6:0],      coU3, u4, coU4);

    // Stage 3 operations
    generateU5 genU5({row5_s3[7],u4_s3[6:1]}, row6_s3[6:0],  coU4_reg, u5, coU5);
    generateU6 genU6({row6_s3[7],   u5[6:1]}, row7_s3[6:0],      coU5, u6, coU6);

    // Stage 4 operations
    generateU7 genU7({row7_s4[7],u6_s4[6:1]}, row8_s4[6:0],  coU6_reg, u7, coU7);
    generateU8 genU8({row8_s4[7],   u7[6:1]},                    coU7, u8, coU8);

    always @(posedge clk) begin
        // Update row registers
        row1_s1 <= row1;
        row1_s2 <= row1_s1;
        row1_s3 <= row1_s2;
        row1_s4 <= row1_s3;

        row2_s1 <= row2;

        row3_s1 <= row3;
        row3_s2 <= row3_s1;

        row4_s1 <= row4;
        row4_s2 <= row4_s1;

        row5_s1 <= row5;
        row5_s2 <= row5_s1;
        row5_s3 <= row5_s2;

        row6_s1 <= row6;
        row6_s2 <= row6_s1;
        row6_s3 <= row6_s2;

        row7_s1 <= row7;
        row7_s2 <= row7_s1;
        row7_s3 <= row7_s2;
        row7_s4 <= row7_s3;

        row8_s1 <= row8;
        row8_s2 <= row8_s1;
        row8_s3 <= row8_s2;
        row8_s4 <= row8_s3;

        // Update multiplication registers
        u1_s2 <= u1;
        u1_s3 <= u1_s2;
        u1_s4 <= u1_s3;

        u2_s2 <= u2;
        u2_s3 <= u2_s2;
        u2_s4 <= u2_s3;

        u3_s3 <= u3;
        u3_s4 <= u3_s3;

        u4_s3 <= u4;
        u4_s4 <= u4_s3;

        u5_s4 <= u5;

        u6_s4 <= u6;

        // Update carry registers
        coU2_reg <= coU2;
        coU4_reg <= coU4;
        coU6_reg <= coU6;

        // Update result
        p <= {coU8[6], u8[6:0], u7[0], u6_s4[0], u5_s4[0], u4_s4[0], u3_s4[0], u2_s4[0], u1_s4[0], row1_s4[0]};
    end

endmodule
