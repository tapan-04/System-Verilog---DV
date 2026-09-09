module tb;
  
  bit [3:0] a,b;
  bit [4:0] y;
  
  bit clk = 0;
  
  always #5 clk = ~clk; 
  
  task add ();
   y = a + b;
   $display("a : %0d and b : %0d and y : %0d",a,b,y);
  endtask
  
  task stim_a_b();
    a = 1;
    b = 3;
    add();
    #10;
    a = 5;
    b = 6;
    add();
    #10;
    a = 7;
    b = 8;
    add();
    #10;
  endtask
  
  initial begin
   
    for(int i = 0; i< 11 ; i++) begin
    stim_a_b();

    end
  end
  
  initial begin
    #30;
    $finish();
  end
endmodule