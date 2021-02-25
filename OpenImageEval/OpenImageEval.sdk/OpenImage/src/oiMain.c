/*
	oiMain.c

	Implementation of the Main module for the Open Image application.

	2020-08-05  WHF  Created.
*/

#include "open_image.h"

//*********************************  Macros  *********************************//
#define IDLE()                                                  asm(" wfi")


//*******************************  Module Data  ******************************//

//***********************  Local Function Declarations  **********************//

//****************************  Global Functions  ****************************//
int main(void)
{
	oiInit();

	for (;;) {
		oiAdcVisit();
		oiAdcDmaVisit();
		oiPulserVisit();	
		oiServerVisit();
		oiShotManVisit();
		oiSmVisit();
	
		// Blocks TCP/IP from proper functioning, perhaps because it is polled.
//		IDLE();
	}
	
	return 0;
}

//***********************  Local Function Definitions  ***********************//

