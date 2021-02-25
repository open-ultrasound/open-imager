/*
	oiAdcDma.c
	
	Module for the management of DMA of ADC samples to RAM.
	
	2020-08-06  WHF  Created.
*/

#include "open_image.h"

#include <minmax.h>
#include <xaxidma.h>

//********************************  Constants  *******************************//
// Allocation for buffer descriptors.
#define RX_BD_SPACE             0x10000u
#define RX_BD_SPACE_BASE	(0x20000000u)
#define RX_BD_SPACE_HIGH	(RX_BD_SPACE_BASE + RX_BD_SPACE - 1u)

// The current invocation of the DMA only supports 32-bit addressses. 
#define SAMPLE_BUFFER_ADDRESS                                    0x40000000
#define SAMPLE_BUFFER_SPACE                                      0x20000000

// Size of each transfer.
#define MAX_PKT_LEN		                                               2048

// Sets the IRQThreshold bits in the DMA CR register.
// This is the number of transfers per each interrupt.
#define COALESCING_COUNT		                                      1

// Sets the IRQDelay bits in the DMA CR register, for the timeout feature.
//  0 = disabled
//  1 = 125 SG clocks
//  2 = 250 (etc)
#define DELAY_TIMER_COUNT		                                     0


//*******************************  Module Data  ******************************//
static XAxiDma hAxiDma[2];

// Memory location used to store incoming data.  Incremented for each
//  successive shot.
static uint32_t recStart[OI_RX_N_CHIPS];

//***********************  Local Function Declarations  **********************//
static int RxSetup(uint32_t iAdc, uint32_t nSamples);
static bool setupDma(uint32_t iAdc, uint32_t nSamples);
static bool startDma(uint32_t iAdc);

//****************************  Global Functions  ****************************//
void oiAdcDmaInit(void)
{
	oiAdcDmaRestartRecording();
}

void oiAdcDmaRestartRecording(void)
{
	for (uint32_t iAdc = 0u; iAdc < OI_RX_N_CHIPS; ++iAdc) {
		recStart[iAdc] = SAMPLE_BUFFER_ADDRESS + SAMPLE_BUFFER_SPACE * iAdc;
	}
}

void oiAdcDmaVisit(void)
{
	// TODO
	if (oiSmGetState() == STATE_RECORD) {
		// Is DMA 0 done?
		if (XAxiDma_Busy(&hAxiDma[0], XAXIDMA_DEVICE_TO_DMA)) {
			// Wait
		} else {
			// Signal recording for this shot is done.
			oiSmSetEvent(EVENT_SHOT_DONE);

			// Clear the GPIO output to disable the ADC:
			// TODO: ruins analog tone test?
//			EMIO_GPIO_CLEAR_PIN(EMIO_GPIO_PIN_ADC_ENABLE);	
			
		}
	} else {
		// No action other states.
	}
}

void oiAdcDmaSetup(uint32_t nSamples)
{
	for (uint32_t iAdc = 0u; iAdc < OI_RX_N_CHIPS; ++iAdc) {	
		setupDma(iAdc, nSamples);
	}
	for (uint32_t iAdc = 0u; iAdc < OI_RX_N_CHIPS; ++iAdc) {	
		startDma(iAdc);
	}
}

const uint8_t* oiAdcDmaGetFrameData(const OI_FRAME_DATA_REQ* pReq)
{
	return (uint8_t*)((uint64_t) SAMPLE_BUFFER_ADDRESS 
			+ SAMPLE_BUFFER_SPACE * (pReq->iAdc & 1u)    // block illegal 
			+ (pReq->byteOffset & SAMPLE_BUFFER_SPACE-1u) //  accesses
	);
}

//***********************  Local Function Definitions  ***********************//

static int RxSetup(uint32_t iAdc, uint32_t nSamples)
{
	XAxiDma_BdRing *RxRingPtr;
	int Status;
	XAxiDma_Bd BdTemplate;
	XAxiDma_Bd *BdPtr;
	XAxiDma_Bd *BdCurPtr;
	int BdCount;
	int FreeBdCount;
	UINTPTR RxBufferPtr;
	int Index;
	
	// Alias handle:
	XAxiDma * const AxiDmaInstPtr = &hAxiDma[iAdc];
	const uint32_t bdSpaceAddr = RX_BD_SPACE_BASE + RX_BD_SPACE * iAdc;

	RxRingPtr = XAxiDma_GetRxRing(AxiDmaInstPtr);

	/* Disable all RX interrupts before RxBD space setup */
	XAxiDma_BdRingIntDisable(RxRingPtr, XAXIDMA_IRQ_ALL_MASK);

	/* Setup Rx BD space */
	BdCount = XAxiDma_BdRingCntCalc(XAXIDMA_BD_MINIMUM_ALIGNMENT, RX_BD_SPACE);

	Status = XAxiDma_BdRingCreate(RxRingPtr, bdSpaceAddr,
					bdSpaceAddr,
					XAXIDMA_BD_MINIMUM_ALIGNMENT, BdCount);
	if (Status != XST_SUCCESS) {
		xil_printf("Rx bd create failed with %d\r\n", Status);
		return XST_FAILURE;
	}

	/*
	 * Setup a BD template for the Rx channel. Then copy it to every RX BD.
	 */
	XAxiDma_BdClear(&BdTemplate);
	Status = XAxiDma_BdRingClone(RxRingPtr, &BdTemplate);
	if (Status != XST_SUCCESS) {
		xil_printf("Rx bd clone failed with %d\r\n", Status);
		return XST_FAILURE;
	}

	/* Attach buffers to RxBD ring so we are ready to receive packets */
	FreeBdCount = XAxiDma_BdRingGetFreeCnt(RxRingPtr);
	
	// Compute the number of BD actually needed.
	const uint32_t
		totalBytes = nSamples * (OI_N_CHAN / OI_RX_N_CHIPS * sizeof(int16_t)), 
		neededBd = CEIL_DIV(totalBytes, MAX_PKT_LEN);
	FreeBdCount = MIN(neededBd, FreeBdCount);

	Status = XAxiDma_BdRingAlloc(RxRingPtr, FreeBdCount, &BdPtr);
	if (Status != XST_SUCCESS) {
		xil_printf("Rx bd alloc failed with %d\r\n", Status);
		return XST_FAILURE;
	}

	BdCurPtr = BdPtr;
	RxBufferPtr = recStart[iAdc];
	recStart[iAdc] += totalBytes;

	for (Index = 0; Index < FreeBdCount; Index++) {

		Status = XAxiDma_BdSetBufAddr(BdCurPtr, RxBufferPtr);
		if (Status != XST_SUCCESS) {
			xil_printf(
					"Rx set buffer addr %x on BD %x failed %d\r\n",
					(unsigned int)RxBufferPtr,
					(UINTPTR)BdCurPtr, Status
			);

			return XST_FAILURE;
		}

		Status = XAxiDma_BdSetLength(BdCurPtr, MAX_PKT_LEN,
					RxRingPtr->MaxTransferLen);
		if (Status != XST_SUCCESS) {
			xil_printf("Rx set length %d on BD %x failed %d\r\n",
			    MAX_PKT_LEN, (UINTPTR)BdCurPtr, Status);

			return XST_FAILURE;
		}

		/* Receive BDs do not need to set anything for the control
		 * The hardware will set the SOF/EOF bits per stream status
		 */
		XAxiDma_BdSetCtrl(BdCurPtr, 0);

		XAxiDma_BdSetId(BdCurPtr, RxBufferPtr);

		RxBufferPtr += MAX_PKT_LEN;
		BdCurPtr = (XAxiDma_Bd *)XAxiDma_BdRingNext(RxRingPtr, BdCurPtr);
	}

	/*
	 * Set the coalescing threshold
	 *
	 * If you would like to have multiple interrupts to happen, change
	 * the COALESCING_COUNT to be a smaller value
	 */
	Status = XAxiDma_BdRingSetCoalesce(RxRingPtr, COALESCING_COUNT,
			DELAY_TIMER_COUNT);
	if (Status != XST_SUCCESS) {
		xil_printf("Rx set coalesce failed with %d\r\n", Status);
		return XST_FAILURE;
	}

	Status = XAxiDma_BdRingToHw(RxRingPtr, FreeBdCount, BdPtr);
	if (Status != XST_SUCCESS) {
		xil_printf("Rx ToHw failed with %d\r\n", Status);
		return XST_FAILURE;
	}

#if 0 // started separately
	/* Start RX DMA channel */
	Status = XAxiDma_BdRingStart(RxRingPtr);
	if (Status != XST_SUCCESS) {
		xil_printf("Rx start BD ring failed with %d\r\n", Status);
		return XST_FAILURE;
	}
#endif

	return XST_SUCCESS;
}

static bool setupDma(uint32_t iAdc, uint32_t nSamples)
{
	bool result;
	const int Status = XAxiDma_CfgInitialize(
			&hAxiDma[iAdc], 
			XAxiDma_LookupConfig(XPAR_AXI_DMA_0_DEVICE_ID + iAdc)
	);
	if (Status != XST_SUCCESS) {
		result = false;
	} else {
		// Ok
		const int rxStatus = RxSetup(iAdc, nSamples);
		
		if (rxStatus == XST_SUCCESS) {
			result = true;
		} else {
			result = false;
		}
	}
	
	return result;
}

static bool startDma(uint32_t iAdc)
{
	XAxiDma * const AxiDmaInstPtr = &hAxiDma[iAdc];
	XAxiDma_BdRing * const RxRingPtr = XAxiDma_GetRxRing(AxiDmaInstPtr);
	
	/* Start RX DMA channel */
	return XAxiDma_BdRingStart(RxRingPtr) == XST_SUCCESS ? true : false;
}

