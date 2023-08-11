class Scoreboard;
    Transaction tr;
    mailbox mon2scb;
    
    function new(mailbox mon2scb);
        this.mon2scb = mon2scb;
    endfunction :new

    task main ();
        repeat(100) begin 
            mon2scb.get(tr);
            if ({tr.carry, tr.sum} == tr.a + tr.b) begin
                $display("@%0t  PASSED: a = %5d   b = %5d  sum = %6d   carry = %1d", $time, tr.a, tr.b, tr.sum, tr.carry);
            end
            else begin
                $error("@%0t  Failed: a = %5d   b = %5d  sum = %6d   carry = %1d", $time, tr.a, tr.b, tr.sum, tr.carry);
            end
        end
    endtask :main
endclass :Scoreboard
