module T_ff(
  input logic 	clk,
                reset_n,	//asynchronous reset
                T,
  output logic 	Q,
  				Q_b
);
  
  always_ff @(posedge clk, negedge reset_n)
    if(!reset_n)
      Q <= 0;
    else
      Q <= T? Q : ~Q;
      
  assign Q_b = ~Q;
  
endmodule: T_ff