module fsm_moore_101_detector(
  input wire logic 	clk,
  					reset_n,	//async
  					x,
  output var logic	y
);
  
  //state encoding: typedef enum
  typedef enum bit [1:0] {S0, S1, S2, S3} state_e;
  
  state_e crnt_state, nxt_state;
  
  //register: always_ff
  always_ff @(posedge clk, negedge reset_n)
    if(!reset_n)
      crnt_state <= S0;
    else
      crnt_state <= nxt_state;

  //next state logic: always_comb + case statement
  always_comb
    case({crnt_state, x})
      {S0, 1'b0}: nxt_state = S0;
      {S0, 1'b1}: nxt_state = S1;
      {S1, 1'b0}: nxt_state = S2;
      {S1, 1'b1}: nxt_state = S1;
      {S2, 1'b0}: nxt_state = S0;
      {S2, 1'b1}: nxt_state = S3;
      {S3, 1'b0}: nxt_state = S2;
      {S3, 1'b1}: nxt_state = S1;
    endcase
  
  //output logic: cont assign
  assign y = (crnt_state===S3)? 1 : 0;
  
endmodule: fsm_moore_101_detector