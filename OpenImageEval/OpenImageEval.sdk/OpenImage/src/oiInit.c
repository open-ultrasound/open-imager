/*
	oiInit.c

	Implementation of the Init module for the Open Image application.

	2020-08-05  WHF  Created.
*/

#include "open_image.h"

#include "platform.h"

#include <xil_cache.h>

//*******************************  Module Data  ******************************//
// Global GPIO instance.
XGpioPs hGpio;


//***********************  Local Function Declarations  **********************//
static void initGpio(void);

//****************************  Global Functions  ****************************//

void oiInit(void)
{
	// Setup timers and interrupts for the TCP/IP stack:
	init_platform();
	
	// Initialize global GPIO:
	initGpio();
	
	// Initialize the software and hardware modules:
	oiAdcInit();
	oiAdcDmaInit();
	oiPulserInit();
	oiServerInit();
	oiShotManInit();
	
	// Disable caching:
	Xil_DCacheDisable();	
	
	oiSmSetEvent(EVENT_INIT_COMPLETE);
}

//***********************  Local Function Definitions  ***********************//
static void initGpio(void)
{
	const XGpioPs_Config* const
		pCfg = XGpioPs_LookupConfig(XPAR_PSU_GPIO_0_DEVICE_ID);
	XGpioPs_CfgInitialize(&hGpio,  pCfg, pCfg->BaseAddr);
	// Set all pins on EMIO (Bank 3) as output:
	XGpioPs_SetDirection(&hGpio, EMIO_GPIO_BANK, UINT32_MAX);
	// Enable the output driver:
	XGpioPs_SetOutputEnable(&hGpio, EMIO_GPIO_BANK, UINT32_MAX);
	
	// Setup the LED output:
	XGpioPs_SetDirectionPin(&hGpio, USER_LED_PIN, XGPIOPS_DIRECTION_OUTPUT);
	XGpioPs_SetOutputEnablePin(&hGpio, USER_LED_PIN, true);	
}


