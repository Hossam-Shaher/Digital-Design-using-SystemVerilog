//Digitally Controlled Oscillator (DCO)
//It is an N-bit counter that adds p on each cycle, rather than 1. 
//The MSB toggles at f_out = f_clk × p/2**N. 
//With a judicious choice of p and N, you can produce an output of any frequency. 
//Larger N gives more precise control at the expense of more hardware.

module DCO
  #(parameter N=5, p=8) (
  	input	logic 			clk, 
    		logic			reset,
    output 	logic [N-1 : 0] Q,
    output 					clk_out
  );
  
  always_ff @(posedge clk, posedge reset) 
    if(reset)
      Q <= '0;
    else 
      Q <= Q + p;
  
  assign clk_out = Q[N-1];
  
endmodule: DCO