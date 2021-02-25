/*
	oiCmd.c

	Implementation of the command-and-control module for the 
	Open Image application.

	2020-08-05  WHF  Created.
*/

#include "open_image.h"

#include <assert.h>

//*******************************  Module Data  ******************************//
static const char buildDate[] = __DATE__ " " __TIME__;

//***********************  Local Function Declarations  **********************//

//****************************  Global Functions  ****************************//

// NOTE: pPacket has *no* guarantees on alignment.
void oiCmdHandle(void *pPacket, uint32_t nBytes)
{
	bool
		ok = true,
		ack = false;
	oi_error_t nack = OI_ERR_NONE;
	
	uint32_t hdr;
	memcpy(&hdr, pPacket, sizeof(hdr));
	const uint8_t cmd = hdr >> 8 & 0xFF;
	const uint16_t size = hdr >> 16;
	
	if (nBytes < sizeof(hdr) || (hdr & 0xFF) != OI_MAGIC) {
		// Bad packet; ignore.
		ok = false;
	} else {
		if (size != nBytes - sizeof(hdr)) {
			// Incorrect reported size.
			ok = false;
		} else {
			// So far so good.
		}		
	}
	
	if (ok) {
		// Payload after header:
		const uint8_t* const pBytes = &((const uint8_t*) pPacket)[sizeof(hdr)];
		nBytes -= sizeof(hdr);
		const state_t state = oiSmGetState();
		
		switch (cmd) {
			case OI_CMD_GET_STATUS: {
				OI_STATUS status;
				
				// Zero:
				memset(&status, 0, sizeof(status));
				
				status.state = state;
				status.flags = 0u; //TODO
				memcpy(status.buildDate, buildDate, sizeof(buildDate));
				
				oiServerReply(OI_RES_STATUS, &status, sizeof(status));
			}
			break;
			
			case OI_CMD_QUEUE_FRAME:
			// Pass the raw bytes to the shot manager.
			nack = oiShotManQueueFrame(pBytes, nBytes);
			ack = true;  // ACK if not NACK'd
			break;				
			
			case OI_CMD_GET_FRAME:
			if (state != STATE_READY) {
				nack = OI_ERR_ILLEGAL_STATE;
			} else if (nBytes != sizeof(OI_FRAME_DATA_REQ)) {
				nack = OI_ERR_INCORRECT_SIZE;
			} else {
				OI_FRAME_DATA_REQ req;
				
				// Copy the request to guarantee the alignment:
				memcpy(&req, pBytes, sizeof(req));
				oiServerReply(
						OI_RES_FRAME, 
						oiAdcDmaGetFrameData(&req),
						req.nBytes
				);
			}
			break;					
			
			default:
			nack = OI_ERR_UNRECOGNIZED_COMMAND;
			break;
		}
	} else {
		// Error with the packet.
		nack = OI_ERR_BAD_PACKET;
	}
	
	if (nack) {
		oiServerReply(OI_RES_NACK, &nack, 1);
	} else {
		// Don't.  Maybe ack.
		if (ack) {
			oiServerReply(OI_RES_ACK, NULL, 0);
		} else {
			// Don't ack either.
		}
	}
}

//***********************  Local Function Definitions  ***********************//

