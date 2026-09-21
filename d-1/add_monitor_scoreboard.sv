class transaction;

    randc bit [3:0] a;
    randc bit [3:0] b;
    bit [4:0] sum;

    function void display();
        $display("a : %0d \t b : %0d \t sum : %0d",
                 a, b, sum);
    endfunction

endclass


interface add_if;

    logic [3:0] a;
    logic [3:0] b;
    logic [4:0] sum;
    logic       clk;

endinterface


class monitor;

    mailbox #(transaction) mbx;
    transaction trans;
    virtual add_if aif;

    function new(mailbox #(transaction) mbx);
        this.mbx = mbx;
    endfunction

    task run();

        forever begin

            @(posedge aif.clk);

            trans = new();

            trans.a   = aif.a;
            trans.b   = aif.b;
            trans.sum = aif.sum;

            $display("[MON] : DATA SENT TO SCOREBOARD");

            trans.display();

            mbx.put(trans);

        end

    endtask

endclass


class scoreboard;

    mailbox #(transaction) mbx;
    transaction trans;

    function new(mailbox #(transaction) mbx);
        this.mbx = mbx;
    endfunction

    task run();

        forever begin

            mbx.get(trans);

            $display("[SCO] : DATA RECEIVED FROM MONITOR");

            trans.display();

        end

    endtask

endclass


module tb;

    add_if aif();

    monitor mon;
    scoreboard sco;

    mailbox #(transaction) mbx;

    // DUT
    add dut (
        .clk (aif.clk),
        .a   (aif.a),
        .b   (aif.b),
        .sum (aif.sum)
    );


    // Clock
    initial begin
        aif.clk = 0;
    end

    always #10 aif.clk = ~aif.clk;


    // Stimulus
    initial begin

        aif.a = 0;
        aif.b = 0;

        repeat(20) begin

            @(posedge aif.clk);

            aif.a <= $urandom_range(0,15);
            aif.b <= $urandom_range(0,15);

        end

    end


    // Create TB components
    initial begin

        mbx = new();

        mon = new(mbx);
        sco = new(mbx);

        mon.aif = aif;

    end


    // Run monitor and scoreboard
    initial begin

        fork

            mon.run();
            sco.run();

        join

    end


    // Simulation control
    initial begin

        $dumpfile("dump.vcd");
        $dumpvars;

        #450;

        $finish();

    end

endmodule