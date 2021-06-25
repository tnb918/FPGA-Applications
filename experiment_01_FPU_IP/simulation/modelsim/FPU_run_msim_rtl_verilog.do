transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/TNB/Desktop/FPGA/experiment/experiment_01_FPU_IP {C:/Users/TNB/Desktop/FPGA/experiment/experiment_01_FPU_IP/FPU_add.v}
vlog -vlog01compat -work work +incdir+C:/Users/TNB/Desktop/FPGA/experiment/experiment_01_FPU_IP {C:/Users/TNB/Desktop/FPGA/experiment/experiment_01_FPU_IP/FPU_sub.v}
vlog -vlog01compat -work work +incdir+C:/Users/TNB/Desktop/FPGA/experiment/experiment_01_FPU_IP {C:/Users/TNB/Desktop/FPGA/experiment/experiment_01_FPU_IP/FPU_div.v}
vlog -vlog01compat -work work +incdir+C:/Users/TNB/Desktop/FPGA/experiment/experiment_01_FPU_IP {C:/Users/TNB/Desktop/FPGA/experiment/experiment_01_FPU_IP/FPU_mul.v}
vlog -vlog01compat -work work +incdir+C:/Users/TNB/Desktop/FPGA/experiment/experiment_01_FPU_IP {C:/Users/TNB/Desktop/FPGA/experiment/experiment_01_FPU_IP/FPU.v}

vlog -vlog01compat -work work +incdir+C:/Users/TNB/Desktop/FPGA/experiment/experiment_01_FPU_IP/simulation/modelsim {C:/Users/TNB/Desktop/FPGA/experiment/experiment_01_FPU_IP/simulation/modelsim/FPU.vt}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclone10lp_ver -L rtl_work -L work -voptargs="+acc"  FPU

add wave *
view structure
view signals
run -all
