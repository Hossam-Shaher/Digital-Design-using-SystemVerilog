//generic MUX
//width of selector signal: N bits
//number of input busses: 2**N
//width of input and output signals: M bits

module mux_generic
  #(parameter N=3, M=4)(
    input wire logic [(2**N)-1:0] [M-1:0] x,
    input wire logic [N-1:0] s,
    output logic [M-1:0] f
  );
  
  logic [N-1:0] i = 0;	//iterator
  
  always@(*) begin
    f = 'x;
    
    for(i=0; i<=(2**N)-1; i++)
      if(s===i) begin
        f = x[i];
        break;
      end
    
  end
  
endmodule: mux_generic