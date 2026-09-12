Generate a clock with a 25% duty cycle.

`timescale 1ns/1ps

module tb;
  
  bit clk;
  
  always #31.25 clk = ~ clk;  //For 8MHz 25% duty cycle
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
  
  initial begin
    #100;
    $finish();
  end
endmodule