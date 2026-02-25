// N to 2**N decoder

module decoder_generic
  #(parameter N = 2) (
    input wire logic [N-1 : 0] 		a,
    input wire logic 				en,
    output var logic [(2**N)-1 : 0]	y
  );
  
  always_comb
    if(en) begin
      y = '0;
      y[a] = 1'b1;
    end
    else
      y = '0;
    
endmodule: decoder_generic
    