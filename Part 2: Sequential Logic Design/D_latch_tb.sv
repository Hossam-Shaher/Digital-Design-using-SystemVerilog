`include "D_latch.sv"

module D_latch_tb;
   
  localparam half_cycle = 3;
  var  logic clk, D;
  wire logic Q, Q_b;
  
  D_latch dut (.*);
  
  always #half_cycle clk = ~clk;
  
  var int unsigned delay;
  always begin
    void'( std::randomize(delay) with {delay < 2*half_cycle;} );
    #delay void'( std::randomize(D) );  
  end
  
  initial begin
    {clk, D} = '0;
    $dumpfile("dump.vcd");
    $dumpvars;
    #100 $finish;
  end
  
endmodule: D_latch_tb