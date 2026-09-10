class first;
  
  int data = 11;
  
  task display();
    $display("Value : %0d", data);
  endtask
  
endclass

class second;
  
  first f1;
  
  function new();
    f1 = new();
  endfunction
  
endclass

module tb;
  second s;
  
  initial begin
  
  s = new();
  $display("Value : %0d", s.f1.data);
  s.f1.display();
    
  s.f1.data = 10;
  s.f1.display();
    
  end
  
endmodule