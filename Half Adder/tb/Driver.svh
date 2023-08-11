class Driver;
    virtual half_adder_if  ha_vif;
    Transaction    tr;
    mailbox        gen2drv;

    function new (virtual half_adder_if ha_vif, mailbox gen2drv);
        this.ha_vif    = ha_vif;
        this.gen2drv   = gen2drv;
    endfunction :new

    task main();
        repeat(100) begin
            @(negedge ha_vif.clk)begin
                gen2drv.get(tr);
                ha_vif.a <= tr.a;
                ha_vif.b <= tr.b;
            end
        end
    endtask :main
endclass :Driver
