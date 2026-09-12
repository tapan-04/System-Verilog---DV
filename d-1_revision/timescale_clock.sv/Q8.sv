Display the simulation time whenever the clock changes.

`timescale 1ns/1ps

module tb;
  
  bit clk = 0;
  
  always #25 clk = ~clk;
  
  always @(clk) begin
    $display("When value of clk change : %0t", $time);
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
  
  initial begin
    #100;
    $finish();
  end
endmodule