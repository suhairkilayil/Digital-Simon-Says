# ========================
# Clock and Reset Inputs
# ========================
set_property PACKAGE_PIN W5 [get_ports clk]            ;# Clock input
set_property IOSTANDARD LVCMOS33 [get_ports clk]

set_property PACKAGE_PIN V4 [get_ports rst]            ;# Reset input
set_property IOSTANDARD LVCMOS33 [get_ports rst]

# ========================
# Player 1 Inputs (2-bit)
# ========================
set_property PACKAGE_PIN U1 [get_ports {P1_input[0]}]  ;# P1 Up/Down bit 0
set_property PACKAGE_PIN U2 [get_ports {P1_input[1]}]  ;# P1 Up/Down bit 1
set_property IOSTANDARD LVCMOS33 [get_ports {P1_input[*]}]

# ========================
# Player 2 Inputs (2-bit)
# ========================
set_property PACKAGE_PIN T1 [get_ports {P2_input[0]}]  ;# P2 Up/Down bit 0
set_property PACKAGE_PIN T2 [get_ports {P2_input[1]}]  ;# P2 Up/Down bit 1
set_property IOSTANDARD LVCMOS33 [get_ports {P2_input[*]}]

# ========================
# LED Outputs (Direction)
# ========================
set_property PACKAGE_PIN W1 [get_ports {led_dir[0]}]   ;# LED direction bit 0
set_property PACKAGE_PIN W2 [get_ports {led_dir[1]}]   ;# LED direction bit 1
set_property IOSTANDARD LVCMOS33 [get_ports {led_dir[*]}]

# ========================
# Game Status Outputs
# ========================
set_property PACKAGE_PIN W3 [get_ports game_over]      ;# Game over signal
set_property PACKAGE_PIN W4 [get_ports {winner[0]}]    ;# Winner bit 0
set_property PACKAGE_PIN W6 [get_ports {winner[1]}]    ;# Winner bit 1
set_property IOSTANDARD LVCMOS33 [get_ports *]
