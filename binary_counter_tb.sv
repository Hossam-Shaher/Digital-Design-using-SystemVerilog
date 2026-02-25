`include "binary_counter.sv"

module binary_counter_tb;
  
  localparam N = 3;
  localparam half_cycle = 3;
  var  logic clk, reset;
  wire logic [N-1 : 0] Q;
  wire logic clk_out;
  
  binary_counter #(.N(N)) dut (.*);
  
  always #half_cycle clk = ~clk;
  
  var int unsigned delay1;
  always begin
    void'( std::randomize(delay1) with {delay1 < 2*half_cycle;} );
    #delay1 void'( std::randomize(reset) with {reset dist {0:=9, 1:=1};} );  
  end
  
  initial begin
    clk = 0;
    reset = 1;
    $dumpfile("dump.vcd");
    $dumpvars;
    #100 $finish;
  end
  
endmodule: binary_counter_tb