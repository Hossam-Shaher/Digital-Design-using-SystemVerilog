`include "ripple_carry_adder.sv"

// schematic: https://i.sstatic.net/3fxMY.gif

// 4-bit ripple carry adder/subtractor
module RCAS_4bit(
  input wire logic [3:0] 	a, b,
  input wire logic 			add_sub,	//add_sub = 0 -> add
  										//add_sub = 1 -> sub 
  output wire logic [3:0] 	s,
  output wire logic 		c_out 
);
  
  wire [3:0] b_new = b ^ {4{add_sub}}; //net_declaration cont assign
  wire c_out_old;
  assign c_out = c_out_old ^ add_sub; 
  
  RCA_4bit rca_4bit (a, b_new, add_sub, s, c_out_old);
  
endmodule: RCAS_4bit

// N-bit ripple carry adder/subtractor
module RCAS_Nbit 
  #(parameter N = 4) (
  input [N-1:0] 	a, b, 
  input 			add_sub,
  output [N-1:0] 	s,
  output 			c_out 
);
  
  wire [N-1:0] b_new = b ^ {N{add_sub}}; //net_declaration cont assign
  wire c_out_old;
  assign c_out = c_out_old ^ add_sub; 	

  RCA_Nbit #(N) rca_Nbit (a, b_new, add_sub, s, c_out_old);
  
endmodule: RCAS_Nbit