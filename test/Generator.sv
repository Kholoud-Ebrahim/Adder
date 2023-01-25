class Generator;
	Transaction trans;
	mailbox gen2driv;
	function new(mailbox gen2driv);
		this.gen2driv = gen2driv;
	endfunction
	
	task run();
		repeat(REPETATIONS) begin
			trans = new();
			ass1: assert(trans.randomize());
			gen2driv.put(trans);
			$display("<<< Generator >>> : time = %0t, in1 = %3d, in2 = %3d, out = %4d\n---------------------------------------------------------------------------------", $time, trans.in1, trans.in2, trans.out);
		end
	endtask
endclass: Generator