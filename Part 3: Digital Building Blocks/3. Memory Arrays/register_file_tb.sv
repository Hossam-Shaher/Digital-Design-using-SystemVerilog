`include "register_file.sv"

module register_file_tb;

  localparam 	N = 2, 
  				M = 4,
    			half_cycle = 3;
  var  logic 			clk, we3; 
  var  logic [N-1:0] 	addr1, addr2, addr3;
  var  logic [M-1:0] 	wd3;
  wire logic [M-1:0] 	rd1, rd2;
  
  register_file #(N, M) dut (.*);
  
  always #half_cycle clk = ~clk;
  
  var int unsigned delay1, delay2, delay3, delay4, delay5;
  always begin
    void'( std::randomize(delay1) with {delay1 < 2*half_cycle;} );
    #delay1 void'( std::randomize(addr1) );  
  end
  always begin
    void'( std::randomize(delay2) with {delay2 < 2*half_cycle;} );
    #delay2 void'( std::randomize(addr2) );  
  end  
  always begin
    void'( std::randomize(delay3) with {delay3 < 2*half_cycle;} );
    #delay3 void'( std::randomize(addr3) with { addr3 != 0;} );  
  end
  always begin
    void'( std::randomize(delay4) with {delay4 < 2*half_cycle;} );
    #delay4 void'( std::randomize(we3) with {we3 dist {1:=8, 0:=2};} );  
  end
  always begin
    void'( std::randomize(delay5) with {delay5 < 2*half_cycle;} );
    #delay5 void'( std::randomize(wd3) );  
  end
  
  initial begin
    {clk, we3, addr1, addr2, addr3, wd3} = '0;
    $dumpfile("dump.vcd");
    $dumpvars;
    #50 $finish;
  end
  
endmodule: register_file_tb