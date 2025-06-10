all: modules-a modules-e testbenches run-units

modules-a:
	echo "*** modules analysis ***"
	ghdl -a common.vhd
	ghdl -a adc_input_mux.vhd
	ghdl -a adc_bram.vhd
	ghdl -a adc_trigger.vhd
	ghdl -a adc_valid.vhd

modules-e:
	echo "*** module elaboration ***"
	ghdl -e adc_input_mux
	ghdl -e adc_bram
	ghdl -e adc_trigger
	ghdl -r adc_valid

testbenches:
	echo "*** testbench analysis and elaboration ***"
	ghdl -a -fsynopsys tb/adc_input_mux_tb.vhd
	ghdl -a -fsynopsys tb/adc_bram_tb.vhd
	ghdl -a -fsynopsys tb/adc_trigger_tb.vhd
	ghdl -a -fsynopsys tb/adc_valid_tb.vhd
	ghdl -e -fsynopsys adc_input_mux_tb
	ghdl -e -fsynopsys adc_bram_tb
	ghdl -e -fsynopsys adc_trigger_tb
	ghdl -e -fsynopsys adc_valid_tb

run-units:
	echo "*** running ***"
	#ghdl -r -fsynopsys adc_input_mux_tb  --stop-time=5us --vcd=mux.vcd
	#ghdl -r -fsynopsys adc_bram_tb       --stop-time=5us --vcd=bram.vcd
	#ghdl -r -fsynopsys adc_trigger_tb    --stop-time=5us --vcd=trig.vcd
	ghdl -r -fsynopsys adc_valid_tb      --stop-time=5us --vcd=valid.vcd
