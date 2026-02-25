/*********************************************
hex to seven segment decoder (common anode)

                    a
                ---------
                | 		| 
              f	| 		| b
                | 	g	|
                ---------
                |		|
              e	| 		| c
                | 		|
                ---------
                    d
                    
*********************************************/

module hex2sevseg(
  input [3:0] hex,
  output logic [6:0] sevseg		//arranged as gfedcba
);
  
  always@(*) 
    case(hex)
      4'h0: 	sevseg = 7'b 1000000;
      4'h1: 	sevseg = 7'b 1111001;
      4'h2: 	sevseg = 7'b 0100100;
      4'h3: 	sevseg = 7'b 0110000;
      4'h4: 	sevseg = 7'b 0011001;
      4'h5: 	sevseg = 7'b 0010010;
      4'h6: 	sevseg = 7'b 0000010;
      4'h7: 	sevseg = 7'b 1111000;
      4'h8: 	sevseg = 7'b 0000000;
      4'h9: 	sevseg = 7'b 0010000;
      4'hA: 	sevseg = 7'b 0001000;
      4'hB: 	sevseg = 7'b 0000011;
      4'hC: 	sevseg = 7'b 1000110;
      4'hD: 	sevseg = 7'b 0100001;
      4'hE: 	sevseg = 7'b 0000110;
      4'hF: 	sevseg = 7'b 0001110;
      default: 	sevseg = 7'b 1111111;
    endcase

endmodule: hex2sevseg
