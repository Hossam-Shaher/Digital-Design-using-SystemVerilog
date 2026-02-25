//Unidirectional (left‐to‐right) shift register with parallel load.
//parallel input: 			D [M−1:0}
//and a control signal: 	load
//When Load is asserted, the flip-flops are loaded in parallel from the D inputs. 
//Otherwise, the shift register shifts normally.
//In DDCA, see: Figure 5.37 Shift register with parallel load

module shift_register_parallel_load
  #(parameter N = 8) (
    input 				clk, 
                        reset,
                        s_in,		//serial input
    		[N-1 : 0]	load,
    output 				s_out,		//serial output
    output 	[N-1 : 0]	Q_out 		//parallel outputs
  );
  
  reg [N-1 : 0] rgstr = '0;
  
  always_ff @(posedge clk, posedge reset) 
    if(reset)
      rgstr <= '0;
    else if(load)
      rgstr <= load;
    else
      rgstr <= {s_in, rgstr[N-1:1]};

  assign s_out = rgstr[0];
  
  assign Q_out = rgstr;
    
endmodule: shift_register_parallel_load