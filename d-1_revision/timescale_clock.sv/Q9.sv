Generate a clock using timeunit instead of `timescale.

module tb;
  
  timeunit 1ns;
  timeprecision 1ps;
  
  bit clk = 0;
  
  always #25 clk = ~clk;
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
  
  initial begin
    #100;
    $finish();
  end
endmodule