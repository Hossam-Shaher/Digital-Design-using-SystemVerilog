`include "ROM.sv"

module ROM_tb;

  localparam half_cycle = 3;
  var  logic 		clk; 
  var  logic [2:0] 	addr1;
  wire logic [1:0] 	rd1;
  
  ROM_v2 rom (.*);
  
  always #half_cycle clk = ~clk;
  
  var int unsigned delay1;
  always begin
    void'( std::randomize(delay1) with {delay1 < 2*half_cycle;} );
    #delay1 void'( std::randomize(addr1) );  
  end
  
  initial begin
    {clk, addr1} = '0;
    $dumpfile("dump.vcd");
    $dumpvars;
    #50 $finish;
  end
  
endmodule: ROM_tb