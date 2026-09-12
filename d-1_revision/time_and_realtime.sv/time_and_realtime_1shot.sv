`timescale 1ns/1ps

module tb();
  
  time fix_time = 0;
  realtime real_time = 0;
  
  initial begin
    #12;
    fix_time = $time();
    $display ("real time : %0t", fix_time);
  end
  
  initial begin
    #12.67;
    real_time = $realtime();
    $display ("floating time : %0t", real_time);
  end
  
endmodule