`include "half_adder.sv"

module HA_tb;
  
  var logic a, b;
  wire logic s, c_out;
  
  HA ha (.*);
  
  always begin
    #2 void'( std::randomize(a, b) );  
  end
  
  initial begin
    {a, b} = '0;
    $dumpfile("dump.vcd");
    $dumpvars;
    #50 $finish;
  end
  
  //model + scoreboard
  var logic s_m, c_out_m;	//m for model
  always_comb begin
    {c_out_m, s_m} = a + b;
    
    ASSERT_s: 		assert final (s===s_m);
    ASSERT_c_out: 	assert final (c_out===c_out_m);
  end
  
endmodule: HA_tb