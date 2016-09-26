// full adder type 0 (type I from Pezaris)
// no negated inputs
module fullAdderType0 (
    input wire x,
    input wire y,
    input wire z,
    output wire s,
    output wire c
    );

assign s = (~x & ~y & z) | (~x & y & ~z) | (x & ~y & ~z) | (x & y & z);
assign c = (x & y) | (y & z) | (z & x);

endmodule
