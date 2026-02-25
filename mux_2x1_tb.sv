`include "mux_2x1.sv"

module mux_2x1_tb;
  
  var logic x0, x1, s;
  wire logic f1, f2, f3, f4, f5;
  
  mux_2x1_v1 mux1 (.*, .f(f1));
  mux_2x1_v2 mux2 (.*, .f(f2));
  mux_2x1_v3 mux3 (.*, .f(f3));
  mux_2x1_v4 mux4 (.*, .f(f4));
  mux_2x1_v5 mux5 (.*, .f(f5));
  
  always begin
    #2 std::randomize(x0, x1, s);  
  end
  
  initial begin
    x0 = (x1 = (s = 1'b0));
    $dumpfile("dump.vcd");
    $dumpvars;
    #50 $finish;
  end
  
  ASSERT_f1_f2: assert final (f1===f2);
  ASSERT_f1_f3: assert final (f1===f3);
  ASSERT_f1_f4: assert final (f1===f4);
  ASSERT_f1_f5: assert final (f1===f5);
  
endmodule: mux_2x1_tb