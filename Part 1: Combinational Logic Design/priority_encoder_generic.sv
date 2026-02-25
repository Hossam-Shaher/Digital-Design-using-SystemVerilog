//generic priority encoder: 
//2**N inputs
//N+1  outputs

module priority_encoder_generic
  #(parameter N = 2)(
    input [(2**N)-1 : 0] 	a,
    output logic [N-1 : 0] 	y,
    output logic 			none
  );
  
  always_comb begin
    
    none = 1;
    y = 'x;
    
    for(int i=0; i<=(2**N)-1; i++)
      if(a[i] == 1'b1) begin
        y = i;
        none = 1'b0;
        break;
      end
    
  end
    
endmodule: priority_encoder_generic