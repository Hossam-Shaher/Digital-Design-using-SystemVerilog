`include "full_adder.sv"

module FA_tb;
  
  var logic a, b, c_in;
  wire logic s_1, c_out_1, s_2, c_out_2;
  
  FA_v1 fa1 (.*, .s(s_1), .c_out(c_out_1));
  FA_v2 fa2 (.*, .s(s_2), .c_out(c_out_2));
  
  always begin
    #2 void'( std::randomize(a, b, c_in) );  
  end
  
  initial begin
    {a, b, c_in} = '0;
    $dumpfile("dump.vcd");
    $dumpvars;
    #50 $finish;
  end
    
  ASSERT_s: 	assert final (s_1===s_2);
  ASSERT_c_out: assert final (c_out_1===c_out_2);

endmodule: FA_tb