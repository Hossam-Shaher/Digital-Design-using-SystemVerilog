`include "arithmetic_logic_unit.sv"

module ALU_tb;
  
  typedef enum {ADD = 0, SUB = 1, AND = 2, OR = 3}	op_code_t;
  
  localparam N = 4;
  var logic [N-1:0] a, b;
  var op_code_t op_code;
  wire logic [N-1:0] rslt;
  wire logic z_f, n_f, ov_f, c_f;
  
  ALU #(.N(N)) alu (.*);
  
  always begin
    #2 void'( std::randomize(a, b, op_code) );  
  end
  
  initial begin
    {a, b, op_code} = '0;
    $dumpfile("dump.vcd");
    $dumpvars;
    #50 $finish;
  end
  
  //model
  var logic [N-1:0] rslt_m;	//m for model
  var logic z_f_m, n_f_m, ov_f_m, c_f_m;
  always@(*)
    case(op_code)
      ADD:		add_func(a, b, rslt_m, c_f_m, ov_f_m);
      SUB:		sub_func(a, b, rslt_m, c_f_m, ov_f_m);
      AND: 		and_func(a, b, rslt_m, c_f_m, ov_f_m);
      OR: 		 or_func(a, b, rslt_m, c_f_m, ov_f_m);
      default: 	default_func(  rslt_m, c_f_m, ov_f_m);
    endcase
  
  always@(*) z_f_m = ~|rslt;
  
  always@(*) n_f_m = rslt[N-1];
  
  function void add_func(input  logic [N-1:0] a, b, 
                         output logic [N-1:0] rslt, logic c_f, ov_f);
    {c_f, rslt} = a + b;
    ov_f =  ( a[N-1] & b[N-1] & ~rslt[N-1] ) | 
            ( ~a[N-1] & ~b[N-1] & rslt[N-1] );
  endfunction: add_func
  
  function void sub_func(input  logic [N-1:0] a, b, 
                         output logic [N-1:0] rslt, logic c_f, ov_f);
    {c_f, rslt} = a - b;
    ov_f =  ( a[N-1] & ~b[N-1] & ~rslt[N-1] ) | 
            ( ~a[N-1] & b[N-1] & rslt[N-1] );
  endfunction: sub_func
  
  function void and_func(input  logic [N-1:0] a, b, 
                         output logic [N-1:0] rslt, logic c_f, ov_f);
    rslt = a & b;
    c_f = (ov_f = 0);
  endfunction: and_func
  
  function void or_func(input  logic [N-1:0] a, b, 
                        output logic [N-1:0] rslt, logic c_f, ov_f);
    rslt = a | b;
    c_f = (ov_f = 0);
  endfunction: or_func
  
  function void default_func(output logic [N-1:0] rslt, logic c_f, ov_f);
    {ov_f, c_f, rslt} = 'z;
  endfunction: default_func
  
  //scoreboard
  ASSERT_rslt: 	assert final (rslt===rslt_m);
  ASSERT_z_f: 	assert final (z_f===z_f_m);
  ASSERT_n_f: 	assert final (n_f===n_f_m);
  ASSERT_ov_f: 	assert final (ov_f===ov_f_m);
  ASSERT_c_f: 	assert final (c_f===c_f_m);
  
endmodule: ALU_tb