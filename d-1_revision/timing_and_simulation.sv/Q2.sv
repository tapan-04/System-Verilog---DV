Write a testbench that generates a reset pulse:
reset = 1 for 10 ns
reset = 0 afterward

module tb;
  
  reg rst;
  
  initial begin
    rst = 1'b1;
    #10;
    $display("Reset : %0d", rst);
    rst = 1'b0;
    #10;
    $display("Reset : %0d", rst);
  end
endmodule
