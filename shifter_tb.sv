`include "shifter.sv"

module shifter_tb;

  localparam N = 2;
  var  logic [N-1 : 0] 		shamt;
  var  logic [(2**N)-1 : 0]	A;
  wire logic [(2**N)-1 : 0] Y;
  
  shifter #(N) dut (.*);
  
  always begin
    #2 void'( std::randomize(shamt, A) );  
  end
  
  initial begin
    {shamt, A} = '0;
    $dumpfile("dump.vcd");
    $dumpvars;
    #50 $finish;
  end
  
  //model + scoreboard
  var logic [(2**N)-1 : 0] Y_m;	//m for model
  always_comb begin
    Y_m = A << shamt;
//	Y_m = A >> shamt;
//	Y_m = A >>> shamt;
    
    ASSERT_Y: assert final (Y===Y_m);
  end
  
endmodule: shifter_tb