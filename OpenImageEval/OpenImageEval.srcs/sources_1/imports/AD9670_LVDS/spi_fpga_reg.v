`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Analog Devices Inc.
// Engineer: MS
// 
// Create Date:    15:30:43 08/28/2007 
// Design Name: 
// Module Name:    fpga_reg 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: This module implements FPGA memory.  The memory has built-in
// soft-reset bit and transfer bit that follows the current ADI SPI specification.
// Also, read-only registers can be implemented.
//
// Dependencies: reg_rw_sp.v, reg_r_sp.v
//
// Revision: 1.00
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

// ******* BEGIN control register addresses. (cr_*) *******

`define cr_CONFIG								8'h00
`define cr_DEVICEID							8'h01

`define cr_REG_02								8'h02
`define cr_REG_03								8'h03
`define cr_REG_04								8'h04
`define cr_REG_05								8'h05
`define cr_REG_06 						   8'h06
`define cr_REG_20								8'h20
`define cr_REG_21								8'h21
`define cr_REG_22								8'h22
`define cr_REG_23								8'h23
`define cr_REG_24								8'h24

// ******* END control register addresses. *******

// ******* BEGIN default register values. (dv_*) *******

`define dv_CONFIG										8'hAA
`define dv_DEVICEID									8'h01

`define dv_REG_02										8'h00
`define dv_REG_03										8'h00
`define dv_REG_04										8'h00
`define dv_REG_05										8'h00
`define dv_REG_06										8'h00
`define dv_REG_20										8'h00
`define dv_REG_21 									8'h00
`define dv_REG_22										8'h00
`define dv_REG_23										8'h00
`define dv_REG_24										8'h00

// ******* END default register values. *******

module spi_fpga_reg
(
	input I_clk,					// Master clock
	input I_enable,				// Enable for memory access
	input I_wen,					// Register write enable
	input [7:0] I_addr,			// Input read/write address
	input [7:0] I_din,			// Input data

	output reg [7:0] O_dout,	      // Output data for SPI controller
	output reg [7:0] O_reg_0x0002,	// Registered output data 	
	output reg [7:0] O_reg_0x0003,	// Registered output data 	
	output reg [7:0] O_reg_0x0004,	// Registered output data 	
	output reg [7:0] O_reg_0x0005,	// Registered output data 	
	output reg [7:0] O_reg_0x0006,	// Registered output data 	
	output reg [7:0] O_reg_0x0020, 	// Registered output data 	
	output reg [7:0] O_reg_0x0021, 	// Registered output data 	
	output reg [7:0] O_reg_0x0022, 	// Registered output data 	
	output reg [7:0] O_reg_0x0023,	// Registered output data 	
	output reg [7:0] O_reg_0x0024 	// Registered output data 	
);

localparam integer DATA_SIZE = 8;		// Data size
localparam integer ADDR_SIZE = 8;		// Address size

// ******* BEGIN register values. (rv_*) *******

wire [DATA_SIZE - 1:0] rv_REG_02;
wire [DATA_SIZE - 1:0] rv_REG_03;
wire [DATA_SIZE - 1:0] rv_REG_04;
wire [DATA_SIZE - 1:0] rv_REG_05;
wire [DATA_SIZE - 1:0] rv_REG_06;
wire [DATA_SIZE - 1:0] rv_REG_20;
wire [DATA_SIZE - 1:0] rv_REG_21;
wire [DATA_SIZE - 1:0] rv_REG_22;
wire [DATA_SIZE - 1:0] rv_REG_23;
wire [DATA_SIZE - 1:0] rv_REG_24;

// ******* END register values. *******

// ******* soft reset not used *******
wire soft_reset_bit = 1'b0;

// Assign data out (tri-state - high impedance if disabled).
always @(*) begin
	if (I_enable) begin
		case (I_addr)
			`cr_CONFIG:
				O_dout <= `dv_CONFIG;
			`cr_DEVICEID:
				O_dout <= `dv_DEVICEID;
			`cr_REG_02:
				O_dout <= rv_REG_02;
			`cr_REG_03:
				O_dout <= rv_REG_03;
			`cr_REG_04:
				O_dout <= rv_REG_04;
			`cr_REG_05:
				O_dout <= rv_REG_05;
			`cr_REG_06:
				O_dout <= rv_REG_06;
			`cr_REG_20:
				O_dout <= rv_REG_20;
			`cr_REG_21:
				O_dout <= rv_REG_21;
			`cr_REG_22:
				O_dout <= rv_REG_22;
			`cr_REG_23:
				O_dout <= rv_REG_23;
			`cr_REG_24:
				O_dout <= rv_REG_24;
			default:
				O_dout <= 8'h00;
		endcase
	end
	else O_dout <= 8'h00;
end

// ******* BEGIN register instantiation *******

//	register 02
spi_reg_rw # (.DEFAULT_VALUE(`dv_REG_02)) REG_02
(
	.I_clk(I_clk), .I_enable(I_addr == `cr_REG_02), .I_wen(I_wen), .I_reset(soft_reset_bit), .I_din(I_din), .O_dout(rv_REG_02)
);

//	register 03
spi_reg_rw # (.DEFAULT_VALUE(`dv_REG_03)) REG_03
(
	.I_clk(I_clk), .I_enable(I_addr == `cr_REG_03), .I_wen(I_wen), .I_reset(soft_reset_bit), .I_din(I_din), .O_dout(rv_REG_03)
);

//	register 04
spi_reg_rw # (.DEFAULT_VALUE(`dv_REG_04)) REG_04
(
	.I_clk(I_clk), .I_enable(I_addr == `cr_REG_04), .I_wen(I_wen), .I_reset(soft_reset_bit), .I_din(I_din), .O_dout(rv_REG_04)
);

//	register 05
spi_reg_rw # (.DEFAULT_VALUE(`dv_REG_05)) REG_05
(
	.I_clk(I_clk), .I_enable(I_addr == `cr_REG_05), .I_wen(I_wen), .I_reset(soft_reset_bit), .I_din(I_din), .O_dout(rv_REG_05)
);

//	register 06
spi_reg_rw # (.DEFAULT_VALUE(`dv_REG_06)) REG_06
(
	.I_clk(I_clk), .I_enable(I_addr == `cr_REG_06), .I_wen(I_wen), .I_reset(soft_reset_bit), .I_din(I_din), .O_dout(rv_REG_06)
);

//	register 20
spi_reg_rw # (.DEFAULT_VALUE(`dv_REG_20)) REG_20
(
	.I_clk(I_clk), .I_enable(I_addr == `cr_REG_20), .I_wen(I_wen), .I_reset(soft_reset_bit), .I_din(I_din), .O_dout(rv_REG_20)
);

//	register 21
spi_reg_rw # (.DEFAULT_VALUE(`dv_REG_21)) REG_21
(
	.I_clk(I_clk), .I_enable(I_addr == `cr_REG_21), .I_wen(I_wen), .I_reset(soft_reset_bit), .I_din(I_din), .O_dout(rv_REG_21)
);

//	register 22
spi_reg_rw # (.DEFAULT_VALUE(`dv_REG_22)) REG_22
(
	.I_clk(I_clk), .I_enable(I_addr == `cr_REG_22), .I_wen(I_wen), .I_reset(soft_reset_bit), .I_din(I_din), .O_dout(rv_REG_22)
);

//	register 23
spi_reg_rw # (.DEFAULT_VALUE(`dv_REG_23)) REG_23
(
	.I_clk(I_clk), .I_enable(I_addr == `cr_REG_23), .I_wen(I_wen), .I_reset(soft_reset_bit), .I_din(I_din), .O_dout(rv_REG_23)
);

//	register 24
spi_reg_rw # (.DEFAULT_VALUE(`dv_REG_24)) REG_24
(
	.I_clk(I_clk), .I_enable(I_addr == `cr_REG_24), .I_wen(I_wen), .I_reset(soft_reset_bit), .I_din(I_din), .O_dout(rv_REG_24)
);

// ******* END registers. *******

// ******* Register data bits *******
always @(negedge I_enable)
	begin	
		O_reg_0x0002 <= rv_REG_02;
		O_reg_0x0003 <= rv_REG_03;
		O_reg_0x0004 <= rv_REG_04;
		O_reg_0x0005 <= rv_REG_05;
		O_reg_0x0006 <= rv_REG_06;
		O_reg_0x0020 <= rv_REG_20;
		O_reg_0x0021 <= rv_REG_21;
		O_reg_0x0022 <= rv_REG_22;
		O_reg_0x0023 <= rv_REG_23;
		O_reg_0x0024 <= rv_REG_24;
	end

endmodule
