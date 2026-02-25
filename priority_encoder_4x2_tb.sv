`include "priority_encoder_4x2.sv"

module priority_encoder_4x2_tb;
   
  var  logic [3:0] 	a;
  wire logic [2:0] 	y1, y2;
  wire logic		none1, none2;
  
  priority_encoder_4x2_v1 dut1 (a, y1, none1);
  priority_encoder_4x2_v2 dut2 (a, y2, none2);
  
  always begin
    #2 void'( std::randomize(a) );  
  end
  
  initial begin
    a = '0;
    $dumpfile("dump.vcd");
    $dumpvars;
    #50 $finish;
  end
  
  ASSERT_y: 	assert final (y1===y2);
  ASSERT_none: 	assert final (none1===none2);
  
endmodule: priority_encoder_4x2_tb