`include "shift_register.sv"

module shift_register_tb;
  
  localparam N = 4;
  localparam half_cycle = 3;
  var  logic clk, reset, s_in;
  wire logic s_out;
  wire logic [N-1 : 0] Q_out;
  
  shift_register #(.N(N)) dut (.*);
  
  always #half_cycle clk = ~clk;
  
  var int unsigned delay1, delay2;
  always begin
    void'( std::randomize(delay1) with {delay1 < 2*half_cycle;} );
    #delay1 void'( std::randomize(s_in) with {s_in dist {0:=2, 1:=8};} );  
  end
  always begin
    void'( std::randomize(delay2) with {delay2 < 2*half_cycle;} );
    #delay2 void'( std::randomize(reset) with {reset dist {0:=9, 1:=1};} );  
  end
  
  initial begin
    {clk, s_in} = '0;
    reset = 1;
    $dumpfile("dump.vcd");
    $dumpvars;
    #100 $finish;
  end
  
endmodule: shift_register_tb