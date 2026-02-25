//2**N-word × M-bit register file with three ports:
//  port 1: addr1, rd1			(read combinationally (async))
//  port 2: addr2, rd2			(read  on rising edge of clock (sync))
//  port 3: addr3, wd3, we3 	(write on rising edge of clock (sync))
//register 0 is hardwired to 0

module register_file 
  #(parameter N=6, M=32)(
    input wire logic 			clk, 
                                we3,
    input wire logic [N-1 : 0] 	addr1,
                                addr2, 
                                addr3,
    input wire logic [M-1 : 0] 	wd3,
    output var logic [M-1 : 0] 	rd1, 
                                rd2
  );
  
  logic [M-1 : 0] reg_file [0 : (2**N)-1];
  
  always_ff @(posedge clk)
    if(we3)
      reg_file[addr3] <= wd3;
  
  always_comb
    rd1 = (addr1 === 1'b0)? '0 : reg_file[addr1];
  
  always_ff @(posedge clk)
    rd2 <= (addr2 === 1'b0)? '0 : reg_file[addr2];

endmodule: register_file