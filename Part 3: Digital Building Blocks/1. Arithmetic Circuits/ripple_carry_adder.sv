`include "full_adder.sv"

// 4-bit RCA
module RCA_4bit(
  input wire logic [3:0] 	a, b,
  input wire logic 			c_in,
  output wire logic [3:0] 	s,
  output wire logic 		c_out 
);
  
  wire logic [4:0] w;
  alias w[0] = c_in;
  alias w[4] = c_out;
  
  FA_v1 fa0 (a[0], b[0], w[0], s[0], w[1]);
  FA_v1 fa1 (a[1], b[1], w[1], s[1], w[2]);
  FA_v1 fa2 (a[2], b[2], w[2], s[2], w[3]);
  FA_v1 fa3 (a[3], b[3], w[3], s[3], w[4]);
  
endmodule: RCA_4bit

// N-bit RCA
module RCA_Nbit 
  #(parameter N = 4) (
  input [N-1:0] 	a, b, 
  input 			c_in,
  output [N-1:0] 	s,
  output 			c_out 
);
  
  wire logic [N:0] w;
  alias w[0] = c_in;
  alias w[N] = c_out;
  
  genvar i;	//a genvar declaration cannot have an initializer
  
  //"generate" and "endgenerate" are optional in SV
  for(i=0; i<=N-1; i++) begin: stage
    FA_v2 fa (a[i], b[i], w[i], s[i], w[i+1]);    
  end: stage
      
endmodule: RCA_Nbit