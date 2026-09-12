Generate two clocks having a frequency ratio of 2:1.  

`timescale 1ns/1ps

module tb;
  
  bit clk1;
  bit clk2;
  
  always #25 clk1 = ~clk1;
  always #50 clk2 = ~clk2;
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
  
  initial begin
    #100;
    $finish();
  end
endmodule