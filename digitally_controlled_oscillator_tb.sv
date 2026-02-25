`include "digitally_controlled_oscillator.sv"

module digitally_controlled_oscillator_tb;

  timeunit 1ns/ 1ns;
  
  localparam 	N = 5, 
  				p = 8,
				half_cycle = 5;
  //f_clk = 2*5ns = 10ns
  //f_clk = 1/(10ns) = 100 MHz 
  //f_clk_out = 100MHz * (8/2**5) = 25 MHz
  //T_clk_out = 1/(25MHz) = 40ns (verify this by analyzing waveform of clk_out)
  
  var  logic 			clk, reset;
  wire logic [N-1 : 0] 	Q;
  wire logic 			clk_out;
  
  DCO #(.N(N)) dco (.*);
  
  always #half_cycle clk = ~clk;
  
  initial begin
    clk = 0;
    reset = 1;
    #1 reset = 0;
    
    $dumpfile("dump.vcd");
    $dumpvars;
    #400 $finish;
  end
  
endmodule: digitally_controlled_oscillator_tb