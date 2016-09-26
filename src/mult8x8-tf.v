`timescale 1ns / 1ps

module mult8x8_tf;

    // Inputs
    reg clk;
    reg [7:0] a;
    reg [7:0] b;

    // Outputs
    wire [15:0] p;

    // Instantiate the Unit Under Test (UUT)
    mult8x8 uut (
        .clk(clk),
        .a(a), 
        .b(b), 
        .p(p)
    );

    always #5 clk = ~clk; // 10 ns period

    initial begin
        // Initialize Inputs
        clk = 0;
        a = 0;
        b = 0;

        // Wait 100 ns for global reset to finish
        #10;

        // Add stimulus here
            a = 53;     // 53*27 = 1,431
            b = 27;
        #10 a = 17;     // 17*-125 = -2,125
            b = -125;
        #10 a = -93;    // -93*75 = -6,975
            b = 75;
        #10 a = -47;    // -47*-83 = 3,901
            b = -83;
        #10 a = 0;
            b = 0;
        #95 $finish(0); // #35 (2 stages)
                        // #55 (4 stages)
                        // #95 (8 stages)
    end

endmodule
