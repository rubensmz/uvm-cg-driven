run_gui:
	xrun -uvm rtl/dut.sv -f tb.f +UVM_TESTNAME=cg_driven_test -gui +access+rw -cov_cgsample

run:
	xrun -uvm rtl/dut.sv -f tb.f +UVM_TESTNAME=cg_driven_test +access+rw -cov_cgsample