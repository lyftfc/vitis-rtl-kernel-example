KRNL_NAME := krnl_rtl_trial_a

kernel: $(KRNL_NAME).xo

$(KRNL_NAME).xo:
	vivado -nolog -nojournal -mode batch -source kernel_config.tcl -source ./pack_xo.tcl

clean:
	@rm -rf $(KRNL_NAME)_packprj/ $(KRNL_NAME).xo .hbs/ .Xil/ *.log *.jou

.PHONY: kernel clean
