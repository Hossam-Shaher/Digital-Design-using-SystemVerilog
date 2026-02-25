//2**N-word × M-bit RAM with two ports:
//  port 1: addr1, rd1, wd1, we1	(read/write on rising edge of clock (sync))
//  port 2: addr2, rd2, wd2, we2	(read/write on rising edge of clock (sync))

module RAM 
  #(parameter N=6, M=32)(
    input wire logic 			clk, 
                                we1,
    							we2,
    input wire logic [N-1 : 0] 	addr1,
                                addr2, 
    input wire logic [M-1 : 0] 	wd1,
    							wd2,
    output var logic [M-1 : 0] 	rd1, 
                                rd2
  );
  
  logic [M-1 : 0] ram [0 : (2**N)-1];
  
  always @(posedge clk) begin
    if(we1)
      ram[addr1] <= wd1;
    
    rd1 <= ram[addr1]; 
  end
  
  always @(posedge clk) begin
    if(we2)
      ram[addr2] <= wd2;
    
    rd2 <= ram[addr2];
  end

endmodule: RAM