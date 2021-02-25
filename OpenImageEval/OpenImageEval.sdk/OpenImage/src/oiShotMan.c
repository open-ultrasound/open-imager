/*
	oiShotMan.c
	
	The Shot Manager module for the Open Imager.
	
	2020-08-07  WHF  Created.
*/

#include "open_image.h"

//*******************************  Module Data  ******************************//
static OI_FRAME frame;

static uint32_t iShot;

//***********************  Local Function Declarations  **********************//
static void startShot(void);

//****************************  Global Functions  ****************************//
void oiShotManInit(void)
{
	// NOP
}

void oiShotManVisit(void)
{
	static state_t prevState = STATE_INIT;
	
	const state_t state = oiSmGetState();
	
	if (state != prevState) {
		// Transition.
		if (state == STATE_ARMED) {
			if (prevState == STATE_READY) {
				// We are now armed.  Fire the first shot.
				startShot();
			} else if (prevState == STATE_RECORD) {
				// Finished recording the previous shot.  Are there more shots?
				if (++iShot < frame.nShots) {
					// Yes.  Start it immediately.
					startShot();
				} else {
					// No, this was the last shot.
					oiSmSetEvent(EVENT_REC_DONE);
				}
			} else {
				// Logic error.
				assert(false);
			}
		} else {
			// Ignore other transitions.
		}		
		
		prevState = state;
	} else {
		// No transition.
	}
	
}

oi_error_t oiShotManQueueFrame(const void* pBytes, uint32_t nBytes)
{
	oi_error_t result = OI_ERR_NONE;
	
	if (oiSmGetState() != STATE_READY) {
		result = OI_ERR_ILLEGAL_STATE;
	} else {
		// Copy the header (everything but the shots):
		memcpy(&frame, pBytes, sizeof(frame)-sizeof(frame.shots));
		
		// Compute what the frame size should be:
		const uint32_t frameSize = sizeof(frame)-sizeof(frame.shots)
				+ sizeof(OI_SHOT) * frame.nShots;
	
		if (nBytes != frameSize || frameSize > sizeof(frame)) {
			// Wrong size, or they sent too many shots:
			result = OI_ERR_INCORRECT_SIZE;
		} else if (frame.nShots == 0u) {
			// A frame with no shots is illegal.
			result = OI_ERR_INVALID_PARAMETER;
		} else {
			// Ok.  Copy into our frame object.
			memcpy(&frame, pBytes, sizeof(frame));
			// Reset shot counter:
			iShot = 0u;
			// Restart recording:
			oiAdcDmaRestartRecording();
			// Arm the pulsers:
			oiSmSetEvent(EVENT_ARM);
		}
	}
	
	return result;
}

//***********************  Local Function Definitions  ***********************//

static void startShot(void)
{
EMIO_GPIO_SET_PIN(EMIO_GPIO_PIN_PMOD1_6);		
	oiPulserSetup(&frame.shots[iShot].tx);
	oiTgcSetup(&frame.shots[iShot].rx);
	oiAdcSetup(&frame.shots[iShot].rx);
EMIO_GPIO_CLEAR_PIN(EMIO_GPIO_PIN_PMOD1_6);
	oiSmSetEvent(EVENT_SHOT);
}

