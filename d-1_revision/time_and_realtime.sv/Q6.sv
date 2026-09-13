Write code to measure the clock frequency using realtime.

`timescale 1ns/1ps

module tb;
  
  realtime start_time;
  realtime end_time;
  realtime period;
  realtime frequency;
  
  initial begin
    #11;
    start_time = $realtime;
    
    #11.67;
    end_time = $realtime;
    
    period = end_time - start_time;
    
    frequency = 1.0 / period;
    
    $display("Value : %0f", frequency);
  end
endmodule

