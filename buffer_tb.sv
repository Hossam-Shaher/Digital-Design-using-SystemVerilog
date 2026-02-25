`include "buffer.sv"

module buffer_tb;
  
  var logic [15:0] I = '0;
  wire logic [15:0] O; 		//do now rite "= '0", 
  							//bcz it will be implicit cont assign 
  							//not initialization
  
  buffer buff (.*);
  
  always begin
    #2 void'( std::randomize(I) );  
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    #50 $finish;
  end
  
  ASSERT: assert final (O==I);
  
endmodule: buffer_tb