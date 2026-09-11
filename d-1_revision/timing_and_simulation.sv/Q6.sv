Write code to stop simulation after 200 ns.

module tb;
  
  bit clk;
  
  always #50 clk = ~clk;
  
  initial begin
    
    clk = 1'b0;
    $display("Value : %0d", clk);
    #50;
    $display("Value : %0d", clk);

  end
  
  initial begin
    #200;
    $finish();
  end
endmodule