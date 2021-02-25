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
// Description: 	
//					
// Dependencies: 
//
// Revision 0.01 - File Created
// Revision: 
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module iddr_top #
  (
	parameter ADC_MAX_DATA_SIZE = 16,
	parameter IDDR_DATA_SIZE = 8
  )
  (// Outputs
   output reg [ADC_MAX_DATA_SIZE-1:0] iddr_data_lane0,
   output reg [ADC_MAX_DATA_SIZE-1:0] iddr_data_lane1,
   output reg [ADC_MAX_DATA_SIZE-1:0] iddr_data_lane2,
   output reg [ADC_MAX_DATA_SIZE-1:0] iddr_data_lane3,
   output reg [ADC_MAX_DATA_SIZE-1:0] iddr_data_lane4,
   output reg [ADC_MAX_DATA_SIZE-1:0] iddr_data_lane5,
   output reg [ADC_MAX_DATA_SIZE-1:0] iddr_data_lane6,
   output reg [ADC_MAX_DATA_SIZE-1:0] iddr_data_lane7,
   output reg                         iddr_data_rdy,
   output                             iddr_data_clk,
   // Inputs
   input                              iddr_reset_n,
   input                              iddr_dcm_rdy,
   input                              iddr_wr_en_n, 
   input      [1:0]                   iddr_bit_sel,
   input                              iddr_ramp_en,
   input                              iddr_dco, 
   input                              iddr_fco, 
   input      [IDDR_DATA_SIZE-1:0]    iddr_data
   );
   
   //-------------------------------------------------------------------------------------------
   // Wire and register declarations
   //-------------------------------------------------------------------------------------------
   wire [IDDR_DATA_SIZE-1:0] q1_r;
   wire [IDDR_DATA_SIZE-1:0] q2_f;
   
   reg  fco1;
   reg  fco_strobe;
   reg  [7:0] data_rise_lane0;
   reg  [7:0] data_fall_lane0;
   reg  [7:0] data_rise_lane1;
   reg  [7:0] data_fall_lane1;
   reg  [7:0] data_rise_lane2;
   reg  [7:0] data_fall_lane2;
   reg  [7:0] data_rise_lane3;
   reg  [7:0] data_fall_lane3;
   reg  [7:0] data_rise_lane4;
   reg  [7:0] data_fall_lane4;
   reg  [7:0] data_rise_lane5;
   reg  [7:0] data_fall_lane5;
   reg  [7:0] data_rise_lane6;
   reg  [7:0] data_fall_lane6;
   reg  [7:0] data_rise_lane7;
   reg  [7:0] data_fall_lane7;
   reg  [ADC_MAX_DATA_SIZE-1:0]   dout_lane0;
   reg  [ADC_MAX_DATA_SIZE-1:0]   dout_lane1;
   reg  [ADC_MAX_DATA_SIZE-1:0]   dout_lane2;
   reg  [ADC_MAX_DATA_SIZE-1:0]   dout_lane3;
   reg  [ADC_MAX_DATA_SIZE-1:0]   dout_lane4;
   reg  [ADC_MAX_DATA_SIZE-1:0]   dout_lane5;
   reg  [ADC_MAX_DATA_SIZE-1:0]   dout_lane6;
   reg  [ADC_MAX_DATA_SIZE-1:0]   dout_lane7;
   reg  [ADC_MAX_DATA_SIZE-1:0]   par_data_lane0;
   reg  [ADC_MAX_DATA_SIZE-1:0]   par_data_lane1;
   reg  [ADC_MAX_DATA_SIZE-1:0]   par_data_lane2;
   reg  [ADC_MAX_DATA_SIZE-1:0]   par_data_lane3;
   reg  [ADC_MAX_DATA_SIZE-1:0]   par_data_lane4;
   reg  [ADC_MAX_DATA_SIZE-1:0]   par_data_lane5;
   reg  [ADC_MAX_DATA_SIZE-1:0]   par_data_lane6;
   reg  [ADC_MAX_DATA_SIZE-1:0]   par_data_lane7;
   reg  [ADC_MAX_DATA_SIZE-1:0]   ramp;

   //-------------------------------------------------------------------------------------------
   // Generate FCO strobe and buffer data clock
   //-------------------------------------------------------------------------------------------
   always @(posedge iddr_dco or negedge iddr_reset_n)
      if(iddr_reset_n == 1'b0)
         begin
            fco1       <= 1'b0;
            fco_strobe <= 1'b0;
         end
      else
         begin
            fco1       <= iddr_fco;
            fco_strobe <= iddr_fco & ~fco1;
         end

   BUFG BG1 (.I(~iddr_fco), .O(iddr_data_clk));

   //-------------------------------------------------------------------------------------------
   // Generate DCM ready signal
   //-------------------------------------------------------------------------------------------
   always @(posedge iddr_data_clk or negedge iddr_reset_n)
      if(iddr_reset_n == 1'b0)
         iddr_data_rdy <= 1'b0;
      else if({iddr_wr_en_n == 1'b0} && {iddr_dcm_rdy == 1'b1})
         iddr_data_rdy <= 1'b1;
      else
         iddr_data_rdy <= iddr_data_rdy;

   //-------------------------------------------------------------------------------------------
   // Capture DDR data
   //-------------------------------------------------------------------------------------------
//  IDDR # 
//    (
//     .DDR_CLK_EDGE                   ("SAME_EDGE_PIPELINED")
//     )
//     iddr_inst[IDDR_DATA_SIZE-1:0] (
//	   .D                              (iddr_data), 
//        .C                              (iddr_dco), 
//        .Q1                             (q1_r),  
//        .Q2                             (q2_f),
//        .CE                             (1'b1), 
//        .S                              (1'b0), 
//        .R                              (1'b0));
  IDDRE1 # 
    (
     .DDR_CLK_EDGE                   ("SAME_EDGE_PIPELINED"),
     .IS_CB_INVERTED                 (1)
     )
     iddr_inst[IDDR_DATA_SIZE-1:0] (
        .D                              (iddr_data), 
        .C                              (iddr_dco), 
        .CB                             (iddr_dco), 
        .Q1                             (q1_r),  
        .Q2                             (q2_f),
        .R                              (1'b0));
   //-------------------------------------------------------------------------------------------
   // Deserialize rising and falling edge data
   //-------------------------------------------------------------------------------------------
   always @(posedge iddr_dco)
      begin
         data_rise_lane0 <= {data_rise_lane0[6:0], q1_r[0]};
         data_fall_lane0 <= {data_fall_lane0[6:0], q2_f[0]};
         data_rise_lane1 <= {data_rise_lane1[6:0], q1_r[1]};
         data_fall_lane1 <= {data_fall_lane1[6:0], q2_f[1]};
         data_rise_lane2 <= {data_rise_lane2[6:0], q1_r[2]};
         data_fall_lane2 <= {data_fall_lane2[6:0], q2_f[2]};
         data_rise_lane3 <= {data_rise_lane3[6:0], q1_r[3]};
         data_fall_lane3 <= {data_fall_lane3[6:0], q2_f[3]};
         data_rise_lane4 <= {data_rise_lane4[6:0], q1_r[4]};
         data_fall_lane4 <= {data_fall_lane4[6:0], q2_f[4]};
         data_rise_lane5 <= {data_rise_lane5[6:0], q1_r[5]};
         data_fall_lane5 <= {data_fall_lane5[6:0], q2_f[5]};
         data_rise_lane6 <= {data_rise_lane6[6:0], q1_r[6]};
         data_fall_lane6 <= {data_fall_lane6[6:0], q2_f[6]};
         data_rise_lane7 <= {data_rise_lane7[6:0], q1_r[7]};
         data_fall_lane7 <= {data_fall_lane7[6:0], q2_f[7]};
      end
         
   //-------------------------------------------------------------------------------------------
   // Assemble data into words
   //-------------------------------------------------------------------------------------------
   always @(posedge iddr_dco or negedge iddr_reset_n)
      if(iddr_reset_n == 1'b0)
         begin
            par_data_lane0 <= {ADC_MAX_DATA_SIZE{1'b0}};
            par_data_lane1 <= {ADC_MAX_DATA_SIZE{1'b0}};
            par_data_lane2 <= {ADC_MAX_DATA_SIZE{1'b0}};
            par_data_lane3 <= {ADC_MAX_DATA_SIZE{1'b0}};
            par_data_lane4 <= {ADC_MAX_DATA_SIZE{1'b0}};
            par_data_lane5 <= {ADC_MAX_DATA_SIZE{1'b0}};
            par_data_lane6 <= {ADC_MAX_DATA_SIZE{1'b0}};
            par_data_lane7 <= {ADC_MAX_DATA_SIZE{1'b0}};         
         end
      else if(fco_strobe == 1'b1)
         begin
            par_data_lane0 <= {data_rise_lane0[7], data_fall_lane0[7],
                               data_rise_lane0[6], data_fall_lane0[6],
                               data_rise_lane0[5], data_fall_lane0[5],
                               data_rise_lane0[4], data_fall_lane0[4],
                               data_rise_lane0[3], data_fall_lane0[3],
                               data_rise_lane0[2], data_fall_lane0[2],
                               data_rise_lane0[1], data_fall_lane0[1],
                               data_rise_lane0[0], data_fall_lane0[0]};
            par_data_lane1 <= {data_rise_lane1[7], data_fall_lane1[7],
                               data_rise_lane1[6], data_fall_lane1[6],
                               data_rise_lane1[5], data_fall_lane1[5],
                               data_rise_lane1[4], data_fall_lane1[4],
                               data_rise_lane1[3], data_fall_lane1[3],
                               data_rise_lane1[2], data_fall_lane1[2],
                               data_rise_lane1[1], data_fall_lane1[1],
                               data_rise_lane1[0], data_fall_lane1[0]};
            par_data_lane2 <= {data_rise_lane2[7], data_fall_lane2[7],
                               data_rise_lane2[6], data_fall_lane2[6],
                               data_rise_lane2[5], data_fall_lane2[5],
                               data_rise_lane2[4], data_fall_lane2[4],
                               data_rise_lane2[3], data_fall_lane2[3],
                               data_rise_lane2[2], data_fall_lane2[2],
                               data_rise_lane2[1], data_fall_lane2[1],
                               data_rise_lane2[0], data_fall_lane2[0]};
            par_data_lane3 <= {data_rise_lane3[7], data_fall_lane3[7],
                               data_rise_lane3[6], data_fall_lane3[6],
                               data_rise_lane3[5], data_fall_lane3[5],
                               data_rise_lane3[4], data_fall_lane3[4],
                               data_rise_lane3[3], data_fall_lane3[3],
                               data_rise_lane3[2], data_fall_lane3[2],
                               data_rise_lane3[1], data_fall_lane3[1],
                               data_rise_lane4[0], data_fall_lane3[0]};
            par_data_lane4 <= {data_rise_lane4[7], data_fall_lane4[7],
                               data_rise_lane4[6], data_fall_lane4[6],
                               data_rise_lane4[5], data_fall_lane4[5],
                               data_rise_lane4[4], data_fall_lane4[4],
                               data_rise_lane4[3], data_fall_lane4[3],
                               data_rise_lane4[2], data_fall_lane4[2],
                               data_rise_lane4[1], data_fall_lane4[1],
                               data_rise_lane4[0], data_fall_lane4[0]};
            par_data_lane5 <= {data_rise_lane5[7], data_fall_lane5[7],
                               data_rise_lane5[6], data_fall_lane5[6],
                               data_rise_lane5[5], data_fall_lane5[5],
                               data_rise_lane5[4], data_fall_lane5[4],
                               data_rise_lane5[3], data_fall_lane5[3],
                               data_rise_lane5[2], data_fall_lane5[2],
                               data_rise_lane5[1], data_fall_lane5[1],
                               data_rise_lane5[0], data_fall_lane5[0]};
            par_data_lane6 <= {data_rise_lane6[7], data_fall_lane6[7],
                               data_rise_lane6[6], data_fall_lane6[6],
                               data_rise_lane6[5], data_fall_lane6[5],
                               data_rise_lane6[4], data_fall_lane6[4],
                               data_rise_lane6[3], data_fall_lane6[3],
                               data_rise_lane6[2], data_fall_lane6[2],
                               data_rise_lane6[1], data_fall_lane6[1],
                               data_rise_lane6[0], data_fall_lane6[0]};
            par_data_lane7 <= {data_rise_lane7[7], data_fall_lane7[7],
                               data_rise_lane7[6], data_fall_lane7[6],
                               data_rise_lane7[5], data_fall_lane7[5],
                               data_rise_lane7[4], data_fall_lane7[4],
                               data_rise_lane7[3], data_fall_lane7[3],
                               data_rise_lane7[2], data_fall_lane7[2],
                               data_rise_lane7[1], data_fall_lane7[1],
                               data_rise_lane7[0], data_fall_lane7[0]};
         end
      else
         begin
            par_data_lane0 <= par_data_lane0;
            par_data_lane1 <= par_data_lane1;
            par_data_lane2 <= par_data_lane2;
            par_data_lane3 <= par_data_lane3;
            par_data_lane4 <= par_data_lane4;
            par_data_lane5 <= par_data_lane5;
            par_data_lane6 <= par_data_lane6;
            par_data_lane7 <= par_data_lane7;         
         end

   //-------------------------------------------------------------------------------------------
   // Arrange output based on ADC resolution
   //-------------------------------------------------------------------------------------------
   always @(posedge iddr_dco or negedge iddr_reset_n)
      if(iddr_reset_n == 1'b0)
         begin
            dout_lane0 <= {ADC_MAX_DATA_SIZE{1'b0}};
            dout_lane1 <= {ADC_MAX_DATA_SIZE{1'b0}};
            dout_lane2 <= {ADC_MAX_DATA_SIZE{1'b0}};
            dout_lane3 <= {ADC_MAX_DATA_SIZE{1'b0}};
            dout_lane4 <= {ADC_MAX_DATA_SIZE{1'b0}};
            dout_lane5 <= {ADC_MAX_DATA_SIZE{1'b0}};
            dout_lane6 <= {ADC_MAX_DATA_SIZE{1'b0}};
            dout_lane7 <= {ADC_MAX_DATA_SIZE{1'b0}};
         end
      else if(fco_strobe == 1'b1)
         case(iddr_bit_sel)
            2'b00: begin  // 12-bits
               dout_lane0 <= {par_data_lane0[11:0], 4'b0};
               dout_lane1 <= {par_data_lane1[11:0], 4'b0};
               dout_lane2 <= {par_data_lane2[11:0], 4'b0};
               dout_lane3 <= {par_data_lane3[11:0], 4'b0};
               dout_lane4 <= {par_data_lane4[11:0], 4'b0};
               dout_lane5 <= {par_data_lane5[11:0], 4'b0};
               dout_lane6 <= {par_data_lane6[11:0], 4'b0};
               dout_lane7 <= {par_data_lane7[11:0], 4'b0};
               end
            2'b01: begin  // 14-bits
               dout_lane0 <= {par_data_lane0[13:0], 2'b0};
               dout_lane1 <= {par_data_lane1[13:0], 2'b0};
               dout_lane2 <= {par_data_lane2[13:0], 2'b0};
               dout_lane3 <= {par_data_lane3[13:0], 2'b0};
               dout_lane4 <= {par_data_lane4[13:0], 2'b0};
               dout_lane5 <= {par_data_lane5[13:0], 2'b0};
               dout_lane6 <= {par_data_lane6[13:0], 2'b0};
               dout_lane7 <= {par_data_lane7[13:0], 2'b0};
               end
            2'b10: begin  // 16-bits
               dout_lane0 <= par_data_lane0;
               dout_lane1 <= par_data_lane1;
               dout_lane2 <= par_data_lane2;
               dout_lane3 <= par_data_lane3;
               dout_lane4 <= par_data_lane4;
               dout_lane5 <= par_data_lane5;
               dout_lane6 <= par_data_lane6;
               dout_lane7 <= par_data_lane7;
               end
            2'b11: begin  // Not used
               dout_lane0 <= {ADC_MAX_DATA_SIZE{1'b0}};
               dout_lane1 <= {ADC_MAX_DATA_SIZE{1'b0}};
               dout_lane2 <= {ADC_MAX_DATA_SIZE{1'b0}};
               dout_lane3 <= {ADC_MAX_DATA_SIZE{1'b0}};
               dout_lane4 <= {ADC_MAX_DATA_SIZE{1'b0}};
               dout_lane5 <= {ADC_MAX_DATA_SIZE{1'b0}};
               dout_lane6 <= {ADC_MAX_DATA_SIZE{1'b0}};
               dout_lane7 <= {ADC_MAX_DATA_SIZE{1'b0}};
               end
            default: begin
               dout_lane0 <= {ADC_MAX_DATA_SIZE{1'b0}};
               dout_lane1 <= {ADC_MAX_DATA_SIZE{1'b0}};
               dout_lane2 <= {ADC_MAX_DATA_SIZE{1'b0}};
               dout_lane3 <= {ADC_MAX_DATA_SIZE{1'b0}};
               dout_lane4 <= {ADC_MAX_DATA_SIZE{1'b0}};
               dout_lane5 <= {ADC_MAX_DATA_SIZE{1'b0}};
               dout_lane6 <= {ADC_MAX_DATA_SIZE{1'b0}};
               dout_lane7 <= {ADC_MAX_DATA_SIZE{1'b0}};
               end
         endcase

   //-------------------------------------------------------------------------------------------
   // Generate debug ramp
   //-------------------------------------------------------------------------------------------
   always @(posedge iddr_data_clk or negedge iddr_reset_n)
      if(iddr_reset_n == 1'b0)
         ramp <= {ADC_MAX_DATA_SIZE{1'b0}};
      else if({iddr_wr_en_n == 1'b0} && {iddr_dcm_rdy == 1'b1})
         ramp <= ramp + 1;
      else 
         ramp <= ramp;

   //-------------------------------------------------------------------------------------------
   // Insert debug ramp in enabled
   //-------------------------------------------------------------------------------------------
   always @(posedge iddr_data_clk or negedge iddr_reset_n)
      if(iddr_reset_n == 1'b0)
         begin
            iddr_data_lane0 <= {ADC_MAX_DATA_SIZE{1'b0}};
            iddr_data_lane1 <= {ADC_MAX_DATA_SIZE{1'b0}};
            iddr_data_lane2 <= {ADC_MAX_DATA_SIZE{1'b0}};
            iddr_data_lane3 <= {ADC_MAX_DATA_SIZE{1'b0}};
            iddr_data_lane4 <= {ADC_MAX_DATA_SIZE{1'b0}};
            iddr_data_lane5 <= {ADC_MAX_DATA_SIZE{1'b0}};
            iddr_data_lane6 <= {ADC_MAX_DATA_SIZE{1'b0}};
            iddr_data_lane7 <= {ADC_MAX_DATA_SIZE{1'b0}};
         end
      else if(iddr_ramp_en == 1'b1)
         begin
            iddr_data_lane0 <= ramp;
            iddr_data_lane1 <= dout_lane1;
            iddr_data_lane2 <= dout_lane2;
            iddr_data_lane3 <= dout_lane3;
            iddr_data_lane4 <= dout_lane4;
            iddr_data_lane5 <= dout_lane5;
            iddr_data_lane6 <= dout_lane6;
            iddr_data_lane7 <= dout_lane7;
         end
      else
         begin      
            iddr_data_lane0 <= dout_lane0;
            iddr_data_lane1 <= dout_lane1;
            iddr_data_lane2 <= dout_lane2;
            iddr_data_lane3 <= dout_lane3;
            iddr_data_lane4 <= dout_lane4;
            iddr_data_lane5 <= dout_lane5;
            iddr_data_lane6 <= dout_lane6;
            iddr_data_lane7 <= dout_lane7;
         end

endmodule
