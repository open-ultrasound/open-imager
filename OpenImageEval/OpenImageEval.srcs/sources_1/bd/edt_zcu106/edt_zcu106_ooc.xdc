################################################################################

# This XDC is used only for OOC mode of synthesis, implementation
# This constraints file contains default clock frequencies to be used during
# out-of-context flows such as OOC Synthesis and Hierarchical Designs.
# This constraints file is not used in normal top-down synthesis (default flow
# of Vivado)
################################################################################
create_clock -name lvds_dco_p_0 -period 8 [get_ports lvds_dco_p_0]
create_clock -name lvds_dco_n_0 -period 8 [get_ports lvds_dco_n_0]
create_clock -name lvds_fco_p_0 -period 8 [get_ports lvds_fco_p_0]
create_clock -name lvds_fco_n_0 -period 8 [get_ports lvds_fco_n_0]
create_clock -name lvds_fco_n_1 -period 8 [get_ports lvds_fco_n_1]
create_clock -name lvds_dco_n_1 -period 8 [get_ports lvds_dco_n_1]
create_clock -name lvds_fco_p_1 -period 8 [get_ports lvds_fco_p_1]
create_clock -name lvds_dco_p_1 -period 8 [get_ports lvds_dco_p_1]

################################################################################