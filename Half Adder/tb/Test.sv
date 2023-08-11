`include "Transaction.svh"
`include "Generator.svh"
`include "Driver.svh"
`include "Monitor.svh"
`include "Scoreboard.svh"
`include "Env.svh"

module Test(half_adder_if  ha_if);
    Env env;

    initial begin
        env = new(ha_if);
        env.run();
    end
endmodule :Test
