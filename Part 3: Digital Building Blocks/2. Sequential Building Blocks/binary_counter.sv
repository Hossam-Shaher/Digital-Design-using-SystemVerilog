//An N-bit binary counter (divide-by-2**N counter)

module binary_counter
  #(parameter N = 8) (
  	input 					clk, 
    						reset,
    output logic [N-1 : 0] 	Q,
    output 					clk_out
  );
  
  always_ff @(posedge clk, posedge reset) 
    if(reset)
      Q <= '0;
    else 
      Q <= Q + 1;
  
  assign clk_out = Q[N-1];
  
endmodule: binary_counter
  
  
  
  
  
  