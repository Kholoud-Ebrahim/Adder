interface half_adder_if(input bit clk, rst);
    logic [2:0] a, b;
    logic [2:0] sum;
    logic carry; 
endinterface :half_adder_if
