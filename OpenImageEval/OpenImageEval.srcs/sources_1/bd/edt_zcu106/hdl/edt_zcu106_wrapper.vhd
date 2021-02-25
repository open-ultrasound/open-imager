--Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
--Date        : Wed Feb  3 20:47:39 2021
--Host        : SPATEN running 64-bit Service Pack 1  (build 7601)
--Command     : generate_target edt_zcu106_wrapper.bd
--Design      : edt_zcu106_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity edt_zcu106_wrapper is
  port (
    afe0_csn : out STD_LOGIC;
    afe1_csn : out STD_LOGIC;
    afe_clk_n : out STD_LOGIC_VECTOR ( 0 to 0 );
    afe_clk_p : out STD_LOGIC_VECTOR ( 0 to 0 );
    afe_sck : out STD_LOGIC;
    afe_sdio : inout STD_LOGIC_VECTOR ( 0 to 0 );
    csn_clk_0 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    data_0 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    leds : out STD_LOGIC_VECTOR ( 4 downto 0 );
    lvds_data_n_0 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    lvds_data_n_1 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    lvds_data_p_0 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    lvds_data_p_1 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    lvds_dco_n_0 : in STD_LOGIC;
    lvds_dco_n_1 : in STD_LOGIC;
    lvds_dco_p_0 : in STD_LOGIC;
    lvds_dco_p_1 : in STD_LOGIC;
    lvds_fco_n_0 : in STD_LOGIC;
    lvds_fco_n_1 : in STD_LOGIC;
    lvds_fco_p_0 : in STD_LOGIC;
    lvds_fco_p_1 : in STD_LOGIC;
    neg_0 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    neg_1 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    neg_2 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    neg_3 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    oen : out STD_LOGIC;
    otp_n : in STD_LOGIC;
    out_clk_0 : out STD_LOGIC;
    out_clk_1 : out STD_LOGIC;
    out_clk_2 : out STD_LOGIC;
    out_clk_3 : out STD_LOGIC;
    pmod0 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    pmod1 : out STD_LOGIC_VECTOR ( 4 downto 0 );
    pos_0 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    pos_1 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    pos_2 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    pos_3 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    ren : out STD_LOGIC;
    rx_0 : out STD_LOGIC;
    rx_1 : out STD_LOGIC;
    sel_0 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    sel_1 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    sel_2 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    sel_3 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    tx_0 : out STD_LOGIC;
    tx_trig_out_n : out STD_LOGIC_VECTOR ( 0 to 0 );
    tx_trig_out_p : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
end edt_zcu106_wrapper;

architecture STRUCTURE of edt_zcu106_wrapper is
  component edt_zcu106 is
  port (
    ren : out STD_LOGIC;
    oen : out STD_LOGIC;
    sel_0 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    pos_0 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    neg_0 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    out_clk_0 : out STD_LOGIC;
    otp_n : in STD_LOGIC;
    data_0 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    csn_clk_0 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    lvds_data_p_0 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    lvds_data_n_0 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    lvds_dco_p_0 : in STD_LOGIC;
    lvds_dco_n_0 : in STD_LOGIC;
    lvds_fco_p_0 : in STD_LOGIC;
    lvds_fco_n_0 : in STD_LOGIC;
    lvds_fco_n_1 : in STD_LOGIC;
    lvds_dco_n_1 : in STD_LOGIC;
    lvds_data_p_1 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    lvds_fco_p_1 : in STD_LOGIC;
    lvds_dco_p_1 : in STD_LOGIC;
    lvds_data_n_1 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    pos_1 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    out_clk_1 : out STD_LOGIC;
    sel_1 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    neg_1 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    pos_2 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    out_clk_2 : out STD_LOGIC;
    sel_2 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    neg_2 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    pos_3 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    out_clk_3 : out STD_LOGIC;
    sel_3 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    neg_3 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    rx_0 : out STD_LOGIC;
    afe0_csn : out STD_LOGIC;
    afe1_csn : out STD_LOGIC;
    afe_sck : out STD_LOGIC;
    afe_sdio : inout STD_LOGIC_VECTOR ( 0 to 0 );
    afe_clk_p : out STD_LOGIC_VECTOR ( 0 to 0 );
    afe_clk_n : out STD_LOGIC_VECTOR ( 0 to 0 );
    pmod0 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    tx_trig_out_p : out STD_LOGIC_VECTOR ( 0 to 0 );
    tx_trig_out_n : out STD_LOGIC_VECTOR ( 0 to 0 );
    rx_1 : out STD_LOGIC;
    tx_0 : out STD_LOGIC;
    pmod1 : out STD_LOGIC_VECTOR ( 4 downto 0 );
    leds : out STD_LOGIC_VECTOR ( 4 downto 0 )
  );
  end component edt_zcu106;
begin
edt_zcu106_i: component edt_zcu106
     port map (
      afe0_csn => afe0_csn,
      afe1_csn => afe1_csn,
      afe_clk_n(0) => afe_clk_n(0),
      afe_clk_p(0) => afe_clk_p(0),
      afe_sck => afe_sck,
      afe_sdio(0) => afe_sdio(0),
      csn_clk_0(1 downto 0) => csn_clk_0(1 downto 0),
      data_0(7 downto 0) => data_0(7 downto 0),
      leds(4 downto 0) => leds(4 downto 0),
      lvds_data_n_0(7 downto 0) => lvds_data_n_0(7 downto 0),
      lvds_data_n_1(7 downto 0) => lvds_data_n_1(7 downto 0),
      lvds_data_p_0(7 downto 0) => lvds_data_p_0(7 downto 0),
      lvds_data_p_1(7 downto 0) => lvds_data_p_1(7 downto 0),
      lvds_dco_n_0 => lvds_dco_n_0,
      lvds_dco_n_1 => lvds_dco_n_1,
      lvds_dco_p_0 => lvds_dco_p_0,
      lvds_dco_p_1 => lvds_dco_p_1,
      lvds_fco_n_0 => lvds_fco_n_0,
      lvds_fco_n_1 => lvds_fco_n_1,
      lvds_fco_p_0 => lvds_fco_p_0,
      lvds_fco_p_1 => lvds_fco_p_1,
      neg_0(3 downto 0) => neg_0(3 downto 0),
      neg_1(3 downto 0) => neg_1(3 downto 0),
      neg_2(3 downto 0) => neg_2(3 downto 0),
      neg_3(3 downto 0) => neg_3(3 downto 0),
      oen => oen,
      otp_n => otp_n,
      out_clk_0 => out_clk_0,
      out_clk_1 => out_clk_1,
      out_clk_2 => out_clk_2,
      out_clk_3 => out_clk_3,
      pmod0(7 downto 0) => pmod0(7 downto 0),
      pmod1(4 downto 0) => pmod1(4 downto 0),
      pos_0(3 downto 0) => pos_0(3 downto 0),
      pos_1(3 downto 0) => pos_1(3 downto 0),
      pos_2(3 downto 0) => pos_2(3 downto 0),
      pos_3(3 downto 0) => pos_3(3 downto 0),
      ren => ren,
      rx_0 => rx_0,
      rx_1 => rx_1,
      sel_0(3 downto 0) => sel_0(3 downto 0),
      sel_1(3 downto 0) => sel_1(3 downto 0),
      sel_2(3 downto 0) => sel_2(3 downto 0),
      sel_3(3 downto 0) => sel_3(3 downto 0),
      tx_0 => tx_0,
      tx_trig_out_n(0) => tx_trig_out_n(0),
      tx_trig_out_p(0) => tx_trig_out_p(0)
    );
end STRUCTURE;
