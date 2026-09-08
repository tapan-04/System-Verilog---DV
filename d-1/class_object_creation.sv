class first;
  
  
  reg [2:0] data = 10; //[2:0] = 3 bits, 10 needs 4 bits 1010. So it keeps lowest 3 values 010 = 3//
  reg [1:0] data2 = 11;
  
endclass

module tb;
  
  initial begin
  
  first f;
  
  f = new();
  #1;
  $display("Value of data : %0d and data2 : %0d",f.data,f.data2);
    
  end
endmodule
