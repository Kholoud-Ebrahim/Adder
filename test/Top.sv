parameter REPETATIONS =100;
	`include "Transaction.sv"
	`include "Generator.sv"
	`include "Driver.sv"
	`include "Monitior.sv"
    `include "ScoreBoard.sv"
    `include "Environment.sv"
interface Intf();
	bit[2:0]A, B;
	bit clk;
	bit[3:0]sum;
	initial begin
		forever begin #5 clk = ~clk; end 
	end
	modport dut(input A, B, clk, output sum);
endinterface

program test(Intf IF);
	Environment env;
	initial begin
		env = new(IF);
		env.run();
	end
endprogram: test

module Top;
	Intf IFC();
	Adder A1(IFC.dut);
	test  T1(IFC);
	initial begin 
      $dumpfile("test.vcd");
      $dumpvars;
    end
endmodule