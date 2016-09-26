// full adder type 2 (type II' from Pezaris)
// two negated inputs
module fullAdderType2 (
    input wire x,   // negated input
    input wire y,   // negated input
    input wire z,
    output wire s,
    output wire c
    );

assign s = (~x & ~y & z) | (~x & y & ~z) | (x & ~y & ~z) | (x & y & z);
assign c = (x & y) | (y & ~z) | (~z & x);

endmodule
