//////////////////////////////////////////////////////////////////////////////////
// Company: 		Analog Devices, Inc.
// Engineer: 		MKH
// 
// Create Date:   06-01-2011 
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

module io_buffer #
  (
	parameter IDDR_DATA_SIZE = 16
  )
  (
   input  [IDDR_DATA_SIZE-1:0]    lvds_data_p,
   input  [IDDR_DATA_SIZE-1:0]    lvds_data_n,
   output [IDDR_DATA_SIZE-1:0]    lvds_data_buf
  );
   
// input buffers for data
IBUFDS i_bufds[IDDR_DATA_SIZE-1:0] (
   .I(lvds_data_p), 
   .IB(lvds_data_n), 
   .O(lvds_data_buf));

endmodule
