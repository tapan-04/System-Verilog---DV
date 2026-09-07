"Create a Fixed-size array capable of storing 20 elements. Add random values
 to all the 20 elements by using $urandom function. Now add all the elements 
 of the fixed-size array to the Queue in such a way that the first element 
 of the Fixed-size array should be the last element of the Queue. Print
  all the elements of both fixed-size array and Queue on Console."

module tb;
   
  int farr[20];
  int qarr[$];
  
  initial begin
    
    for(int i = 0; i < 20; i++) begin
      farr[i] = $urandom;
      end
    
    for(int i =19; i >= 0; i--) begin
      qarr.push_back(farr[i]);
     end
    $display("farr : %0p", farr);
   $display("qarr : %0p", qarr);
  end
endmodule