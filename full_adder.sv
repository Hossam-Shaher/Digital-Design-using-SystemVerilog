// version 1: cont assign + bitwise operators
module FA_v1(
  input a, b, c_in,
  output s, c_out
);
  
  assign s = a ^ b ^ c_in;

  assign c_out = (a & b) | (b & c_in) | (a & c_in);
  
endmodule: FA_v1

// version 2: two half adders + OR gate

`include "half_adder.sv"

module FA_v2(
  input a, b, c_in,
  output s, c_out
);
  
  wire w1, w2, w3;
  
  HA ha1 (a, b, w1, w2);
  HA ha2 (w1, c_in, s, w3);
  or or1 (c_out, w2, w3);
  
endmodule: FA_v2