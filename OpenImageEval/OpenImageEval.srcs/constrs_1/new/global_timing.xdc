# global_timing.xdc
#
# Constraints file for OpenImageEval.
#
# 2019-12-24  WHF  Created.
#

#####  PMOD Pin Allocations  #####
###  PMOD 0 (J55)  ###
# Net         J55 Pin      FPGA Pin
# PMOD0_0         1         B23
# PMOD0_1         3         A23
# PMOD0_2         5         F25
# PMOD0_3         7         E20
# PMOD0_4         2         K24
# PMOD0_5         4         L23
# PMOD0_6         6         L22
# PMOD0_7         8         D7

###  PMOD 1 (J87)  ###
# Net         J87 Pin     FPGA Pin
# PMOD1_0         1        AN8 
# PMOD1_1         3        AN9 
# PMOD1_2         5        AP11
# PMOD1_3         7        AN11
# PMOD1_4         2        AP9 
# PMOD1_5         4        AP10
# PMOD1_6         6        AP12
# PMOD1_7         8        AN12

###  LEDs  ###
# NET           FPGA Pin
# GPIO_LED_0      AL11
# GPIO_LED_1      AL13
# GPIO_LED_2      AK13
# GPIO_LED_3      AE15
# GPIO_LED_4      AM8 
# GPIO_LED_5      AM9 
# GPIO_LED_6      AM10
# GPIO_LED_7      AM11


# DAC Clocks.

# SPI Timing.
create_clock -period 40.000 -name afe_sck -waveform {0.000 20.000} [get_ports afe_sck]
#set_input_delay -clock [get_clocks afe_sck] -min -add_delay -10.500 [get_ports SPI_0_0_ss_io]
#set_input_delay -clock [get_clocks afe_sck] -max -add_delay -7.900 [get_ports SPI_0_0_ss_io]
#set_output_delay -clock [get_clocks afe_sck] -min -add_delay -3.000 [get_ports SPI_0_0_io1_io]
#set_output_delay -clock [get_clocks afe_sck] -max -add_delay 7.500 [get_ports SPI_0_0_io1_io]

# HV7321 Clocks
#create_clock -period 4.545 -name clk_src_clk -waveform {0.000 2.273} [get_ports src_clk]
set_disable_timing [get_ports start_pulsers]


# AFE Clocks
create_clock -period 1.563 -name lvds_dco_p_0 -waveform {0.000 0.781} [get_ports lvds_dco_p_0]
create_clock -period 1.563 -name lvds_dco_p_1 -waveform {0.000 0.781} [get_ports lvds_dco_p_1]

# SPI Pin Config
set_property PACKAGE_PIN L11 [get_ports {afe_sdio[0]}]
set_property PACKAGE_PIN L12 [get_ports afe_sck]
set_property PACKAGE_PIN G24 [get_ports afe0_csn]
set_property PACKAGE_PIN G23 [get_ports afe1_csn]
set_property IOSTANDARD LVCMOS18 [get_ports {afe_sdio[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports afe_sck]
set_property IOSTANDARD LVCMOS18 [get_ports afe0_csn]
set_property IOSTANDARD LVCMOS18 [get_ports afe1_csn]

# Temporary For Testing.  These are all on PMOD1, J87, bank 66.
# 0
set_property PACKAGE_PIN AN8 [get_ports rx_0]
set_property IOSTANDARD LVCMOS18 [get_ports rx_0]
# 1
set_property PACKAGE_PIN AN9 [get_ports rx_1]
set_property IOSTANDARD LVCMOS18 [get_ports rx_1]
# 2
set_property PACKAGE_PIN AP11 [get_ports tx_0]
set_property IOSTANDARD LVCMOS18 [get_ports tx_0]

# PL LEDs
# See top for LED breakouts.
# Mapped to GPIO.
set_property -dict {PACKAGE_PIN AL11 IOSTANDARD LVCMOS18 PULLDOWN true} [get_ports {leds[0]}]
set_property -dict {PACKAGE_PIN AL13 IOSTANDARD LVCMOS18 PULLDOWN true} [get_ports {leds[1]}]
set_property -dict {PACKAGE_PIN AK13 IOSTANDARD LVCMOS18 PULLDOWN true} [get_ports {leds[2]}]
set_property -dict {PACKAGE_PIN AE15 IOSTANDARD LVCMOS18 PULLDOWN true} [get_ports {leds[3]}]
set_property -dict {PACKAGE_PIN AM8 IOSTANDARD LVCMOS18 PULLDOWN true} [get_ports {leds[4]}]
set_property -dict {PACKAGE_PIN AM9 IOSTANDARD LVCMOS18 PULLDOWN true} [get_ports {leds[5]}]
set_property -dict {PACKAGE_PIN AM10 IOSTANDARD LVCMOS18 PULLDOWN true} [get_ports {leds[6]}]
set_property -dict {PACKAGE_PIN AM11 IOSTANDARD LVCMOS18 PULLDOWN true} [get_ports {leds[7]}]

# See top for PMOD breakouts.
# PMOD 1 nets 3-7:
# 3 (pin 7)
set_property PACKAGE_PIN AN11 [get_ports {pmod1[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pmod1[0]}]
set_property PULLDOWN true [get_ports {pmod1[0]}]
set_property PACKAGE_PIN AP9 [get_ports {pmod1[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pmod1[1]}]
set_property PULLDOWN true [get_ports {pmod1[1]}]
set_property PACKAGE_PIN AP10 [get_ports {pmod1[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pmod1[2]}]
set_property PULLDOWN true [get_ports {pmod1[2]}]
set_property PACKAGE_PIN AP12 [get_ports {pmod1[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pmod1[3]}]
set_property PULLDOWN true [get_ports {pmod1[3]}]
set_property PACKAGE_PIN AN12 [get_ports {pmod1[4]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pmod1[4]}]
set_property PULLDOWN true [get_ports {pmod1[4]}]
# PMOD 0, pins 0-7:
set_property PACKAGE_PIN B23 [get_ports {pmod0[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pmod0[0]}]
set_property PULLDOWN true [get_ports {pmod0[0]}]
set_property PACKAGE_PIN A23 [get_ports {pmod0[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pmod0[1]}]
set_property PULLDOWN true [get_ports {pmod0[1]}]
set_property PACKAGE_PIN F25 [get_ports {pmod0[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pmod0[2]}]
set_property PULLDOWN true [get_ports {pmod0[2]}]
set_property PACKAGE_PIN E20 [get_ports {pmod0[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pmod0[3]}]
set_property PULLDOWN true [get_ports {pmod0[3]}]
set_property PACKAGE_PIN K24 [get_ports {pmod0[4]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pmod0[4]}]
set_property PULLDOWN true [get_ports {pmod0[4]}]
set_property PACKAGE_PIN L23 [get_ports {pmod0[5]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pmod0[5]}]
set_property PULLDOWN true [get_ports {pmod0[5]}]
set_property PACKAGE_PIN L22 [get_ports {pmod0[6]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pmod0[6]}]
set_property PULLDOWN true [get_ports {pmod0[6]}]
set_property PACKAGE_PIN D7 [get_ports {pmod0[7]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pmod0[7]}]
set_property PULLDOWN true [get_ports {pmod0[7]}]


# HV7321 Pulser Globals
set_property PACKAGE_PIN K13 [get_ports ren]
set_property PACKAGE_PIN L14 [get_ports oen]
set_property PACKAGE_PIN J14 [get_ports otp_n]
set_property IOSTANDARD LVCMOS18 [get_ports ren]
set_property IOSTANDARD LVCMOS18 [get_ports oen]
set_property IOSTANDARD LVCMOS18 [get_ports otp_n]
set_property PULLUP true [get_ports otp_n]
set_property SLEW SLOW [get_ports ren]
set_property SLEW SLOW [get_ports oen]

# HV7321 Pulser 0 Pin Config
set_property PACKAGE_PIN L15 [get_ports {neg_0[3]}]
set_property PACKAGE_PIN K15 [get_ports {neg_0[2]}]
set_property PACKAGE_PIN H18 [get_ports {neg_0[1]}]
set_property PACKAGE_PIN H17 [get_ports {sel_0[0]}]
set_property PACKAGE_PIN K17 [get_ports {neg_0[0]}]
set_property PACKAGE_PIN J17 [get_ports {pos_0[3]}]
set_property PACKAGE_PIN H16 [get_ports {sel_0[1]}]
set_property PACKAGE_PIN G16 [get_ports {pos_0[2]}]
set_property PACKAGE_PIN G15 [get_ports {pos_0[1]}]
set_property PACKAGE_PIN F15 [get_ports {pos_0[0]}]
set_property PACKAGE_PIN D17 [get_ports {sel_0[3]}]
set_property PACKAGE_PIN C17 [get_ports {sel_0[2]}]
set_property PACKAGE_PIN F12 [get_ports out_clk_0]

set_property IOSTANDARD LVCMOS18 [get_ports {neg_0[*]}]
set_property IOSTANDARD LVCMOS18 [get_ports {sel_0[*]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pos_0[*]}]
set_property IOSTANDARD LVCMOS18 [get_ports out_clk_0]
set_property SLEW FAST [get_ports {sel_0[*]}]
set_property SLEW FAST [get_ports {pos_0[*]}]
set_property SLEW FAST [get_ports {neg_0[*]}]
set_property SLEW FAST [get_ports out_clk_0]

# HV7321 Pulser 1 Pin Config
set_property PACKAGE_PIN D11 [get_ports {neg_1[3]}]
set_property PACKAGE_PIN D10 [get_ports {neg_1[2]}]
set_property PACKAGE_PIN A8 [get_ports {neg_1[1]}]
set_property PACKAGE_PIN A7 [get_ports {sel_1[0]}]
set_property PACKAGE_PIN M13 [get_ports {neg_1[0]}]
set_property PACKAGE_PIN L13 [get_ports {pos_1[3]}]
set_property PACKAGE_PIN E9 [get_ports {sel_1[1]}]
set_property PACKAGE_PIN D9 [get_ports {pos_1[2]}]
set_property PACKAGE_PIN F8 [get_ports {pos_1[1]}]
set_property PACKAGE_PIN E8 [get_ports {pos_1[0]}]
set_property PACKAGE_PIN B11 [get_ports {sel_1[3]}]
set_property PACKAGE_PIN A11 [get_ports {sel_1[2]}]
set_property PACKAGE_PIN B9 [get_ports out_clk_1]

set_property IOSTANDARD LVCMOS18 [get_ports {neg_1[*]}]
set_property IOSTANDARD LVCMOS18 [get_ports {sel_1[*]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pos_1[*]}]
set_property IOSTANDARD LVCMOS18 [get_ports out_clk_1]
set_property SLEW FAST [get_ports {sel_1[*]}]
set_property SLEW FAST [get_ports {pos_1[*]}]
set_property SLEW FAST [get_ports {neg_1[*]}]
set_property SLEW FAST [get_ports out_clk_1]

# HV7321 Pulser 2 Pin Config
set_property PACKAGE_PIN A21 [get_ports {neg_2[3]}]
set_property PACKAGE_PIN A20 [get_ports {neg_2[2]}]
set_property PACKAGE_PIN B19 [get_ports {neg_2[1]}]
set_property PACKAGE_PIN G25 [get_ports {sel_2[0]}]
set_property PACKAGE_PIN B18 [get_ports {neg_2[0]}]
set_property PACKAGE_PIN A19 [get_ports {pos_2[3]}]
set_property PACKAGE_PIN G26 [get_ports {sel_2[1]}]
set_property PACKAGE_PIN A18 [get_ports {pos_2[2]}]
set_property PACKAGE_PIN C19 [get_ports {pos_2[1]}]
set_property PACKAGE_PIN C18 [get_ports {pos_2[0]}]
set_property PACKAGE_PIN C23 [get_ports {sel_2[3]}]
set_property PACKAGE_PIN D22 [get_ports {sel_2[2]}]
set_property PACKAGE_PIN D24 [get_ports out_clk_2]

set_property IOSTANDARD LVCMOS18 [get_ports {neg_2[*]}]
set_property IOSTANDARD LVCMOS18 [get_ports {sel_2[*]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pos_2[*]}]
set_property IOSTANDARD LVCMOS18 [get_ports out_clk_2]
set_property SLEW FAST [get_ports {sel_2[*]}]
set_property SLEW FAST [get_ports {pos_2[*]}]
set_property SLEW FAST [get_ports {neg_2[*]}]
set_property SLEW FAST [get_ports out_clk_2]

# HV7321 Pulser 3 Pin Config
set_property PACKAGE_PIN E24 [get_ports {neg_3[3]}]
set_property PACKAGE_PIN C21 [get_ports {neg_3[2]}]
set_property PACKAGE_PIN J21 [get_ports {neg_3[1]}]
set_property PACKAGE_PIN E19 [get_ports {sel_3[0]}]
set_property PACKAGE_PIN D19 [get_ports {neg_3[0]}]
set_property PACKAGE_PIN K22 [get_ports {pos_3[3]}]
set_property PACKAGE_PIN K23 [get_ports {sel_3[1]}]
set_property PACKAGE_PIN J24 [get_ports {pos_3[2]}]
set_property PACKAGE_PIN H24 [get_ports {pos_3[1]}]
set_property PACKAGE_PIN C22 [get_ports {pos_3[0]}]
set_property PACKAGE_PIN B8 [get_ports {sel_3[3]}]
set_property PACKAGE_PIN H19 [get_ports {sel_3[2]}]
set_property PACKAGE_PIN G19 [get_ports out_clk_3]

set_property IOSTANDARD LVCMOS18 [get_ports {neg_3[*]}]
set_property IOSTANDARD LVCMOS18 [get_ports {sel_3[*]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pos_3[*]}]
set_property IOSTANDARD LVCMOS18 [get_ports out_clk_3]
set_property SLEW FAST [get_ports {sel_3[*]}]
set_property SLEW FAST [get_ports {pos_3[*]}]
set_property SLEW FAST [get_ports {neg_3[*]}]
set_property SLEW FAST [get_ports out_clk_3]

# AD5424 DAC Pin Config
set_property PACKAGE_PIN G20 [get_ports {data_0[7]}]
set_property PACKAGE_PIN E22 [get_ports {data_0[6]}]
set_property PACKAGE_PIN F22 [get_ports {data_0[5]}]
set_property PACKAGE_PIN H21 [get_ports {data_0[4]}]
set_property PACKAGE_PIN H22 [get_ports {data_0[3]}]
set_property PACKAGE_PIN E23 [get_ports {data_0[2]}]
set_property PACKAGE_PIN F23 [get_ports {data_0[1]}]
set_property PACKAGE_PIN D21 [get_ports {data_0[0]}]
set_property PACKAGE_PIN D20 [get_ports {csn_clk_0[1]}]
set_property PACKAGE_PIN F20 [get_ports {csn_clk_0[0]}]

set_property IOSTANDARD LVCMOS18 [get_ports {data_0[*]}]
set_property IOSTANDARD LVCMOS18 [get_ports {csn_clk_0[*]}]
set_property SLEW FAST [get_ports {data_0[*]}]
set_property SLEW FAST [get_ports {csn_clk_0[*]}]

# AFE Globals
set_property PACKAGE_PIN J25 [get_ports {afe_clk_p[0]}]
set_property IOSTANDARD LVDS [get_ports {afe_clk_p[0]}]
# Not supported by LVDS:
#set_property SLEW FAST [get_ports afe_clk_p]
set_property -dict {PACKAGE_PIN C13 IOSTANDARD LVDS} [get_ports {tx_trig_out_p[0]}]
set_property -dict {PACKAGE_PIN C12 IOSTANDARD LVDS} [get_ports {tx_trig_out_n[0]}]



# AD9670 AFE 0 Pin Config
set_property PACKAGE_PIN F17 [get_ports lvds_fco_p_0]
set_property PACKAGE_PIN F16 [get_ports lvds_fco_n_0]
set_property PACKAGE_PIN E15 [get_ports lvds_dco_p_0]
set_property PACKAGE_PIN E14 [get_ports lvds_dco_n_0]
set_property PACKAGE_PIN L20 [get_ports {lvds_data_p_0[7]}]
set_property PACKAGE_PIN K20 [get_ports {lvds_data_n_0[7]}]
set_property PACKAGE_PIN L17 [get_ports {lvds_data_p_0[6]}]
set_property PACKAGE_PIN L16 [get_ports {lvds_data_n_0[6]}]
set_property PACKAGE_PIN J16 [get_ports {lvds_data_p_0[5]}]
set_property PACKAGE_PIN J15 [get_ports {lvds_data_n_0[5]}]
set_property PACKAGE_PIN A13 [get_ports {lvds_data_p_0[4]}]
set_property PACKAGE_PIN A12 [get_ports {lvds_data_n_0[4]}]
set_property PACKAGE_PIN D16 [get_ports {lvds_data_p_0[3]}]
set_property PACKAGE_PIN C16 [get_ports {lvds_data_n_0[3]}]
set_property PACKAGE_PIN K19 [get_ports {lvds_data_p_0[2]}]
set_property PACKAGE_PIN K18 [get_ports {lvds_data_n_0[2]}]
set_property PACKAGE_PIN E18 [get_ports {lvds_data_p_0[1]}]
set_property PACKAGE_PIN E17 [get_ports {lvds_data_n_0[1]}]
set_property PACKAGE_PIN G18 [get_ports {lvds_data_p_0[0]}]
set_property PACKAGE_PIN F18 [get_ports {lvds_data_n_0[0]}]
set_property IOSTANDARD LVDS [get_ports {lvds_data_p_0[*]}]
set_property IOSTANDARD LVDS [get_ports {lvds_data_n_0[*]}]
set_property IOSTANDARD LVDS [get_ports lvds_fco_p_0]
set_property IOSTANDARD LVDS [get_ports lvds_fco_n_0]
set_property IOSTANDARD LVDS [get_ports lvds_dco_p_0]
set_property IOSTANDARD LVDS [get_ports lvds_dco_n_0]
set_property DIFF_TERM_ADV TERM_100 [get_ports {lvds_data_p_0[*]}]

# AD9670 AFE 1 Pin Config
set_property PACKAGE_PIN F11 [get_ports lvds_fco_p_1]
set_property PACKAGE_PIN E10 [get_ports lvds_fco_n_1]
set_property PACKAGE_PIN G10 [get_ports lvds_dco_p_1]
set_property PACKAGE_PIN F10 [get_ports lvds_dco_n_1]
set_property PACKAGE_PIN H13 [get_ports {lvds_data_p_1[7]}]
set_property PACKAGE_PIN H12 [get_ports {lvds_data_n_1[7]}]
set_property PACKAGE_PIN C7 [get_ports {lvds_data_p_1[6]}]
set_property PACKAGE_PIN C6 [get_ports {lvds_data_n_1[6]}]
set_property PACKAGE_PIN K10 [get_ports {lvds_data_p_1[5]}]
set_property PACKAGE_PIN J10 [get_ports {lvds_data_n_1[5]}]
set_property PACKAGE_PIN F7 [get_ports {lvds_data_p_1[4]}]
set_property PACKAGE_PIN E7 [get_ports {lvds_data_n_1[4]}]
set_property PACKAGE_PIN C9 [get_ports {lvds_data_p_1[3]}]
set_property PACKAGE_PIN C8 [get_ports {lvds_data_n_1[3]}]
set_property PACKAGE_PIN D12 [get_ports {lvds_data_p_1[2]}]
set_property PACKAGE_PIN C11 [get_ports {lvds_data_n_1[2]}]
set_property PACKAGE_PIN B10 [get_ports {lvds_data_p_1[1]}]
set_property PACKAGE_PIN A10 [get_ports {lvds_data_n_1[1]}]
set_property PACKAGE_PIN B6 [get_ports {lvds_data_p_1[0]}]
set_property PACKAGE_PIN A6 [get_ports {lvds_data_n_1[0]}]
set_property IOSTANDARD LVDS [get_ports {lvds_data_p_1[*]}]
set_property IOSTANDARD LVDS [get_ports {lvds_data_n_1[*]}]
set_property IOSTANDARD LVDS [get_ports lvds_fco_p_1]
set_property IOSTANDARD LVDS [get_ports lvds_fco_n_1]
set_property IOSTANDARD LVDS [get_ports lvds_dco_p_1]
set_property IOSTANDARD LVDS [get_ports lvds_dco_n_1]
set_property DIFF_TERM_ADV TERM_100 [get_ports {lvds_data_p_1[*]}]
set_property DIFF_TERM_ADV TERM_100 [get_ports {lvds_data_n_1[*]}]


# create_clock -period 6.670 -name {edt_zcu106_i/zynq_ultra_ps_e_0/U0/PS8_i/PLCLK[0]} -waveform {0.000 3.335} [get_pins {edt_zcu106_i/zynq_ultra_ps_e_0/U0/PS8_i/PLCLK[0]}]
