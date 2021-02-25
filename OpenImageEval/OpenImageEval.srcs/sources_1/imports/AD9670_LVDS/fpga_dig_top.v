//////////////////////////////////////////////////////////////////////////////////
// Company: 		Analog Devices, Inc.
// Engineer: 		MKH
// 
// Create Date:   07-05-2011 
// Design Name: 
// Module Name:   
// Project Name:	
// Target Devices: 
// Tool versions: 13.1
// Description: 	Top level verilog module
//					
// Dependencies: 
//
// Revision 0.01 - File Created
// Revision: 
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module fpga_dig_top #(

   // ADC_MAX_DATA_SIZE
   // Max number of ADC bits (resolution), actual number of bits is set using SPI on some ADCs
   // Range = 8 - 16
   parameter ADC_MAX_DATA_SIZE = 16,

   // IDDR_DATA_SIZE
   // Number of ADC bits from IDDR block
   // Range = 8 - 18
   parameter IDDR_DATA_SIZE = 8,

   // INPUT_WORD_NUM
   // Number of data words per ADC channel (or data lane) from input data capture block
   // Range = 1, 2, 4, 8
   parameter INPUT_WORD_NUM = 1,

   // INPUT_CHAN_NUM
   // Number of ADC channels or data lanes
   // Range = 1, 2, 4, 8
   parameter INPUT_CHAN_NUM = 8,  

   // BRAM_WORD_NUM
   // Number of data words per write/read cycle
   // Range = 8 MIN ... 64 MAX
   parameter BRAM_WORD_NUM = 16,  

   // SRAM_WORD_NUM
   // Number of data words per write/read cycle
   // Range = 4
   parameter SRAM_WORD_NUM = 4,  

   // DCM_DELAY_BITS
   // Number of data bits in DCM settling delay counter
   // Range = 1 - 16
   parameter DCM_DELAY_BITS = 12  
   )

  (
   //============================================= 
   // ADC Data and Clock Inputs    
   //============================================= 

   // Source-synchronous clock inputs
   input                                             lvds_dco_p,     
   input                                             lvds_dco_n,

   // Frame clock inputs   
   input                                             lvds_fco_p, 
   input                                             lvds_fco_n,

   // Source-synchronous data inputs   
   input  [IDDR_DATA_SIZE-1:0]                       lvds_data_p,  
   input  [IDDR_DATA_SIZE-1:0]                       lvds_data_n,  
   
   //============================================= 
   // USB Control Signals    
   //============================================= 
   
   // master reset, active low, synchronous with usb_read_clk
   input                                             usb_master_rst_n,
    
   // write enable, active low, synchronous with usb_read_clk
   input                                             usb_write_en_n,
    
   // read enable, active low, synchronous with usb_read_clk
   input                                             usb_read_en_n,
    
   // read clock, 48 MHz, always active except when write enable is active
   input                                             usb_read_clk,
    
   // data ready indicator
   output                                            usb_ready,

   //============================================= 
   // SPI Control Signals    
   //============================================= 
    
   // SPI clock
   input                                             spi_sclk,

   // SPI chip select, active low
   input                                             spi_csb_n,

   // SPI serial data input
   input                                             spi_sdi,

   // SPI serial data output
   output                                            spi_sdo,
   
   //============================================= 
   // SRAM Control Signals    
   //============================================= 
    
   // SRAM address
   output [19:0]                                     sram_address,

   // SRAM K clock
   output                                            sram_k,

   // SRAM K clock, out of phase
   output                                            sram_k_b,

   // SRAM RW control
   output                                            sram_rw,

   // SRAM DLL control
   output                                            sram_dll_off,

   // SRAM LOAD control
   output                                            sram_load,

   // SRAM common IO data lines, SRAM A
   inout   [ADC_MAX_DATA_SIZE*(SRAM_WORD_NUM/2)-1:0] sram_data_a,

   // SRAM common IO data lines, SRAM B
   inout   [ADC_MAX_DATA_SIZE*(SRAM_WORD_NUM/2)-1:0] sram_data_b,

   //============================================= 
   // Misc Control Signals    
   //============================================= 

   // DCM controller reference clock, 100 MHz
   input                                             fifo5_reference_clk,

   // External data capture trigger, SMA1, J7
   input                                             ext_trig,            
    
   // System clock ready indicator, SMA2, J5
   output                                            sysclk_ready,  

   // TX Trig DUT start code control signal
   output                                            tx_trig,   

   //============================================= 
   // Data Output to USB Controller    
   //============================================= 
    
   // Data output to USB controller, MSB justified
   output [15:0]                                     usb_data_out
   ); 

   //-------------------------------------------------------------------------------------------
   // Wire and register declarations
   //-------------------------------------------------------------------------------------------
   wire                                          dcm_rdy;
   wire                                          demod_mode;
   wire                                          ext_trig_en;
   wire                                          use_old_zero;
   wire [1:0]                                    bit_sel;
   wire [1:0]                                    lane_number;
   wire [1:0]                                    capture_mode;
   wire [2:0]                                    start_code_chan_sel;
   wire [2:0]                                    wr_chan_sel_first;
   wire [2:0]                                    wr_chan_sel_second;
   wire [2:0]                                    rd_chan_sel;
   wire [4:0]                                    dec_factor;
   wire [7:0]                                    spi_reg_0x0003;
   wire [7:0]                                    spi_reg_0x0004;
   wire [7:0]                                    spi_reg_0x0005;
   wire [7:0]                                    spi_reg_0x0006;
   wire [7:0]                                    spi_reg_0x0020;
   wire [7:0]                                    spi_reg_0x0021;
   wire [7:0]                                    spi_reg_0x0022;
   wire [7:0]                                    spi_reg_0x0023;
   wire [7:0]                                    spi_reg_0x0024;
   wire [7:0]                                    start_msbyte;
   wire [7:0]                                    start_lsbyte;
   wire [15:0]                                   user_start_code;
   wire                                          user_start_code_en;
   wire                                          start_code_bypass;
   wire                                          lvds_fco_buf;
   wire [IDDR_DATA_SIZE-1:0]                     lvds_data_buf;
   wire [ADC_MAX_DATA_SIZE-1:0]                  data_lane0;
   wire [ADC_MAX_DATA_SIZE-1:0]                  data_lane1;
   wire [ADC_MAX_DATA_SIZE-1:0]                  data_lane2;
   wire [ADC_MAX_DATA_SIZE-1:0]                  data_lane3;
   wire [ADC_MAX_DATA_SIZE-1:0]                  data_lane4;
   wire [ADC_MAX_DATA_SIZE-1:0]                  data_lane5;
   wire [ADC_MAX_DATA_SIZE-1:0]                  data_lane6;
   wire [ADC_MAX_DATA_SIZE-1:0]                  data_lane7;
   wire [ADC_MAX_DATA_SIZE*INPUT_CHAN_NUM-1:0]   dut_format_data_in;
   wire [ADC_MAX_DATA_SIZE*BRAM_WORD_NUM-1:0]    main_memory_bram_wr_data;
   wire [ADC_MAX_DATA_SIZE*SRAM_WORD_NUM-1:0]    main_memory_sram_wr_data;
   wire [2:0]                                    main_memory_sram_wr_count;
 
   wire                                          word_deframer_data_en;
   wire [ADC_MAX_DATA_SIZE*2*INPUT_CHAN_NUM-1:0] word_deframer_data;
 
   //-------------------------------------------------------------------------------------------
   // Assignments
   //-------------------------------------------------------------------------------------------
   assign usb_ready           = 1'b1;
   assign capture_mode        = spi_reg_0x0003[1:0];
   assign wr_chan_sel_first   = spi_reg_0x0004[2:0];
   assign wr_chan_sel_second  = spi_reg_0x0004[6:4];
   assign rd_chan_sel         = spi_reg_0x0005[2:0];
   assign debug_ramp_en       = spi_reg_0x0006[0];
   assign ext_trig_en         = spi_reg_0x0006[1];
   assign demod_mode          = spi_reg_0x0020[0];
   assign lane_number         = spi_reg_0x0020[2:1];
   assign dec_factor          = spi_reg_0x0020[7:3];
   assign start_msbyte        = spi_reg_0x0021;
   assign start_lsbyte        = spi_reg_0x0022;
   assign bit_sel             = spi_reg_0x0023[1:0];
   assign user_start_code_en  = spi_reg_0x0023[2];
   assign start_code_bypass   = spi_reg_0x0023[3];
   assign use_old_zero        = spi_reg_0x0023[4];
   assign start_code_chan_sel = spi_reg_0x0024[2:0];
   assign sysclk_ready        = dcm_rdy;

   assign user_start_code = {start_msbyte, start_lsbyte};
   assign dcm_rdy             = 1'b1;
   
   //-------------------------------------------------------------------------------------------
   //-------------------------------------------------------------------------------------------
   // Instantiate SPI controller
   //
   // SPI map for register 0x0003, bit[1:0]
   // 00 = Single channel data capture mode, 64k BRAM plus 4M SRAM
   // 01 = Dual channel data capture mode, 32k BRAM plus 2M SRAM per channel
   // 10 = Not used
   // 11 = Octal channel data capture mode, 8k BRAM per channel, no SRAM 
   //
   // SPI map for register 0x0004, bit[5:3] and bit[2:0]
   // bit[2:0] channel select for single and dual capture modes, first read channel in dual mode
   // bit[5:3] channel select for dual capture mode, second read channel
   // 000: Channel A
   // 001: Channel B
   // 010: Channel C
   // 011: Channel D
   // 100: Channel E
   // 101: Channel F
   // 110: Channel G
   // 111: Channel H
   //
   // SPI map for register 0x0005, bit[2:0]
   // Read channel select
   // 000: First read channel,   channel A in octal mode
   // 001: Second read channel,  channel B in octal mode
   // 010: Third read channel,   channel C in octal mode  
   // 011: Fourth read channel,  channel D in octal mode  
   // 100: Fifth read channel,   channel E in octal mode  
   // 101: Sixth read channel,   channel F in octal mode  
   // 110: Seventh read channel, channel G in octal mode  
   // 111: Eighth read channel,  channel H in octal mode  
   //
   // SPI map for register 0x0006
   // bit[0]: 0 = Normal data, 1 = debug ramp enable
   // bit[1]: 0 = External trigger disabled, 1 = external trigger enabled, pulse must be wider than ADC sample period
   //
   // SPI map for register 0x0020
   // bit[0]: 0 = IQ data, 1 = Real data
   // bit[2:1]: Number of lanes, 00 = 8, 01 = 4, 10 = 2, 11 = 1
   // bit[7:3]: Decimation factor, 00000 = 1, 00001 = 2, 00010 = 3, etc.
   //
   // SPI map for register 0x0021
   // bit[7:0]: Most Significant Byte of user defined start code, must match DUT setting
   //
   // SPI map for register 0x0022
   // bit[7:0]: Least Significant Byte of user defined start code, must match DUT setting
   //
   // SPI map for register 0x0023
   // bit[1:0]: 00 = 12-bit ADC, 01 = 14-bit ADC, 10 = 16-bit ADC, 11 = Not used
   // bit[2]: 0 = use default start code, 1 = use start code defined by FPGA SPI registers 0x008 and 0x009
   // bit[3]: 0 = use start code, 1 = bypass start code
   // bit[4]: 0 = use new zero sample settings, 1 = use original zero sample settings
   //
   // SPI map for register 0x0024
   // bit[2:0]: Start code channel select, uses same channel assignments as register 0x0005.
   //
   //-------------------------------------------------------------------------------------------
   //-------------------------------------------------------------------------------------------
   spi_top spi_top
       (// Outputs
 	     .o_sdo                           (spi_sdo), 
	     .o_reg_0x0003                    (spi_reg_0x0003),
        .o_reg_0x0004                    (spi_reg_0x0004),
        .o_reg_0x0005                    (spi_reg_0x0005),
        .o_reg_0x0006                    (spi_reg_0x0006),
        .o_reg_0x0020                    (spi_reg_0x0020),
        .o_reg_0x0021                    (spi_reg_0x0021),
        .o_reg_0x0022                    (spi_reg_0x0022),
        .o_reg_0x0023                    (spi_reg_0x0023),
        .o_reg_0x0024                    (spi_reg_0x0024),
        // Inputs
        .i_sclk                          (spi_sclk),
	     .i_csb_n                         (spi_csb_n),
	     .i_sdi                           (spi_sdi)); 

   //-------------------------------------------------------------------------------------------
   // Auto-configure DCM for DCO
   //-------------------------------------------------------------------------------------------
//   dcm_top  
//      #(// Parameters
//        .DCM_DELAY_BITS                  (DCM_DELAY_BITS)
//        )
//      dcm_top
//      (// Outputs
//   	.o_clk                             (dco),
//      .o_dcm_rdy                         (dcm_rdy),
//       // Inputs
//   	.i_reset                           (usb_master_rst_n),
//      .i_clk_p                           (lvds_dco_p),
//   	.i_clk_n                           (lvds_dco_n),
//    	.i_ref_clk                         (fifo5_reference_clk));

	IBUFGDS IB1 (.I(lvds_dco_p), .IB(lvds_dco_n), .O(dco));

   //-------------------------------------------------------------------------------------------
   // Buffer input data, convert LVDS to single-ended
   //-------------------------------------------------------------------------------------------
   io_buffer 
      #(// Parameters
        .IDDR_DATA_SIZE                  (IDDR_DATA_SIZE)
        )
      io_buffer_data
       (// Outputs
        .lvds_data_buf                   (lvds_data_buf),
        // Inputs
        .lvds_data_p                     (lvds_data_p),
        .lvds_data_n                     (lvds_data_n));

   io_buffer 
      #(// Parameters
        .IDDR_DATA_SIZE                  (1)
        )
      io_buffer_fco
       (// Outputs
        .lvds_data_buf                   (lvds_fco_buf),
        // Inputs
        .lvds_data_p                     (lvds_fco_p),
        .lvds_data_n                     (lvds_fco_n));

   //-------------------------------------------------------------------------------------------
   // TX Trig control
   //-------------------------------------------------------------------------------------------
   tx_trig_cntrl tx_trig_cntrl
       (// Outputs
        .tx_trig                         (tx_trig),
        // Inputs
        .tx_trig_rst_n                   (usb_master_rst_n),
        .tx_trig_clk                     (lvds_fco_buf),
        .tx_trig_rdy                     (dcm_rdy));
   
   //-------------------------------------------------------------------------------------------
   // Capture data, convert serial data to parallel, per lane
   //-------------------------------------------------------------------------------------------
   iddr_top
      #(// Parameters
        .ADC_MAX_DATA_SIZE               (ADC_MAX_DATA_SIZE),
        .IDDR_DATA_SIZE                  (IDDR_DATA_SIZE)
        )
      iddr_top
       (// Outputs
        .iddr_data_lane0                 (data_lane0),
        .iddr_data_lane1                 (data_lane1),
        .iddr_data_lane2                 (data_lane2),
        .iddr_data_lane3                 (data_lane3),
        .iddr_data_lane4                 (data_lane4),
        .iddr_data_lane5                 (data_lane5),
        .iddr_data_lane6                 (data_lane6),
        .iddr_data_lane7                 (data_lane7),
        .iddr_data_clk                   (data_clk),
        .iddr_data_rdy                   (data_rdy),
        // Inputs
        .iddr_reset_n                    (usb_master_rst_n),
        .iddr_dcm_rdy                    (dcm_rdy),
        .iddr_wr_en_n                    (usb_write_en_n),
        .iddr_ramp_en                    (debug_ramp_en),
        .iddr_bit_sel                    (bit_sel),
        .iddr_dco                        (dco),
        .iddr_fco                        (lvds_fco_buf),
        .iddr_data                       (lvds_data_buf));
        
   //==========================================================================
   // Deframe data words, remove 0 samples and create octal data buses, real and IQ
   //==========================================================================
   word_deframer 
      #(// Parameters
        .ADC_MAX_DATA_SIZE                 (ADC_MAX_DATA_SIZE),
        .INPUT_CHAN_NUM                    (INPUT_CHAN_NUM)
        )
      word_deframer
       (// Outputs
        .o_word_deframer_data_en           (word_deframer_data_en),
        .o_word_deframer_data              (word_deframer_data),
        .o_word_deframer_system_rdy        (word_deframer_system_rdy),
        // Inputs
        .i_word_deframer_reset_n           (usb_master_rst_n),
        .i_word_deframer_wr_en_n           (usb_write_en_n),
        .i_word_deframer_demod_mode        (demod_mode),
        .i_word_deframer_lane_number       (lane_number),
        .i_word_deframer_dec_factor        (dec_factor),
        .i_word_deframer_use_old_zero      (use_old_zero),
        .i_word_deframer_bit_sel           (bit_sel),
        .i_word_deframer_capture_mode      (capture_mode),
        .i_word_deframer_ramp_en           (debug_ramp_en),
        .i_word_deframer_start_code_bypass (start_code_bypass),
        .i_word_deframer_start_code        (user_start_code),
        .i_word_deframer_start_code_en     (user_start_code_en),
        .i_word_deframer_start_code_chan   (start_code_chan_sel),
        .i_word_deframer_clk               (data_clk),
        .i_word_deframer_data_lane0        (data_lane0),
        .i_word_deframer_data_lane1        (data_lane1),
        .i_word_deframer_data_lane2        (data_lane2),
        .i_word_deframer_data_lane3        (data_lane3),
        .i_word_deframer_data_lane4        (data_lane4),
        .i_word_deframer_data_lane5        (data_lane5),
        .i_word_deframer_data_lane6        (data_lane6),
        .i_word_deframer_data_lane7        (data_lane7),
        .i_word_deframer_system_rdy        (data_rdy));
   
   //==========================================================================
   // DUT Format Block
   //==========================================================================
   dut_format 
      #(// Parameters
        .ADC_MAX_DATA_SIZE               (ADC_MAX_DATA_SIZE),
        .INPUT_CHAN_NUM                  (INPUT_CHAN_NUM),
        .BRAM_WORD_NUM                   (BRAM_WORD_NUM),
        .SRAM_WORD_NUM                   (SRAM_WORD_NUM)
        )
      dut_format
       (// Outputs
        .o_dut_format_bram_data_en       (main_memory_bram_wr_en),
        .o_dut_format_bram_data_out      (main_memory_bram_wr_data),
        .o_dut_format_sram_data_en       (main_memory_sram_wr_en),
        .o_dut_format_sram_data_out      (main_memory_sram_wr_data),
        .o_dut_format_sram_count         (main_memory_sram_wr_count),
        .o_dut_format_system_rdy         (main_memory_system_rdy),
        // Inputs
        .i_dut_format_reset_n            (usb_master_rst_n),
        .i_dut_format_wr_en_n            (usb_write_en_n),
        .i_dut_format_demod_mode         (demod_mode),
        .i_dut_format_capture_mode       (capture_mode),
        .i_dut_format_wr_chan_sel_first  (wr_chan_sel_first),
        .i_dut_format_wr_chan_sel_second (wr_chan_sel_second),
        .i_dut_format_clk                (data_clk),
        .i_dut_format_data_en            (word_deframer_data_en),
        .i_dut_format_data               (word_deframer_data),
        .i_dut_format_system_rdy         (word_deframer_system_rdy));
   
   //==========================================================================
   // Write To and Read From FIFO
   //==========================================================================
   main_memory_top 
      #(// Parameters
        .ADC_MAX_DATA_SIZE               (ADC_MAX_DATA_SIZE),
        .BRAM_WORD_NUM                   (BRAM_WORD_NUM),
        .SRAM_WORD_NUM                   (SRAM_WORD_NUM)
        )
      main_memory_top
       (// Outputs
        .o_main_memory_rd_data           (usb_data_out),
        .o_main_memory_sram_address      (sram_address),
        .o_main_memory_sram_k_clk        (sram_k),
        .o_main_memory_sram_k_clk_n      (sram_k_b),
        .o_main_memory_sram_r_w          (sram_rw),
        .o_main_memory_sram_dll_off      (sram_dll_off),
        .o_main_memory_sram_load         (sram_load),
        // Inouts
        .io_main_memory_sram_a_data      (sram_data_a),
        .io_main_memory_sram_b_data      (sram_data_b),
        // Inputs
        .i_main_memory_reset_n           (usb_master_rst_n),
        .i_main_memory_ext_trig          (ext_trig),
        .i_main_memory_ext_trig_en       (ext_trig_en),
        .i_main_memory_capture_mode      (capture_mode),
        .i_main_memory_system_ready      (main_memory_system_rdy),
        .i_main_memory_wr_en_n           (usb_write_en_n),
        .i_main_memory_wr_clk            (data_clk),
        .i_main_memory_bram_wr_clk_en    (main_memory_bram_wr_en),
        .i_main_memory_bram_wr_data      (main_memory_bram_wr_data),
        .i_main_memory_sram_wr_clk_en    (main_memory_sram_wr_en),
        .i_main_memory_sram_wr_data      (main_memory_sram_wr_data),
        .i_main_memory_sram_wr_count     (main_memory_sram_wr_count),
        .i_main_memory_rd_chan_sel       (rd_chan_sel),
        .i_main_memory_rd_en_n           (usb_read_en_n),
        .i_main_memory_rd_clk            (usb_read_clk)); 

endmodule
