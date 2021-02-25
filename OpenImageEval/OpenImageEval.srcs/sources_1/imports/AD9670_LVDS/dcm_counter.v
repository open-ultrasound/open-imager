//////////////////////////////////////////////////////////////////////////////////
// Company: 		Analog Devices, Inc.
// Engineer: 		MKH
// 
// Create Date:   06-30-2011 
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

module dcm_counter 
   (
   // Data clock input
   input                              i_clk,	

   // Reference clock input
   input                              i_ref_clk,
   
   // Counter reset
   input                              i_reset,

   // Frequency word output, uses i_ref_clk domain
   output [19:0]                      o_freq_word,

   // Frequency set indicator, uses i_ref_clk domain
   output                             o_freq_set,
	
   // Count done indicator, uses i_clk domain
   output                             o_count_done           
   );

   //==========================================================================
   // Wire and register declarations
   //==========================================================================

   reg                             count_d1;
   reg                             count_d2;
   reg                             count_done;
   reg                             freq_set;
   reg  [2:0]                      freq_set_cnt;
   reg  [19:0]                     freq_word;
   reg  [19:0]                     ref_count;
   reg  [19:0]                     clk_count;
   reg  [19:0]                     clk_count_d1;
   reg  [19:0]                     clk_count_d2;
   reg  [19:0]                     clk_count_ref;

   wire [19:0]                     ref_count_max;

   //==========================================================================
   // Assignments
   //==========================================================================

   assign o_freq_word   = freq_word;
   assign o_freq_set    = freq_set;
   assign o_count_done  = count_done;
   assign ref_count_max = 20'h1869F;  // 100,000 reference clock cycles

   //==========================================================================
   // Count reference clock
   //==========================================================================
   always @(posedge i_ref_clk or negedge i_reset)
      if(i_reset == 1'b0)
         ref_count <= 20'h00000;
      else if(ref_count < ref_count_max)
         ref_count <= ref_count + 1;
      else
         ref_count <= ref_count;

   //==========================================================================
   // Transfer ref clock max count to i_clk domain
   //==========================================================================
   always @(posedge i_clk or negedge i_reset)
      if(i_reset == 1'b0)
         begin
            count_d1   <= 1'b0;
            count_d2   <= 1'b0;
            count_done <= 1'b0;
         end
      else 
         begin
            count_d1   <= {ref_count == ref_count_max};
            count_d2   <= count_d1;
            count_done <= count_d2;
         end

   //==========================================================================
   // Count data rate clock
   //==========================================================================
   always @(posedge i_clk or negedge i_reset) 
      if(i_reset == 1'b0)
         clk_count <= 20'h00000;
      else if(count_done == 1'b0)
         clk_count <= clk_count + 1;
      else
         clk_count <= clk_count;

   //==========================================================================
   // Transfer clock count to i_ref_clk domain
   //==========================================================================
   always @(posedge i_ref_clk or negedge i_reset)
      if(i_reset == 1'b0)
         begin
            clk_count_d1  <= 20'h0;
            clk_count_d2  <= 20'h0;
            clk_count_ref <= 20'h0;
         end
      else if(ref_count == ref_count_max)
         begin
            clk_count_d1  <= clk_count;
            clk_count_d2  <= clk_count_d1;
            clk_count_ref <= clk_count_d2;
         end
      else
         begin
            clk_count_d1  <= clk_count_d1;
            clk_count_d2  <= clk_count_d2;
            clk_count_ref <= clk_count_ref;
         end      

   //==========================================================================
   // Register frequency word
   //==========================================================================
   always @(posedge i_ref_clk or negedge i_reset) 
      if(i_reset == 1'b0)
         freq_word <= 20'h00000;
      else if(ref_count == ref_count_max)
         freq_word <= clk_count_ref;
      else
         freq_word <= freq_word;

   //==========================================================================
   // Generate frequency set pulse, add delay to ensure count is done
   //==========================================================================
   always @(posedge i_ref_clk or negedge i_reset) 
      if(i_reset == 1'b0)
         freq_set_cnt <= 3'b0;
      else if({ref_count == ref_count_max} && {freq_set_cnt != 3'b111})
         freq_set_cnt <= freq_set_cnt + 1;
      else
         freq_set_cnt <= freq_set_cnt;
         
   always @(posedge i_ref_clk or negedge i_reset) 
      if(i_reset == 1'b0)
         freq_set <= 1'b0;
      else if(freq_set_cnt == 3'b110)
         freq_set <= 1'b1;
      else
         freq_set <= 1'b0;

endmodule
