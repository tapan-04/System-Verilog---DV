Initialize the clock to 0 and generate the clock continuously. ?

`timescale 1ns/1ps

module tb;
  
  bit clk;
  
  initial begin
    clk = 0;
  end
  
  always #20 clk = ~clk;
    
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
  
  initial begin
    #100;
    $finish();
  end
endmodule