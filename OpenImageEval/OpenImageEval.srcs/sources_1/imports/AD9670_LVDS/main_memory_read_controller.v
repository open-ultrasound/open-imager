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
// File:          main_memory_read_mux.v
//
// Project:       common/main_memory
//
// Author:        MKH
//
// Created:       08 March 2011
//
// Description:   Main Memory Read Controller Block
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

module main_memory_read_controller
#(
   // ADC_MAX_DATA_SIZE
   // Max number of ADC bits (resolution), actual number of bits is set using SPI on some ADCs
   // Range = 8 - 18
   parameter ADC_MAX_DATA_SIZE = 16,

   // BRAM_WORD_NUM
   // Number of data words per write/read cycle
   // Range = 1, 2, 4, 8, ... 64 MAX
   parameter BRAM_WORD_NUM = 8,

   // SRAM_WORD_NUM
   // Number of data words per write/read cycle
   // Range = 4
   parameter SRAM_WORD_NUM = 4
   )

   (
    //============================================= 
    // Read Cycle Data and Clock Signals    
    //============================================= 

    // Read clock.
    input                                          i_read_mux_rd_clk,
    
    // Data from BRAM block.
    input  [ADC_MAX_DATA_SIZE*BRAM_WORD_NUM-1:0]   i_read_mux_bram_data,
    
    // Read address count from BRAM block
    input  [6:0]                                   i_read_mux_bram_cnt, 

    // Data from SRAM block.
    input  [ADC_MAX_DATA_SIZE*SRAM_WORD_NUM-1:0]   i_read_mux_sram_data,

    // Read address count from SRAM block
    input  [2:0]                                   i_read_mux_sram_cnt, 

    // Output data from read cycle, to USB controller
    output [15:0]                                  o_read_mux_data,
    
    //============================================= 
    // SPI Control Signals    
    //============================================= 

    // Read address count from SRAM block
    input                                          i_read_mux_sram_en, 

    // Channel select register map
    // 000 = ADC channel A 
    // 001 = ADC channel B 
    // 010 = ADC channel C 
    // 011 = ADC channel D 
    // 100 = ADC channel E 
    // 101 = ADC channel F 
    // 110 = ADC channel G 
    // 111 = ADC channel H 

    // Channel select for VA read enable channel A.
    input  [2:0]                                   i_read_mux_chan_sel,

    // Data capture mode select regsiter map
    // 000 = Single channel, 64k + 4M SRAM
    // 001 = Dual channel simultaneous, 32k + 2M SRAM each
    // 010 = Quad channel simultaneous, 16k each
    // 011 = Octal channel simultaneous, 8k each
    // Capture sizes are reduced by half when ADC_MAX_DATA_SIZE > 16
    input  [1:0]                                   i_read_mux_capture_mode,
    
    //============================================= 
    // USB Controller Signals    
    //=============================================
    
    // Active low read enable. 
    input                                          i_read_mux_rd_en_n    

    );
   
   //==========================================================================
   // LOCAL PARAMETERS
   //==========================================================================


   //==========================================================================
   // REGS & WIRES
   //==========================================================================

   reg  [ADC_MAX_DATA_SIZE-1:0]     read_mux_data;
   reg  [(ADC_MAX_DATA_SIZE/2)-1:0] read_mux_data_split;
   
   //==========================================================================
   // Mux read data output
   //==========================================================================
   generate if (ADC_MAX_DATA_SIZE <= 16)
      begin
         always @(*)
            case(i_read_mux_capture_mode)
               2'b00: begin // single channel
                  // SRAM
                  if     ({i_read_mux_sram_en == 1'b1} && {i_read_mux_sram_cnt[1:0] == 2'b00})
                        read_mux_data <= {i_read_mux_sram_data[(1*ADC_MAX_DATA_SIZE)-1 -: ADC_MAX_DATA_SIZE]}; 
                  else if({i_read_mux_sram_en == 1'b1} && {i_read_mux_sram_cnt[1:0] == 2'b01})
                        read_mux_data <= {i_read_mux_sram_data[(2*ADC_MAX_DATA_SIZE)-1 -: ADC_MAX_DATA_SIZE]}; 
                  else if({i_read_mux_sram_en == 1'b1} && {i_read_mux_sram_cnt[1:0] == 2'b10})
                        read_mux_data <= {i_read_mux_sram_data[(3*ADC_MAX_DATA_SIZE)-1 -: ADC_MAX_DATA_SIZE]}; 
                  else if({i_read_mux_sram_en == 1'b1} && {i_read_mux_sram_cnt[1:0] == 2'b11})
                        read_mux_data <= {i_read_mux_sram_data[(4*ADC_MAX_DATA_SIZE)-1 -: ADC_MAX_DATA_SIZE]};
                  // BRAM
                  else 
                        read_mux_data <= {i_read_mux_bram_data[i_read_mux_bram_cnt*ADC_MAX_DATA_SIZE +: ADC_MAX_DATA_SIZE]};
               end
              
               2'b01: begin // dual channel
                  // SRAM
                  if     ({i_read_mux_sram_en == 1'b1})
                        read_mux_data <= {i_read_mux_sram_data[((2*i_read_mux_sram_cnt[0])+i_read_mux_chan_sel[0])*ADC_MAX_DATA_SIZE +: ADC_MAX_DATA_SIZE]}; 
                  // BRAM
                  else 
                        read_mux_data <= {i_read_mux_bram_data[((2*i_read_mux_bram_cnt)+i_read_mux_chan_sel)*ADC_MAX_DATA_SIZE +: ADC_MAX_DATA_SIZE]};
               end
              
               2'b10: begin  //quad channel
                  // BRAM only
                        read_mux_data <= {i_read_mux_bram_data[((4*i_read_mux_bram_cnt)+i_read_mux_chan_sel)*ADC_MAX_DATA_SIZE +: ADC_MAX_DATA_SIZE]};
               end
              
               2'b11: begin // octal channel
                  // BRAM only
                        read_mux_data <= {i_read_mux_bram_data[((8*i_read_mux_bram_cnt)+i_read_mux_chan_sel)*ADC_MAX_DATA_SIZE +: ADC_MAX_DATA_SIZE]};                  
                end
               default: read_mux_data <= {ADC_MAX_DATA_SIZE{1'b0}};
            endcase
         end
      else                  // This section needs to be fixed
         always @(*)
            case(i_read_mux_capture_mode)
               2'b00: begin // single channel, split read
                  if     ({i_read_mux_sram_en == 1'b1} && {i_read_mux_sram_cnt == 3'b000})
                     read_mux_data <= i_read_mux_sram_data[(1*(ADC_MAX_DATA_SIZE/2))-1 -: ADC_MAX_DATA_SIZE/2]; 
                  else if({i_read_mux_sram_en == 1'b1} && {i_read_mux_sram_cnt == 3'b001})
                     read_mux_data <= i_read_mux_sram_data[(8*(ADC_MAX_DATA_SIZE/2))-1 -: ADC_MAX_DATA_SIZE/2];
                  else if({i_read_mux_sram_en == 1'b1} && {i_read_mux_sram_cnt == 3'b010})
                     read_mux_data <= i_read_mux_sram_data[(7*(ADC_MAX_DATA_SIZE/2))-1 -: ADC_MAX_DATA_SIZE/2];
                  else if({i_read_mux_sram_en == 1'b1} && {i_read_mux_sram_cnt == 3'b011})
                     read_mux_data <= i_read_mux_sram_data[(6*(ADC_MAX_DATA_SIZE/2))-1 -: ADC_MAX_DATA_SIZE/2];
                  else if({i_read_mux_sram_en == 1'b1} && {i_read_mux_sram_cnt == 3'b100})
                     read_mux_data <= i_read_mux_sram_data[(5*(ADC_MAX_DATA_SIZE/2))-1 -: ADC_MAX_DATA_SIZE/2];
                  else if({i_read_mux_sram_en == 1'b1} && {i_read_mux_sram_cnt == 3'b101})
                     read_mux_data <= i_read_mux_sram_data[(4*(ADC_MAX_DATA_SIZE/2))-1 -: ADC_MAX_DATA_SIZE/2];
                  else if({i_read_mux_sram_en == 1'b1} && {i_read_mux_sram_cnt == 3'b110})
                     read_mux_data <= i_read_mux_sram_data[(3*(ADC_MAX_DATA_SIZE/2))-1 -: ADC_MAX_DATA_SIZE/2];
                  else if({i_read_mux_sram_en == 1'b1} && {i_read_mux_sram_cnt == 3'b111})
                     read_mux_data <= i_read_mux_sram_data[(2*(ADC_MAX_DATA_SIZE/2))-1 -: ADC_MAX_DATA_SIZE/2];
                  else if(i_read_mux_bram_cnt == 3'b000)
                     read_mux_data_split <= i_read_mux_bram_data[(1*(ADC_MAX_DATA_SIZE/2))-1 -: ADC_MAX_DATA_SIZE/2]; 
                  else if(i_read_mux_bram_cnt == 3'b001)
                     read_mux_data_split <= i_read_mux_bram_data[(8*(ADC_MAX_DATA_SIZE/2))-1 -: ADC_MAX_DATA_SIZE/2]; 
                  else if(i_read_mux_bram_cnt == 3'b010)
                     read_mux_data_split <= i_read_mux_bram_data[(7*(ADC_MAX_DATA_SIZE/2))-1 -: ADC_MAX_DATA_SIZE/2]; 
                  else if(i_read_mux_bram_cnt == 3'b011)
                     read_mux_data_split <= i_read_mux_bram_data[(6*(ADC_MAX_DATA_SIZE/2))-1 -: ADC_MAX_DATA_SIZE/2]; 
                  else if(i_read_mux_bram_cnt == 3'b100)
                     read_mux_data_split <= i_read_mux_bram_data[(5*(ADC_MAX_DATA_SIZE/2))-1 -: ADC_MAX_DATA_SIZE/2]; 
                  else if(i_read_mux_bram_cnt == 3'b101)
                     read_mux_data_split <= i_read_mux_bram_data[(4*(ADC_MAX_DATA_SIZE/2))-1 -: ADC_MAX_DATA_SIZE/2]; 
                  else if(i_read_mux_bram_cnt == 3'b110)
                     read_mux_data_split <= i_read_mux_bram_data[(3*(ADC_MAX_DATA_SIZE/2))-1 -: ADC_MAX_DATA_SIZE/2]; 
                  else if(i_read_mux_bram_cnt == 3'b111)
                     read_mux_data_split <= i_read_mux_bram_data[(2*(ADC_MAX_DATA_SIZE/2))-1 -: ADC_MAX_DATA_SIZE/2]; 
                  else
                     read_mux_data_split <= {ADC_MAX_DATA_SIZE/2{1'b0}};
                  end
               2'b01: begin // dual channel, split read
                  if     ({i_read_mux_sram_en == 1'b1} && {i_read_mux_sram_cnt[1:0] == 2'b00} && {i_read_mux_rd_en_n == 1'b0})
                     read_mux_data <= i_read_mux_sram_data[(1*(ADC_MAX_DATA_SIZE/2))-1 -: ADC_MAX_DATA_SIZE/2]; 
                  else if({i_read_mux_sram_en == 1'b1} && {i_read_mux_sram_cnt[1:0] == 2'b01} && {i_read_mux_rd_en_n == 1'b0})
                     read_mux_data <= i_read_mux_sram_data[(8*(ADC_MAX_DATA_SIZE/2))-1 -: ADC_MAX_DATA_SIZE/2];
                  else if({i_read_mux_sram_en == 1'b1} && {i_read_mux_sram_cnt[1:0] == 2'b10} && {i_read_mux_rd_en_n == 1'b0})
                     read_mux_data <= i_read_mux_sram_data[(7*(ADC_MAX_DATA_SIZE/2))-1 -: ADC_MAX_DATA_SIZE/2];
                  else if({i_read_mux_sram_en == 1'b1} && {i_read_mux_sram_cnt[1:0] == 2'b11} && {i_read_mux_rd_en_n == 1'b0})
                     read_mux_data <= i_read_mux_sram_data[(6*(ADC_MAX_DATA_SIZE/2))-1 -: ADC_MAX_DATA_SIZE/2];
                  else if({i_read_mux_sram_en == 1'b1} && {i_read_mux_sram_cnt[1:0] == 2'b00} && {i_read_mux_rd_en_n == 1'b0})
                     read_mux_data <= i_read_mux_sram_data[(5*(ADC_MAX_DATA_SIZE/2))-1 -: ADC_MAX_DATA_SIZE/2];
                  else if({i_read_mux_sram_en == 1'b1} && {i_read_mux_sram_cnt[1:0] == 2'b01} && {i_read_mux_rd_en_n == 1'b0})
                     read_mux_data <= i_read_mux_sram_data[(4*(ADC_MAX_DATA_SIZE/2))-1 -: ADC_MAX_DATA_SIZE/2];
                  else if({i_read_mux_sram_en == 1'b1} && {i_read_mux_sram_cnt[1:0] == 2'b10} && {i_read_mux_rd_en_n == 1'b0})
                     read_mux_data <= i_read_mux_sram_data[(3*(ADC_MAX_DATA_SIZE/2))-1 -: ADC_MAX_DATA_SIZE/2];
                  else if({i_read_mux_sram_en == 1'b1} && {i_read_mux_sram_cnt[1:0] == 2'b11} && {i_read_mux_rd_en_n == 1'b0})
                     read_mux_data <= i_read_mux_sram_data[(2*(ADC_MAX_DATA_SIZE/2))-1 -: ADC_MAX_DATA_SIZE/2];
                  else if({i_read_mux_bram_cnt[1:0] == 2'b00} && {i_read_mux_rd_en_n == 1'b0})
                     read_mux_data_split <= i_read_mux_bram_data[(1*(ADC_MAX_DATA_SIZE/2))-1 -: ADC_MAX_DATA_SIZE/2]; 
                  else if({i_read_mux_bram_cnt[1:0] == 2'b01} && {i_read_mux_rd_en_n == 1'b0})
                     read_mux_data_split <= i_read_mux_bram_data[(8*(ADC_MAX_DATA_SIZE/2))-1 -: ADC_MAX_DATA_SIZE/2]; 
                  else if({i_read_mux_bram_cnt[1:0] == 2'b10} && {i_read_mux_rd_en_n == 1'b0})
                     read_mux_data_split <= i_read_mux_bram_data[(7*(ADC_MAX_DATA_SIZE/2))-1 -: ADC_MAX_DATA_SIZE/2]; 
                  else if({i_read_mux_bram_cnt[1:0] == 2'b11} && {i_read_mux_rd_en_n == 1'b0})
                     read_mux_data_split <= i_read_mux_bram_data[(6*(ADC_MAX_DATA_SIZE/2))-1 -: ADC_MAX_DATA_SIZE/2]; 
                  else if({i_read_mux_bram_cnt[1:0] == 2'b00} && {i_read_mux_rd_en_n == 1'b0})
                     read_mux_data_split <= i_read_mux_bram_data[(5*(ADC_MAX_DATA_SIZE/2))-1 -: ADC_MAX_DATA_SIZE/2]; 
                  else if({i_read_mux_bram_cnt[1:0] == 2'b01} && {i_read_mux_rd_en_n == 1'b0})
                     read_mux_data_split <= i_read_mux_bram_data[(4*(ADC_MAX_DATA_SIZE/2))-1 -: ADC_MAX_DATA_SIZE/2]; 
                  else if({i_read_mux_bram_cnt[1:0] == 2'b10} && {i_read_mux_rd_en_n == 1'b0})
                     read_mux_data_split <= i_read_mux_bram_data[(3*(ADC_MAX_DATA_SIZE/2))-1 -: ADC_MAX_DATA_SIZE/2]; 
                  else if({i_read_mux_bram_cnt[1:0] == 2'b11} && {i_read_mux_rd_en_n == 1'b0})
                     read_mux_data_split <= i_read_mux_bram_data[(2*(ADC_MAX_DATA_SIZE/2))-1 -: ADC_MAX_DATA_SIZE/2]; 
                  else
                     read_mux_data_split <= {ADC_MAX_DATA_SIZE/2{1'b0}};
                  end
               2'b10:  // quad channel - not used
                        read_mux_data_split <= {ADC_MAX_DATA_SIZE/2{1'b0}};
               2'b11:  // octal channel - not used
                        read_mux_data_split <= {ADC_MAX_DATA_SIZE/2{1'b0}};
               default: read_mux_data_split <= {ADC_MAX_DATA_SIZE/2{1'b0}};
            endcase
   endgenerate
            
   //==========================================================================
   // Concatenate zeros in LSB position as needed
   //==========================================================================
   generate
     if(ADC_MAX_DATA_SIZE > 16)
        assign o_read_mux_data = {7'b0, read_mux_data_split};
     else if(ADC_MAX_DATA_SIZE == 16)
        assign o_read_mux_data = read_mux_data;
     else
        assign o_read_mux_data = {read_mux_data, {16-ADC_MAX_DATA_SIZE{1'b0}}};
      
   endgenerate

endmodule // main_memory_read_mux
   
//==========================================================================
// Revision History
// $Log: digital_db#common#design#main_memory#rtl#main_memory_read_mux.v,v $
// Revision 1.2  2011-03-10 13:27:28-05  mhughes
// Initial revision.
//
//
//==========================================================================

