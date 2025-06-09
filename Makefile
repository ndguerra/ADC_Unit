all: modules-a modules-e testbenches run-units

modules-a:
	echo "*** modules analysis ***"
	ghdl -a common.vhd
	ghdl -a adc_input_mux.vhd
	ghdl -a adc_bram.vhd

modules-e:
	echo "*** module elaboration ***"
	ghdl -e adc_input_mux
	ghdl -e adc_bram

testbenches:
	echo "*** testbench analysis and elaboration ***"
	ghdl -a -fsynopsys tb/adc_input_mux_tb.vhd
	ghdl -a -fsynopsys tb/adc_bram_tb.vhd
	ghdl -e -fsynopsys adc_input_mux_tb
	ghdl -e -fsynopsys adc_bram_tb

run-units:
	echo "*** running ***"
	ghdl -r -fsynopsys adc_input_mux_tb  --stop-time=5us --vcd=mux.vcd
	ghdl -r -fsynopsys adc_bram_tb       --stop-time=5us --vcd=bram.vcd
