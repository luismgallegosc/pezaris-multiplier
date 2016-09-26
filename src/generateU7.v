module generateU7 (
        input wire [6:0] a,
        input wire [6:0] b,
        input wire [6:0] c_i,
        output wire [6:0] u,
        output wire [6:0] c_o
        );

    fullAdderType2 u0 (a[0], b[0], c_i[0], u[0], c_o[0]);  // first two negated
    fullAdderType2 u1 (a[1], b[1], c_i[1], u[1], c_o[1]);  // first two negated
    fullAdderType2 u2 (a[2], b[2], c_i[2], u[2], c_o[2]);  // first two negated
    fullAdderType2 u3 (a[3], b[3], c_i[3], u[3], c_o[3]);  // first two negated
    fullAdderType2 u4 (a[4], b[4], c_i[4], u[4], c_o[4]);  // first two negated
    fullAdderType2 u5 (a[5], b[5], c_i[5], u[5], c_o[5]);  // first two negated
    fullAdderType2 u6 (a[6], b[6], c_i[6], u[6], c_o[6]);  // first two negated

endmodule
