//////////////////////////////////////////////////////////////////////////////////
// Company:       Analog Devices, Inc.
// Engineer:      MKH
// 
// Create Date:   07-07-2011 
// Design Name: 
// Module Name:   
// Project Name:        
// Target Devices: 
// Tool versions: 13.1
// Description:         
//                                      
// Dependencies: 
//
// Revision 0.01 - File Created
// Revision: 
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module dut_format #
   (
    parameter ADC_MAX_DATA_SIZE = 16,
    parameter INPUT_CHAN_NUM    = 8,
    parameter BRAM_WORD_NUM     = 16,
    parameter SRAM_WORD_NUM     = 4
   )
   (
   //============================================= 
   // Data, Clock and Control Inputs    
   //============================================= 

   // Input data bus
   input  [ADC_MAX_DATA_SIZE*2*INPUT_CHAN_NUM-1:0]  i_dut_format_data,

   // Input data enable signal
   input                                            i_dut_format_data_en,
    
   // Input data clock
   input                                            i_dut_format_clk,

   // Active low, master reset from FIFO5 USB controller
   input                                            i_dut_format_reset_n,

   // Active low, mwrite enable from FIFO5 USB controller
   input                                            i_dut_format_wr_en_n,

   // Demod mode signal, 0 = IQ (16 word input), 1 = real data (8 word input)
   input                                            i_dut_format_demod_mode,
        
   // Data capture mode select
   input  [1:0]                                     i_dut_format_capture_mode,
        
   // Channel select for single channel capture mode and first read in dual mode
   input  [2:0]                                     i_dut_format_wr_chan_sel_first,
   
   // Channel select for second read in dual capture mode
   input  [2:0]                                     i_dut_format_wr_chan_sel_second,
   
   // System ready signal, DCM is locked and settled
   input                                            i_dut_format_system_rdy,
   
   //============================================= 
   // Data Outputs    
   //============================================= 
   
   // Data enable signal for block RAM
   output                                           o_dut_format_bram_data_en,
  
   // Data outputs for block RAM
   output     [ADC_MAX_DATA_SIZE*BRAM_WORD_NUM-1:0] o_dut_format_bram_data_out,

   // Data enable signal for SRAM
   output                                           o_dut_format_sram_data_en,

   // Data outputs for SRAM
   output     [ADC_MAX_DATA_SIZE*SRAM_WORD_NUM-1:0] o_dut_format_sram_data_out,
   
   // Counter output for SRAM
   output     [2:0]                                 o_dut_format_sram_count,
   
   // Data ready signal
   output                                           o_dut_format_system_rdy
   );

   //==========================================================================
   // LOCAL PARAMETERS
   //==========================================================================
  

   //==========================================================================
   // REGS & WIRES
   //==========================================================================

   reg                                              dut_format_bram_data_en;
   reg                                              dut_format_sram_data_en;
   reg                                              dut_format_data_ready;
   reg  [3:0]                                       dut_format_en_count;
   reg  [4:0]                                       dut_format_clk_count;
   reg  [ADC_MAX_DATA_SIZE-1:0]                     dut_format_wr_chan_first_real;
   reg  [ADC_MAX_DATA_SIZE-1:0]                     dut_format_wr_chan_second_real;
   reg  [ADC_MAX_DATA_SIZE*2-1:0]                   dut_format_wr_chan_first;
   reg  [ADC_MAX_DATA_SIZE*2-1:0]                   dut_format_wr_chan_second;
   reg  [ADC_MAX_DATA_SIZE*2-1:0]                   dut_format_wr_chan_first_real_double;
   reg  [ADC_MAX_DATA_SIZE*2-1:0]                   dut_format_wr_chan_second_real_double;
   reg  [ADC_MAX_DATA_SIZE*2-1:0]                   dut_format_wr_chan_first_iq;
   reg  [ADC_MAX_DATA_SIZE*2-1:0]                   dut_format_wr_chan_second_iq;
   reg  [ADC_MAX_DATA_SIZE*BRAM_WORD_NUM-1:0]       dut_format_wr_chan_first_pipe;
   reg  [ADC_MAX_DATA_SIZE*BRAM_WORD_NUM-1:0]       dut_format_wr_chan_second_pipe;
   reg  [ADC_MAX_DATA_SIZE*BRAM_WORD_NUM-1:0]       dut_format_wr_chan_octal_real;
   reg  [ADC_MAX_DATA_SIZE*BRAM_WORD_NUM-1:0]       dut_format_bram_data_out;
   reg  [ADC_MAX_DATA_SIZE*SRAM_WORD_NUM-1:0]       dut_format_sram_data_out;
   reg  [ADC_MAX_DATA_SIZE*BRAM_WORD_NUM-1:0]       data_bram_single_capture_mode;
   reg  [ADC_MAX_DATA_SIZE*SRAM_WORD_NUM-1:0]       data_sram_single_capture_mode;
   reg  [ADC_MAX_DATA_SIZE*BRAM_WORD_NUM-1:0]       data_bram_dual_capture_mode;
   reg  [ADC_MAX_DATA_SIZE*SRAM_WORD_NUM-1:0]       data_sram_dual_capture_mode;
   reg  [ADC_MAX_DATA_SIZE*BRAM_WORD_NUM-1:0]       data_bram_octal_capture_mode;

   wire [ADC_MAX_DATA_SIZE*(BRAM_WORD_NUM/2)-1:0]   din_f;
   wire [ADC_MAX_DATA_SIZE*(BRAM_WORD_NUM/2)-1:0]   din_s;
   wire [ADC_MAX_DATA_SIZE*BRAM_WORD_NUM-1:0]       din;
   wire [ADC_MAX_DATA_SIZE*BRAM_WORD_NUM-1:0]       data_format_dual_pipe;
   wire [ADC_MAX_DATA_SIZE*BRAM_WORD_NUM-1:0]       dut_format_wr_chan_octal_iq;
   
   //==========================================================================
   // ASSIGNMENTS
   //==========================================================================

   assign din_f  = dut_format_wr_chan_first_pipe[ADC_MAX_DATA_SIZE*(BRAM_WORD_NUM/2)-1:0];
   assign din_s  = dut_format_wr_chan_second_pipe[ADC_MAX_DATA_SIZE*(BRAM_WORD_NUM/2)-1:0];

   assign data_format_dual_pipe = {                         
             din_s[8*ADC_MAX_DATA_SIZE-1:7*ADC_MAX_DATA_SIZE],
             din_f[8*ADC_MAX_DATA_SIZE-1:7*ADC_MAX_DATA_SIZE],
             din_s[7*ADC_MAX_DATA_SIZE-1:6*ADC_MAX_DATA_SIZE],
             din_f[7*ADC_MAX_DATA_SIZE-1:6*ADC_MAX_DATA_SIZE],
             din_s[6*ADC_MAX_DATA_SIZE-1:5*ADC_MAX_DATA_SIZE],
             din_f[6*ADC_MAX_DATA_SIZE-1:5*ADC_MAX_DATA_SIZE],
             din_s[5*ADC_MAX_DATA_SIZE-1:4*ADC_MAX_DATA_SIZE],
             din_f[5*ADC_MAX_DATA_SIZE-1:4*ADC_MAX_DATA_SIZE],
             din_s[4*ADC_MAX_DATA_SIZE-1:3*ADC_MAX_DATA_SIZE],
             din_f[4*ADC_MAX_DATA_SIZE-1:3*ADC_MAX_DATA_SIZE],
             din_s[3*ADC_MAX_DATA_SIZE-1:2*ADC_MAX_DATA_SIZE],
             din_f[3*ADC_MAX_DATA_SIZE-1:2*ADC_MAX_DATA_SIZE],
             din_s[2*ADC_MAX_DATA_SIZE-1:1*ADC_MAX_DATA_SIZE],
             din_f[2*ADC_MAX_DATA_SIZE-1:1*ADC_MAX_DATA_SIZE],
             din_s[1*ADC_MAX_DATA_SIZE-1:0*ADC_MAX_DATA_SIZE],
             din_f[1*ADC_MAX_DATA_SIZE-1:0*ADC_MAX_DATA_SIZE]};

   assign din = i_dut_format_data;

   assign dut_format_wr_chan_octal_iq = {                         
             din[16*ADC_MAX_DATA_SIZE-1:15*ADC_MAX_DATA_SIZE],
             din[14*ADC_MAX_DATA_SIZE-1:13*ADC_MAX_DATA_SIZE],
             din[12*ADC_MAX_DATA_SIZE-1:11*ADC_MAX_DATA_SIZE],
             din[10*ADC_MAX_DATA_SIZE-1: 9*ADC_MAX_DATA_SIZE],
             din[ 8*ADC_MAX_DATA_SIZE-1: 7*ADC_MAX_DATA_SIZE],
             din[ 6*ADC_MAX_DATA_SIZE-1: 5*ADC_MAX_DATA_SIZE],
             din[ 4*ADC_MAX_DATA_SIZE-1: 3*ADC_MAX_DATA_SIZE],
             din[ 2*ADC_MAX_DATA_SIZE-1: 1*ADC_MAX_DATA_SIZE],
             din[15*ADC_MAX_DATA_SIZE-1:14*ADC_MAX_DATA_SIZE],
             din[13*ADC_MAX_DATA_SIZE-1:12*ADC_MAX_DATA_SIZE],
             din[11*ADC_MAX_DATA_SIZE-1:10*ADC_MAX_DATA_SIZE],
             din[ 9*ADC_MAX_DATA_SIZE-1: 8*ADC_MAX_DATA_SIZE],
             din[ 7*ADC_MAX_DATA_SIZE-1: 6*ADC_MAX_DATA_SIZE],
             din[ 5*ADC_MAX_DATA_SIZE-1: 4*ADC_MAX_DATA_SIZE],
             din[ 3*ADC_MAX_DATA_SIZE-1: 2*ADC_MAX_DATA_SIZE],
             din[ 1*ADC_MAX_DATA_SIZE-1: 0*ADC_MAX_DATA_SIZE]};
   
   //==========================================================================
   // Generate data ready signal
   //==========================================================================
   always @(posedge i_dut_format_clk or negedge i_dut_format_reset_n)
      if(i_dut_format_reset_n == 1'b0)
         dut_format_data_ready <= 1'b0;
      else if({i_dut_format_wr_en_n == 1'b0} && {i_dut_format_data_en == 1'b1})
        dut_format_data_ready <= i_dut_format_system_rdy;
      else
         dut_format_data_ready <= dut_format_data_ready;
         
   assign o_dut_format_system_rdy = dut_format_data_ready;

   //==========================================================================
   // Keep track of enable count
   //==========================================================================
   always @(posedge i_dut_format_clk or negedge i_dut_format_reset_n)
      if(i_dut_format_reset_n == 1'b0)
         dut_format_en_count <= 4'b0;
      else if({dut_format_data_ready == 1'b1} && {i_dut_format_data_en == 1'b1})
         dut_format_en_count <= dut_format_en_count + 1;
      else
         dut_format_en_count <= dut_format_en_count;

   //==========================================================================
   // Keep track of clock count
   //==========================================================================
   always @(posedge i_dut_format_clk or negedge i_dut_format_reset_n)
      if(i_dut_format_reset_n == 1'b0)
         dut_format_clk_count <= 5'b0;
      else if(dut_format_data_ready == 1'b1)
         dut_format_clk_count <= dut_format_clk_count + 1;
      else
         dut_format_clk_count <= dut_format_clk_count;
         
   assign o_dut_format_sram_count = dut_format_clk_count[2:0];

   //==========================================================================
   // Select channel for single and dual channel capture modes
   //==========================================================================
   // Real data
   always @(posedge i_dut_format_clk or negedge i_dut_format_reset_n)
      if(i_dut_format_reset_n == 1'b0)
         dut_format_wr_chan_first_real <= {ADC_MAX_DATA_SIZE{1'b0}};
      else if(i_dut_format_data_en == 1'b1)
         dut_format_wr_chan_first_real <= i_dut_format_data[i_dut_format_wr_chan_sel_first*ADC_MAX_DATA_SIZE +: ADC_MAX_DATA_SIZE];
      else
         dut_format_wr_chan_first_real <= dut_format_wr_chan_first_real;

   always @(posedge i_dut_format_clk or negedge i_dut_format_reset_n)
      if(i_dut_format_reset_n == 1'b0)
         dut_format_wr_chan_second_real <= {ADC_MAX_DATA_SIZE{1'b0}};
      else if(i_dut_format_data_en == 1'b1)
         dut_format_wr_chan_second_real <= i_dut_format_data[i_dut_format_wr_chan_sel_second*ADC_MAX_DATA_SIZE +: ADC_MAX_DATA_SIZE];
      else
         dut_format_wr_chan_second_real <= dut_format_wr_chan_second_real;

   // IQ data
   always @(posedge i_dut_format_clk or negedge i_dut_format_reset_n)
      if(i_dut_format_reset_n == 1'b0)
         dut_format_wr_chan_first_iq <= {ADC_MAX_DATA_SIZE*2{1'b0}};
      else if(i_dut_format_data_en == 1'b1)
         dut_format_wr_chan_first_iq <= i_dut_format_data[i_dut_format_wr_chan_sel_first*2*ADC_MAX_DATA_SIZE +: ADC_MAX_DATA_SIZE*2];
      else
         dut_format_wr_chan_first_iq <= dut_format_wr_chan_first_iq;

   always @(posedge i_dut_format_clk or negedge i_dut_format_reset_n)
      if(i_dut_format_reset_n == 1'b0)
         dut_format_wr_chan_second_iq <= {ADC_MAX_DATA_SIZE*2{1'b0}};
      else if(i_dut_format_data_en == 1'b1)
         dut_format_wr_chan_second_iq <= i_dut_format_data[i_dut_format_wr_chan_sel_second*2*ADC_MAX_DATA_SIZE +: ADC_MAX_DATA_SIZE*2];
      else
         dut_format_wr_chan_second_iq <= dut_format_wr_chan_second_iq;

   //==========================================================================
   // Double-up real data to match width of IQ data for single and dual channel capture modes
   //==========================================================================
   always @(posedge i_dut_format_clk or negedge i_dut_format_reset_n)
      if(i_dut_format_reset_n == 1'b0)
         dut_format_wr_chan_first_real_double <= {ADC_MAX_DATA_SIZE*2{1'b0}};
      else if(i_dut_format_data_en == 1'b1)
         dut_format_wr_chan_first_real_double <= {dut_format_wr_chan_first_real, dut_format_wr_chan_first_real_double[ADC_MAX_DATA_SIZE*2-1:ADC_MAX_DATA_SIZE]};
      else
         dut_format_wr_chan_first_real_double <= dut_format_wr_chan_first_real_double;

   always @(posedge i_dut_format_clk or negedge i_dut_format_reset_n)
      if(i_dut_format_reset_n == 1'b0)
         dut_format_wr_chan_second_real_double <= {ADC_MAX_DATA_SIZE*2{1'b0}};
      else if(i_dut_format_data_en == 1'b1)
         dut_format_wr_chan_second_real_double <= {dut_format_wr_chan_second_real, dut_format_wr_chan_second_real_double[ADC_MAX_DATA_SIZE*2-1:ADC_MAX_DATA_SIZE]};
      else
         dut_format_wr_chan_second_real_double <= dut_format_wr_chan_second_real_double;
   
   //==========================================================================
   // Select data based on demod mode for single and dual channel capture modes
   //==========================================================================
   always @(posedge i_dut_format_clk or negedge i_dut_format_reset_n)
      if(i_dut_format_reset_n == 1'b0)
         dut_format_wr_chan_first <= {ADC_MAX_DATA_SIZE*2{1'b0}};
      else if({i_dut_format_data_en == 1'b1} && {i_dut_format_demod_mode == 1'b1} && {dut_format_en_count[0] == 1'b1})
         dut_format_wr_chan_first <= dut_format_wr_chan_first_real_double;
      else if({i_dut_format_data_en == 1'b1} && {i_dut_format_demod_mode == 1'b0})
         dut_format_wr_chan_first <= dut_format_wr_chan_first_iq;
      else
         dut_format_wr_chan_first <= dut_format_wr_chan_first;

   always @(posedge i_dut_format_clk or negedge i_dut_format_reset_n)
      if(i_dut_format_reset_n == 1'b0)
         dut_format_wr_chan_second <= {ADC_MAX_DATA_SIZE*2{1'b0}};
      else if({i_dut_format_data_en == 1'b1} && {i_dut_format_demod_mode == 1'b1} && {dut_format_en_count[0] == 1'b1})
         dut_format_wr_chan_second <= dut_format_wr_chan_second_real_double;
      else if({i_dut_format_data_en == 1'b1} && {i_dut_format_demod_mode == 1'b0})
         dut_format_wr_chan_second <= dut_format_wr_chan_second_iq;
      else
         dut_format_wr_chan_second <= dut_format_wr_chan_second;
   
   //==========================================================================
   // Pipeline data for single and dual channel capture modes
   //==========================================================================
   always @(posedge i_dut_format_clk or negedge i_dut_format_reset_n)
      if(i_dut_format_reset_n == 1'b0)
         dut_format_wr_chan_first_pipe <= {ADC_MAX_DATA_SIZE*BRAM_WORD_NUM{1'b0}};
      else if({i_dut_format_data_en == 1'b1} && {{{i_dut_format_demod_mode == 1'b1} && {dut_format_en_count[0] == 1'b1}} || {i_dut_format_demod_mode == 1'b0}})
         dut_format_wr_chan_first_pipe <= {dut_format_wr_chan_first, dut_format_wr_chan_first_pipe[ADC_MAX_DATA_SIZE*BRAM_WORD_NUM-1:ADC_MAX_DATA_SIZE*2]}; 
      else
         dut_format_wr_chan_first_pipe <= dut_format_wr_chan_first_pipe;

   always @(posedge i_dut_format_clk or negedge i_dut_format_reset_n)
      if(i_dut_format_reset_n == 1'b0)
         dut_format_wr_chan_second_pipe <= {ADC_MAX_DATA_SIZE*BRAM_WORD_NUM{1'b0}};
      else if({i_dut_format_data_en == 1'b1} && {{{i_dut_format_demod_mode == 1'b1} && {dut_format_en_count[0] == 1'b1}} || {i_dut_format_demod_mode == 1'b0}})
         dut_format_wr_chan_second_pipe <= {dut_format_wr_chan_second, dut_format_wr_chan_second_pipe[ADC_MAX_DATA_SIZE*BRAM_WORD_NUM-1:ADC_MAX_DATA_SIZE*2]}; 
      else
         dut_format_wr_chan_second_pipe <= dut_format_wr_chan_second_pipe;

   //==========================================================================
   // Register block RAM data for single capture mode
   //==========================================================================
   always @(posedge i_dut_format_clk or negedge i_dut_format_reset_n)
      if(i_dut_format_reset_n == 1'b0)
         data_bram_single_capture_mode <= {ADC_MAX_DATA_SIZE*BRAM_WORD_NUM{1'b0}};
      else if({{{dut_format_en_count == 4'b1111} && {i_dut_format_demod_mode == 1'b1}} || {dut_format_en_count[2:0] == 3'b111}})
         data_bram_single_capture_mode <= dut_format_wr_chan_first_pipe;
      else
         data_bram_single_capture_mode <= data_bram_single_capture_mode;

   //==========================================================================
   // Register SRAM data for single capture mode
   //==========================================================================
   always @(posedge i_dut_format_clk or negedge i_dut_format_reset_n)
      if(i_dut_format_reset_n == 1'b0)
         data_sram_single_capture_mode <= {ADC_MAX_DATA_SIZE*SRAM_WORD_NUM{1'b0}};
      else if(dut_format_clk_count[1:0] == 2'b11)
         data_sram_single_capture_mode <= dut_format_wr_chan_first_pipe[ADC_MAX_DATA_SIZE*SRAM_WORD_NUM-1:0];
      else
         data_sram_single_capture_mode <= data_sram_single_capture_mode;

   //==========================================================================
   // Register block RAM data for dual capture mode
   //==========================================================================
   always @(posedge i_dut_format_clk or negedge i_dut_format_reset_n)
      if(i_dut_format_reset_n == 1'b0)
         data_bram_dual_capture_mode <= {ADC_MAX_DATA_SIZE*BRAM_WORD_NUM{1'b0}};
      else if({{{dut_format_en_count == 3'b111} && {i_dut_format_demod_mode == 1'b1}} || {dut_format_en_count[1:0] == 2'b11}})
         data_bram_dual_capture_mode <= data_format_dual_pipe;
      else
         data_bram_dual_capture_mode <= data_bram_dual_capture_mode;

   //==========================================================================
   // Register SRAM data for dual capture mode
   //==========================================================================
   always @(posedge i_dut_format_clk or negedge i_dut_format_reset_n)
      if(i_dut_format_reset_n == 1'b0)
         data_sram_dual_capture_mode <= {ADC_MAX_DATA_SIZE*SRAM_WORD_NUM{1'b0}};
      else if(dut_format_clk_count[0] == 1'b1)
         data_sram_dual_capture_mode <= data_format_dual_pipe[ADC_MAX_DATA_SIZE*SRAM_WORD_NUM-1:0];
      else
         data_sram_dual_capture_mode <= data_sram_dual_capture_mode;

   //==========================================================================
   // Double-up real data to match width of IQ data for octal channel capture mode
   //==========================================================================
   always @(posedge i_dut_format_clk or negedge i_dut_format_reset_n)
      if(i_dut_format_reset_n == 1'b0)
         dut_format_wr_chan_octal_real <= {ADC_MAX_DATA_SIZE*BRAM_WORD_NUM{1'b0}};
      else if(i_dut_format_data_en == 1'b1)
         dut_format_wr_chan_octal_real <= {i_dut_format_data, dut_format_wr_chan_octal_real[ADC_MAX_DATA_SIZE*BRAM_WORD_NUM-1:ADC_MAX_DATA_SIZE*(BRAM_WORD_NUM/2)]};
      else
         dut_format_wr_chan_octal_real <= dut_format_wr_chan_octal_real;
   
   //==========================================================================
   // Select data based on demod mode for octal capture mode
   //==========================================================================
   always @(posedge i_dut_format_clk or negedge i_dut_format_reset_n)
      if(i_dut_format_reset_n == 1'b0)
         data_bram_octal_capture_mode <= {ADC_MAX_DATA_SIZE*BRAM_WORD_NUM{1'b0}};
      else if({i_dut_format_data_en == 1'b1} && {i_dut_format_demod_mode == 1'b1})
         data_bram_octal_capture_mode <= dut_format_wr_chan_octal_real;
      else if(i_dut_format_data_en == 1'b1)
         data_bram_octal_capture_mode <= dut_format_wr_chan_octal_iq;
      else
         data_bram_octal_capture_mode <= data_bram_octal_capture_mode;

   //==========================================================================
   // Generate block RAM output enable signal 
   //==========================================================================
   always @(posedge i_dut_format_clk or negedge i_dut_format_reset_n)
      if(i_dut_format_reset_n == 1'b0)
         dut_format_bram_data_en <= 1'b0;
      else if({{i_dut_format_system_rdy == 1'b1} && {i_dut_format_demod_mode == 1'b1}})
         case(i_dut_format_capture_mode)
            2'b00:   dut_format_bram_data_en <= {{dut_format_en_count[3:0] == 4'b1111} && {i_dut_format_data_en == 1'b1}};
            2'b01:   dut_format_bram_data_en <= {{dut_format_en_count[2:0] == 3'b111} && {i_dut_format_data_en == 1'b1}};     
            2'b10:   dut_format_bram_data_en <= 1'b0;  
            2'b11:   dut_format_bram_data_en <= {{dut_format_en_count[0] == 1'b1} && {i_dut_format_data_en == 1'b1}}; 
            default: dut_format_bram_data_en <= 1'b0;
         endcase // case (i_dut_format_capture_mode)
      else if({{i_dut_format_system_rdy == 1'b1} && {i_dut_format_demod_mode == 1'b0}})
         case(i_dut_format_capture_mode)
            2'b00:   dut_format_bram_data_en <= {{dut_format_en_count[2:0] == 3'b111} && {i_dut_format_data_en == 1'b1}};
            2'b01:   dut_format_bram_data_en <= {{dut_format_en_count[1:0] == 2'b11} && {i_dut_format_data_en == 1'b1}};     
            2'b10:   dut_format_bram_data_en <= 1'b0;  
            2'b11:   dut_format_bram_data_en <= {i_dut_format_data_en == 1'b1};
            default: dut_format_bram_data_en <= 1'b0;
         endcase // case (i_dut_format_capture_mode)      
      else
         dut_format_bram_data_en <= dut_format_bram_data_en;

   assign o_dut_format_bram_data_en = dut_format_bram_data_en;

   //==========================================================================
   // Register block RAM output data
   //
   // BRAM_WORD_NUM = 16
   //
   // Data format for each capture mode is as follows:
   //
   // Single channel capture
   //    Real = f15,f14,f13,f12,f11,f10,f9,f8,f7,f6,f5,f4,f3,f2,f1,f0
   //    IQ   = q7 ,i7 ,q6 ,i6 ,q5 ,i5 ,q4,i4,q3,i3,q2,i2,q1,i1,q0,i0
   //
   // Dual channel capture (f = first channel, s = second channel)
   //    Real = s7 ,f7 ,s6 ,f6 ,s5 ,f5 ,s4 ,f4 ,s3 ,f3 ,s2 ,f2 ,s1 ,f1 ,s0 ,f0
   //    IQ   = sq3,fq3,si3,fi3,sq2,fq2,si2,fi2,sq1,fq1,si1,fi1,sq0,fq0,si0,fi0
   //
   // Quad channel capture - not used
   //
   // Octal channel capture
   //    Real = h1 ,g1 ,f1 ,e1 ,d1 ,c1 ,b1 ,a1 ,h0 ,g0 ,f0 ,e0 ,d0 ,c0 ,b0 ,a0
   //    IQ   = hq0,gq0,fq0,eq0,dq0,cq0,bq0,aq0,hi0,gi0,fi0,ei0,di0,ci0,bi0,ai0
   //
   //==========================================================================
   always @(posedge i_dut_format_clk or negedge i_dut_format_reset_n)
      if(i_dut_format_reset_n == 1'b0)
         begin
            dut_format_bram_data_out <= {ADC_MAX_DATA_SIZE*BRAM_WORD_NUM{1'b0}};
         end
      else if(o_dut_format_bram_data_en == 1'b1)
         begin
            case(i_dut_format_capture_mode)
               2'b00:   dut_format_bram_data_out <= data_bram_single_capture_mode;           
               2'b01:   dut_format_bram_data_out <= data_bram_dual_capture_mode;                  
               2'b10:   dut_format_bram_data_out <= {ADC_MAX_DATA_SIZE*BRAM_WORD_NUM{1'b0}}; 
               2'b11:   dut_format_bram_data_out <= data_bram_octal_capture_mode;            
               default: dut_format_bram_data_out <= {ADC_MAX_DATA_SIZE*BRAM_WORD_NUM{1'b0}};
            endcase
         end
      else
         begin
            dut_format_bram_data_out <= dut_format_bram_data_out;
         end

   assign o_dut_format_bram_data_out = dut_format_bram_data_out;

   //==========================================================================
   // Generate SRAM output enable signal 
   //==========================================================================
   always @(posedge i_dut_format_clk or negedge i_dut_format_reset_n)
      if(i_dut_format_reset_n == 1'b0)
         dut_format_sram_data_en <= 1'b0;
      else if(i_dut_format_system_rdy == 1'b1)
          case(i_dut_format_capture_mode)
            2'b00:   dut_format_sram_data_en <= {dut_format_clk_count[1:0] == 2'b11};
            2'b01:   dut_format_sram_data_en <= {dut_format_clk_count[0] == 1'b1};     
            2'b10:   dut_format_sram_data_en <= 1'b0;  
            2'b11:   dut_format_sram_data_en <= 1'b0;
            default: dut_format_sram_data_en <= 1'b0;
         endcase
      else
         dut_format_sram_data_en <= dut_format_sram_data_en;

   assign o_dut_format_sram_data_en = dut_format_sram_data_en;

   //==========================================================================
   // Register SRAM output data
   //
   // SRAM_WORD_NUM = 4
   //
   // Data format for each capture mode is as follows:
   //
   // Single channel capture
   //    Real = f3,f2,f1,f0
   //    IQ   = q1,i1,q0,i0
   //
   // Dual channel capture (f = first channel, s = second channel)
   //    Real = s1 ,f1 ,s0 ,f0
   //    IQ   = sq0,fq0,si0,fi0
   //
   // Quad channel capture - not used
   //
   // Octal channel capture - not used
   //
   //==========================================================================
   always @(posedge i_dut_format_clk or negedge i_dut_format_reset_n)
      if(i_dut_format_reset_n == 1'b0)
         begin
            dut_format_sram_data_out <= {ADC_MAX_DATA_SIZE*SRAM_WORD_NUM{1'b0}};
         end
      else if(o_dut_format_sram_data_en == 1'b1)
         begin
            case(i_dut_format_capture_mode)
               2'b00:   dut_format_sram_data_out <= data_sram_single_capture_mode;           
               2'b01:   dut_format_sram_data_out <= data_sram_dual_capture_mode;                  
               2'b10:   dut_format_sram_data_out <= {ADC_MAX_DATA_SIZE*SRAM_WORD_NUM{1'b0}};    
               2'b11:   dut_format_sram_data_out <= {ADC_MAX_DATA_SIZE*SRAM_WORD_NUM{1'b0}}; 
               default: dut_format_sram_data_out <= {ADC_MAX_DATA_SIZE*SRAM_WORD_NUM{1'b0}};
            endcase
         end
      else
         begin
            dut_format_sram_data_out <= dut_format_sram_data_out;
         end

   assign o_dut_format_sram_data_out = dut_format_sram_data_out;

endmodule
