class Transaction;
    static int unsigned i = 0;

    rand bit [2:0] a;
    rand bit [2:0] b;

    bit clk;
    bit rst;

    bit [2:0] sum;
    bit carry;

    function new();
        i++;
    endfunction : new

    function void post_randomize();
        $display ("Transaction (%0d): a = %0d, b = %0d", i, a, b);
    endfunction :post_randomize
endclass : Transaction
