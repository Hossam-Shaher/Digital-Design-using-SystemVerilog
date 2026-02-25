module decoder_2x4_en(
  input wire logic [1:0] a,
  input wire logic en,
  output var logic [3:0] y
);
  
  always_comb 
    if(en) begin 
      y = '0;
      y[a] = 1'b1;
    end
    else
      y = '0;
  
endmodule: decoder_2x4_en