// full adder type 1 (type II from Pezaris)
// one negated input
module fullAdderType1 (
    input wire x,
    input wire y,
    input wire z,   // negated input
    output wire s,
    output wire c
    );

assign s = (~x & ~y & z) | (~x & y & ~z) | (x & ~y & ~z) | (x & y & z);
assign c = (x & y) | (y & ~z) | (~z & x);

endmodule
