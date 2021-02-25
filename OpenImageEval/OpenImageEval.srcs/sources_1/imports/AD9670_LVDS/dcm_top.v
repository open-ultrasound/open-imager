//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 		MKH
// 
// Create Date:   06/21/10
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
module dcm_top #
(
	parameter integer DCM_DELAY_BITS = 16,	         // Number of bits in DCM settling counter
	parameter integer REF_FREQ       = 100000000,	// Reference frequency (100MHz default)
	parameter integer LF_MODE_MIN    =  10000000,	// Minimum frequency for "low frequency" mode
	parameter integer LF_MODE_MAX    = 150050000,	// Maximum frequency for "low frequency" mode
	parameter integer HF_MODE_MIN    = 149950000,	// Minimum frequency for "high frequency" mode
	parameter integer HF_MODE_MAX    = 650000000		// Maximum frequency for "high frequency" mode
)
(
	input  i_clk_p,				// Input clock to count
	input  i_clk_n,
	input  i_ref_clk,				// Reference clock
	input  i_reset,				// Reset
	output o_clk,					// Output clock
   output o_dcm_rdy           // DCM ready signal
);

// Clock inputs/outputs
wire dcm_clk0;
wire dcm_clkfb;
wire dcm_clkdvg;
wire dcm_clkin; 
// Locked status
wire dcm_locked;
// Reset
wire dcm_rst;
// Dynamic reconfiguration (DRP)
wire dcm_dclk, dcm_den, dcm_dwe, dcm_drdy;
wire [6:0] dcm_daddr;
wire [15:0] dcm_di, dcm_do;

// Frequency mode and out of range
wire freq_mode, freq_or;
// Frequency set indicator
wire freq_set;
// Count done indicator
wire count_done;
// DCM settling time counter
reg        dcm_rdy;
reg [DCM_DELAY_BITS-1:0] dcm_cnt;

// Assign outputs.
assign o_clk = dcm_clkfb;
assign o_dcm_rdy = dcm_rdy;

// Assign CLKIN, convert LVDS to single-ended
IBUFGDS IB1 (.I(i_clk_p), .IB(i_clk_n), .O(dcm_clkin));
// Assign DCLK.
assign dcm_dclk = i_ref_clk;

// Instantiate DCM.
DCM_ADV DCM_clk (
	.CLK0(dcm_clk0),						// 0 degree DCM CLK output
   .CLKDV(dcm_clkdv),
	.DO(dcm_do),							// 16-bit data output for Dynamic Reconfiguration Port (DRP)
	.DRDY(dcm_drdy),						// Ready output signal from the DRP
	.LOCKED(dcm_locked),					// DCM LOCK status output
	.CLKFB(dcm_clkfb),					// DCM clock feedback
	.CLKIN(dcm_clkin),					// Clock input (from IBUFG, BUFG or DCM)
	.DADDR(dcm_daddr),					// 7-bit address for the DRP
	.DCLK(dcm_dclk),						// Clock for the DRP
	.DEN(dcm_den),							// Enable input for the DRP
	.DI(dcm_di),							// 16-bit data input for the DRP
	.DWE(dcm_dwe),							// Active high allows for writing configuration memory
	.RST(dcm_rst)							// DCM asynchronous reset input
);

// Instantiate clock buffer.
BUFG BUFG_clk1 (
	.O(dcm_clkfb),
	.I(dcm_clk0));

// Instantiate clock buffer for divided output
BUFG BUFG_clkdv (
	.O(dcm_clkdvg),
	.I(dcm_clkdv));
   
// Wait for settling
always @(posedge dcm_clkdvg, negedge i_reset)
   if(i_reset == 1'b0)
      dcm_cnt <= {DCM_DELAY_BITS{1'b0}};
   else if({count_done == 1'b1} && {dcm_locked == 1'b1} && {dcm_cnt != {DCM_DELAY_BITS{1'b1}}})
      dcm_cnt <= dcm_cnt + 1;
   else
      dcm_cnt <= dcm_cnt;
      
always @(posedge dcm_clkdvg, negedge i_reset)
   if(i_reset == 1'b0)
      dcm_rdy <= 1'b0;
   else if(dcm_cnt == {DCM_DELAY_BITS{1'b1}})
      dcm_rdy <= 1'b1;
   else
      dcm_rdy <= dcm_rdy;

// Instantiate DCM controller.
dcm_control dcm_ctrl
(
	.I_clk(dcm_dclk),
	.I_reset(~i_reset),
	.I_dcm_locked(dcm_locked),
	.I_drdy(dcm_drdy),
	.I_do(dcm_do),
	.I_freq_mode(freq_mode),
	.I_freq_or(freq_or),
	.I_freq_set(freq_set),
	.I_phase_word(16'b0),
	.O_dcm_rst(dcm_rst),
	.O_den(dcm_den),
	.O_dwe(dcm_dwe),
	.O_daddr(dcm_daddr),
	.O_di(dcm_di)
);

// Instantiate DCM frequency counter.
dcm_freq_controller # (
	.REF_FREQ(REF_FREQ),
	.LF_MODE_MIN(LF_MODE_MIN),
	.LF_MODE_MAX(LF_MODE_MAX),
	.HF_MODE_MIN(HF_MODE_MIN),
	.HF_MODE_MAX(HF_MODE_MAX)
) dcm_fcnt (
	.i_clk(dcm_clkin), 
	.i_ref_clk(dcm_dclk), 
	.i_reset(i_reset), 
	.o_freq_mode(freq_mode),
	.o_freq_or(freq_or),
	.o_freq_set(freq_set),
   .o_count_done(count_done)
);

endmodule
