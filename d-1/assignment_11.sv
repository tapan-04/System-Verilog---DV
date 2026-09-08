"Create a Class consisting of 3 data members each of unsigned integer type. 
Initialize them to 45,78, and 90. Use the display function to print the values 
on the console."

class three;
  
 int unsigned data1;
 int unsigned data2;
 int unsigned data3;
  
endclass

module tb;

initial begin
  
  three t;
  
  t = new();
  t.data1 = 45;
  t.data2 = 78;
  t.data3 = 90;
  
  $display("Value of data1 : %0d , data2 : %0d and data3 : %0d", t.data1, t.data2, t.data3);
  
end
  
endmodule
