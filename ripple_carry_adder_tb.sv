`include "ripple_carry_adder.sv"

module RCA_Nbit_tb;
  
  localparam N = 4;
  var logic [N-1:0] a, b;
  var logic c_in;
  wire logic [N-1:0] s;
  wire logic c_out;
  
  RCA_Nbit #(.N(N)) dut (.*);
  
  always begin
    #2 void'( std::randomize(a, b, c_in) );  
  end
  
  initial begin
    {a, b, c_in} = '0;
    $dumpfile("dump.vcd");
    $dumpvars;
    #50 $finish;
  end
  
  //model + scoreboard
  var logic [N-1:0] s_m;	//m for model
  var logic c_out_m;
  always_comb begin
    {c_out_m, s_m} = a + b + c_in;
    
    ASSERT_s: 		assert final (s===s_m);
    ASSERT_c_out: 	assert final (c_out===c_out_m);
  end
  
endmodule: RCA_Nbit_tb