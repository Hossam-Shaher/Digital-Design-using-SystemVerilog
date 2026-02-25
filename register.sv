//An N-bit register is a bank of N flip-flops that share a common CLK input 
//so that all bits of the register are updated at the same time
module register
  #(parameter N=4)(
    input 					clk, 
    						reset,	//asynchronous reset
    input  [N-1:0] 			D,
    output logic [N-1:0] 	Q
  );
  
  always_ff @(posedge clk, posedge reset) 
    if(reset)
      Q <= '0;
    else
      Q <= D;

endmodule: register
  
