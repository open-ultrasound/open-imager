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

module word_deframer #
   (
    parameter ADC_MAX_DATA_SIZE = 16,
    parameter INPUT_CHAN_NUM    = 8
   )
   (
   //============================================= 
   // Data, Clock and Control Inputs    
   //============================================= 

   // Input data clock
   input                                            i_word_deframer_clk,
    
   // Input data words
   input  [ADC_MAX_DATA_SIZE-1:0]                   i_word_deframer_data_lane0,
   input  [ADC_MAX_DATA_SIZE-1:0]                   i_word_deframer_data_lane1,
   input  [ADC_MAX_DATA_SIZE-1:0]                   i_word_deframer_data_lane2,
   input  [ADC_MAX_DATA_SIZE-1:0]                   i_word_deframer_data_lane3,
   input  [ADC_MAX_DATA_SIZE-1:0]                   i_word_deframer_data_lane4,
   input  [ADC_MAX_DATA_SIZE-1:0]                   i_word_deframer_data_lane5,
   input  [ADC_MAX_DATA_SIZE-1:0]                   i_word_deframer_data_lane6,
   input  [ADC_MAX_DATA_SIZE-1:0]                   i_word_deframer_data_lane7,
    
   // Active low, master reset from FIFO5 USB controller
   input                                            i_word_deframer_reset_n,

   // Active low, write enable from FIFO5 USB controller
   input                                            i_word_deframer_wr_en_n,

   // Demod mode control, 0 = IQ, 1 = real data
   input                                            i_word_deframer_demod_mode,

   // Data capture mode control, 00 = single channel, 01 = dual channel, 11 = octal, 10 is not used
   input  [1:0]                                     i_word_deframer_capture_mode,

   // Number of lanes, 00 = 8, 01 = 4, 10 = 2, 11 = 1
   input  [1:0]                                     i_word_deframer_lane_number,

   // ADC resolution, 00 = 12, 01 = 14, 10 = 16, 11 = not used
   input  [1:0]                                     i_word_deframer_bit_sel,
   
   // Use new zero sample configuration, 0 = use new settings, 1 = use original settings
   input                                            i_word_deframer_use_old_zero,

   // Debug ramp enable, need to bypass start code
   input                                            i_word_deframer_ramp_en,

   // Start code bypass enable signal, 0 = requires start code, 1 = no start code required
   input                                            i_word_deframer_start_code_bypass,

   // User defined start code
   input  [15:0]                                    i_word_deframer_start_code,

   // User defined start code enable
   input                                            i_word_deframer_start_code_en,
   
   // Start code channel select
   // 000 = channel A, 001 = channel B, etc.
   input  [2:0]                                     i_word_deframer_start_code_chan,
    
   // Decimation factor, equals value plus 1
   input  [4:0]                                     i_word_deframer_dec_factor,
       
   // System ready signal, DCM is locked and settled
   input                                            i_word_deframer_system_rdy,
   
   //============================================= 
   // Data Outputs    
   //============================================= 
   
   // Data enable signal
   output                                           o_word_deframer_data_en,
  
   // Data output 
   output [ADC_MAX_DATA_SIZE*2*INPUT_CHAN_NUM-1:0]  o_word_deframer_data,
      
   // System ready signal
   output                                           o_word_deframer_system_rdy
   );

   //==========================================================================
   // LOCAL PARAMETERS
   //==========================================================================
  
   //==========================================================================
   // REGS & WIRES
   //==========================================================================
   reg                                              start_code_found;
   reg                                              word_deframer_system_ready;
   reg                                              word_deframer_system_ready_reg;
   reg                                              word_deframer_system_ready_d1;
   reg                                              word_deframer_system_ready_d2;
   reg                                              word_deframer_system_ready_d3;
   reg                                              word_deframer_system_ready_d4;
   reg                                              word_deframer_system_ready_d5;
   reg                                              word_deframer_system_ready_d6;
   reg                                              word_deframer_system_ready_d7;
   reg                                              word_deframer_system_ready_d8;
   reg                                              word_deframer_system_ready_d9;
   reg                                              word_deframer_system_ready_d10;
   reg                                              word_deframer_system_ready_d11;
   reg                                              word_deframer_system_ready_d12;
   reg                                              word_deframer_system_ready_d13;
   reg                                              word_deframer_system_ready_d14;
   reg                                              word_deframer_data_en;
   reg  [4:0]                                       valid_word_num;
   reg  [4:0]                                       valid_word_num_count;
   reg  [5:0]                                       total_word_num;
   reg  [5:0]                                       total_word_num_count;
   reg  [6:0]                                       system_ready_count;
   reg  [ADC_MAX_DATA_SIZE*16-1:0]                  data_lane0_reg;
   reg  [ADC_MAX_DATA_SIZE*16-1:0]                  data_lane1_reg;
   reg  [ADC_MAX_DATA_SIZE*16-1:0]                  data_lane2_reg;
   reg  [ADC_MAX_DATA_SIZE*16-1:0]                  data_lane3_reg;
   reg  [ADC_MAX_DATA_SIZE*16-1:0]                  data_lane4_reg;
   reg  [ADC_MAX_DATA_SIZE*16-1:0]                  data_lane5_reg;
   reg  [ADC_MAX_DATA_SIZE*16-1:0]                  data_lane6_reg;
   reg  [ADC_MAX_DATA_SIZE*16-1:0]                  data_lane7_reg;
   reg  [ADC_MAX_DATA_SIZE*16-1:0]                  word_deframer_data;

   wire [4:0]                                       decimation_factor;
   wire [ADC_MAX_DATA_SIZE-1:0]                     start_code_chan_sel;

   //==========================================================================
   // ASSIGNMENTS
   //==========================================================================
   assign decimation_factor = i_word_deframer_dec_factor;

   //==========================================================================
   // Select channel for start code
   //==========================================================================
   assign start_code_chan_sel = (i_word_deframer_start_code_chan == 3'b000) ? i_word_deframer_data_lane0 :
                                (i_word_deframer_start_code_chan == 3'b001) ? i_word_deframer_data_lane1 :
                                (i_word_deframer_start_code_chan == 3'b010) ? i_word_deframer_data_lane2 :
                                (i_word_deframer_start_code_chan == 3'b011) ? i_word_deframer_data_lane3 :
                                (i_word_deframer_start_code_chan == 3'b100) ? i_word_deframer_data_lane4 :
                                (i_word_deframer_start_code_chan == 3'b101) ? i_word_deframer_data_lane5 :
                                (i_word_deframer_start_code_chan == 3'b110) ? i_word_deframer_data_lane6 :
                                (i_word_deframer_start_code_chan == 3'b111) ? i_word_deframer_data_lane7 : 1'b0;
     
   //==========================================================================
   // Wait for start code
   //==========================================================================
   always @(posedge i_word_deframer_clk or negedge i_word_deframer_reset_n)
      if(i_word_deframer_reset_n == 1'b0)
         start_code_found <= 1'b0;
      else if({i_word_deframer_ramp_en == 1'b1} || {i_word_deframer_start_code_bypass == 1'b1})
         start_code_found <= 1'b1;
      else if({i_word_deframer_start_code_en == 1'b1} && {i_word_deframer_bit_sel == 2'b00} && {start_code_chan_sel[15:4] == i_word_deframer_start_code[15:4]}) 
         start_code_found <= 1'b1;                    // 12-bit ADC resolution, user defined start code
      else if({i_word_deframer_start_code_en == 1'b1} && {i_word_deframer_bit_sel == 2'b01} && {start_code_chan_sel[15:2] == i_word_deframer_start_code[15:2]}) 
         start_code_found <= 1'b1;                    // 14-bit ADC resolution, user defined start code
      else if({i_word_deframer_start_code_en == 1'b1} && {i_word_deframer_bit_sel == 2'b10} && {start_code_chan_sel == i_word_deframer_start_code}) 
         start_code_found <= 1'b1;                    // 16-bit ADC resolution, user defined start code
      else if({i_word_deframer_bit_sel == 2'b00} && {start_code_chan_sel == 16'h7720}) 
         start_code_found <= 1'b1;                    // 12-bit ADC resolution, default start code
      else if({i_word_deframer_bit_sel == 2'b01} && {start_code_chan_sel == 16'h9DC8}) 
         start_code_found <= 1'b1;                    // 14-bit ADC resolution, default start code
      else if({i_word_deframer_bit_sel == 2'b10} && {start_code_chan_sel == 16'h2772}) 
         start_code_found <= 1'b1;                    // 16-bit ADC resolution, default start code
         
   //==========================================================================
   // Generate system ready signal, add delay to line up data capture starting point
   //==========================================================================
   always @(posedge i_word_deframer_clk or negedge i_word_deframer_reset_n)
      if(i_word_deframer_reset_n == 1'b0)
        begin
           word_deframer_system_ready_d1  <= 1'b0;
           word_deframer_system_ready_d2  <= 1'b0;
           word_deframer_system_ready_d3  <= 1'b0;
           word_deframer_system_ready_d4  <= 1'b0;
           word_deframer_system_ready_d5  <= 1'b0;
           word_deframer_system_ready_d6  <= 1'b0;
           word_deframer_system_ready_d7  <= 1'b0;
           word_deframer_system_ready_d8  <= 1'b0;
           word_deframer_system_ready_d9  <= 1'b0;
           word_deframer_system_ready_d10 <= 1'b0;
           word_deframer_system_ready_d11 <= 1'b0;
           word_deframer_system_ready_d12 <= 1'b0;
           word_deframer_system_ready_d13 <= 1'b0;
           word_deframer_system_ready_d14 <= 1'b0;
        end
      else if({i_word_deframer_wr_en_n == 1'b0} && {i_word_deframer_system_rdy == 1'b1} && {start_code_found == 1'b1} && {word_deframer_data_en == 1'b1})
        begin
           word_deframer_system_ready_d1  <= 1'b1;
           word_deframer_system_ready_d2  <= word_deframer_system_ready_d1;
           word_deframer_system_ready_d3  <= word_deframer_system_ready_d2;
           word_deframer_system_ready_d4  <= word_deframer_system_ready_d3;
           word_deframer_system_ready_d5  <= word_deframer_system_ready_d4;
           word_deframer_system_ready_d6  <= word_deframer_system_ready_d5;
           word_deframer_system_ready_d7  <= word_deframer_system_ready_d6;
           word_deframer_system_ready_d8  <= word_deframer_system_ready_d7;
           word_deframer_system_ready_d9  <= word_deframer_system_ready_d8;
           word_deframer_system_ready_d10 <= word_deframer_system_ready_d9;
           word_deframer_system_ready_d11 <= word_deframer_system_ready_d10;
           word_deframer_system_ready_d12 <= word_deframer_system_ready_d11;
           word_deframer_system_ready_d13 <= word_deframer_system_ready_d12;
           word_deframer_system_ready_d14 <= word_deframer_system_ready_d13;
        end

   always @(posedge i_word_deframer_clk or negedge i_word_deframer_reset_n)
      if(i_word_deframer_reset_n == 1'b0)
            word_deframer_system_ready <= 1'b0;
      else if({i_word_deframer_demod_mode == 1'b1} && {i_word_deframer_lane_number == 2'b00})   // Real, 8 lanes
         if(i_word_deframer_capture_mode == 2'b00)                                                 // Single channel capture
            word_deframer_system_ready <= word_deframer_system_ready_d5;
         else if(i_word_deframer_capture_mode == 2'b01)                                            // Dual channel capture
            word_deframer_system_ready <= word_deframer_system_ready_d13;
         else //(i_word_deframer_capture_mode == 2'b11)                                            // Octal channel capture
            word_deframer_system_ready <= word_deframer_system_ready_d12;
      else if({i_word_deframer_demod_mode == 1'b1} && {i_word_deframer_lane_number == 2'b01})   // Real, 4 lanes
         if(i_word_deframer_capture_mode == 2'b00)                                                 // Single channel capture
            word_deframer_system_ready <= word_deframer_system_ready_d5;
         else if(i_word_deframer_capture_mode == 2'b01)                                            // Dual channel capture
            word_deframer_system_ready <= word_deframer_system_ready_d5;
         else //(i_word_deframer_capture_mode == 2'b11)                                            // Octal channel capture
            word_deframer_system_ready <= word_deframer_system_ready_d4;
      else if({i_word_deframer_demod_mode == 1'b1} && {i_word_deframer_lane_number == 2'b10})   // Real, 2 lanes
         if(i_word_deframer_capture_mode == 2'b00)                                                 // Single channel capture
            word_deframer_system_ready <= word_deframer_system_ready_d9;
         else if(i_word_deframer_capture_mode == 2'b01)                                            // Dual channel capture
            word_deframer_system_ready <= word_deframer_system_ready_d9;
         else //(i_word_deframer_capture_mode == 2'b11)                                            // Octal channel capture
            word_deframer_system_ready <= word_deframer_system_ready_d8;
      else if({i_word_deframer_demod_mode == 1'b1} && {i_word_deframer_lane_number == 2'b11})   // Real, 1 lane
         if(i_word_deframer_capture_mode == 2'b00)                                                 // Single channel capture
            word_deframer_system_ready <= word_deframer_system_ready_d7;
         else if(i_word_deframer_capture_mode == 2'b01)                                            // Dual channel capture
            word_deframer_system_ready <= word_deframer_system_ready_d7;
         else //(i_word_deframer_capture_mode == 2'b11)                                            // Octal channel capture
            word_deframer_system_ready <= word_deframer_system_ready_d6;
      else if({i_word_deframer_demod_mode == 1'b0} && {i_word_deframer_lane_number == 2'b00})   // IQ, 8 lanes, all capture modes
            word_deframer_system_ready <= word_deframer_system_ready_d10;
      else if({i_word_deframer_demod_mode == 1'b0} && {i_word_deframer_lane_number == 2'b01})   // IQ, 4 lanes, all capture modes
            word_deframer_system_ready <= word_deframer_system_ready_d6;
      else if({i_word_deframer_demod_mode == 1'b0} && {i_word_deframer_lane_number == 2'b10})   // IQ, 2 lanes, all capture modes
            word_deframer_system_ready <= word_deframer_system_ready_d4;
      else // if({i_word_deframer_demod_mode == 1'b0} && {i_word_deframer_lane_number == 2'b11})// IQ, 1 lane, all capture modes
            word_deframer_system_ready <= word_deframer_system_ready_d3;            

   //==========================================================================
   // Delay data capture by 128 cycles
   //==========================================================================
   always @(posedge i_word_deframer_clk or negedge i_word_deframer_reset_n)
      if(i_word_deframer_reset_n == 1'b0)
        system_ready_count <= 1'b0;
      else if((word_deframer_system_ready == 1'b1) && (system_ready_count != 7'h7F))
        system_ready_count <= system_ready_count + 1;

   always @(posedge i_word_deframer_clk or negedge i_word_deframer_reset_n)
      if(i_word_deframer_reset_n == 1'b0)
        word_deframer_system_ready_reg <= 1'b0;
      else if(system_ready_count == 7'h7F)
        word_deframer_system_ready_reg <= 1'b1;

   assign o_word_deframer_system_rdy = word_deframer_system_ready_reg;

   //==========================================================================
   // Determine number of valid words per frame per lane
   //==========================================================================
   always @(*)
     if(i_word_deframer_demod_mode == 1'b1)            // Real data mode
        if     (i_word_deframer_lane_number == 2'b00)  // 8 lanes, 1 valid word per lane
           valid_word_num <= 5'd1;
        else if(i_word_deframer_lane_number == 2'b01)  // 4 lanes, 2 valid words per lane
           valid_word_num <= 5'd2;
        else if(i_word_deframer_lane_number == 2'b10)  // 2 lanes, 4 valid words per lane
           valid_word_num <= 5'd4;
        else                                           // 1 lane, 8 valid words per lane
           valid_word_num <= 5'd8;               
     else                                              // IQ data mode 
        if     (i_word_deframer_lane_number == 2'b00)  // 8 lanes, 2 valid words per lane
           valid_word_num <= 5'd2;
        else if(i_word_deframer_lane_number == 2'b01)  // 4 lanes, 4 valid words per lane
           valid_word_num <= 5'd4;
        else if(i_word_deframer_lane_number == 2'b10)  // 2 lanes, 8 valid words per lane
           valid_word_num <= 5'd8;
        else                                           // 1 lane, 16 valid words per lane
           valid_word_num <= 5'd16;
   
   //==========================================================================
   // Determine number of total number of words per frame per lane (includes 0 samples)
   //==========================================================================
   always @(*)
      // Real data mode, original zero settings 
      if({i_word_deframer_demod_mode == 1'b1} && {i_word_deframer_use_old_zero == 1'b1})    
       begin
        if     (decimation_factor == 5'd0)
          total_word_num <= 6'd1;
        else if({decimation_factor == 5'd1} || {decimation_factor == 5'd3} || {decimation_factor == 5'd7} || {decimation_factor == 5'd15} || {decimation_factor == 5'd31})  
          begin
           if     (i_word_deframer_lane_number == 2'b00) // 8 lanes
              total_word_num <= 6'd1;
           else if(i_word_deframer_lane_number == 2'b01) // 4 lanes
              total_word_num <= 6'd2;
           else if(i_word_deframer_lane_number == 2'b10) // 2 lanes
              total_word_num <= 6'd4;
           else                                          // 1 lane
              total_word_num <= 6'd8;
          end
        else if(decimation_factor[0] == 1'b0)   // Odd numbered decimation factor
              total_word_num <= i_word_deframer_dec_factor + 1;
        else if({decimation_factor == 5'd5} || {decimation_factor == 5'd11} || {decimation_factor == 5'd23}) // Decimation factor = 6, 12 or 24
          begin
           if     ({i_word_deframer_lane_number == 2'b00} || {i_word_deframer_lane_number == 2'b01}) // 8 or 4 lanes
              total_word_num <= 6'd3;
           else if(i_word_deframer_lane_number == 2'b10) // 2 lanes
              total_word_num <= 6'd6;
           else                                          // 1 lane
              total_word_num <= 6'd12;
          end
        else if({decimation_factor == 5'd9} || {decimation_factor == 5'd19}) // Decimation factor = 10 or 20
          begin
           if     (i_word_deframer_lane_number == 2'b11) // 1 lane
              total_word_num <= 6'd10;
           else                                          // 8, 4 or 2 lanes
              total_word_num <= 6'd5;
          end
        else if({decimation_factor == 5'd13} || {decimation_factor == 5'd27}) // Decimation factor = 14 or 28
          begin
           if     (i_word_deframer_lane_number == 2'b11) // 1 lane
              total_word_num <= 6'd14;
           else                                          // 8, 4 or 2 lanes
              total_word_num <= 6'd7;
          end
        else if(decimation_factor == 5'd17)     // Decimation factor = 18
              total_word_num <= 6'd9;
        else if(decimation_factor == 5'd21)     // Decimation factor = 22
              total_word_num <= 6'd11;
        else if(decimation_factor == 5'd25)     // Decimation factor = 26
              total_word_num <= 6'd13;
        else if(decimation_factor == 5'd29)     // Decimation factor = 30
              total_word_num <= 6'd15;
        else                                             // End of real mode
              total_word_num <= 6'd1;
      end // Real data mode, original zero settings

      // IQ data mode, original zero settings 
      else if({i_word_deframer_demod_mode == 1'b0} && {i_word_deframer_use_old_zero == 1'b1})    
       begin        
         if({decimation_factor == 5'd1} || {decimation_factor == 5'd3} || {decimation_factor == 5'd7} || {decimation_factor == 5'd15} || {decimation_factor == 5'd31})  
          begin
           if     (i_word_deframer_lane_number == 2'b00) // 8 lanes
              total_word_num <= 6'd2;
           else if(i_word_deframer_lane_number == 2'b01) // 4 lanes
              total_word_num <= 6'd4;
           else if(i_word_deframer_lane_number == 2'b10) // 2 lanes
              total_word_num <= 6'd8;
           else                                          // 1 lane
              total_word_num <= 6'd16;
          end
        else if(decimation_factor[0] == 1'b0)   // Odd numbered decimation factor
              total_word_num <= i_word_deframer_dec_factor + 1;
        else if({decimation_factor == 5'd5} || {decimation_factor == 5'd11} || {decimation_factor == 5'd23}) // Decimation factor = 6, 12 or 24
          begin
           if     (i_word_deframer_lane_number == 2'b00) // 8 lanes
              total_word_num <= 6'd3;
           else if(i_word_deframer_lane_number == 2'b01) // 4 lanes
              total_word_num <= 6'd6;
           else if(i_word_deframer_lane_number == 2'b10) // 2 lanes
              total_word_num <= 6'd12;
           else                                          // 1 lane
              total_word_num <= 6'd24;
          end
        else if({decimation_factor == 5'd9} || {decimation_factor == 5'd19}) // Decimation factor = 10 or 20
          begin
           if     ({i_word_deframer_lane_number == 2'b00} || {i_word_deframer_lane_number == 2'b01}) // 8 or 4 lanes
              total_word_num <= 6'd5;
           else if(i_word_deframer_lane_number == 2'b10) // 2 lanes
              total_word_num <= 6'd10;
           else                                          // 1 lane
              total_word_num <= 6'd20;
          end
        else if({decimation_factor == 5'd13} || {decimation_factor == 5'd27}) // Decimation factor = 14 or 28
          begin
           if     ({i_word_deframer_lane_number == 2'b00} || {i_word_deframer_lane_number == 2'b01}) // 8 or 4 lanes
              total_word_num <= 6'd7;
           else if(i_word_deframer_lane_number == 2'b10) // 2 lanes
              total_word_num <= 6'd14;
           else                                          // 1 lane
              total_word_num <= 6'd28;
          end
        else if(decimation_factor == 5'd17)     // Decimation factor = 18
          begin
           if     (i_word_deframer_lane_number == 2'b11) // 1 lane
              total_word_num <= 6'd18;
           else                                          // 8, 4 or 2 lanes
              total_word_num <= 6'd9;
          end
        else if(decimation_factor == 5'd21)     // Decimation factor = 22
          begin
           if     (i_word_deframer_lane_number == 2'b11) // 1 lane
              total_word_num <= 6'd22;
           else                                          // 8, 4 or 2 lanes
              total_word_num <= 6'd11;
          end
        else if(decimation_factor == 5'd25)     // Decimation factor = 26
          begin
           if     (i_word_deframer_lane_number == 2'b11) // 1 lane
              total_word_num <= 6'd26;
           else                                          // 8, 4 or 2 lanes
              total_word_num <= 6'd13;
          end
        else if(decimation_factor == 5'd29)     // Decimation factor = 30
          begin
           if     (i_word_deframer_lane_number == 2'b11) // 1 lane
              total_word_num <= 6'd30;
           else                                          // 8, 4 or 2 lanes
              total_word_num <= 6'd15;
          end
        else                                             // End of IQ mode
              total_word_num <= 6'd1;
      end // IQ data mode, original zero settings

      // Real data mode, new zero settings
      else if({i_word_deframer_demod_mode == 1'b1} && {i_word_deframer_use_old_zero == 1'b0})    
        begin
              total_word_num <= decimation_factor + 1;
        end // Real data mode, new zero settings

      // IQ data mode, new zero settings
      else //if({i_word_deframer_demod_mode == 1'b0} && {i_word_deframer_use_old_zero == 1'b0})    
        begin
              total_word_num <= decimation_factor + 1;
        end // IQ data mode, new zero settings
   
   //==========================================================================
   // Keep track of total_word_num count
   //==========================================================================
   always @(posedge i_word_deframer_clk or negedge i_word_deframer_reset_n)
      if(i_word_deframer_reset_n == 1'b0)
         total_word_num_count <= 6'b0;
      else if(total_word_num_count == {total_word_num-1})
         total_word_num_count <= 6'b0;
      else if(start_code_found == 1'b1)
         total_word_num_count <= total_word_num_count + 1;

   //==========================================================================
   // Generate data enable signal
   //==========================================================================
   always @(posedge i_word_deframer_clk or negedge i_word_deframer_reset_n)
      if(i_word_deframer_reset_n == 1'b0)
         word_deframer_data_en <= 1'b0;
      else if(total_word_num == 6'd1)
        word_deframer_data_en <= 1'b1;
      else if(total_word_num_count == {total_word_num-1})
         word_deframer_data_en <= 1'b1;
      else
         word_deframer_data_en <= 1'b0;

   assign o_word_deframer_data_en = word_deframer_data_en;

   //==========================================================================
   // Capture valid data words
   //==========================================================================
   always @(posedge i_word_deframer_clk)
      if(total_word_num_count < valid_word_num)
        begin
           data_lane0_reg <= {i_word_deframer_data_lane0, data_lane0_reg[ADC_MAX_DATA_SIZE*16-1:ADC_MAX_DATA_SIZE]};
           data_lane1_reg <= {i_word_deframer_data_lane1, data_lane1_reg[ADC_MAX_DATA_SIZE*16-1:ADC_MAX_DATA_SIZE]};
           data_lane2_reg <= {i_word_deframer_data_lane2, data_lane2_reg[ADC_MAX_DATA_SIZE*16-1:ADC_MAX_DATA_SIZE]};
           data_lane3_reg <= {i_word_deframer_data_lane3, data_lane3_reg[ADC_MAX_DATA_SIZE*16-1:ADC_MAX_DATA_SIZE]};
           data_lane4_reg <= {i_word_deframer_data_lane4, data_lane4_reg[ADC_MAX_DATA_SIZE*16-1:ADC_MAX_DATA_SIZE]};
           data_lane5_reg <= {i_word_deframer_data_lane5, data_lane5_reg[ADC_MAX_DATA_SIZE*16-1:ADC_MAX_DATA_SIZE]};
           data_lane6_reg <= {i_word_deframer_data_lane6, data_lane6_reg[ADC_MAX_DATA_SIZE*16-1:ADC_MAX_DATA_SIZE]};
           data_lane7_reg <= {i_word_deframer_data_lane7, data_lane7_reg[ADC_MAX_DATA_SIZE*16-1:ADC_MAX_DATA_SIZE]};
        end
         
   //==========================================================================
   // Register output data depending on configuration
   //==========================================================================
   always @(posedge i_word_deframer_clk or negedge i_word_deframer_reset_n)
      if(i_word_deframer_reset_n == 1'b0)
        word_deframer_data <= {ADC_MAX_DATA_SIZE*16{1'b0}};
      else if(word_deframer_data_en == 1'b1)
        begin
           if(i_word_deframer_demod_mode == 1'b1)              // Real data mode
             case(i_word_deframer_lane_number)
               // 8 lanes         
               2'b00: word_deframer_data <= {{ADC_MAX_DATA_SIZE*8{1'b0}},        
                                              data_lane7_reg[ADC_MAX_DATA_SIZE-1:0], 
                                              data_lane6_reg[ADC_MAX_DATA_SIZE-1:0], 
                                              data_lane5_reg[ADC_MAX_DATA_SIZE-1:0], 
                                              data_lane4_reg[ADC_MAX_DATA_SIZE-1:0], 
                                              data_lane3_reg[ADC_MAX_DATA_SIZE-1:0], 
                                              data_lane2_reg[ADC_MAX_DATA_SIZE-1:0], 
                                              data_lane1_reg[ADC_MAX_DATA_SIZE-1:0], 
                                              data_lane0_reg[ADC_MAX_DATA_SIZE-1:0]};
               // 4 lanes
               2'b01: word_deframer_data <= {{ADC_MAX_DATA_SIZE*8{1'b0}},        
                                              data_lane6_reg[ADC_MAX_DATA_SIZE*2-1:0], 
                                              data_lane4_reg[ADC_MAX_DATA_SIZE*2-1:0], 
                                              data_lane2_reg[ADC_MAX_DATA_SIZE*2-1:0], 
                                              data_lane0_reg[ADC_MAX_DATA_SIZE*2-1:0]};
               // 2 lanes
               2'b10: word_deframer_data <= {{ADC_MAX_DATA_SIZE*8{1'b0}},        
                                              data_lane4_reg[ADC_MAX_DATA_SIZE*4-1:0], 
                                              data_lane0_reg[ADC_MAX_DATA_SIZE*4-1:0]};
               // 1 lane
               2'b11: word_deframer_data <= {{ADC_MAX_DATA_SIZE*8{1'b0}},        
                                              data_lane0_reg[ADC_MAX_DATA_SIZE*8-1:0]};
               default:
                      word_deframer_data <= {ADC_MAX_DATA_SIZE*16{1'b0}};
             endcase // case (i_word_deframer_lane_number)
           else                                                // IQ data mode
             case(i_word_deframer_lane_number)
               // 8 lanes         
               2'b00: word_deframer_data <= {data_lane7_reg[ADC_MAX_DATA_SIZE*2-1:0], 
                                             data_lane6_reg[ADC_MAX_DATA_SIZE*2-1:0], 
                                             data_lane5_reg[ADC_MAX_DATA_SIZE*2-1:0], 
                                             data_lane4_reg[ADC_MAX_DATA_SIZE*2-1:0], 
                                             data_lane3_reg[ADC_MAX_DATA_SIZE*2-1:0], 
                                             data_lane2_reg[ADC_MAX_DATA_SIZE*2-1:0], 
                                             data_lane1_reg[ADC_MAX_DATA_SIZE*2-1:0], 
                                             data_lane0_reg[ADC_MAX_DATA_SIZE*2-1:0]};
               // 4 lanes
               2'b01: word_deframer_data <= {data_lane6_reg[ADC_MAX_DATA_SIZE*4-1:0], 
                                             data_lane4_reg[ADC_MAX_DATA_SIZE*4-1:0], 
                                             data_lane2_reg[ADC_MAX_DATA_SIZE*4-1:0], 
                                             data_lane0_reg[ADC_MAX_DATA_SIZE*4-1:0]};
               // 2 lanes
               2'b10: word_deframer_data <= {data_lane4_reg[ADC_MAX_DATA_SIZE*8-1:0], 
                                             data_lane0_reg[ADC_MAX_DATA_SIZE*8-1:0]};
               // 1 lane
               2'b11: word_deframer_data <= {data_lane0_reg[ADC_MAX_DATA_SIZE*16-1:0]};
               default:
                      word_deframer_data <= {ADC_MAX_DATA_SIZE*16{1'b0}};
             endcase // case (i_word_deframer_lane_number)
        end // if (word_deframer_data_en == 1'b1)

   assign o_word_deframer_data = word_deframer_data;

endmodule // word_deframer

