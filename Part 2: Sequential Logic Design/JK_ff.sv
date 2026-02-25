module JK_ff(
  input logic 	clk,
                reset_n,	//asynchronous reset
                j,
                k,
  output logic 	Q,
  				Q_b
);
  
  always_ff @(posedge clk, negedge reset_n)
    if(!reset_n)
      Q <= 0;
  else
    case({j, k})
      2'b00: Q <= Q;
      2'b01: Q <= 0;
      2'b10: Q <= 1;
      2'b00: Q <= ~Q;
    endcase
      
  assign Q_b = ~Q;
  
endmodule: JK_ff
  