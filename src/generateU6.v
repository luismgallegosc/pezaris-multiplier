module generateU6 (
        input wire [6:0] a,
        input wire [6:0] b,
        input wire [6:0] c_i,
        output wire [6:0] u,
        output wire [6:0] c_o
        );

    fullAdderType0 u0 (b[0], c_i[0], a[0], u[0], c_o[0]);
    fullAdderType1 u1 (b[1], c_i[1], a[1], u[1], c_o[1]);  // third negated
    fullAdderType1 u2 (b[2], c_i[2], a[2], u[2], c_o[2]);  // third negated
    fullAdderType1 u3 (b[3], c_i[3], a[3], u[3], c_o[3]);  // third negated
    fullAdderType1 u4 (b[4], c_i[4], a[4], u[4], c_o[4]);  // third negated
    fullAdderType1 u5 (b[5], c_i[5], a[5], u[5], c_o[5]);  // third negated
    fullAdderType1 u6 (b[6], c_i[6], a[6], u[6], c_o[6]);  // third negated

endmodule
