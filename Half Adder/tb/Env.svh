class Env;
    virtual half_adder_if  ha_vif;
    Generator    gen;
    Driver       drv;
    Monitor      mon;
    Scoreboard   scb;

    mailbox m1, m2;

    function new(virtual half_adder_if ha_vif);
        this.ha_vif = ha_vif;

        m1 = new();
        m2 = new();

        gen = new(m1);
        drv = new(ha_vif, m1);
        mon = new(ha_vif, m2);
        scb = new(m2);
    endfunction :new

    task main();
        fork
        gen.main();
        drv.main();
        mon.main();
        scb.main();
        join
    endtask :main

    task run();
        main();
    endtask :run

endclass :Env
