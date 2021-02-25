//////////////////////////////////////////////////////////////////////////////////
// Company: 		Analog Devices, Inc.
// Engineer: 		MKH
// 
// Create Date:   09-19-2011 
// Design Name: 
// Module Name:   
// Project Name:	
// Target Devices: 
// Tool versions: 13.2
// Description: 	
//					
// Dependencies: 
//
// Revision 0.01 - File Created
// Revision: 
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module tx_trig_cntrl 
  (
   output      tx_trig,
   input       tx_trig_rst_n,
   input       tx_trig_clk,
   input       tx_trig_rdy
   );
   
   // Register declarations
   reg         tx_trig_reg;
   reg  [7:0]  tx_trig_count;
   
   // wait for DCM ready signal 
   always @(posedge tx_trig_clk, negedge tx_trig_rst_n)
      if(tx_trig_rst_n == 1'b0)
         tx_trig_count <= 8'b0;
      else if((tx_trig_rdy == 1'b1) && (tx_trig_count != 8'hFF))
         tx_trig_count <= tx_trig_count + 1;
   
   always @(posedge tx_trig_clk, negedge tx_trig_rst_n)
      if(tx_trig_rst_n == 1'b0)
         tx_trig_reg <= 1'b1;
      else if(tx_trig_count == 8'hFF)
         tx_trig_reg <= 1'b0;
      
   assign tx_trig = tx_trig_reg;

endmodule
