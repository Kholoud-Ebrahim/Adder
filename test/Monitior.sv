class Monitior ;
	virtual Intf VIF2;
	mailbox mon2scb;
	Transaction trans;
	function new (virtual Intf VIF2, mailbox mon2scb);
		this.mon2scb = mon2scb;
		this.VIF2    = VIF2;
	endfunction
	
	task run();
		repeat(REPETATIONS) begin
			@(posedge VIF2.clk) begin
				trans = new();
				trans.in1   =  VIF2.A;
				trans.in2   =  VIF2.B;
				trans.out   =  VIF2.sum;
				mon2scb.put(trans);
				$display("<<< Monitior >>> : time = %0t, in1 = %3d, in2 = %3d, out = %4d\n---------------------------------------------------------------------------------", $time, trans.in1, trans.in2, trans.out);	
			end
		end
	endtask
endclass: Monitior