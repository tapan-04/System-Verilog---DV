Create a class with 3 data members and initialize them using a constructor.

class first;
  
  int d1, d2, d3;
  
  function new( int d1, int d2, int d3);
    this.d1=d1;
    this.d2=d2;
    this.d3=d3;
  endfunction

    task display();
      $display("Value of d1 : %0d and d2 : %0d and d3 : %0d", d1, d2, d3);
    endtask
endclass
module tb;
  
    first f1;
  
    initial begin
      
      f1 = new( .d1(2), .d2(5), .d3(7));
      f1.display();
    end
endmodule