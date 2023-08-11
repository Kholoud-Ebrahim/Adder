module top;
    bit clk, rst;

    half_adder_if  _if(clk, rst);
    half_adder     _ha (_if.clk, _if.rst, _if.a, _if.b, _if.sum, _if.carry);
    Test           _ts (_if);

    initial begin
        forever begin
            #5ns;
            clk = ~clk;
        end
    end
    initial begin
        rst = 1; #10; rst = 0;
    end
    initial begin
        #1000;
        $finish;
    end

endmodule :top
