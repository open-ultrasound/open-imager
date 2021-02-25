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
// File:          main_memory_bram_fifo.v
//
// Project:       common/main_memory
//
// Author:        MKH
//
// Created:       08 March 2011
//
// Description:   Main Memory Block RAM Block
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


module main_memory_bram_fifo
#(
   // ADC_MAX_DATA_SIZE
   // Max number of ADC bits (resolution), actual number of bits is set using SPI on some ADCs
   // Range = 8 - 16
   parameter ADC_MAX_DATA_SIZE = 16,

   // BRAM_WORD_NUM
   // Number of data words per write/read cycle
   // Range = 1, 2, 4, 8, ... 64 MAX
   parameter BRAM_WORD_NUM = 8
  )

   (
    //============================================= 
    // Write Cycle Data, Clock and Control Signals    
    //============================================= 

    // Parallel input data from channel select and formatting block.
    input  [ADC_MAX_DATA_SIZE*BRAM_WORD_NUM-1:0]     i_bram_fifo_wr_data,

    // Write cycle, data rate clock. 
    input                                            i_bram_fifo_wr_clk,

    // Write clock enable signal from Write Format block. 
    input                                            i_bram_fifo_wr_clk_en,

    // Active low write enable signal from VA.
    input                                            i_bram_fifo_wr_en_n,

    // BRAM almost full signal
    output reg                                       o_bram_fifo_wr_almost_full,
    
    //============================================= 
    // Main FIFO Basic Control Signals    
    //============================================= 

    // Asynchronous active low master reset. 
    input                                            i_bram_fifo_reset_n,

    // Synchronous capture ready signal. 
    // Indicates system is ready - DCM is locked, data is formatted, etc. 
    input                                            i_bram_fifo_capture_ready,
    
    // Data capture mode select input
    // 00 = Single channel, 64k + 4M SRAM
    // 01 = Dual channel simultaneous, 32k each + 2M SRAM each
    // 10 = Quad channel simultaneous, 16k each + 1M SRAM each (SRAM TBD)
    // 11 = Octal channel simultaneous, 8k each (no SRAM)
    // Data sizes are reduced by half if ADC_MAX_DATA_SIZE > 16
    input  [1:0]                                     i_bram_fifo_capture_mode,

    // Asynchronous external data capture trigger, from SMA1 on FIFO5, connector J7.  
    // Active high CMOS, pulse width must be longer than i_bram_fifo_wr_clk period. 
    input                                            i_bram_fifo_ext_trig,

    // Asynchronous external data capture trigger enable signal.  
    // Active high, from SPI register. 
    input                                            i_bram_fifo_ext_trig_en,

    //============================================= 
    // Read Cycle Data, Clock and Control Signals    
    //============================================= 

    // Parallel output data sent to output mux block.
    output [ADC_MAX_DATA_SIZE*BRAM_WORD_NUM-1:0]     o_bram_fifo_rd_data,
 
    // Read address count, lowest 7 bits
    output reg [6:0]                                 o_bram_fifo_rd_cnt,

    // BRAM almost empty signal
    output reg                                       o_bram_fifo_rd_almost_empty,

    // Read cycle, data rate clock. 
    input                                            i_bram_fifo_rd_clk,
    
    // Channel select, used only to reset read address in multi-channel modes
    input  [2:0]                                     i_bram_fifo_rd_chan_sel,
    
    // Active low write enable signal.
    input                                            i_bram_fifo_rd_en_n

    );
   
   //==========================================================================
   // LOCAL PARAMETERS
   //==========================================================================

   // Block RAM port width
   localparam  BRAM_DATA_WIDTH  = ADC_MAX_DATA_SIZE*BRAM_WORD_NUM; 

   // Block RAM address width
   localparam  BRAM_ADDR_WIDTH = get_configuration(ADC_MAX_DATA_SIZE,BRAM_WORD_NUM);
      
   //==========================================================================
   // REGS & WIRES
   //==========================================================================

   reg                         bram_wr_en;
   reg                         write_full;
   reg                         write_trig_en;
   reg                         write_en_sync_d0;
   reg                         write_en_sync_d1;
   reg                         write_en_sync_d2;
   reg                         read_address_rst;
   reg  [2:0]                  del_chan_sel;
   reg  [2:0]                  prev_chan_sel;
   reg  [6:0]                  bram_word_num_count;
   reg  [6:0]                  bram_word_max_count;
   reg  [BRAM_ADDR_WIDTH-1:0]  write_address;
   reg  [BRAM_ADDR_WIDTH-1:0]  read_address;

   //==========================================================================
   // Sync write enable and external trigger
   //==========================================================================

   always @(posedge i_bram_fifo_wr_clk, negedge i_bram_fifo_reset_n)
     if(i_bram_fifo_reset_n == 1'b0)
       write_trig_en <= 1'b0;
     else if({i_bram_fifo_ext_trig == 1'b1} || {i_bram_fifo_ext_trig_en == 1'b0})
       write_trig_en <= 1'b1;
     else
       write_trig_en <= write_trig_en;
   
   always @(posedge i_bram_fifo_wr_clk, negedge i_bram_fifo_reset_n)
     if(i_bram_fifo_reset_n == 1'b0)
       begin
          write_en_sync_d0 <= 1'b0;
          write_en_sync_d1 <= 1'b0;
          write_en_sync_d2 <= 1'b0;
       end
     else if(i_bram_fifo_wr_clk_en == 1'b1)
       begin
          write_en_sync_d0 <= {{i_bram_fifo_wr_en_n == 1'b0} && {i_bram_fifo_capture_ready == 1'b1} && {write_trig_en == 1'b1}};
          write_en_sync_d1 <= write_en_sync_d0;
          write_en_sync_d2 <= write_en_sync_d1;
       end
     else
       begin
          write_en_sync_d0 <= write_en_sync_d0;
          write_en_sync_d1 <= write_en_sync_d1;
          write_en_sync_d2 <= write_en_sync_d2;
       end     

   //==========================================================================
   // Generate write address counter
   //==========================================================================

   always @(posedge i_bram_fifo_wr_clk, negedge i_bram_fifo_reset_n)
     if(i_bram_fifo_reset_n == 1'b0)
       write_address <= {BRAM_ADDR_WIDTH{1'b0}};
     else if({write_en_sync_d2 == 1'b1} && {i_bram_fifo_wr_clk_en == 1'b1} && {write_address != {BRAM_ADDR_WIDTH{1'b1}}})
       write_address <= write_address + 1;
     else
       write_address <= write_address;
   
   //==========================================================================
   // Generate write full signal
   //==========================================================================

   always @(posedge i_bram_fifo_wr_clk, negedge i_bram_fifo_reset_n)
     if(i_bram_fifo_reset_n == 1'b0)
       write_full <= 1'b0;
     else if(write_address == {BRAM_ADDR_WIDTH{1'b1}})
       write_full <= 1'b1;
     else 
       write_full <= write_full;

   //==========================================================================
   // Generate write almost full signal
   //==========================================================================

   // Activate flag 8 write cycles prior to write full signal
   always @(posedge i_bram_fifo_wr_clk, negedge i_bram_fifo_reset_n)
     if(i_bram_fifo_reset_n == 1'b0)
       o_bram_fifo_wr_almost_full <= 1'b0;
     else if(write_address == {{BRAM_ADDR_WIDTH-3{1'b1}}, 3'b0})
       o_bram_fifo_wr_almost_full <= 1'b1;
     else
       o_bram_fifo_wr_almost_full <= o_bram_fifo_wr_almost_full;

   //==========================================================================
   // Generate write enable signal
   //==========================================================================

   always @(posedge i_bram_fifo_wr_clk, negedge i_bram_fifo_reset_n)
      if(i_bram_fifo_reset_n == 1'b0)
         bram_wr_en <= 1'b0;
      else if(write_address == {BRAM_ADDR_WIDTH{1'b1}})   
         bram_wr_en <= 1'b0;
      else 
         bram_wr_en <= (i_bram_fifo_wr_clk_en == 1'b1);

            
   //==========================================================================
   // Check for change in channel select bits during read cycle
   //==========================================================================

   always @(posedge i_bram_fifo_rd_clk)
     begin
        del_chan_sel     <= i_bram_fifo_rd_chan_sel;
        prev_chan_sel    <= del_chan_sel; 
     end

   always @(posedge i_bram_fifo_rd_clk, negedge i_bram_fifo_reset_n)
     if(i_bram_fifo_reset_n == 1'b0)
       read_address_rst <= 1'b1;
     else
       read_address_rst <= {prev_chan_sel != del_chan_sel}; 
   
   //==========================================================================
   // Generate read address counter, always reset when channel select is changed
   //==========================================================================

   // Adjust BRAM_WORD_NUM based on capture mode
   always @(*)
      if(ADC_MAX_DATA_SIZE <= 16)
         case(i_bram_fifo_capture_mode)
            2'b00:   bram_word_max_count <= BRAM_WORD_NUM * 1;
            2'b01:   bram_word_max_count <= BRAM_WORD_NUM / 2;
            2'b10:   bram_word_max_count <= BRAM_WORD_NUM / 4;
            2'b11:   bram_word_max_count <= BRAM_WORD_NUM / 8;
            default: bram_word_max_count <= BRAM_WORD_NUM * 1;
         endcase
      else
         case(i_bram_fifo_capture_mode)
            2'b00:   bram_word_max_count <= BRAM_WORD_NUM * 2;
            2'b01:   bram_word_max_count <= BRAM_WORD_NUM * 1;
            2'b10:   bram_word_max_count <= BRAM_WORD_NUM / 2;
            2'b11:   bram_word_max_count <= BRAM_WORD_NUM / 4;
            default: bram_word_max_count <= BRAM_WORD_NUM * 2;
         endcase

   // Keep track of BRAM_WORD_NUM count
   always @(posedge i_bram_fifo_rd_clk, posedge read_address_rst)
     if(read_address_rst == 1'b1)
       bram_word_num_count <= 7'b0;
     else if(bram_word_num_count == {bram_word_max_count-1})
       bram_word_num_count <= 7'b0;
     else if(i_bram_fifo_rd_en_n == 1'b0)
       bram_word_num_count <= bram_word_num_count + 1;
     else 
       bram_word_num_count <= bram_word_num_count;

   // Increment read address once per max BRAM_WORD_NUM count
   always @(posedge i_bram_fifo_rd_clk, posedge read_address_rst)
     if(read_address_rst == 1'b1)
       read_address <= {BRAM_ADDR_WIDTH{1'b0}};
     else if({bram_word_num_count == (bram_word_max_count-1)} && {i_bram_fifo_rd_en_n == 1'b0})
       read_address <= read_address + 1;
     else 
       read_address <= read_address;
     
   // register read count output (add 1 cycle delay to line up output)
   always @(posedge i_bram_fifo_rd_clk)
      o_bram_fifo_rd_cnt <= bram_word_num_count;

   //==========================================================================
   // Generate read almost empty signal
   //==========================================================================

   // activate flag 7 read cycles prior to read empty
   always @(posedge i_bram_fifo_rd_clk, posedge read_address_rst)
     if(read_address_rst == 1'b1)
       o_bram_fifo_rd_almost_empty <= 1'b0;
     else if(read_address == {{BRAM_ADDR_WIDTH-4{1'b1}}, 1'b0, 3'b111})
       o_bram_fifo_rd_almost_empty <= 1'b1;
     else
       o_bram_fifo_rd_almost_empty <= o_bram_fifo_rd_almost_empty;
   
   //==========================================================================
   // Infer block RAM instances, width depends on ADC_MAX_DATA_SIZE
   //==========================================================================

   main_memory_bram
      #(// Parameters
        .BRAM_DATA_WIDTH                 (BRAM_DATA_WIDTH),
        .BRAM_ADDR_WIDTH                 (BRAM_ADDR_WIDTH))
         main_memory_bram_i0 
            (// Outputs
             .o_bram_rd_data               (o_bram_fifo_rd_data), 
             // Inputs
             .i_bram_wr_clk                (i_bram_fifo_wr_clk),
             .i_bram_wr_addr               (write_address),
             .i_bram_wr_data               (i_bram_fifo_wr_data), 
             .i_bram_wr_en                 (bram_wr_en),
             .i_bram_rd_clk                (i_bram_fifo_rd_clk),
             .i_bram_rd_addr               (read_address));

   //==========================================================================
   // Define parameters based on configuration
   //==========================================================================  
   function integer get_configuration (
      // Input declarations
      input integer adc_max_data_size,
      input integer bram_word_num);
   
      real  port_data_width;
   
      begin
      
         port_data_width = adc_max_data_size*bram_word_num/68.0; 
      
         if      (port_data_width <=  1.0)   get_configuration = 14;
         else if (port_data_width <=  2.0)   get_configuration = 13;        
         else if (port_data_width <=  4.0)   get_configuration = 12;        
         else if (port_data_width <=  9.0)   get_configuration = 11;        
         else if (port_data_width <= 18.0)   get_configuration = 10;        
         else                                get_configuration =  9;        
            
      end
   endfunction // get_configuration

endmodule // main_memory_bram_fifo
   
//==========================================================================
// Revision History
// $Log: digital_db#common#design#main_memory#rtl#main_memory_bram_fifo.v,v $
// Revision 1.2  2011-03-10 13:27:25-05  mhughes
// Initial revision.
//
//
//==========================================================================

// Local Variables:
// verilog-library-directories:(".")
// End:
