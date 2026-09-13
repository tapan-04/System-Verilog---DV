Write a testbench that measures the delay between two events with fractional precision using realtime

`timescale 1ns/1ps

module tb;
  
  realtime start_time;
  realtime end_time;
  realtime delay;
  
  initial begin
    #11.67;
    start_time = $realtime;
    $display("start_time : %0t", start_time);
    
    #67.11;
    end_time = $realtime;
    $display("end_time : %0t", end_time);
    
    delay = end_time - start_time;
    $display("Delay between two events : %0t", delay);
  end
endmodule