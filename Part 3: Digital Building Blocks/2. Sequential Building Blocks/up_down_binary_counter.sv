module up_down_binary_counter
  #(parameter N = 8) (
    input 					clk,
    						reset_n, 	//async reset
    						en, 		//sync enable
    						up, 		//up = 1 -> the circuit counts up
    									//up = 0 -> the circuit counts down
    output logic [N-1 : 0] Q
  );
  
  always_ff @(posedge clk, negedge reset_n)
    if(!reset_n)
      Q <= 0;
    else if(en)
      if(up)
        Q <= Q+1;
      else 
        Q <= Q-1;
  
endmodule: up_down_binary_counter