transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/TNB/Desktop/FPGA/experiment/experiment_02_AES {C:/Users/TNB/Desktop/FPGA/experiment/experiment_02_AES/subColMix.v}
vlog -vlog01compat -work work +incdir+C:/Users/TNB/Desktop/FPGA/experiment/experiment_02_AES {C:/Users/TNB/Desktop/FPGA/experiment/experiment_02_AES/subByte_rowShift.v}
vlog -vlog01compat -work work +incdir+C:/Users/TNB/Desktop/FPGA/experiment/experiment_02_AES {C:/Users/TNB/Desktop/FPGA/experiment/experiment_02_AES/roundFunc_10.v}
vlog -vlog01compat -work work +incdir+C:/Users/TNB/Desktop/FPGA/experiment/experiment_02_AES {C:/Users/TNB/Desktop/FPGA/experiment/experiment_02_AES/roundFunc.v}
vlog -vlog01compat -work work +incdir+C:/Users/TNB/Desktop/FPGA/experiment/experiment_02_AES {C:/Users/TNB/Desktop/FPGA/experiment/experiment_02_AES/keyExp.v}
vlog -vlog01compat -work work +incdir+C:/Users/TNB/Desktop/FPGA/experiment/experiment_02_AES {C:/Users/TNB/Desktop/FPGA/experiment/experiment_02_AES/colMix_keyAdd.v}
vlog -vlog01compat -work work +incdir+C:/Users/TNB/Desktop/FPGA/experiment/experiment_02_AES {C:/Users/TNB/Desktop/FPGA/experiment/experiment_02_AES/AES_encryp_top.v}
vlog -vlog01compat -work work +incdir+C:/Users/TNB/Desktop/FPGA/experiment/experiment_02_AES {C:/Users/TNB/Desktop/FPGA/experiment/experiment_02_AES/rom_2p.v}

vlog -vlog01compat -work work +incdir+C:/Users/TNB/Desktop/FPGA/experiment/experiment_02_AES/simulation/modelsim {C:/Users/TNB/Desktop/FPGA/experiment/experiment_02_AES/simulation/modelsim/AES_encryp_top.vt}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclone10lp_ver -L rtl_work -L work -voptargs="+acc"  AES_encryp_top

add wave *
view structure
view signals
run -all
