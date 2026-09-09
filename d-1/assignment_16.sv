"Assume class consists of three data members a, b, and c each of size 4-bit. 
Create a task inside the class that returns the result of the addition of data
 members. The task must also be capable of sending the value of a, b, c, and 
 result to the console. Verify code for a = 1, b = 2, and c = 4."

 class first;
  
  bit [3:0] a;
  bit [3:0] b;
  bit [3:0] c;
  bit [4:0] y;
  
  task add();
    y = a + b + c;
    $display(" a : %0d, b : %0d, c : %0d\n y : %0d ", a,b,c,y);
  endtask
endclass

module tb;
  
  first f1;
  
  initial begin
    
    f1 = new();
    
    f1.a = 1;
    f1.b = 2;
    f1.c = 4;
    
    f1.add();
  end
endmodule