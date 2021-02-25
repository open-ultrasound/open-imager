/*
	oiTgc.c
	
	Time Gain Compensation module for Open Image.
	
	2021-01-15  WHF  Created.
*/

#include "open_image.h"

#include <ad5424_axi4.h>

#if OI_RX_MAX_N_TGC != AD5424_N_WAVEFORM
#	error Number of TGC values inconsistent with hardware.
#endif

//****************************  Global Functions  ****************************//
void oiTgcInit(void)
{
	// NOP
}

void oiTgcSetup(const OI_RX* pRx)
{
	// Lower the start flag:
	EMIO_GPIO_CLEAR_PIN(EMIO_GPIO_PIN_DAC_START);
	
EMIO_GPIO_CLEAR_PIN(EMIO_GPIO_PIN_PMOD1_5);	
	
	// Setup the waveform.
	for (uint32_t iW = 0; iW < AD5424_N_WAVEFORM; ++iW) {
		AD5424_REG_WAVEFORM(XPAR_AD5424_AXI4_0_S_AXI_BASEADDR, iW) 
				= AD5424_WAVEFORM(0, pRx->tgc[0][iW])   // DAC 0
				| AD5424_WAVEFORM(1, pRx->tgc[1][iW]);  // DAC 1
	}
}


