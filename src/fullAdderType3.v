// full adder type 3 (type I' from Pezaris)
// three negated inputs
module fullAdderType3 (
    input wire x,   // negated input
    input wire y,   // negated input
    input wire z,   // negated input
    output wire s,
    output wire c
    );

assign s = (~x & ~y & z) | (~x & y & ~z) | (x & ~y & ~z) | (x & y & z);
assign c = (x & y) | (y & z) | (z & x);

endmodule
