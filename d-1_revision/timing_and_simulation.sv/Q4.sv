Write an initial block that sets temp = 1, waits 10 ns, then sets it to 2.

module tb;
  
  int temp;
  
  initial begin
    temp = 1;
    $display("Value : %0d", temp);
    
    #10;
    temp = 2;
    
    $display("Value : %0d", temp);
  end
endmodule