// version 1: always_comb + conditional statement
module decoder_2x4_v1(
  input wire logic [1:0] a,
  output var logic [3:0] y
);
  
  always_comb
    if(a == 0)
      y = 4'b0001;
    else if(a == 1)
      y = 4'b0010; 
    else if(a == 2)
      y = 4'b0100;
    else if(a == 3)
      y = 4'b1000;
    else
      y = 4'b0000;
      
endmodule: decoder_2x4_v1

// version 2: always_comb + case statement
module decoder_2x4_v2(
  input wire logic [1:0] a,
  output var logic [3:0] y
);
  
  always_comb
    case(a)
      0: y = 4'b0001;
      1: y = 4'b0010;
      2: y = 4'b0100;
      3: y = 4'b1000;
      default  y = 4'b0000;
    endcase
      
endmodule: decoder_2x4_v2

// version 3: always_comb + assignments
module decoder_2x4_v3(
  input wire logic [1:0] a,
  output var logic [3:0] y
);
  
  always_comb begin
    y = 4'b0000;
    y[a] = 1'b1;
  end
      
endmodule: decoder_2x4_v3