class Driver;
	virtual Intf VIF1;
	mailbox gen2driv;
	Transaction trans;
	function new(mailbox gen2driv, virtual Intf VIF1);
		this.gen2driv = gen2driv;
		this.VIF1     = VIF1;
	endfunction
	
	task run();
		repeat(REPETATIONS) begin
			@(posedge VIF1.clk) begin
				gen2driv.get(trans);
				VIF1.A    <=  trans.in1;
				VIF1.B 	  <=  trans.in2;
				trans.out <=  VIF1.sum;
				$display("<<< Driver >>> : time = %0t,  in1 = %3d, in2 = %3d, out = %4d\n---------------------------------------------------------------------------------", $time, trans.in1, trans.in2, trans.out);
			end
		end
	endtask
endclass: Driver