`include "fsm_mealy_101_detector.sv"
`include "fsm_moore_101_detector.sv"

module fsm_mxxxx_101_detector_tb;

  //timeunit 1ns; timeprecision 1ps;

  localparam 	half_cycle = 3;
  var  logic 	clk, reset_n, 
                x; 
  wire logic 	y_mealy, y_moore;

  fsm_mealy_101_detector mealy (.*, .y(y_mealy)); 
  fsm_moore_101_detector moore (.*, .y(y_moore)); 

  always #half_cycle clk = ~clk;

  initial begin

    @(posedge clk) x <= 1;
    @(posedge clk) x <= 0;
    @(posedge clk) x <= 0;
    @(posedge clk) x <= 1;
    @(posedge clk) x <= 0;
    @(posedge clk) x <= 1;	//101
    @(posedge clk) x <= 0;
    @(posedge clk) x <= 1;	//101
    @(posedge clk) x <= 1;
    @(posedge clk) x <= 0;
    @(posedge clk) x <= 1;	//101

    #(4*half_cycle) $finish;

  end

  initial begin
    clk <= 0;
    x <= 0;

    reset_n <= 1;
    #1 reset_n <= 0;
    #1 reset_n <= 1;

    $dumpfile("dump.vcd");
    $dumpvars;
  end

endmodule: fsm_mxxxx_101_detector_tb
