`include "ripple_carry_adder_subtractor.sv"

module RCAS_Nbit_tb;
  
  localparam N = 4;
  var logic [N-1:0] a, b;
  var logic add_sub;
  wire logic [N-1:0] s;
  wire logic c_out;
  
  RCAS_Nbit #(.N(N)) dut (.*);
  
  always begin
    #2 void'( std::randomize(a, b, add_sub) );  
  end
  
  initial begin
    {a, b, add_sub} = '0;
    $dumpfile("dump.vcd");
    $dumpvars;
    #50 $finish;
  end
  
  //model + scoreboard
  var logic [N-1:0] s_m;	//m for model
  var logic c_out_m;
  always_comb begin
    if(!add_sub)
      {c_out_m, s_m} = a + b;
    else
      {c_out_m, s_m} = a - b;

    ASSERT_s: 		assert final (s===s_m);
    ASSERT_c_out: 	assert final (c_out===c_out_m);
  end
  
endmodule: RCAS_Nbit_tb