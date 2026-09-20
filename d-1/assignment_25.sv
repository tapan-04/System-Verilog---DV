"Code for transaction class is mentioned in the Instruction tab. Write a code to 
send transaction data between generator and driver. Also, verify the data by 
printing the value of data members of Generator and Driver in each transaction. 
Execute the code for 10 random transactions.

class transaction;
 
rand bit [7:0] a;
rand bit [7:0] b;
rand bit wr;
 
endclass"

---------------

class transaction;

  rand bit [7:0] a;
  rand bit [7:0] b;
  rand bit wr;
endclass

class generator;

  transaction t;
  mailbox #(transaction) mbx;

  function new(mailbox #(transaction) mbx);
    this.mbx = mbx;
  endfunction

  task run();

    for(int i = 0; i < 10; i++) begin

      t = new();

      assert(t.randomize())
        else $display("Randomization Failed");

      $display("[GEN] : a = %0d, b = %0d, wr = %0b",
               t.a, t.b, t.wr);

      mbx.put(t);
    end
  endtask
endclass


class driver;

  transaction t;
  mailbox #(transaction) mbx;

  function new(mailbox #(transaction) mbx);
    this.mbx = mbx;
  endfunction

  task run();

    repeat(10) begin

      mbx.get(t);

      $display("[DRV] : a = %0d, b = %0d, wr = %0b",
               t.a, t.b, t.wr);
    end
  endtask
endclass


module tb;

  generator gen;
  driver drv;
  mailbox #(transaction) mbx;

  initial begin

    mbx = new();

    gen = new(mbx);
    drv = new(mbx);

    fork
      gen.run();
      drv.run();
    join
  end
endmodule