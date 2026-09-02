"Assume a SPI module consists of serial clock signal "sclk". Use an 
initial block to initialize sclk to '0 and Generate a 9 MHz square 
wave waveform for the Signal sclk. Assume a timescale of 1 ns/1 ps. 
Half clock period value should have precision of upto 3-bits in a case 
of floating value."

`timescale of 1 ns/1 ps

module tb();
  
  reg sclk = 0;
  
  always #55.56 sclk = ~sclk;
    
    initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
 
 
  initial begin
    #200;
    $finish();
  end
  
endmodule
 