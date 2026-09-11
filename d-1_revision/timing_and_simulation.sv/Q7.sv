Declare a 4-bit register called temp.

module tb;
  
  bit [3:0] temp;
  
  initial begin
    temp = 4'b0100;
    $display("Vlaue of Temp : %0d", temp);
  end
endmodule