module D_latch(
  input D, clk,
  output reg Q, Q_b
);
  
  always_latch
    if(clk)
      Q = D;
      
  assign Q_b = ~Q;	//you can declare Q_b as a wire for backward compatibility with Verilog 
    
endmodule: D_latch