Write a testbench to generate an 8 MHz clock.

`timescale 1ns/1ps

module tb;
  
  bit clk;
  
  always #62.5 clk = ~ clk;
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
  
  initial begin
    #100;
    $finish();
  end
endmodule