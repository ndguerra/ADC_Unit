all: modules-a modules-e testbenches run-units

modules-a:
	echo "*** modules analysis ***"
	ghdl -a common.vhd
	ghdl -a adc_input_mux.vhd

modules-e:
	echo "*** module elaboration ***"
	ghdl -e adc_input_mux

testbenches:
	echo "*** testbench analysis and elaboration ***"
	ghdl -a -fsynopsys tb/adc_input_mux_tb.vhd
	ghdl -e -fsynopsys adc_input_mux_tb

run-units:
	echo "*** running ***"
	ghdl -r -fsynopsys adc_input_mux_tb  --stop-time=1us --vcd=mux.vcd
