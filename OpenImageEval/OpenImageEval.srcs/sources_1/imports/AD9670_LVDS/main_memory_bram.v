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
// Description:   Main Memory Block RAM, infers block RAM
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


module main_memory_bram
#(
   // BRAM_DATA_WIDTH
   // Block RAM data port width
   parameter BRAM_DATA_WIDTH = 16,

   // BRAM_ADDR_WIDTH
   // Block RAM address port width
   parameter BRAM_ADDR_WIDTH = 15
  )

   (
    //============================================= 
    // Write Cycle Data, Clock and Control Signals    
    //============================================= 
    
    // Write cycle, data rate clock. 
    input                                         i_bram_wr_clk,

    // Write cycle address.
    input  [BRAM_ADDR_WIDTH-1:0]                  i_bram_wr_addr,

    // Write cycle input data.
    input  [BRAM_DATA_WIDTH-1:0]                  i_bram_wr_data,

    // Active high write enable signal.
    input                                         i_bram_wr_en,
    

    //============================================= 
    // Read Cycle Data, Clock and Control Signals    
    //============================================= 
    
    // Read cycle, data rate clock. 
    input                                         i_bram_rd_clk,

    // Read cycle address.
    input  [BRAM_ADDR_WIDTH-1:0]                  i_bram_rd_addr,

    // Read cycle output data.
    output [BRAM_DATA_WIDTH-1:0]                  o_bram_rd_data

    );
   
   //==========================================================================
   // LOCAL PARAMETERS
   //==========================================================================

   
   //==========================================================================
   // REGS & WIRES
   //==========================================================================

   reg    [BRAM_ADDR_WIDTH-1:0] read_addr;
   
   reg    [BRAM_DATA_WIDTH-1:0] ram [2**BRAM_ADDR_WIDTH-1:0];
   
            
   //==========================================================================
   // Infer block RAM
   //==========================================================================
            
   always @(posedge i_bram_wr_clk) 
        if (i_bram_wr_en)
            ram[i_bram_wr_addr] <= i_bram_wr_data;

   always @(posedge i_bram_rd_clk)
      read_addr <= i_bram_rd_addr;
   
   assign o_bram_rd_data = ram[read_addr];
                  
endmodule // main_memory_bram
   
//==========================================================================
// Revision History
// $Log: digital_db#common#design#main_memory#rtl#main_memory_bram.v,v $
// Revision 1.3  2011-04-15 16:05:17-04  mhughes
// Initial edits.
//
// Revision 1.2  2011-03-10 13:27:21-05  mhughes
// Initial revision.
//
//
//==========================================================================

