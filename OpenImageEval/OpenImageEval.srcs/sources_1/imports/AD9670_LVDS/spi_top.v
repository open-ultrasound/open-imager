`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Analog Devices Inc.
// Engineer: MKH
// 
// Create Date:    02-22-2011 
// Design Name: 
// Module Name:     
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module spi_top
(
	//			------- SPI inputs -------
	//
	input i_sclk,						// Serial data clock
	input i_csb_n,						// Chip select - active low
	input i_sdi,						// Serial data input
	//
	//			------- SPI outputs -------
	//
	output o_sdo,					// Serial data output
	output [7:0] o_reg_0x0002, // Registered output
	output [7:0] o_reg_0x0003, // Registered output
	output [7:0] o_reg_0x0004, // Registered output
	output [7:0] o_reg_0x0005, // Registered output
	output [7:0] o_reg_0x0006, // Registered output
	output [7:0] o_reg_0x0020, // Registered output
	output [7:0] o_reg_0x0021, // Registered output
	output [7:0] o_reg_0x0022, // Registered output
	output [7:0] o_reg_0x0023,  // Registered output
	output [7:0] o_reg_0x0024  // Registered output
	//
);

localparam integer SPI_ADDR_SIZE = 8;		// Size of SPI address
localparam integer SPI_DATA_SIZE = 8;		// Size of SPI data

wire [SPI_ADDR_SIZE - 1:0] spi_addr;		// Deserialized SPI address
wire [SPI_DATA_SIZE - 1:0] spi_din;			// Deserialized SPI input data
wire [SPI_DATA_SIZE - 1:0] spi_dout;		// Deserialized SPI output data

wire spi_sdo;			// SPI serial data output
wire spi_wen;			// SPI register write enable

// Instantiate tri-state output buffer for SDO.
OBUFT OBUFT_sdo
(
	.O(o_sdo),		// Buffer output (connect directly to top-level port)
	.I(spi_sdo), 	// Buffer input
	.T(i_csb_n) 		// 3-state enable input
);

// Instantiate SPI port.
spi_port #
(
	.ADDR_SIZE(SPI_ADDR_SIZE)		// Address size ([1, 13] for current standard)
)
spi_port
(
	.I_sclk(i_sclk),					// Serial data clock
	._I_csb(i_csb_n),					// Active low chip select
	.I_sdi(i_sdi),						// Serial data input
	.I_dout(spi_dout),				// Parallel data output (input to be encoded into O_sdo)
	.O_sdo(spi_sdo),					// Serial data output
	.O_wen(spi_wen),					// Write enable for parallel data input
	.O_addr(spi_addr),				// Decoded address
	.O_din(spi_din)					// Parallel data input (output decoded from I_sdi)
);

// Instantiate FPGA programming registers.
spi_fpga_reg spi_fpga_reg
(
	.I_clk(i_sclk),					// Master clock
	.I_enable(!i_csb_n),				// Enable for memory access
	.I_wen(spi_wen),					// Register write enable
	.I_addr(spi_addr),				// Input read/write address
	.I_din(spi_din),					// Input data
	.O_dout(spi_dout),				// Output data
	.O_reg_0x0002(o_reg_0x0002),  // Registered output data
	.O_reg_0x0003(o_reg_0x0003),  // Registered output data
	.O_reg_0x0004(o_reg_0x0004),  // Registered output data
	.O_reg_0x0005(o_reg_0x0005),  // Registered output data
	.O_reg_0x0006(o_reg_0x0006),  // Registered output data
	.O_reg_0x0020(o_reg_0x0020),  // Registered output data
	.O_reg_0x0021(o_reg_0x0021),  // Registered output data
	.O_reg_0x0022(o_reg_0x0022),  // Registered output data
	.O_reg_0x0023(o_reg_0x0023),  // Registered output data
	.O_reg_0x0024(o_reg_0x0024)   // Registered output data
);

endmodule
