all: modules-a modules-e testbenches run-units

modules-a:
	echo "*** modules analysis ***"
	ghdl -a common.vhd
	#ghdl -a const_bram.vhd
	ghdl -a adc_transition.vhd
	ghdl -a adc_reg.vhd
	ghdl -a adc_daq.vhd
	ghdl -a adc_unit.vhd
	ghdl -a adc_clk_div.vhd

modules-e:
	echo "*** module elaboration ***"
	#ghdl -e const_bram
	ghdl -e adc_trans
	ghdl -e adc_reg
	ghdl -e adc_daq
	ghdl -e adc_unit
	ghdl -e adc_clk_div

testbenches:
	echo "*** testbench analysis and elaboration ***"
	ghdl -a -fsynopsys tb/adc_transition_tb.vhd
	ghdl -a -fsynopsys tb/adc_reg_tb.vhd
	ghdl -a -fsynopsys tb/adc_daq_tb.vhd
	ghdl -a -fsynopsys tb/adc_unit_tb.vhd
	ghdl -a -fsynopsys tb/adc_clk_div_tb.vhd
	ghdl -e -fsynopsys adc_trans_tb
	ghdl -e -fsynopsys adc_reg_tb
	ghdl -e -fsynopsys adc_daq_tb
	ghdl -e -fsynopsys adc_unit_tb
	ghdl -e -fsynopsys adc_clk_div_tb

run-units:
	echo "*** running ***"
	ghdl -r -fsynopsys adc_trans_tb   --stop-time=1us #--vcd=trans.vcd
	ghdl -r -fsynopsys adc_reg_tb     --stop-time=1us #--vcd=reg.vcd
	ghdl -r -fsynopsys adc_daq_tb     --stop-time=1us #--vcd=daq.vcd
	ghdl -r -fsynopsys adc_unit_tb    --stop-time=1us --vcd=unit.vcd
	ghdl -r -fsynopsys adc_clk_div_tb --stop-time=1us #--vcd=clk.vcd

