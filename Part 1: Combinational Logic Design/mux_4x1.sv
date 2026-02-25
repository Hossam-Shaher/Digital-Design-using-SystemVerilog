`include "mux_2x1.sv"

//version 1: building a 4x1 MUX using three 2x1 MUXs
module mux_4x1_v1(
  input x0, x1, x2, x3,
  		s0, s1,
  output f
);

  wire w0, w1;
  
  mux_2x1_v1 mux0 (x0, x1, s1, w0);
  mux_2x1_v3 mux1 (x2, x3, s1, w1);
  mux_2x1_v5 mux2 (w0, w1, s0,  f);
  
endmodule: mux_4x1_v1

// version 2: always_comb + case statement
module mux_4x1_v2(
  input x0, x1, x2, x3,
  		s0, s1,
  output logic f
);

  always_comb
    case({s0, s1})
      0: f = x0;
      1: f = x1;
      2: f = x2;
      3: f = x3;
      default: f = 1'bx;
    endcase  
  
endmodule: mux_4x1_v2