class generator;
  
  randc bit [3:0] a , b;
  bit [3:0] y;
  
endclass

module tb;
  
  generator g;
  int i  = 0;
  int status = 0;
  
  initial begin
    g = new();
    
    for(i = 0; i < 10; i++) begin
      
      assert(g.randomize()) else begin
        $display("Randomization Failed at %0t", $time);
        $finish();
      end
      
      
      $display("Values of a : %0d and b : %0d", g.a, g.b);
      #10;
    end
  end
endmodule