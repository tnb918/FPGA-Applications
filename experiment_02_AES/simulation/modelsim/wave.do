onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /AES_encryp_top/clk
add wave -noupdate /AES_encryp_top/rst_n
add wave -noupdate -radix hexadecimal /AES_encryp_top/iKey
add wave -noupdate -radix hexadecimal /AES_encryp_top/iPlaintext
add wave -noupdate -expand -group wkeyExp_KeyValue -radix hexadecimal /AES_encryp_top/wkeyExp_KeyValue1
add wave -noupdate -expand -group wkeyExp_KeyValue -radix hexadecimal /AES_encryp_top/wkeyExp_KeyValue2
add wave -noupdate -expand -group wkeyExp_KeyValue -radix hexadecimal /AES_encryp_top/wkeyExp_KeyValue3
add wave -noupdate -expand -group wkeyExp_KeyValue -radix hexadecimal /AES_encryp_top/wkeyExp_KeyValue4
add wave -noupdate -expand -group wkeyExp_KeyValue -radix hexadecimal /AES_encryp_top/wkeyExp_KeyValue5
add wave -noupdate -expand -group wkeyExp_KeyValue -radix hexadecimal /AES_encryp_top/wkeyExp_KeyValue6
add wave -noupdate -expand -group wkeyExp_KeyValue -radix hexadecimal /AES_encryp_top/wkeyExp_KeyValue7
add wave -noupdate -expand -group wkeyExp_KeyValue -radix hexadecimal /AES_encryp_top/wkeyExp_KeyValue8
add wave -noupdate -expand -group wkeyExp_KeyValue -radix hexadecimal /AES_encryp_top/wkeyExp_KeyValue9
add wave -noupdate -expand -group wkeyExp_KeyValue -radix hexadecimal /AES_encryp_top/wkeyExp_KeyValue10
add wave -noupdate -expand -group wRoundFunc_Out -radix hexadecimal /AES_encryp_top/preKeyAddOut
add wave -noupdate -expand -group wRoundFunc_Out -radix hexadecimal /AES_encryp_top/wRoundFunc_Out1
add wave -noupdate -expand -group wRoundFunc_Out -radix hexadecimal /AES_encryp_top/wRoundFunc_Out2
add wave -noupdate -expand -group wRoundFunc_Out -radix hexadecimal /AES_encryp_top/wRoundFunc_Out3
add wave -noupdate -expand -group wRoundFunc_Out -radix hexadecimal /AES_encryp_top/wRoundFunc_Out4
add wave -noupdate -expand -group wRoundFunc_Out -radix hexadecimal /AES_encryp_top/wRoundFunc_Out5
add wave -noupdate -expand -group wRoundFunc_Out -radix hexadecimal /AES_encryp_top/wRoundFunc_Out6
add wave -noupdate -expand -group wRoundFunc_Out -radix hexadecimal /AES_encryp_top/wRoundFunc_Out7
add wave -noupdate -expand -group wRoundFunc_Out -radix hexadecimal /AES_encryp_top/wRoundFunc_Out8
add wave -noupdate -expand -group wRoundFunc_Out -radix hexadecimal /AES_encryp_top/wRoundFunc_Out9
add wave -noupdate -expand -group wRoundFunc_Out -radix hexadecimal /AES_encryp_top/oCiphertext
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 256
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {6357 ps}
