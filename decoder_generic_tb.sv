`include "decoder_generic.sv"

module decoder_generic_tb;
   
  localparam N = 2;
  var logic [N-1:0] 		a;
  var logic					en;
  wire logic [(2**N)-1:0] 	y;
  
  decoder_generic #(.N(N)) dut (.*);
  
  always begin
    #2 void'( std::randomize(a, en) );  
  end
  
  initial begin
    {a, en} = '0;
    $dumpfile("dump.vcd");
    $dumpvars;
    #50 $finish;
  end
  
  //By analyzing the waveform, we verify the design
  
endmodule: decoder_generic_tb