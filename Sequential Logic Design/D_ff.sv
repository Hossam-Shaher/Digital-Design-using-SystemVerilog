//positive edge-triggered D flip-flop
module D_ff_pos(
  input D, clk,
  output logic Q
);
  
  always_ff @(posedge clk) 
    Q <= D;
    
endmodule: D_ff_pos

//negative edge-triggered D flip-flop
module D_ff_neg(
  input D, clk,
  output logic Q
);
  
  always_ff @(negedge clk) 
    Q <= D;
    
endmodule: D_ff_neg

//positive edge-triggered D flip-flop
//with asynchronous reset:  reset_n
//and synchronous reset: 	clear_n
module D_ff_rst(
  input 		D, 
  				clk,
            	reset_n, 	//asynchronous reset
            	clear_n, 	//synchronous reset
  output logic 	Q
);
  
  always_ff @(posedge clk, negedge reset_n)	//use negedge with reset_n
    										//and posedge with reset
    if(!reset_n)
      Q <= 0;
    else begin
      if(!clear_n)
        Q <= 1'b0;
      else 
        Q <= D;
    end
  
endmodule: D_ff_rst

//positive edge-triggered D flip-flop
//with asynchronous reset:  reset_n
//and synchronous set: 		set_n
module D_ff_rst_set(
  input 		D, 
  				clk,
            	reset_n, 	//asynchronous reset
            	set_n, 		//synchronous set
  output logic 	Q
);
  
  always_ff @(posedge clk, negedge reset_n)	//use negedge with reset_n
    										//and posedge with reset
    if(!reset_n)
      Q <= 0;
    else begin
      if(!set_n)
        Q <= 1'b1;
      else 
        Q <= D;
    end
  

endmodule: D_ff_rst_set
