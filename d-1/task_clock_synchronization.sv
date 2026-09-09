module tb;
  
  bit [3:0] a,b;
  bit [4:0] y;
  
  bit clk = 0;
  
  always #5 clk = ~clk;
  
  task add();
    y = a + b;
    $display("a : %0d and b : %0d and y : %0d", a,b,y);
  endtask
  
  task stimu_clk();
    @(posedge clk);
    a = $urandom;
    b = $urandom;
    add();
  endtask
  
  initial begin
    for(int i = 0; i < 11; i++) begin
      stimu_clk;
    end    
  end
  
  initial begin
    #110
    $finish();
  end
  
endmodule