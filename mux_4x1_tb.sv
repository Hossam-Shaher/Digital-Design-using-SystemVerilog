`include "mux_4x1.sv"

module mux_4x1_tb;
  
  var logic x0, x1, x2, x3, s0, s1;
  wire logic f1, f2;
  
  mux_4x1_v1 mux1 (.*, .f(f1));
  mux_4x1_v2 mux2 (.*, .f(f2));
  
  always begin
    #2 void'( std::randomize(x0, x1, x2, x3, s0, s1) );  
  end
  
  initial begin
    {x0, x1, x2, x3, s0, s1} = '0;
    $dumpfile("dump.vcd");
    $dumpvars;
    #50 $finish;
  end
  
  ASSERT_f1_f2: assert final (f1===f2);
  
endmodule: mux_4x1_tb