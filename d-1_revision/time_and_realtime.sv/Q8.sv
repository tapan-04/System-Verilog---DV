Write code to calculate the time between two posedge clk events.

`timescale 1ns/1ps

module tb;
  
  reg clk = 0;
  realtime start_time;
  realtime end_time;
  realtime period;
  
  always #11 clk = ~clk;
    
    initial begin
      @(posedge clk);
      start_time = $realtime;
      
      @(posedge clk);
      end_time = $realtime;
  
      period = end_time - start_time;
  
      $display("Time between posedges : %0t", period);
      
      $finish();
      
    end
  
endmodule