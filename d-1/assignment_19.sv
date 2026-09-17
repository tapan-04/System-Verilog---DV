"Assume generator class consists of three 8-bit data members (x,y, and z). 
Write a code to generate 20 random values for all the data members at an interval 
of 20 ns. Random values for all data members should range from 0 to 50."

class generator;
  rand bit [7:0] x,y,z;
  
  constraint data{
    x inside {[0:50]};
    y inside {[0:50]};
    z inside {[0:50]};
  }
endclass

module tb;
  
  generator g;
  
  initial  begin
    g = new();
    
    for (int i=0; i<20; i++)begin
      assert(g.randomize());
      $display("X : %0d, y : %0d, z = %0d, Time = %0t", g.x, g.y, g.z, $time);
      #20;
    end
  end
endmodule