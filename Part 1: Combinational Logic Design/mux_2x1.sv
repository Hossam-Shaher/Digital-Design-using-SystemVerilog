// version 1: always @(*) + conditional statement
module mux_2x1_v1(
  input x0,
  		x1,
  		s,
  output logic f
);
  
  always @(*)
    if(s)
      f = x1;
    else
      f = x0;

endmodule: mux_2x1_v1

// version 2: always @(*) + case statement
module mux_2x1_v2(
  input x0,
  		x1,
  		s,
  output logic f
);
  
  always @(*)
    case(s)
      0: f = x0;
      1: f = x1;
      default: f= 1'bx;
    endcase   
    
endmodule: mux_2x1_v2

//Version 3: continuous assign + conditional operator
module mux_2x1_v3(
  input x0,
  		x1,
  		s,
  output f
);
  
  assign f = s? x1 : x0;

endmodule: mux_2x1_v3

//Version 4: continuous assign + bitwise operators
module mux_2x1_v4(
  input x0,
  		x1,
  		s,
  output f
);
   
  assign f = (s & x1) | (~s & x0);

endmodule: mux_2x1_v4
  
//Version 5: gate-level hardware descriptions
module mux_2x1_v5(
  input x0,
  		x1,
  		s,
  output f
);
   
  wire w0, w1;
  
  and and0	(w0, x0, ~s);
  and and1	(w1, x1, s);
  or  or0	(f, w0, w1);
  
endmodule: mux_2x1_v5