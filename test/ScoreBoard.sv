class ScoreBoard;
	mailbox mon2scb;
	Transaction trans;
	bit[3:0]Expected_Out;
	function new (mailbox mon2scb);
		this.mon2scb = mon2scb;
	endfunction
	
	task run();
		repeat(REPETATIONS) begin
			mon2scb.get(trans);
			Expected_Out = trans.in1 + trans.in2;
            ass2:assert(Expected_Out == trans.out)
					$display("<<< ScoreBoard >>> : time = %0t, \"passed\" in1 = %3d, in2 = %3d, out = %4d, Expected_Out = %4d\n---------------------------------------------------------------------------------", $time, trans.in1, trans.in2, trans.out, Expected_Out);
				 else
				    $error("<<< ScoreBoard >>> : time = %0t, \"failed\" in1 = %3d, in2 = %3d, out = %4d, Expected_Out = %4d\n---------------------------------------------------------------------------------", $time, trans.in1, trans.in2, trans.out, Expected_Out);	
		end
	endtask
endclass: ScoreBoard