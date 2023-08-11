class Monitor;
    virtual half_adder_if  ha_vif; 
    Transaction   tr;
    mailbox       mon2scb;

    function new(virtual half_adder_if ha_vif, mailbox mon2scb);
        this.ha_vif  = ha_vif;
        this.mon2scb = mon2scb;
    endfunction :new

    task main();
        repeat(100) begin
            @(posedge ha_vif.clk) begin
                tr = new();
                tr.a     = ha_vif.a;
                tr.b     = ha_vif.b;
            end
            @(posedge ha_vif.clk) begin
                tr.sum   = ha_vif.sum;
                tr.carry = ha_vif.carry;
                mon2scb.put(tr);
            end
            /*
            covergroup cov1;
                cp1: coverpoint tr.a;
            endgroup
        
            cov1.sample();
            $display("Coverage: %.4f", cov1.get_coverage());
            */
        end
    endtask :main
endclass :Monitor
