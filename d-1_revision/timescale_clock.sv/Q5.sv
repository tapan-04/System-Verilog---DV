Write a testbench that generates two clocks with different frequencies.

`timescale 1ns/1ps

module tb;
  
  bit clk1;
  bit clk2;
  
  always #31.25 clk1 = ~clk1;  //16Mhz
  always #62.5 clk2 = ~clk2;   //8Mhz
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
  
  initial begin
    #150;
    $finish();
  end
endmodule