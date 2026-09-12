Generate a 16 MHz clock with 60% duty cycle.

`timescale 1ns/1ps

module tb;
  
  bit clk;
  
  always begin //16MHz Duty Cycle 60% is 62.5
    #37.5 clk = 1;  //High = 37.5
    #25 clk = 0;  //Low = 25
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