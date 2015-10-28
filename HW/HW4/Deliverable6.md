How does `assign out = enable<<address;` result in a decoder?

`x<<y` shifts `x` left by `y` bits. So, `enable<<address` shifts `enable` left by `address` bits.
When `enable` is 1, `enable<<address` will be a 1 followed by `address` zeros. When `enable` is 0, `enable<<address` will be `address + 1` zeros.

Then, `out` is declared to be a 32 bit bus, so `assign out = enable<<address` left-pads `enable<<address` with zeros into a 32 bit number.

The module behaves as a decoder with an enable:
- When `enable` is 0, `out` is always `32'b0`
- When `enable` is 1, `out` is `32'b0` but with a 1 in the `address`-th bit.
