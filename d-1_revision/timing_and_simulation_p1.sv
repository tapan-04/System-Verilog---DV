`timescale 1ns/1ps

module tb;
  reg clk;
  reg rst;
  reg [3:0] temp; 
  initial begin 
    clk = 1'b0;
    rst = 1'b0;
    #10;
  end 

  initial begin
    rst = 1'b1;
    #10;
    rst = 1'b0;
    #10;
  end
  
  initial begin
    temp = 4'b0001;
    #10;
    temp = 4'b0010;
    #10;
  end

  initial begin 
  $dumpfile("dump.vcd");
  $dumpvars;
  end
  
  initial begin
    $display("Value : %0d and time : %0t", temp, $time);
  end
  
  initial begin
    #200;
    $finish();
  end
  
endmodule
