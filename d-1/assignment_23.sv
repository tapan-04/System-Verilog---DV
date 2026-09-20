"Create two tasks each capable of sending a message to Console at a fixed 
interval. Assume Task1 sends the message "Task 1 Trigger" at an interval of 20 
ns while Task2 sends the message "Task 2 Trigger" at an interval of 40 ns. Keep 
the count of the number of times Task 1 and Task 2 trigger by adding a variable 
for keeping the track of task execution and incrementing with each trigger. 
Execute both tasks in parallel till 200 nsec. Display the number of times Task 1 
and Task 2 executed after 200 ns before calling $finish for stopping the simulation.

module tb;
 
task example;
#20;
$display("example trigger");
endtask
 
..........................
.........................
 
 
 
endmodule"

-----------------

module tb;

  int count1 = 0;
  int count2 = 0;

  task task1();

    #20;
    $display("Packet Sent at %0t", $time);
    count1++;

  endtask

  task task2();

    #40;
    $display("Packet Received at %0t", $time);
    count2++;

  endtask

  initial begin

    fork

      begin
        repeat(10)  //Using repeat instead of for loop
          task1();
      end

      begin
        repeat(5)
          task2();
      end

    join

    $display("Task 1 executed %0d times", count1);
    $display("Task 2 executed %0d times", count2);

    $finish();
  end
endmodule
