/*
	oiPulser.c

	Implementation of the Pulser module for the Open Image application.

	2020-08-05  WHF  Created.
*/

#include "open_image.h"

#include <hv7321_axi4.h>

//********************************  Constants  *******************************//
#define N_PULSERS                                                         4


#define N_CHAN_PER_CHIP                             (OI_N_CHAN / N_PULSERS)

//*******************************  Module Data  ******************************//
static const uint32_t baseAddr[] = {
	XPAR_HV7321_AXI4_0_S_AXI_BASEADDR,
	XPAR_HV7321_AXI4_1_S_AXI_BASEADDR,
	XPAR_HV7321_AXI4_2_S_AXI_BASEADDR,
	XPAR_HV7321_AXI4_3_S_AXI_BASEADDR,
};	

//***********************  Local Function Declarations  **********************//
static void armPulsers(void);
static void setAllControl(uint32_t controlBits);
static void startWaveform(void);
static uint32_t translate(uint32_t iChan, int8_t user);

//****************************  Global Functions  ****************************//

void oiPulserInit(void)
{
	// Reset the peripherals:
	setAllControl(HV7321_CONTROL_RESET);

	WAIT_USEC(1);
	
	// Take them out of reset.
	setAllControl(0u);
}

void oiPulserVisit(void)
{
	static state_t prevState = STATE_INIT;
	
	const state_t state = oiSmGetState();
	
	if (state != prevState) {
		// Transition.
		if (state == STATE_ARMED && prevState == STATE_READY) {
			// Entering the ARM state for the first time this series.
			// Prepare the pulsers for firing:
			armPulsers();
		} else if (state == STATE_RECORD) {
			// Entering the recording state.
EMIO_GPIO_SET_PIN(EMIO_GPIO_PIN_PMOD1_4);	
			// Begin the pulsed waveform:
			startWaveform();
		} else if (prevState == STATE_RECORD) {
EMIO_GPIO_CLEAR_PIN(EMIO_GPIO_PIN_PMOD1_4);	
EMIO_GPIO_SET_PIN(EMIO_GPIO_PIN_DAC_START);
			
			// Left recording state, for whatever reason.
			EMIO_GPIO_CLEAR_PIN(EMIO_GPIO_PIN_PULSER_START);
			
			// Set the Rx_done bit, and clear the start bits.
			setAllControl(
					  HV7321_CONTROL_REN | HV7321_CONTROL_OEN
					| HV7321_CONTROL_RX_DONE
			);
		} else {
			// Ignore other transitions.
		}		
		
		prevState = state;
	} else {
		// No transition.
	}
	
#if 0
	// TEMPORARY: trigger DAC when in RX.
	// TODO: do in hardware
	if (state == STATE_RECORD) {
		if (HV7321_REG_STATUS(XPAR_HV7321_AXI4_0_S_AXI_BASEADDR) 
				& HV7321_STATUS_RX) {
			// Pulser 0 is in RX: trigger DAC
			EMIO_GPIO_SET_PIN(EMIO_GPIO_PIN_DAC_START);
EMIO_GPIO_SET_PIN(EMIO_GPIO_PIN_PMOD1_5);		
			
		} else {
			
		}
	} else {
		// No action in other states.
	}
#endif
	
	// TODO: monitor fault condition
}

bool oiPulserSetup(const OI_TX* pTx)
{
	bool ok = true;
	
	// Translate user waveform to output register waveform bits.
	for (int iPulser = 0; iPulser < N_PULSERS; ++iPulser) {
		const uint32_t BA = baseAddr[iPulser];
		
		for (uint32_t iWave = 0u; iWave < OI_MAX_N_LEVEL_SEQUENCE; ++iWave) {
			uint32_t wave = 0u;
			
			for (uint32_t iChan = 0u; iChan < N_CHAN_PER_CHIP; ++iChan) {
				const OI_TX_CHANNEL* const
					pCh = &pTx->channels[iPulser*N_CHAN_PER_CHIP + iChan];
					
				if (pCh->enable && iWave < pCh->nLevelSequence) {
					wave |= translate(iChan, pCh->levelSequence[iWave]);
				} else {
					// Throw the channel into Rx.
					wave |= HV7321_WAVEFORM_RX(iChan);
				}
			}
			
			// Load the waveform:
			HV7321_REG_WAVEFORM(BA, iWave) = wave;

			// Verify:			
			if (HV7321_REG_WAVEFORM(BA, iWave) != wave) {
				ok = false;
			} else {
				// Good.  Continue.
			}
		}
	}
	
	return ok;
}

//***********************  Local Function Definitions  ***********************//
static void armPulsers(void)
{
	// Enable the pulser's internal voltage regulators:
	setAllControl(HV7321_CONTROL_REN | HV7321_CONTROL_OUT_CLK_DISABLE);

	// Wait for them to stabilize.
	WAIT_USEC(1000);
	
	// Enable the outputs:
	setAllControl(HV7321_CONTROL_REN | HV7321_CONTROL_OEN);
			
	// Wait 200 usec for the output to enable.
	WAIT_USEC(200);
	
}

static void setAllControl(uint32_t controlBits)
{
	for (int iPulser = 0; iPulser < N_PULSERS;  ++iPulser) {	
		HV7321_REG_CONTROL(baseAddr[iPulser]) = controlBits;
	}
}

static void startWaveform(void)
{
	// Start the waveform:
#if 0  // software start
	setAllControl(
			HV7321_CONTROL_REN | HV7321_CONTROL_OEN | HV7321_CONTROL_START
	);
#else // hardware (synchronous) start
	// Reset Rx done bits:
	setAllControl(
			HV7321_CONTROL_REN | HV7321_CONTROL_OEN
	);
	EMIO_GPIO_SET_PIN(EMIO_GPIO_PIN_PULSER_START);
#endif
}

// This could be more efficient, but the numbers of points are very small.
//  This approach is very clear and maintainable.
static uint32_t translate(uint32_t iChan, int8_t user)
{
	uint32_t out;
	
	switch (user) {
		case 2:
		out = HV7321_WAVEFORM_VPP0(iChan);
		break;
		
		case 1:
		out = HV7321_WAVEFORM_VPP1(iChan);
		break;
		
		case 0:
		out = HV7321_WAVEFORM_RTZ(iChan);
		break;
		
		case -1:
		out = HV7321_WAVEFORM_VNN1(iChan);
		break;
		
		case -2:
		out = HV7321_WAVEFORM_VNN0(iChan);
		break;
		
		default:
		out = HV7321_WAVEFORM_RTZ(iChan);
		break;
	}
	
	return out;
}


