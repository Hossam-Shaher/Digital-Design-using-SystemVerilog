//Unidirectional (left‐to‐right) shift register.
//It shifts its content to the right by one position in each clock cycle. 
//It consists of a chain of flip‐flops in cascade, 
//  with the output of one flip‐flop connected to the input of the next flip‐flop.
//In DDCA, see: Figure 5.36 Shift register schematic

module shift_register
  #(parameter N = 8) (
    input 				clk, 
                        reset,
                        s_in,		//serial input
    output 				s_out,		//serial output
    output [N-1 : 0]	Q_out 		//parallel outputs
  );
  
  reg [N-1 : 0] rgstr;
  
  always_ff @(posedge clk, posedge reset) 
    if(reset)
      rgstr <= '0;
    else
      rgstr <= {s_in, rgstr[N-1:1]};

  assign s_out = rgstr[0];
  
  assign Q_out = rgstr;
    
endmodule: shift_register