//A shifter (comb circuit) shifts a binary number left or right by a specified number of positions
//
//M-bit Shifter:
// Inputs:
//    1. Shift amount selectors: 	shamt	(N bits).
//    2. Input data: 				A		(M bits, where M= 2**N).
// Output:
//       Output data: 				Y		(M bits, where M= 2**N).
//
//In DDCA, see: "5.2.5 Shifters and Rotators".


module shifter
  #(parameter N = 2) (
    input wire logic [N-1 : 0] 		shamt,
    input wire logic [(2**N)-1 : 0]	A,
    output var logic [(2**N)-1 : 0] Y
  );
  
  always_comb
    Y = A << shamt;			//shift left
//	Y = A >> shamt;			//logical shift right
//	Y = A >>> shamt;		//arithmetic shift right
  
endmodule: shifter