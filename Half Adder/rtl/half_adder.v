module half_adder (clk, rst, a, b, sum, carry);
    input clk, rst;
    input [2:0] a, b;
    output reg [2:0] sum;
    output reg carry;

    always @(posedge clk) begin
        if (rst) begin
            sum   <= 0;
            carry <= 0;
        end
        else begin
            {carry, sum} <= a + b;
        end
    end
endmodule
