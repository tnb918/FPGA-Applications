transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/TNB/Desktop/FPGA/experiment/experiment_03_I2S {C:/Users/TNB/Desktop/FPGA/experiment/experiment_03_I2S/i2sMaster.v}

vlog -vlog01compat -work work +incdir+C:/Users/TNB/Desktop/FPGA/experiment/experiment_03_I2S {C:/Users/TNB/Desktop/FPGA/experiment/experiment_03_I2S/sim.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclone10lp_ver -L rtl_work -L work -voptargs="+acc"  i2cMtestbench

add wave *
view structure
view signals
run -all
