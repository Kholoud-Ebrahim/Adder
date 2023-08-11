class Generator;
    Transaction tr;
    mailbox gen2drv;  

    function new(mailbox gen2drv);
        this.gen2drv = gen2drv;
    endfunction :new

    task main();
        repeat(100) begin
            tr = new();
            assert(tr.randomize());
            gen2drv.put(tr);
        end
    endtask :main
endclass :Generator
