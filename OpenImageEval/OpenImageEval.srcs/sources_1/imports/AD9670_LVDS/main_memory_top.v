//HDR_START====================================================================
//
//                    Copyright (c) 2011 Analog Devices, Inc.
//
//     All Rights Reserved.  This file is the confidential and proprietary
//     property of ADI and the possession or use of this file requires a 
//     written license. 
// 
//------------------------------------------------------------------------------
//
// File:          main_memory_top.v
//
// Project:       common/main_memory
//
// Author:        MKH
//
// Created:       10 March 2011
//
// Description:   Top Main Memory Block RAM Block
//
// Hierarchy: 
//                main_memory_top
//                     |
//                     |--> main_memory_write_format
//                     |
//                     |--> main_memory_bram_fifo
//                     |       |
//                     |       |--> main_memory_bram (block RAM instantiation)
//                     |
//                     |--> main_memory_sram_fifo
//                     |
//                     |--> main_memory_read_mux
//
// Notes:
//
//   1) See file footer for revision history 
//
//HDR_END======================================================================


module main_memory_top
#(
   // ADC_MAX_DATA_SIZE
   // Max number of ADC bits (resolution), actual number of bits is set using SPI on some ADCs
   // Range = 8 - 16
   parameter ADC_MAX_DATA_SIZE = 16,

   // BRAM_WORD_NUM
   // Number of data words per write/read cycle
   // Range = 8 MIN ... 64 MAX
   parameter BRAM_WORD_NUM = 8,  

   // SRAM_WORD_NUM
   // Number of data words per write/read cycle
   // Range = 4
   parameter SRAM_WORD_NUM = 4  
  )

   (
    //============================================= 
    // Write Cycle Data and Clock    
    //============================================= 

    // Input clock for FIFO write cycle 
    input                                                         i_main_memory_wr_clk,

    // Input data for block RAM
    input  [ADC_MAX_DATA_SIZE*BRAM_WORD_NUM-1:0]                  i_main_memory_bram_wr_data,

    // Input data for SRAM
    input  [ADC_MAX_DATA_SIZE*SRAM_WORD_NUM-1:0]                  i_main_memory_sram_wr_data,

    //============================================= 
    // Write Cycle Control Signals    
    //============================================= 

    // Input clock enable for block RAM 
    input                                                         i_main_memory_bram_wr_clk_en,

    // Input clock enable for SRAM 
    input                                                         i_main_memory_sram_wr_clk_en,

    // Write clock cycle counter for SRAM
    input  [2:0]                                                  i_main_memory_sram_wr_count,
    
    // Write enable signal, active low
    input                                                         i_main_memory_wr_en_n, 

    // External data capture trigger
    // Active high, from FIFO5 SMA1, J7, pulse width must be longer than input data period
    input                                                         i_main_memory_ext_trig,

    // External data capture trigger enable
    // Active high, from SPI register
    input                                                         i_main_memory_ext_trig_en,

    //============================================= 
    // SRAM Interface Signals    
    //============================================= 

    // Data bus for SRAM IC A  
    inout  [ADC_MAX_DATA_SIZE*(SRAM_WORD_NUM/2)-1:0]              io_main_memory_sram_a_data,

    // Data bus for SRAM IC B
    inout  [ADC_MAX_DATA_SIZE*(SRAM_WORD_NUM/2)-1:0]              io_main_memory_sram_b_data, 

    // Address bus for both SRAM ICs
    output [19:0]                                                 o_main_memory_sram_address,

    // SRAM clock
    output                                                        o_main_memory_sram_k_clk,

    // SRAM clock, inverted
    output                                                        o_main_memory_sram_k_clk_n,

    // SRAM Read Write Signal
    // Read is active high, write is active low
    output                                                        o_main_memory_sram_r_w,

    // SRAM DLL Off Signal
    output                                                        o_main_memory_sram_dll_off,

    // SRAM Memory Load Signal
    output                                                        o_main_memory_sram_load,
    
    //============================================= 
    // Misc Control Signals    
    //============================================= 

    // Data capture mode select input
    // 00 = Single channel, 64k + 4M SRAM
    // 01 = Dual channel simultaneous, 32k each + 2M SRAM each
    // 10 = Quad channel simultaneous, 16k each + 1M SRAM each (SRAM TBD)
    // 11 = Octal channel simultaneous, 8k each (no SRAM)
    // Data sizes are reduced by half if ADC_MAX_DATA_SIZE > 16
    input  [1:0]                                                  i_main_memory_capture_mode,

    // Read cycle channel select input
    input  [2:0]                                                  i_main_memory_rd_chan_sel,
    
    // Master reset, active low, asynchronous
    input                                                         i_main_memory_reset_n,

    // System ready signal, active high, indicates DCM locked and settled       
    input                                                         i_main_memory_system_ready,

    //============================================= 
    // Read Cycle Control Signals    
    //=============================================
    
    // Read enable signal, active low  
    input                                                         i_main_memory_rd_en_n,
    
    //============================================= 
    // Read Cycle Data and Clock    
    //=============================================

    // Read clock, 48 MHz, runs continuous except while write enable is active
    input                                                         i_main_memory_rd_clk,  
 
    // Read cycle output data
    output [15:0]                                                 o_main_memory_rd_data

    );

   //==========================================================================
   // LOCAL PARAMETERS
   //==========================================================================


   //==========================================================================
   // REGS & WIRES
   //==========================================================================

   wire [2:0]                                  main_memory_sram_rd_cnt;
   wire [6:0]                                  main_memory_bram_rd_cnt;
   wire [ADC_MAX_DATA_SIZE*SRAM_WORD_NUM-1:0]  main_memory_sram_rd_data;
   wire [ADC_MAX_DATA_SIZE*BRAM_WORD_NUM-1:0]  main_memory_bram_rd_data;

   //==========================================================================
   // Main Memory BRAM FIFO Block
   //==========================================================================

   main_memory_bram_fifo
     #(
       // Parameters
       .ADC_MAX_DATA_SIZE               (ADC_MAX_DATA_SIZE),
       .BRAM_WORD_NUM                   (BRAM_WORD_NUM))          
      main_memory_bram_fifo
      (
       // Outputs
       .o_bram_fifo_rd_data             (main_memory_bram_rd_data),
       .o_bram_fifo_rd_cnt              (main_memory_bram_rd_cnt),
       .o_bram_fifo_rd_almost_empty     (main_memory_bram_rd_almost_empty),
       .o_bram_fifo_wr_almost_full      (main_memory_bram_wr_almost_full),
       // Inputs
       .i_bram_fifo_reset_n             (i_main_memory_reset_n),
       .i_bram_fifo_ext_trig            (i_main_memory_ext_trig),
       .i_bram_fifo_ext_trig_en         (i_main_memory_ext_trig_en),
       .i_bram_fifo_capture_mode        (i_main_memory_capture_mode),
       .i_bram_fifo_capture_ready       (i_main_memory_system_ready),
       .i_bram_fifo_wr_en_n             (i_main_memory_wr_en_n),
       .i_bram_fifo_wr_clk              (i_main_memory_wr_clk),
       .i_bram_fifo_wr_clk_en           (i_main_memory_bram_wr_clk_en),
       .i_bram_fifo_wr_data             (i_main_memory_bram_wr_data),
       .i_bram_fifo_rd_chan_sel         (i_main_memory_rd_chan_sel),
       .i_bram_fifo_rd_en_n             (i_main_memory_rd_en_n),
       .i_bram_fifo_rd_clk              (i_main_memory_rd_clk));

   //==========================================================================
   // Main Memory SRAM FIFO Block
   //==========================================================================

   main_memory_sram_fifo
     #(
       // Parameters
       .ADC_MAX_DATA_SIZE               (ADC_MAX_DATA_SIZE),
       .BRAM_WORD_NUM                   (BRAM_WORD_NUM),          
       .SRAM_WORD_NUM                   (SRAM_WORD_NUM))          
      main_memory_sram_fifo
      (
       // Outputs
       .o_sram_fifo_rd_data             (main_memory_sram_rd_data),
       .o_sram_fifo_rd_cnt              (main_memory_sram_rd_cnt),
       .o_sram_fifo_rd_en               (main_memory_sram_rd_en),
       // Inputs
       .i_sram_fifo_reset_n             (i_main_memory_reset_n),
       .i_sram_fifo_capture_mode        (i_main_memory_capture_mode),
       .i_sram_fifo_capture_ready       (i_main_memory_system_ready),
       .i_sram_fifo_wr_en_n             (i_main_memory_wr_en_n),
       .i_sram_fifo_wr_clk              (i_main_memory_wr_clk),
       .i_sram_fifo_wr_clk_en           (i_main_memory_sram_wr_clk_en),
       .i_sram_fifo_wr_data             (i_main_memory_sram_wr_data),
       .i_sram_fifo_wr_count            (i_main_memory_sram_wr_count),
       .i_sram_fifo_rd_chan_sel         (i_main_memory_rd_chan_sel),
       .i_sram_fifo_rd_en_n             (i_main_memory_rd_en_n),
       .i_sram_fifo_rd_clk              (i_main_memory_rd_clk),
       .i_bram_fifo_rd_almost_empty     (main_memory_bram_rd_almost_empty),
       .i_bram_fifo_wr_almost_full      (main_memory_bram_wr_almost_full),
       // SRAM Interface Outputs
       .o_sram_fifo_address             (o_main_memory_sram_address),
       .o_sram_fifo_k_clk               (o_main_memory_sram_k_clk),
       .o_sram_fifo_k_clk_n             (o_main_memory_sram_k_clk_n),
       .o_sram_fifo_dll_off             (o_main_memory_sram_dll_off),
       .o_sram_fifo_load                (o_main_memory_sram_load),
       .o_sram_fifo_r_w                 (o_main_memory_sram_r_w),
       // SRAM Interface InOuts
       .io_sram_fifo_data_a             (io_main_memory_sram_a_data),
       .io_sram_fifo_data_b             (io_main_memory_sram_b_data));


   //==========================================================================
   // Main Memory Read Controller Block
   //==========================================================================

   main_memory_read_controller
     #(
       // Parameters
       .ADC_MAX_DATA_SIZE               (ADC_MAX_DATA_SIZE),
       .BRAM_WORD_NUM                   (BRAM_WORD_NUM),          
       .SRAM_WORD_NUM                   (SRAM_WORD_NUM))          
      main_memory_read_controller
      (
       // Outputs
       .o_read_mux_data                 (o_main_memory_rd_data),
       // Inputs
       .i_read_mux_rd_clk               (i_main_memory_rd_clk),
       .i_read_mux_bram_data            (main_memory_bram_rd_data),
       .i_read_mux_bram_cnt             (main_memory_bram_rd_cnt),
       .i_read_mux_sram_data            (main_memory_sram_rd_data),
       .i_read_mux_sram_cnt             (main_memory_sram_rd_cnt),
       .i_read_mux_sram_en              (main_memory_sram_rd_en),
       .i_read_mux_chan_sel             (i_main_memory_rd_chan_sel),
       .i_read_mux_capture_mode         (i_main_memory_capture_mode),
       .i_read_mux_rd_en_n              (i_main_memory_rd_en_n));


endmodule // main_memory_top
   
//==========================================================================
// Revision History
// $Log: digital_db#ad9643#fifo5#AD9643_Ref_Design#rtl#main_memory_top.v,v $
//
//==========================================================================

// Local Variables:
// verilog-library-directories:(".")
// End:
   
