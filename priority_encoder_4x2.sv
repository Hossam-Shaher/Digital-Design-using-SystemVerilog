//version 1: always_comb + conditional statement
module priority_encoder_4x2_v1(
  input [3:0] a,
  output var [2:0] y,
  output var none
);
  
  always_comb begin
    
    none = 0;
    y = 'x;
    
    if(a[3] == 1'b1)	
      y = 3;
    else if(a[2] == 1'b1)
      y = 2;
    else if(a[1] == 1'b1)
      y = 1;
    else if(a[0] == 1'b1)
      y = 0;
    else  
      none = 1'b1;
    
  end
  
endmodule: priority_encoder_4x2_v1

//version 2: always_comb + case statement
module priority_encoder_4x2_v2(
  input [3:0] a,
  output var [2:0] y,
  output var none
);
  
  always_comb begin
    
    none = 0;
    y = 'x;
    
    casex(a)
      4'b1xxx: y = 3;
      4'b01xx: y = 2;
      4'b001x: y = 1;
      4'b0001: y = 0;
      default: none = 1; 
    endcase
  
  end

endmodule: priority_encoder_4x2_v2