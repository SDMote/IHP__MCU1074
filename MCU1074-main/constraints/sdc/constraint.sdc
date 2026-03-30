current_design mcu1074
set_units -time ns -resistance kOhm -capacitance pF -voltage V -current uA

# Set a higher limits than in lib
set_max_fanout 8 [current_design]
set_max_capacitance 0.5 [current_design]
set_max_transition 3 [current_design]
set_max_area 0


# ##############################
# clocks

#set_ideal_network [get_pins sg13g2_IOPad_clock/p2c]
#create_clock [get_pins sg13g2_IOPad_clock/p2c] -name clk_core -period 50.0 -waveform {0 25}
create_clock [get_ports clock] -name clk_core -period 50.0 -waveform {0 25}
set_clock_uncertainty 0.15 [get_clocks clk_core]
set_clock_transition 0.25 [get_clocks clk_core]

create_clock [get_ports serial_tl_0_clock_in] -name clk_stl -period 50.0 -waveform {0 25}
set_clock_uncertainty 0.15 [get_clocks clk_stl]
set_clock_transition 0.25 [get_clocks clk_stl]

set clock_ports [get_ports {clock serial_tl_0_clock_in}]
set_driving_cell -lib_cell sg13g2_IOPadIn -pin pad $clock_ports

set_clock_groups -asynchronous -group {clk_core} -group {clk_stl}


# ##############################
# core clock domain

set clk_core_input_ports [get_ports {
    uart_0_rxd
    custom_boot
    jtag_TCK
    jtag_TMS
    jtag_TDI
    reset
    sec_periph_sram_rdy
}]
set_driving_cell -lib_cell sg13g2_IOPadIn -pin pad $clk_core_input_ports
set_input_delay 8 -clock clk_core $clk_core_input_ports

set clk_core_output_30mA_ports [get_ports { 
    clock_tap
    uart_0_txd
    jtag_TDO
    sec_periph_sram_on
    sec_periph_sram_data[0]
    sec_periph_sram_data[1]
    sec_periph_sram_data[2]
    sec_periph_sram_data[3]
    sec_periph_sram_data[4]
    sec_periph_sram_data[5]
    sec_periph_sram_data[6]
    sec_periph_sram_data[7]
}] 
#set_driving_cell -lib_cell sg13g2_IOPadOut30mA -pin pad $clk_core_output_30mA_ports
set_load 0.1 $clk_core_output_30mA_ports
set_output_delay 8 -clock clk_core $clk_core_output_30mA_ports


# ##############################
# serial TL clock domain

set clk_stl_input_ports [get_ports {
    serial_tl_0_in_valid
    serial_tl_0_out_ready
    serial_tl_0_in_bits_phit[0]
    serial_tl_0_in_bits_phit[1]
    serial_tl_0_in_bits_phit[2]
    serial_tl_0_in_bits_phit[3]
    serial_tl_0_in_bits_phit[4]
    serial_tl_0_in_bits_phit[5]
    serial_tl_0_in_bits_phit[6]
    serial_tl_0_in_bits_phit[7]
    serial_tl_0_in_bits_phit[8]
    serial_tl_0_in_bits_phit[9]
    serial_tl_0_in_bits_phit[10]
    serial_tl_0_in_bits_phit[11]
    serial_tl_0_in_bits_phit[12]
    serial_tl_0_in_bits_phit[13]
    serial_tl_0_in_bits_phit[14]
    serial_tl_0_in_bits_phit[15]
    serial_tl_0_in_bits_phit[16]
    serial_tl_0_in_bits_phit[17]
    serial_tl_0_in_bits_phit[18]
    serial_tl_0_in_bits_phit[19]
    serial_tl_0_in_bits_phit[20]
    serial_tl_0_in_bits_phit[21]
    serial_tl_0_in_bits_phit[22]
    serial_tl_0_in_bits_phit[23]
    serial_tl_0_in_bits_phit[24]
    serial_tl_0_in_bits_phit[25]
    serial_tl_0_in_bits_phit[26]
    serial_tl_0_in_bits_phit[27]
    serial_tl_0_in_bits_phit[28]
    serial_tl_0_in_bits_phit[29]
    serial_tl_0_in_bits_phit[30]
    serial_tl_0_in_bits_phit[31]
}]
set_driving_cell -lib_cell sg13g2_IOPadIn -pin pad $clk_stl_input_ports
set_input_delay 8 -clock clk_core $clk_stl_input_ports

set clk_stl_output_30mA_ports [get_ports { 
    serial_tl_0_in_ready
    serial_tl_0_out_valid
    serial_tl_0_out_bits_phit[0]
    serial_tl_0_out_bits_phit[1]
    serial_tl_0_out_bits_phit[2]
    serial_tl_0_out_bits_phit[3]
    serial_tl_0_out_bits_phit[4]
    serial_tl_0_out_bits_phit[5]
    serial_tl_0_out_bits_phit[6]
    serial_tl_0_out_bits_phit[7]
    serial_tl_0_out_bits_phit[8]
    serial_tl_0_out_bits_phit[9]
    serial_tl_0_out_bits_phit[10]
    serial_tl_0_out_bits_phit[11]
    serial_tl_0_out_bits_phit[12]
    serial_tl_0_out_bits_phit[13]
    serial_tl_0_out_bits_phit[14]
    serial_tl_0_out_bits_phit[15]
    serial_tl_0_out_bits_phit[16]
    serial_tl_0_out_bits_phit[17]
    serial_tl_0_out_bits_phit[18]
    serial_tl_0_out_bits_phit[19]
    serial_tl_0_out_bits_phit[20]
    serial_tl_0_out_bits_phit[21]
    serial_tl_0_out_bits_phit[22]
    serial_tl_0_out_bits_phit[23]
    serial_tl_0_out_bits_phit[24]
    serial_tl_0_out_bits_phit[25]
    serial_tl_0_out_bits_phit[26]
    serial_tl_0_out_bits_phit[27]
    serial_tl_0_out_bits_phit[28]
    serial_tl_0_out_bits_phit[29]
    serial_tl_0_out_bits_phit[30]
    serial_tl_0_out_bits_phit[31]    
}] 
set_load 0.1 $clk_stl_output_30mA_ports
set_output_delay 8 -clock clk_core $clk_stl_output_30mA_ports
