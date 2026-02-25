module fsm_mealy_101_detector(
  input wire logic 	clk,
  					reset_n,	//async
  					x,
  output var logic	y
);
  
  //state encoding: typedef enum
  typedef enum bit [1:0] {S0, S1, S2} state_e;
  
  state_e crnt_state, nxt_state;
  
  //register: always_ff
  always_ff @(posedge clk, negedge reset_n)
    if(!reset_n)
      crnt_state <= S0;
    else
      crnt_state <= nxt_state;

  //next state logic + output logic: always_comb + case statement
  always_comb
    case({crnt_state, x})
      {S0, 1'b0}: 	begin 
                      nxt_state = S0;
                      y = 0;
                    end
      {S0, 1'b1}: 	begin 
                      nxt_state = S1;
                      y = 0;
                    end  
      {S1, 1'b0}: 	begin 
                      nxt_state = S2;
                      y = 0;
                    end  
      {S1, 1'b1}: 	begin 
                      nxt_state = S1;
                      y = 0;
                    end      
      {S2, 1'b0}: 	begin 
                      nxt_state = S0;
                      y = 0;
                    end      
      {S2, 1'b1}: 	begin 
                      nxt_state = S1;
                      y = 1;
                    end    
    endcase
  
endmodule: fsm_mealy_101_detector