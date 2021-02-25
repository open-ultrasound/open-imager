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
// Description:   Main Memory Block RAM  Block
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
//                     |--> main_memory_read_controller
//
// Notes:
//
//   1) See file footer for revision history 
//
//HDR_END======================================================================


module main_memory_sram_fifo
#(
   // ADC_MAX_DATA_SIZE
   // Max number of ADC bits (resolution), actual number of bits is set using SPI on some ADCs
   // Range = 8 - 16
   parameter ADC_MAX_DATA_SIZE = 16,

   // BRAM_WORD_NUM
   // Number of data words per write/read cycle
   // Range = 1, 2, 4, 8, ... 64 MAX
   parameter BRAM_WORD_NUM = 16,

   // SRAM_WORD_NUM
   // Number of data words per write/read cycle
   // Range = 4
   parameter SRAM_WORD_NUM = 4
  )

   (
    //============================================= 
    // Write Cycle Data, Clock and Control Signals    
    //============================================= 

    // Parallel input data from channel select and formatting block.
    input  [ADC_MAX_DATA_SIZE*SRAM_WORD_NUM-1:0]     i_sram_fifo_wr_data,

    // Write cycle, data rate clock. 
    input                                            i_sram_fifo_wr_clk,

    // Write clock enable. 
    input                                            i_sram_fifo_wr_clk_en,

    // Active low write enable signal.
    input                                            i_sram_fifo_wr_en_n,
    
    // Write clock cycle counter
    input  [2:0]                                     i_sram_fifo_wr_count,
    
    // BRAM almost full signal
    input                                            i_bram_fifo_wr_almost_full,
    
    //============================================= 
    // Main FIFO Basic Control Signals    
    //============================================= 

    // Asynchronous active low master reset. 
    input                                            i_sram_fifo_reset_n,

    // Data capture mode select input
    // 00 = Single channel, 64k + 4M SRAM
    // 01 = Dual channel simultaneous, 32k each + 2M SRAM each
    // 10 = Quad channel simultaneous, 16k each + 1M SRAM each (SRAM TBD)
    // 11 = Octal channel simultaneous, 8k each (no SRAM)
    // Data sizes are reduced by half if ADC_MAX_DATA_SIZE > 16
    input  [1:0]                                     i_sram_fifo_capture_mode,

    // Synchronous capture ready signal. 
    // Indicates system is ready - DCM is locked, data is formatted, etc. 
    input                                            i_sram_fifo_capture_ready,

    //============================================= 
    // Read Cycle Data, Clock and Control Signals    
    //============================================= 

    // Parallel output data sent to output mux block.
    output reg [ADC_MAX_DATA_SIZE*SRAM_WORD_NUM-1:0] o_sram_fifo_rd_data,
    
    // Read address count, lowest 3 bits
    output [2:0]                                     o_sram_fifo_rd_cnt,

    // SRAM read enable
    output                                           o_sram_fifo_rd_en,

    // Read cycle, data rate clock. 
    input                                            i_sram_fifo_rd_clk,
    
    // Channel select, used only to reset read address in multi-channel modes
    input  [2:0]                                     i_sram_fifo_rd_chan_sel,

    // Active low read enable signal
    input                                            i_sram_fifo_rd_en_n,
    
    // BRAM almost empty signal
    input                                            i_bram_fifo_rd_almost_empty,
    
    //============================================= 
    // SRAM Interface Signals    
    //============================================= 

    // Data bus for SRAM IC A  
    inout  [ADC_MAX_DATA_SIZE*(SRAM_WORD_NUM/2)-1:0] io_sram_fifo_data_a,

    // Data bus for SRAM IC B
    inout  [ADC_MAX_DATA_SIZE*(SRAM_WORD_NUM/2)-1:0] io_sram_fifo_data_b, 

    // Address bus for both SRAM ICs
    output [19:0]                                    o_sram_fifo_address,

    // SRAM clock
    output                                           o_sram_fifo_k_clk,

    // SRAM clock, inverted
    output                                           o_sram_fifo_k_clk_n,

    // SRAM Read Write Signal
    // Read is active high, write is active low
    output                                           o_sram_fifo_r_w,

    // SRAM DLL Off Signal
    output                                           o_sram_fifo_dll_off,

    // SRAM Memory Load Signal
    output                                           o_sram_fifo_load   

    );
   
   //==========================================================================
   // LOCAL PARAMETERS
   //==========================================================================
   
   // SRAM port width
   localparam  SRAM_DATA_WIDTH  = ADC_MAX_DATA_SIZE*SRAM_WORD_NUM/2; 

   // SRAM address width
   localparam  SRAM_ADDR_WIDTH = 19; 
   
   //==========================================================================
   // REGS & WIRES
   //==========================================================================

   reg                          sram_fifo_rd_en;
   reg                          write_clock_sram;
   reg                          read_clock_sram;
   reg                          write_full_sram;
   reg                          write_en_sync_d0;
   reg                          write_en_sync_d1;
   reg                          write_en_sync_d2;
   reg  [2:0]                   del_chan_sel;
   reg  [2:0]                   prev_chan_sel;
   reg  [BRAM_WORD_NUM-1:0]     read_almost_empty;
   reg  [SRAM_ADDR_WIDTH-1:0]   write_address_sram;
   reg  [SRAM_ADDR_WIDTH-1:0]   read_address_sram;
   reg  [SRAM_DATA_WIDTH-1:0]   write_data_sram_a;
   reg  [SRAM_DATA_WIDTH-1:0]   write_data_sram_b;
   reg  [22:0]                  read_address_count;
   reg                          read_address_rst;
   reg  [2*SRAM_DATA_WIDTH-1:0] sram_fifo_rd_data;
      
   //==========================================================================
   // Sync write enable
   //==========================================================================
   
   always @(posedge i_sram_fifo_wr_clk, negedge i_sram_fifo_reset_n)
     if(i_sram_fifo_reset_n == 1'b0)
       begin
          write_en_sync_d0 <= 1'b0;
          write_en_sync_d1 <= 1'b0;
          write_en_sync_d2 <= 1'b0;
       end
     else if({i_sram_fifo_wr_clk_en == 1'b1} && {i_bram_fifo_wr_almost_full == 1'b1})
       begin
          write_en_sync_d0 <= {{i_sram_fifo_wr_en_n == 1'b0} && {i_sram_fifo_capture_ready == 1'b1}};
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
   // Generate SRAM write clock
   //==========================================================================

   always @(posedge i_sram_fifo_wr_clk, negedge i_sram_fifo_reset_n)
     if(i_sram_fifo_reset_n == 1'b0)
       write_clock_sram <= 1'b0; 
     else if({write_en_sync_d2 == 1'b1} && {i_sram_fifo_capture_mode == 2'b00} && {i_sram_fifo_wr_count[1:0] == 2'b10})
       write_clock_sram <= ~write_clock_sram;
     else if({write_en_sync_d2 == 1'b1} && {i_sram_fifo_capture_mode == 2'b01} && {i_sram_fifo_wr_count[0] == 1'b1})
       write_clock_sram <= ~write_clock_sram;
     else
       write_clock_sram <= write_clock_sram;

   //==========================================================================
   // Generate write address counter
   //==========================================================================

   always @(posedge i_sram_fifo_wr_clk, negedge i_sram_fifo_reset_n)
     if(i_sram_fifo_reset_n == 1'b0)
       write_address_sram <= {SRAM_ADDR_WIDTH{1'b0}};
     else if({write_en_sync_d2 == 1'b1} && {i_sram_fifo_capture_mode == 2'b00} && {i_sram_fifo_wr_count[2:0] == 3'b0} && {write_address_sram != {SRAM_ADDR_WIDTH{1'b1}}})
       write_address_sram <= write_address_sram + 1;
     else if({write_en_sync_d2 == 1'b1} && {i_sram_fifo_capture_mode == 2'b01} && {i_sram_fifo_wr_count[1:0] == 2'b0} && {write_address_sram != {SRAM_ADDR_WIDTH{1'b1}}})
       write_address_sram <= write_address_sram + 1;
     else 
       write_address_sram <= write_address_sram;
   
   //==========================================================================
   // Generate write full signal
   //==========================================================================

   always @(posedge i_sram_fifo_wr_clk, negedge i_sram_fifo_reset_n)
     if(i_sram_fifo_reset_n == 1'b0)
       write_full_sram <= 1'b0;
     else if(write_address_sram == {SRAM_ADDR_WIDTH{1'b1}})
       write_full_sram <= 1'b1;
     else
       write_full_sram <= write_full_sram;

   //==========================================================================
   // Register write data
   //==========================================================================

   always @(posedge i_sram_fifo_wr_clk, negedge i_sram_fifo_reset_n)
     if(i_sram_fifo_reset_n == 1'b0)
       begin
         write_data_sram_a    <= {SRAM_DATA_WIDTH{1'b0}};
         write_data_sram_b    <= {SRAM_DATA_WIDTH{1'b0}};
       end
     else if(i_sram_fifo_wr_clk_en == 1'b0)
       begin
         write_data_sram_a <= i_sram_fifo_wr_data[2*SRAM_DATA_WIDTH-1:SRAM_DATA_WIDTH];
         write_data_sram_b <= i_sram_fifo_wr_data[SRAM_DATA_WIDTH-1:0];
       end
     else
       begin
         write_data_sram_a    <= write_data_sram_a;
         write_data_sram_b    <= write_data_sram_b;
       end

   //==========================================================================
   // Check for change in channel select bits
   //==========================================================================

   always @(posedge i_sram_fifo_rd_clk)
     begin
        del_chan_sel     <= i_sram_fifo_rd_chan_sel;
        prev_chan_sel    <= del_chan_sel; 
     end

   always @(posedge i_sram_fifo_rd_clk, negedge i_sram_fifo_reset_n)
     if(i_sram_fifo_reset_n == 1'b0)
       read_address_rst <= 1'b1;
     else
       read_address_rst <= {prev_chan_sel != del_chan_sel}; 

   //==========================================================================
   // Generate SRAM read enable, always at the exact end of block RAM
   //==========================================================================

   always @(posedge i_sram_fifo_rd_clk, posedge read_address_rst)
     if(read_address_rst == 1'b1)
       sram_fifo_rd_en <= 1'b0;
     else if({i_sram_fifo_capture_mode == 2'b00} && {read_address_count == 8'h80})   
       sram_fifo_rd_en <= 1'b1;
     else if({i_sram_fifo_capture_mode == 2'b01} && {read_address_count == 8'h40})
       sram_fifo_rd_en <= 1'b1;
     else
       sram_fifo_rd_en <= sram_fifo_rd_en;

   // assign read enable output
   assign o_sram_fifo_rd_en = sram_fifo_rd_en;
   
   //==========================================================================
   // Generate read address counter
   //==========================================================================

   // delay almost empty signal by 7 read clock cycles to line data up with USB controller 256 word cycle
   always @(posedge i_sram_fifo_rd_clk, posedge read_address_rst)
     if(read_address_rst == 1'b1)
        read_almost_empty    <= {BRAM_WORD_NUM{1'b0}};
     else
        read_almost_empty <= {read_almost_empty[BRAM_WORD_NUM-2:0], i_bram_fifo_rd_almost_empty};

   // generate counter for read address
   always @(posedge i_sram_fifo_rd_clk, posedge read_address_rst)
     if(read_address_rst == 1'b1)
       read_address_count <= 23'b0;
     else if({i_sram_fifo_rd_en_n == 1'b0} && {read_almost_empty[BRAM_WORD_NUM-2] == 1'b1} && {i_sram_fifo_capture_mode == 2'b00})
       read_address_count <= read_address_count + 1;
     else if({i_sram_fifo_rd_en_n == 1'b0} && {read_almost_empty[BRAM_WORD_NUM-10] == 1'b1} && {i_sram_fifo_capture_mode == 2'b01})
       read_address_count <= read_address_count + 1;
     else
       read_address_count <= read_address_count;
     
   // assign read count output
   assign o_sram_fifo_rd_cnt = read_address_count[2:0]-1; // subtract 1 to line up data at BRAM to SRAM transition point
   
   // assign read address for SRAM
   generate if (ADC_MAX_DATA_SIZE <= 16)
      begin
         always @(posedge i_sram_fifo_rd_clk, negedge i_sram_fifo_reset_n)
            if(i_sram_fifo_reset_n == 1'b0)
                           read_address_sram <= {SRAM_ADDR_WIDTH{1'b0}};
            else
               case(i_sram_fifo_capture_mode)
                  2'b00:   read_address_sram <= read_address_count[SRAM_ADDR_WIDTH+2:3]-1; // subtract 1 to line SRAM data up with BRAM data
                  2'b01:   read_address_sram <= read_address_count[SRAM_ADDR_WIDTH+1:2]-1; 
                  2'b10:   read_address_sram <= {SRAM_ADDR_WIDTH{1'b0}};
                  2'b11:   read_address_sram <= {SRAM_ADDR_WIDTH{1'b0}};
                  default: read_address_sram <= {SRAM_ADDR_WIDTH{1'b0}};
               endcase
         end
      else begin
         always @(posedge i_sram_fifo_rd_clk, negedge i_sram_fifo_reset_n)
            if(i_sram_fifo_reset_n == 1'b0)
                           read_address_sram <= {SRAM_ADDR_WIDTH{1'b0}};
            else
               case(i_sram_fifo_capture_mode)
                  2'b00:   read_address_sram <= read_address_count[SRAM_ADDR_WIDTH+3:4];
                  2'b01:   read_address_sram <= read_address_count[SRAM_ADDR_WIDTH+2:3];
                  2'b10:   read_address_sram <= {SRAM_ADDR_WIDTH{1'b0}};
                  2'b11:   read_address_sram <= {SRAM_ADDR_WIDTH{1'b0}};
                  default: read_address_sram <= {SRAM_ADDR_WIDTH{1'b0}};
               endcase
         end
   endgenerate
         
   //==========================================================================
   // Generate SRAM read clock
   //==========================================================================

   generate if (ADC_MAX_DATA_SIZE <= 16)
      begin
         always @(posedge i_sram_fifo_rd_clk, negedge i_sram_fifo_reset_n)
            if(i_sram_fifo_reset_n == 1'b0)
               read_clock_sram <= 1'b0;
            else 
               case(i_sram_fifo_capture_mode)
                  2'b00: begin
                     if(read_address_count[2:0] == 3'b010)  
                         read_clock_sram <= 1'b1;
                     else if (read_address_count[2:0] == 3'b110) 
                         read_clock_sram <= 1'b0;
                     else
                         read_clock_sram <= read_clock_sram;
                     end
                  2'b01: begin
                     if(read_address_count[1:0] == 2'b01)
                         read_clock_sram <= 1'b1;
                     else if (read_address_count[1:0] == 2'b11)
                         read_clock_sram <= 1'b0;
                     else
                         read_clock_sram <= read_clock_sram;
                     end
                  2'b10: read_clock_sram <= 1'b0; // SRAM is not used in quad capture mode
                  2'b11: read_clock_sram <= 1'b0; // SRAM is not used in octal capture mode
                  default: read_clock_sram <= 1'b0;
               endcase
         end
      else begin
         always @(posedge i_sram_fifo_rd_clk, negedge i_sram_fifo_reset_n)
            if(i_sram_fifo_reset_n == 1'b0)
               read_clock_sram <= 1'b0;
            else 
               case(i_sram_fifo_capture_mode)
                  2'b00: begin
                     if(read_address_count[3:1] == 3'b010)
                         read_clock_sram <= 1'b1;
                     else if(read_address_count[3:1] == 3'b110)
                         read_clock_sram <= 1'b0;
                     else
                         read_clock_sram <= read_clock_sram;
                     end
                  2'b01: begin
                     if(read_address_count[2:1] == 2'b01)
                         read_clock_sram <= 1'b1;
                     else if (read_address_count[2:1] == 2'b11)
                         read_clock_sram <= 1'b0;
                     else
                         read_clock_sram <= read_clock_sram;
                     end
                  2'b10: read_clock_sram <= 1'b0; // SRAM is not used in quad capture mode
                  2'b11: read_clock_sram <= 1'b0; // SRAM is not used in octal capture mode
                  default: read_clock_sram <= 1'b0;
               endcase
         end
   endgenerate    
        
   //==========================================================================
   // Assign SRAM control and data signals
   //==========================================================================
   assign o_sram_fifo_dll_off    = 1'b0;
   assign o_sram_fifo_load       = 1'b0;
   assign o_sram_fifo_r_w        = write_full_sram;
   assign o_sram_fifo_k_clk      = write_full_sram ? read_clock_sram : write_clock_sram;
   assign o_sram_fifo_k_clk_n    = ~o_sram_fifo_k_clk;
   assign o_sram_fifo_address    = write_full_sram ? {read_address_sram, 1'b0} : {write_address_sram, 1'b0};
   assign io_sram_fifo_data_a    = o_sram_fifo_r_w ? {SRAM_DATA_WIDTH{1'bz}} : write_data_sram_a;
   assign io_sram_fifo_data_b    = o_sram_fifo_r_w ? {SRAM_DATA_WIDTH{1'bz}} : write_data_sram_b;
      
   //==========================================================================
   // Register output data
   //==========================================================================
   always @(posedge i_sram_fifo_rd_clk)
      case(i_sram_fifo_capture_mode)
         2'b00:  
            begin
                  sram_fifo_rd_data   <= {io_sram_fifo_data_a, io_sram_fifo_data_b};
                  o_sram_fifo_rd_data <= sram_fifo_rd_data;
            end
         2'b01: 
            begin
                  o_sram_fifo_rd_data <= {io_sram_fifo_data_a, io_sram_fifo_data_b};
            end
         2'b10:   o_sram_fifo_rd_data <= {ADC_MAX_DATA_SIZE*SRAM_WORD_NUM{1'b0}};
         2'b11:   o_sram_fifo_rd_data <= {ADC_MAX_DATA_SIZE*SRAM_WORD_NUM{1'b0}};
         default: o_sram_fifo_rd_data <= {ADC_MAX_DATA_SIZE*SRAM_WORD_NUM{1'b0}};
      endcase
  
endmodule // main_memory_sram_fifo
   
//==========================================================================
// Revision History
// $Log: digital_db#common#design#main_memory#rtl#main_memory_sram_fifo.v,v $
//
//
//==========================================================================

// Local Variables:
// verilog-library-directories:(".")
// End:
