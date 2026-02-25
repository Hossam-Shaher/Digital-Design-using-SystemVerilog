//version 1:
//2**2-word × 4-bit ROM
//One port (addr1, rd1); read combinationally (async)
//Do not use $readmemb

module ROM_v1(
  input wire logic [1:0] addr1,
  output var logic [3:0] rd1
);
  
  always_comb
    case(addr1)
      2'b00: 	rd1 = 4'b11_11;
      2'b01: 	rd1 = 4'b11_00;
      2'b10: 	rd1 = 4'b10_00;
      2'b11: 	rd1 = 4'b00_01;
      default:	rd1 = 'x;
    endcase
    
endmodule: ROM_v1

//version 2:
//2**3-word × 2-bit ROM
//One port (addr1, rd1); read on rising edge of clock (sync)
//Use $readmemb

module ROM_v2(
  input wire logic clk,
  input wire logic [2:0] addr1,
  output var logic [1:0] rd1
);
  
  logic [1:0] rom [0 : (2**3)-1];
  
  initial 
    $readmemb("rom_contents.mem", rom);
  
  always_ff @(posedge clk)
    rd1 = rom[addr1];
/*
  assign rd1 = rom[addr1];		//read combinationally (async)
*/
  
endmodule: ROM_v2


  