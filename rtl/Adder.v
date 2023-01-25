module Adder(Intf.dut IF1);
	always @(posedge IF1.clk) begin
		IF1.sum = IF1.A + IF1.B;
	end
endmodule