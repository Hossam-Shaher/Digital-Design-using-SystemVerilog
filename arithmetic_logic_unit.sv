module ALU 
  #(parameter N = 4) (
    input wire logic [N-1 : 0]	a, b,
    input wire logic [1 : 0] 	op_code,
    output var logic [N-1 : 0]	rslt,
    output var logic			z_f, n_f, ov_f, c_f
  );
  
  typedef enum {ADD = 0, SUB = 1, AND = 2, OR = 3}	op_code_t;
  
  always @(*)
    case(op_code)
      ADD: 
        begin
          {c_f, rslt} = a + b;
          ov_f =  ( a[N-1] & b[N-1] & ~rslt[N-1] ) | 
                  ( ~a[N-1] & ~b[N-1] & rslt[N-1] );
        end
      SUB:
        begin
          {c_f, rslt} = a - b;
          ov_f =  ( a[N-1] & ~b[N-1] & ~rslt[N-1] ) | 
                  ( ~a[N-1] & b[N-1] & rslt[N-1] );
        end
      AND:
        begin
          rslt = a & b;
          c_f = (ov_f = 0);
        end
      OR:
        begin
          rslt = a | b;
          c_f = (ov_f = 0);
        end
      default {ov_f, c_f, rslt} = 'z;
    endcase
  
  assign z_f = (rslt === 0);
  
  assign n_f = rslt[N-1];

endmodule: ALU