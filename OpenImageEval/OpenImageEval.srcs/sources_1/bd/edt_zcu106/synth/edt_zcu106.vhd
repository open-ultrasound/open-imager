--Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
--Date        : Wed Feb  3 20:47:38 2021
--Host        : SPATEN running 64-bit Service Pack 1  (build 7601)
--Command     : generate_target edt_zcu106.bd
--Design      : edt_zcu106
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m00_couplers_imp_4PMNBW is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 39 downto 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 39 downto 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end m00_couplers_imp_4PMNBW;

architecture STRUCTURE of m00_couplers_imp_4PMNBW is
  signal m00_couplers_to_m00_couplers_ARADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal m00_couplers_to_m00_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m00_couplers_to_m00_couplers_ARREADY : STD_LOGIC;
  signal m00_couplers_to_m00_couplers_ARVALID : STD_LOGIC;
  signal m00_couplers_to_m00_couplers_AWADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal m00_couplers_to_m00_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m00_couplers_to_m00_couplers_AWREADY : STD_LOGIC;
  signal m00_couplers_to_m00_couplers_AWVALID : STD_LOGIC;
  signal m00_couplers_to_m00_couplers_BREADY : STD_LOGIC;
  signal m00_couplers_to_m00_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_m00_couplers_BVALID : STD_LOGIC;
  signal m00_couplers_to_m00_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_m00_couplers_RREADY : STD_LOGIC;
  signal m00_couplers_to_m00_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_m00_couplers_RVALID : STD_LOGIC;
  signal m00_couplers_to_m00_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_m00_couplers_WREADY : STD_LOGIC;
  signal m00_couplers_to_m00_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_m00_couplers_WVALID : STD_LOGIC;
begin
  M_AXI_araddr(39 downto 0) <= m00_couplers_to_m00_couplers_ARADDR(39 downto 0);
  M_AXI_arprot(2 downto 0) <= m00_couplers_to_m00_couplers_ARPROT(2 downto 0);
  M_AXI_arvalid <= m00_couplers_to_m00_couplers_ARVALID;
  M_AXI_awaddr(39 downto 0) <= m00_couplers_to_m00_couplers_AWADDR(39 downto 0);
  M_AXI_awprot(2 downto 0) <= m00_couplers_to_m00_couplers_AWPROT(2 downto 0);
  M_AXI_awvalid <= m00_couplers_to_m00_couplers_AWVALID;
  M_AXI_bready <= m00_couplers_to_m00_couplers_BREADY;
  M_AXI_rready <= m00_couplers_to_m00_couplers_RREADY;
  M_AXI_wdata(31 downto 0) <= m00_couplers_to_m00_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= m00_couplers_to_m00_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid <= m00_couplers_to_m00_couplers_WVALID;
  S_AXI_arready <= m00_couplers_to_m00_couplers_ARREADY;
  S_AXI_awready <= m00_couplers_to_m00_couplers_AWREADY;
  S_AXI_bresp(1 downto 0) <= m00_couplers_to_m00_couplers_BRESP(1 downto 0);
  S_AXI_bvalid <= m00_couplers_to_m00_couplers_BVALID;
  S_AXI_rdata(31 downto 0) <= m00_couplers_to_m00_couplers_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m00_couplers_to_m00_couplers_RRESP(1 downto 0);
  S_AXI_rvalid <= m00_couplers_to_m00_couplers_RVALID;
  S_AXI_wready <= m00_couplers_to_m00_couplers_WREADY;
  m00_couplers_to_m00_couplers_ARADDR(39 downto 0) <= S_AXI_araddr(39 downto 0);
  m00_couplers_to_m00_couplers_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  m00_couplers_to_m00_couplers_ARREADY <= M_AXI_arready;
  m00_couplers_to_m00_couplers_ARVALID <= S_AXI_arvalid;
  m00_couplers_to_m00_couplers_AWADDR(39 downto 0) <= S_AXI_awaddr(39 downto 0);
  m00_couplers_to_m00_couplers_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  m00_couplers_to_m00_couplers_AWREADY <= M_AXI_awready;
  m00_couplers_to_m00_couplers_AWVALID <= S_AXI_awvalid;
  m00_couplers_to_m00_couplers_BREADY <= S_AXI_bready;
  m00_couplers_to_m00_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  m00_couplers_to_m00_couplers_BVALID <= M_AXI_bvalid;
  m00_couplers_to_m00_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  m00_couplers_to_m00_couplers_RREADY <= S_AXI_rready;
  m00_couplers_to_m00_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  m00_couplers_to_m00_couplers_RVALID <= M_AXI_rvalid;
  m00_couplers_to_m00_couplers_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m00_couplers_to_m00_couplers_WREADY <= M_AXI_wready;
  m00_couplers_to_m00_couplers_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m00_couplers_to_m00_couplers_WVALID <= S_AXI_wvalid;
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m01_couplers_imp_WMS2XM is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 39 downto 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 39 downto 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end m01_couplers_imp_WMS2XM;

architecture STRUCTURE of m01_couplers_imp_WMS2XM is
  signal m01_couplers_to_m01_couplers_ARADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal m01_couplers_to_m01_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m01_couplers_to_m01_couplers_ARREADY : STD_LOGIC;
  signal m01_couplers_to_m01_couplers_ARVALID : STD_LOGIC;
  signal m01_couplers_to_m01_couplers_AWADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal m01_couplers_to_m01_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m01_couplers_to_m01_couplers_AWREADY : STD_LOGIC;
  signal m01_couplers_to_m01_couplers_AWVALID : STD_LOGIC;
  signal m01_couplers_to_m01_couplers_BREADY : STD_LOGIC;
  signal m01_couplers_to_m01_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m01_couplers_to_m01_couplers_BVALID : STD_LOGIC;
  signal m01_couplers_to_m01_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_m01_couplers_RREADY : STD_LOGIC;
  signal m01_couplers_to_m01_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m01_couplers_to_m01_couplers_RVALID : STD_LOGIC;
  signal m01_couplers_to_m01_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_m01_couplers_WREADY : STD_LOGIC;
  signal m01_couplers_to_m01_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m01_couplers_to_m01_couplers_WVALID : STD_LOGIC;
begin
  M_AXI_araddr(39 downto 0) <= m01_couplers_to_m01_couplers_ARADDR(39 downto 0);
  M_AXI_arprot(2 downto 0) <= m01_couplers_to_m01_couplers_ARPROT(2 downto 0);
  M_AXI_arvalid <= m01_couplers_to_m01_couplers_ARVALID;
  M_AXI_awaddr(39 downto 0) <= m01_couplers_to_m01_couplers_AWADDR(39 downto 0);
  M_AXI_awprot(2 downto 0) <= m01_couplers_to_m01_couplers_AWPROT(2 downto 0);
  M_AXI_awvalid <= m01_couplers_to_m01_couplers_AWVALID;
  M_AXI_bready <= m01_couplers_to_m01_couplers_BREADY;
  M_AXI_rready <= m01_couplers_to_m01_couplers_RREADY;
  M_AXI_wdata(31 downto 0) <= m01_couplers_to_m01_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= m01_couplers_to_m01_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid <= m01_couplers_to_m01_couplers_WVALID;
  S_AXI_arready <= m01_couplers_to_m01_couplers_ARREADY;
  S_AXI_awready <= m01_couplers_to_m01_couplers_AWREADY;
  S_AXI_bresp(1 downto 0) <= m01_couplers_to_m01_couplers_BRESP(1 downto 0);
  S_AXI_bvalid <= m01_couplers_to_m01_couplers_BVALID;
  S_AXI_rdata(31 downto 0) <= m01_couplers_to_m01_couplers_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m01_couplers_to_m01_couplers_RRESP(1 downto 0);
  S_AXI_rvalid <= m01_couplers_to_m01_couplers_RVALID;
  S_AXI_wready <= m01_couplers_to_m01_couplers_WREADY;
  m01_couplers_to_m01_couplers_ARADDR(39 downto 0) <= S_AXI_araddr(39 downto 0);
  m01_couplers_to_m01_couplers_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  m01_couplers_to_m01_couplers_ARREADY <= M_AXI_arready;
  m01_couplers_to_m01_couplers_ARVALID <= S_AXI_arvalid;
  m01_couplers_to_m01_couplers_AWADDR(39 downto 0) <= S_AXI_awaddr(39 downto 0);
  m01_couplers_to_m01_couplers_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  m01_couplers_to_m01_couplers_AWREADY <= M_AXI_awready;
  m01_couplers_to_m01_couplers_AWVALID <= S_AXI_awvalid;
  m01_couplers_to_m01_couplers_BREADY <= S_AXI_bready;
  m01_couplers_to_m01_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  m01_couplers_to_m01_couplers_BVALID <= M_AXI_bvalid;
  m01_couplers_to_m01_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  m01_couplers_to_m01_couplers_RREADY <= S_AXI_rready;
  m01_couplers_to_m01_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  m01_couplers_to_m01_couplers_RVALID <= M_AXI_rvalid;
  m01_couplers_to_m01_couplers_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m01_couplers_to_m01_couplers_WREADY <= M_AXI_wready;
  m01_couplers_to_m01_couplers_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m01_couplers_to_m01_couplers_WVALID <= S_AXI_wvalid;
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m02_couplers_imp_1OJM3GW is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 39 downto 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 39 downto 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end m02_couplers_imp_1OJM3GW;

architecture STRUCTURE of m02_couplers_imp_1OJM3GW is
  signal m02_couplers_to_m02_couplers_ARADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal m02_couplers_to_m02_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m02_couplers_to_m02_couplers_ARREADY : STD_LOGIC;
  signal m02_couplers_to_m02_couplers_ARVALID : STD_LOGIC;
  signal m02_couplers_to_m02_couplers_AWADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal m02_couplers_to_m02_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m02_couplers_to_m02_couplers_AWREADY : STD_LOGIC;
  signal m02_couplers_to_m02_couplers_AWVALID : STD_LOGIC;
  signal m02_couplers_to_m02_couplers_BREADY : STD_LOGIC;
  signal m02_couplers_to_m02_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m02_couplers_to_m02_couplers_BVALID : STD_LOGIC;
  signal m02_couplers_to_m02_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m02_couplers_to_m02_couplers_RREADY : STD_LOGIC;
  signal m02_couplers_to_m02_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m02_couplers_to_m02_couplers_RVALID : STD_LOGIC;
  signal m02_couplers_to_m02_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m02_couplers_to_m02_couplers_WREADY : STD_LOGIC;
  signal m02_couplers_to_m02_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m02_couplers_to_m02_couplers_WVALID : STD_LOGIC;
begin
  M_AXI_araddr(39 downto 0) <= m02_couplers_to_m02_couplers_ARADDR(39 downto 0);
  M_AXI_arprot(2 downto 0) <= m02_couplers_to_m02_couplers_ARPROT(2 downto 0);
  M_AXI_arvalid <= m02_couplers_to_m02_couplers_ARVALID;
  M_AXI_awaddr(39 downto 0) <= m02_couplers_to_m02_couplers_AWADDR(39 downto 0);
  M_AXI_awprot(2 downto 0) <= m02_couplers_to_m02_couplers_AWPROT(2 downto 0);
  M_AXI_awvalid <= m02_couplers_to_m02_couplers_AWVALID;
  M_AXI_bready <= m02_couplers_to_m02_couplers_BREADY;
  M_AXI_rready <= m02_couplers_to_m02_couplers_RREADY;
  M_AXI_wdata(31 downto 0) <= m02_couplers_to_m02_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= m02_couplers_to_m02_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid <= m02_couplers_to_m02_couplers_WVALID;
  S_AXI_arready <= m02_couplers_to_m02_couplers_ARREADY;
  S_AXI_awready <= m02_couplers_to_m02_couplers_AWREADY;
  S_AXI_bresp(1 downto 0) <= m02_couplers_to_m02_couplers_BRESP(1 downto 0);
  S_AXI_bvalid <= m02_couplers_to_m02_couplers_BVALID;
  S_AXI_rdata(31 downto 0) <= m02_couplers_to_m02_couplers_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m02_couplers_to_m02_couplers_RRESP(1 downto 0);
  S_AXI_rvalid <= m02_couplers_to_m02_couplers_RVALID;
  S_AXI_wready <= m02_couplers_to_m02_couplers_WREADY;
  m02_couplers_to_m02_couplers_ARADDR(39 downto 0) <= S_AXI_araddr(39 downto 0);
  m02_couplers_to_m02_couplers_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  m02_couplers_to_m02_couplers_ARREADY <= M_AXI_arready;
  m02_couplers_to_m02_couplers_ARVALID <= S_AXI_arvalid;
  m02_couplers_to_m02_couplers_AWADDR(39 downto 0) <= S_AXI_awaddr(39 downto 0);
  m02_couplers_to_m02_couplers_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  m02_couplers_to_m02_couplers_AWREADY <= M_AXI_awready;
  m02_couplers_to_m02_couplers_AWVALID <= S_AXI_awvalid;
  m02_couplers_to_m02_couplers_BREADY <= S_AXI_bready;
  m02_couplers_to_m02_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  m02_couplers_to_m02_couplers_BVALID <= M_AXI_bvalid;
  m02_couplers_to_m02_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  m02_couplers_to_m02_couplers_RREADY <= S_AXI_rready;
  m02_couplers_to_m02_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  m02_couplers_to_m02_couplers_RVALID <= M_AXI_rvalid;
  m02_couplers_to_m02_couplers_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m02_couplers_to_m02_couplers_WREADY <= M_AXI_wready;
  m02_couplers_to_m02_couplers_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m02_couplers_to_m02_couplers_WVALID <= S_AXI_wvalid;
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m03_couplers_imp_1H31U1I is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 39 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 39 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wvalid : in STD_LOGIC
  );
end m03_couplers_imp_1H31U1I;

architecture STRUCTURE of m03_couplers_imp_1H31U1I is
  signal m03_couplers_to_m03_couplers_ARADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal m03_couplers_to_m03_couplers_ARREADY : STD_LOGIC;
  signal m03_couplers_to_m03_couplers_ARVALID : STD_LOGIC;
  signal m03_couplers_to_m03_couplers_AWADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal m03_couplers_to_m03_couplers_AWREADY : STD_LOGIC;
  signal m03_couplers_to_m03_couplers_AWVALID : STD_LOGIC;
  signal m03_couplers_to_m03_couplers_BREADY : STD_LOGIC;
  signal m03_couplers_to_m03_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m03_couplers_to_m03_couplers_BVALID : STD_LOGIC;
  signal m03_couplers_to_m03_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m03_couplers_to_m03_couplers_RREADY : STD_LOGIC;
  signal m03_couplers_to_m03_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m03_couplers_to_m03_couplers_RVALID : STD_LOGIC;
  signal m03_couplers_to_m03_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m03_couplers_to_m03_couplers_WREADY : STD_LOGIC;
  signal m03_couplers_to_m03_couplers_WVALID : STD_LOGIC;
begin
  M_AXI_araddr(39 downto 0) <= m03_couplers_to_m03_couplers_ARADDR(39 downto 0);
  M_AXI_arvalid <= m03_couplers_to_m03_couplers_ARVALID;
  M_AXI_awaddr(39 downto 0) <= m03_couplers_to_m03_couplers_AWADDR(39 downto 0);
  M_AXI_awvalid <= m03_couplers_to_m03_couplers_AWVALID;
  M_AXI_bready <= m03_couplers_to_m03_couplers_BREADY;
  M_AXI_rready <= m03_couplers_to_m03_couplers_RREADY;
  M_AXI_wdata(31 downto 0) <= m03_couplers_to_m03_couplers_WDATA(31 downto 0);
  M_AXI_wvalid <= m03_couplers_to_m03_couplers_WVALID;
  S_AXI_arready <= m03_couplers_to_m03_couplers_ARREADY;
  S_AXI_awready <= m03_couplers_to_m03_couplers_AWREADY;
  S_AXI_bresp(1 downto 0) <= m03_couplers_to_m03_couplers_BRESP(1 downto 0);
  S_AXI_bvalid <= m03_couplers_to_m03_couplers_BVALID;
  S_AXI_rdata(31 downto 0) <= m03_couplers_to_m03_couplers_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m03_couplers_to_m03_couplers_RRESP(1 downto 0);
  S_AXI_rvalid <= m03_couplers_to_m03_couplers_RVALID;
  S_AXI_wready <= m03_couplers_to_m03_couplers_WREADY;
  m03_couplers_to_m03_couplers_ARADDR(39 downto 0) <= S_AXI_araddr(39 downto 0);
  m03_couplers_to_m03_couplers_ARREADY <= M_AXI_arready;
  m03_couplers_to_m03_couplers_ARVALID <= S_AXI_arvalid;
  m03_couplers_to_m03_couplers_AWADDR(39 downto 0) <= S_AXI_awaddr(39 downto 0);
  m03_couplers_to_m03_couplers_AWREADY <= M_AXI_awready;
  m03_couplers_to_m03_couplers_AWVALID <= S_AXI_awvalid;
  m03_couplers_to_m03_couplers_BREADY <= S_AXI_bready;
  m03_couplers_to_m03_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  m03_couplers_to_m03_couplers_BVALID <= M_AXI_bvalid;
  m03_couplers_to_m03_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  m03_couplers_to_m03_couplers_RREADY <= S_AXI_rready;
  m03_couplers_to_m03_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  m03_couplers_to_m03_couplers_RVALID <= M_AXI_rvalid;
  m03_couplers_to_m03_couplers_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m03_couplers_to_m03_couplers_WREADY <= M_AXI_wready;
  m03_couplers_to_m03_couplers_WVALID <= S_AXI_wvalid;
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m04_couplers_imp_Q3TGHX is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 39 downto 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 39 downto 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end m04_couplers_imp_Q3TGHX;

architecture STRUCTURE of m04_couplers_imp_Q3TGHX is
  signal m04_couplers_to_m04_couplers_ARADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal m04_couplers_to_m04_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m04_couplers_to_m04_couplers_ARREADY : STD_LOGIC;
  signal m04_couplers_to_m04_couplers_ARVALID : STD_LOGIC;
  signal m04_couplers_to_m04_couplers_AWADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal m04_couplers_to_m04_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m04_couplers_to_m04_couplers_AWREADY : STD_LOGIC;
  signal m04_couplers_to_m04_couplers_AWVALID : STD_LOGIC;
  signal m04_couplers_to_m04_couplers_BREADY : STD_LOGIC;
  signal m04_couplers_to_m04_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m04_couplers_to_m04_couplers_BVALID : STD_LOGIC;
  signal m04_couplers_to_m04_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m04_couplers_to_m04_couplers_RREADY : STD_LOGIC;
  signal m04_couplers_to_m04_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m04_couplers_to_m04_couplers_RVALID : STD_LOGIC;
  signal m04_couplers_to_m04_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m04_couplers_to_m04_couplers_WREADY : STD_LOGIC;
  signal m04_couplers_to_m04_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m04_couplers_to_m04_couplers_WVALID : STD_LOGIC;
begin
  M_AXI_araddr(39 downto 0) <= m04_couplers_to_m04_couplers_ARADDR(39 downto 0);
  M_AXI_arprot(2 downto 0) <= m04_couplers_to_m04_couplers_ARPROT(2 downto 0);
  M_AXI_arvalid <= m04_couplers_to_m04_couplers_ARVALID;
  M_AXI_awaddr(39 downto 0) <= m04_couplers_to_m04_couplers_AWADDR(39 downto 0);
  M_AXI_awprot(2 downto 0) <= m04_couplers_to_m04_couplers_AWPROT(2 downto 0);
  M_AXI_awvalid <= m04_couplers_to_m04_couplers_AWVALID;
  M_AXI_bready <= m04_couplers_to_m04_couplers_BREADY;
  M_AXI_rready <= m04_couplers_to_m04_couplers_RREADY;
  M_AXI_wdata(31 downto 0) <= m04_couplers_to_m04_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= m04_couplers_to_m04_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid <= m04_couplers_to_m04_couplers_WVALID;
  S_AXI_arready <= m04_couplers_to_m04_couplers_ARREADY;
  S_AXI_awready <= m04_couplers_to_m04_couplers_AWREADY;
  S_AXI_bresp(1 downto 0) <= m04_couplers_to_m04_couplers_BRESP(1 downto 0);
  S_AXI_bvalid <= m04_couplers_to_m04_couplers_BVALID;
  S_AXI_rdata(31 downto 0) <= m04_couplers_to_m04_couplers_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m04_couplers_to_m04_couplers_RRESP(1 downto 0);
  S_AXI_rvalid <= m04_couplers_to_m04_couplers_RVALID;
  S_AXI_wready <= m04_couplers_to_m04_couplers_WREADY;
  m04_couplers_to_m04_couplers_ARADDR(39 downto 0) <= S_AXI_araddr(39 downto 0);
  m04_couplers_to_m04_couplers_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  m04_couplers_to_m04_couplers_ARREADY <= M_AXI_arready;
  m04_couplers_to_m04_couplers_ARVALID <= S_AXI_arvalid;
  m04_couplers_to_m04_couplers_AWADDR(39 downto 0) <= S_AXI_awaddr(39 downto 0);
  m04_couplers_to_m04_couplers_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  m04_couplers_to_m04_couplers_AWREADY <= M_AXI_awready;
  m04_couplers_to_m04_couplers_AWVALID <= S_AXI_awvalid;
  m04_couplers_to_m04_couplers_BREADY <= S_AXI_bready;
  m04_couplers_to_m04_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  m04_couplers_to_m04_couplers_BVALID <= M_AXI_bvalid;
  m04_couplers_to_m04_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  m04_couplers_to_m04_couplers_RREADY <= S_AXI_rready;
  m04_couplers_to_m04_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  m04_couplers_to_m04_couplers_RVALID <= M_AXI_rvalid;
  m04_couplers_to_m04_couplers_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m04_couplers_to_m04_couplers_WREADY <= M_AXI_wready;
  m04_couplers_to_m04_couplers_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m04_couplers_to_m04_couplers_WVALID <= S_AXI_wvalid;
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m05_couplers_imp_GHRS77 is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 39 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 39 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wvalid : in STD_LOGIC
  );
end m05_couplers_imp_GHRS77;

architecture STRUCTURE of m05_couplers_imp_GHRS77 is
  signal m05_couplers_to_m05_couplers_ARADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal m05_couplers_to_m05_couplers_ARREADY : STD_LOGIC;
  signal m05_couplers_to_m05_couplers_ARVALID : STD_LOGIC;
  signal m05_couplers_to_m05_couplers_AWADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal m05_couplers_to_m05_couplers_AWREADY : STD_LOGIC;
  signal m05_couplers_to_m05_couplers_AWVALID : STD_LOGIC;
  signal m05_couplers_to_m05_couplers_BREADY : STD_LOGIC;
  signal m05_couplers_to_m05_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m05_couplers_to_m05_couplers_BVALID : STD_LOGIC;
  signal m05_couplers_to_m05_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m05_couplers_to_m05_couplers_RREADY : STD_LOGIC;
  signal m05_couplers_to_m05_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m05_couplers_to_m05_couplers_RVALID : STD_LOGIC;
  signal m05_couplers_to_m05_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m05_couplers_to_m05_couplers_WREADY : STD_LOGIC;
  signal m05_couplers_to_m05_couplers_WVALID : STD_LOGIC;
begin
  M_AXI_araddr(39 downto 0) <= m05_couplers_to_m05_couplers_ARADDR(39 downto 0);
  M_AXI_arvalid <= m05_couplers_to_m05_couplers_ARVALID;
  M_AXI_awaddr(39 downto 0) <= m05_couplers_to_m05_couplers_AWADDR(39 downto 0);
  M_AXI_awvalid <= m05_couplers_to_m05_couplers_AWVALID;
  M_AXI_bready <= m05_couplers_to_m05_couplers_BREADY;
  M_AXI_rready <= m05_couplers_to_m05_couplers_RREADY;
  M_AXI_wdata(31 downto 0) <= m05_couplers_to_m05_couplers_WDATA(31 downto 0);
  M_AXI_wvalid <= m05_couplers_to_m05_couplers_WVALID;
  S_AXI_arready <= m05_couplers_to_m05_couplers_ARREADY;
  S_AXI_awready <= m05_couplers_to_m05_couplers_AWREADY;
  S_AXI_bresp(1 downto 0) <= m05_couplers_to_m05_couplers_BRESP(1 downto 0);
  S_AXI_bvalid <= m05_couplers_to_m05_couplers_BVALID;
  S_AXI_rdata(31 downto 0) <= m05_couplers_to_m05_couplers_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m05_couplers_to_m05_couplers_RRESP(1 downto 0);
  S_AXI_rvalid <= m05_couplers_to_m05_couplers_RVALID;
  S_AXI_wready <= m05_couplers_to_m05_couplers_WREADY;
  m05_couplers_to_m05_couplers_ARADDR(39 downto 0) <= S_AXI_araddr(39 downto 0);
  m05_couplers_to_m05_couplers_ARREADY <= M_AXI_arready;
  m05_couplers_to_m05_couplers_ARVALID <= S_AXI_arvalid;
  m05_couplers_to_m05_couplers_AWADDR(39 downto 0) <= S_AXI_awaddr(39 downto 0);
  m05_couplers_to_m05_couplers_AWREADY <= M_AXI_awready;
  m05_couplers_to_m05_couplers_AWVALID <= S_AXI_awvalid;
  m05_couplers_to_m05_couplers_BREADY <= S_AXI_bready;
  m05_couplers_to_m05_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  m05_couplers_to_m05_couplers_BVALID <= M_AXI_bvalid;
  m05_couplers_to_m05_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  m05_couplers_to_m05_couplers_RREADY <= S_AXI_rready;
  m05_couplers_to_m05_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  m05_couplers_to_m05_couplers_RVALID <= M_AXI_rvalid;
  m05_couplers_to_m05_couplers_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m05_couplers_to_m05_couplers_WREADY <= M_AXI_wready;
  m05_couplers_to_m05_couplers_WVALID <= S_AXI_wvalid;
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m06_couplers_imp_15ASNRD is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 39 downto 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 39 downto 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end m06_couplers_imp_15ASNRD;

architecture STRUCTURE of m06_couplers_imp_15ASNRD is
  signal m06_couplers_to_m06_couplers_ARADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal m06_couplers_to_m06_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m06_couplers_to_m06_couplers_ARREADY : STD_LOGIC;
  signal m06_couplers_to_m06_couplers_ARVALID : STD_LOGIC;
  signal m06_couplers_to_m06_couplers_AWADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal m06_couplers_to_m06_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m06_couplers_to_m06_couplers_AWREADY : STD_LOGIC;
  signal m06_couplers_to_m06_couplers_AWVALID : STD_LOGIC;
  signal m06_couplers_to_m06_couplers_BREADY : STD_LOGIC;
  signal m06_couplers_to_m06_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m06_couplers_to_m06_couplers_BVALID : STD_LOGIC;
  signal m06_couplers_to_m06_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m06_couplers_to_m06_couplers_RREADY : STD_LOGIC;
  signal m06_couplers_to_m06_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m06_couplers_to_m06_couplers_RVALID : STD_LOGIC;
  signal m06_couplers_to_m06_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m06_couplers_to_m06_couplers_WREADY : STD_LOGIC;
  signal m06_couplers_to_m06_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m06_couplers_to_m06_couplers_WVALID : STD_LOGIC;
begin
  M_AXI_araddr(39 downto 0) <= m06_couplers_to_m06_couplers_ARADDR(39 downto 0);
  M_AXI_arprot(2 downto 0) <= m06_couplers_to_m06_couplers_ARPROT(2 downto 0);
  M_AXI_arvalid <= m06_couplers_to_m06_couplers_ARVALID;
  M_AXI_awaddr(39 downto 0) <= m06_couplers_to_m06_couplers_AWADDR(39 downto 0);
  M_AXI_awprot(2 downto 0) <= m06_couplers_to_m06_couplers_AWPROT(2 downto 0);
  M_AXI_awvalid <= m06_couplers_to_m06_couplers_AWVALID;
  M_AXI_bready <= m06_couplers_to_m06_couplers_BREADY;
  M_AXI_rready <= m06_couplers_to_m06_couplers_RREADY;
  M_AXI_wdata(31 downto 0) <= m06_couplers_to_m06_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= m06_couplers_to_m06_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid <= m06_couplers_to_m06_couplers_WVALID;
  S_AXI_arready <= m06_couplers_to_m06_couplers_ARREADY;
  S_AXI_awready <= m06_couplers_to_m06_couplers_AWREADY;
  S_AXI_bresp(1 downto 0) <= m06_couplers_to_m06_couplers_BRESP(1 downto 0);
  S_AXI_bvalid <= m06_couplers_to_m06_couplers_BVALID;
  S_AXI_rdata(31 downto 0) <= m06_couplers_to_m06_couplers_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m06_couplers_to_m06_couplers_RRESP(1 downto 0);
  S_AXI_rvalid <= m06_couplers_to_m06_couplers_RVALID;
  S_AXI_wready <= m06_couplers_to_m06_couplers_WREADY;
  m06_couplers_to_m06_couplers_ARADDR(39 downto 0) <= S_AXI_araddr(39 downto 0);
  m06_couplers_to_m06_couplers_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  m06_couplers_to_m06_couplers_ARREADY <= M_AXI_arready;
  m06_couplers_to_m06_couplers_ARVALID <= S_AXI_arvalid;
  m06_couplers_to_m06_couplers_AWADDR(39 downto 0) <= S_AXI_awaddr(39 downto 0);
  m06_couplers_to_m06_couplers_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  m06_couplers_to_m06_couplers_AWREADY <= M_AXI_awready;
  m06_couplers_to_m06_couplers_AWVALID <= S_AXI_awvalid;
  m06_couplers_to_m06_couplers_BREADY <= S_AXI_bready;
  m06_couplers_to_m06_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  m06_couplers_to_m06_couplers_BVALID <= M_AXI_bvalid;
  m06_couplers_to_m06_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  m06_couplers_to_m06_couplers_RREADY <= S_AXI_rready;
  m06_couplers_to_m06_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  m06_couplers_to_m06_couplers_RVALID <= M_AXI_rvalid;
  m06_couplers_to_m06_couplers_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m06_couplers_to_m06_couplers_WREADY <= M_AXI_wready;
  m06_couplers_to_m06_couplers_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m06_couplers_to_m06_couplers_WVALID <= S_AXI_wvalid;
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m07_couplers_imp_1V2RKEN is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 39 downto 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 39 downto 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end m07_couplers_imp_1V2RKEN;

architecture STRUCTURE of m07_couplers_imp_1V2RKEN is
  signal m07_couplers_to_m07_couplers_ARADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal m07_couplers_to_m07_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m07_couplers_to_m07_couplers_ARREADY : STD_LOGIC;
  signal m07_couplers_to_m07_couplers_ARVALID : STD_LOGIC;
  signal m07_couplers_to_m07_couplers_AWADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal m07_couplers_to_m07_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m07_couplers_to_m07_couplers_AWREADY : STD_LOGIC;
  signal m07_couplers_to_m07_couplers_AWVALID : STD_LOGIC;
  signal m07_couplers_to_m07_couplers_BREADY : STD_LOGIC;
  signal m07_couplers_to_m07_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m07_couplers_to_m07_couplers_BVALID : STD_LOGIC;
  signal m07_couplers_to_m07_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m07_couplers_to_m07_couplers_RREADY : STD_LOGIC;
  signal m07_couplers_to_m07_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m07_couplers_to_m07_couplers_RVALID : STD_LOGIC;
  signal m07_couplers_to_m07_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m07_couplers_to_m07_couplers_WREADY : STD_LOGIC;
  signal m07_couplers_to_m07_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m07_couplers_to_m07_couplers_WVALID : STD_LOGIC;
begin
  M_AXI_araddr(39 downto 0) <= m07_couplers_to_m07_couplers_ARADDR(39 downto 0);
  M_AXI_arprot(2 downto 0) <= m07_couplers_to_m07_couplers_ARPROT(2 downto 0);
  M_AXI_arvalid <= m07_couplers_to_m07_couplers_ARVALID;
  M_AXI_awaddr(39 downto 0) <= m07_couplers_to_m07_couplers_AWADDR(39 downto 0);
  M_AXI_awprot(2 downto 0) <= m07_couplers_to_m07_couplers_AWPROT(2 downto 0);
  M_AXI_awvalid <= m07_couplers_to_m07_couplers_AWVALID;
  M_AXI_bready <= m07_couplers_to_m07_couplers_BREADY;
  M_AXI_rready <= m07_couplers_to_m07_couplers_RREADY;
  M_AXI_wdata(31 downto 0) <= m07_couplers_to_m07_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= m07_couplers_to_m07_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid <= m07_couplers_to_m07_couplers_WVALID;
  S_AXI_arready <= m07_couplers_to_m07_couplers_ARREADY;
  S_AXI_awready <= m07_couplers_to_m07_couplers_AWREADY;
  S_AXI_bresp(1 downto 0) <= m07_couplers_to_m07_couplers_BRESP(1 downto 0);
  S_AXI_bvalid <= m07_couplers_to_m07_couplers_BVALID;
  S_AXI_rdata(31 downto 0) <= m07_couplers_to_m07_couplers_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m07_couplers_to_m07_couplers_RRESP(1 downto 0);
  S_AXI_rvalid <= m07_couplers_to_m07_couplers_RVALID;
  S_AXI_wready <= m07_couplers_to_m07_couplers_WREADY;
  m07_couplers_to_m07_couplers_ARADDR(39 downto 0) <= S_AXI_araddr(39 downto 0);
  m07_couplers_to_m07_couplers_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  m07_couplers_to_m07_couplers_ARREADY <= M_AXI_arready;
  m07_couplers_to_m07_couplers_ARVALID <= S_AXI_arvalid;
  m07_couplers_to_m07_couplers_AWADDR(39 downto 0) <= S_AXI_awaddr(39 downto 0);
  m07_couplers_to_m07_couplers_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  m07_couplers_to_m07_couplers_AWREADY <= M_AXI_awready;
  m07_couplers_to_m07_couplers_AWVALID <= S_AXI_awvalid;
  m07_couplers_to_m07_couplers_BREADY <= S_AXI_bready;
  m07_couplers_to_m07_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  m07_couplers_to_m07_couplers_BVALID <= M_AXI_bvalid;
  m07_couplers_to_m07_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  m07_couplers_to_m07_couplers_RREADY <= S_AXI_rready;
  m07_couplers_to_m07_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  m07_couplers_to_m07_couplers_RVALID <= M_AXI_rvalid;
  m07_couplers_to_m07_couplers_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m07_couplers_to_m07_couplers_WREADY <= M_AXI_wready;
  m07_couplers_to_m07_couplers_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m07_couplers_to_m07_couplers_WVALID <= S_AXI_wvalid;
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity m08_couplers_imp_135OQPA is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 39 downto 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 39 downto 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end m08_couplers_imp_135OQPA;

architecture STRUCTURE of m08_couplers_imp_135OQPA is
  signal m08_couplers_to_m08_couplers_ARADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal m08_couplers_to_m08_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m08_couplers_to_m08_couplers_ARREADY : STD_LOGIC;
  signal m08_couplers_to_m08_couplers_ARVALID : STD_LOGIC;
  signal m08_couplers_to_m08_couplers_AWADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal m08_couplers_to_m08_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m08_couplers_to_m08_couplers_AWREADY : STD_LOGIC;
  signal m08_couplers_to_m08_couplers_AWVALID : STD_LOGIC;
  signal m08_couplers_to_m08_couplers_BREADY : STD_LOGIC;
  signal m08_couplers_to_m08_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m08_couplers_to_m08_couplers_BVALID : STD_LOGIC;
  signal m08_couplers_to_m08_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m08_couplers_to_m08_couplers_RREADY : STD_LOGIC;
  signal m08_couplers_to_m08_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m08_couplers_to_m08_couplers_RVALID : STD_LOGIC;
  signal m08_couplers_to_m08_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m08_couplers_to_m08_couplers_WREADY : STD_LOGIC;
  signal m08_couplers_to_m08_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m08_couplers_to_m08_couplers_WVALID : STD_LOGIC;
begin
  M_AXI_araddr(39 downto 0) <= m08_couplers_to_m08_couplers_ARADDR(39 downto 0);
  M_AXI_arprot(2 downto 0) <= m08_couplers_to_m08_couplers_ARPROT(2 downto 0);
  M_AXI_arvalid <= m08_couplers_to_m08_couplers_ARVALID;
  M_AXI_awaddr(39 downto 0) <= m08_couplers_to_m08_couplers_AWADDR(39 downto 0);
  M_AXI_awprot(2 downto 0) <= m08_couplers_to_m08_couplers_AWPROT(2 downto 0);
  M_AXI_awvalid <= m08_couplers_to_m08_couplers_AWVALID;
  M_AXI_bready <= m08_couplers_to_m08_couplers_BREADY;
  M_AXI_rready <= m08_couplers_to_m08_couplers_RREADY;
  M_AXI_wdata(31 downto 0) <= m08_couplers_to_m08_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= m08_couplers_to_m08_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid <= m08_couplers_to_m08_couplers_WVALID;
  S_AXI_arready <= m08_couplers_to_m08_couplers_ARREADY;
  S_AXI_awready <= m08_couplers_to_m08_couplers_AWREADY;
  S_AXI_bresp(1 downto 0) <= m08_couplers_to_m08_couplers_BRESP(1 downto 0);
  S_AXI_bvalid <= m08_couplers_to_m08_couplers_BVALID;
  S_AXI_rdata(31 downto 0) <= m08_couplers_to_m08_couplers_RDATA(31 downto 0);
  S_AXI_rresp(1 downto 0) <= m08_couplers_to_m08_couplers_RRESP(1 downto 0);
  S_AXI_rvalid <= m08_couplers_to_m08_couplers_RVALID;
  S_AXI_wready <= m08_couplers_to_m08_couplers_WREADY;
  m08_couplers_to_m08_couplers_ARADDR(39 downto 0) <= S_AXI_araddr(39 downto 0);
  m08_couplers_to_m08_couplers_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  m08_couplers_to_m08_couplers_ARREADY <= M_AXI_arready;
  m08_couplers_to_m08_couplers_ARVALID <= S_AXI_arvalid;
  m08_couplers_to_m08_couplers_AWADDR(39 downto 0) <= S_AXI_awaddr(39 downto 0);
  m08_couplers_to_m08_couplers_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  m08_couplers_to_m08_couplers_AWREADY <= M_AXI_awready;
  m08_couplers_to_m08_couplers_AWVALID <= S_AXI_awvalid;
  m08_couplers_to_m08_couplers_BREADY <= S_AXI_bready;
  m08_couplers_to_m08_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  m08_couplers_to_m08_couplers_BVALID <= M_AXI_bvalid;
  m08_couplers_to_m08_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  m08_couplers_to_m08_couplers_RREADY <= S_AXI_rready;
  m08_couplers_to_m08_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  m08_couplers_to_m08_couplers_RVALID <= M_AXI_rvalid;
  m08_couplers_to_m08_couplers_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  m08_couplers_to_m08_couplers_WREADY <= M_AXI_wready;
  m08_couplers_to_m08_couplers_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  m08_couplers_to_m08_couplers_WVALID <= S_AXI_wvalid;
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity s00_couplers_imp_VU5465 is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_awaddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_awready : in STD_LOGIC;
    M_AXI_awvalid : out STD_LOGIC;
    M_AXI_bready : out STD_LOGIC;
    M_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_bvalid : in STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    M_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_wready : in STD_LOGIC;
    M_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_wvalid : out STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 39 downto 0 );
    S_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arid : in STD_LOGIC_VECTOR ( 15 downto 0 );
    S_AXI_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awaddr : in STD_LOGIC_VECTOR ( 39 downto 0 );
    S_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awid : in STD_LOGIC_VECTOR ( 15 downto 0 );
    S_AXI_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_awready : out STD_LOGIC;
    S_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_awvalid : in STD_LOGIC;
    S_AXI_bid : out STD_LOGIC_VECTOR ( 15 downto 0 );
    S_AXI_bready : in STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rid : out STD_LOGIC_VECTOR ( 15 downto 0 );
    S_AXI_rlast : out STD_LOGIC;
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_wlast : in STD_LOGIC;
    S_AXI_wready : out STD_LOGIC;
    S_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_wvalid : in STD_LOGIC
  );
end s00_couplers_imp_VU5465;

architecture STRUCTURE of s00_couplers_imp_VU5465 is
  component edt_zcu106_auto_pc_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axi_awid : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 39 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wlast : in STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bid : out STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_arid : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 39 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rid : out STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rlast : out STD_LOGIC;
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_wvalid : out STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bvalid : in STD_LOGIC;
    m_axi_bready : out STD_LOGIC;
    m_axi_araddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arvalid : out STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rvalid : in STD_LOGIC;
    m_axi_rready : out STD_LOGIC
  );
  end component edt_zcu106_auto_pc_0;
  signal S_ACLK_1 : STD_LOGIC;
  signal S_ARESETN_1 : STD_LOGIC;
  signal auto_pc_to_s00_couplers_ARADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal auto_pc_to_s00_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_pc_to_s00_couplers_ARREADY : STD_LOGIC;
  signal auto_pc_to_s00_couplers_ARVALID : STD_LOGIC;
  signal auto_pc_to_s00_couplers_AWADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal auto_pc_to_s00_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal auto_pc_to_s00_couplers_AWREADY : STD_LOGIC;
  signal auto_pc_to_s00_couplers_AWVALID : STD_LOGIC;
  signal auto_pc_to_s00_couplers_BREADY : STD_LOGIC;
  signal auto_pc_to_s00_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_pc_to_s00_couplers_BVALID : STD_LOGIC;
  signal auto_pc_to_s00_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_s00_couplers_RREADY : STD_LOGIC;
  signal auto_pc_to_s00_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal auto_pc_to_s00_couplers_RVALID : STD_LOGIC;
  signal auto_pc_to_s00_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal auto_pc_to_s00_couplers_WREADY : STD_LOGIC;
  signal auto_pc_to_s00_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal auto_pc_to_s00_couplers_WVALID : STD_LOGIC;
  signal s00_couplers_to_auto_pc_ARADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal s00_couplers_to_auto_pc_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_auto_pc_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_auto_pc_ARID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal s00_couplers_to_auto_pc_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal s00_couplers_to_auto_pc_ARLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_auto_pc_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_auto_pc_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_auto_pc_ARREADY : STD_LOGIC;
  signal s00_couplers_to_auto_pc_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_auto_pc_ARVALID : STD_LOGIC;
  signal s00_couplers_to_auto_pc_AWADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal s00_couplers_to_auto_pc_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_auto_pc_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_auto_pc_AWID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal s00_couplers_to_auto_pc_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal s00_couplers_to_auto_pc_AWLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_auto_pc_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_auto_pc_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_auto_pc_AWREADY : STD_LOGIC;
  signal s00_couplers_to_auto_pc_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_auto_pc_AWVALID : STD_LOGIC;
  signal s00_couplers_to_auto_pc_BID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal s00_couplers_to_auto_pc_BREADY : STD_LOGIC;
  signal s00_couplers_to_auto_pc_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_auto_pc_BVALID : STD_LOGIC;
  signal s00_couplers_to_auto_pc_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_auto_pc_RID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal s00_couplers_to_auto_pc_RLAST : STD_LOGIC;
  signal s00_couplers_to_auto_pc_RREADY : STD_LOGIC;
  signal s00_couplers_to_auto_pc_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_auto_pc_RVALID : STD_LOGIC;
  signal s00_couplers_to_auto_pc_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_auto_pc_WLAST : STD_LOGIC;
  signal s00_couplers_to_auto_pc_WREADY : STD_LOGIC;
  signal s00_couplers_to_auto_pc_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_auto_pc_WVALID : STD_LOGIC;
begin
  M_AXI_araddr(39 downto 0) <= auto_pc_to_s00_couplers_ARADDR(39 downto 0);
  M_AXI_arprot(2 downto 0) <= auto_pc_to_s00_couplers_ARPROT(2 downto 0);
  M_AXI_arvalid <= auto_pc_to_s00_couplers_ARVALID;
  M_AXI_awaddr(39 downto 0) <= auto_pc_to_s00_couplers_AWADDR(39 downto 0);
  M_AXI_awprot(2 downto 0) <= auto_pc_to_s00_couplers_AWPROT(2 downto 0);
  M_AXI_awvalid <= auto_pc_to_s00_couplers_AWVALID;
  M_AXI_bready <= auto_pc_to_s00_couplers_BREADY;
  M_AXI_rready <= auto_pc_to_s00_couplers_RREADY;
  M_AXI_wdata(31 downto 0) <= auto_pc_to_s00_couplers_WDATA(31 downto 0);
  M_AXI_wstrb(3 downto 0) <= auto_pc_to_s00_couplers_WSTRB(3 downto 0);
  M_AXI_wvalid <= auto_pc_to_s00_couplers_WVALID;
  S_ACLK_1 <= S_ACLK;
  S_ARESETN_1 <= S_ARESETN;
  S_AXI_arready <= s00_couplers_to_auto_pc_ARREADY;
  S_AXI_awready <= s00_couplers_to_auto_pc_AWREADY;
  S_AXI_bid(15 downto 0) <= s00_couplers_to_auto_pc_BID(15 downto 0);
  S_AXI_bresp(1 downto 0) <= s00_couplers_to_auto_pc_BRESP(1 downto 0);
  S_AXI_bvalid <= s00_couplers_to_auto_pc_BVALID;
  S_AXI_rdata(31 downto 0) <= s00_couplers_to_auto_pc_RDATA(31 downto 0);
  S_AXI_rid(15 downto 0) <= s00_couplers_to_auto_pc_RID(15 downto 0);
  S_AXI_rlast <= s00_couplers_to_auto_pc_RLAST;
  S_AXI_rresp(1 downto 0) <= s00_couplers_to_auto_pc_RRESP(1 downto 0);
  S_AXI_rvalid <= s00_couplers_to_auto_pc_RVALID;
  S_AXI_wready <= s00_couplers_to_auto_pc_WREADY;
  auto_pc_to_s00_couplers_ARREADY <= M_AXI_arready;
  auto_pc_to_s00_couplers_AWREADY <= M_AXI_awready;
  auto_pc_to_s00_couplers_BRESP(1 downto 0) <= M_AXI_bresp(1 downto 0);
  auto_pc_to_s00_couplers_BVALID <= M_AXI_bvalid;
  auto_pc_to_s00_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  auto_pc_to_s00_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  auto_pc_to_s00_couplers_RVALID <= M_AXI_rvalid;
  auto_pc_to_s00_couplers_WREADY <= M_AXI_wready;
  s00_couplers_to_auto_pc_ARADDR(39 downto 0) <= S_AXI_araddr(39 downto 0);
  s00_couplers_to_auto_pc_ARBURST(1 downto 0) <= S_AXI_arburst(1 downto 0);
  s00_couplers_to_auto_pc_ARCACHE(3 downto 0) <= S_AXI_arcache(3 downto 0);
  s00_couplers_to_auto_pc_ARID(15 downto 0) <= S_AXI_arid(15 downto 0);
  s00_couplers_to_auto_pc_ARLEN(7 downto 0) <= S_AXI_arlen(7 downto 0);
  s00_couplers_to_auto_pc_ARLOCK(0) <= S_AXI_arlock(0);
  s00_couplers_to_auto_pc_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  s00_couplers_to_auto_pc_ARQOS(3 downto 0) <= S_AXI_arqos(3 downto 0);
  s00_couplers_to_auto_pc_ARSIZE(2 downto 0) <= S_AXI_arsize(2 downto 0);
  s00_couplers_to_auto_pc_ARVALID <= S_AXI_arvalid;
  s00_couplers_to_auto_pc_AWADDR(39 downto 0) <= S_AXI_awaddr(39 downto 0);
  s00_couplers_to_auto_pc_AWBURST(1 downto 0) <= S_AXI_awburst(1 downto 0);
  s00_couplers_to_auto_pc_AWCACHE(3 downto 0) <= S_AXI_awcache(3 downto 0);
  s00_couplers_to_auto_pc_AWID(15 downto 0) <= S_AXI_awid(15 downto 0);
  s00_couplers_to_auto_pc_AWLEN(7 downto 0) <= S_AXI_awlen(7 downto 0);
  s00_couplers_to_auto_pc_AWLOCK(0) <= S_AXI_awlock(0);
  s00_couplers_to_auto_pc_AWPROT(2 downto 0) <= S_AXI_awprot(2 downto 0);
  s00_couplers_to_auto_pc_AWQOS(3 downto 0) <= S_AXI_awqos(3 downto 0);
  s00_couplers_to_auto_pc_AWSIZE(2 downto 0) <= S_AXI_awsize(2 downto 0);
  s00_couplers_to_auto_pc_AWVALID <= S_AXI_awvalid;
  s00_couplers_to_auto_pc_BREADY <= S_AXI_bready;
  s00_couplers_to_auto_pc_RREADY <= S_AXI_rready;
  s00_couplers_to_auto_pc_WDATA(31 downto 0) <= S_AXI_wdata(31 downto 0);
  s00_couplers_to_auto_pc_WLAST <= S_AXI_wlast;
  s00_couplers_to_auto_pc_WSTRB(3 downto 0) <= S_AXI_wstrb(3 downto 0);
  s00_couplers_to_auto_pc_WVALID <= S_AXI_wvalid;
auto_pc: component edt_zcu106_auto_pc_0
     port map (
      aclk => S_ACLK_1,
      aresetn => S_ARESETN_1,
      m_axi_araddr(39 downto 0) => auto_pc_to_s00_couplers_ARADDR(39 downto 0),
      m_axi_arprot(2 downto 0) => auto_pc_to_s00_couplers_ARPROT(2 downto 0),
      m_axi_arready => auto_pc_to_s00_couplers_ARREADY,
      m_axi_arvalid => auto_pc_to_s00_couplers_ARVALID,
      m_axi_awaddr(39 downto 0) => auto_pc_to_s00_couplers_AWADDR(39 downto 0),
      m_axi_awprot(2 downto 0) => auto_pc_to_s00_couplers_AWPROT(2 downto 0),
      m_axi_awready => auto_pc_to_s00_couplers_AWREADY,
      m_axi_awvalid => auto_pc_to_s00_couplers_AWVALID,
      m_axi_bready => auto_pc_to_s00_couplers_BREADY,
      m_axi_bresp(1 downto 0) => auto_pc_to_s00_couplers_BRESP(1 downto 0),
      m_axi_bvalid => auto_pc_to_s00_couplers_BVALID,
      m_axi_rdata(31 downto 0) => auto_pc_to_s00_couplers_RDATA(31 downto 0),
      m_axi_rready => auto_pc_to_s00_couplers_RREADY,
      m_axi_rresp(1 downto 0) => auto_pc_to_s00_couplers_RRESP(1 downto 0),
      m_axi_rvalid => auto_pc_to_s00_couplers_RVALID,
      m_axi_wdata(31 downto 0) => auto_pc_to_s00_couplers_WDATA(31 downto 0),
      m_axi_wready => auto_pc_to_s00_couplers_WREADY,
      m_axi_wstrb(3 downto 0) => auto_pc_to_s00_couplers_WSTRB(3 downto 0),
      m_axi_wvalid => auto_pc_to_s00_couplers_WVALID,
      s_axi_araddr(39 downto 0) => s00_couplers_to_auto_pc_ARADDR(39 downto 0),
      s_axi_arburst(1 downto 0) => s00_couplers_to_auto_pc_ARBURST(1 downto 0),
      s_axi_arcache(3 downto 0) => s00_couplers_to_auto_pc_ARCACHE(3 downto 0),
      s_axi_arid(15 downto 0) => s00_couplers_to_auto_pc_ARID(15 downto 0),
      s_axi_arlen(7 downto 0) => s00_couplers_to_auto_pc_ARLEN(7 downto 0),
      s_axi_arlock(0) => s00_couplers_to_auto_pc_ARLOCK(0),
      s_axi_arprot(2 downto 0) => s00_couplers_to_auto_pc_ARPROT(2 downto 0),
      s_axi_arqos(3 downto 0) => s00_couplers_to_auto_pc_ARQOS(3 downto 0),
      s_axi_arready => s00_couplers_to_auto_pc_ARREADY,
      s_axi_arregion(3 downto 0) => B"0000",
      s_axi_arsize(2 downto 0) => s00_couplers_to_auto_pc_ARSIZE(2 downto 0),
      s_axi_arvalid => s00_couplers_to_auto_pc_ARVALID,
      s_axi_awaddr(39 downto 0) => s00_couplers_to_auto_pc_AWADDR(39 downto 0),
      s_axi_awburst(1 downto 0) => s00_couplers_to_auto_pc_AWBURST(1 downto 0),
      s_axi_awcache(3 downto 0) => s00_couplers_to_auto_pc_AWCACHE(3 downto 0),
      s_axi_awid(15 downto 0) => s00_couplers_to_auto_pc_AWID(15 downto 0),
      s_axi_awlen(7 downto 0) => s00_couplers_to_auto_pc_AWLEN(7 downto 0),
      s_axi_awlock(0) => s00_couplers_to_auto_pc_AWLOCK(0),
      s_axi_awprot(2 downto 0) => s00_couplers_to_auto_pc_AWPROT(2 downto 0),
      s_axi_awqos(3 downto 0) => s00_couplers_to_auto_pc_AWQOS(3 downto 0),
      s_axi_awready => s00_couplers_to_auto_pc_AWREADY,
      s_axi_awregion(3 downto 0) => B"0000",
      s_axi_awsize(2 downto 0) => s00_couplers_to_auto_pc_AWSIZE(2 downto 0),
      s_axi_awvalid => s00_couplers_to_auto_pc_AWVALID,
      s_axi_bid(15 downto 0) => s00_couplers_to_auto_pc_BID(15 downto 0),
      s_axi_bready => s00_couplers_to_auto_pc_BREADY,
      s_axi_bresp(1 downto 0) => s00_couplers_to_auto_pc_BRESP(1 downto 0),
      s_axi_bvalid => s00_couplers_to_auto_pc_BVALID,
      s_axi_rdata(31 downto 0) => s00_couplers_to_auto_pc_RDATA(31 downto 0),
      s_axi_rid(15 downto 0) => s00_couplers_to_auto_pc_RID(15 downto 0),
      s_axi_rlast => s00_couplers_to_auto_pc_RLAST,
      s_axi_rready => s00_couplers_to_auto_pc_RREADY,
      s_axi_rresp(1 downto 0) => s00_couplers_to_auto_pc_RRESP(1 downto 0),
      s_axi_rvalid => s00_couplers_to_auto_pc_RVALID,
      s_axi_wdata(31 downto 0) => s00_couplers_to_auto_pc_WDATA(31 downto 0),
      s_axi_wlast => s00_couplers_to_auto_pc_WLAST,
      s_axi_wready => s00_couplers_to_auto_pc_WREADY,
      s_axi_wstrb(3 downto 0) => s00_couplers_to_auto_pc_WSTRB(3 downto 0),
      s_axi_wvalid => s00_couplers_to_auto_pc_WVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity edt_zcu106_ps8_0_axi_periph_0 is
  port (
    ACLK : in STD_LOGIC;
    ARESETN : in STD_LOGIC;
    M00_ACLK : in STD_LOGIC;
    M00_ARESETN : in STD_LOGIC;
    M00_AXI_araddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M00_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_arready : in STD_LOGIC;
    M00_AXI_arvalid : out STD_LOGIC;
    M00_AXI_awaddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M00_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_awready : in STD_LOGIC;
    M00_AXI_awvalid : out STD_LOGIC;
    M00_AXI_bready : out STD_LOGIC;
    M00_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_bvalid : in STD_LOGIC;
    M00_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_rready : out STD_LOGIC;
    M00_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_rvalid : in STD_LOGIC;
    M00_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_wready : in STD_LOGIC;
    M00_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_wvalid : out STD_LOGIC;
    M01_ACLK : in STD_LOGIC;
    M01_ARESETN : in STD_LOGIC;
    M01_AXI_araddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M01_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M01_AXI_arready : in STD_LOGIC;
    M01_AXI_arvalid : out STD_LOGIC;
    M01_AXI_awaddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M01_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M01_AXI_awready : in STD_LOGIC;
    M01_AXI_awvalid : out STD_LOGIC;
    M01_AXI_bready : out STD_LOGIC;
    M01_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M01_AXI_bvalid : in STD_LOGIC;
    M01_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M01_AXI_rready : out STD_LOGIC;
    M01_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M01_AXI_rvalid : in STD_LOGIC;
    M01_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M01_AXI_wready : in STD_LOGIC;
    M01_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M01_AXI_wvalid : out STD_LOGIC;
    M02_ACLK : in STD_LOGIC;
    M02_ARESETN : in STD_LOGIC;
    M02_AXI_araddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M02_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M02_AXI_arready : in STD_LOGIC;
    M02_AXI_arvalid : out STD_LOGIC;
    M02_AXI_awaddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M02_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M02_AXI_awready : in STD_LOGIC;
    M02_AXI_awvalid : out STD_LOGIC;
    M02_AXI_bready : out STD_LOGIC;
    M02_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M02_AXI_bvalid : in STD_LOGIC;
    M02_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M02_AXI_rready : out STD_LOGIC;
    M02_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M02_AXI_rvalid : in STD_LOGIC;
    M02_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M02_AXI_wready : in STD_LOGIC;
    M02_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M02_AXI_wvalid : out STD_LOGIC;
    M03_ACLK : in STD_LOGIC;
    M03_ARESETN : in STD_LOGIC;
    M03_AXI_araddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M03_AXI_arready : in STD_LOGIC;
    M03_AXI_arvalid : out STD_LOGIC;
    M03_AXI_awaddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M03_AXI_awready : in STD_LOGIC;
    M03_AXI_awvalid : out STD_LOGIC;
    M03_AXI_bready : out STD_LOGIC;
    M03_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M03_AXI_bvalid : in STD_LOGIC;
    M03_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M03_AXI_rready : out STD_LOGIC;
    M03_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M03_AXI_rvalid : in STD_LOGIC;
    M03_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M03_AXI_wready : in STD_LOGIC;
    M03_AXI_wvalid : out STD_LOGIC;
    M04_ACLK : in STD_LOGIC;
    M04_ARESETN : in STD_LOGIC;
    M04_AXI_araddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M04_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M04_AXI_arready : in STD_LOGIC;
    M04_AXI_arvalid : out STD_LOGIC;
    M04_AXI_awaddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M04_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M04_AXI_awready : in STD_LOGIC;
    M04_AXI_awvalid : out STD_LOGIC;
    M04_AXI_bready : out STD_LOGIC;
    M04_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M04_AXI_bvalid : in STD_LOGIC;
    M04_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M04_AXI_rready : out STD_LOGIC;
    M04_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M04_AXI_rvalid : in STD_LOGIC;
    M04_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M04_AXI_wready : in STD_LOGIC;
    M04_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M04_AXI_wvalid : out STD_LOGIC;
    M05_ACLK : in STD_LOGIC;
    M05_ARESETN : in STD_LOGIC;
    M05_AXI_araddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M05_AXI_arready : in STD_LOGIC;
    M05_AXI_arvalid : out STD_LOGIC;
    M05_AXI_awaddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M05_AXI_awready : in STD_LOGIC;
    M05_AXI_awvalid : out STD_LOGIC;
    M05_AXI_bready : out STD_LOGIC;
    M05_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M05_AXI_bvalid : in STD_LOGIC;
    M05_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M05_AXI_rready : out STD_LOGIC;
    M05_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M05_AXI_rvalid : in STD_LOGIC;
    M05_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M05_AXI_wready : in STD_LOGIC;
    M05_AXI_wvalid : out STD_LOGIC;
    M06_ACLK : in STD_LOGIC;
    M06_ARESETN : in STD_LOGIC;
    M06_AXI_araddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M06_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M06_AXI_arready : in STD_LOGIC;
    M06_AXI_arvalid : out STD_LOGIC;
    M06_AXI_awaddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M06_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M06_AXI_awready : in STD_LOGIC;
    M06_AXI_awvalid : out STD_LOGIC;
    M06_AXI_bready : out STD_LOGIC;
    M06_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M06_AXI_bvalid : in STD_LOGIC;
    M06_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M06_AXI_rready : out STD_LOGIC;
    M06_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M06_AXI_rvalid : in STD_LOGIC;
    M06_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M06_AXI_wready : in STD_LOGIC;
    M06_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M06_AXI_wvalid : out STD_LOGIC;
    M07_ACLK : in STD_LOGIC;
    M07_ARESETN : in STD_LOGIC;
    M07_AXI_araddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M07_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M07_AXI_arready : in STD_LOGIC;
    M07_AXI_arvalid : out STD_LOGIC;
    M07_AXI_awaddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M07_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M07_AXI_awready : in STD_LOGIC;
    M07_AXI_awvalid : out STD_LOGIC;
    M07_AXI_bready : out STD_LOGIC;
    M07_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M07_AXI_bvalid : in STD_LOGIC;
    M07_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M07_AXI_rready : out STD_LOGIC;
    M07_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M07_AXI_rvalid : in STD_LOGIC;
    M07_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M07_AXI_wready : in STD_LOGIC;
    M07_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M07_AXI_wvalid : out STD_LOGIC;
    M08_ACLK : in STD_LOGIC;
    M08_ARESETN : in STD_LOGIC;
    M08_AXI_araddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M08_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M08_AXI_arready : in STD_LOGIC;
    M08_AXI_arvalid : out STD_LOGIC;
    M08_AXI_awaddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    M08_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M08_AXI_awready : in STD_LOGIC;
    M08_AXI_awvalid : out STD_LOGIC;
    M08_AXI_bready : out STD_LOGIC;
    M08_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M08_AXI_bvalid : in STD_LOGIC;
    M08_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M08_AXI_rready : out STD_LOGIC;
    M08_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M08_AXI_rvalid : in STD_LOGIC;
    M08_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M08_AXI_wready : in STD_LOGIC;
    M08_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M08_AXI_wvalid : out STD_LOGIC;
    S00_ACLK : in STD_LOGIC;
    S00_ARESETN : in STD_LOGIC;
    S00_AXI_araddr : in STD_LOGIC_VECTOR ( 39 downto 0 );
    S00_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_arid : in STD_LOGIC_VECTOR ( 15 downto 0 );
    S00_AXI_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S00_AXI_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_arready : out STD_LOGIC;
    S00_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_arvalid : in STD_LOGIC;
    S00_AXI_awaddr : in STD_LOGIC_VECTOR ( 39 downto 0 );
    S00_AXI_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_awid : in STD_LOGIC_VECTOR ( 15 downto 0 );
    S00_AXI_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S00_AXI_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_awready : out STD_LOGIC;
    S00_AXI_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_awvalid : in STD_LOGIC;
    S00_AXI_bid : out STD_LOGIC_VECTOR ( 15 downto 0 );
    S00_AXI_bready : in STD_LOGIC;
    S00_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_bvalid : out STD_LOGIC;
    S00_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_rid : out STD_LOGIC_VECTOR ( 15 downto 0 );
    S00_AXI_rlast : out STD_LOGIC;
    S00_AXI_rready : in STD_LOGIC;
    S00_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_rvalid : out STD_LOGIC;
    S00_AXI_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_wlast : in STD_LOGIC;
    S00_AXI_wready : out STD_LOGIC;
    S00_AXI_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_wvalid : in STD_LOGIC
  );
end edt_zcu106_ps8_0_axi_periph_0;

architecture STRUCTURE of edt_zcu106_ps8_0_axi_periph_0 is
  component edt_zcu106_xbar_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 39 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awready : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_wready : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_bready : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 39 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_arready : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_rready : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 359 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 26 downto 0 );
    m_axi_awvalid : out STD_LOGIC_VECTOR ( 8 downto 0 );
    m_axi_awready : in STD_LOGIC_VECTOR ( 8 downto 0 );
    m_axi_wdata : out STD_LOGIC_VECTOR ( 287 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 35 downto 0 );
    m_axi_wvalid : out STD_LOGIC_VECTOR ( 8 downto 0 );
    m_axi_wready : in STD_LOGIC_VECTOR ( 8 downto 0 );
    m_axi_bresp : in STD_LOGIC_VECTOR ( 17 downto 0 );
    m_axi_bvalid : in STD_LOGIC_VECTOR ( 8 downto 0 );
    m_axi_bready : out STD_LOGIC_VECTOR ( 8 downto 0 );
    m_axi_araddr : out STD_LOGIC_VECTOR ( 359 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 26 downto 0 );
    m_axi_arvalid : out STD_LOGIC_VECTOR ( 8 downto 0 );
    m_axi_arready : in STD_LOGIC_VECTOR ( 8 downto 0 );
    m_axi_rdata : in STD_LOGIC_VECTOR ( 287 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 17 downto 0 );
    m_axi_rvalid : in STD_LOGIC_VECTOR ( 8 downto 0 );
    m_axi_rready : out STD_LOGIC_VECTOR ( 8 downto 0 )
  );
  end component edt_zcu106_xbar_0;
  signal m00_couplers_to_ps8_0_axi_periph_ARADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal m00_couplers_to_ps8_0_axi_periph_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m00_couplers_to_ps8_0_axi_periph_ARREADY : STD_LOGIC;
  signal m00_couplers_to_ps8_0_axi_periph_ARVALID : STD_LOGIC;
  signal m00_couplers_to_ps8_0_axi_periph_AWADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal m00_couplers_to_ps8_0_axi_periph_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m00_couplers_to_ps8_0_axi_periph_AWREADY : STD_LOGIC;
  signal m00_couplers_to_ps8_0_axi_periph_AWVALID : STD_LOGIC;
  signal m00_couplers_to_ps8_0_axi_periph_BREADY : STD_LOGIC;
  signal m00_couplers_to_ps8_0_axi_periph_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_ps8_0_axi_periph_BVALID : STD_LOGIC;
  signal m00_couplers_to_ps8_0_axi_periph_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_ps8_0_axi_periph_RREADY : STD_LOGIC;
  signal m00_couplers_to_ps8_0_axi_periph_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m00_couplers_to_ps8_0_axi_periph_RVALID : STD_LOGIC;
  signal m00_couplers_to_ps8_0_axi_periph_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m00_couplers_to_ps8_0_axi_periph_WREADY : STD_LOGIC;
  signal m00_couplers_to_ps8_0_axi_periph_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m00_couplers_to_ps8_0_axi_periph_WVALID : STD_LOGIC;
  signal m01_couplers_to_ps8_0_axi_periph_ARADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal m01_couplers_to_ps8_0_axi_periph_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m01_couplers_to_ps8_0_axi_periph_ARREADY : STD_LOGIC;
  signal m01_couplers_to_ps8_0_axi_periph_ARVALID : STD_LOGIC;
  signal m01_couplers_to_ps8_0_axi_periph_AWADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal m01_couplers_to_ps8_0_axi_periph_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m01_couplers_to_ps8_0_axi_periph_AWREADY : STD_LOGIC;
  signal m01_couplers_to_ps8_0_axi_periph_AWVALID : STD_LOGIC;
  signal m01_couplers_to_ps8_0_axi_periph_BREADY : STD_LOGIC;
  signal m01_couplers_to_ps8_0_axi_periph_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m01_couplers_to_ps8_0_axi_periph_BVALID : STD_LOGIC;
  signal m01_couplers_to_ps8_0_axi_periph_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_ps8_0_axi_periph_RREADY : STD_LOGIC;
  signal m01_couplers_to_ps8_0_axi_periph_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m01_couplers_to_ps8_0_axi_periph_RVALID : STD_LOGIC;
  signal m01_couplers_to_ps8_0_axi_periph_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m01_couplers_to_ps8_0_axi_periph_WREADY : STD_LOGIC;
  signal m01_couplers_to_ps8_0_axi_periph_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m01_couplers_to_ps8_0_axi_periph_WVALID : STD_LOGIC;
  signal m02_couplers_to_ps8_0_axi_periph_ARADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal m02_couplers_to_ps8_0_axi_periph_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m02_couplers_to_ps8_0_axi_periph_ARREADY : STD_LOGIC;
  signal m02_couplers_to_ps8_0_axi_periph_ARVALID : STD_LOGIC;
  signal m02_couplers_to_ps8_0_axi_periph_AWADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal m02_couplers_to_ps8_0_axi_periph_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m02_couplers_to_ps8_0_axi_periph_AWREADY : STD_LOGIC;
  signal m02_couplers_to_ps8_0_axi_periph_AWVALID : STD_LOGIC;
  signal m02_couplers_to_ps8_0_axi_periph_BREADY : STD_LOGIC;
  signal m02_couplers_to_ps8_0_axi_periph_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m02_couplers_to_ps8_0_axi_periph_BVALID : STD_LOGIC;
  signal m02_couplers_to_ps8_0_axi_periph_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m02_couplers_to_ps8_0_axi_periph_RREADY : STD_LOGIC;
  signal m02_couplers_to_ps8_0_axi_periph_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m02_couplers_to_ps8_0_axi_periph_RVALID : STD_LOGIC;
  signal m02_couplers_to_ps8_0_axi_periph_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m02_couplers_to_ps8_0_axi_periph_WREADY : STD_LOGIC;
  signal m02_couplers_to_ps8_0_axi_periph_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m02_couplers_to_ps8_0_axi_periph_WVALID : STD_LOGIC;
  signal m03_couplers_to_ps8_0_axi_periph_ARADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal m03_couplers_to_ps8_0_axi_periph_ARREADY : STD_LOGIC;
  signal m03_couplers_to_ps8_0_axi_periph_ARVALID : STD_LOGIC;
  signal m03_couplers_to_ps8_0_axi_periph_AWADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal m03_couplers_to_ps8_0_axi_periph_AWREADY : STD_LOGIC;
  signal m03_couplers_to_ps8_0_axi_periph_AWVALID : STD_LOGIC;
  signal m03_couplers_to_ps8_0_axi_periph_BREADY : STD_LOGIC;
  signal m03_couplers_to_ps8_0_axi_periph_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m03_couplers_to_ps8_0_axi_periph_BVALID : STD_LOGIC;
  signal m03_couplers_to_ps8_0_axi_periph_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m03_couplers_to_ps8_0_axi_periph_RREADY : STD_LOGIC;
  signal m03_couplers_to_ps8_0_axi_periph_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m03_couplers_to_ps8_0_axi_periph_RVALID : STD_LOGIC;
  signal m03_couplers_to_ps8_0_axi_periph_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m03_couplers_to_ps8_0_axi_periph_WREADY : STD_LOGIC;
  signal m03_couplers_to_ps8_0_axi_periph_WVALID : STD_LOGIC;
  signal m04_couplers_to_ps8_0_axi_periph_ARADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal m04_couplers_to_ps8_0_axi_periph_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m04_couplers_to_ps8_0_axi_periph_ARREADY : STD_LOGIC;
  signal m04_couplers_to_ps8_0_axi_periph_ARVALID : STD_LOGIC;
  signal m04_couplers_to_ps8_0_axi_periph_AWADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal m04_couplers_to_ps8_0_axi_periph_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m04_couplers_to_ps8_0_axi_periph_AWREADY : STD_LOGIC;
  signal m04_couplers_to_ps8_0_axi_periph_AWVALID : STD_LOGIC;
  signal m04_couplers_to_ps8_0_axi_periph_BREADY : STD_LOGIC;
  signal m04_couplers_to_ps8_0_axi_periph_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m04_couplers_to_ps8_0_axi_periph_BVALID : STD_LOGIC;
  signal m04_couplers_to_ps8_0_axi_periph_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m04_couplers_to_ps8_0_axi_periph_RREADY : STD_LOGIC;
  signal m04_couplers_to_ps8_0_axi_periph_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m04_couplers_to_ps8_0_axi_periph_RVALID : STD_LOGIC;
  signal m04_couplers_to_ps8_0_axi_periph_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m04_couplers_to_ps8_0_axi_periph_WREADY : STD_LOGIC;
  signal m04_couplers_to_ps8_0_axi_periph_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m04_couplers_to_ps8_0_axi_periph_WVALID : STD_LOGIC;
  signal m05_couplers_to_ps8_0_axi_periph_ARADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal m05_couplers_to_ps8_0_axi_periph_ARREADY : STD_LOGIC;
  signal m05_couplers_to_ps8_0_axi_periph_ARVALID : STD_LOGIC;
  signal m05_couplers_to_ps8_0_axi_periph_AWADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal m05_couplers_to_ps8_0_axi_periph_AWREADY : STD_LOGIC;
  signal m05_couplers_to_ps8_0_axi_periph_AWVALID : STD_LOGIC;
  signal m05_couplers_to_ps8_0_axi_periph_BREADY : STD_LOGIC;
  signal m05_couplers_to_ps8_0_axi_periph_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m05_couplers_to_ps8_0_axi_periph_BVALID : STD_LOGIC;
  signal m05_couplers_to_ps8_0_axi_periph_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m05_couplers_to_ps8_0_axi_periph_RREADY : STD_LOGIC;
  signal m05_couplers_to_ps8_0_axi_periph_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m05_couplers_to_ps8_0_axi_periph_RVALID : STD_LOGIC;
  signal m05_couplers_to_ps8_0_axi_periph_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m05_couplers_to_ps8_0_axi_periph_WREADY : STD_LOGIC;
  signal m05_couplers_to_ps8_0_axi_periph_WVALID : STD_LOGIC;
  signal m06_couplers_to_ps8_0_axi_periph_ARADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal m06_couplers_to_ps8_0_axi_periph_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m06_couplers_to_ps8_0_axi_periph_ARREADY : STD_LOGIC;
  signal m06_couplers_to_ps8_0_axi_periph_ARVALID : STD_LOGIC;
  signal m06_couplers_to_ps8_0_axi_periph_AWADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal m06_couplers_to_ps8_0_axi_periph_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m06_couplers_to_ps8_0_axi_periph_AWREADY : STD_LOGIC;
  signal m06_couplers_to_ps8_0_axi_periph_AWVALID : STD_LOGIC;
  signal m06_couplers_to_ps8_0_axi_periph_BREADY : STD_LOGIC;
  signal m06_couplers_to_ps8_0_axi_periph_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m06_couplers_to_ps8_0_axi_periph_BVALID : STD_LOGIC;
  signal m06_couplers_to_ps8_0_axi_periph_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m06_couplers_to_ps8_0_axi_periph_RREADY : STD_LOGIC;
  signal m06_couplers_to_ps8_0_axi_periph_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m06_couplers_to_ps8_0_axi_periph_RVALID : STD_LOGIC;
  signal m06_couplers_to_ps8_0_axi_periph_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m06_couplers_to_ps8_0_axi_periph_WREADY : STD_LOGIC;
  signal m06_couplers_to_ps8_0_axi_periph_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m06_couplers_to_ps8_0_axi_periph_WVALID : STD_LOGIC;
  signal m07_couplers_to_ps8_0_axi_periph_ARADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal m07_couplers_to_ps8_0_axi_periph_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m07_couplers_to_ps8_0_axi_periph_ARREADY : STD_LOGIC;
  signal m07_couplers_to_ps8_0_axi_periph_ARVALID : STD_LOGIC;
  signal m07_couplers_to_ps8_0_axi_periph_AWADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal m07_couplers_to_ps8_0_axi_periph_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m07_couplers_to_ps8_0_axi_periph_AWREADY : STD_LOGIC;
  signal m07_couplers_to_ps8_0_axi_periph_AWVALID : STD_LOGIC;
  signal m07_couplers_to_ps8_0_axi_periph_BREADY : STD_LOGIC;
  signal m07_couplers_to_ps8_0_axi_periph_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m07_couplers_to_ps8_0_axi_periph_BVALID : STD_LOGIC;
  signal m07_couplers_to_ps8_0_axi_periph_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m07_couplers_to_ps8_0_axi_periph_RREADY : STD_LOGIC;
  signal m07_couplers_to_ps8_0_axi_periph_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m07_couplers_to_ps8_0_axi_periph_RVALID : STD_LOGIC;
  signal m07_couplers_to_ps8_0_axi_periph_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m07_couplers_to_ps8_0_axi_periph_WREADY : STD_LOGIC;
  signal m07_couplers_to_ps8_0_axi_periph_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m07_couplers_to_ps8_0_axi_periph_WVALID : STD_LOGIC;
  signal m08_couplers_to_ps8_0_axi_periph_ARADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal m08_couplers_to_ps8_0_axi_periph_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m08_couplers_to_ps8_0_axi_periph_ARREADY : STD_LOGIC;
  signal m08_couplers_to_ps8_0_axi_periph_ARVALID : STD_LOGIC;
  signal m08_couplers_to_ps8_0_axi_periph_AWADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal m08_couplers_to_ps8_0_axi_periph_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal m08_couplers_to_ps8_0_axi_periph_AWREADY : STD_LOGIC;
  signal m08_couplers_to_ps8_0_axi_periph_AWVALID : STD_LOGIC;
  signal m08_couplers_to_ps8_0_axi_periph_BREADY : STD_LOGIC;
  signal m08_couplers_to_ps8_0_axi_periph_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m08_couplers_to_ps8_0_axi_periph_BVALID : STD_LOGIC;
  signal m08_couplers_to_ps8_0_axi_periph_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m08_couplers_to_ps8_0_axi_periph_RREADY : STD_LOGIC;
  signal m08_couplers_to_ps8_0_axi_periph_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal m08_couplers_to_ps8_0_axi_periph_RVALID : STD_LOGIC;
  signal m08_couplers_to_ps8_0_axi_periph_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal m08_couplers_to_ps8_0_axi_periph_WREADY : STD_LOGIC;
  signal m08_couplers_to_ps8_0_axi_periph_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal m08_couplers_to_ps8_0_axi_periph_WVALID : STD_LOGIC;
  signal ps8_0_axi_periph_ACLK_net : STD_LOGIC;
  signal ps8_0_axi_periph_ARESETN_net : STD_LOGIC;
  signal ps8_0_axi_periph_to_s00_couplers_ARADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal ps8_0_axi_periph_to_s00_couplers_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ps8_0_axi_periph_to_s00_couplers_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal ps8_0_axi_periph_to_s00_couplers_ARID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal ps8_0_axi_periph_to_s00_couplers_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal ps8_0_axi_periph_to_s00_couplers_ARLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal ps8_0_axi_periph_to_s00_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal ps8_0_axi_periph_to_s00_couplers_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal ps8_0_axi_periph_to_s00_couplers_ARREADY : STD_LOGIC;
  signal ps8_0_axi_periph_to_s00_couplers_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal ps8_0_axi_periph_to_s00_couplers_ARVALID : STD_LOGIC;
  signal ps8_0_axi_periph_to_s00_couplers_AWADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal ps8_0_axi_periph_to_s00_couplers_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ps8_0_axi_periph_to_s00_couplers_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal ps8_0_axi_periph_to_s00_couplers_AWID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal ps8_0_axi_periph_to_s00_couplers_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal ps8_0_axi_periph_to_s00_couplers_AWLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal ps8_0_axi_periph_to_s00_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal ps8_0_axi_periph_to_s00_couplers_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal ps8_0_axi_periph_to_s00_couplers_AWREADY : STD_LOGIC;
  signal ps8_0_axi_periph_to_s00_couplers_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal ps8_0_axi_periph_to_s00_couplers_AWVALID : STD_LOGIC;
  signal ps8_0_axi_periph_to_s00_couplers_BID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal ps8_0_axi_periph_to_s00_couplers_BREADY : STD_LOGIC;
  signal ps8_0_axi_periph_to_s00_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ps8_0_axi_periph_to_s00_couplers_BVALID : STD_LOGIC;
  signal ps8_0_axi_periph_to_s00_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps8_0_axi_periph_to_s00_couplers_RID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal ps8_0_axi_periph_to_s00_couplers_RLAST : STD_LOGIC;
  signal ps8_0_axi_periph_to_s00_couplers_RREADY : STD_LOGIC;
  signal ps8_0_axi_periph_to_s00_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ps8_0_axi_periph_to_s00_couplers_RVALID : STD_LOGIC;
  signal ps8_0_axi_periph_to_s00_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps8_0_axi_periph_to_s00_couplers_WLAST : STD_LOGIC;
  signal ps8_0_axi_periph_to_s00_couplers_WREADY : STD_LOGIC;
  signal ps8_0_axi_periph_to_s00_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal ps8_0_axi_periph_to_s00_couplers_WVALID : STD_LOGIC;
  signal s00_couplers_to_xbar_ARADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal s00_couplers_to_xbar_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_xbar_ARREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_ARVALID : STD_LOGIC;
  signal s00_couplers_to_xbar_AWADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal s00_couplers_to_xbar_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_xbar_AWREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_AWVALID : STD_LOGIC;
  signal s00_couplers_to_xbar_BREADY : STD_LOGIC;
  signal s00_couplers_to_xbar_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_xbar_BVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_xbar_RREADY : STD_LOGIC;
  signal s00_couplers_to_xbar_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_xbar_RVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_xbar_WREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_xbar_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_xbar_WVALID : STD_LOGIC;
  signal xbar_to_m00_couplers_ARADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal xbar_to_m00_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal xbar_to_m00_couplers_ARREADY : STD_LOGIC;
  signal xbar_to_m00_couplers_ARVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_AWADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal xbar_to_m00_couplers_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal xbar_to_m00_couplers_AWREADY : STD_LOGIC;
  signal xbar_to_m00_couplers_AWVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_BREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m00_couplers_BVALID : STD_LOGIC;
  signal xbar_to_m00_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m00_couplers_RREADY : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m00_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m00_couplers_RVALID : STD_LOGIC;
  signal xbar_to_m00_couplers_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m00_couplers_WREADY : STD_LOGIC;
  signal xbar_to_m00_couplers_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal xbar_to_m00_couplers_WVALID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xbar_to_m01_couplers_ARADDR : STD_LOGIC_VECTOR ( 79 downto 40 );
  signal xbar_to_m01_couplers_ARPROT : STD_LOGIC_VECTOR ( 5 downto 3 );
  signal xbar_to_m01_couplers_ARREADY : STD_LOGIC;
  signal xbar_to_m01_couplers_ARVALID : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m01_couplers_AWADDR : STD_LOGIC_VECTOR ( 79 downto 40 );
  signal xbar_to_m01_couplers_AWPROT : STD_LOGIC_VECTOR ( 5 downto 3 );
  signal xbar_to_m01_couplers_AWREADY : STD_LOGIC;
  signal xbar_to_m01_couplers_AWVALID : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m01_couplers_BREADY : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m01_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m01_couplers_BVALID : STD_LOGIC;
  signal xbar_to_m01_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m01_couplers_RREADY : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m01_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m01_couplers_RVALID : STD_LOGIC;
  signal xbar_to_m01_couplers_WDATA : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal xbar_to_m01_couplers_WREADY : STD_LOGIC;
  signal xbar_to_m01_couplers_WSTRB : STD_LOGIC_VECTOR ( 7 downto 4 );
  signal xbar_to_m01_couplers_WVALID : STD_LOGIC_VECTOR ( 1 to 1 );
  signal xbar_to_m02_couplers_ARADDR : STD_LOGIC_VECTOR ( 119 downto 80 );
  signal xbar_to_m02_couplers_ARPROT : STD_LOGIC_VECTOR ( 8 downto 6 );
  signal xbar_to_m02_couplers_ARREADY : STD_LOGIC;
  signal xbar_to_m02_couplers_ARVALID : STD_LOGIC_VECTOR ( 2 to 2 );
  signal xbar_to_m02_couplers_AWADDR : STD_LOGIC_VECTOR ( 119 downto 80 );
  signal xbar_to_m02_couplers_AWPROT : STD_LOGIC_VECTOR ( 8 downto 6 );
  signal xbar_to_m02_couplers_AWREADY : STD_LOGIC;
  signal xbar_to_m02_couplers_AWVALID : STD_LOGIC_VECTOR ( 2 to 2 );
  signal xbar_to_m02_couplers_BREADY : STD_LOGIC_VECTOR ( 2 to 2 );
  signal xbar_to_m02_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m02_couplers_BVALID : STD_LOGIC;
  signal xbar_to_m02_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m02_couplers_RREADY : STD_LOGIC_VECTOR ( 2 to 2 );
  signal xbar_to_m02_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m02_couplers_RVALID : STD_LOGIC;
  signal xbar_to_m02_couplers_WDATA : STD_LOGIC_VECTOR ( 95 downto 64 );
  signal xbar_to_m02_couplers_WREADY : STD_LOGIC;
  signal xbar_to_m02_couplers_WSTRB : STD_LOGIC_VECTOR ( 11 downto 8 );
  signal xbar_to_m02_couplers_WVALID : STD_LOGIC_VECTOR ( 2 to 2 );
  signal xbar_to_m03_couplers_ARADDR : STD_LOGIC_VECTOR ( 159 downto 120 );
  signal xbar_to_m03_couplers_ARREADY : STD_LOGIC;
  signal xbar_to_m03_couplers_ARVALID : STD_LOGIC_VECTOR ( 3 to 3 );
  signal xbar_to_m03_couplers_AWADDR : STD_LOGIC_VECTOR ( 159 downto 120 );
  signal xbar_to_m03_couplers_AWREADY : STD_LOGIC;
  signal xbar_to_m03_couplers_AWVALID : STD_LOGIC_VECTOR ( 3 to 3 );
  signal xbar_to_m03_couplers_BREADY : STD_LOGIC_VECTOR ( 3 to 3 );
  signal xbar_to_m03_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m03_couplers_BVALID : STD_LOGIC;
  signal xbar_to_m03_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m03_couplers_RREADY : STD_LOGIC_VECTOR ( 3 to 3 );
  signal xbar_to_m03_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m03_couplers_RVALID : STD_LOGIC;
  signal xbar_to_m03_couplers_WDATA : STD_LOGIC_VECTOR ( 127 downto 96 );
  signal xbar_to_m03_couplers_WREADY : STD_LOGIC;
  signal xbar_to_m03_couplers_WVALID : STD_LOGIC_VECTOR ( 3 to 3 );
  signal xbar_to_m04_couplers_ARADDR : STD_LOGIC_VECTOR ( 199 downto 160 );
  signal xbar_to_m04_couplers_ARPROT : STD_LOGIC_VECTOR ( 14 downto 12 );
  signal xbar_to_m04_couplers_ARREADY : STD_LOGIC;
  signal xbar_to_m04_couplers_ARVALID : STD_LOGIC_VECTOR ( 4 to 4 );
  signal xbar_to_m04_couplers_AWADDR : STD_LOGIC_VECTOR ( 199 downto 160 );
  signal xbar_to_m04_couplers_AWPROT : STD_LOGIC_VECTOR ( 14 downto 12 );
  signal xbar_to_m04_couplers_AWREADY : STD_LOGIC;
  signal xbar_to_m04_couplers_AWVALID : STD_LOGIC_VECTOR ( 4 to 4 );
  signal xbar_to_m04_couplers_BREADY : STD_LOGIC_VECTOR ( 4 to 4 );
  signal xbar_to_m04_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m04_couplers_BVALID : STD_LOGIC;
  signal xbar_to_m04_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m04_couplers_RREADY : STD_LOGIC_VECTOR ( 4 to 4 );
  signal xbar_to_m04_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m04_couplers_RVALID : STD_LOGIC;
  signal xbar_to_m04_couplers_WDATA : STD_LOGIC_VECTOR ( 159 downto 128 );
  signal xbar_to_m04_couplers_WREADY : STD_LOGIC;
  signal xbar_to_m04_couplers_WSTRB : STD_LOGIC_VECTOR ( 19 downto 16 );
  signal xbar_to_m04_couplers_WVALID : STD_LOGIC_VECTOR ( 4 to 4 );
  signal xbar_to_m05_couplers_ARADDR : STD_LOGIC_VECTOR ( 239 downto 200 );
  signal xbar_to_m05_couplers_ARREADY : STD_LOGIC;
  signal xbar_to_m05_couplers_ARVALID : STD_LOGIC_VECTOR ( 5 to 5 );
  signal xbar_to_m05_couplers_AWADDR : STD_LOGIC_VECTOR ( 239 downto 200 );
  signal xbar_to_m05_couplers_AWREADY : STD_LOGIC;
  signal xbar_to_m05_couplers_AWVALID : STD_LOGIC_VECTOR ( 5 to 5 );
  signal xbar_to_m05_couplers_BREADY : STD_LOGIC_VECTOR ( 5 to 5 );
  signal xbar_to_m05_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m05_couplers_BVALID : STD_LOGIC;
  signal xbar_to_m05_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m05_couplers_RREADY : STD_LOGIC_VECTOR ( 5 to 5 );
  signal xbar_to_m05_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m05_couplers_RVALID : STD_LOGIC;
  signal xbar_to_m05_couplers_WDATA : STD_LOGIC_VECTOR ( 191 downto 160 );
  signal xbar_to_m05_couplers_WREADY : STD_LOGIC;
  signal xbar_to_m05_couplers_WVALID : STD_LOGIC_VECTOR ( 5 to 5 );
  signal xbar_to_m06_couplers_ARADDR : STD_LOGIC_VECTOR ( 279 downto 240 );
  signal xbar_to_m06_couplers_ARPROT : STD_LOGIC_VECTOR ( 20 downto 18 );
  signal xbar_to_m06_couplers_ARREADY : STD_LOGIC;
  signal xbar_to_m06_couplers_ARVALID : STD_LOGIC_VECTOR ( 6 to 6 );
  signal xbar_to_m06_couplers_AWADDR : STD_LOGIC_VECTOR ( 279 downto 240 );
  signal xbar_to_m06_couplers_AWPROT : STD_LOGIC_VECTOR ( 20 downto 18 );
  signal xbar_to_m06_couplers_AWREADY : STD_LOGIC;
  signal xbar_to_m06_couplers_AWVALID : STD_LOGIC_VECTOR ( 6 to 6 );
  signal xbar_to_m06_couplers_BREADY : STD_LOGIC_VECTOR ( 6 to 6 );
  signal xbar_to_m06_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m06_couplers_BVALID : STD_LOGIC;
  signal xbar_to_m06_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m06_couplers_RREADY : STD_LOGIC_VECTOR ( 6 to 6 );
  signal xbar_to_m06_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m06_couplers_RVALID : STD_LOGIC;
  signal xbar_to_m06_couplers_WDATA : STD_LOGIC_VECTOR ( 223 downto 192 );
  signal xbar_to_m06_couplers_WREADY : STD_LOGIC;
  signal xbar_to_m06_couplers_WSTRB : STD_LOGIC_VECTOR ( 27 downto 24 );
  signal xbar_to_m06_couplers_WVALID : STD_LOGIC_VECTOR ( 6 to 6 );
  signal xbar_to_m07_couplers_ARADDR : STD_LOGIC_VECTOR ( 319 downto 280 );
  signal xbar_to_m07_couplers_ARPROT : STD_LOGIC_VECTOR ( 23 downto 21 );
  signal xbar_to_m07_couplers_ARREADY : STD_LOGIC;
  signal xbar_to_m07_couplers_ARVALID : STD_LOGIC_VECTOR ( 7 to 7 );
  signal xbar_to_m07_couplers_AWADDR : STD_LOGIC_VECTOR ( 319 downto 280 );
  signal xbar_to_m07_couplers_AWPROT : STD_LOGIC_VECTOR ( 23 downto 21 );
  signal xbar_to_m07_couplers_AWREADY : STD_LOGIC;
  signal xbar_to_m07_couplers_AWVALID : STD_LOGIC_VECTOR ( 7 to 7 );
  signal xbar_to_m07_couplers_BREADY : STD_LOGIC_VECTOR ( 7 to 7 );
  signal xbar_to_m07_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m07_couplers_BVALID : STD_LOGIC;
  signal xbar_to_m07_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m07_couplers_RREADY : STD_LOGIC_VECTOR ( 7 to 7 );
  signal xbar_to_m07_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m07_couplers_RVALID : STD_LOGIC;
  signal xbar_to_m07_couplers_WDATA : STD_LOGIC_VECTOR ( 255 downto 224 );
  signal xbar_to_m07_couplers_WREADY : STD_LOGIC;
  signal xbar_to_m07_couplers_WSTRB : STD_LOGIC_VECTOR ( 31 downto 28 );
  signal xbar_to_m07_couplers_WVALID : STD_LOGIC_VECTOR ( 7 to 7 );
  signal xbar_to_m08_couplers_ARADDR : STD_LOGIC_VECTOR ( 359 downto 320 );
  signal xbar_to_m08_couplers_ARPROT : STD_LOGIC_VECTOR ( 26 downto 24 );
  signal xbar_to_m08_couplers_ARREADY : STD_LOGIC;
  signal xbar_to_m08_couplers_ARVALID : STD_LOGIC_VECTOR ( 8 to 8 );
  signal xbar_to_m08_couplers_AWADDR : STD_LOGIC_VECTOR ( 359 downto 320 );
  signal xbar_to_m08_couplers_AWPROT : STD_LOGIC_VECTOR ( 26 downto 24 );
  signal xbar_to_m08_couplers_AWREADY : STD_LOGIC;
  signal xbar_to_m08_couplers_AWVALID : STD_LOGIC_VECTOR ( 8 to 8 );
  signal xbar_to_m08_couplers_BREADY : STD_LOGIC_VECTOR ( 8 to 8 );
  signal xbar_to_m08_couplers_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m08_couplers_BVALID : STD_LOGIC;
  signal xbar_to_m08_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xbar_to_m08_couplers_RREADY : STD_LOGIC_VECTOR ( 8 to 8 );
  signal xbar_to_m08_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xbar_to_m08_couplers_RVALID : STD_LOGIC;
  signal xbar_to_m08_couplers_WDATA : STD_LOGIC_VECTOR ( 287 downto 256 );
  signal xbar_to_m08_couplers_WREADY : STD_LOGIC;
  signal xbar_to_m08_couplers_WSTRB : STD_LOGIC_VECTOR ( 35 downto 32 );
  signal xbar_to_m08_couplers_WVALID : STD_LOGIC_VECTOR ( 8 to 8 );
  signal NLW_xbar_m_axi_arprot_UNCONNECTED : STD_LOGIC_VECTOR ( 17 downto 9 );
  signal NLW_xbar_m_axi_awprot_UNCONNECTED : STD_LOGIC_VECTOR ( 17 downto 9 );
  signal NLW_xbar_m_axi_wstrb_UNCONNECTED : STD_LOGIC_VECTOR ( 23 downto 12 );
begin
  M00_AXI_araddr(39 downto 0) <= m00_couplers_to_ps8_0_axi_periph_ARADDR(39 downto 0);
  M00_AXI_arprot(2 downto 0) <= m00_couplers_to_ps8_0_axi_periph_ARPROT(2 downto 0);
  M00_AXI_arvalid <= m00_couplers_to_ps8_0_axi_periph_ARVALID;
  M00_AXI_awaddr(39 downto 0) <= m00_couplers_to_ps8_0_axi_periph_AWADDR(39 downto 0);
  M00_AXI_awprot(2 downto 0) <= m00_couplers_to_ps8_0_axi_periph_AWPROT(2 downto 0);
  M00_AXI_awvalid <= m00_couplers_to_ps8_0_axi_periph_AWVALID;
  M00_AXI_bready <= m00_couplers_to_ps8_0_axi_periph_BREADY;
  M00_AXI_rready <= m00_couplers_to_ps8_0_axi_periph_RREADY;
  M00_AXI_wdata(31 downto 0) <= m00_couplers_to_ps8_0_axi_periph_WDATA(31 downto 0);
  M00_AXI_wstrb(3 downto 0) <= m00_couplers_to_ps8_0_axi_periph_WSTRB(3 downto 0);
  M00_AXI_wvalid <= m00_couplers_to_ps8_0_axi_periph_WVALID;
  M01_AXI_araddr(39 downto 0) <= m01_couplers_to_ps8_0_axi_periph_ARADDR(39 downto 0);
  M01_AXI_arprot(2 downto 0) <= m01_couplers_to_ps8_0_axi_periph_ARPROT(2 downto 0);
  M01_AXI_arvalid <= m01_couplers_to_ps8_0_axi_periph_ARVALID;
  M01_AXI_awaddr(39 downto 0) <= m01_couplers_to_ps8_0_axi_periph_AWADDR(39 downto 0);
  M01_AXI_awprot(2 downto 0) <= m01_couplers_to_ps8_0_axi_periph_AWPROT(2 downto 0);
  M01_AXI_awvalid <= m01_couplers_to_ps8_0_axi_periph_AWVALID;
  M01_AXI_bready <= m01_couplers_to_ps8_0_axi_periph_BREADY;
  M01_AXI_rready <= m01_couplers_to_ps8_0_axi_periph_RREADY;
  M01_AXI_wdata(31 downto 0) <= m01_couplers_to_ps8_0_axi_periph_WDATA(31 downto 0);
  M01_AXI_wstrb(3 downto 0) <= m01_couplers_to_ps8_0_axi_periph_WSTRB(3 downto 0);
  M01_AXI_wvalid <= m01_couplers_to_ps8_0_axi_periph_WVALID;
  M02_AXI_araddr(39 downto 0) <= m02_couplers_to_ps8_0_axi_periph_ARADDR(39 downto 0);
  M02_AXI_arprot(2 downto 0) <= m02_couplers_to_ps8_0_axi_periph_ARPROT(2 downto 0);
  M02_AXI_arvalid <= m02_couplers_to_ps8_0_axi_periph_ARVALID;
  M02_AXI_awaddr(39 downto 0) <= m02_couplers_to_ps8_0_axi_periph_AWADDR(39 downto 0);
  M02_AXI_awprot(2 downto 0) <= m02_couplers_to_ps8_0_axi_periph_AWPROT(2 downto 0);
  M02_AXI_awvalid <= m02_couplers_to_ps8_0_axi_periph_AWVALID;
  M02_AXI_bready <= m02_couplers_to_ps8_0_axi_periph_BREADY;
  M02_AXI_rready <= m02_couplers_to_ps8_0_axi_periph_RREADY;
  M02_AXI_wdata(31 downto 0) <= m02_couplers_to_ps8_0_axi_periph_WDATA(31 downto 0);
  M02_AXI_wstrb(3 downto 0) <= m02_couplers_to_ps8_0_axi_periph_WSTRB(3 downto 0);
  M02_AXI_wvalid <= m02_couplers_to_ps8_0_axi_periph_WVALID;
  M03_AXI_araddr(39 downto 0) <= m03_couplers_to_ps8_0_axi_periph_ARADDR(39 downto 0);
  M03_AXI_arvalid <= m03_couplers_to_ps8_0_axi_periph_ARVALID;
  M03_AXI_awaddr(39 downto 0) <= m03_couplers_to_ps8_0_axi_periph_AWADDR(39 downto 0);
  M03_AXI_awvalid <= m03_couplers_to_ps8_0_axi_periph_AWVALID;
  M03_AXI_bready <= m03_couplers_to_ps8_0_axi_periph_BREADY;
  M03_AXI_rready <= m03_couplers_to_ps8_0_axi_periph_RREADY;
  M03_AXI_wdata(31 downto 0) <= m03_couplers_to_ps8_0_axi_periph_WDATA(31 downto 0);
  M03_AXI_wvalid <= m03_couplers_to_ps8_0_axi_periph_WVALID;
  M04_AXI_araddr(39 downto 0) <= m04_couplers_to_ps8_0_axi_periph_ARADDR(39 downto 0);
  M04_AXI_arprot(2 downto 0) <= m04_couplers_to_ps8_0_axi_periph_ARPROT(2 downto 0);
  M04_AXI_arvalid <= m04_couplers_to_ps8_0_axi_periph_ARVALID;
  M04_AXI_awaddr(39 downto 0) <= m04_couplers_to_ps8_0_axi_periph_AWADDR(39 downto 0);
  M04_AXI_awprot(2 downto 0) <= m04_couplers_to_ps8_0_axi_periph_AWPROT(2 downto 0);
  M04_AXI_awvalid <= m04_couplers_to_ps8_0_axi_periph_AWVALID;
  M04_AXI_bready <= m04_couplers_to_ps8_0_axi_periph_BREADY;
  M04_AXI_rready <= m04_couplers_to_ps8_0_axi_periph_RREADY;
  M04_AXI_wdata(31 downto 0) <= m04_couplers_to_ps8_0_axi_periph_WDATA(31 downto 0);
  M04_AXI_wstrb(3 downto 0) <= m04_couplers_to_ps8_0_axi_periph_WSTRB(3 downto 0);
  M04_AXI_wvalid <= m04_couplers_to_ps8_0_axi_periph_WVALID;
  M05_AXI_araddr(39 downto 0) <= m05_couplers_to_ps8_0_axi_periph_ARADDR(39 downto 0);
  M05_AXI_arvalid <= m05_couplers_to_ps8_0_axi_periph_ARVALID;
  M05_AXI_awaddr(39 downto 0) <= m05_couplers_to_ps8_0_axi_periph_AWADDR(39 downto 0);
  M05_AXI_awvalid <= m05_couplers_to_ps8_0_axi_periph_AWVALID;
  M05_AXI_bready <= m05_couplers_to_ps8_0_axi_periph_BREADY;
  M05_AXI_rready <= m05_couplers_to_ps8_0_axi_periph_RREADY;
  M05_AXI_wdata(31 downto 0) <= m05_couplers_to_ps8_0_axi_periph_WDATA(31 downto 0);
  M05_AXI_wvalid <= m05_couplers_to_ps8_0_axi_periph_WVALID;
  M06_AXI_araddr(39 downto 0) <= m06_couplers_to_ps8_0_axi_periph_ARADDR(39 downto 0);
  M06_AXI_arprot(2 downto 0) <= m06_couplers_to_ps8_0_axi_periph_ARPROT(2 downto 0);
  M06_AXI_arvalid <= m06_couplers_to_ps8_0_axi_periph_ARVALID;
  M06_AXI_awaddr(39 downto 0) <= m06_couplers_to_ps8_0_axi_periph_AWADDR(39 downto 0);
  M06_AXI_awprot(2 downto 0) <= m06_couplers_to_ps8_0_axi_periph_AWPROT(2 downto 0);
  M06_AXI_awvalid <= m06_couplers_to_ps8_0_axi_periph_AWVALID;
  M06_AXI_bready <= m06_couplers_to_ps8_0_axi_periph_BREADY;
  M06_AXI_rready <= m06_couplers_to_ps8_0_axi_periph_RREADY;
  M06_AXI_wdata(31 downto 0) <= m06_couplers_to_ps8_0_axi_periph_WDATA(31 downto 0);
  M06_AXI_wstrb(3 downto 0) <= m06_couplers_to_ps8_0_axi_periph_WSTRB(3 downto 0);
  M06_AXI_wvalid <= m06_couplers_to_ps8_0_axi_periph_WVALID;
  M07_AXI_araddr(39 downto 0) <= m07_couplers_to_ps8_0_axi_periph_ARADDR(39 downto 0);
  M07_AXI_arprot(2 downto 0) <= m07_couplers_to_ps8_0_axi_periph_ARPROT(2 downto 0);
  M07_AXI_arvalid <= m07_couplers_to_ps8_0_axi_periph_ARVALID;
  M07_AXI_awaddr(39 downto 0) <= m07_couplers_to_ps8_0_axi_periph_AWADDR(39 downto 0);
  M07_AXI_awprot(2 downto 0) <= m07_couplers_to_ps8_0_axi_periph_AWPROT(2 downto 0);
  M07_AXI_awvalid <= m07_couplers_to_ps8_0_axi_periph_AWVALID;
  M07_AXI_bready <= m07_couplers_to_ps8_0_axi_periph_BREADY;
  M07_AXI_rready <= m07_couplers_to_ps8_0_axi_periph_RREADY;
  M07_AXI_wdata(31 downto 0) <= m07_couplers_to_ps8_0_axi_periph_WDATA(31 downto 0);
  M07_AXI_wstrb(3 downto 0) <= m07_couplers_to_ps8_0_axi_periph_WSTRB(3 downto 0);
  M07_AXI_wvalid <= m07_couplers_to_ps8_0_axi_periph_WVALID;
  M08_AXI_araddr(39 downto 0) <= m08_couplers_to_ps8_0_axi_periph_ARADDR(39 downto 0);
  M08_AXI_arprot(2 downto 0) <= m08_couplers_to_ps8_0_axi_periph_ARPROT(2 downto 0);
  M08_AXI_arvalid <= m08_couplers_to_ps8_0_axi_periph_ARVALID;
  M08_AXI_awaddr(39 downto 0) <= m08_couplers_to_ps8_0_axi_periph_AWADDR(39 downto 0);
  M08_AXI_awprot(2 downto 0) <= m08_couplers_to_ps8_0_axi_periph_AWPROT(2 downto 0);
  M08_AXI_awvalid <= m08_couplers_to_ps8_0_axi_periph_AWVALID;
  M08_AXI_bready <= m08_couplers_to_ps8_0_axi_periph_BREADY;
  M08_AXI_rready <= m08_couplers_to_ps8_0_axi_periph_RREADY;
  M08_AXI_wdata(31 downto 0) <= m08_couplers_to_ps8_0_axi_periph_WDATA(31 downto 0);
  M08_AXI_wstrb(3 downto 0) <= m08_couplers_to_ps8_0_axi_periph_WSTRB(3 downto 0);
  M08_AXI_wvalid <= m08_couplers_to_ps8_0_axi_periph_WVALID;
  S00_AXI_arready <= ps8_0_axi_periph_to_s00_couplers_ARREADY;
  S00_AXI_awready <= ps8_0_axi_periph_to_s00_couplers_AWREADY;
  S00_AXI_bid(15 downto 0) <= ps8_0_axi_periph_to_s00_couplers_BID(15 downto 0);
  S00_AXI_bresp(1 downto 0) <= ps8_0_axi_periph_to_s00_couplers_BRESP(1 downto 0);
  S00_AXI_bvalid <= ps8_0_axi_periph_to_s00_couplers_BVALID;
  S00_AXI_rdata(31 downto 0) <= ps8_0_axi_periph_to_s00_couplers_RDATA(31 downto 0);
  S00_AXI_rid(15 downto 0) <= ps8_0_axi_periph_to_s00_couplers_RID(15 downto 0);
  S00_AXI_rlast <= ps8_0_axi_periph_to_s00_couplers_RLAST;
  S00_AXI_rresp(1 downto 0) <= ps8_0_axi_periph_to_s00_couplers_RRESP(1 downto 0);
  S00_AXI_rvalid <= ps8_0_axi_periph_to_s00_couplers_RVALID;
  S00_AXI_wready <= ps8_0_axi_periph_to_s00_couplers_WREADY;
  m00_couplers_to_ps8_0_axi_periph_ARREADY <= M00_AXI_arready;
  m00_couplers_to_ps8_0_axi_periph_AWREADY <= M00_AXI_awready;
  m00_couplers_to_ps8_0_axi_periph_BRESP(1 downto 0) <= M00_AXI_bresp(1 downto 0);
  m00_couplers_to_ps8_0_axi_periph_BVALID <= M00_AXI_bvalid;
  m00_couplers_to_ps8_0_axi_periph_RDATA(31 downto 0) <= M00_AXI_rdata(31 downto 0);
  m00_couplers_to_ps8_0_axi_periph_RRESP(1 downto 0) <= M00_AXI_rresp(1 downto 0);
  m00_couplers_to_ps8_0_axi_periph_RVALID <= M00_AXI_rvalid;
  m00_couplers_to_ps8_0_axi_periph_WREADY <= M00_AXI_wready;
  m01_couplers_to_ps8_0_axi_periph_ARREADY <= M01_AXI_arready;
  m01_couplers_to_ps8_0_axi_periph_AWREADY <= M01_AXI_awready;
  m01_couplers_to_ps8_0_axi_periph_BRESP(1 downto 0) <= M01_AXI_bresp(1 downto 0);
  m01_couplers_to_ps8_0_axi_periph_BVALID <= M01_AXI_bvalid;
  m01_couplers_to_ps8_0_axi_periph_RDATA(31 downto 0) <= M01_AXI_rdata(31 downto 0);
  m01_couplers_to_ps8_0_axi_periph_RRESP(1 downto 0) <= M01_AXI_rresp(1 downto 0);
  m01_couplers_to_ps8_0_axi_periph_RVALID <= M01_AXI_rvalid;
  m01_couplers_to_ps8_0_axi_periph_WREADY <= M01_AXI_wready;
  m02_couplers_to_ps8_0_axi_periph_ARREADY <= M02_AXI_arready;
  m02_couplers_to_ps8_0_axi_periph_AWREADY <= M02_AXI_awready;
  m02_couplers_to_ps8_0_axi_periph_BRESP(1 downto 0) <= M02_AXI_bresp(1 downto 0);
  m02_couplers_to_ps8_0_axi_periph_BVALID <= M02_AXI_bvalid;
  m02_couplers_to_ps8_0_axi_periph_RDATA(31 downto 0) <= M02_AXI_rdata(31 downto 0);
  m02_couplers_to_ps8_0_axi_periph_RRESP(1 downto 0) <= M02_AXI_rresp(1 downto 0);
  m02_couplers_to_ps8_0_axi_periph_RVALID <= M02_AXI_rvalid;
  m02_couplers_to_ps8_0_axi_periph_WREADY <= M02_AXI_wready;
  m03_couplers_to_ps8_0_axi_periph_ARREADY <= M03_AXI_arready;
  m03_couplers_to_ps8_0_axi_periph_AWREADY <= M03_AXI_awready;
  m03_couplers_to_ps8_0_axi_periph_BRESP(1 downto 0) <= M03_AXI_bresp(1 downto 0);
  m03_couplers_to_ps8_0_axi_periph_BVALID <= M03_AXI_bvalid;
  m03_couplers_to_ps8_0_axi_periph_RDATA(31 downto 0) <= M03_AXI_rdata(31 downto 0);
  m03_couplers_to_ps8_0_axi_periph_RRESP(1 downto 0) <= M03_AXI_rresp(1 downto 0);
  m03_couplers_to_ps8_0_axi_periph_RVALID <= M03_AXI_rvalid;
  m03_couplers_to_ps8_0_axi_periph_WREADY <= M03_AXI_wready;
  m04_couplers_to_ps8_0_axi_periph_ARREADY <= M04_AXI_arready;
  m04_couplers_to_ps8_0_axi_periph_AWREADY <= M04_AXI_awready;
  m04_couplers_to_ps8_0_axi_periph_BRESP(1 downto 0) <= M04_AXI_bresp(1 downto 0);
  m04_couplers_to_ps8_0_axi_periph_BVALID <= M04_AXI_bvalid;
  m04_couplers_to_ps8_0_axi_periph_RDATA(31 downto 0) <= M04_AXI_rdata(31 downto 0);
  m04_couplers_to_ps8_0_axi_periph_RRESP(1 downto 0) <= M04_AXI_rresp(1 downto 0);
  m04_couplers_to_ps8_0_axi_periph_RVALID <= M04_AXI_rvalid;
  m04_couplers_to_ps8_0_axi_periph_WREADY <= M04_AXI_wready;
  m05_couplers_to_ps8_0_axi_periph_ARREADY <= M05_AXI_arready;
  m05_couplers_to_ps8_0_axi_periph_AWREADY <= M05_AXI_awready;
  m05_couplers_to_ps8_0_axi_periph_BRESP(1 downto 0) <= M05_AXI_bresp(1 downto 0);
  m05_couplers_to_ps8_0_axi_periph_BVALID <= M05_AXI_bvalid;
  m05_couplers_to_ps8_0_axi_periph_RDATA(31 downto 0) <= M05_AXI_rdata(31 downto 0);
  m05_couplers_to_ps8_0_axi_periph_RRESP(1 downto 0) <= M05_AXI_rresp(1 downto 0);
  m05_couplers_to_ps8_0_axi_periph_RVALID <= M05_AXI_rvalid;
  m05_couplers_to_ps8_0_axi_periph_WREADY <= M05_AXI_wready;
  m06_couplers_to_ps8_0_axi_periph_ARREADY <= M06_AXI_arready;
  m06_couplers_to_ps8_0_axi_periph_AWREADY <= M06_AXI_awready;
  m06_couplers_to_ps8_0_axi_periph_BRESP(1 downto 0) <= M06_AXI_bresp(1 downto 0);
  m06_couplers_to_ps8_0_axi_periph_BVALID <= M06_AXI_bvalid;
  m06_couplers_to_ps8_0_axi_periph_RDATA(31 downto 0) <= M06_AXI_rdata(31 downto 0);
  m06_couplers_to_ps8_0_axi_periph_RRESP(1 downto 0) <= M06_AXI_rresp(1 downto 0);
  m06_couplers_to_ps8_0_axi_periph_RVALID <= M06_AXI_rvalid;
  m06_couplers_to_ps8_0_axi_periph_WREADY <= M06_AXI_wready;
  m07_couplers_to_ps8_0_axi_periph_ARREADY <= M07_AXI_arready;
  m07_couplers_to_ps8_0_axi_periph_AWREADY <= M07_AXI_awready;
  m07_couplers_to_ps8_0_axi_periph_BRESP(1 downto 0) <= M07_AXI_bresp(1 downto 0);
  m07_couplers_to_ps8_0_axi_periph_BVALID <= M07_AXI_bvalid;
  m07_couplers_to_ps8_0_axi_periph_RDATA(31 downto 0) <= M07_AXI_rdata(31 downto 0);
  m07_couplers_to_ps8_0_axi_periph_RRESP(1 downto 0) <= M07_AXI_rresp(1 downto 0);
  m07_couplers_to_ps8_0_axi_periph_RVALID <= M07_AXI_rvalid;
  m07_couplers_to_ps8_0_axi_periph_WREADY <= M07_AXI_wready;
  m08_couplers_to_ps8_0_axi_periph_ARREADY <= M08_AXI_arready;
  m08_couplers_to_ps8_0_axi_periph_AWREADY <= M08_AXI_awready;
  m08_couplers_to_ps8_0_axi_periph_BRESP(1 downto 0) <= M08_AXI_bresp(1 downto 0);
  m08_couplers_to_ps8_0_axi_periph_BVALID <= M08_AXI_bvalid;
  m08_couplers_to_ps8_0_axi_periph_RDATA(31 downto 0) <= M08_AXI_rdata(31 downto 0);
  m08_couplers_to_ps8_0_axi_periph_RRESP(1 downto 0) <= M08_AXI_rresp(1 downto 0);
  m08_couplers_to_ps8_0_axi_periph_RVALID <= M08_AXI_rvalid;
  m08_couplers_to_ps8_0_axi_periph_WREADY <= M08_AXI_wready;
  ps8_0_axi_periph_ACLK_net <= ACLK;
  ps8_0_axi_periph_ARESETN_net <= ARESETN;
  ps8_0_axi_periph_to_s00_couplers_ARADDR(39 downto 0) <= S00_AXI_araddr(39 downto 0);
  ps8_0_axi_periph_to_s00_couplers_ARBURST(1 downto 0) <= S00_AXI_arburst(1 downto 0);
  ps8_0_axi_periph_to_s00_couplers_ARCACHE(3 downto 0) <= S00_AXI_arcache(3 downto 0);
  ps8_0_axi_periph_to_s00_couplers_ARID(15 downto 0) <= S00_AXI_arid(15 downto 0);
  ps8_0_axi_periph_to_s00_couplers_ARLEN(7 downto 0) <= S00_AXI_arlen(7 downto 0);
  ps8_0_axi_periph_to_s00_couplers_ARLOCK(0) <= S00_AXI_arlock(0);
  ps8_0_axi_periph_to_s00_couplers_ARPROT(2 downto 0) <= S00_AXI_arprot(2 downto 0);
  ps8_0_axi_periph_to_s00_couplers_ARQOS(3 downto 0) <= S00_AXI_arqos(3 downto 0);
  ps8_0_axi_periph_to_s00_couplers_ARSIZE(2 downto 0) <= S00_AXI_arsize(2 downto 0);
  ps8_0_axi_periph_to_s00_couplers_ARVALID <= S00_AXI_arvalid;
  ps8_0_axi_periph_to_s00_couplers_AWADDR(39 downto 0) <= S00_AXI_awaddr(39 downto 0);
  ps8_0_axi_periph_to_s00_couplers_AWBURST(1 downto 0) <= S00_AXI_awburst(1 downto 0);
  ps8_0_axi_periph_to_s00_couplers_AWCACHE(3 downto 0) <= S00_AXI_awcache(3 downto 0);
  ps8_0_axi_periph_to_s00_couplers_AWID(15 downto 0) <= S00_AXI_awid(15 downto 0);
  ps8_0_axi_periph_to_s00_couplers_AWLEN(7 downto 0) <= S00_AXI_awlen(7 downto 0);
  ps8_0_axi_periph_to_s00_couplers_AWLOCK(0) <= S00_AXI_awlock(0);
  ps8_0_axi_periph_to_s00_couplers_AWPROT(2 downto 0) <= S00_AXI_awprot(2 downto 0);
  ps8_0_axi_periph_to_s00_couplers_AWQOS(3 downto 0) <= S00_AXI_awqos(3 downto 0);
  ps8_0_axi_periph_to_s00_couplers_AWSIZE(2 downto 0) <= S00_AXI_awsize(2 downto 0);
  ps8_0_axi_periph_to_s00_couplers_AWVALID <= S00_AXI_awvalid;
  ps8_0_axi_periph_to_s00_couplers_BREADY <= S00_AXI_bready;
  ps8_0_axi_periph_to_s00_couplers_RREADY <= S00_AXI_rready;
  ps8_0_axi_periph_to_s00_couplers_WDATA(31 downto 0) <= S00_AXI_wdata(31 downto 0);
  ps8_0_axi_periph_to_s00_couplers_WLAST <= S00_AXI_wlast;
  ps8_0_axi_periph_to_s00_couplers_WSTRB(3 downto 0) <= S00_AXI_wstrb(3 downto 0);
  ps8_0_axi_periph_to_s00_couplers_WVALID <= S00_AXI_wvalid;
m00_couplers: entity work.m00_couplers_imp_4PMNBW
     port map (
      M_ACLK => ps8_0_axi_periph_ACLK_net,
      M_ARESETN => ps8_0_axi_periph_ARESETN_net,
      M_AXI_araddr(39 downto 0) => m00_couplers_to_ps8_0_axi_periph_ARADDR(39 downto 0),
      M_AXI_arprot(2 downto 0) => m00_couplers_to_ps8_0_axi_periph_ARPROT(2 downto 0),
      M_AXI_arready => m00_couplers_to_ps8_0_axi_periph_ARREADY,
      M_AXI_arvalid => m00_couplers_to_ps8_0_axi_periph_ARVALID,
      M_AXI_awaddr(39 downto 0) => m00_couplers_to_ps8_0_axi_periph_AWADDR(39 downto 0),
      M_AXI_awprot(2 downto 0) => m00_couplers_to_ps8_0_axi_periph_AWPROT(2 downto 0),
      M_AXI_awready => m00_couplers_to_ps8_0_axi_periph_AWREADY,
      M_AXI_awvalid => m00_couplers_to_ps8_0_axi_periph_AWVALID,
      M_AXI_bready => m00_couplers_to_ps8_0_axi_periph_BREADY,
      M_AXI_bresp(1 downto 0) => m00_couplers_to_ps8_0_axi_periph_BRESP(1 downto 0),
      M_AXI_bvalid => m00_couplers_to_ps8_0_axi_periph_BVALID,
      M_AXI_rdata(31 downto 0) => m00_couplers_to_ps8_0_axi_periph_RDATA(31 downto 0),
      M_AXI_rready => m00_couplers_to_ps8_0_axi_periph_RREADY,
      M_AXI_rresp(1 downto 0) => m00_couplers_to_ps8_0_axi_periph_RRESP(1 downto 0),
      M_AXI_rvalid => m00_couplers_to_ps8_0_axi_periph_RVALID,
      M_AXI_wdata(31 downto 0) => m00_couplers_to_ps8_0_axi_periph_WDATA(31 downto 0),
      M_AXI_wready => m00_couplers_to_ps8_0_axi_periph_WREADY,
      M_AXI_wstrb(3 downto 0) => m00_couplers_to_ps8_0_axi_periph_WSTRB(3 downto 0),
      M_AXI_wvalid => m00_couplers_to_ps8_0_axi_periph_WVALID,
      S_ACLK => ps8_0_axi_periph_ACLK_net,
      S_ARESETN => ps8_0_axi_periph_ARESETN_net,
      S_AXI_araddr(39 downto 0) => xbar_to_m00_couplers_ARADDR(39 downto 0),
      S_AXI_arprot(2 downto 0) => xbar_to_m00_couplers_ARPROT(2 downto 0),
      S_AXI_arready => xbar_to_m00_couplers_ARREADY,
      S_AXI_arvalid => xbar_to_m00_couplers_ARVALID(0),
      S_AXI_awaddr(39 downto 0) => xbar_to_m00_couplers_AWADDR(39 downto 0),
      S_AXI_awprot(2 downto 0) => xbar_to_m00_couplers_AWPROT(2 downto 0),
      S_AXI_awready => xbar_to_m00_couplers_AWREADY,
      S_AXI_awvalid => xbar_to_m00_couplers_AWVALID(0),
      S_AXI_bready => xbar_to_m00_couplers_BREADY(0),
      S_AXI_bresp(1 downto 0) => xbar_to_m00_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => xbar_to_m00_couplers_BVALID,
      S_AXI_rdata(31 downto 0) => xbar_to_m00_couplers_RDATA(31 downto 0),
      S_AXI_rready => xbar_to_m00_couplers_RREADY(0),
      S_AXI_rresp(1 downto 0) => xbar_to_m00_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => xbar_to_m00_couplers_RVALID,
      S_AXI_wdata(31 downto 0) => xbar_to_m00_couplers_WDATA(31 downto 0),
      S_AXI_wready => xbar_to_m00_couplers_WREADY,
      S_AXI_wstrb(3 downto 0) => xbar_to_m00_couplers_WSTRB(3 downto 0),
      S_AXI_wvalid => xbar_to_m00_couplers_WVALID(0)
    );
m01_couplers: entity work.m01_couplers_imp_WMS2XM
     port map (
      M_ACLK => ps8_0_axi_periph_ACLK_net,
      M_ARESETN => ps8_0_axi_periph_ARESETN_net,
      M_AXI_araddr(39 downto 0) => m01_couplers_to_ps8_0_axi_periph_ARADDR(39 downto 0),
      M_AXI_arprot(2 downto 0) => m01_couplers_to_ps8_0_axi_periph_ARPROT(2 downto 0),
      M_AXI_arready => m01_couplers_to_ps8_0_axi_periph_ARREADY,
      M_AXI_arvalid => m01_couplers_to_ps8_0_axi_periph_ARVALID,
      M_AXI_awaddr(39 downto 0) => m01_couplers_to_ps8_0_axi_periph_AWADDR(39 downto 0),
      M_AXI_awprot(2 downto 0) => m01_couplers_to_ps8_0_axi_periph_AWPROT(2 downto 0),
      M_AXI_awready => m01_couplers_to_ps8_0_axi_periph_AWREADY,
      M_AXI_awvalid => m01_couplers_to_ps8_0_axi_periph_AWVALID,
      M_AXI_bready => m01_couplers_to_ps8_0_axi_periph_BREADY,
      M_AXI_bresp(1 downto 0) => m01_couplers_to_ps8_0_axi_periph_BRESP(1 downto 0),
      M_AXI_bvalid => m01_couplers_to_ps8_0_axi_periph_BVALID,
      M_AXI_rdata(31 downto 0) => m01_couplers_to_ps8_0_axi_periph_RDATA(31 downto 0),
      M_AXI_rready => m01_couplers_to_ps8_0_axi_periph_RREADY,
      M_AXI_rresp(1 downto 0) => m01_couplers_to_ps8_0_axi_periph_RRESP(1 downto 0),
      M_AXI_rvalid => m01_couplers_to_ps8_0_axi_periph_RVALID,
      M_AXI_wdata(31 downto 0) => m01_couplers_to_ps8_0_axi_periph_WDATA(31 downto 0),
      M_AXI_wready => m01_couplers_to_ps8_0_axi_periph_WREADY,
      M_AXI_wstrb(3 downto 0) => m01_couplers_to_ps8_0_axi_periph_WSTRB(3 downto 0),
      M_AXI_wvalid => m01_couplers_to_ps8_0_axi_periph_WVALID,
      S_ACLK => ps8_0_axi_periph_ACLK_net,
      S_ARESETN => ps8_0_axi_periph_ARESETN_net,
      S_AXI_araddr(39 downto 0) => xbar_to_m01_couplers_ARADDR(79 downto 40),
      S_AXI_arprot(2 downto 0) => xbar_to_m01_couplers_ARPROT(5 downto 3),
      S_AXI_arready => xbar_to_m01_couplers_ARREADY,
      S_AXI_arvalid => xbar_to_m01_couplers_ARVALID(1),
      S_AXI_awaddr(39 downto 0) => xbar_to_m01_couplers_AWADDR(79 downto 40),
      S_AXI_awprot(2 downto 0) => xbar_to_m01_couplers_AWPROT(5 downto 3),
      S_AXI_awready => xbar_to_m01_couplers_AWREADY,
      S_AXI_awvalid => xbar_to_m01_couplers_AWVALID(1),
      S_AXI_bready => xbar_to_m01_couplers_BREADY(1),
      S_AXI_bresp(1 downto 0) => xbar_to_m01_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => xbar_to_m01_couplers_BVALID,
      S_AXI_rdata(31 downto 0) => xbar_to_m01_couplers_RDATA(31 downto 0),
      S_AXI_rready => xbar_to_m01_couplers_RREADY(1),
      S_AXI_rresp(1 downto 0) => xbar_to_m01_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => xbar_to_m01_couplers_RVALID,
      S_AXI_wdata(31 downto 0) => xbar_to_m01_couplers_WDATA(63 downto 32),
      S_AXI_wready => xbar_to_m01_couplers_WREADY,
      S_AXI_wstrb(3 downto 0) => xbar_to_m01_couplers_WSTRB(7 downto 4),
      S_AXI_wvalid => xbar_to_m01_couplers_WVALID(1)
    );
m02_couplers: entity work.m02_couplers_imp_1OJM3GW
     port map (
      M_ACLK => ps8_0_axi_periph_ACLK_net,
      M_ARESETN => ps8_0_axi_periph_ARESETN_net,
      M_AXI_araddr(39 downto 0) => m02_couplers_to_ps8_0_axi_periph_ARADDR(39 downto 0),
      M_AXI_arprot(2 downto 0) => m02_couplers_to_ps8_0_axi_periph_ARPROT(2 downto 0),
      M_AXI_arready => m02_couplers_to_ps8_0_axi_periph_ARREADY,
      M_AXI_arvalid => m02_couplers_to_ps8_0_axi_periph_ARVALID,
      M_AXI_awaddr(39 downto 0) => m02_couplers_to_ps8_0_axi_periph_AWADDR(39 downto 0),
      M_AXI_awprot(2 downto 0) => m02_couplers_to_ps8_0_axi_periph_AWPROT(2 downto 0),
      M_AXI_awready => m02_couplers_to_ps8_0_axi_periph_AWREADY,
      M_AXI_awvalid => m02_couplers_to_ps8_0_axi_periph_AWVALID,
      M_AXI_bready => m02_couplers_to_ps8_0_axi_periph_BREADY,
      M_AXI_bresp(1 downto 0) => m02_couplers_to_ps8_0_axi_periph_BRESP(1 downto 0),
      M_AXI_bvalid => m02_couplers_to_ps8_0_axi_periph_BVALID,
      M_AXI_rdata(31 downto 0) => m02_couplers_to_ps8_0_axi_periph_RDATA(31 downto 0),
      M_AXI_rready => m02_couplers_to_ps8_0_axi_periph_RREADY,
      M_AXI_rresp(1 downto 0) => m02_couplers_to_ps8_0_axi_periph_RRESP(1 downto 0),
      M_AXI_rvalid => m02_couplers_to_ps8_0_axi_periph_RVALID,
      M_AXI_wdata(31 downto 0) => m02_couplers_to_ps8_0_axi_periph_WDATA(31 downto 0),
      M_AXI_wready => m02_couplers_to_ps8_0_axi_periph_WREADY,
      M_AXI_wstrb(3 downto 0) => m02_couplers_to_ps8_0_axi_periph_WSTRB(3 downto 0),
      M_AXI_wvalid => m02_couplers_to_ps8_0_axi_periph_WVALID,
      S_ACLK => ps8_0_axi_periph_ACLK_net,
      S_ARESETN => ps8_0_axi_periph_ARESETN_net,
      S_AXI_araddr(39 downto 0) => xbar_to_m02_couplers_ARADDR(119 downto 80),
      S_AXI_arprot(2 downto 0) => xbar_to_m02_couplers_ARPROT(8 downto 6),
      S_AXI_arready => xbar_to_m02_couplers_ARREADY,
      S_AXI_arvalid => xbar_to_m02_couplers_ARVALID(2),
      S_AXI_awaddr(39 downto 0) => xbar_to_m02_couplers_AWADDR(119 downto 80),
      S_AXI_awprot(2 downto 0) => xbar_to_m02_couplers_AWPROT(8 downto 6),
      S_AXI_awready => xbar_to_m02_couplers_AWREADY,
      S_AXI_awvalid => xbar_to_m02_couplers_AWVALID(2),
      S_AXI_bready => xbar_to_m02_couplers_BREADY(2),
      S_AXI_bresp(1 downto 0) => xbar_to_m02_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => xbar_to_m02_couplers_BVALID,
      S_AXI_rdata(31 downto 0) => xbar_to_m02_couplers_RDATA(31 downto 0),
      S_AXI_rready => xbar_to_m02_couplers_RREADY(2),
      S_AXI_rresp(1 downto 0) => xbar_to_m02_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => xbar_to_m02_couplers_RVALID,
      S_AXI_wdata(31 downto 0) => xbar_to_m02_couplers_WDATA(95 downto 64),
      S_AXI_wready => xbar_to_m02_couplers_WREADY,
      S_AXI_wstrb(3 downto 0) => xbar_to_m02_couplers_WSTRB(11 downto 8),
      S_AXI_wvalid => xbar_to_m02_couplers_WVALID(2)
    );
m03_couplers: entity work.m03_couplers_imp_1H31U1I
     port map (
      M_ACLK => ps8_0_axi_periph_ACLK_net,
      M_ARESETN => ps8_0_axi_periph_ARESETN_net,
      M_AXI_araddr(39 downto 0) => m03_couplers_to_ps8_0_axi_periph_ARADDR(39 downto 0),
      M_AXI_arready => m03_couplers_to_ps8_0_axi_periph_ARREADY,
      M_AXI_arvalid => m03_couplers_to_ps8_0_axi_periph_ARVALID,
      M_AXI_awaddr(39 downto 0) => m03_couplers_to_ps8_0_axi_periph_AWADDR(39 downto 0),
      M_AXI_awready => m03_couplers_to_ps8_0_axi_periph_AWREADY,
      M_AXI_awvalid => m03_couplers_to_ps8_0_axi_periph_AWVALID,
      M_AXI_bready => m03_couplers_to_ps8_0_axi_periph_BREADY,
      M_AXI_bresp(1 downto 0) => m03_couplers_to_ps8_0_axi_periph_BRESP(1 downto 0),
      M_AXI_bvalid => m03_couplers_to_ps8_0_axi_periph_BVALID,
      M_AXI_rdata(31 downto 0) => m03_couplers_to_ps8_0_axi_periph_RDATA(31 downto 0),
      M_AXI_rready => m03_couplers_to_ps8_0_axi_periph_RREADY,
      M_AXI_rresp(1 downto 0) => m03_couplers_to_ps8_0_axi_periph_RRESP(1 downto 0),
      M_AXI_rvalid => m03_couplers_to_ps8_0_axi_periph_RVALID,
      M_AXI_wdata(31 downto 0) => m03_couplers_to_ps8_0_axi_periph_WDATA(31 downto 0),
      M_AXI_wready => m03_couplers_to_ps8_0_axi_periph_WREADY,
      M_AXI_wvalid => m03_couplers_to_ps8_0_axi_periph_WVALID,
      S_ACLK => ps8_0_axi_periph_ACLK_net,
      S_ARESETN => ps8_0_axi_periph_ARESETN_net,
      S_AXI_araddr(39 downto 0) => xbar_to_m03_couplers_ARADDR(159 downto 120),
      S_AXI_arready => xbar_to_m03_couplers_ARREADY,
      S_AXI_arvalid => xbar_to_m03_couplers_ARVALID(3),
      S_AXI_awaddr(39 downto 0) => xbar_to_m03_couplers_AWADDR(159 downto 120),
      S_AXI_awready => xbar_to_m03_couplers_AWREADY,
      S_AXI_awvalid => xbar_to_m03_couplers_AWVALID(3),
      S_AXI_bready => xbar_to_m03_couplers_BREADY(3),
      S_AXI_bresp(1 downto 0) => xbar_to_m03_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => xbar_to_m03_couplers_BVALID,
      S_AXI_rdata(31 downto 0) => xbar_to_m03_couplers_RDATA(31 downto 0),
      S_AXI_rready => xbar_to_m03_couplers_RREADY(3),
      S_AXI_rresp(1 downto 0) => xbar_to_m03_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => xbar_to_m03_couplers_RVALID,
      S_AXI_wdata(31 downto 0) => xbar_to_m03_couplers_WDATA(127 downto 96),
      S_AXI_wready => xbar_to_m03_couplers_WREADY,
      S_AXI_wvalid => xbar_to_m03_couplers_WVALID(3)
    );
m04_couplers: entity work.m04_couplers_imp_Q3TGHX
     port map (
      M_ACLK => ps8_0_axi_periph_ACLK_net,
      M_ARESETN => ps8_0_axi_periph_ARESETN_net,
      M_AXI_araddr(39 downto 0) => m04_couplers_to_ps8_0_axi_periph_ARADDR(39 downto 0),
      M_AXI_arprot(2 downto 0) => m04_couplers_to_ps8_0_axi_periph_ARPROT(2 downto 0),
      M_AXI_arready => m04_couplers_to_ps8_0_axi_periph_ARREADY,
      M_AXI_arvalid => m04_couplers_to_ps8_0_axi_periph_ARVALID,
      M_AXI_awaddr(39 downto 0) => m04_couplers_to_ps8_0_axi_periph_AWADDR(39 downto 0),
      M_AXI_awprot(2 downto 0) => m04_couplers_to_ps8_0_axi_periph_AWPROT(2 downto 0),
      M_AXI_awready => m04_couplers_to_ps8_0_axi_periph_AWREADY,
      M_AXI_awvalid => m04_couplers_to_ps8_0_axi_periph_AWVALID,
      M_AXI_bready => m04_couplers_to_ps8_0_axi_periph_BREADY,
      M_AXI_bresp(1 downto 0) => m04_couplers_to_ps8_0_axi_periph_BRESP(1 downto 0),
      M_AXI_bvalid => m04_couplers_to_ps8_0_axi_periph_BVALID,
      M_AXI_rdata(31 downto 0) => m04_couplers_to_ps8_0_axi_periph_RDATA(31 downto 0),
      M_AXI_rready => m04_couplers_to_ps8_0_axi_periph_RREADY,
      M_AXI_rresp(1 downto 0) => m04_couplers_to_ps8_0_axi_periph_RRESP(1 downto 0),
      M_AXI_rvalid => m04_couplers_to_ps8_0_axi_periph_RVALID,
      M_AXI_wdata(31 downto 0) => m04_couplers_to_ps8_0_axi_periph_WDATA(31 downto 0),
      M_AXI_wready => m04_couplers_to_ps8_0_axi_periph_WREADY,
      M_AXI_wstrb(3 downto 0) => m04_couplers_to_ps8_0_axi_periph_WSTRB(3 downto 0),
      M_AXI_wvalid => m04_couplers_to_ps8_0_axi_periph_WVALID,
      S_ACLK => ps8_0_axi_periph_ACLK_net,
      S_ARESETN => ps8_0_axi_periph_ARESETN_net,
      S_AXI_araddr(39 downto 0) => xbar_to_m04_couplers_ARADDR(199 downto 160),
      S_AXI_arprot(2 downto 0) => xbar_to_m04_couplers_ARPROT(14 downto 12),
      S_AXI_arready => xbar_to_m04_couplers_ARREADY,
      S_AXI_arvalid => xbar_to_m04_couplers_ARVALID(4),
      S_AXI_awaddr(39 downto 0) => xbar_to_m04_couplers_AWADDR(199 downto 160),
      S_AXI_awprot(2 downto 0) => xbar_to_m04_couplers_AWPROT(14 downto 12),
      S_AXI_awready => xbar_to_m04_couplers_AWREADY,
      S_AXI_awvalid => xbar_to_m04_couplers_AWVALID(4),
      S_AXI_bready => xbar_to_m04_couplers_BREADY(4),
      S_AXI_bresp(1 downto 0) => xbar_to_m04_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => xbar_to_m04_couplers_BVALID,
      S_AXI_rdata(31 downto 0) => xbar_to_m04_couplers_RDATA(31 downto 0),
      S_AXI_rready => xbar_to_m04_couplers_RREADY(4),
      S_AXI_rresp(1 downto 0) => xbar_to_m04_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => xbar_to_m04_couplers_RVALID,
      S_AXI_wdata(31 downto 0) => xbar_to_m04_couplers_WDATA(159 downto 128),
      S_AXI_wready => xbar_to_m04_couplers_WREADY,
      S_AXI_wstrb(3 downto 0) => xbar_to_m04_couplers_WSTRB(19 downto 16),
      S_AXI_wvalid => xbar_to_m04_couplers_WVALID(4)
    );
m05_couplers: entity work.m05_couplers_imp_GHRS77
     port map (
      M_ACLK => ps8_0_axi_periph_ACLK_net,
      M_ARESETN => ps8_0_axi_periph_ARESETN_net,
      M_AXI_araddr(39 downto 0) => m05_couplers_to_ps8_0_axi_periph_ARADDR(39 downto 0),
      M_AXI_arready => m05_couplers_to_ps8_0_axi_periph_ARREADY,
      M_AXI_arvalid => m05_couplers_to_ps8_0_axi_periph_ARVALID,
      M_AXI_awaddr(39 downto 0) => m05_couplers_to_ps8_0_axi_periph_AWADDR(39 downto 0),
      M_AXI_awready => m05_couplers_to_ps8_0_axi_periph_AWREADY,
      M_AXI_awvalid => m05_couplers_to_ps8_0_axi_periph_AWVALID,
      M_AXI_bready => m05_couplers_to_ps8_0_axi_periph_BREADY,
      M_AXI_bresp(1 downto 0) => m05_couplers_to_ps8_0_axi_periph_BRESP(1 downto 0),
      M_AXI_bvalid => m05_couplers_to_ps8_0_axi_periph_BVALID,
      M_AXI_rdata(31 downto 0) => m05_couplers_to_ps8_0_axi_periph_RDATA(31 downto 0),
      M_AXI_rready => m05_couplers_to_ps8_0_axi_periph_RREADY,
      M_AXI_rresp(1 downto 0) => m05_couplers_to_ps8_0_axi_periph_RRESP(1 downto 0),
      M_AXI_rvalid => m05_couplers_to_ps8_0_axi_periph_RVALID,
      M_AXI_wdata(31 downto 0) => m05_couplers_to_ps8_0_axi_periph_WDATA(31 downto 0),
      M_AXI_wready => m05_couplers_to_ps8_0_axi_periph_WREADY,
      M_AXI_wvalid => m05_couplers_to_ps8_0_axi_periph_WVALID,
      S_ACLK => ps8_0_axi_periph_ACLK_net,
      S_ARESETN => ps8_0_axi_periph_ARESETN_net,
      S_AXI_araddr(39 downto 0) => xbar_to_m05_couplers_ARADDR(239 downto 200),
      S_AXI_arready => xbar_to_m05_couplers_ARREADY,
      S_AXI_arvalid => xbar_to_m05_couplers_ARVALID(5),
      S_AXI_awaddr(39 downto 0) => xbar_to_m05_couplers_AWADDR(239 downto 200),
      S_AXI_awready => xbar_to_m05_couplers_AWREADY,
      S_AXI_awvalid => xbar_to_m05_couplers_AWVALID(5),
      S_AXI_bready => xbar_to_m05_couplers_BREADY(5),
      S_AXI_bresp(1 downto 0) => xbar_to_m05_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => xbar_to_m05_couplers_BVALID,
      S_AXI_rdata(31 downto 0) => xbar_to_m05_couplers_RDATA(31 downto 0),
      S_AXI_rready => xbar_to_m05_couplers_RREADY(5),
      S_AXI_rresp(1 downto 0) => xbar_to_m05_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => xbar_to_m05_couplers_RVALID,
      S_AXI_wdata(31 downto 0) => xbar_to_m05_couplers_WDATA(191 downto 160),
      S_AXI_wready => xbar_to_m05_couplers_WREADY,
      S_AXI_wvalid => xbar_to_m05_couplers_WVALID(5)
    );
m06_couplers: entity work.m06_couplers_imp_15ASNRD
     port map (
      M_ACLK => ps8_0_axi_periph_ACLK_net,
      M_ARESETN => ps8_0_axi_periph_ARESETN_net,
      M_AXI_araddr(39 downto 0) => m06_couplers_to_ps8_0_axi_periph_ARADDR(39 downto 0),
      M_AXI_arprot(2 downto 0) => m06_couplers_to_ps8_0_axi_periph_ARPROT(2 downto 0),
      M_AXI_arready => m06_couplers_to_ps8_0_axi_periph_ARREADY,
      M_AXI_arvalid => m06_couplers_to_ps8_0_axi_periph_ARVALID,
      M_AXI_awaddr(39 downto 0) => m06_couplers_to_ps8_0_axi_periph_AWADDR(39 downto 0),
      M_AXI_awprot(2 downto 0) => m06_couplers_to_ps8_0_axi_periph_AWPROT(2 downto 0),
      M_AXI_awready => m06_couplers_to_ps8_0_axi_periph_AWREADY,
      M_AXI_awvalid => m06_couplers_to_ps8_0_axi_periph_AWVALID,
      M_AXI_bready => m06_couplers_to_ps8_0_axi_periph_BREADY,
      M_AXI_bresp(1 downto 0) => m06_couplers_to_ps8_0_axi_periph_BRESP(1 downto 0),
      M_AXI_bvalid => m06_couplers_to_ps8_0_axi_periph_BVALID,
      M_AXI_rdata(31 downto 0) => m06_couplers_to_ps8_0_axi_periph_RDATA(31 downto 0),
      M_AXI_rready => m06_couplers_to_ps8_0_axi_periph_RREADY,
      M_AXI_rresp(1 downto 0) => m06_couplers_to_ps8_0_axi_periph_RRESP(1 downto 0),
      M_AXI_rvalid => m06_couplers_to_ps8_0_axi_periph_RVALID,
      M_AXI_wdata(31 downto 0) => m06_couplers_to_ps8_0_axi_periph_WDATA(31 downto 0),
      M_AXI_wready => m06_couplers_to_ps8_0_axi_periph_WREADY,
      M_AXI_wstrb(3 downto 0) => m06_couplers_to_ps8_0_axi_periph_WSTRB(3 downto 0),
      M_AXI_wvalid => m06_couplers_to_ps8_0_axi_periph_WVALID,
      S_ACLK => ps8_0_axi_periph_ACLK_net,
      S_ARESETN => ps8_0_axi_periph_ARESETN_net,
      S_AXI_araddr(39 downto 0) => xbar_to_m06_couplers_ARADDR(279 downto 240),
      S_AXI_arprot(2 downto 0) => xbar_to_m06_couplers_ARPROT(20 downto 18),
      S_AXI_arready => xbar_to_m06_couplers_ARREADY,
      S_AXI_arvalid => xbar_to_m06_couplers_ARVALID(6),
      S_AXI_awaddr(39 downto 0) => xbar_to_m06_couplers_AWADDR(279 downto 240),
      S_AXI_awprot(2 downto 0) => xbar_to_m06_couplers_AWPROT(20 downto 18),
      S_AXI_awready => xbar_to_m06_couplers_AWREADY,
      S_AXI_awvalid => xbar_to_m06_couplers_AWVALID(6),
      S_AXI_bready => xbar_to_m06_couplers_BREADY(6),
      S_AXI_bresp(1 downto 0) => xbar_to_m06_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => xbar_to_m06_couplers_BVALID,
      S_AXI_rdata(31 downto 0) => xbar_to_m06_couplers_RDATA(31 downto 0),
      S_AXI_rready => xbar_to_m06_couplers_RREADY(6),
      S_AXI_rresp(1 downto 0) => xbar_to_m06_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => xbar_to_m06_couplers_RVALID,
      S_AXI_wdata(31 downto 0) => xbar_to_m06_couplers_WDATA(223 downto 192),
      S_AXI_wready => xbar_to_m06_couplers_WREADY,
      S_AXI_wstrb(3 downto 0) => xbar_to_m06_couplers_WSTRB(27 downto 24),
      S_AXI_wvalid => xbar_to_m06_couplers_WVALID(6)
    );
m07_couplers: entity work.m07_couplers_imp_1V2RKEN
     port map (
      M_ACLK => ps8_0_axi_periph_ACLK_net,
      M_ARESETN => ps8_0_axi_periph_ARESETN_net,
      M_AXI_araddr(39 downto 0) => m07_couplers_to_ps8_0_axi_periph_ARADDR(39 downto 0),
      M_AXI_arprot(2 downto 0) => m07_couplers_to_ps8_0_axi_periph_ARPROT(2 downto 0),
      M_AXI_arready => m07_couplers_to_ps8_0_axi_periph_ARREADY,
      M_AXI_arvalid => m07_couplers_to_ps8_0_axi_periph_ARVALID,
      M_AXI_awaddr(39 downto 0) => m07_couplers_to_ps8_0_axi_periph_AWADDR(39 downto 0),
      M_AXI_awprot(2 downto 0) => m07_couplers_to_ps8_0_axi_periph_AWPROT(2 downto 0),
      M_AXI_awready => m07_couplers_to_ps8_0_axi_periph_AWREADY,
      M_AXI_awvalid => m07_couplers_to_ps8_0_axi_periph_AWVALID,
      M_AXI_bready => m07_couplers_to_ps8_0_axi_periph_BREADY,
      M_AXI_bresp(1 downto 0) => m07_couplers_to_ps8_0_axi_periph_BRESP(1 downto 0),
      M_AXI_bvalid => m07_couplers_to_ps8_0_axi_periph_BVALID,
      M_AXI_rdata(31 downto 0) => m07_couplers_to_ps8_0_axi_periph_RDATA(31 downto 0),
      M_AXI_rready => m07_couplers_to_ps8_0_axi_periph_RREADY,
      M_AXI_rresp(1 downto 0) => m07_couplers_to_ps8_0_axi_periph_RRESP(1 downto 0),
      M_AXI_rvalid => m07_couplers_to_ps8_0_axi_periph_RVALID,
      M_AXI_wdata(31 downto 0) => m07_couplers_to_ps8_0_axi_periph_WDATA(31 downto 0),
      M_AXI_wready => m07_couplers_to_ps8_0_axi_periph_WREADY,
      M_AXI_wstrb(3 downto 0) => m07_couplers_to_ps8_0_axi_periph_WSTRB(3 downto 0),
      M_AXI_wvalid => m07_couplers_to_ps8_0_axi_periph_WVALID,
      S_ACLK => ps8_0_axi_periph_ACLK_net,
      S_ARESETN => ps8_0_axi_periph_ARESETN_net,
      S_AXI_araddr(39 downto 0) => xbar_to_m07_couplers_ARADDR(319 downto 280),
      S_AXI_arprot(2 downto 0) => xbar_to_m07_couplers_ARPROT(23 downto 21),
      S_AXI_arready => xbar_to_m07_couplers_ARREADY,
      S_AXI_arvalid => xbar_to_m07_couplers_ARVALID(7),
      S_AXI_awaddr(39 downto 0) => xbar_to_m07_couplers_AWADDR(319 downto 280),
      S_AXI_awprot(2 downto 0) => xbar_to_m07_couplers_AWPROT(23 downto 21),
      S_AXI_awready => xbar_to_m07_couplers_AWREADY,
      S_AXI_awvalid => xbar_to_m07_couplers_AWVALID(7),
      S_AXI_bready => xbar_to_m07_couplers_BREADY(7),
      S_AXI_bresp(1 downto 0) => xbar_to_m07_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => xbar_to_m07_couplers_BVALID,
      S_AXI_rdata(31 downto 0) => xbar_to_m07_couplers_RDATA(31 downto 0),
      S_AXI_rready => xbar_to_m07_couplers_RREADY(7),
      S_AXI_rresp(1 downto 0) => xbar_to_m07_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => xbar_to_m07_couplers_RVALID,
      S_AXI_wdata(31 downto 0) => xbar_to_m07_couplers_WDATA(255 downto 224),
      S_AXI_wready => xbar_to_m07_couplers_WREADY,
      S_AXI_wstrb(3 downto 0) => xbar_to_m07_couplers_WSTRB(31 downto 28),
      S_AXI_wvalid => xbar_to_m07_couplers_WVALID(7)
    );
m08_couplers: entity work.m08_couplers_imp_135OQPA
     port map (
      M_ACLK => ps8_0_axi_periph_ACLK_net,
      M_ARESETN => ps8_0_axi_periph_ARESETN_net,
      M_AXI_araddr(39 downto 0) => m08_couplers_to_ps8_0_axi_periph_ARADDR(39 downto 0),
      M_AXI_arprot(2 downto 0) => m08_couplers_to_ps8_0_axi_periph_ARPROT(2 downto 0),
      M_AXI_arready => m08_couplers_to_ps8_0_axi_periph_ARREADY,
      M_AXI_arvalid => m08_couplers_to_ps8_0_axi_periph_ARVALID,
      M_AXI_awaddr(39 downto 0) => m08_couplers_to_ps8_0_axi_periph_AWADDR(39 downto 0),
      M_AXI_awprot(2 downto 0) => m08_couplers_to_ps8_0_axi_periph_AWPROT(2 downto 0),
      M_AXI_awready => m08_couplers_to_ps8_0_axi_periph_AWREADY,
      M_AXI_awvalid => m08_couplers_to_ps8_0_axi_periph_AWVALID,
      M_AXI_bready => m08_couplers_to_ps8_0_axi_periph_BREADY,
      M_AXI_bresp(1 downto 0) => m08_couplers_to_ps8_0_axi_periph_BRESP(1 downto 0),
      M_AXI_bvalid => m08_couplers_to_ps8_0_axi_periph_BVALID,
      M_AXI_rdata(31 downto 0) => m08_couplers_to_ps8_0_axi_periph_RDATA(31 downto 0),
      M_AXI_rready => m08_couplers_to_ps8_0_axi_periph_RREADY,
      M_AXI_rresp(1 downto 0) => m08_couplers_to_ps8_0_axi_periph_RRESP(1 downto 0),
      M_AXI_rvalid => m08_couplers_to_ps8_0_axi_periph_RVALID,
      M_AXI_wdata(31 downto 0) => m08_couplers_to_ps8_0_axi_periph_WDATA(31 downto 0),
      M_AXI_wready => m08_couplers_to_ps8_0_axi_periph_WREADY,
      M_AXI_wstrb(3 downto 0) => m08_couplers_to_ps8_0_axi_periph_WSTRB(3 downto 0),
      M_AXI_wvalid => m08_couplers_to_ps8_0_axi_periph_WVALID,
      S_ACLK => ps8_0_axi_periph_ACLK_net,
      S_ARESETN => ps8_0_axi_periph_ARESETN_net,
      S_AXI_araddr(39 downto 0) => xbar_to_m08_couplers_ARADDR(359 downto 320),
      S_AXI_arprot(2 downto 0) => xbar_to_m08_couplers_ARPROT(26 downto 24),
      S_AXI_arready => xbar_to_m08_couplers_ARREADY,
      S_AXI_arvalid => xbar_to_m08_couplers_ARVALID(8),
      S_AXI_awaddr(39 downto 0) => xbar_to_m08_couplers_AWADDR(359 downto 320),
      S_AXI_awprot(2 downto 0) => xbar_to_m08_couplers_AWPROT(26 downto 24),
      S_AXI_awready => xbar_to_m08_couplers_AWREADY,
      S_AXI_awvalid => xbar_to_m08_couplers_AWVALID(8),
      S_AXI_bready => xbar_to_m08_couplers_BREADY(8),
      S_AXI_bresp(1 downto 0) => xbar_to_m08_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => xbar_to_m08_couplers_BVALID,
      S_AXI_rdata(31 downto 0) => xbar_to_m08_couplers_RDATA(31 downto 0),
      S_AXI_rready => xbar_to_m08_couplers_RREADY(8),
      S_AXI_rresp(1 downto 0) => xbar_to_m08_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => xbar_to_m08_couplers_RVALID,
      S_AXI_wdata(31 downto 0) => xbar_to_m08_couplers_WDATA(287 downto 256),
      S_AXI_wready => xbar_to_m08_couplers_WREADY,
      S_AXI_wstrb(3 downto 0) => xbar_to_m08_couplers_WSTRB(35 downto 32),
      S_AXI_wvalid => xbar_to_m08_couplers_WVALID(8)
    );
s00_couplers: entity work.s00_couplers_imp_VU5465
     port map (
      M_ACLK => ps8_0_axi_periph_ACLK_net,
      M_ARESETN => ps8_0_axi_periph_ARESETN_net,
      M_AXI_araddr(39 downto 0) => s00_couplers_to_xbar_ARADDR(39 downto 0),
      M_AXI_arprot(2 downto 0) => s00_couplers_to_xbar_ARPROT(2 downto 0),
      M_AXI_arready => s00_couplers_to_xbar_ARREADY(0),
      M_AXI_arvalid => s00_couplers_to_xbar_ARVALID,
      M_AXI_awaddr(39 downto 0) => s00_couplers_to_xbar_AWADDR(39 downto 0),
      M_AXI_awprot(2 downto 0) => s00_couplers_to_xbar_AWPROT(2 downto 0),
      M_AXI_awready => s00_couplers_to_xbar_AWREADY(0),
      M_AXI_awvalid => s00_couplers_to_xbar_AWVALID,
      M_AXI_bready => s00_couplers_to_xbar_BREADY,
      M_AXI_bresp(1 downto 0) => s00_couplers_to_xbar_BRESP(1 downto 0),
      M_AXI_bvalid => s00_couplers_to_xbar_BVALID(0),
      M_AXI_rdata(31 downto 0) => s00_couplers_to_xbar_RDATA(31 downto 0),
      M_AXI_rready => s00_couplers_to_xbar_RREADY,
      M_AXI_rresp(1 downto 0) => s00_couplers_to_xbar_RRESP(1 downto 0),
      M_AXI_rvalid => s00_couplers_to_xbar_RVALID(0),
      M_AXI_wdata(31 downto 0) => s00_couplers_to_xbar_WDATA(31 downto 0),
      M_AXI_wready => s00_couplers_to_xbar_WREADY(0),
      M_AXI_wstrb(3 downto 0) => s00_couplers_to_xbar_WSTRB(3 downto 0),
      M_AXI_wvalid => s00_couplers_to_xbar_WVALID,
      S_ACLK => ps8_0_axi_periph_ACLK_net,
      S_ARESETN => ps8_0_axi_periph_ARESETN_net,
      S_AXI_araddr(39 downto 0) => ps8_0_axi_periph_to_s00_couplers_ARADDR(39 downto 0),
      S_AXI_arburst(1 downto 0) => ps8_0_axi_periph_to_s00_couplers_ARBURST(1 downto 0),
      S_AXI_arcache(3 downto 0) => ps8_0_axi_periph_to_s00_couplers_ARCACHE(3 downto 0),
      S_AXI_arid(15 downto 0) => ps8_0_axi_periph_to_s00_couplers_ARID(15 downto 0),
      S_AXI_arlen(7 downto 0) => ps8_0_axi_periph_to_s00_couplers_ARLEN(7 downto 0),
      S_AXI_arlock(0) => ps8_0_axi_periph_to_s00_couplers_ARLOCK(0),
      S_AXI_arprot(2 downto 0) => ps8_0_axi_periph_to_s00_couplers_ARPROT(2 downto 0),
      S_AXI_arqos(3 downto 0) => ps8_0_axi_periph_to_s00_couplers_ARQOS(3 downto 0),
      S_AXI_arready => ps8_0_axi_periph_to_s00_couplers_ARREADY,
      S_AXI_arsize(2 downto 0) => ps8_0_axi_periph_to_s00_couplers_ARSIZE(2 downto 0),
      S_AXI_arvalid => ps8_0_axi_periph_to_s00_couplers_ARVALID,
      S_AXI_awaddr(39 downto 0) => ps8_0_axi_periph_to_s00_couplers_AWADDR(39 downto 0),
      S_AXI_awburst(1 downto 0) => ps8_0_axi_periph_to_s00_couplers_AWBURST(1 downto 0),
      S_AXI_awcache(3 downto 0) => ps8_0_axi_periph_to_s00_couplers_AWCACHE(3 downto 0),
      S_AXI_awid(15 downto 0) => ps8_0_axi_periph_to_s00_couplers_AWID(15 downto 0),
      S_AXI_awlen(7 downto 0) => ps8_0_axi_periph_to_s00_couplers_AWLEN(7 downto 0),
      S_AXI_awlock(0) => ps8_0_axi_periph_to_s00_couplers_AWLOCK(0),
      S_AXI_awprot(2 downto 0) => ps8_0_axi_periph_to_s00_couplers_AWPROT(2 downto 0),
      S_AXI_awqos(3 downto 0) => ps8_0_axi_periph_to_s00_couplers_AWQOS(3 downto 0),
      S_AXI_awready => ps8_0_axi_periph_to_s00_couplers_AWREADY,
      S_AXI_awsize(2 downto 0) => ps8_0_axi_periph_to_s00_couplers_AWSIZE(2 downto 0),
      S_AXI_awvalid => ps8_0_axi_periph_to_s00_couplers_AWVALID,
      S_AXI_bid(15 downto 0) => ps8_0_axi_periph_to_s00_couplers_BID(15 downto 0),
      S_AXI_bready => ps8_0_axi_periph_to_s00_couplers_BREADY,
      S_AXI_bresp(1 downto 0) => ps8_0_axi_periph_to_s00_couplers_BRESP(1 downto 0),
      S_AXI_bvalid => ps8_0_axi_periph_to_s00_couplers_BVALID,
      S_AXI_rdata(31 downto 0) => ps8_0_axi_periph_to_s00_couplers_RDATA(31 downto 0),
      S_AXI_rid(15 downto 0) => ps8_0_axi_periph_to_s00_couplers_RID(15 downto 0),
      S_AXI_rlast => ps8_0_axi_periph_to_s00_couplers_RLAST,
      S_AXI_rready => ps8_0_axi_periph_to_s00_couplers_RREADY,
      S_AXI_rresp(1 downto 0) => ps8_0_axi_periph_to_s00_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => ps8_0_axi_periph_to_s00_couplers_RVALID,
      S_AXI_wdata(31 downto 0) => ps8_0_axi_periph_to_s00_couplers_WDATA(31 downto 0),
      S_AXI_wlast => ps8_0_axi_periph_to_s00_couplers_WLAST,
      S_AXI_wready => ps8_0_axi_periph_to_s00_couplers_WREADY,
      S_AXI_wstrb(3 downto 0) => ps8_0_axi_periph_to_s00_couplers_WSTRB(3 downto 0),
      S_AXI_wvalid => ps8_0_axi_periph_to_s00_couplers_WVALID
    );
xbar: component edt_zcu106_xbar_0
     port map (
      aclk => ps8_0_axi_periph_ACLK_net,
      aresetn => ps8_0_axi_periph_ARESETN_net,
      m_axi_araddr(359 downto 320) => xbar_to_m08_couplers_ARADDR(359 downto 320),
      m_axi_araddr(319 downto 280) => xbar_to_m07_couplers_ARADDR(319 downto 280),
      m_axi_araddr(279 downto 240) => xbar_to_m06_couplers_ARADDR(279 downto 240),
      m_axi_araddr(239 downto 200) => xbar_to_m05_couplers_ARADDR(239 downto 200),
      m_axi_araddr(199 downto 160) => xbar_to_m04_couplers_ARADDR(199 downto 160),
      m_axi_araddr(159 downto 120) => xbar_to_m03_couplers_ARADDR(159 downto 120),
      m_axi_araddr(119 downto 80) => xbar_to_m02_couplers_ARADDR(119 downto 80),
      m_axi_araddr(79 downto 40) => xbar_to_m01_couplers_ARADDR(79 downto 40),
      m_axi_araddr(39 downto 0) => xbar_to_m00_couplers_ARADDR(39 downto 0),
      m_axi_arprot(26 downto 24) => xbar_to_m08_couplers_ARPROT(26 downto 24),
      m_axi_arprot(23 downto 21) => xbar_to_m07_couplers_ARPROT(23 downto 21),
      m_axi_arprot(20 downto 18) => xbar_to_m06_couplers_ARPROT(20 downto 18),
      m_axi_arprot(17 downto 15) => NLW_xbar_m_axi_arprot_UNCONNECTED(17 downto 15),
      m_axi_arprot(14 downto 12) => xbar_to_m04_couplers_ARPROT(14 downto 12),
      m_axi_arprot(11 downto 9) => NLW_xbar_m_axi_arprot_UNCONNECTED(11 downto 9),
      m_axi_arprot(8 downto 6) => xbar_to_m02_couplers_ARPROT(8 downto 6),
      m_axi_arprot(5 downto 3) => xbar_to_m01_couplers_ARPROT(5 downto 3),
      m_axi_arprot(2 downto 0) => xbar_to_m00_couplers_ARPROT(2 downto 0),
      m_axi_arready(8) => xbar_to_m08_couplers_ARREADY,
      m_axi_arready(7) => xbar_to_m07_couplers_ARREADY,
      m_axi_arready(6) => xbar_to_m06_couplers_ARREADY,
      m_axi_arready(5) => xbar_to_m05_couplers_ARREADY,
      m_axi_arready(4) => xbar_to_m04_couplers_ARREADY,
      m_axi_arready(3) => xbar_to_m03_couplers_ARREADY,
      m_axi_arready(2) => xbar_to_m02_couplers_ARREADY,
      m_axi_arready(1) => xbar_to_m01_couplers_ARREADY,
      m_axi_arready(0) => xbar_to_m00_couplers_ARREADY,
      m_axi_arvalid(8) => xbar_to_m08_couplers_ARVALID(8),
      m_axi_arvalid(7) => xbar_to_m07_couplers_ARVALID(7),
      m_axi_arvalid(6) => xbar_to_m06_couplers_ARVALID(6),
      m_axi_arvalid(5) => xbar_to_m05_couplers_ARVALID(5),
      m_axi_arvalid(4) => xbar_to_m04_couplers_ARVALID(4),
      m_axi_arvalid(3) => xbar_to_m03_couplers_ARVALID(3),
      m_axi_arvalid(2) => xbar_to_m02_couplers_ARVALID(2),
      m_axi_arvalid(1) => xbar_to_m01_couplers_ARVALID(1),
      m_axi_arvalid(0) => xbar_to_m00_couplers_ARVALID(0),
      m_axi_awaddr(359 downto 320) => xbar_to_m08_couplers_AWADDR(359 downto 320),
      m_axi_awaddr(319 downto 280) => xbar_to_m07_couplers_AWADDR(319 downto 280),
      m_axi_awaddr(279 downto 240) => xbar_to_m06_couplers_AWADDR(279 downto 240),
      m_axi_awaddr(239 downto 200) => xbar_to_m05_couplers_AWADDR(239 downto 200),
      m_axi_awaddr(199 downto 160) => xbar_to_m04_couplers_AWADDR(199 downto 160),
      m_axi_awaddr(159 downto 120) => xbar_to_m03_couplers_AWADDR(159 downto 120),
      m_axi_awaddr(119 downto 80) => xbar_to_m02_couplers_AWADDR(119 downto 80),
      m_axi_awaddr(79 downto 40) => xbar_to_m01_couplers_AWADDR(79 downto 40),
      m_axi_awaddr(39 downto 0) => xbar_to_m00_couplers_AWADDR(39 downto 0),
      m_axi_awprot(26 downto 24) => xbar_to_m08_couplers_AWPROT(26 downto 24),
      m_axi_awprot(23 downto 21) => xbar_to_m07_couplers_AWPROT(23 downto 21),
      m_axi_awprot(20 downto 18) => xbar_to_m06_couplers_AWPROT(20 downto 18),
      m_axi_awprot(17 downto 15) => NLW_xbar_m_axi_awprot_UNCONNECTED(17 downto 15),
      m_axi_awprot(14 downto 12) => xbar_to_m04_couplers_AWPROT(14 downto 12),
      m_axi_awprot(11 downto 9) => NLW_xbar_m_axi_awprot_UNCONNECTED(11 downto 9),
      m_axi_awprot(8 downto 6) => xbar_to_m02_couplers_AWPROT(8 downto 6),
      m_axi_awprot(5 downto 3) => xbar_to_m01_couplers_AWPROT(5 downto 3),
      m_axi_awprot(2 downto 0) => xbar_to_m00_couplers_AWPROT(2 downto 0),
      m_axi_awready(8) => xbar_to_m08_couplers_AWREADY,
      m_axi_awready(7) => xbar_to_m07_couplers_AWREADY,
      m_axi_awready(6) => xbar_to_m06_couplers_AWREADY,
      m_axi_awready(5) => xbar_to_m05_couplers_AWREADY,
      m_axi_awready(4) => xbar_to_m04_couplers_AWREADY,
      m_axi_awready(3) => xbar_to_m03_couplers_AWREADY,
      m_axi_awready(2) => xbar_to_m02_couplers_AWREADY,
      m_axi_awready(1) => xbar_to_m01_couplers_AWREADY,
      m_axi_awready(0) => xbar_to_m00_couplers_AWREADY,
      m_axi_awvalid(8) => xbar_to_m08_couplers_AWVALID(8),
      m_axi_awvalid(7) => xbar_to_m07_couplers_AWVALID(7),
      m_axi_awvalid(6) => xbar_to_m06_couplers_AWVALID(6),
      m_axi_awvalid(5) => xbar_to_m05_couplers_AWVALID(5),
      m_axi_awvalid(4) => xbar_to_m04_couplers_AWVALID(4),
      m_axi_awvalid(3) => xbar_to_m03_couplers_AWVALID(3),
      m_axi_awvalid(2) => xbar_to_m02_couplers_AWVALID(2),
      m_axi_awvalid(1) => xbar_to_m01_couplers_AWVALID(1),
      m_axi_awvalid(0) => xbar_to_m00_couplers_AWVALID(0),
      m_axi_bready(8) => xbar_to_m08_couplers_BREADY(8),
      m_axi_bready(7) => xbar_to_m07_couplers_BREADY(7),
      m_axi_bready(6) => xbar_to_m06_couplers_BREADY(6),
      m_axi_bready(5) => xbar_to_m05_couplers_BREADY(5),
      m_axi_bready(4) => xbar_to_m04_couplers_BREADY(4),
      m_axi_bready(3) => xbar_to_m03_couplers_BREADY(3),
      m_axi_bready(2) => xbar_to_m02_couplers_BREADY(2),
      m_axi_bready(1) => xbar_to_m01_couplers_BREADY(1),
      m_axi_bready(0) => xbar_to_m00_couplers_BREADY(0),
      m_axi_bresp(17 downto 16) => xbar_to_m08_couplers_BRESP(1 downto 0),
      m_axi_bresp(15 downto 14) => xbar_to_m07_couplers_BRESP(1 downto 0),
      m_axi_bresp(13 downto 12) => xbar_to_m06_couplers_BRESP(1 downto 0),
      m_axi_bresp(11 downto 10) => xbar_to_m05_couplers_BRESP(1 downto 0),
      m_axi_bresp(9 downto 8) => xbar_to_m04_couplers_BRESP(1 downto 0),
      m_axi_bresp(7 downto 6) => xbar_to_m03_couplers_BRESP(1 downto 0),
      m_axi_bresp(5 downto 4) => xbar_to_m02_couplers_BRESP(1 downto 0),
      m_axi_bresp(3 downto 2) => xbar_to_m01_couplers_BRESP(1 downto 0),
      m_axi_bresp(1 downto 0) => xbar_to_m00_couplers_BRESP(1 downto 0),
      m_axi_bvalid(8) => xbar_to_m08_couplers_BVALID,
      m_axi_bvalid(7) => xbar_to_m07_couplers_BVALID,
      m_axi_bvalid(6) => xbar_to_m06_couplers_BVALID,
      m_axi_bvalid(5) => xbar_to_m05_couplers_BVALID,
      m_axi_bvalid(4) => xbar_to_m04_couplers_BVALID,
      m_axi_bvalid(3) => xbar_to_m03_couplers_BVALID,
      m_axi_bvalid(2) => xbar_to_m02_couplers_BVALID,
      m_axi_bvalid(1) => xbar_to_m01_couplers_BVALID,
      m_axi_bvalid(0) => xbar_to_m00_couplers_BVALID,
      m_axi_rdata(287 downto 256) => xbar_to_m08_couplers_RDATA(31 downto 0),
      m_axi_rdata(255 downto 224) => xbar_to_m07_couplers_RDATA(31 downto 0),
      m_axi_rdata(223 downto 192) => xbar_to_m06_couplers_RDATA(31 downto 0),
      m_axi_rdata(191 downto 160) => xbar_to_m05_couplers_RDATA(31 downto 0),
      m_axi_rdata(159 downto 128) => xbar_to_m04_couplers_RDATA(31 downto 0),
      m_axi_rdata(127 downto 96) => xbar_to_m03_couplers_RDATA(31 downto 0),
      m_axi_rdata(95 downto 64) => xbar_to_m02_couplers_RDATA(31 downto 0),
      m_axi_rdata(63 downto 32) => xbar_to_m01_couplers_RDATA(31 downto 0),
      m_axi_rdata(31 downto 0) => xbar_to_m00_couplers_RDATA(31 downto 0),
      m_axi_rready(8) => xbar_to_m08_couplers_RREADY(8),
      m_axi_rready(7) => xbar_to_m07_couplers_RREADY(7),
      m_axi_rready(6) => xbar_to_m06_couplers_RREADY(6),
      m_axi_rready(5) => xbar_to_m05_couplers_RREADY(5),
      m_axi_rready(4) => xbar_to_m04_couplers_RREADY(4),
      m_axi_rready(3) => xbar_to_m03_couplers_RREADY(3),
      m_axi_rready(2) => xbar_to_m02_couplers_RREADY(2),
      m_axi_rready(1) => xbar_to_m01_couplers_RREADY(1),
      m_axi_rready(0) => xbar_to_m00_couplers_RREADY(0),
      m_axi_rresp(17 downto 16) => xbar_to_m08_couplers_RRESP(1 downto 0),
      m_axi_rresp(15 downto 14) => xbar_to_m07_couplers_RRESP(1 downto 0),
      m_axi_rresp(13 downto 12) => xbar_to_m06_couplers_RRESP(1 downto 0),
      m_axi_rresp(11 downto 10) => xbar_to_m05_couplers_RRESP(1 downto 0),
      m_axi_rresp(9 downto 8) => xbar_to_m04_couplers_RRESP(1 downto 0),
      m_axi_rresp(7 downto 6) => xbar_to_m03_couplers_RRESP(1 downto 0),
      m_axi_rresp(5 downto 4) => xbar_to_m02_couplers_RRESP(1 downto 0),
      m_axi_rresp(3 downto 2) => xbar_to_m01_couplers_RRESP(1 downto 0),
      m_axi_rresp(1 downto 0) => xbar_to_m00_couplers_RRESP(1 downto 0),
      m_axi_rvalid(8) => xbar_to_m08_couplers_RVALID,
      m_axi_rvalid(7) => xbar_to_m07_couplers_RVALID,
      m_axi_rvalid(6) => xbar_to_m06_couplers_RVALID,
      m_axi_rvalid(5) => xbar_to_m05_couplers_RVALID,
      m_axi_rvalid(4) => xbar_to_m04_couplers_RVALID,
      m_axi_rvalid(3) => xbar_to_m03_couplers_RVALID,
      m_axi_rvalid(2) => xbar_to_m02_couplers_RVALID,
      m_axi_rvalid(1) => xbar_to_m01_couplers_RVALID,
      m_axi_rvalid(0) => xbar_to_m00_couplers_RVALID,
      m_axi_wdata(287 downto 256) => xbar_to_m08_couplers_WDATA(287 downto 256),
      m_axi_wdata(255 downto 224) => xbar_to_m07_couplers_WDATA(255 downto 224),
      m_axi_wdata(223 downto 192) => xbar_to_m06_couplers_WDATA(223 downto 192),
      m_axi_wdata(191 downto 160) => xbar_to_m05_couplers_WDATA(191 downto 160),
      m_axi_wdata(159 downto 128) => xbar_to_m04_couplers_WDATA(159 downto 128),
      m_axi_wdata(127 downto 96) => xbar_to_m03_couplers_WDATA(127 downto 96),
      m_axi_wdata(95 downto 64) => xbar_to_m02_couplers_WDATA(95 downto 64),
      m_axi_wdata(63 downto 32) => xbar_to_m01_couplers_WDATA(63 downto 32),
      m_axi_wdata(31 downto 0) => xbar_to_m00_couplers_WDATA(31 downto 0),
      m_axi_wready(8) => xbar_to_m08_couplers_WREADY,
      m_axi_wready(7) => xbar_to_m07_couplers_WREADY,
      m_axi_wready(6) => xbar_to_m06_couplers_WREADY,
      m_axi_wready(5) => xbar_to_m05_couplers_WREADY,
      m_axi_wready(4) => xbar_to_m04_couplers_WREADY,
      m_axi_wready(3) => xbar_to_m03_couplers_WREADY,
      m_axi_wready(2) => xbar_to_m02_couplers_WREADY,
      m_axi_wready(1) => xbar_to_m01_couplers_WREADY,
      m_axi_wready(0) => xbar_to_m00_couplers_WREADY,
      m_axi_wstrb(35 downto 32) => xbar_to_m08_couplers_WSTRB(35 downto 32),
      m_axi_wstrb(31 downto 28) => xbar_to_m07_couplers_WSTRB(31 downto 28),
      m_axi_wstrb(27 downto 24) => xbar_to_m06_couplers_WSTRB(27 downto 24),
      m_axi_wstrb(23 downto 20) => NLW_xbar_m_axi_wstrb_UNCONNECTED(23 downto 20),
      m_axi_wstrb(19 downto 16) => xbar_to_m04_couplers_WSTRB(19 downto 16),
      m_axi_wstrb(15 downto 12) => NLW_xbar_m_axi_wstrb_UNCONNECTED(15 downto 12),
      m_axi_wstrb(11 downto 8) => xbar_to_m02_couplers_WSTRB(11 downto 8),
      m_axi_wstrb(7 downto 4) => xbar_to_m01_couplers_WSTRB(7 downto 4),
      m_axi_wstrb(3 downto 0) => xbar_to_m00_couplers_WSTRB(3 downto 0),
      m_axi_wvalid(8) => xbar_to_m08_couplers_WVALID(8),
      m_axi_wvalid(7) => xbar_to_m07_couplers_WVALID(7),
      m_axi_wvalid(6) => xbar_to_m06_couplers_WVALID(6),
      m_axi_wvalid(5) => xbar_to_m05_couplers_WVALID(5),
      m_axi_wvalid(4) => xbar_to_m04_couplers_WVALID(4),
      m_axi_wvalid(3) => xbar_to_m03_couplers_WVALID(3),
      m_axi_wvalid(2) => xbar_to_m02_couplers_WVALID(2),
      m_axi_wvalid(1) => xbar_to_m01_couplers_WVALID(1),
      m_axi_wvalid(0) => xbar_to_m00_couplers_WVALID(0),
      s_axi_araddr(39 downto 0) => s00_couplers_to_xbar_ARADDR(39 downto 0),
      s_axi_arprot(2 downto 0) => s00_couplers_to_xbar_ARPROT(2 downto 0),
      s_axi_arready(0) => s00_couplers_to_xbar_ARREADY(0),
      s_axi_arvalid(0) => s00_couplers_to_xbar_ARVALID,
      s_axi_awaddr(39 downto 0) => s00_couplers_to_xbar_AWADDR(39 downto 0),
      s_axi_awprot(2 downto 0) => s00_couplers_to_xbar_AWPROT(2 downto 0),
      s_axi_awready(0) => s00_couplers_to_xbar_AWREADY(0),
      s_axi_awvalid(0) => s00_couplers_to_xbar_AWVALID,
      s_axi_bready(0) => s00_couplers_to_xbar_BREADY,
      s_axi_bresp(1 downto 0) => s00_couplers_to_xbar_BRESP(1 downto 0),
      s_axi_bvalid(0) => s00_couplers_to_xbar_BVALID(0),
      s_axi_rdata(31 downto 0) => s00_couplers_to_xbar_RDATA(31 downto 0),
      s_axi_rready(0) => s00_couplers_to_xbar_RREADY,
      s_axi_rresp(1 downto 0) => s00_couplers_to_xbar_RRESP(1 downto 0),
      s_axi_rvalid(0) => s00_couplers_to_xbar_RVALID(0),
      s_axi_wdata(31 downto 0) => s00_couplers_to_xbar_WDATA(31 downto 0),
      s_axi_wready(0) => s00_couplers_to_xbar_WREADY(0),
      s_axi_wstrb(3 downto 0) => s00_couplers_to_xbar_WSTRB(3 downto 0),
      s_axi_wvalid(0) => s00_couplers_to_xbar_WVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity edt_zcu106 is
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
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of edt_zcu106 : entity is "edt_zcu106,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=edt_zcu106,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=49,numReposBlks=38,numNonXlnxBlks=7,numHierBlks=11,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_axi4_cnt=9,da_clkrst_cnt=10,da_zynq_ultra_ps_e_cnt=1,synth_mode=OOC_per_IP}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of edt_zcu106 : entity is "edt_zcu106.hwdef";
end edt_zcu106;

architecture STRUCTURE of edt_zcu106 is
  component edt_zcu106_zynq_ultra_ps_e_0_0 is
  port (
    maxihpm0_fpd_aclk : in STD_LOGIC;
    maxigp0_awid : out STD_LOGIC_VECTOR ( 15 downto 0 );
    maxigp0_awaddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    maxigp0_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    maxigp0_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    maxigp0_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    maxigp0_awlock : out STD_LOGIC;
    maxigp0_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    maxigp0_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    maxigp0_awvalid : out STD_LOGIC;
    maxigp0_awuser : out STD_LOGIC_VECTOR ( 15 downto 0 );
    maxigp0_awready : in STD_LOGIC;
    maxigp0_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    maxigp0_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    maxigp0_wlast : out STD_LOGIC;
    maxigp0_wvalid : out STD_LOGIC;
    maxigp0_wready : in STD_LOGIC;
    maxigp0_bid : in STD_LOGIC_VECTOR ( 15 downto 0 );
    maxigp0_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    maxigp0_bvalid : in STD_LOGIC;
    maxigp0_bready : out STD_LOGIC;
    maxigp0_arid : out STD_LOGIC_VECTOR ( 15 downto 0 );
    maxigp0_araddr : out STD_LOGIC_VECTOR ( 39 downto 0 );
    maxigp0_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    maxigp0_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    maxigp0_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    maxigp0_arlock : out STD_LOGIC;
    maxigp0_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    maxigp0_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    maxigp0_arvalid : out STD_LOGIC;
    maxigp0_aruser : out STD_LOGIC_VECTOR ( 15 downto 0 );
    maxigp0_arready : in STD_LOGIC;
    maxigp0_rid : in STD_LOGIC_VECTOR ( 15 downto 0 );
    maxigp0_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    maxigp0_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    maxigp0_rlast : in STD_LOGIC;
    maxigp0_rvalid : in STD_LOGIC;
    maxigp0_rready : out STD_LOGIC;
    maxigp0_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    maxigp0_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    saxihp0_fpd_aclk : in STD_LOGIC;
    saxigp2_aruser : in STD_LOGIC;
    saxigp2_awuser : in STD_LOGIC;
    saxigp2_awid : in STD_LOGIC_VECTOR ( 5 downto 0 );
    saxigp2_awaddr : in STD_LOGIC_VECTOR ( 48 downto 0 );
    saxigp2_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    saxigp2_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    saxigp2_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    saxigp2_awlock : in STD_LOGIC;
    saxigp2_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    saxigp2_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    saxigp2_awvalid : in STD_LOGIC;
    saxigp2_awready : out STD_LOGIC;
    saxigp2_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    saxigp2_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    saxigp2_wlast : in STD_LOGIC;
    saxigp2_wvalid : in STD_LOGIC;
    saxigp2_wready : out STD_LOGIC;
    saxigp2_bid : out STD_LOGIC_VECTOR ( 5 downto 0 );
    saxigp2_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    saxigp2_bvalid : out STD_LOGIC;
    saxigp2_bready : in STD_LOGIC;
    saxigp2_arid : in STD_LOGIC_VECTOR ( 5 downto 0 );
    saxigp2_araddr : in STD_LOGIC_VECTOR ( 48 downto 0 );
    saxigp2_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    saxigp2_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    saxigp2_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    saxigp2_arlock : in STD_LOGIC;
    saxigp2_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    saxigp2_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    saxigp2_arvalid : in STD_LOGIC;
    saxigp2_arready : out STD_LOGIC;
    saxigp2_rid : out STD_LOGIC_VECTOR ( 5 downto 0 );
    saxigp2_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    saxigp2_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    saxigp2_rlast : out STD_LOGIC;
    saxigp2_rvalid : out STD_LOGIC;
    saxigp2_rready : in STD_LOGIC;
    saxigp2_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    saxigp2_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    saxihp1_fpd_aclk : in STD_LOGIC;
    saxigp3_aruser : in STD_LOGIC;
    saxigp3_awuser : in STD_LOGIC;
    saxigp3_awid : in STD_LOGIC_VECTOR ( 5 downto 0 );
    saxigp3_awaddr : in STD_LOGIC_VECTOR ( 48 downto 0 );
    saxigp3_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    saxigp3_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    saxigp3_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    saxigp3_awlock : in STD_LOGIC;
    saxigp3_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    saxigp3_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    saxigp3_awvalid : in STD_LOGIC;
    saxigp3_awready : out STD_LOGIC;
    saxigp3_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    saxigp3_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    saxigp3_wlast : in STD_LOGIC;
    saxigp3_wvalid : in STD_LOGIC;
    saxigp3_wready : out STD_LOGIC;
    saxigp3_bid : out STD_LOGIC_VECTOR ( 5 downto 0 );
    saxigp3_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    saxigp3_bvalid : out STD_LOGIC;
    saxigp3_bready : in STD_LOGIC;
    saxigp3_arid : in STD_LOGIC_VECTOR ( 5 downto 0 );
    saxigp3_araddr : in STD_LOGIC_VECTOR ( 48 downto 0 );
    saxigp3_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    saxigp3_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    saxigp3_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    saxigp3_arlock : in STD_LOGIC;
    saxigp3_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    saxigp3_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    saxigp3_arvalid : in STD_LOGIC;
    saxigp3_arready : out STD_LOGIC;
    saxigp3_rid : out STD_LOGIC_VECTOR ( 5 downto 0 );
    saxigp3_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    saxigp3_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    saxigp3_rlast : out STD_LOGIC;
    saxigp3_rvalid : out STD_LOGIC;
    saxigp3_rready : in STD_LOGIC;
    saxigp3_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    saxigp3_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    saxihp2_fpd_aclk : in STD_LOGIC;
    saxigp4_aruser : in STD_LOGIC;
    saxigp4_awuser : in STD_LOGIC;
    saxigp4_awid : in STD_LOGIC_VECTOR ( 5 downto 0 );
    saxigp4_awaddr : in STD_LOGIC_VECTOR ( 48 downto 0 );
    saxigp4_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    saxigp4_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    saxigp4_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    saxigp4_awlock : in STD_LOGIC;
    saxigp4_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    saxigp4_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    saxigp4_awvalid : in STD_LOGIC;
    saxigp4_awready : out STD_LOGIC;
    saxigp4_wdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    saxigp4_wstrb : in STD_LOGIC_VECTOR ( 15 downto 0 );
    saxigp4_wlast : in STD_LOGIC;
    saxigp4_wvalid : in STD_LOGIC;
    saxigp4_wready : out STD_LOGIC;
    saxigp4_bid : out STD_LOGIC_VECTOR ( 5 downto 0 );
    saxigp4_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    saxigp4_bvalid : out STD_LOGIC;
    saxigp4_bready : in STD_LOGIC;
    saxigp4_arid : in STD_LOGIC_VECTOR ( 5 downto 0 );
    saxigp4_araddr : in STD_LOGIC_VECTOR ( 48 downto 0 );
    saxigp4_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    saxigp4_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    saxigp4_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    saxigp4_arlock : in STD_LOGIC;
    saxigp4_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    saxigp4_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    saxigp4_arvalid : in STD_LOGIC;
    saxigp4_arready : out STD_LOGIC;
    saxigp4_rid : out STD_LOGIC_VECTOR ( 5 downto 0 );
    saxigp4_rdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    saxigp4_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    saxigp4_rlast : out STD_LOGIC;
    saxigp4_rvalid : out STD_LOGIC;
    saxigp4_rready : in STD_LOGIC;
    saxigp4_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    saxigp4_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    saxihp3_fpd_aclk : in STD_LOGIC;
    saxigp5_aruser : in STD_LOGIC;
    saxigp5_awuser : in STD_LOGIC;
    saxigp5_awid : in STD_LOGIC_VECTOR ( 5 downto 0 );
    saxigp5_awaddr : in STD_LOGIC_VECTOR ( 48 downto 0 );
    saxigp5_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    saxigp5_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    saxigp5_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    saxigp5_awlock : in STD_LOGIC;
    saxigp5_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    saxigp5_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    saxigp5_awvalid : in STD_LOGIC;
    saxigp5_awready : out STD_LOGIC;
    saxigp5_wdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    saxigp5_wstrb : in STD_LOGIC_VECTOR ( 15 downto 0 );
    saxigp5_wlast : in STD_LOGIC;
    saxigp5_wvalid : in STD_LOGIC;
    saxigp5_wready : out STD_LOGIC;
    saxigp5_bid : out STD_LOGIC_VECTOR ( 5 downto 0 );
    saxigp5_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    saxigp5_bvalid : out STD_LOGIC;
    saxigp5_bready : in STD_LOGIC;
    saxigp5_arid : in STD_LOGIC_VECTOR ( 5 downto 0 );
    saxigp5_araddr : in STD_LOGIC_VECTOR ( 48 downto 0 );
    saxigp5_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    saxigp5_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    saxigp5_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    saxigp5_arlock : in STD_LOGIC;
    saxigp5_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    saxigp5_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    saxigp5_arvalid : in STD_LOGIC;
    saxigp5_arready : out STD_LOGIC;
    saxigp5_rid : out STD_LOGIC_VECTOR ( 5 downto 0 );
    saxigp5_rdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    saxigp5_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    saxigp5_rlast : out STD_LOGIC;
    saxigp5_rvalid : out STD_LOGIC;
    saxigp5_rready : in STD_LOGIC;
    saxigp5_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    saxigp5_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    emio_gpio_i : in STD_LOGIC_VECTOR ( 24 downto 0 );
    emio_gpio_o : out STD_LOGIC_VECTOR ( 24 downto 0 );
    emio_gpio_t : out STD_LOGIC_VECTOR ( 24 downto 0 );
    emio_spi0_sclk_i : in STD_LOGIC;
    emio_spi0_sclk_o : out STD_LOGIC;
    emio_spi0_sclk_t : out STD_LOGIC;
    emio_spi0_m_i : in STD_LOGIC;
    emio_spi0_m_o : out STD_LOGIC;
    emio_spi0_mo_t : out STD_LOGIC;
    emio_spi0_s_i : in STD_LOGIC;
    emio_spi0_s_o : out STD_LOGIC;
    emio_spi0_so_t : out STD_LOGIC;
    emio_spi0_ss_i_n : in STD_LOGIC;
    emio_spi0_ss_o_n : out STD_LOGIC;
    emio_spi0_ss1_o_n : out STD_LOGIC;
    emio_spi0_ss_n_t : out STD_LOGIC;
    pl_ps_irq0 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    pl_resetn0 : out STD_LOGIC;
    pl_clk0 : out STD_LOGIC
  );
  end component edt_zcu106_zynq_ultra_ps_e_0_0;
  component edt_zcu106_rst_ps8_0_99M_0 is
  port (
    slowest_sync_clk : in STD_LOGIC;
    ext_reset_in : in STD_LOGIC;
    aux_reset_in : in STD_LOGIC;
    mb_debug_sys_rst : in STD_LOGIC;
    dcm_locked : in STD_LOGIC;
    mb_reset : out STD_LOGIC;
    bus_struct_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    interconnect_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component edt_zcu106_rst_ps8_0_99M_0;
  component edt_zcu106_clk_wiz_0 is
  port (
    reset : in STD_LOGIC;
    clk_in1 : in STD_LOGIC;
    clk_out1 : out STD_LOGIC;
    clk_out2 : out STD_LOGIC;
    clk_out3 : out STD_LOGIC;
    locked : out STD_LOGIC;
    clk_out3_ce : in STD_LOGIC
  );
  end component edt_zcu106_clk_wiz_0;
  component edt_zcu106_xlconstant_0_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component edt_zcu106_xlconstant_0_0;
  component edt_zcu106_axi_dma_0_0 is
  port (
    s_axi_lite_aclk : in STD_LOGIC;
    m_axi_sg_aclk : in STD_LOGIC;
    m_axi_s2mm_aclk : in STD_LOGIC;
    axi_resetn : in STD_LOGIC;
    s_axi_lite_awvalid : in STD_LOGIC;
    s_axi_lite_awready : out STD_LOGIC;
    s_axi_lite_awaddr : in STD_LOGIC_VECTOR ( 9 downto 0 );
    s_axi_lite_wvalid : in STD_LOGIC;
    s_axi_lite_wready : out STD_LOGIC;
    s_axi_lite_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_lite_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_lite_bvalid : out STD_LOGIC;
    s_axi_lite_bready : in STD_LOGIC;
    s_axi_lite_arvalid : in STD_LOGIC;
    s_axi_lite_arready : out STD_LOGIC;
    s_axi_lite_araddr : in STD_LOGIC_VECTOR ( 9 downto 0 );
    s_axi_lite_rvalid : out STD_LOGIC;
    s_axi_lite_rready : in STD_LOGIC;
    s_axi_lite_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_lite_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_sg_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_sg_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_sg_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_sg_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_sg_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_sg_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_sg_awvalid : out STD_LOGIC;
    m_axi_sg_awready : in STD_LOGIC;
    m_axi_sg_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_sg_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_sg_wlast : out STD_LOGIC;
    m_axi_sg_wvalid : out STD_LOGIC;
    m_axi_sg_wready : in STD_LOGIC;
    m_axi_sg_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_sg_bvalid : in STD_LOGIC;
    m_axi_sg_bready : out STD_LOGIC;
    m_axi_sg_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_sg_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_sg_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_sg_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_sg_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_sg_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_sg_arvalid : out STD_LOGIC;
    m_axi_sg_arready : in STD_LOGIC;
    m_axi_sg_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_sg_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_sg_rlast : in STD_LOGIC;
    m_axi_sg_rvalid : in STD_LOGIC;
    m_axi_sg_rready : out STD_LOGIC;
    m_axi_s2mm_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_s2mm_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_s2mm_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_s2mm_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_s2mm_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_s2mm_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_s2mm_awvalid : out STD_LOGIC;
    m_axi_s2mm_awready : in STD_LOGIC;
    m_axi_s2mm_wdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    m_axi_s2mm_wstrb : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axi_s2mm_wlast : out STD_LOGIC;
    m_axi_s2mm_wvalid : out STD_LOGIC;
    m_axi_s2mm_wready : in STD_LOGIC;
    m_axi_s2mm_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_s2mm_bvalid : in STD_LOGIC;
    m_axi_s2mm_bready : out STD_LOGIC;
    s2mm_prmry_reset_out_n : out STD_LOGIC;
    s_axis_s2mm_tdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    s_axis_s2mm_tkeep : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_s2mm_tvalid : in STD_LOGIC;
    s_axis_s2mm_tready : out STD_LOGIC;
    s_axis_s2mm_tlast : in STD_LOGIC;
    s2mm_introut : out STD_LOGIC
  );
  end component edt_zcu106_axi_dma_0_0;
  component edt_zcu106_axi_dma_0_1 is
  port (
    s_axi_lite_aclk : in STD_LOGIC;
    m_axi_sg_aclk : in STD_LOGIC;
    m_axi_s2mm_aclk : in STD_LOGIC;
    axi_resetn : in STD_LOGIC;
    s_axi_lite_awvalid : in STD_LOGIC;
    s_axi_lite_awready : out STD_LOGIC;
    s_axi_lite_awaddr : in STD_LOGIC_VECTOR ( 9 downto 0 );
    s_axi_lite_wvalid : in STD_LOGIC;
    s_axi_lite_wready : out STD_LOGIC;
    s_axi_lite_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_lite_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_lite_bvalid : out STD_LOGIC;
    s_axi_lite_bready : in STD_LOGIC;
    s_axi_lite_arvalid : in STD_LOGIC;
    s_axi_lite_arready : out STD_LOGIC;
    s_axi_lite_araddr : in STD_LOGIC_VECTOR ( 9 downto 0 );
    s_axi_lite_rvalid : out STD_LOGIC;
    s_axi_lite_rready : in STD_LOGIC;
    s_axi_lite_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_lite_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_sg_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_sg_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_sg_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_sg_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_sg_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_sg_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_sg_awvalid : out STD_LOGIC;
    m_axi_sg_awready : in STD_LOGIC;
    m_axi_sg_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_sg_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_sg_wlast : out STD_LOGIC;
    m_axi_sg_wvalid : out STD_LOGIC;
    m_axi_sg_wready : in STD_LOGIC;
    m_axi_sg_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_sg_bvalid : in STD_LOGIC;
    m_axi_sg_bready : out STD_LOGIC;
    m_axi_sg_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_sg_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_sg_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_sg_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_sg_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_sg_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_sg_arvalid : out STD_LOGIC;
    m_axi_sg_arready : in STD_LOGIC;
    m_axi_sg_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_sg_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_sg_rlast : in STD_LOGIC;
    m_axi_sg_rvalid : in STD_LOGIC;
    m_axi_sg_rready : out STD_LOGIC;
    m_axi_s2mm_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_s2mm_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_s2mm_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_s2mm_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_s2mm_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_s2mm_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_s2mm_awvalid : out STD_LOGIC;
    m_axi_s2mm_awready : in STD_LOGIC;
    m_axi_s2mm_wdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    m_axi_s2mm_wstrb : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axi_s2mm_wlast : out STD_LOGIC;
    m_axi_s2mm_wvalid : out STD_LOGIC;
    m_axi_s2mm_wready : in STD_LOGIC;
    m_axi_s2mm_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_s2mm_bvalid : in STD_LOGIC;
    m_axi_s2mm_bready : out STD_LOGIC;
    s2mm_prmry_reset_out_n : out STD_LOGIC;
    s_axis_s2mm_tdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    s_axis_s2mm_tkeep : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_s2mm_tvalid : in STD_LOGIC;
    s_axis_s2mm_tready : out STD_LOGIC;
    s_axis_s2mm_tlast : in STD_LOGIC;
    s2mm_introut : out STD_LOGIC
  );
  end component edt_zcu106_axi_dma_0_1;
  component edt_zcu106_xlconcat_0_0 is
  port (
    In0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    dout : out STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  end component edt_zcu106_xlconcat_0_0;
  component edt_zcu106_util_reduced_logic_0_0 is
  port (
    Op1 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    Res : out STD_LOGIC
  );
  end component edt_zcu106_util_reduced_logic_0_0;
  component edt_zcu106_util_reduced_logic_0_1 is
  port (
    Op1 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    Res : out STD_LOGIC
  );
  end component edt_zcu106_util_reduced_logic_0_1;
  component edt_zcu106_xlconcat_0_1 is
  port (
    In0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In3 : in STD_LOGIC_VECTOR ( 0 to 0 );
    dout : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  end component edt_zcu106_xlconcat_0_1;
  component edt_zcu106_xlconcat_1_0 is
  port (
    In0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In3 : in STD_LOGIC_VECTOR ( 0 to 0 );
    dout : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  end component edt_zcu106_xlconcat_1_0;
  component edt_zcu106_util_ds_buf_0_0 is
  port (
    IOBUF_IO_T : in STD_LOGIC_VECTOR ( 0 to 0 );
    IOBUF_IO_I : in STD_LOGIC_VECTOR ( 0 to 0 );
    IOBUF_IO_O : out STD_LOGIC_VECTOR ( 0 to 0 );
    IOBUF_IO_IO : inout STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component edt_zcu106_util_ds_buf_0_0;
  component edt_zcu106_util_ds_buf_0_1 is
  port (
    OBUF_IN : in STD_LOGIC_VECTOR ( 0 to 0 );
    OBUF_DS_P : out STD_LOGIC_VECTOR ( 0 to 0 );
    OBUF_DS_N : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component edt_zcu106_util_ds_buf_0_1;
  component edt_zcu106_xlslice_0_0 is
  port (
    Din : in STD_LOGIC_VECTOR ( 24 downto 0 );
    Dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component edt_zcu106_xlslice_0_0;
  component edt_zcu106_xlslice_pmod0_0 is
  port (
    Din : in STD_LOGIC_VECTOR ( 24 downto 0 );
    Dout : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  end component edt_zcu106_xlslice_pmod0_0;
  component edt_zcu106_AFE_CLK_BUF_0 is
  port (
    OBUF_IN : in STD_LOGIC_VECTOR ( 0 to 0 );
    OBUF_DS_P : out STD_LOGIC_VECTOR ( 0 to 0 );
    OBUF_DS_N : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component edt_zcu106_AFE_CLK_BUF_0;
  component edt_zcu106_util_reduced_logic_0_2 is
  port (
    Op1 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    Res : out STD_LOGIC
  );
  end component edt_zcu106_util_reduced_logic_0_2;
  component edt_zcu106_xlconcat_1_1 is
  port (
    In0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    dout : out STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  end component edt_zcu106_xlconcat_1_1;
  component edt_zcu106_ad9670_axi4_0_0 is
  port (
    tx_nrx : in STD_LOGIC;
    lvds_dco_p : in STD_LOGIC;
    lvds_dco_n : in STD_LOGIC;
    lvds_fco_p : in STD_LOGIC;
    lvds_fco_n : in STD_LOGIC;
    enable : in STD_LOGIC;
    lvds_data_p : in STD_LOGIC_VECTOR ( 7 downto 0 );
    lvds_data_n : in STD_LOGIC_VECTOR ( 7 downto 0 );
    tx_trig : out STD_LOGIC;
    S_AXI_ACLK : in STD_LOGIC;
    S_AXI_ARESETN : in STD_LOGIC;
    S_AXI_AWADDR : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_AWPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_AWVALID : in STD_LOGIC;
    S_AXI_AWREADY : out STD_LOGIC;
    S_AXI_WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_WVALID : in STD_LOGIC;
    S_AXI_WREADY : out STD_LOGIC;
    S_AXI_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_BVALID : out STD_LOGIC;
    S_AXI_BREADY : in STD_LOGIC;
    S_AXI_ARADDR : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_ARPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_ARVALID : in STD_LOGIC;
    S_AXI_ARREADY : out STD_LOGIC;
    S_AXI_RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_RVALID : out STD_LOGIC;
    S_AXI_RREADY : in STD_LOGIC;
    m_axis_aclk : in STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    m_axis_tkeep : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_tlast : out STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC
  );
  end component edt_zcu106_ad9670_axi4_0_0;
  component edt_zcu106_ad9670_axi4_0_1 is
  port (
    tx_nrx : in STD_LOGIC;
    lvds_dco_p : in STD_LOGIC;
    lvds_dco_n : in STD_LOGIC;
    lvds_fco_p : in STD_LOGIC;
    lvds_fco_n : in STD_LOGIC;
    enable : in STD_LOGIC;
    lvds_data_p : in STD_LOGIC_VECTOR ( 7 downto 0 );
    lvds_data_n : in STD_LOGIC_VECTOR ( 7 downto 0 );
    tx_trig : out STD_LOGIC;
    S_AXI_ACLK : in STD_LOGIC;
    S_AXI_ARESETN : in STD_LOGIC;
    S_AXI_AWADDR : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_AWPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_AWVALID : in STD_LOGIC;
    S_AXI_AWREADY : out STD_LOGIC;
    S_AXI_WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_WVALID : in STD_LOGIC;
    S_AXI_WREADY : out STD_LOGIC;
    S_AXI_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_BVALID : out STD_LOGIC;
    S_AXI_BREADY : in STD_LOGIC;
    S_AXI_ARADDR : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_ARPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_ARVALID : in STD_LOGIC;
    S_AXI_ARREADY : out STD_LOGIC;
    S_AXI_RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_RVALID : out STD_LOGIC;
    S_AXI_RREADY : in STD_LOGIC;
    m_axis_aclk : in STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    m_axis_tkeep : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_tlast : out STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC
  );
  end component edt_zcu106_ad9670_axi4_0_1;
  component edt_zcu106_hv7321_axi4_0_0 is
  port (
    src_clk : in STD_LOGIC;
    start : in STD_LOGIC;
    otp_n : in STD_LOGIC;
    rx_done : in STD_LOGIC;
    tx : out STD_LOGIC;
    rx : out STD_LOGIC;
    out_clk : out STD_LOGIC;
    ren : out STD_LOGIC;
    oen : out STD_LOGIC;
    sel : out STD_LOGIC_VECTOR ( 3 downto 0 );
    pos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    neg : out STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_AWADDR : in STD_LOGIC_VECTOR ( 9 downto 0 );
    S_AXI_AWPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_AWVALID : in STD_LOGIC;
    S_AXI_AWREADY : out STD_LOGIC;
    S_AXI_WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_WVALID : in STD_LOGIC;
    S_AXI_WREADY : out STD_LOGIC;
    S_AXI_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_BVALID : out STD_LOGIC;
    S_AXI_BREADY : in STD_LOGIC;
    S_AXI_ARADDR : in STD_LOGIC_VECTOR ( 9 downto 0 );
    S_AXI_ARPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_ARVALID : in STD_LOGIC;
    S_AXI_ARREADY : out STD_LOGIC;
    S_AXI_RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_RVALID : out STD_LOGIC;
    S_AXI_RREADY : in STD_LOGIC;
    S_AXI_ACLK : in STD_LOGIC;
    S_AXI_ARESETN : in STD_LOGIC
  );
  end component edt_zcu106_hv7321_axi4_0_0;
  component edt_zcu106_hv7321_axi4_0_1 is
  port (
    src_clk : in STD_LOGIC;
    start : in STD_LOGIC;
    otp_n : in STD_LOGIC;
    rx_done : in STD_LOGIC;
    tx : out STD_LOGIC;
    rx : out STD_LOGIC;
    out_clk : out STD_LOGIC;
    ren : out STD_LOGIC;
    oen : out STD_LOGIC;
    sel : out STD_LOGIC_VECTOR ( 3 downto 0 );
    pos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    neg : out STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_AWADDR : in STD_LOGIC_VECTOR ( 9 downto 0 );
    S_AXI_AWPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_AWVALID : in STD_LOGIC;
    S_AXI_AWREADY : out STD_LOGIC;
    S_AXI_WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_WVALID : in STD_LOGIC;
    S_AXI_WREADY : out STD_LOGIC;
    S_AXI_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_BVALID : out STD_LOGIC;
    S_AXI_BREADY : in STD_LOGIC;
    S_AXI_ARADDR : in STD_LOGIC_VECTOR ( 9 downto 0 );
    S_AXI_ARPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_ARVALID : in STD_LOGIC;
    S_AXI_ARREADY : out STD_LOGIC;
    S_AXI_RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_RVALID : out STD_LOGIC;
    S_AXI_RREADY : in STD_LOGIC;
    S_AXI_ACLK : in STD_LOGIC;
    S_AXI_ARESETN : in STD_LOGIC
  );
  end component edt_zcu106_hv7321_axi4_0_1;
  component edt_zcu106_hv7321_axi4_0_2 is
  port (
    src_clk : in STD_LOGIC;
    start : in STD_LOGIC;
    otp_n : in STD_LOGIC;
    rx_done : in STD_LOGIC;
    tx : out STD_LOGIC;
    rx : out STD_LOGIC;
    out_clk : out STD_LOGIC;
    ren : out STD_LOGIC;
    oen : out STD_LOGIC;
    sel : out STD_LOGIC_VECTOR ( 3 downto 0 );
    pos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    neg : out STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_AWADDR : in STD_LOGIC_VECTOR ( 9 downto 0 );
    S_AXI_AWPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_AWVALID : in STD_LOGIC;
    S_AXI_AWREADY : out STD_LOGIC;
    S_AXI_WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_WVALID : in STD_LOGIC;
    S_AXI_WREADY : out STD_LOGIC;
    S_AXI_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_BVALID : out STD_LOGIC;
    S_AXI_BREADY : in STD_LOGIC;
    S_AXI_ARADDR : in STD_LOGIC_VECTOR ( 9 downto 0 );
    S_AXI_ARPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_ARVALID : in STD_LOGIC;
    S_AXI_ARREADY : out STD_LOGIC;
    S_AXI_RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_RVALID : out STD_LOGIC;
    S_AXI_RREADY : in STD_LOGIC;
    S_AXI_ACLK : in STD_LOGIC;
    S_AXI_ARESETN : in STD_LOGIC
  );
  end component edt_zcu106_hv7321_axi4_0_2;
  component edt_zcu106_hv7321_axi4_0_3 is
  port (
    src_clk : in STD_LOGIC;
    start : in STD_LOGIC;
    otp_n : in STD_LOGIC;
    rx_done : in STD_LOGIC;
    tx : out STD_LOGIC;
    rx : out STD_LOGIC;
    out_clk : out STD_LOGIC;
    ren : out STD_LOGIC;
    oen : out STD_LOGIC;
    sel : out STD_LOGIC_VECTOR ( 3 downto 0 );
    pos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    neg : out STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_AWADDR : in STD_LOGIC_VECTOR ( 9 downto 0 );
    S_AXI_AWPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_AWVALID : in STD_LOGIC;
    S_AXI_AWREADY : out STD_LOGIC;
    S_AXI_WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_WVALID : in STD_LOGIC;
    S_AXI_WREADY : out STD_LOGIC;
    S_AXI_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_BVALID : out STD_LOGIC;
    S_AXI_BREADY : in STD_LOGIC;
    S_AXI_ARADDR : in STD_LOGIC_VECTOR ( 9 downto 0 );
    S_AXI_ARPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_ARVALID : in STD_LOGIC;
    S_AXI_ARREADY : out STD_LOGIC;
    S_AXI_RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_RVALID : out STD_LOGIC;
    S_AXI_RREADY : in STD_LOGIC;
    S_AXI_ACLK : in STD_LOGIC;
    S_AXI_ARESETN : in STD_LOGIC
  );
  end component edt_zcu106_hv7321_axi4_0_3;
  component edt_zcu106_RX01_OR_1 is
  port (
    Op1 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    Res : out STD_LOGIC
  );
  end component edt_zcu106_RX01_OR_1;
  component edt_zcu106_RX01_CONCAT_1 is
  port (
    In0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    dout : out STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  end component edt_zcu106_RX01_CONCAT_1;
  component edt_zcu106_RX23_CONCAT_0 is
  port (
    In0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    dout : out STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  end component edt_zcu106_RX23_CONCAT_0;
  component edt_zcu106_RX01_OR_0 is
  port (
    Op1 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    Res : out STD_LOGIC
  );
  end component edt_zcu106_RX01_OR_0;
  component edt_zcu106_xlslice_pmod1_1 is
  port (
    Din : in STD_LOGIC_VECTOR ( 24 downto 0 );
    Dout : out STD_LOGIC_VECTOR ( 4 downto 0 )
  );
  end component edt_zcu106_xlslice_pmod1_1;
  component edt_zcu106_xlslice_pmod1_0 is
  port (
    Din : in STD_LOGIC_VECTOR ( 24 downto 0 );
    Dout : out STD_LOGIC_VECTOR ( 4 downto 0 )
  );
  end component edt_zcu106_xlslice_pmod1_0;
  component edt_zcu106_xlslice_pulser_start_1 is
  port (
    Din : in STD_LOGIC_VECTOR ( 24 downto 0 );
    Dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component edt_zcu106_xlslice_pulser_start_1;
  component edt_zcu106_xlslice_pulser_start_0 is
  port (
    Din : in STD_LOGIC_VECTOR ( 24 downto 0 );
    Dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component edt_zcu106_xlslice_pulser_start_0;
  component edt_zcu106_xlslice_adc_enable_0 is
  port (
    Din : in STD_LOGIC_VECTOR ( 24 downto 0 );
    Dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component edt_zcu106_xlslice_adc_enable_0;
  component edt_zcu106_RX01_CONCAT_0 is
  port (
    In0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    dout : out STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  end component edt_zcu106_RX01_CONCAT_0;
  component edt_zcu106_DAC_START_OR_0 is
  port (
    Op1 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    Res : out STD_LOGIC
  );
  end component edt_zcu106_DAC_START_OR_0;
  component edt_zcu106_ad5424_axi4_0_0 is
  port (
    src_clk : in STD_LOGIC;
    start : in STD_LOGIC;
    csn_clk : out STD_LOGIC_VECTOR ( 1 downto 0 );
    data : out STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_AWADDR : in STD_LOGIC_VECTOR ( 10 downto 0 );
    S_AXI_AWPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_AWVALID : in STD_LOGIC;
    S_AXI_AWREADY : out STD_LOGIC;
    S_AXI_WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_WVALID : in STD_LOGIC;
    S_AXI_WREADY : out STD_LOGIC;
    S_AXI_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_BVALID : out STD_LOGIC;
    S_AXI_BREADY : in STD_LOGIC;
    S_AXI_ARADDR : in STD_LOGIC_VECTOR ( 10 downto 0 );
    S_AXI_ARPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_ARVALID : in STD_LOGIC;
    S_AXI_ARREADY : out STD_LOGIC;
    S_AXI_RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_RVALID : out STD_LOGIC;
    S_AXI_RREADY : in STD_LOGIC;
    S_AXI_ACLK : in STD_LOGIC;
    S_AXI_ARESETN : in STD_LOGIC
  );
  end component edt_zcu106_ad5424_axi4_0_0;
  signal AFE_CLK_BUF_OBUF_DS_N : STD_LOGIC_VECTOR ( 0 to 0 );
  signal AFE_CLK_BUF_OBUF_DS_P : STD_LOGIC_VECTOR ( 0 to 0 );
  signal AFE_SDIO_BUF_IOBUF_IO_O : STD_LOGIC_VECTOR ( 0 to 0 );
  signal DAC_START_CONCAT_dout : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal Net : STD_LOGIC_VECTOR ( 0 to 0 );
  signal OEN_CONCAT_dout : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal REN01_CONCAT_dout : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal REN01_CONCAT_dout1 : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal REN_CONCAT_dout : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal RX01_OR_Res : STD_LOGIC;
  signal RX23_OR_Res : STD_LOGIC;
  signal System_Clock_Sources_clk_out2 : STD_LOGIC;
  signal System_Clock_Sources_clk_out3 : STD_LOGIC;
  signal TRIG_BUF_OBUF_DS_N : STD_LOGIC_VECTOR ( 0 to 0 );
  signal TRIG_BUF_OBUF_DS_P : STD_LOGIC_VECTOR ( 0 to 0 );
  signal TRIG_OR1_Res : STD_LOGIC;
  signal TRIG_OR_Res : STD_LOGIC;
  signal Zero_dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal ad5424_axi4_0_csn_clk : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ad5424_axi4_0_data : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal ad9670_axi4_0_m_axis_TDATA : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal ad9670_axi4_0_m_axis_TKEEP : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal ad9670_axi4_0_m_axis_TLAST : STD_LOGIC;
  signal ad9670_axi4_0_m_axis_TREADY : STD_LOGIC;
  signal ad9670_axi4_0_m_axis_TVALID : STD_LOGIC;
  signal ad9670_axi4_0_tx_trig : STD_LOGIC;
  signal ad9670_axi4_1_m_axis_TDATA : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal ad9670_axi4_1_m_axis_TKEEP : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal ad9670_axi4_1_m_axis_TLAST : STD_LOGIC;
  signal ad9670_axi4_1_m_axis_TREADY : STD_LOGIC;
  signal ad9670_axi4_1_m_axis_TVALID : STD_LOGIC;
  signal ad9670_axi4_1_tx_trig : STD_LOGIC;
  signal axi_dma_0_M_AXI_S2MM_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_dma_0_M_AXI_S2MM_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_dma_0_M_AXI_S2MM_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_dma_0_M_AXI_S2MM_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_dma_0_M_AXI_S2MM_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_dma_0_M_AXI_S2MM_AWREADY : STD_LOGIC;
  signal axi_dma_0_M_AXI_S2MM_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_dma_0_M_AXI_S2MM_AWVALID : STD_LOGIC;
  signal axi_dma_0_M_AXI_S2MM_BREADY : STD_LOGIC;
  signal axi_dma_0_M_AXI_S2MM_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_dma_0_M_AXI_S2MM_BVALID : STD_LOGIC;
  signal axi_dma_0_M_AXI_S2MM_WDATA : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal axi_dma_0_M_AXI_S2MM_WLAST : STD_LOGIC;
  signal axi_dma_0_M_AXI_S2MM_WREADY : STD_LOGIC;
  signal axi_dma_0_M_AXI_S2MM_WSTRB : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal axi_dma_0_M_AXI_S2MM_WVALID : STD_LOGIC;
  signal axi_dma_0_M_AXI_SG_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_dma_0_M_AXI_SG_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_dma_0_M_AXI_SG_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_dma_0_M_AXI_SG_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_dma_0_M_AXI_SG_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_dma_0_M_AXI_SG_ARREADY : STD_LOGIC;
  signal axi_dma_0_M_AXI_SG_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_dma_0_M_AXI_SG_ARVALID : STD_LOGIC;
  signal axi_dma_0_M_AXI_SG_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_dma_0_M_AXI_SG_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_dma_0_M_AXI_SG_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_dma_0_M_AXI_SG_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_dma_0_M_AXI_SG_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_dma_0_M_AXI_SG_AWREADY : STD_LOGIC;
  signal axi_dma_0_M_AXI_SG_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_dma_0_M_AXI_SG_AWVALID : STD_LOGIC;
  signal axi_dma_0_M_AXI_SG_BREADY : STD_LOGIC;
  signal axi_dma_0_M_AXI_SG_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_dma_0_M_AXI_SG_BVALID : STD_LOGIC;
  signal axi_dma_0_M_AXI_SG_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_dma_0_M_AXI_SG_RLAST : STD_LOGIC;
  signal axi_dma_0_M_AXI_SG_RREADY : STD_LOGIC;
  signal axi_dma_0_M_AXI_SG_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_dma_0_M_AXI_SG_RVALID : STD_LOGIC;
  signal axi_dma_0_M_AXI_SG_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_dma_0_M_AXI_SG_WLAST : STD_LOGIC;
  signal axi_dma_0_M_AXI_SG_WREADY : STD_LOGIC;
  signal axi_dma_0_M_AXI_SG_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_dma_0_M_AXI_SG_WVALID : STD_LOGIC;
  signal axi_dma_0_s2mm_introut : STD_LOGIC;
  signal axi_dma_1_M_AXI_S2MM_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_dma_1_M_AXI_S2MM_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_dma_1_M_AXI_S2MM_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_dma_1_M_AXI_S2MM_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_dma_1_M_AXI_S2MM_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_dma_1_M_AXI_S2MM_AWREADY : STD_LOGIC;
  signal axi_dma_1_M_AXI_S2MM_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_dma_1_M_AXI_S2MM_AWVALID : STD_LOGIC;
  signal axi_dma_1_M_AXI_S2MM_BREADY : STD_LOGIC;
  signal axi_dma_1_M_AXI_S2MM_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_dma_1_M_AXI_S2MM_BVALID : STD_LOGIC;
  signal axi_dma_1_M_AXI_S2MM_WDATA : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal axi_dma_1_M_AXI_S2MM_WLAST : STD_LOGIC;
  signal axi_dma_1_M_AXI_S2MM_WREADY : STD_LOGIC;
  signal axi_dma_1_M_AXI_S2MM_WSTRB : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal axi_dma_1_M_AXI_S2MM_WVALID : STD_LOGIC;
  signal axi_dma_1_M_AXI_SG_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_dma_1_M_AXI_SG_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_dma_1_M_AXI_SG_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_dma_1_M_AXI_SG_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_dma_1_M_AXI_SG_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_dma_1_M_AXI_SG_ARREADY : STD_LOGIC;
  signal axi_dma_1_M_AXI_SG_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_dma_1_M_AXI_SG_ARVALID : STD_LOGIC;
  signal axi_dma_1_M_AXI_SG_AWADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_dma_1_M_AXI_SG_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_dma_1_M_AXI_SG_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_dma_1_M_AXI_SG_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_dma_1_M_AXI_SG_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_dma_1_M_AXI_SG_AWREADY : STD_LOGIC;
  signal axi_dma_1_M_AXI_SG_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_dma_1_M_AXI_SG_AWVALID : STD_LOGIC;
  signal axi_dma_1_M_AXI_SG_BREADY : STD_LOGIC;
  signal axi_dma_1_M_AXI_SG_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_dma_1_M_AXI_SG_BVALID : STD_LOGIC;
  signal axi_dma_1_M_AXI_SG_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_dma_1_M_AXI_SG_RLAST : STD_LOGIC;
  signal axi_dma_1_M_AXI_SG_RREADY : STD_LOGIC;
  signal axi_dma_1_M_AXI_SG_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_dma_1_M_AXI_SG_RVALID : STD_LOGIC;
  signal axi_dma_1_M_AXI_SG_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_dma_1_M_AXI_SG_WLAST : STD_LOGIC;
  signal axi_dma_1_M_AXI_SG_WREADY : STD_LOGIC;
  signal axi_dma_1_M_AXI_SG_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_dma_1_M_AXI_SG_WVALID : STD_LOGIC;
  signal axi_dma_1_s2mm_introut : STD_LOGIC;
  signal clk_wiz_clk_out1 : STD_LOGIC;
  signal hv7321_axi4_0_neg : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal hv7321_axi4_0_oen : STD_LOGIC;
  signal hv7321_axi4_0_out_clk : STD_LOGIC;
  signal hv7321_axi4_0_pos : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal hv7321_axi4_0_ren : STD_LOGIC;
  signal hv7321_axi4_0_rx : STD_LOGIC;
  signal hv7321_axi4_0_sel : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal hv7321_axi4_0_tx : STD_LOGIC;
  signal hv7321_axi4_1_neg : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal hv7321_axi4_1_oen : STD_LOGIC;
  signal hv7321_axi4_1_out_clk : STD_LOGIC;
  signal hv7321_axi4_1_pos : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal hv7321_axi4_1_ren : STD_LOGIC;
  signal hv7321_axi4_1_rx : STD_LOGIC;
  signal hv7321_axi4_1_sel : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal hv7321_axi4_2_neg : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal hv7321_axi4_2_oen : STD_LOGIC;
  signal hv7321_axi4_2_out_clk : STD_LOGIC;
  signal hv7321_axi4_2_pos : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal hv7321_axi4_2_ren : STD_LOGIC;
  signal hv7321_axi4_2_rx : STD_LOGIC;
  signal hv7321_axi4_2_sel : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal hv7321_axi4_3_neg : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal hv7321_axi4_3_oen : STD_LOGIC;
  signal hv7321_axi4_3_out_clk : STD_LOGIC;
  signal hv7321_axi4_3_pos : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal hv7321_axi4_3_ren : STD_LOGIC;
  signal hv7321_axi4_3_rx : STD_LOGIC;
  signal hv7321_axi4_3_sel : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal lvds_data_n_0_1 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal lvds_data_n_1_1 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal lvds_data_p_0_1 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal lvds_data_p_1_1 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal lvds_dco_n_0_1 : STD_LOGIC;
  signal lvds_dco_n_1_1 : STD_LOGIC;
  signal lvds_dco_p_0_1 : STD_LOGIC;
  signal lvds_dco_p_1_1 : STD_LOGIC;
  signal lvds_fco_n_0_1 : STD_LOGIC;
  signal lvds_fco_n_1_1 : STD_LOGIC;
  signal lvds_fco_p_0_1 : STD_LOGIC;
  signal lvds_fco_p_1_1 : STD_LOGIC;
  signal otp_n_0_1 : STD_LOGIC;
  signal ps8_0_axi_periph_M00_AXI_ARADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal ps8_0_axi_periph_M00_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal ps8_0_axi_periph_M00_AXI_ARREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M00_AXI_ARVALID : STD_LOGIC;
  signal ps8_0_axi_periph_M00_AXI_AWADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal ps8_0_axi_periph_M00_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal ps8_0_axi_periph_M00_AXI_AWREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M00_AXI_AWVALID : STD_LOGIC;
  signal ps8_0_axi_periph_M00_AXI_BREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M00_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ps8_0_axi_periph_M00_AXI_BVALID : STD_LOGIC;
  signal ps8_0_axi_periph_M00_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps8_0_axi_periph_M00_AXI_RREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M00_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ps8_0_axi_periph_M00_AXI_RVALID : STD_LOGIC;
  signal ps8_0_axi_periph_M00_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps8_0_axi_periph_M00_AXI_WREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M00_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal ps8_0_axi_periph_M00_AXI_WVALID : STD_LOGIC;
  signal ps8_0_axi_periph_M01_AXI_ARADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal ps8_0_axi_periph_M01_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal ps8_0_axi_periph_M01_AXI_ARREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M01_AXI_ARVALID : STD_LOGIC;
  signal ps8_0_axi_periph_M01_AXI_AWADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal ps8_0_axi_periph_M01_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal ps8_0_axi_periph_M01_AXI_AWREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M01_AXI_AWVALID : STD_LOGIC;
  signal ps8_0_axi_periph_M01_AXI_BREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M01_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ps8_0_axi_periph_M01_AXI_BVALID : STD_LOGIC;
  signal ps8_0_axi_periph_M01_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps8_0_axi_periph_M01_AXI_RREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M01_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ps8_0_axi_periph_M01_AXI_RVALID : STD_LOGIC;
  signal ps8_0_axi_periph_M01_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps8_0_axi_periph_M01_AXI_WREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M01_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal ps8_0_axi_periph_M01_AXI_WVALID : STD_LOGIC;
  signal ps8_0_axi_periph_M02_AXI_ARADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal ps8_0_axi_periph_M02_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal ps8_0_axi_periph_M02_AXI_ARREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M02_AXI_ARVALID : STD_LOGIC;
  signal ps8_0_axi_periph_M02_AXI_AWADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal ps8_0_axi_periph_M02_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal ps8_0_axi_periph_M02_AXI_AWREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M02_AXI_AWVALID : STD_LOGIC;
  signal ps8_0_axi_periph_M02_AXI_BREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M02_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ps8_0_axi_periph_M02_AXI_BVALID : STD_LOGIC;
  signal ps8_0_axi_periph_M02_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps8_0_axi_periph_M02_AXI_RREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M02_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ps8_0_axi_periph_M02_AXI_RVALID : STD_LOGIC;
  signal ps8_0_axi_periph_M02_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps8_0_axi_periph_M02_AXI_WREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M02_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal ps8_0_axi_periph_M02_AXI_WVALID : STD_LOGIC;
  signal ps8_0_axi_periph_M03_AXI_ARADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal ps8_0_axi_periph_M03_AXI_ARREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M03_AXI_ARVALID : STD_LOGIC;
  signal ps8_0_axi_periph_M03_AXI_AWADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal ps8_0_axi_periph_M03_AXI_AWREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M03_AXI_AWVALID : STD_LOGIC;
  signal ps8_0_axi_periph_M03_AXI_BREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M03_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ps8_0_axi_periph_M03_AXI_BVALID : STD_LOGIC;
  signal ps8_0_axi_periph_M03_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps8_0_axi_periph_M03_AXI_RREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M03_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ps8_0_axi_periph_M03_AXI_RVALID : STD_LOGIC;
  signal ps8_0_axi_periph_M03_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps8_0_axi_periph_M03_AXI_WREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M03_AXI_WVALID : STD_LOGIC;
  signal ps8_0_axi_periph_M04_AXI_ARADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal ps8_0_axi_periph_M04_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal ps8_0_axi_periph_M04_AXI_ARREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M04_AXI_ARVALID : STD_LOGIC;
  signal ps8_0_axi_periph_M04_AXI_AWADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal ps8_0_axi_periph_M04_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal ps8_0_axi_periph_M04_AXI_AWREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M04_AXI_AWVALID : STD_LOGIC;
  signal ps8_0_axi_periph_M04_AXI_BREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M04_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ps8_0_axi_periph_M04_AXI_BVALID : STD_LOGIC;
  signal ps8_0_axi_periph_M04_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps8_0_axi_periph_M04_AXI_RREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M04_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ps8_0_axi_periph_M04_AXI_RVALID : STD_LOGIC;
  signal ps8_0_axi_periph_M04_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps8_0_axi_periph_M04_AXI_WREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M04_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal ps8_0_axi_periph_M04_AXI_WVALID : STD_LOGIC;
  signal ps8_0_axi_periph_M05_AXI_ARADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal ps8_0_axi_periph_M05_AXI_ARREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M05_AXI_ARVALID : STD_LOGIC;
  signal ps8_0_axi_periph_M05_AXI_AWADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal ps8_0_axi_periph_M05_AXI_AWREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M05_AXI_AWVALID : STD_LOGIC;
  signal ps8_0_axi_periph_M05_AXI_BREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M05_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ps8_0_axi_periph_M05_AXI_BVALID : STD_LOGIC;
  signal ps8_0_axi_periph_M05_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps8_0_axi_periph_M05_AXI_RREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M05_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ps8_0_axi_periph_M05_AXI_RVALID : STD_LOGIC;
  signal ps8_0_axi_periph_M05_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps8_0_axi_periph_M05_AXI_WREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M05_AXI_WVALID : STD_LOGIC;
  signal ps8_0_axi_periph_M06_AXI_ARADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal ps8_0_axi_periph_M06_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal ps8_0_axi_periph_M06_AXI_ARREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M06_AXI_ARVALID : STD_LOGIC;
  signal ps8_0_axi_periph_M06_AXI_AWADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal ps8_0_axi_periph_M06_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal ps8_0_axi_periph_M06_AXI_AWREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M06_AXI_AWVALID : STD_LOGIC;
  signal ps8_0_axi_periph_M06_AXI_BREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M06_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ps8_0_axi_periph_M06_AXI_BVALID : STD_LOGIC;
  signal ps8_0_axi_periph_M06_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps8_0_axi_periph_M06_AXI_RREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M06_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ps8_0_axi_periph_M06_AXI_RVALID : STD_LOGIC;
  signal ps8_0_axi_periph_M06_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps8_0_axi_periph_M06_AXI_WREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M06_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal ps8_0_axi_periph_M06_AXI_WVALID : STD_LOGIC;
  signal ps8_0_axi_periph_M07_AXI_ARADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal ps8_0_axi_periph_M07_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal ps8_0_axi_periph_M07_AXI_ARREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M07_AXI_ARVALID : STD_LOGIC;
  signal ps8_0_axi_periph_M07_AXI_AWADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal ps8_0_axi_periph_M07_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal ps8_0_axi_periph_M07_AXI_AWREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M07_AXI_AWVALID : STD_LOGIC;
  signal ps8_0_axi_periph_M07_AXI_BREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M07_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ps8_0_axi_periph_M07_AXI_BVALID : STD_LOGIC;
  signal ps8_0_axi_periph_M07_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps8_0_axi_periph_M07_AXI_RREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M07_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ps8_0_axi_periph_M07_AXI_RVALID : STD_LOGIC;
  signal ps8_0_axi_periph_M07_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps8_0_axi_periph_M07_AXI_WREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M07_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal ps8_0_axi_periph_M07_AXI_WVALID : STD_LOGIC;
  signal ps8_0_axi_periph_M08_AXI_ARADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal ps8_0_axi_periph_M08_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal ps8_0_axi_periph_M08_AXI_ARREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M08_AXI_ARVALID : STD_LOGIC;
  signal ps8_0_axi_periph_M08_AXI_AWADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal ps8_0_axi_periph_M08_AXI_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal ps8_0_axi_periph_M08_AXI_AWREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M08_AXI_AWVALID : STD_LOGIC;
  signal ps8_0_axi_periph_M08_AXI_BREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M08_AXI_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ps8_0_axi_periph_M08_AXI_BVALID : STD_LOGIC;
  signal ps8_0_axi_periph_M08_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps8_0_axi_periph_M08_AXI_RREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M08_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal ps8_0_axi_periph_M08_AXI_RVALID : STD_LOGIC;
  signal ps8_0_axi_periph_M08_AXI_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ps8_0_axi_periph_M08_AXI_WREADY : STD_LOGIC;
  signal ps8_0_axi_periph_M08_AXI_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal ps8_0_axi_periph_M08_AXI_WVALID : STD_LOGIC;
  signal rst_ps8_0_99M_peripheral_aresetn : STD_LOGIC_VECTOR ( 0 to 0 );
  signal rst_ps8_0_99M_peripheral_reset : STD_LOGIC_VECTOR ( 0 to 0 );
  signal start_0_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal util_reduced_logic_0_Res : STD_LOGIC;
  signal util_reduced_logic_1_Res : STD_LOGIC;
  signal xlconcat_0_dout : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xlconcat_1_dout : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal xlslice_0_Dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xlslice_adc_enable_Dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xlslice_debug_out_Dout : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal xlslice_leds_Dout : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal xlslice_pmod1_Dout : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal xlslice_pulser_start1_Dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARLOCK : STD_LOGIC;
  signal zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARREADY : STD_LOGIC;
  signal zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARVALID : STD_LOGIC;
  signal zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWADDR : STD_LOGIC_VECTOR ( 39 downto 0 );
  signal zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWLOCK : STD_LOGIC;
  signal zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWREADY : STD_LOGIC;
  signal zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWVALID : STD_LOGIC;
  signal zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_BID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_BREADY : STD_LOGIC;
  signal zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_BVALID : STD_LOGIC;
  signal zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RID : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RLAST : STD_LOGIC;
  signal zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RREADY : STD_LOGIC;
  signal zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RVALID : STD_LOGIC;
  signal zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_WLAST : STD_LOGIC;
  signal zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_WREADY : STD_LOGIC;
  signal zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_WVALID : STD_LOGIC;
  signal zynq_ultra_ps_e_0_emio_gpio_o : STD_LOGIC_VECTOR ( 24 downto 0 );
  signal zynq_ultra_ps_e_0_emio_spi0_m_o : STD_LOGIC;
  signal zynq_ultra_ps_e_0_emio_spi0_sclk_o : STD_LOGIC;
  signal zynq_ultra_ps_e_0_emio_spi0_ss1_o_n : STD_LOGIC;
  signal zynq_ultra_ps_e_0_emio_spi0_ss_o_n : STD_LOGIC;
  signal zynq_ultra_ps_e_0_pl_clk0 : STD_LOGIC;
  signal zynq_ultra_ps_e_0_pl_resetn0 : STD_LOGIC;
  signal NLW_System_Clock_Sources_locked_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_dma_0_s2mm_prmry_reset_out_n_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_dma_1_s2mm_prmry_reset_out_n_UNCONNECTED : STD_LOGIC;
  signal NLW_hv7321_axi4_1_tx_UNCONNECTED : STD_LOGIC;
  signal NLW_hv7321_axi4_2_tx_UNCONNECTED : STD_LOGIC;
  signal NLW_hv7321_axi4_3_tx_UNCONNECTED : STD_LOGIC;
  signal NLW_rst_ps8_0_99M_mb_reset_UNCONNECTED : STD_LOGIC;
  signal NLW_rst_ps8_0_99M_bus_struct_reset_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_rst_ps8_0_99M_interconnect_aresetn_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_zynq_ultra_ps_e_0_emio_spi0_mo_t_UNCONNECTED : STD_LOGIC;
  signal NLW_zynq_ultra_ps_e_0_emio_spi0_s_o_UNCONNECTED : STD_LOGIC;
  signal NLW_zynq_ultra_ps_e_0_emio_spi0_sclk_t_UNCONNECTED : STD_LOGIC;
  signal NLW_zynq_ultra_ps_e_0_emio_spi0_so_t_UNCONNECTED : STD_LOGIC;
  signal NLW_zynq_ultra_ps_e_0_emio_spi0_ss_n_t_UNCONNECTED : STD_LOGIC;
  signal NLW_zynq_ultra_ps_e_0_saxigp4_arready_UNCONNECTED : STD_LOGIC;
  signal NLW_zynq_ultra_ps_e_0_saxigp4_rlast_UNCONNECTED : STD_LOGIC;
  signal NLW_zynq_ultra_ps_e_0_saxigp4_rvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_zynq_ultra_ps_e_0_saxigp5_arready_UNCONNECTED : STD_LOGIC;
  signal NLW_zynq_ultra_ps_e_0_saxigp5_rlast_UNCONNECTED : STD_LOGIC;
  signal NLW_zynq_ultra_ps_e_0_saxigp5_rvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_zynq_ultra_ps_e_0_emio_gpio_t_UNCONNECTED : STD_LOGIC_VECTOR ( 24 downto 0 );
  signal NLW_zynq_ultra_ps_e_0_maxigp0_aruser_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_zynq_ultra_ps_e_0_maxigp0_awuser_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_zynq_ultra_ps_e_0_saxigp2_bid_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_zynq_ultra_ps_e_0_saxigp2_rid_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_zynq_ultra_ps_e_0_saxigp3_bid_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_zynq_ultra_ps_e_0_saxigp3_rid_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_zynq_ultra_ps_e_0_saxigp4_bid_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_zynq_ultra_ps_e_0_saxigp4_rdata_UNCONNECTED : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal NLW_zynq_ultra_ps_e_0_saxigp4_rid_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_zynq_ultra_ps_e_0_saxigp4_rresp_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_zynq_ultra_ps_e_0_saxigp5_bid_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_zynq_ultra_ps_e_0_saxigp5_rdata_UNCONNECTED : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal NLW_zynq_ultra_ps_e_0_saxigp5_rid_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_zynq_ultra_ps_e_0_saxigp5_rresp_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of lvds_dco_n_0 : signal is "xilinx.com:signal:clock:1.0 CLK.LVDS_DCO_N_0 CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of lvds_dco_n_0 : signal is "XIL_INTERFACENAME CLK.LVDS_DCO_N_0, CLK_DOMAIN edt_zcu106_lvds_dco_n_0, FREQ_HZ 125000000, INSERT_VIP 0, PHASE 0.000";
  attribute X_INTERFACE_INFO of lvds_dco_n_1 : signal is "xilinx.com:signal:clock:1.0 CLK.LVDS_DCO_N_1 CLK";
  attribute X_INTERFACE_PARAMETER of lvds_dco_n_1 : signal is "XIL_INTERFACENAME CLK.LVDS_DCO_N_1, CLK_DOMAIN edt_zcu106_lvds_dco_n_1, FREQ_HZ 125000000, INSERT_VIP 0, PHASE 0.000";
  attribute X_INTERFACE_INFO of lvds_dco_p_0 : signal is "xilinx.com:signal:clock:1.0 CLK.LVDS_DCO_P_0 CLK";
  attribute X_INTERFACE_PARAMETER of lvds_dco_p_0 : signal is "XIL_INTERFACENAME CLK.LVDS_DCO_P_0, CLK_DOMAIN edt_zcu106_lvds_dco_p_0, FREQ_HZ 125000000, INSERT_VIP 0, PHASE 0.000";
  attribute X_INTERFACE_INFO of lvds_dco_p_1 : signal is "xilinx.com:signal:clock:1.0 CLK.LVDS_DCO_P_1 CLK";
  attribute X_INTERFACE_PARAMETER of lvds_dco_p_1 : signal is "XIL_INTERFACENAME CLK.LVDS_DCO_P_1, CLK_DOMAIN edt_zcu106_lvds_dco_p_1, FREQ_HZ 125000000, INSERT_VIP 0, PHASE 0.000";
  attribute X_INTERFACE_INFO of lvds_fco_n_0 : signal is "xilinx.com:signal:clock:1.0 CLK.LVDS_FCO_N_0 CLK";
  attribute X_INTERFACE_PARAMETER of lvds_fco_n_0 : signal is "XIL_INTERFACENAME CLK.LVDS_FCO_N_0, CLK_DOMAIN edt_zcu106_lvds_fco_n_0, FREQ_HZ 125000000, INSERT_VIP 0, PHASE 0.000";
  attribute X_INTERFACE_INFO of lvds_fco_n_1 : signal is "xilinx.com:signal:clock:1.0 CLK.LVDS_FCO_N_1 CLK";
  attribute X_INTERFACE_PARAMETER of lvds_fco_n_1 : signal is "XIL_INTERFACENAME CLK.LVDS_FCO_N_1, CLK_DOMAIN edt_zcu106_lvds_fco_n_1, FREQ_HZ 125000000, INSERT_VIP 0, PHASE 0.000";
  attribute X_INTERFACE_INFO of lvds_fco_p_0 : signal is "xilinx.com:signal:clock:1.0 CLK.LVDS_FCO_P_0 CLK";
  attribute X_INTERFACE_PARAMETER of lvds_fco_p_0 : signal is "XIL_INTERFACENAME CLK.LVDS_FCO_P_0, CLK_DOMAIN edt_zcu106_lvds_fco_p_0, FREQ_HZ 125000000, INSERT_VIP 0, PHASE 0.000";
  attribute X_INTERFACE_INFO of lvds_fco_p_1 : signal is "xilinx.com:signal:clock:1.0 CLK.LVDS_FCO_P_1 CLK";
  attribute X_INTERFACE_PARAMETER of lvds_fco_p_1 : signal is "XIL_INTERFACENAME CLK.LVDS_FCO_P_1, CLK_DOMAIN edt_zcu106_lvds_fco_p_1, FREQ_HZ 125000000, INSERT_VIP 0, PHASE 0.000";
  attribute X_INTERFACE_INFO of out_clk_0 : signal is "xilinx.com:signal:clock:1.0 CLK.OUT_CLK_0 CLK";
  attribute X_INTERFACE_PARAMETER of out_clk_0 : signal is "XIL_INTERFACENAME CLK.OUT_CLK_0, CLK_DOMAIN edt_zcu106_hv7321_axi4_0_0_out_clk, FREQ_HZ 100000000, INSERT_VIP 0, PHASE 0.000";
  attribute X_INTERFACE_INFO of out_clk_1 : signal is "xilinx.com:signal:clock:1.0 CLK.OUT_CLK_1 CLK";
  attribute X_INTERFACE_PARAMETER of out_clk_1 : signal is "XIL_INTERFACENAME CLK.OUT_CLK_1, CLK_DOMAIN edt_zcu106_hv7321_axi4_0_1_out_clk, FREQ_HZ 100000000, INSERT_VIP 0, PHASE 0.000";
  attribute X_INTERFACE_INFO of out_clk_2 : signal is "xilinx.com:signal:clock:1.0 CLK.OUT_CLK_2 CLK";
  attribute X_INTERFACE_PARAMETER of out_clk_2 : signal is "XIL_INTERFACENAME CLK.OUT_CLK_2, CLK_DOMAIN edt_zcu106_hv7321_axi4_0_2_out_clk, FREQ_HZ 100000000, INSERT_VIP 0, PHASE 0.000";
  attribute X_INTERFACE_INFO of out_clk_3 : signal is "xilinx.com:signal:clock:1.0 CLK.OUT_CLK_3 CLK";
  attribute X_INTERFACE_PARAMETER of out_clk_3 : signal is "XIL_INTERFACENAME CLK.OUT_CLK_3, CLK_DOMAIN edt_zcu106_hv7321_axi4_0_3_out_clk, FREQ_HZ 100000000, INSERT_VIP 0, PHASE 0.000";
  attribute X_INTERFACE_INFO of tx_0 : signal is "xilinx.com:signal:data:1.0 DATA.TX_0 DATA";
  attribute X_INTERFACE_PARAMETER of tx_0 : signal is "XIL_INTERFACENAME DATA.TX_0, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of afe_clk_n : signal is "xilinx.com:signal:clock:1.0 CLK.AFE_CLK_N CLK";
  attribute X_INTERFACE_PARAMETER of afe_clk_n : signal is "XIL_INTERFACENAME CLK.AFE_CLK_N, CLK_DOMAIN edt_zcu106_clk_wiz_0_clk_out1, FREQ_HZ 80200312, INSERT_VIP 0, PHASE 0.0";
  attribute X_INTERFACE_INFO of afe_clk_p : signal is "xilinx.com:signal:clock:1.0 CLK.AFE_CLK_P CLK";
  attribute X_INTERFACE_PARAMETER of afe_clk_p : signal is "XIL_INTERFACENAME CLK.AFE_CLK_P, CLK_DOMAIN edt_zcu106_clk_wiz_0_clk_out1, FREQ_HZ 80200312, INSERT_VIP 0, PHASE 0.0";
  attribute X_INTERFACE_INFO of csn_clk_0 : signal is "xilinx.com:signal:clock:1.0 CLK.CSN_CLK_0 CLK";
  attribute X_INTERFACE_PARAMETER of csn_clk_0 : signal is "XIL_INTERFACENAME CLK.CSN_CLK_0, CLK_DOMAIN edt_zcu106_ad5424_axi4_0_0_csn_clk, FREQ_HZ 100000000, INSERT_VIP 0, PHASE 0.000";
  attribute X_INTERFACE_INFO of tx_trig_out_n : signal is "xilinx.com:signal:clock:1.0 CLK.TX_TRIG_OUT_N CLK";
  attribute X_INTERFACE_PARAMETER of tx_trig_out_n : signal is "XIL_INTERFACENAME CLK.TX_TRIG_OUT_N, CLK_DOMAIN edt_zcu106_tx_trig_in, FREQ_HZ 39915362, INSERT_VIP 0, PHASE 0.0";
  attribute X_INTERFACE_INFO of tx_trig_out_p : signal is "xilinx.com:signal:clock:1.0 CLK.TX_TRIG_OUT_P CLK";
  attribute X_INTERFACE_PARAMETER of tx_trig_out_p : signal is "XIL_INTERFACENAME CLK.TX_TRIG_OUT_P, CLK_DOMAIN edt_zcu106_tx_trig_in, FREQ_HZ 39915362, INSERT_VIP 0, PHASE 0.0";
begin
  afe0_csn <= zynq_ultra_ps_e_0_emio_spi0_ss_o_n;
  afe1_csn <= zynq_ultra_ps_e_0_emio_spi0_ss1_o_n;
  afe_clk_n(0) <= AFE_CLK_BUF_OBUF_DS_N(0);
  afe_clk_p(0) <= AFE_CLK_BUF_OBUF_DS_P(0);
  afe_sck <= zynq_ultra_ps_e_0_emio_spi0_sclk_o;
  csn_clk_0(1 downto 0) <= ad5424_axi4_0_csn_clk(1 downto 0);
  data_0(7 downto 0) <= ad5424_axi4_0_data(7 downto 0);
  leds(4 downto 0) <= xlslice_leds_Dout(4 downto 0);
  lvds_data_n_0_1(7 downto 0) <= lvds_data_n_0(7 downto 0);
  lvds_data_n_1_1(7 downto 0) <= lvds_data_n_1(7 downto 0);
  lvds_data_p_0_1(7 downto 0) <= lvds_data_p_0(7 downto 0);
  lvds_data_p_1_1(7 downto 0) <= lvds_data_p_1(7 downto 0);
  lvds_dco_n_0_1 <= lvds_dco_n_0;
  lvds_dco_n_1_1 <= lvds_dco_n_1;
  lvds_dco_p_0_1 <= lvds_dco_p_0;
  lvds_dco_p_1_1 <= lvds_dco_p_1;
  lvds_fco_n_0_1 <= lvds_fco_n_0;
  lvds_fco_n_1_1 <= lvds_fco_n_1;
  lvds_fco_p_0_1 <= lvds_fco_p_0;
  lvds_fco_p_1_1 <= lvds_fco_p_1;
  neg_0(3 downto 0) <= hv7321_axi4_0_neg(3 downto 0);
  neg_1(3 downto 0) <= hv7321_axi4_1_neg(3 downto 0);
  neg_2(3 downto 0) <= hv7321_axi4_2_neg(3 downto 0);
  neg_3(3 downto 0) <= hv7321_axi4_3_neg(3 downto 0);
  oen <= util_reduced_logic_1_Res;
  otp_n_0_1 <= otp_n;
  out_clk_0 <= hv7321_axi4_0_out_clk;
  out_clk_1 <= hv7321_axi4_1_out_clk;
  out_clk_2 <= hv7321_axi4_2_out_clk;
  out_clk_3 <= hv7321_axi4_3_out_clk;
  pmod0(7 downto 0) <= xlslice_debug_out_Dout(7 downto 0);
  pmod1(4 downto 0) <= xlslice_pmod1_Dout(4 downto 0);
  pos_0(3 downto 0) <= hv7321_axi4_0_pos(3 downto 0);
  pos_1(3 downto 0) <= hv7321_axi4_1_pos(3 downto 0);
  pos_2(3 downto 0) <= hv7321_axi4_2_pos(3 downto 0);
  pos_3(3 downto 0) <= hv7321_axi4_3_pos(3 downto 0);
  ren <= util_reduced_logic_0_Res;
  rx_0 <= RX01_OR_Res;
  rx_1 <= RX23_OR_Res;
  sel_0(3 downto 0) <= hv7321_axi4_0_sel(3 downto 0);
  sel_1(3 downto 0) <= hv7321_axi4_1_sel(3 downto 0);
  sel_2(3 downto 0) <= hv7321_axi4_2_sel(3 downto 0);
  sel_3(3 downto 0) <= hv7321_axi4_3_sel(3 downto 0);
  tx_0 <= hv7321_axi4_0_tx;
  tx_trig_out_n(0) <= TRIG_BUF_OBUF_DS_N(0);
  tx_trig_out_p(0) <= TRIG_BUF_OBUF_DS_P(0);
AFE_CLK_BUF: component edt_zcu106_util_ds_buf_0_1
     port map (
      OBUF_DS_N(0) => AFE_CLK_BUF_OBUF_DS_N(0),
      OBUF_DS_P(0) => AFE_CLK_BUF_OBUF_DS_P(0),
      OBUF_IN(0) => System_Clock_Sources_clk_out3
    );
AFE_SDIO_BUF: component edt_zcu106_util_ds_buf_0_0
     port map (
      IOBUF_IO_I(0) => zynq_ultra_ps_e_0_emio_spi0_m_o,
      IOBUF_IO_IO(0) => afe_sdio(0),
      IOBUF_IO_O(0) => AFE_SDIO_BUF_IOBUF_IO_O(0),
      IOBUF_IO_T(0) => xlslice_0_Dout(0)
    );
DAC_START_CONCAT: component edt_zcu106_RX01_CONCAT_0
     port map (
      In0(0) => xlslice_pulser_start1_Dout(0),
      In1(0) => hv7321_axi4_0_rx,
      dout(1 downto 0) => DAC_START_CONCAT_dout(1 downto 0)
    );
DAC_START_OR: component edt_zcu106_DAC_START_OR_0
     port map (
      Op1(1 downto 0) => DAC_START_CONCAT_dout(1 downto 0),
      Res => TRIG_OR1_Res
    );
OEN_CONCAT: component edt_zcu106_xlconcat_1_0
     port map (
      In0(0) => hv7321_axi4_0_oen,
      In1(0) => hv7321_axi4_1_oen,
      In2(0) => hv7321_axi4_2_oen,
      In3(0) => hv7321_axi4_3_oen,
      dout(3 downto 0) => OEN_CONCAT_dout(3 downto 0)
    );
OEN_OR: component edt_zcu106_util_reduced_logic_0_1
     port map (
      Op1(3 downto 0) => OEN_CONCAT_dout(3 downto 0),
      Res => util_reduced_logic_1_Res
    );
REN_CONCAT: component edt_zcu106_xlconcat_0_1
     port map (
      In0(0) => hv7321_axi4_0_ren,
      In1(0) => hv7321_axi4_1_ren,
      In2(0) => hv7321_axi4_2_ren,
      In3(0) => hv7321_axi4_3_ren,
      dout(3 downto 0) => REN_CONCAT_dout(3 downto 0)
    );
REN_OR: component edt_zcu106_util_reduced_logic_0_0
     port map (
      Op1(3 downto 0) => REN_CONCAT_dout(3 downto 0),
      Res => util_reduced_logic_0_Res
    );
RX01_CONCAT: component edt_zcu106_RX01_CONCAT_1
     port map (
      In0(0) => hv7321_axi4_0_rx,
      In1(0) => hv7321_axi4_1_rx,
      dout(1 downto 0) => REN01_CONCAT_dout(1 downto 0)
    );
RX01_OR: component edt_zcu106_RX01_OR_1
     port map (
      Op1(1 downto 0) => REN01_CONCAT_dout(1 downto 0),
      Res => RX01_OR_Res
    );
RX23_CONCAT: component edt_zcu106_RX23_CONCAT_0
     port map (
      In0(0) => hv7321_axi4_2_rx,
      In1(0) => hv7321_axi4_3_rx,
      dout(1 downto 0) => REN01_CONCAT_dout1(1 downto 0)
    );
RX23_OR: component edt_zcu106_RX01_OR_0
     port map (
      Op1(1 downto 0) => REN01_CONCAT_dout1(1 downto 0),
      Res => RX23_OR_Res
    );
System_Clock_Sources: component edt_zcu106_clk_wiz_0
     port map (
      clk_in1 => zynq_ultra_ps_e_0_pl_clk0,
      clk_out1 => clk_wiz_clk_out1,
      clk_out2 => System_Clock_Sources_clk_out2,
      clk_out3 => System_Clock_Sources_clk_out3,
      clk_out3_ce => xlslice_adc_enable_Dout(0),
      locked => NLW_System_Clock_Sources_locked_UNCONNECTED,
      reset => rst_ps8_0_99M_peripheral_reset(0)
    );
TRIG_BUF: component edt_zcu106_AFE_CLK_BUF_0
     port map (
      OBUF_DS_N(0) => TRIG_BUF_OBUF_DS_N(0),
      OBUF_DS_P(0) => TRIG_BUF_OBUF_DS_P(0),
      OBUF_IN(0) => TRIG_OR_Res
    );
TRIG_OR: component edt_zcu106_util_reduced_logic_0_2
     port map (
      Op1(1 downto 0) => xlconcat_1_dout(1 downto 0),
      Res => TRIG_OR_Res
    );
Zero: component edt_zcu106_xlconstant_0_0
     port map (
      dout(0) => Zero_dout(0)
    );
ad5424_axi4_0: component edt_zcu106_ad5424_axi4_0_0
     port map (
      S_AXI_ACLK => zynq_ultra_ps_e_0_pl_clk0,
      S_AXI_ARADDR(10 downto 0) => ps8_0_axi_periph_M01_AXI_ARADDR(10 downto 0),
      S_AXI_ARESETN => rst_ps8_0_99M_peripheral_aresetn(0),
      S_AXI_ARPROT(2 downto 0) => ps8_0_axi_periph_M01_AXI_ARPROT(2 downto 0),
      S_AXI_ARREADY => ps8_0_axi_periph_M01_AXI_ARREADY,
      S_AXI_ARVALID => ps8_0_axi_periph_M01_AXI_ARVALID,
      S_AXI_AWADDR(10 downto 0) => ps8_0_axi_periph_M01_AXI_AWADDR(10 downto 0),
      S_AXI_AWPROT(2 downto 0) => ps8_0_axi_periph_M01_AXI_AWPROT(2 downto 0),
      S_AXI_AWREADY => ps8_0_axi_periph_M01_AXI_AWREADY,
      S_AXI_AWVALID => ps8_0_axi_periph_M01_AXI_AWVALID,
      S_AXI_BREADY => ps8_0_axi_periph_M01_AXI_BREADY,
      S_AXI_BRESP(1 downto 0) => ps8_0_axi_periph_M01_AXI_BRESP(1 downto 0),
      S_AXI_BVALID => ps8_0_axi_periph_M01_AXI_BVALID,
      S_AXI_RDATA(31 downto 0) => ps8_0_axi_periph_M01_AXI_RDATA(31 downto 0),
      S_AXI_RREADY => ps8_0_axi_periph_M01_AXI_RREADY,
      S_AXI_RRESP(1 downto 0) => ps8_0_axi_periph_M01_AXI_RRESP(1 downto 0),
      S_AXI_RVALID => ps8_0_axi_periph_M01_AXI_RVALID,
      S_AXI_WDATA(31 downto 0) => ps8_0_axi_periph_M01_AXI_WDATA(31 downto 0),
      S_AXI_WREADY => ps8_0_axi_periph_M01_AXI_WREADY,
      S_AXI_WSTRB(3 downto 0) => ps8_0_axi_periph_M01_AXI_WSTRB(3 downto 0),
      S_AXI_WVALID => ps8_0_axi_periph_M01_AXI_WVALID,
      csn_clk(1 downto 0) => ad5424_axi4_0_csn_clk(1 downto 0),
      data(7 downto 0) => ad5424_axi4_0_data(7 downto 0),
      src_clk => System_Clock_Sources_clk_out2,
      start => TRIG_OR1_Res
    );
ad9670_axi4_0: component edt_zcu106_ad9670_axi4_0_0
     port map (
      S_AXI_ACLK => zynq_ultra_ps_e_0_pl_clk0,
      S_AXI_ARADDR(3 downto 0) => ps8_0_axi_periph_M02_AXI_ARADDR(3 downto 0),
      S_AXI_ARESETN => rst_ps8_0_99M_peripheral_aresetn(0),
      S_AXI_ARPROT(2 downto 0) => ps8_0_axi_periph_M02_AXI_ARPROT(2 downto 0),
      S_AXI_ARREADY => ps8_0_axi_periph_M02_AXI_ARREADY,
      S_AXI_ARVALID => ps8_0_axi_periph_M02_AXI_ARVALID,
      S_AXI_AWADDR(3 downto 0) => ps8_0_axi_periph_M02_AXI_AWADDR(3 downto 0),
      S_AXI_AWPROT(2 downto 0) => ps8_0_axi_periph_M02_AXI_AWPROT(2 downto 0),
      S_AXI_AWREADY => ps8_0_axi_periph_M02_AXI_AWREADY,
      S_AXI_AWVALID => ps8_0_axi_periph_M02_AXI_AWVALID,
      S_AXI_BREADY => ps8_0_axi_periph_M02_AXI_BREADY,
      S_AXI_BRESP(1 downto 0) => ps8_0_axi_periph_M02_AXI_BRESP(1 downto 0),
      S_AXI_BVALID => ps8_0_axi_periph_M02_AXI_BVALID,
      S_AXI_RDATA(31 downto 0) => ps8_0_axi_periph_M02_AXI_RDATA(31 downto 0),
      S_AXI_RREADY => ps8_0_axi_periph_M02_AXI_RREADY,
      S_AXI_RRESP(1 downto 0) => ps8_0_axi_periph_M02_AXI_RRESP(1 downto 0),
      S_AXI_RVALID => ps8_0_axi_periph_M02_AXI_RVALID,
      S_AXI_WDATA(31 downto 0) => ps8_0_axi_periph_M02_AXI_WDATA(31 downto 0),
      S_AXI_WREADY => ps8_0_axi_periph_M02_AXI_WREADY,
      S_AXI_WSTRB(3 downto 0) => ps8_0_axi_periph_M02_AXI_WSTRB(3 downto 0),
      S_AXI_WVALID => ps8_0_axi_periph_M02_AXI_WVALID,
      enable => xlslice_adc_enable_Dout(0),
      lvds_data_n(7 downto 0) => lvds_data_n_0_1(7 downto 0),
      lvds_data_p(7 downto 0) => lvds_data_p_0_1(7 downto 0),
      lvds_dco_n => lvds_dco_n_0_1,
      lvds_dco_p => lvds_dco_p_0_1,
      lvds_fco_n => lvds_fco_n_0_1,
      lvds_fco_p => lvds_fco_p_0_1,
      m_axis_aclk => zynq_ultra_ps_e_0_pl_clk0,
      m_axis_tdata(127 downto 0) => ad9670_axi4_0_m_axis_TDATA(127 downto 0),
      m_axis_tkeep(15 downto 0) => ad9670_axi4_0_m_axis_TKEEP(15 downto 0),
      m_axis_tlast => ad9670_axi4_0_m_axis_TLAST,
      m_axis_tready => ad9670_axi4_0_m_axis_TREADY,
      m_axis_tvalid => ad9670_axi4_0_m_axis_TVALID,
      tx_nrx => hv7321_axi4_0_tx,
      tx_trig => ad9670_axi4_0_tx_trig
    );
ad9670_axi4_1: component edt_zcu106_ad9670_axi4_0_1
     port map (
      S_AXI_ACLK => zynq_ultra_ps_e_0_pl_clk0,
      S_AXI_ARADDR(3 downto 0) => ps8_0_axi_periph_M04_AXI_ARADDR(3 downto 0),
      S_AXI_ARESETN => rst_ps8_0_99M_peripheral_aresetn(0),
      S_AXI_ARPROT(2 downto 0) => ps8_0_axi_periph_M04_AXI_ARPROT(2 downto 0),
      S_AXI_ARREADY => ps8_0_axi_periph_M04_AXI_ARREADY,
      S_AXI_ARVALID => ps8_0_axi_periph_M04_AXI_ARVALID,
      S_AXI_AWADDR(3 downto 0) => ps8_0_axi_periph_M04_AXI_AWADDR(3 downto 0),
      S_AXI_AWPROT(2 downto 0) => ps8_0_axi_periph_M04_AXI_AWPROT(2 downto 0),
      S_AXI_AWREADY => ps8_0_axi_periph_M04_AXI_AWREADY,
      S_AXI_AWVALID => ps8_0_axi_periph_M04_AXI_AWVALID,
      S_AXI_BREADY => ps8_0_axi_periph_M04_AXI_BREADY,
      S_AXI_BRESP(1 downto 0) => ps8_0_axi_periph_M04_AXI_BRESP(1 downto 0),
      S_AXI_BVALID => ps8_0_axi_periph_M04_AXI_BVALID,
      S_AXI_RDATA(31 downto 0) => ps8_0_axi_periph_M04_AXI_RDATA(31 downto 0),
      S_AXI_RREADY => ps8_0_axi_periph_M04_AXI_RREADY,
      S_AXI_RRESP(1 downto 0) => ps8_0_axi_periph_M04_AXI_RRESP(1 downto 0),
      S_AXI_RVALID => ps8_0_axi_periph_M04_AXI_RVALID,
      S_AXI_WDATA(31 downto 0) => ps8_0_axi_periph_M04_AXI_WDATA(31 downto 0),
      S_AXI_WREADY => ps8_0_axi_periph_M04_AXI_WREADY,
      S_AXI_WSTRB(3 downto 0) => ps8_0_axi_periph_M04_AXI_WSTRB(3 downto 0),
      S_AXI_WVALID => ps8_0_axi_periph_M04_AXI_WVALID,
      enable => xlslice_adc_enable_Dout(0),
      lvds_data_n(7 downto 0) => lvds_data_n_1_1(7 downto 0),
      lvds_data_p(7 downto 0) => lvds_data_p_1_1(7 downto 0),
      lvds_dco_n => lvds_dco_n_1_1,
      lvds_dco_p => lvds_dco_p_1_1,
      lvds_fco_n => lvds_fco_n_1_1,
      lvds_fco_p => lvds_fco_p_1_1,
      m_axis_aclk => zynq_ultra_ps_e_0_pl_clk0,
      m_axis_tdata(127 downto 0) => ad9670_axi4_1_m_axis_TDATA(127 downto 0),
      m_axis_tkeep(15 downto 0) => ad9670_axi4_1_m_axis_TKEEP(15 downto 0),
      m_axis_tlast => ad9670_axi4_1_m_axis_TLAST,
      m_axis_tready => ad9670_axi4_1_m_axis_TREADY,
      m_axis_tvalid => ad9670_axi4_1_m_axis_TVALID,
      tx_nrx => hv7321_axi4_0_tx,
      tx_trig => ad9670_axi4_1_tx_trig
    );
axi_dma_0: component edt_zcu106_axi_dma_0_0
     port map (
      axi_resetn => rst_ps8_0_99M_peripheral_aresetn(0),
      m_axi_s2mm_aclk => zynq_ultra_ps_e_0_pl_clk0,
      m_axi_s2mm_awaddr(31 downto 0) => axi_dma_0_M_AXI_S2MM_AWADDR(31 downto 0),
      m_axi_s2mm_awburst(1 downto 0) => axi_dma_0_M_AXI_S2MM_AWBURST(1 downto 0),
      m_axi_s2mm_awcache(3 downto 0) => axi_dma_0_M_AXI_S2MM_AWCACHE(3 downto 0),
      m_axi_s2mm_awlen(7 downto 0) => axi_dma_0_M_AXI_S2MM_AWLEN(7 downto 0),
      m_axi_s2mm_awprot(2 downto 0) => axi_dma_0_M_AXI_S2MM_AWPROT(2 downto 0),
      m_axi_s2mm_awready => axi_dma_0_M_AXI_S2MM_AWREADY,
      m_axi_s2mm_awsize(2 downto 0) => axi_dma_0_M_AXI_S2MM_AWSIZE(2 downto 0),
      m_axi_s2mm_awvalid => axi_dma_0_M_AXI_S2MM_AWVALID,
      m_axi_s2mm_bready => axi_dma_0_M_AXI_S2MM_BREADY,
      m_axi_s2mm_bresp(1 downto 0) => axi_dma_0_M_AXI_S2MM_BRESP(1 downto 0),
      m_axi_s2mm_bvalid => axi_dma_0_M_AXI_S2MM_BVALID,
      m_axi_s2mm_wdata(127 downto 0) => axi_dma_0_M_AXI_S2MM_WDATA(127 downto 0),
      m_axi_s2mm_wlast => axi_dma_0_M_AXI_S2MM_WLAST,
      m_axi_s2mm_wready => axi_dma_0_M_AXI_S2MM_WREADY,
      m_axi_s2mm_wstrb(15 downto 0) => axi_dma_0_M_AXI_S2MM_WSTRB(15 downto 0),
      m_axi_s2mm_wvalid => axi_dma_0_M_AXI_S2MM_WVALID,
      m_axi_sg_aclk => zynq_ultra_ps_e_0_pl_clk0,
      m_axi_sg_araddr(31 downto 0) => axi_dma_0_M_AXI_SG_ARADDR(31 downto 0),
      m_axi_sg_arburst(1 downto 0) => axi_dma_0_M_AXI_SG_ARBURST(1 downto 0),
      m_axi_sg_arcache(3 downto 0) => axi_dma_0_M_AXI_SG_ARCACHE(3 downto 0),
      m_axi_sg_arlen(7 downto 0) => axi_dma_0_M_AXI_SG_ARLEN(7 downto 0),
      m_axi_sg_arprot(2 downto 0) => axi_dma_0_M_AXI_SG_ARPROT(2 downto 0),
      m_axi_sg_arready => axi_dma_0_M_AXI_SG_ARREADY,
      m_axi_sg_arsize(2 downto 0) => axi_dma_0_M_AXI_SG_ARSIZE(2 downto 0),
      m_axi_sg_arvalid => axi_dma_0_M_AXI_SG_ARVALID,
      m_axi_sg_awaddr(31 downto 0) => axi_dma_0_M_AXI_SG_AWADDR(31 downto 0),
      m_axi_sg_awburst(1 downto 0) => axi_dma_0_M_AXI_SG_AWBURST(1 downto 0),
      m_axi_sg_awcache(3 downto 0) => axi_dma_0_M_AXI_SG_AWCACHE(3 downto 0),
      m_axi_sg_awlen(7 downto 0) => axi_dma_0_M_AXI_SG_AWLEN(7 downto 0),
      m_axi_sg_awprot(2 downto 0) => axi_dma_0_M_AXI_SG_AWPROT(2 downto 0),
      m_axi_sg_awready => axi_dma_0_M_AXI_SG_AWREADY,
      m_axi_sg_awsize(2 downto 0) => axi_dma_0_M_AXI_SG_AWSIZE(2 downto 0),
      m_axi_sg_awvalid => axi_dma_0_M_AXI_SG_AWVALID,
      m_axi_sg_bready => axi_dma_0_M_AXI_SG_BREADY,
      m_axi_sg_bresp(1 downto 0) => axi_dma_0_M_AXI_SG_BRESP(1 downto 0),
      m_axi_sg_bvalid => axi_dma_0_M_AXI_SG_BVALID,
      m_axi_sg_rdata(31 downto 0) => axi_dma_0_M_AXI_SG_RDATA(31 downto 0),
      m_axi_sg_rlast => axi_dma_0_M_AXI_SG_RLAST,
      m_axi_sg_rready => axi_dma_0_M_AXI_SG_RREADY,
      m_axi_sg_rresp(1 downto 0) => axi_dma_0_M_AXI_SG_RRESP(1 downto 0),
      m_axi_sg_rvalid => axi_dma_0_M_AXI_SG_RVALID,
      m_axi_sg_wdata(31 downto 0) => axi_dma_0_M_AXI_SG_WDATA(31 downto 0),
      m_axi_sg_wlast => axi_dma_0_M_AXI_SG_WLAST,
      m_axi_sg_wready => axi_dma_0_M_AXI_SG_WREADY,
      m_axi_sg_wstrb(3 downto 0) => axi_dma_0_M_AXI_SG_WSTRB(3 downto 0),
      m_axi_sg_wvalid => axi_dma_0_M_AXI_SG_WVALID,
      s2mm_introut => axi_dma_0_s2mm_introut,
      s2mm_prmry_reset_out_n => NLW_axi_dma_0_s2mm_prmry_reset_out_n_UNCONNECTED,
      s_axi_lite_aclk => zynq_ultra_ps_e_0_pl_clk0,
      s_axi_lite_araddr(9 downto 0) => ps8_0_axi_periph_M03_AXI_ARADDR(9 downto 0),
      s_axi_lite_arready => ps8_0_axi_periph_M03_AXI_ARREADY,
      s_axi_lite_arvalid => ps8_0_axi_periph_M03_AXI_ARVALID,
      s_axi_lite_awaddr(9 downto 0) => ps8_0_axi_periph_M03_AXI_AWADDR(9 downto 0),
      s_axi_lite_awready => ps8_0_axi_periph_M03_AXI_AWREADY,
      s_axi_lite_awvalid => ps8_0_axi_periph_M03_AXI_AWVALID,
      s_axi_lite_bready => ps8_0_axi_periph_M03_AXI_BREADY,
      s_axi_lite_bresp(1 downto 0) => ps8_0_axi_periph_M03_AXI_BRESP(1 downto 0),
      s_axi_lite_bvalid => ps8_0_axi_periph_M03_AXI_BVALID,
      s_axi_lite_rdata(31 downto 0) => ps8_0_axi_periph_M03_AXI_RDATA(31 downto 0),
      s_axi_lite_rready => ps8_0_axi_periph_M03_AXI_RREADY,
      s_axi_lite_rresp(1 downto 0) => ps8_0_axi_periph_M03_AXI_RRESP(1 downto 0),
      s_axi_lite_rvalid => ps8_0_axi_periph_M03_AXI_RVALID,
      s_axi_lite_wdata(31 downto 0) => ps8_0_axi_periph_M03_AXI_WDATA(31 downto 0),
      s_axi_lite_wready => ps8_0_axi_periph_M03_AXI_WREADY,
      s_axi_lite_wvalid => ps8_0_axi_periph_M03_AXI_WVALID,
      s_axis_s2mm_tdata(127 downto 0) => ad9670_axi4_0_m_axis_TDATA(127 downto 0),
      s_axis_s2mm_tkeep(15 downto 0) => ad9670_axi4_0_m_axis_TKEEP(15 downto 0),
      s_axis_s2mm_tlast => ad9670_axi4_0_m_axis_TLAST,
      s_axis_s2mm_tready => ad9670_axi4_0_m_axis_TREADY,
      s_axis_s2mm_tvalid => ad9670_axi4_0_m_axis_TVALID
    );
axi_dma_1: component edt_zcu106_axi_dma_0_1
     port map (
      axi_resetn => rst_ps8_0_99M_peripheral_aresetn(0),
      m_axi_s2mm_aclk => zynq_ultra_ps_e_0_pl_clk0,
      m_axi_s2mm_awaddr(31 downto 0) => axi_dma_1_M_AXI_S2MM_AWADDR(31 downto 0),
      m_axi_s2mm_awburst(1 downto 0) => axi_dma_1_M_AXI_S2MM_AWBURST(1 downto 0),
      m_axi_s2mm_awcache(3 downto 0) => axi_dma_1_M_AXI_S2MM_AWCACHE(3 downto 0),
      m_axi_s2mm_awlen(7 downto 0) => axi_dma_1_M_AXI_S2MM_AWLEN(7 downto 0),
      m_axi_s2mm_awprot(2 downto 0) => axi_dma_1_M_AXI_S2MM_AWPROT(2 downto 0),
      m_axi_s2mm_awready => axi_dma_1_M_AXI_S2MM_AWREADY,
      m_axi_s2mm_awsize(2 downto 0) => axi_dma_1_M_AXI_S2MM_AWSIZE(2 downto 0),
      m_axi_s2mm_awvalid => axi_dma_1_M_AXI_S2MM_AWVALID,
      m_axi_s2mm_bready => axi_dma_1_M_AXI_S2MM_BREADY,
      m_axi_s2mm_bresp(1 downto 0) => axi_dma_1_M_AXI_S2MM_BRESP(1 downto 0),
      m_axi_s2mm_bvalid => axi_dma_1_M_AXI_S2MM_BVALID,
      m_axi_s2mm_wdata(127 downto 0) => axi_dma_1_M_AXI_S2MM_WDATA(127 downto 0),
      m_axi_s2mm_wlast => axi_dma_1_M_AXI_S2MM_WLAST,
      m_axi_s2mm_wready => axi_dma_1_M_AXI_S2MM_WREADY,
      m_axi_s2mm_wstrb(15 downto 0) => axi_dma_1_M_AXI_S2MM_WSTRB(15 downto 0),
      m_axi_s2mm_wvalid => axi_dma_1_M_AXI_S2MM_WVALID,
      m_axi_sg_aclk => zynq_ultra_ps_e_0_pl_clk0,
      m_axi_sg_araddr(31 downto 0) => axi_dma_1_M_AXI_SG_ARADDR(31 downto 0),
      m_axi_sg_arburst(1 downto 0) => axi_dma_1_M_AXI_SG_ARBURST(1 downto 0),
      m_axi_sg_arcache(3 downto 0) => axi_dma_1_M_AXI_SG_ARCACHE(3 downto 0),
      m_axi_sg_arlen(7 downto 0) => axi_dma_1_M_AXI_SG_ARLEN(7 downto 0),
      m_axi_sg_arprot(2 downto 0) => axi_dma_1_M_AXI_SG_ARPROT(2 downto 0),
      m_axi_sg_arready => axi_dma_1_M_AXI_SG_ARREADY,
      m_axi_sg_arsize(2 downto 0) => axi_dma_1_M_AXI_SG_ARSIZE(2 downto 0),
      m_axi_sg_arvalid => axi_dma_1_M_AXI_SG_ARVALID,
      m_axi_sg_awaddr(31 downto 0) => axi_dma_1_M_AXI_SG_AWADDR(31 downto 0),
      m_axi_sg_awburst(1 downto 0) => axi_dma_1_M_AXI_SG_AWBURST(1 downto 0),
      m_axi_sg_awcache(3 downto 0) => axi_dma_1_M_AXI_SG_AWCACHE(3 downto 0),
      m_axi_sg_awlen(7 downto 0) => axi_dma_1_M_AXI_SG_AWLEN(7 downto 0),
      m_axi_sg_awprot(2 downto 0) => axi_dma_1_M_AXI_SG_AWPROT(2 downto 0),
      m_axi_sg_awready => axi_dma_1_M_AXI_SG_AWREADY,
      m_axi_sg_awsize(2 downto 0) => axi_dma_1_M_AXI_SG_AWSIZE(2 downto 0),
      m_axi_sg_awvalid => axi_dma_1_M_AXI_SG_AWVALID,
      m_axi_sg_bready => axi_dma_1_M_AXI_SG_BREADY,
      m_axi_sg_bresp(1 downto 0) => axi_dma_1_M_AXI_SG_BRESP(1 downto 0),
      m_axi_sg_bvalid => axi_dma_1_M_AXI_SG_BVALID,
      m_axi_sg_rdata(31 downto 0) => axi_dma_1_M_AXI_SG_RDATA(31 downto 0),
      m_axi_sg_rlast => axi_dma_1_M_AXI_SG_RLAST,
      m_axi_sg_rready => axi_dma_1_M_AXI_SG_RREADY,
      m_axi_sg_rresp(1 downto 0) => axi_dma_1_M_AXI_SG_RRESP(1 downto 0),
      m_axi_sg_rvalid => axi_dma_1_M_AXI_SG_RVALID,
      m_axi_sg_wdata(31 downto 0) => axi_dma_1_M_AXI_SG_WDATA(31 downto 0),
      m_axi_sg_wlast => axi_dma_1_M_AXI_SG_WLAST,
      m_axi_sg_wready => axi_dma_1_M_AXI_SG_WREADY,
      m_axi_sg_wstrb(3 downto 0) => axi_dma_1_M_AXI_SG_WSTRB(3 downto 0),
      m_axi_sg_wvalid => axi_dma_1_M_AXI_SG_WVALID,
      s2mm_introut => axi_dma_1_s2mm_introut,
      s2mm_prmry_reset_out_n => NLW_axi_dma_1_s2mm_prmry_reset_out_n_UNCONNECTED,
      s_axi_lite_aclk => zynq_ultra_ps_e_0_pl_clk0,
      s_axi_lite_araddr(9 downto 0) => ps8_0_axi_periph_M05_AXI_ARADDR(9 downto 0),
      s_axi_lite_arready => ps8_0_axi_periph_M05_AXI_ARREADY,
      s_axi_lite_arvalid => ps8_0_axi_periph_M05_AXI_ARVALID,
      s_axi_lite_awaddr(9 downto 0) => ps8_0_axi_periph_M05_AXI_AWADDR(9 downto 0),
      s_axi_lite_awready => ps8_0_axi_periph_M05_AXI_AWREADY,
      s_axi_lite_awvalid => ps8_0_axi_periph_M05_AXI_AWVALID,
      s_axi_lite_bready => ps8_0_axi_periph_M05_AXI_BREADY,
      s_axi_lite_bresp(1 downto 0) => ps8_0_axi_periph_M05_AXI_BRESP(1 downto 0),
      s_axi_lite_bvalid => ps8_0_axi_periph_M05_AXI_BVALID,
      s_axi_lite_rdata(31 downto 0) => ps8_0_axi_periph_M05_AXI_RDATA(31 downto 0),
      s_axi_lite_rready => ps8_0_axi_periph_M05_AXI_RREADY,
      s_axi_lite_rresp(1 downto 0) => ps8_0_axi_periph_M05_AXI_RRESP(1 downto 0),
      s_axi_lite_rvalid => ps8_0_axi_periph_M05_AXI_RVALID,
      s_axi_lite_wdata(31 downto 0) => ps8_0_axi_periph_M05_AXI_WDATA(31 downto 0),
      s_axi_lite_wready => ps8_0_axi_periph_M05_AXI_WREADY,
      s_axi_lite_wvalid => ps8_0_axi_periph_M05_AXI_WVALID,
      s_axis_s2mm_tdata(127 downto 0) => ad9670_axi4_1_m_axis_TDATA(127 downto 0),
      s_axis_s2mm_tkeep(15 downto 0) => ad9670_axi4_1_m_axis_TKEEP(15 downto 0),
      s_axis_s2mm_tlast => ad9670_axi4_1_m_axis_TLAST,
      s_axis_s2mm_tready => ad9670_axi4_1_m_axis_TREADY,
      s_axis_s2mm_tvalid => ad9670_axi4_1_m_axis_TVALID
    );
hv7321_axi4_0: component edt_zcu106_hv7321_axi4_0_0
     port map (
      S_AXI_ACLK => zynq_ultra_ps_e_0_pl_clk0,
      S_AXI_ARADDR(9 downto 0) => ps8_0_axi_periph_M00_AXI_ARADDR(9 downto 0),
      S_AXI_ARESETN => rst_ps8_0_99M_peripheral_aresetn(0),
      S_AXI_ARPROT(2 downto 0) => ps8_0_axi_periph_M00_AXI_ARPROT(2 downto 0),
      S_AXI_ARREADY => ps8_0_axi_periph_M00_AXI_ARREADY,
      S_AXI_ARVALID => ps8_0_axi_periph_M00_AXI_ARVALID,
      S_AXI_AWADDR(9 downto 0) => ps8_0_axi_periph_M00_AXI_AWADDR(9 downto 0),
      S_AXI_AWPROT(2 downto 0) => ps8_0_axi_periph_M00_AXI_AWPROT(2 downto 0),
      S_AXI_AWREADY => ps8_0_axi_periph_M00_AXI_AWREADY,
      S_AXI_AWVALID => ps8_0_axi_periph_M00_AXI_AWVALID,
      S_AXI_BREADY => ps8_0_axi_periph_M00_AXI_BREADY,
      S_AXI_BRESP(1 downto 0) => ps8_0_axi_periph_M00_AXI_BRESP(1 downto 0),
      S_AXI_BVALID => ps8_0_axi_periph_M00_AXI_BVALID,
      S_AXI_RDATA(31 downto 0) => ps8_0_axi_periph_M00_AXI_RDATA(31 downto 0),
      S_AXI_RREADY => ps8_0_axi_periph_M00_AXI_RREADY,
      S_AXI_RRESP(1 downto 0) => ps8_0_axi_periph_M00_AXI_RRESP(1 downto 0),
      S_AXI_RVALID => ps8_0_axi_periph_M00_AXI_RVALID,
      S_AXI_WDATA(31 downto 0) => ps8_0_axi_periph_M00_AXI_WDATA(31 downto 0),
      S_AXI_WREADY => ps8_0_axi_periph_M00_AXI_WREADY,
      S_AXI_WSTRB(3 downto 0) => ps8_0_axi_periph_M00_AXI_WSTRB(3 downto 0),
      S_AXI_WVALID => ps8_0_axi_periph_M00_AXI_WVALID,
      neg(3 downto 0) => hv7321_axi4_0_neg(3 downto 0),
      oen => hv7321_axi4_0_oen,
      otp_n => otp_n_0_1,
      out_clk => hv7321_axi4_0_out_clk,
      pos(3 downto 0) => hv7321_axi4_0_pos(3 downto 0),
      ren => hv7321_axi4_0_ren,
      rx => hv7321_axi4_0_rx,
      rx_done => Zero_dout(0),
      sel(3 downto 0) => hv7321_axi4_0_sel(3 downto 0),
      src_clk => clk_wiz_clk_out1,
      start => start_0_1(0),
      tx => hv7321_axi4_0_tx
    );
hv7321_axi4_1: component edt_zcu106_hv7321_axi4_0_1
     port map (
      S_AXI_ACLK => zynq_ultra_ps_e_0_pl_clk0,
      S_AXI_ARADDR(9 downto 0) => ps8_0_axi_periph_M06_AXI_ARADDR(9 downto 0),
      S_AXI_ARESETN => rst_ps8_0_99M_peripheral_aresetn(0),
      S_AXI_ARPROT(2 downto 0) => ps8_0_axi_periph_M06_AXI_ARPROT(2 downto 0),
      S_AXI_ARREADY => ps8_0_axi_periph_M06_AXI_ARREADY,
      S_AXI_ARVALID => ps8_0_axi_periph_M06_AXI_ARVALID,
      S_AXI_AWADDR(9 downto 0) => ps8_0_axi_periph_M06_AXI_AWADDR(9 downto 0),
      S_AXI_AWPROT(2 downto 0) => ps8_0_axi_periph_M06_AXI_AWPROT(2 downto 0),
      S_AXI_AWREADY => ps8_0_axi_periph_M06_AXI_AWREADY,
      S_AXI_AWVALID => ps8_0_axi_periph_M06_AXI_AWVALID,
      S_AXI_BREADY => ps8_0_axi_periph_M06_AXI_BREADY,
      S_AXI_BRESP(1 downto 0) => ps8_0_axi_periph_M06_AXI_BRESP(1 downto 0),
      S_AXI_BVALID => ps8_0_axi_periph_M06_AXI_BVALID,
      S_AXI_RDATA(31 downto 0) => ps8_0_axi_periph_M06_AXI_RDATA(31 downto 0),
      S_AXI_RREADY => ps8_0_axi_periph_M06_AXI_RREADY,
      S_AXI_RRESP(1 downto 0) => ps8_0_axi_periph_M06_AXI_RRESP(1 downto 0),
      S_AXI_RVALID => ps8_0_axi_periph_M06_AXI_RVALID,
      S_AXI_WDATA(31 downto 0) => ps8_0_axi_periph_M06_AXI_WDATA(31 downto 0),
      S_AXI_WREADY => ps8_0_axi_periph_M06_AXI_WREADY,
      S_AXI_WSTRB(3 downto 0) => ps8_0_axi_periph_M06_AXI_WSTRB(3 downto 0),
      S_AXI_WVALID => ps8_0_axi_periph_M06_AXI_WVALID,
      neg(3 downto 0) => hv7321_axi4_1_neg(3 downto 0),
      oen => hv7321_axi4_1_oen,
      otp_n => otp_n_0_1,
      out_clk => hv7321_axi4_1_out_clk,
      pos(3 downto 0) => hv7321_axi4_1_pos(3 downto 0),
      ren => hv7321_axi4_1_ren,
      rx => hv7321_axi4_1_rx,
      rx_done => Zero_dout(0),
      sel(3 downto 0) => hv7321_axi4_1_sel(3 downto 0),
      src_clk => clk_wiz_clk_out1,
      start => start_0_1(0),
      tx => NLW_hv7321_axi4_1_tx_UNCONNECTED
    );
hv7321_axi4_2: component edt_zcu106_hv7321_axi4_0_2
     port map (
      S_AXI_ACLK => zynq_ultra_ps_e_0_pl_clk0,
      S_AXI_ARADDR(9 downto 0) => ps8_0_axi_periph_M07_AXI_ARADDR(9 downto 0),
      S_AXI_ARESETN => rst_ps8_0_99M_peripheral_aresetn(0),
      S_AXI_ARPROT(2 downto 0) => ps8_0_axi_periph_M07_AXI_ARPROT(2 downto 0),
      S_AXI_ARREADY => ps8_0_axi_periph_M07_AXI_ARREADY,
      S_AXI_ARVALID => ps8_0_axi_periph_M07_AXI_ARVALID,
      S_AXI_AWADDR(9 downto 0) => ps8_0_axi_periph_M07_AXI_AWADDR(9 downto 0),
      S_AXI_AWPROT(2 downto 0) => ps8_0_axi_periph_M07_AXI_AWPROT(2 downto 0),
      S_AXI_AWREADY => ps8_0_axi_periph_M07_AXI_AWREADY,
      S_AXI_AWVALID => ps8_0_axi_periph_M07_AXI_AWVALID,
      S_AXI_BREADY => ps8_0_axi_periph_M07_AXI_BREADY,
      S_AXI_BRESP(1 downto 0) => ps8_0_axi_periph_M07_AXI_BRESP(1 downto 0),
      S_AXI_BVALID => ps8_0_axi_periph_M07_AXI_BVALID,
      S_AXI_RDATA(31 downto 0) => ps8_0_axi_periph_M07_AXI_RDATA(31 downto 0),
      S_AXI_RREADY => ps8_0_axi_periph_M07_AXI_RREADY,
      S_AXI_RRESP(1 downto 0) => ps8_0_axi_periph_M07_AXI_RRESP(1 downto 0),
      S_AXI_RVALID => ps8_0_axi_periph_M07_AXI_RVALID,
      S_AXI_WDATA(31 downto 0) => ps8_0_axi_periph_M07_AXI_WDATA(31 downto 0),
      S_AXI_WREADY => ps8_0_axi_periph_M07_AXI_WREADY,
      S_AXI_WSTRB(3 downto 0) => ps8_0_axi_periph_M07_AXI_WSTRB(3 downto 0),
      S_AXI_WVALID => ps8_0_axi_periph_M07_AXI_WVALID,
      neg(3 downto 0) => hv7321_axi4_2_neg(3 downto 0),
      oen => hv7321_axi4_2_oen,
      otp_n => otp_n_0_1,
      out_clk => hv7321_axi4_2_out_clk,
      pos(3 downto 0) => hv7321_axi4_2_pos(3 downto 0),
      ren => hv7321_axi4_2_ren,
      rx => hv7321_axi4_2_rx,
      rx_done => Zero_dout(0),
      sel(3 downto 0) => hv7321_axi4_2_sel(3 downto 0),
      src_clk => clk_wiz_clk_out1,
      start => start_0_1(0),
      tx => NLW_hv7321_axi4_2_tx_UNCONNECTED
    );
hv7321_axi4_3: component edt_zcu106_hv7321_axi4_0_3
     port map (
      S_AXI_ACLK => zynq_ultra_ps_e_0_pl_clk0,
      S_AXI_ARADDR(9 downto 0) => ps8_0_axi_periph_M08_AXI_ARADDR(9 downto 0),
      S_AXI_ARESETN => rst_ps8_0_99M_peripheral_aresetn(0),
      S_AXI_ARPROT(2 downto 0) => ps8_0_axi_periph_M08_AXI_ARPROT(2 downto 0),
      S_AXI_ARREADY => ps8_0_axi_periph_M08_AXI_ARREADY,
      S_AXI_ARVALID => ps8_0_axi_periph_M08_AXI_ARVALID,
      S_AXI_AWADDR(9 downto 0) => ps8_0_axi_periph_M08_AXI_AWADDR(9 downto 0),
      S_AXI_AWPROT(2 downto 0) => ps8_0_axi_periph_M08_AXI_AWPROT(2 downto 0),
      S_AXI_AWREADY => ps8_0_axi_periph_M08_AXI_AWREADY,
      S_AXI_AWVALID => ps8_0_axi_periph_M08_AXI_AWVALID,
      S_AXI_BREADY => ps8_0_axi_periph_M08_AXI_BREADY,
      S_AXI_BRESP(1 downto 0) => ps8_0_axi_periph_M08_AXI_BRESP(1 downto 0),
      S_AXI_BVALID => ps8_0_axi_periph_M08_AXI_BVALID,
      S_AXI_RDATA(31 downto 0) => ps8_0_axi_periph_M08_AXI_RDATA(31 downto 0),
      S_AXI_RREADY => ps8_0_axi_periph_M08_AXI_RREADY,
      S_AXI_RRESP(1 downto 0) => ps8_0_axi_periph_M08_AXI_RRESP(1 downto 0),
      S_AXI_RVALID => ps8_0_axi_periph_M08_AXI_RVALID,
      S_AXI_WDATA(31 downto 0) => ps8_0_axi_periph_M08_AXI_WDATA(31 downto 0),
      S_AXI_WREADY => ps8_0_axi_periph_M08_AXI_WREADY,
      S_AXI_WSTRB(3 downto 0) => ps8_0_axi_periph_M08_AXI_WSTRB(3 downto 0),
      S_AXI_WVALID => ps8_0_axi_periph_M08_AXI_WVALID,
      neg(3 downto 0) => hv7321_axi4_3_neg(3 downto 0),
      oen => hv7321_axi4_3_oen,
      otp_n => otp_n_0_1,
      out_clk => hv7321_axi4_3_out_clk,
      pos(3 downto 0) => hv7321_axi4_3_pos(3 downto 0),
      ren => hv7321_axi4_3_ren,
      rx => hv7321_axi4_3_rx,
      rx_done => Zero_dout(0),
      sel(3 downto 0) => hv7321_axi4_3_sel(3 downto 0),
      src_clk => clk_wiz_clk_out1,
      start => start_0_1(0),
      tx => NLW_hv7321_axi4_3_tx_UNCONNECTED
    );
ps8_0_axi_periph: entity work.edt_zcu106_ps8_0_axi_periph_0
     port map (
      ACLK => zynq_ultra_ps_e_0_pl_clk0,
      ARESETN => rst_ps8_0_99M_peripheral_aresetn(0),
      M00_ACLK => zynq_ultra_ps_e_0_pl_clk0,
      M00_ARESETN => rst_ps8_0_99M_peripheral_aresetn(0),
      M00_AXI_araddr(39 downto 0) => ps8_0_axi_periph_M00_AXI_ARADDR(39 downto 0),
      M00_AXI_arprot(2 downto 0) => ps8_0_axi_periph_M00_AXI_ARPROT(2 downto 0),
      M00_AXI_arready => ps8_0_axi_periph_M00_AXI_ARREADY,
      M00_AXI_arvalid => ps8_0_axi_periph_M00_AXI_ARVALID,
      M00_AXI_awaddr(39 downto 0) => ps8_0_axi_periph_M00_AXI_AWADDR(39 downto 0),
      M00_AXI_awprot(2 downto 0) => ps8_0_axi_periph_M00_AXI_AWPROT(2 downto 0),
      M00_AXI_awready => ps8_0_axi_periph_M00_AXI_AWREADY,
      M00_AXI_awvalid => ps8_0_axi_periph_M00_AXI_AWVALID,
      M00_AXI_bready => ps8_0_axi_periph_M00_AXI_BREADY,
      M00_AXI_bresp(1 downto 0) => ps8_0_axi_periph_M00_AXI_BRESP(1 downto 0),
      M00_AXI_bvalid => ps8_0_axi_periph_M00_AXI_BVALID,
      M00_AXI_rdata(31 downto 0) => ps8_0_axi_periph_M00_AXI_RDATA(31 downto 0),
      M00_AXI_rready => ps8_0_axi_periph_M00_AXI_RREADY,
      M00_AXI_rresp(1 downto 0) => ps8_0_axi_periph_M00_AXI_RRESP(1 downto 0),
      M00_AXI_rvalid => ps8_0_axi_periph_M00_AXI_RVALID,
      M00_AXI_wdata(31 downto 0) => ps8_0_axi_periph_M00_AXI_WDATA(31 downto 0),
      M00_AXI_wready => ps8_0_axi_periph_M00_AXI_WREADY,
      M00_AXI_wstrb(3 downto 0) => ps8_0_axi_periph_M00_AXI_WSTRB(3 downto 0),
      M00_AXI_wvalid => ps8_0_axi_periph_M00_AXI_WVALID,
      M01_ACLK => zynq_ultra_ps_e_0_pl_clk0,
      M01_ARESETN => rst_ps8_0_99M_peripheral_aresetn(0),
      M01_AXI_araddr(39 downto 0) => ps8_0_axi_periph_M01_AXI_ARADDR(39 downto 0),
      M01_AXI_arprot(2 downto 0) => ps8_0_axi_periph_M01_AXI_ARPROT(2 downto 0),
      M01_AXI_arready => ps8_0_axi_periph_M01_AXI_ARREADY,
      M01_AXI_arvalid => ps8_0_axi_periph_M01_AXI_ARVALID,
      M01_AXI_awaddr(39 downto 0) => ps8_0_axi_periph_M01_AXI_AWADDR(39 downto 0),
      M01_AXI_awprot(2 downto 0) => ps8_0_axi_periph_M01_AXI_AWPROT(2 downto 0),
      M01_AXI_awready => ps8_0_axi_periph_M01_AXI_AWREADY,
      M01_AXI_awvalid => ps8_0_axi_periph_M01_AXI_AWVALID,
      M01_AXI_bready => ps8_0_axi_periph_M01_AXI_BREADY,
      M01_AXI_bresp(1 downto 0) => ps8_0_axi_periph_M01_AXI_BRESP(1 downto 0),
      M01_AXI_bvalid => ps8_0_axi_periph_M01_AXI_BVALID,
      M01_AXI_rdata(31 downto 0) => ps8_0_axi_periph_M01_AXI_RDATA(31 downto 0),
      M01_AXI_rready => ps8_0_axi_periph_M01_AXI_RREADY,
      M01_AXI_rresp(1 downto 0) => ps8_0_axi_periph_M01_AXI_RRESP(1 downto 0),
      M01_AXI_rvalid => ps8_0_axi_periph_M01_AXI_RVALID,
      M01_AXI_wdata(31 downto 0) => ps8_0_axi_periph_M01_AXI_WDATA(31 downto 0),
      M01_AXI_wready => ps8_0_axi_periph_M01_AXI_WREADY,
      M01_AXI_wstrb(3 downto 0) => ps8_0_axi_periph_M01_AXI_WSTRB(3 downto 0),
      M01_AXI_wvalid => ps8_0_axi_periph_M01_AXI_WVALID,
      M02_ACLK => zynq_ultra_ps_e_0_pl_clk0,
      M02_ARESETN => rst_ps8_0_99M_peripheral_aresetn(0),
      M02_AXI_araddr(39 downto 0) => ps8_0_axi_periph_M02_AXI_ARADDR(39 downto 0),
      M02_AXI_arprot(2 downto 0) => ps8_0_axi_periph_M02_AXI_ARPROT(2 downto 0),
      M02_AXI_arready => ps8_0_axi_periph_M02_AXI_ARREADY,
      M02_AXI_arvalid => ps8_0_axi_periph_M02_AXI_ARVALID,
      M02_AXI_awaddr(39 downto 0) => ps8_0_axi_periph_M02_AXI_AWADDR(39 downto 0),
      M02_AXI_awprot(2 downto 0) => ps8_0_axi_periph_M02_AXI_AWPROT(2 downto 0),
      M02_AXI_awready => ps8_0_axi_periph_M02_AXI_AWREADY,
      M02_AXI_awvalid => ps8_0_axi_periph_M02_AXI_AWVALID,
      M02_AXI_bready => ps8_0_axi_periph_M02_AXI_BREADY,
      M02_AXI_bresp(1 downto 0) => ps8_0_axi_periph_M02_AXI_BRESP(1 downto 0),
      M02_AXI_bvalid => ps8_0_axi_periph_M02_AXI_BVALID,
      M02_AXI_rdata(31 downto 0) => ps8_0_axi_periph_M02_AXI_RDATA(31 downto 0),
      M02_AXI_rready => ps8_0_axi_periph_M02_AXI_RREADY,
      M02_AXI_rresp(1 downto 0) => ps8_0_axi_periph_M02_AXI_RRESP(1 downto 0),
      M02_AXI_rvalid => ps8_0_axi_periph_M02_AXI_RVALID,
      M02_AXI_wdata(31 downto 0) => ps8_0_axi_periph_M02_AXI_WDATA(31 downto 0),
      M02_AXI_wready => ps8_0_axi_periph_M02_AXI_WREADY,
      M02_AXI_wstrb(3 downto 0) => ps8_0_axi_periph_M02_AXI_WSTRB(3 downto 0),
      M02_AXI_wvalid => ps8_0_axi_periph_M02_AXI_WVALID,
      M03_ACLK => zynq_ultra_ps_e_0_pl_clk0,
      M03_ARESETN => rst_ps8_0_99M_peripheral_aresetn(0),
      M03_AXI_araddr(39 downto 0) => ps8_0_axi_periph_M03_AXI_ARADDR(39 downto 0),
      M03_AXI_arready => ps8_0_axi_periph_M03_AXI_ARREADY,
      M03_AXI_arvalid => ps8_0_axi_periph_M03_AXI_ARVALID,
      M03_AXI_awaddr(39 downto 0) => ps8_0_axi_periph_M03_AXI_AWADDR(39 downto 0),
      M03_AXI_awready => ps8_0_axi_periph_M03_AXI_AWREADY,
      M03_AXI_awvalid => ps8_0_axi_periph_M03_AXI_AWVALID,
      M03_AXI_bready => ps8_0_axi_periph_M03_AXI_BREADY,
      M03_AXI_bresp(1 downto 0) => ps8_0_axi_periph_M03_AXI_BRESP(1 downto 0),
      M03_AXI_bvalid => ps8_0_axi_periph_M03_AXI_BVALID,
      M03_AXI_rdata(31 downto 0) => ps8_0_axi_periph_M03_AXI_RDATA(31 downto 0),
      M03_AXI_rready => ps8_0_axi_periph_M03_AXI_RREADY,
      M03_AXI_rresp(1 downto 0) => ps8_0_axi_periph_M03_AXI_RRESP(1 downto 0),
      M03_AXI_rvalid => ps8_0_axi_periph_M03_AXI_RVALID,
      M03_AXI_wdata(31 downto 0) => ps8_0_axi_periph_M03_AXI_WDATA(31 downto 0),
      M03_AXI_wready => ps8_0_axi_periph_M03_AXI_WREADY,
      M03_AXI_wvalid => ps8_0_axi_periph_M03_AXI_WVALID,
      M04_ACLK => zynq_ultra_ps_e_0_pl_clk0,
      M04_ARESETN => rst_ps8_0_99M_peripheral_aresetn(0),
      M04_AXI_araddr(39 downto 0) => ps8_0_axi_periph_M04_AXI_ARADDR(39 downto 0),
      M04_AXI_arprot(2 downto 0) => ps8_0_axi_periph_M04_AXI_ARPROT(2 downto 0),
      M04_AXI_arready => ps8_0_axi_periph_M04_AXI_ARREADY,
      M04_AXI_arvalid => ps8_0_axi_periph_M04_AXI_ARVALID,
      M04_AXI_awaddr(39 downto 0) => ps8_0_axi_periph_M04_AXI_AWADDR(39 downto 0),
      M04_AXI_awprot(2 downto 0) => ps8_0_axi_periph_M04_AXI_AWPROT(2 downto 0),
      M04_AXI_awready => ps8_0_axi_periph_M04_AXI_AWREADY,
      M04_AXI_awvalid => ps8_0_axi_periph_M04_AXI_AWVALID,
      M04_AXI_bready => ps8_0_axi_periph_M04_AXI_BREADY,
      M04_AXI_bresp(1 downto 0) => ps8_0_axi_periph_M04_AXI_BRESP(1 downto 0),
      M04_AXI_bvalid => ps8_0_axi_periph_M04_AXI_BVALID,
      M04_AXI_rdata(31 downto 0) => ps8_0_axi_periph_M04_AXI_RDATA(31 downto 0),
      M04_AXI_rready => ps8_0_axi_periph_M04_AXI_RREADY,
      M04_AXI_rresp(1 downto 0) => ps8_0_axi_periph_M04_AXI_RRESP(1 downto 0),
      M04_AXI_rvalid => ps8_0_axi_periph_M04_AXI_RVALID,
      M04_AXI_wdata(31 downto 0) => ps8_0_axi_periph_M04_AXI_WDATA(31 downto 0),
      M04_AXI_wready => ps8_0_axi_periph_M04_AXI_WREADY,
      M04_AXI_wstrb(3 downto 0) => ps8_0_axi_periph_M04_AXI_WSTRB(3 downto 0),
      M04_AXI_wvalid => ps8_0_axi_periph_M04_AXI_WVALID,
      M05_ACLK => zynq_ultra_ps_e_0_pl_clk0,
      M05_ARESETN => rst_ps8_0_99M_peripheral_aresetn(0),
      M05_AXI_araddr(39 downto 0) => ps8_0_axi_periph_M05_AXI_ARADDR(39 downto 0),
      M05_AXI_arready => ps8_0_axi_periph_M05_AXI_ARREADY,
      M05_AXI_arvalid => ps8_0_axi_periph_M05_AXI_ARVALID,
      M05_AXI_awaddr(39 downto 0) => ps8_0_axi_periph_M05_AXI_AWADDR(39 downto 0),
      M05_AXI_awready => ps8_0_axi_periph_M05_AXI_AWREADY,
      M05_AXI_awvalid => ps8_0_axi_periph_M05_AXI_AWVALID,
      M05_AXI_bready => ps8_0_axi_periph_M05_AXI_BREADY,
      M05_AXI_bresp(1 downto 0) => ps8_0_axi_periph_M05_AXI_BRESP(1 downto 0),
      M05_AXI_bvalid => ps8_0_axi_periph_M05_AXI_BVALID,
      M05_AXI_rdata(31 downto 0) => ps8_0_axi_periph_M05_AXI_RDATA(31 downto 0),
      M05_AXI_rready => ps8_0_axi_periph_M05_AXI_RREADY,
      M05_AXI_rresp(1 downto 0) => ps8_0_axi_periph_M05_AXI_RRESP(1 downto 0),
      M05_AXI_rvalid => ps8_0_axi_periph_M05_AXI_RVALID,
      M05_AXI_wdata(31 downto 0) => ps8_0_axi_periph_M05_AXI_WDATA(31 downto 0),
      M05_AXI_wready => ps8_0_axi_periph_M05_AXI_WREADY,
      M05_AXI_wvalid => ps8_0_axi_periph_M05_AXI_WVALID,
      M06_ACLK => zynq_ultra_ps_e_0_pl_clk0,
      M06_ARESETN => rst_ps8_0_99M_peripheral_aresetn(0),
      M06_AXI_araddr(39 downto 0) => ps8_0_axi_periph_M06_AXI_ARADDR(39 downto 0),
      M06_AXI_arprot(2 downto 0) => ps8_0_axi_periph_M06_AXI_ARPROT(2 downto 0),
      M06_AXI_arready => ps8_0_axi_periph_M06_AXI_ARREADY,
      M06_AXI_arvalid => ps8_0_axi_periph_M06_AXI_ARVALID,
      M06_AXI_awaddr(39 downto 0) => ps8_0_axi_periph_M06_AXI_AWADDR(39 downto 0),
      M06_AXI_awprot(2 downto 0) => ps8_0_axi_periph_M06_AXI_AWPROT(2 downto 0),
      M06_AXI_awready => ps8_0_axi_periph_M06_AXI_AWREADY,
      M06_AXI_awvalid => ps8_0_axi_periph_M06_AXI_AWVALID,
      M06_AXI_bready => ps8_0_axi_periph_M06_AXI_BREADY,
      M06_AXI_bresp(1 downto 0) => ps8_0_axi_periph_M06_AXI_BRESP(1 downto 0),
      M06_AXI_bvalid => ps8_0_axi_periph_M06_AXI_BVALID,
      M06_AXI_rdata(31 downto 0) => ps8_0_axi_periph_M06_AXI_RDATA(31 downto 0),
      M06_AXI_rready => ps8_0_axi_periph_M06_AXI_RREADY,
      M06_AXI_rresp(1 downto 0) => ps8_0_axi_periph_M06_AXI_RRESP(1 downto 0),
      M06_AXI_rvalid => ps8_0_axi_periph_M06_AXI_RVALID,
      M06_AXI_wdata(31 downto 0) => ps8_0_axi_periph_M06_AXI_WDATA(31 downto 0),
      M06_AXI_wready => ps8_0_axi_periph_M06_AXI_WREADY,
      M06_AXI_wstrb(3 downto 0) => ps8_0_axi_periph_M06_AXI_WSTRB(3 downto 0),
      M06_AXI_wvalid => ps8_0_axi_periph_M06_AXI_WVALID,
      M07_ACLK => zynq_ultra_ps_e_0_pl_clk0,
      M07_ARESETN => rst_ps8_0_99M_peripheral_aresetn(0),
      M07_AXI_araddr(39 downto 0) => ps8_0_axi_periph_M07_AXI_ARADDR(39 downto 0),
      M07_AXI_arprot(2 downto 0) => ps8_0_axi_periph_M07_AXI_ARPROT(2 downto 0),
      M07_AXI_arready => ps8_0_axi_periph_M07_AXI_ARREADY,
      M07_AXI_arvalid => ps8_0_axi_periph_M07_AXI_ARVALID,
      M07_AXI_awaddr(39 downto 0) => ps8_0_axi_periph_M07_AXI_AWADDR(39 downto 0),
      M07_AXI_awprot(2 downto 0) => ps8_0_axi_periph_M07_AXI_AWPROT(2 downto 0),
      M07_AXI_awready => ps8_0_axi_periph_M07_AXI_AWREADY,
      M07_AXI_awvalid => ps8_0_axi_periph_M07_AXI_AWVALID,
      M07_AXI_bready => ps8_0_axi_periph_M07_AXI_BREADY,
      M07_AXI_bresp(1 downto 0) => ps8_0_axi_periph_M07_AXI_BRESP(1 downto 0),
      M07_AXI_bvalid => ps8_0_axi_periph_M07_AXI_BVALID,
      M07_AXI_rdata(31 downto 0) => ps8_0_axi_periph_M07_AXI_RDATA(31 downto 0),
      M07_AXI_rready => ps8_0_axi_periph_M07_AXI_RREADY,
      M07_AXI_rresp(1 downto 0) => ps8_0_axi_periph_M07_AXI_RRESP(1 downto 0),
      M07_AXI_rvalid => ps8_0_axi_periph_M07_AXI_RVALID,
      M07_AXI_wdata(31 downto 0) => ps8_0_axi_periph_M07_AXI_WDATA(31 downto 0),
      M07_AXI_wready => ps8_0_axi_periph_M07_AXI_WREADY,
      M07_AXI_wstrb(3 downto 0) => ps8_0_axi_periph_M07_AXI_WSTRB(3 downto 0),
      M07_AXI_wvalid => ps8_0_axi_periph_M07_AXI_WVALID,
      M08_ACLK => zynq_ultra_ps_e_0_pl_clk0,
      M08_ARESETN => rst_ps8_0_99M_peripheral_aresetn(0),
      M08_AXI_araddr(39 downto 0) => ps8_0_axi_periph_M08_AXI_ARADDR(39 downto 0),
      M08_AXI_arprot(2 downto 0) => ps8_0_axi_periph_M08_AXI_ARPROT(2 downto 0),
      M08_AXI_arready => ps8_0_axi_periph_M08_AXI_ARREADY,
      M08_AXI_arvalid => ps8_0_axi_periph_M08_AXI_ARVALID,
      M08_AXI_awaddr(39 downto 0) => ps8_0_axi_periph_M08_AXI_AWADDR(39 downto 0),
      M08_AXI_awprot(2 downto 0) => ps8_0_axi_periph_M08_AXI_AWPROT(2 downto 0),
      M08_AXI_awready => ps8_0_axi_periph_M08_AXI_AWREADY,
      M08_AXI_awvalid => ps8_0_axi_periph_M08_AXI_AWVALID,
      M08_AXI_bready => ps8_0_axi_periph_M08_AXI_BREADY,
      M08_AXI_bresp(1 downto 0) => ps8_0_axi_periph_M08_AXI_BRESP(1 downto 0),
      M08_AXI_bvalid => ps8_0_axi_periph_M08_AXI_BVALID,
      M08_AXI_rdata(31 downto 0) => ps8_0_axi_periph_M08_AXI_RDATA(31 downto 0),
      M08_AXI_rready => ps8_0_axi_periph_M08_AXI_RREADY,
      M08_AXI_rresp(1 downto 0) => ps8_0_axi_periph_M08_AXI_RRESP(1 downto 0),
      M08_AXI_rvalid => ps8_0_axi_periph_M08_AXI_RVALID,
      M08_AXI_wdata(31 downto 0) => ps8_0_axi_periph_M08_AXI_WDATA(31 downto 0),
      M08_AXI_wready => ps8_0_axi_periph_M08_AXI_WREADY,
      M08_AXI_wstrb(3 downto 0) => ps8_0_axi_periph_M08_AXI_WSTRB(3 downto 0),
      M08_AXI_wvalid => ps8_0_axi_periph_M08_AXI_WVALID,
      S00_ACLK => zynq_ultra_ps_e_0_pl_clk0,
      S00_ARESETN => rst_ps8_0_99M_peripheral_aresetn(0),
      S00_AXI_araddr(39 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARADDR(39 downto 0),
      S00_AXI_arburst(1 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARBURST(1 downto 0),
      S00_AXI_arcache(3 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARCACHE(3 downto 0),
      S00_AXI_arid(15 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARID(15 downto 0),
      S00_AXI_arlen(7 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARLEN(7 downto 0),
      S00_AXI_arlock(0) => zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARLOCK,
      S00_AXI_arprot(2 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARPROT(2 downto 0),
      S00_AXI_arqos(3 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARQOS(3 downto 0),
      S00_AXI_arready => zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARREADY,
      S00_AXI_arsize(2 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARSIZE(2 downto 0),
      S00_AXI_arvalid => zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARVALID,
      S00_AXI_awaddr(39 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWADDR(39 downto 0),
      S00_AXI_awburst(1 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWBURST(1 downto 0),
      S00_AXI_awcache(3 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWCACHE(3 downto 0),
      S00_AXI_awid(15 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWID(15 downto 0),
      S00_AXI_awlen(7 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWLEN(7 downto 0),
      S00_AXI_awlock(0) => zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWLOCK,
      S00_AXI_awprot(2 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWPROT(2 downto 0),
      S00_AXI_awqos(3 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWQOS(3 downto 0),
      S00_AXI_awready => zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWREADY,
      S00_AXI_awsize(2 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWSIZE(2 downto 0),
      S00_AXI_awvalid => zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWVALID,
      S00_AXI_bid(15 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_BID(15 downto 0),
      S00_AXI_bready => zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_BREADY,
      S00_AXI_bresp(1 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_BRESP(1 downto 0),
      S00_AXI_bvalid => zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_BVALID,
      S00_AXI_rdata(31 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RDATA(31 downto 0),
      S00_AXI_rid(15 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RID(15 downto 0),
      S00_AXI_rlast => zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RLAST,
      S00_AXI_rready => zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RREADY,
      S00_AXI_rresp(1 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RRESP(1 downto 0),
      S00_AXI_rvalid => zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RVALID,
      S00_AXI_wdata(31 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_WDATA(31 downto 0),
      S00_AXI_wlast => zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_WLAST,
      S00_AXI_wready => zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_WREADY,
      S00_AXI_wstrb(3 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_WSTRB(3 downto 0),
      S00_AXI_wvalid => zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_WVALID
    );
rst_ps8_0_99M: component edt_zcu106_rst_ps8_0_99M_0
     port map (
      aux_reset_in => '1',
      bus_struct_reset(0) => NLW_rst_ps8_0_99M_bus_struct_reset_UNCONNECTED(0),
      dcm_locked => '1',
      ext_reset_in => zynq_ultra_ps_e_0_pl_resetn0,
      interconnect_aresetn(0) => NLW_rst_ps8_0_99M_interconnect_aresetn_UNCONNECTED(0),
      mb_debug_sys_rst => '0',
      mb_reset => NLW_rst_ps8_0_99M_mb_reset_UNCONNECTED,
      peripheral_aresetn(0) => rst_ps8_0_99M_peripheral_aresetn(0),
      peripheral_reset(0) => rst_ps8_0_99M_peripheral_reset(0),
      slowest_sync_clk => zynq_ultra_ps_e_0_pl_clk0
    );
xlconcat_0: component edt_zcu106_xlconcat_0_0
     port map (
      In0(0) => axi_dma_0_s2mm_introut,
      In1(0) => axi_dma_1_s2mm_introut,
      dout(1 downto 0) => xlconcat_0_dout(1 downto 0)
    );
xlconcat_1: component edt_zcu106_xlconcat_1_1
     port map (
      In0(0) => ad9670_axi4_0_tx_trig,
      In1(0) => ad9670_axi4_1_tx_trig,
      dout(1 downto 0) => xlconcat_1_dout(1 downto 0)
    );
xlslice_adc_enable: component edt_zcu106_xlslice_adc_enable_0
     port map (
      Din(24 downto 0) => zynq_ultra_ps_e_0_emio_gpio_o(24 downto 0),
      Dout(0) => xlslice_adc_enable_Dout(0)
    );
xlslice_dac_start: component edt_zcu106_xlslice_pulser_start_0
     port map (
      Din(24 downto 0) => zynq_ultra_ps_e_0_emio_gpio_o(24 downto 0),
      Dout(0) => xlslice_pulser_start1_Dout(0)
    );
xlslice_leds: component edt_zcu106_xlslice_pmod1_0
     port map (
      Din(24 downto 0) => zynq_ultra_ps_e_0_emio_gpio_o(24 downto 0),
      Dout(4 downto 0) => xlslice_leds_Dout(4 downto 0)
    );
xlslice_pmod0: component edt_zcu106_xlslice_pmod0_0
     port map (
      Din(24 downto 0) => zynq_ultra_ps_e_0_emio_gpio_o(24 downto 0),
      Dout(7 downto 0) => xlslice_debug_out_Dout(7 downto 0)
    );
xlslice_pmod1: component edt_zcu106_xlslice_pmod1_1
     port map (
      Din(24 downto 0) => zynq_ultra_ps_e_0_emio_gpio_o(24 downto 0),
      Dout(4 downto 0) => xlslice_pmod1_Dout(4 downto 0)
    );
xlslice_pulser_start: component edt_zcu106_xlslice_pulser_start_1
     port map (
      Din(24 downto 0) => zynq_ultra_ps_e_0_emio_gpio_o(24 downto 0),
      Dout(0) => start_0_1(0)
    );
xlslice_sdio_ctrl: component edt_zcu106_xlslice_0_0
     port map (
      Din(24 downto 0) => zynq_ultra_ps_e_0_emio_gpio_o(24 downto 0),
      Dout(0) => xlslice_0_Dout(0)
    );
zynq_ultra_ps_e_0: component edt_zcu106_zynq_ultra_ps_e_0_0
     port map (
      emio_gpio_i(24 downto 0) => B"0000000000000000000000000",
      emio_gpio_o(24 downto 0) => zynq_ultra_ps_e_0_emio_gpio_o(24 downto 0),
      emio_gpio_t(24 downto 0) => NLW_zynq_ultra_ps_e_0_emio_gpio_t_UNCONNECTED(24 downto 0),
      emio_spi0_m_i => AFE_SDIO_BUF_IOBUF_IO_O(0),
      emio_spi0_m_o => zynq_ultra_ps_e_0_emio_spi0_m_o,
      emio_spi0_mo_t => NLW_zynq_ultra_ps_e_0_emio_spi0_mo_t_UNCONNECTED,
      emio_spi0_s_i => AFE_SDIO_BUF_IOBUF_IO_O(0),
      emio_spi0_s_o => NLW_zynq_ultra_ps_e_0_emio_spi0_s_o_UNCONNECTED,
      emio_spi0_sclk_i => '0',
      emio_spi0_sclk_o => zynq_ultra_ps_e_0_emio_spi0_sclk_o,
      emio_spi0_sclk_t => NLW_zynq_ultra_ps_e_0_emio_spi0_sclk_t_UNCONNECTED,
      emio_spi0_so_t => NLW_zynq_ultra_ps_e_0_emio_spi0_so_t_UNCONNECTED,
      emio_spi0_ss1_o_n => zynq_ultra_ps_e_0_emio_spi0_ss1_o_n,
      emio_spi0_ss_i_n => '1',
      emio_spi0_ss_n_t => NLW_zynq_ultra_ps_e_0_emio_spi0_ss_n_t_UNCONNECTED,
      emio_spi0_ss_o_n => zynq_ultra_ps_e_0_emio_spi0_ss_o_n,
      maxigp0_araddr(39 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARADDR(39 downto 0),
      maxigp0_arburst(1 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARBURST(1 downto 0),
      maxigp0_arcache(3 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARCACHE(3 downto 0),
      maxigp0_arid(15 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARID(15 downto 0),
      maxigp0_arlen(7 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARLEN(7 downto 0),
      maxigp0_arlock => zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARLOCK,
      maxigp0_arprot(2 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARPROT(2 downto 0),
      maxigp0_arqos(3 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARQOS(3 downto 0),
      maxigp0_arready => zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARREADY,
      maxigp0_arsize(2 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARSIZE(2 downto 0),
      maxigp0_aruser(15 downto 0) => NLW_zynq_ultra_ps_e_0_maxigp0_aruser_UNCONNECTED(15 downto 0),
      maxigp0_arvalid => zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARVALID,
      maxigp0_awaddr(39 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWADDR(39 downto 0),
      maxigp0_awburst(1 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWBURST(1 downto 0),
      maxigp0_awcache(3 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWCACHE(3 downto 0),
      maxigp0_awid(15 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWID(15 downto 0),
      maxigp0_awlen(7 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWLEN(7 downto 0),
      maxigp0_awlock => zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWLOCK,
      maxigp0_awprot(2 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWPROT(2 downto 0),
      maxigp0_awqos(3 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWQOS(3 downto 0),
      maxigp0_awready => zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWREADY,
      maxigp0_awsize(2 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWSIZE(2 downto 0),
      maxigp0_awuser(15 downto 0) => NLW_zynq_ultra_ps_e_0_maxigp0_awuser_UNCONNECTED(15 downto 0),
      maxigp0_awvalid => zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWVALID,
      maxigp0_bid(15 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_BID(15 downto 0),
      maxigp0_bready => zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_BREADY,
      maxigp0_bresp(1 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_BRESP(1 downto 0),
      maxigp0_bvalid => zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_BVALID,
      maxigp0_rdata(31 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RDATA(31 downto 0),
      maxigp0_rid(15 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RID(15 downto 0),
      maxigp0_rlast => zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RLAST,
      maxigp0_rready => zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RREADY,
      maxigp0_rresp(1 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RRESP(1 downto 0),
      maxigp0_rvalid => zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RVALID,
      maxigp0_wdata(31 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_WDATA(31 downto 0),
      maxigp0_wlast => zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_WLAST,
      maxigp0_wready => zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_WREADY,
      maxigp0_wstrb(3 downto 0) => zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_WSTRB(3 downto 0),
      maxigp0_wvalid => zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_WVALID,
      maxihpm0_fpd_aclk => zynq_ultra_ps_e_0_pl_clk0,
      pl_clk0 => zynq_ultra_ps_e_0_pl_clk0,
      pl_ps_irq0(1 downto 0) => xlconcat_0_dout(1 downto 0),
      pl_resetn0 => zynq_ultra_ps_e_0_pl_resetn0,
      saxigp2_araddr(48 downto 32) => B"00000000000000000",
      saxigp2_araddr(31 downto 0) => axi_dma_0_M_AXI_SG_ARADDR(31 downto 0),
      saxigp2_arburst(1 downto 0) => axi_dma_0_M_AXI_SG_ARBURST(1 downto 0),
      saxigp2_arcache(3 downto 0) => axi_dma_0_M_AXI_SG_ARCACHE(3 downto 0),
      saxigp2_arid(5 downto 0) => B"000000",
      saxigp2_arlen(7 downto 0) => axi_dma_0_M_AXI_SG_ARLEN(7 downto 0),
      saxigp2_arlock => '0',
      saxigp2_arprot(2 downto 0) => axi_dma_0_M_AXI_SG_ARPROT(2 downto 0),
      saxigp2_arqos(3 downto 0) => B"0000",
      saxigp2_arready => axi_dma_0_M_AXI_SG_ARREADY,
      saxigp2_arsize(2 downto 0) => axi_dma_0_M_AXI_SG_ARSIZE(2 downto 0),
      saxigp2_aruser => '0',
      saxigp2_arvalid => axi_dma_0_M_AXI_SG_ARVALID,
      saxigp2_awaddr(48 downto 32) => B"00000000000000000",
      saxigp2_awaddr(31 downto 0) => axi_dma_0_M_AXI_SG_AWADDR(31 downto 0),
      saxigp2_awburst(1 downto 0) => axi_dma_0_M_AXI_SG_AWBURST(1 downto 0),
      saxigp2_awcache(3 downto 0) => axi_dma_0_M_AXI_SG_AWCACHE(3 downto 0),
      saxigp2_awid(5 downto 0) => B"000000",
      saxigp2_awlen(7 downto 0) => axi_dma_0_M_AXI_SG_AWLEN(7 downto 0),
      saxigp2_awlock => '0',
      saxigp2_awprot(2 downto 0) => axi_dma_0_M_AXI_SG_AWPROT(2 downto 0),
      saxigp2_awqos(3 downto 0) => B"0000",
      saxigp2_awready => axi_dma_0_M_AXI_SG_AWREADY,
      saxigp2_awsize(2 downto 0) => axi_dma_0_M_AXI_SG_AWSIZE(2 downto 0),
      saxigp2_awuser => '0',
      saxigp2_awvalid => axi_dma_0_M_AXI_SG_AWVALID,
      saxigp2_bid(5 downto 0) => NLW_zynq_ultra_ps_e_0_saxigp2_bid_UNCONNECTED(5 downto 0),
      saxigp2_bready => axi_dma_0_M_AXI_SG_BREADY,
      saxigp2_bresp(1 downto 0) => axi_dma_0_M_AXI_SG_BRESP(1 downto 0),
      saxigp2_bvalid => axi_dma_0_M_AXI_SG_BVALID,
      saxigp2_rdata(31 downto 0) => axi_dma_0_M_AXI_SG_RDATA(31 downto 0),
      saxigp2_rid(5 downto 0) => NLW_zynq_ultra_ps_e_0_saxigp2_rid_UNCONNECTED(5 downto 0),
      saxigp2_rlast => axi_dma_0_M_AXI_SG_RLAST,
      saxigp2_rready => axi_dma_0_M_AXI_SG_RREADY,
      saxigp2_rresp(1 downto 0) => axi_dma_0_M_AXI_SG_RRESP(1 downto 0),
      saxigp2_rvalid => axi_dma_0_M_AXI_SG_RVALID,
      saxigp2_wdata(31 downto 0) => axi_dma_0_M_AXI_SG_WDATA(31 downto 0),
      saxigp2_wlast => axi_dma_0_M_AXI_SG_WLAST,
      saxigp2_wready => axi_dma_0_M_AXI_SG_WREADY,
      saxigp2_wstrb(3 downto 0) => axi_dma_0_M_AXI_SG_WSTRB(3 downto 0),
      saxigp2_wvalid => axi_dma_0_M_AXI_SG_WVALID,
      saxigp3_araddr(48 downto 32) => B"00000000000000000",
      saxigp3_araddr(31 downto 0) => axi_dma_1_M_AXI_SG_ARADDR(31 downto 0),
      saxigp3_arburst(1 downto 0) => axi_dma_1_M_AXI_SG_ARBURST(1 downto 0),
      saxigp3_arcache(3 downto 0) => axi_dma_1_M_AXI_SG_ARCACHE(3 downto 0),
      saxigp3_arid(5 downto 0) => B"000000",
      saxigp3_arlen(7 downto 0) => axi_dma_1_M_AXI_SG_ARLEN(7 downto 0),
      saxigp3_arlock => '0',
      saxigp3_arprot(2 downto 0) => axi_dma_1_M_AXI_SG_ARPROT(2 downto 0),
      saxigp3_arqos(3 downto 0) => B"0000",
      saxigp3_arready => axi_dma_1_M_AXI_SG_ARREADY,
      saxigp3_arsize(2 downto 0) => axi_dma_1_M_AXI_SG_ARSIZE(2 downto 0),
      saxigp3_aruser => '0',
      saxigp3_arvalid => axi_dma_1_M_AXI_SG_ARVALID,
      saxigp3_awaddr(48 downto 32) => B"00000000000000000",
      saxigp3_awaddr(31 downto 0) => axi_dma_1_M_AXI_SG_AWADDR(31 downto 0),
      saxigp3_awburst(1 downto 0) => axi_dma_1_M_AXI_SG_AWBURST(1 downto 0),
      saxigp3_awcache(3 downto 0) => axi_dma_1_M_AXI_SG_AWCACHE(3 downto 0),
      saxigp3_awid(5 downto 0) => B"000000",
      saxigp3_awlen(7 downto 0) => axi_dma_1_M_AXI_SG_AWLEN(7 downto 0),
      saxigp3_awlock => '0',
      saxigp3_awprot(2 downto 0) => axi_dma_1_M_AXI_SG_AWPROT(2 downto 0),
      saxigp3_awqos(3 downto 0) => B"0000",
      saxigp3_awready => axi_dma_1_M_AXI_SG_AWREADY,
      saxigp3_awsize(2 downto 0) => axi_dma_1_M_AXI_SG_AWSIZE(2 downto 0),
      saxigp3_awuser => '0',
      saxigp3_awvalid => axi_dma_1_M_AXI_SG_AWVALID,
      saxigp3_bid(5 downto 0) => NLW_zynq_ultra_ps_e_0_saxigp3_bid_UNCONNECTED(5 downto 0),
      saxigp3_bready => axi_dma_1_M_AXI_SG_BREADY,
      saxigp3_bresp(1 downto 0) => axi_dma_1_M_AXI_SG_BRESP(1 downto 0),
      saxigp3_bvalid => axi_dma_1_M_AXI_SG_BVALID,
      saxigp3_rdata(31 downto 0) => axi_dma_1_M_AXI_SG_RDATA(31 downto 0),
      saxigp3_rid(5 downto 0) => NLW_zynq_ultra_ps_e_0_saxigp3_rid_UNCONNECTED(5 downto 0),
      saxigp3_rlast => axi_dma_1_M_AXI_SG_RLAST,
      saxigp3_rready => axi_dma_1_M_AXI_SG_RREADY,
      saxigp3_rresp(1 downto 0) => axi_dma_1_M_AXI_SG_RRESP(1 downto 0),
      saxigp3_rvalid => axi_dma_1_M_AXI_SG_RVALID,
      saxigp3_wdata(31 downto 0) => axi_dma_1_M_AXI_SG_WDATA(31 downto 0),
      saxigp3_wlast => axi_dma_1_M_AXI_SG_WLAST,
      saxigp3_wready => axi_dma_1_M_AXI_SG_WREADY,
      saxigp3_wstrb(3 downto 0) => axi_dma_1_M_AXI_SG_WSTRB(3 downto 0),
      saxigp3_wvalid => axi_dma_1_M_AXI_SG_WVALID,
      saxigp4_araddr(48 downto 0) => B"0000000000000000000000000000000000000000000000000",
      saxigp4_arburst(1 downto 0) => B"01",
      saxigp4_arcache(3 downto 0) => B"0011",
      saxigp4_arid(5 downto 0) => B"000000",
      saxigp4_arlen(7 downto 0) => B"00000000",
      saxigp4_arlock => '0',
      saxigp4_arprot(2 downto 0) => B"000",
      saxigp4_arqos(3 downto 0) => B"0000",
      saxigp4_arready => NLW_zynq_ultra_ps_e_0_saxigp4_arready_UNCONNECTED,
      saxigp4_arsize(2 downto 0) => B"100",
      saxigp4_aruser => '0',
      saxigp4_arvalid => '0',
      saxigp4_awaddr(48 downto 32) => B"00000000000000000",
      saxigp4_awaddr(31 downto 0) => axi_dma_0_M_AXI_S2MM_AWADDR(31 downto 0),
      saxigp4_awburst(1 downto 0) => axi_dma_0_M_AXI_S2MM_AWBURST(1 downto 0),
      saxigp4_awcache(3 downto 0) => axi_dma_0_M_AXI_S2MM_AWCACHE(3 downto 0),
      saxigp4_awid(5 downto 0) => B"000000",
      saxigp4_awlen(7 downto 0) => axi_dma_0_M_AXI_S2MM_AWLEN(7 downto 0),
      saxigp4_awlock => '0',
      saxigp4_awprot(2 downto 0) => axi_dma_0_M_AXI_S2MM_AWPROT(2 downto 0),
      saxigp4_awqos(3 downto 0) => B"0000",
      saxigp4_awready => axi_dma_0_M_AXI_S2MM_AWREADY,
      saxigp4_awsize(2 downto 0) => axi_dma_0_M_AXI_S2MM_AWSIZE(2 downto 0),
      saxigp4_awuser => '0',
      saxigp4_awvalid => axi_dma_0_M_AXI_S2MM_AWVALID,
      saxigp4_bid(5 downto 0) => NLW_zynq_ultra_ps_e_0_saxigp4_bid_UNCONNECTED(5 downto 0),
      saxigp4_bready => axi_dma_0_M_AXI_S2MM_BREADY,
      saxigp4_bresp(1 downto 0) => axi_dma_0_M_AXI_S2MM_BRESP(1 downto 0),
      saxigp4_bvalid => axi_dma_0_M_AXI_S2MM_BVALID,
      saxigp4_rdata(127 downto 0) => NLW_zynq_ultra_ps_e_0_saxigp4_rdata_UNCONNECTED(127 downto 0),
      saxigp4_rid(5 downto 0) => NLW_zynq_ultra_ps_e_0_saxigp4_rid_UNCONNECTED(5 downto 0),
      saxigp4_rlast => NLW_zynq_ultra_ps_e_0_saxigp4_rlast_UNCONNECTED,
      saxigp4_rready => '0',
      saxigp4_rresp(1 downto 0) => NLW_zynq_ultra_ps_e_0_saxigp4_rresp_UNCONNECTED(1 downto 0),
      saxigp4_rvalid => NLW_zynq_ultra_ps_e_0_saxigp4_rvalid_UNCONNECTED,
      saxigp4_wdata(127 downto 0) => axi_dma_0_M_AXI_S2MM_WDATA(127 downto 0),
      saxigp4_wlast => axi_dma_0_M_AXI_S2MM_WLAST,
      saxigp4_wready => axi_dma_0_M_AXI_S2MM_WREADY,
      saxigp4_wstrb(15 downto 0) => axi_dma_0_M_AXI_S2MM_WSTRB(15 downto 0),
      saxigp4_wvalid => axi_dma_0_M_AXI_S2MM_WVALID,
      saxigp5_araddr(48 downto 0) => B"0000000000000000000000000000000000000000000000000",
      saxigp5_arburst(1 downto 0) => B"01",
      saxigp5_arcache(3 downto 0) => B"0011",
      saxigp5_arid(5 downto 0) => B"000000",
      saxigp5_arlen(7 downto 0) => B"00000000",
      saxigp5_arlock => '0',
      saxigp5_arprot(2 downto 0) => B"000",
      saxigp5_arqos(3 downto 0) => B"0000",
      saxigp5_arready => NLW_zynq_ultra_ps_e_0_saxigp5_arready_UNCONNECTED,
      saxigp5_arsize(2 downto 0) => B"100",
      saxigp5_aruser => '0',
      saxigp5_arvalid => '0',
      saxigp5_awaddr(48 downto 32) => B"00000000000000000",
      saxigp5_awaddr(31 downto 0) => axi_dma_1_M_AXI_S2MM_AWADDR(31 downto 0),
      saxigp5_awburst(1 downto 0) => axi_dma_1_M_AXI_S2MM_AWBURST(1 downto 0),
      saxigp5_awcache(3 downto 0) => axi_dma_1_M_AXI_S2MM_AWCACHE(3 downto 0),
      saxigp5_awid(5 downto 0) => B"000000",
      saxigp5_awlen(7 downto 0) => axi_dma_1_M_AXI_S2MM_AWLEN(7 downto 0),
      saxigp5_awlock => '0',
      saxigp5_awprot(2 downto 0) => axi_dma_1_M_AXI_S2MM_AWPROT(2 downto 0),
      saxigp5_awqos(3 downto 0) => B"0000",
      saxigp5_awready => axi_dma_1_M_AXI_S2MM_AWREADY,
      saxigp5_awsize(2 downto 0) => axi_dma_1_M_AXI_S2MM_AWSIZE(2 downto 0),
      saxigp5_awuser => '0',
      saxigp5_awvalid => axi_dma_1_M_AXI_S2MM_AWVALID,
      saxigp5_bid(5 downto 0) => NLW_zynq_ultra_ps_e_0_saxigp5_bid_UNCONNECTED(5 downto 0),
      saxigp5_bready => axi_dma_1_M_AXI_S2MM_BREADY,
      saxigp5_bresp(1 downto 0) => axi_dma_1_M_AXI_S2MM_BRESP(1 downto 0),
      saxigp5_bvalid => axi_dma_1_M_AXI_S2MM_BVALID,
      saxigp5_rdata(127 downto 0) => NLW_zynq_ultra_ps_e_0_saxigp5_rdata_UNCONNECTED(127 downto 0),
      saxigp5_rid(5 downto 0) => NLW_zynq_ultra_ps_e_0_saxigp5_rid_UNCONNECTED(5 downto 0),
      saxigp5_rlast => NLW_zynq_ultra_ps_e_0_saxigp5_rlast_UNCONNECTED,
      saxigp5_rready => '0',
      saxigp5_rresp(1 downto 0) => NLW_zynq_ultra_ps_e_0_saxigp5_rresp_UNCONNECTED(1 downto 0),
      saxigp5_rvalid => NLW_zynq_ultra_ps_e_0_saxigp5_rvalid_UNCONNECTED,
      saxigp5_wdata(127 downto 0) => axi_dma_1_M_AXI_S2MM_WDATA(127 downto 0),
      saxigp5_wlast => axi_dma_1_M_AXI_S2MM_WLAST,
      saxigp5_wready => axi_dma_1_M_AXI_S2MM_WREADY,
      saxigp5_wstrb(15 downto 0) => axi_dma_1_M_AXI_S2MM_WSTRB(15 downto 0),
      saxigp5_wvalid => axi_dma_1_M_AXI_S2MM_WVALID,
      saxihp0_fpd_aclk => zynq_ultra_ps_e_0_pl_clk0,
      saxihp1_fpd_aclk => zynq_ultra_ps_e_0_pl_clk0,
      saxihp2_fpd_aclk => zynq_ultra_ps_e_0_pl_clk0,
      saxihp3_fpd_aclk => zynq_ultra_ps_e_0_pl_clk0
    );
end STRUCTURE;
