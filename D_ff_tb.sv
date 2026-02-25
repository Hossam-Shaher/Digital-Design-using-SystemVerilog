`include "D_ff.sv"

module D_ff_tb;
   
  localparam half_cycle = 3;
  var  logic clk, D, reset_n, set_n;
  wire logic Q;
  
  D_ff_rst_set dut (.*);
  
  always #half_cycle clk = ~clk;
  
  var int unsigned delay1, delay2, delay3;
  always begin
    void'( std::randomize(delay1) with {delay1 < 2*half_cycle;} );
    #delay1 void'( std::randomize(D) );  
  end
  always begin
    void'( std::randomize(delay2) with {delay2 < 2*half_cycle;} );
    #delay2 void'( std::randomize(reset_n) with {reset_n dist {1:=8, 0:=2};} );  
  end
  always begin
    void'( std::randomize(delay3) with {delay3 < 2*half_cycle;} );
    #delay3 void'( std::randomize(set_n) );  
  end
  
  initial begin
    {clk, D} = '0;
    {reset_n, set_n} = '0;
    $dumpfile("dump.vcd");
    $dumpvars;
    #100 $finish;
  end
  
endmodule: D_ff_tb