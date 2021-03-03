#########################
# Kernel Configurations #
#########################

set krnl_name "krnl_rtl_trial_a"
set krnl_vendor "nus.edu.sg"
set hw_part "xcu250-figd2104-2L-e"
set hw_board "xilinx.com:au250:part0:1.3"
# Kernel ap_clk frequency in Hz
set krnl_freq 250000000
# Kernel extra AXIS intefaces
set krnl_intfs {
	s_din
	m_dout
}
# Kernel parameters - those will not be exposed in IP
set krnl_params {
	C_S_AXI_CONTROL_ADDR_WIDTH
	C_S_AXI_CONTROL_DATA_WIDTH
	C_S_DIN_TDATA_WIDTH
	C_M_DOUT_TDATA_WIDTH
}
# Kernel source file set
set krnl_srcs {
	./src/krnl_rtl_trial_a.v
	./src/krnl_rtl_trial_a_control_s_axi.v
	./src/krnl_rtl_trial_a_example.sv
	./src/krnl_rtl_trial_a_example_vadd_axis.sv
	./src/krnl_rtl_trial_a_example_adder.v
	./src/krnl_rtl_trial_a_example_counter.sv
	./src/krnl_rtl_trial_a_example_number_generator.sv
}
# Kernel XML definition
set krnl_xml "./kernel.xml"
