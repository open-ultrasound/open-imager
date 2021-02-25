/*
	HardwareTest.c
	
	Simple test application of OpenImage hardware.
	
	NOTE: stdout maps to UART interface 0, 115200 baud.
	
	2020-05-11  WHF  Created.
*/

#include "platform.h"

#include <assert.h>

#include <ad5424_axi4.h>
#include <ad9670_axi4.h>
#include <hv7321_axi4.h>
#include <intrcon.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

#include <xaxidma.h>
#include <xgpiops.h>
#include <xparameters.h>
#include <xscugic.h>
#include <xspips.h>

#pragma GCC diagnostic ignored "-Wunused-function"
#pragma GCC diagnostic ignored "-Wparentheses"

//********************************  Constants  *******************************//

/////  Clocks  /////

// Clock rate of the CPU.
#define CPU_FREQ_HZ                    XPAR_PSU_CORTEXA53_0_CPU_CLK_FREQ_HZ

/////  GPIO  /////
#define XGPIOPS_DIRECTION_OUTPUT                                          1

#define EMIO_GPIO_BANK                                                    3

#define EMIO_GPIO_BANK_3_DATA_REG        (*(volatile uint32_t*)0xFF0A004Cu)

// Note these pins are relative to the bank.
typedef enum tag_emio_gpio_pin {
	EMIO_GPIO_PIN_PULSER_START,  // currently started in software
	EMIO_GPIO_PIN_ADC_ENABLE,
	EMIO_GPIO_PIN_SDIO_T,
	EMIO_GPIO_PIN_PMOD1_3,
	EMIO_GPIO_PIN_PMOD1_4,
	EMIO_GPIO_PIN_PMOD1_5,
	EMIO_GPIO_PIN_PMOD1_6,
	EMIO_GPIO_PIN_PMOD1_7,
	EMIO_GPIO_PIN_PMOD0_0,
	EMIO_GPIO_PIN_PMOD0_1,
	EMIO_GPIO_PIN_PMOD0_2,
	EMIO_GPIO_PIN_PMOD0_3,
	EMIO_GPIO_PIN_PMOD0_4,
	EMIO_GPIO_PIN_PMOD0_5,
	EMIO_GPIO_PIN_PMOD0_6,
	EMIO_GPIO_PIN_PMOD0_7,
	EMIO_GPIO_PIN_LED_0,
	EMIO_GPIO_PIN_LED_1,
	EMIO_GPIO_PIN_LED_2,
	EMIO_GPIO_PIN_LED_3,
	EMIO_GPIO_PIN_LED_4,
	EMIO_GPIO_PIN_LED_5,
	EMIO_GPIO_PIN_LED_6,
	EMIO_GPIO_PIN_LED_7,
	EMIO_GPIO_PIN_DAC_START,   // currently started in software
} emio_gpio_pin_t;

// Which ADC instance to test?
#define ADC_INSTANCE                                                      1

// ADC Settings.
#if ADC_INSTANCE == 0
#	if 0  // 40 MHz ADC
#		error Untested condition.
#	else  // ADC0, 80 MHz
#		define FCO_ROTATE                                                -2
#		define DCO_DELAY                                                200
#	endif

#elif ADC_INSTANCE == 1
#if 0  // 40 MHz ADC
#	define FCO_ROTATE                                                    -3
#	define DCO_DELAY                                                   2300
#else  // 80 MHz
#	define FCO_ROTATE                                                    -2
#	define DCO_DELAY                                                    400
#endif

#else
#	error Unknown ADC instance!
#endif


//*********************************  Macros  *********************************//

#define EMIO_GPIO_SET_PIN(pin)   (EMIO_GPIO_BANK_3_DATA_REG |= 1u << (pin))
#define EMIO_GPIO_CLEAR_PIN(pin)                                          \
		(EMIO_GPIO_BANK_3_DATA_REG &= ~(1u << (pin)))
#define EMIO_GPIO_TOGGLE_PIN(pin)                                         \
	(EMIO_GPIO_BANK_3_DATA_REG ^= 1u << (pin))



#define IDLE()                                                  asm(" wfi")

#define ENABLE_INTR()                                              cpsiei()
#define DISABLE_INTR()                                             cpsidi()
#define GET_INTR_MASK()                                            mfcpsr()
#define RESTORE_INTR(mask)                                     mtcpsr(mask)
              
#ifdef NDEBUG
	// Release build.
	// Disable software breakpoints:
#	define DEBUG_BREAK()

// For use with identifiers to make them local under release.
#	define DEBUG_VIS                                                 static
	
#else
	// Debug build.
	// Software breakpoint:
#	define DEBUG_BREAK()                                  asm(" bkpt 0x99")

// For use in identifiers to make them global under debug.
#	define DEBUG_VIS

#endif

// For marking variables, parameters, and functions as intentionally 
//   unreferenced.
#define UNUSED(x)                                                (void) (x)

// Integer division that rounds up.
#define CEIL_DIV(x, y)                                   (((x)+(y)-1u)/(y))

#define _countof(x)                            (sizeof(x) / sizeof((x)[0]))

// The number of cycles per loop in 'delay_cycles'.
#define CYCLES_PER_DELAY_LOOP                                            1U
#define USEC_PER_SEC                                               1000000U
#define WAIT_USEC(usec)   delay_cycles(                                   \
		(CPU_FREQ_HZ / CYCLES_PER_DELAY_LOOP / USEC_PER_SEC) * (usec))


//**********************************  Types  *********************************//
// Pointer to test function:
typedef bool (*test_fun_t)(void);

typedef struct {
	test_fun_t testFun;
	const char* name;
} TEST;

//*******************************  Module Data  ******************************//
static XGpioPs hGpio;
static XAxiDma hAxiDma;
static XSpiPs hSpi;

static const uint32_t adcBaseAddr[] = {
	XPAR_AD9670_AXI4_0_S_AXI_BASEADDR,
	XPAR_AD9670_AXI4_1_S_AXI_BASEADDR
};

volatile int bkpt;

//***********************  Local Function Declarations  **********************//
static bool testAdc(void);
static bool testAdcSpi(void);
static bool testAdcShifting(void);
static bool testDac(void);
static bool testEmioGpio(void);
static bool testLed(void);
static bool testPulser(void);
static bool testTimer(void);

//****************************  Global Functions  ****************************//
void delay_cycles(uint32_t nCycles);

int main(void)
{
	init_platform();
	
	// Setup global GPIO device instance:
	{
		const XGpioPs_Config* const
			pCfg = XGpioPs_LookupConfig(XPAR_PSU_GPIO_0_DEVICE_ID);
		XGpioPs_CfgInitialize(&hGpio,  pCfg, pCfg->BaseAddr);
		
		// Set all pins on EMIO (Bank 3) as output:
		XGpioPs_SetDirection(&hGpio, EMIO_GPIO_BANK, UINT32_MAX);
		// Enable the output driver:
		XGpioPs_SetOutputEnable(&hGpio, EMIO_GPIO_BANK, UINT32_MAX);
	}
	
	// Setup the interrupt controller:
	intrConInit();
	
	static const char *resultStr[] = { "FAILED\n", "PASSED\n" };
	
	TEST tests[] = {
//		{ testAdc, "ADC"                     },
//		{ testAdcSpi, "AdcSpi"               },
//		{ testAdcShifting, "AdcShifting"     },
//		{ testDac, "DAC"                     },
//		{ testEmioGpio, "EmioGpio"           },
//		{ testLed, "LED"                     },
		{ testPulser, "Pulser",              },
//		{ testSPI, "SPI",                  },
//		{ testTimer, "Timer"                 },
//		{ testTcpIp, "TcpIp"                 },
	};
	int i;	
	bool result;
	
	fputs("*** OPEN IMAGE TESTS ***\n", stdout);
	
	for (i = 0; i < _countof(tests); ++i) {
		fputs(tests[i].name, stdout);
		fputs(": ", stdout);
		result = tests[i].testFun();
		(void) result;
		fputs(resultStr[result], stdout);
	}

	for (;;) ;

	return 0;	
}

//***********************  Local Function Definitions  ***********************//

typedef struct tag_verified_reg {
	uint16_t reg;
	uint8_t 
		value,
		mask;    // anded for verification
} verified_reg_t;
static const verified_reg_t AD9670_REGS[] = {
	{ AD9670_REG_CHIP_PORT_CONFIG, AD9670_CHIP_PORT_CONFIG_RESET, 0 },  // reset
	{ AD9670_REG_CHIP_GRADE, AD9670_CHIP_GRADE_80_MHZ, AD9670_CHIP_GRADE_MASK },
	{ AD9670_REG_DEVICE_UPDATE, AD9670_REG_DEVICE_UPDATE, 0 },
	{ AD9670_REG_DIG_DEMOD_CFG,     // bypass everything
		AD9670_DIG_DEMOD_CFG_HPF_BYPASS     
				| AD9670_DIG_DEMOD_CFG_RF_DECI_BYPASS 
				| AD9670_DIG_DEMOD_CFG_BB_DECI_BYPASS 
				| AD9670_DIG_DEMOD_CFG_DEMOD_BYPASS,
		AD9670_DIG_DEMOD_CFG_MASK },
	// Vector profile; has streaming read requirement
	{ 0xF00, 0xFF, 0 }, // En. cont. run mode; no pwr down (POWER_STOP LSB)
	{ 0xF01, 0x7F, 0 }, // (POWER_STOP MSB)
	{ 0xF02, 0x00, 0 }, // Pwr all chan 0 cycles after TX_TRIG (POWER_START LSB)
	{ 0xF03, 0x80, 0 }, // Bypass digital high-pass filter (POWER_START MSB)
//	{ 0xF04, 0x0C, 0 }, //  Deci by 2 (M = 00001); digital gain = 16 (g = 100)
	{ 0xF04, 0x00, 0 }, //  No deci no gain
	{ 0xF05, 0x00, 0 }, // Points to Coefficient Block 00
	{ 0xF06, 0x00, 0 }, //  Demodulation frequency LSB
//	{ 0xF07, 0x20, 0 }, // Demodulation frequency MSB = fSAMPLE/8
	{ 0xF07, 0x00, 0 }, // Demodulation frequency MSB = DC
	// Commit vector profile:
	{ AD9670_REG_PROF_IDX, AD9670_PROF_IDX(0), AD9670_PROF_IDX_MASK }, 
	{ AD9670_REG_PROF_IDX, AD9670_PROF_IDX(0), AD9670_PROF_IDX_MASK },
	// Set all channels to two's complement:
	{ AD9670_REG_OUTPUT_MODE, 1, 0 },
#if ADC_INSTANCE == 0
	// Channel 7 is inverted here:
	{ AD9670_REG_DEVICE_INDEX_1, 0, 0x3F },
	{ AD9670_REG_DEVICE_INDEX_2, 0x08, 0x0F },
	{ AD9670_REG_OUTPUT_MODE, 5, 0 },
#else
	// Set just channel 0 to inverted mode (due to some error somewhere):
	{ AD9670_REG_DEVICE_INDEX_1, 1, 0x3F },
	{ AD9670_REG_DEVICE_INDEX_2, 0, 0x0F },
	{ AD9670_REG_OUTPUT_MODE, 5, 0 },
#endif
	{ AD9670_REG_DEVICE_INDEX_1, 0x3F, 0x3F }, // restore global index
	{ AD9670_REG_DEVICE_INDEX_2, 0x0F, 0x0F },
	{ AD9670_REG_GLOBAL_MODES, AD9670_GLOBAL_MODES_TGC, 
			AD9670_GLOBAL_MODES_MASK },
	{ AD9670_REG_FLEX_SERIAL_CTRL,
		AD9670_FLEX_SERIAL_CTRL_8_LANES | AD9670_FLEX_SERIAL_CTRL_16_BIT_WORD,
		0xFF },
	{ AD9670_REG_SAMP_CLK_COUNTER, AD9670_SAMP_CLK_COUNTER_ENABLE, 
		AD9670_SAMP_CLK_COUNTER_ENABLE },
	{ AD9670_REG_SERIAL_FORMAT,
		AD9670_SERIAL_FORMAT_FCO_START_CODE_EN
		| AD9670_SERIAL_FORMAT_FCO_CONTINUOUS
		| AD9670_SERIAL_FORMAT_FCO_ROTATE(FCO_ROTATE),
		AD9670_SERIAL_FORMAT_MASK },
	{ AD9670_REG_FLEX_OUT_DEL,
		AD9670_FLEX_OUT_DEL_ENABLE | AD9670_FLEX_OUT_DEL_PSEC(DCO_DELAY),
		AD9670_FLEX_OUT_DEL_MASK },
	{ AD9670_REG_PLL_STARTUP, AD9670_PLL_STARTUP_ENABLE, 
		AD9670_PLL_STARTUP_MASK },
	// Software trigger:
//	{ AD9670_REG_PROF_IDX,
//		AD9670_PROF_IDX_TX_TRIG_SOFTWARE | AD9670_PROF_IDX(0),
//		AD9670_PROF_IDX_MASK },
//	{ AD9670_REG_FLEX_CHAN_IN,  leave default 
//	{ AD9670_REG_FLEX_FILTER,   leave off

#if 1
	// IO mode
#elif 1
	{ AD9670_REG_TST_MODE_CFG, AD9670_TST_MODE_CHAN_ID,	AD9670_TST_MODE_MASK },
#elif 0
	{ AD9670_REG_TST_MODE_CH_EN, 0xFF, 0xFF }, // all channels

	{ AD9670_REG_DIG_SIN_TST_FREQ, 0x1F, 0x1F }, 
	{ AD9670_REG_DIG_SIN_TST_AMP, 0x1, 0x0f },  
	{ AD9670_REG_DIG_SIN_TST_OFF, 0x7F, 0xFF },  
	{ AD9670_REG_TST_MODE_CFG, AD9670_TST_MODE_SINE,	AD9670_TST_MODE_MASK },

#else // Analog test tones

	{ AD9670_REG_ANA_TST_TONE,    0xF, 0xF }, 
	{ AD9670_REG_TST_MODE_CFG, AD9670_TST_MODE_ANA_TONE, AD9670_TST_MODE_MASK },

	// Although unclear, this enables the test tones on a per-channel basis.
	{ AD9670_REG_TST_MODE_CH_EN, 0xFF, 0xFF }, // all channels
	
#endif

// Note 2 LSB truncated in 14-bit mode.
#if 1
	{ AD9670_REG_USR_PAT1_LSB, 0x34, 0xFF },
	{ AD9670_REG_USR_PAT1_MSB, 0x12, 0xFF },
	{ AD9670_REG_USR_PAT2_LSB, 0xAD, 0xFF },
	{ AD9670_REG_USR_PAT2_MSB, 0xDE, 0xFF },
	{ AD9670_REG_USR_PAT3_LSB, 0x0D, 0xFF },
	{ AD9670_REG_USR_PAT3_MSB, 0xF0, 0xFF },
	{ AD9670_REG_USR_PAT4_LSB, 0xCE, 0xFF },
	{ AD9670_REG_USR_PAT4_MSB, 0xFA, 0xFF },
#elif 0
	{ AD9670_REG_USR_PAT1_LSB, 0x10, 0xFF },
	{ AD9670_REG_USR_PAT1_MSB, 0x23, 0xFF },
	{ AD9670_REG_USR_PAT2_LSB, 0x40, 0xFF },
	{ AD9670_REG_USR_PAT2_MSB, 0x56, 0xFF },
	{ AD9670_REG_USR_PAT3_LSB, 0x70, 0xFF },
	{ AD9670_REG_USR_PAT3_MSB, 0x89, 0xFF },
	{ AD9670_REG_USR_PAT4_LSB, 0xA0, 0xFF },
	{ AD9670_REG_USR_PAT4_MSB, 0xBC, 0xFF },
#elif 1
	{ AD9670_REG_USR_PAT1_LSB, 0xAA, 0xFF },
	{ AD9670_REG_USR_PAT1_MSB, 0xAA, 0xFF },
	{ AD9670_REG_USR_PAT2_LSB, 0xAA, 0xFF },
	{ AD9670_REG_USR_PAT2_MSB, 0xAA, 0xFF },
	{ AD9670_REG_USR_PAT3_LSB, 0xAA, 0xFF },
	{ AD9670_REG_USR_PAT3_MSB, 0xAA, 0xFF },
	{ AD9670_REG_USR_PAT4_LSB, 0xAA, 0xFF },
	{ AD9670_REG_USR_PAT4_MSB, 0xAA, 0xFF },
#else
	{ AD9670_REG_USR_PAT1_LSB, 0x0F, 0xFF },
	{ AD9670_REG_USR_PAT1_MSB, 0x0A, 0xFF },
	{ AD9670_REG_USR_PAT2_LSB, 0x0F, 0xFF },
	{ AD9670_REG_USR_PAT2_MSB, 0x0A, 0xFF },
	{ AD9670_REG_USR_PAT3_LSB, 0x0F, 0xFF },
	{ AD9670_REG_USR_PAT3_MSB, 0x0A, 0xFF },
	{ AD9670_REG_USR_PAT4_LSB, 0x0F, 0xFF },
	{ AD9670_REG_USR_PAT4_MSB, 0x0A, 0xFF },             
#endif

#if 1
	{ AD9670_REG_TEST_IO,
//		AD9670_TEST_IO_MODE_CHECKERBOARD,
//		AD9670_TEST_IO_MODE_MIDSCALE,
//		AD9670_TEST_IO_MODE_TOGGLE,
		AD9670_TEST_IO_MODE_USER,

		AD9670_TEST_IO_MODE_MASK },
#endif
};

static uint8_t readReg(uint32_t reg)
{
	//  First write the read/write bit and the address:
	uint8_t data[] = {
		AD9670_CMD_READ_0(reg),
		AD9670_CMD_READ_1(reg),
	};
	// Switch SDIO to write by clearing the tri-state pin:
	EMIO_GPIO_CLEAR_PIN(EMIO_GPIO_PIN_SDIO_T);
	// Write the read command:
	XSpiPs_PolledTransfer(&hSpi, data, NULL, sizeof(data));
	// Switch SDIO to read by setting the tri-state pin:
	EMIO_GPIO_SET_PIN(EMIO_GPIO_PIN_SDIO_T);
	// Read the response (1 byte):
	XSpiPs_PolledTransfer(&hSpi, data, data, 1);
	
	return data[0];
}
static void writeReg(uint32_t reg, uint8_t val)
{
	//  First write the read/write bit and the address:
	uint8_t data[] = {
		AD9670_CMD_WRITE_0(reg),
		AD9670_CMD_WRITE_1(reg),
		val
	};
	// Switch SDIO to write by clearing the tri-state pin:
	EMIO_GPIO_CLEAR_PIN(EMIO_GPIO_PIN_SDIO_T);
	// Write the command:
	XSpiPs_PolledTransfer(&hSpi, data, NULL, sizeof(data));
}	

static bool writeRegisterTable(const verified_reg_t* pTable, uint32_t n)
{
	bool result = true;
	
	for (uint32_t iEntry = 0u; iEntry < n; ++iEntry) {
		// Write the register and value:
		writeReg(pTable[iEntry].reg, pTable[iEntry].value);
		if (pTable[iEntry].mask == 0u) {
			// Do not bother to validate if the mask is zero.
		} else {
			const uint8_t val = readReg(pTable[iEntry].reg);
			
			if ((val & pTable[iEntry].mask) 
					== (pTable[iEntry].value & pTable[iEntry].mask)) {
				// Ok
			} else {
				// Fail
				result = false;
				assert(false);
				break;
			}
		}
	}

	return result;	
}

static bool testAdcSpi(void)
{
	bool result = true;
	memset(&hSpi, 0, sizeof(hSpi));  // zero driver instance
	int32_t status;
	
	// Initialize Zynq SPI peripheral:
	{
		XSpiPs_Config* pCfg = XSpiPs_LookupConfig(XPAR_PSU_SPI_0_DEVICE_ID);
		// This initializes the driver instance, and resets the device.
		XSpiPs_CfgInitialize(&hSpi, pCfg, pCfg->BaseAddress);
		// This field is not set.
		hSpi.Config.DeviceId = pCfg->DeviceId;
	
		// Set the prescaler.  It is at least 4, and doubles each increment.
		uint32_t 
			clk = pCfg->InputClockHz / 4u,
			prescaler = XSPIPS_CLK_PRESCALE_4;
			
		while (clk > AD9670_SPI_MAX_FREQ_HZ) {
			clk /= 2u;
			++prescaler;
		}
	
		status = XSpiPs_SetClkPrescaler(&hSpi, prescaler);
		assert(status == XST_SUCCESS);
	}
	
	// Set the chip select to NONE.
	status = XSpiPs_SetSlaveSelect(&hSpi, XSPIPS_CR_SSCTRL_MAXIMUM);
	assert(status == XST_SUCCESS);
	
	// Configure the peripheral for manual chip select.  The default
	//  clock options (active high, phase zero) match the AD9670.
	status = XSpiPs_SetOptions(
			&hSpi,
			XSPIPS_MASTER_OPTION | XSPIPS_FORCE_SSELECT_OPTION
	);
	assert(status == XST_SUCCESS);
	
	// Note that AFE1 is mapped to Channel 0.
	// Indicate which chip select to use:
	hSpi.SlaveSelect = (!ADC_INSTANCE) << XSPIPS_CR_SSCTRL_SHIFT;   // TODO fix
	// Perform a read of the ID register.
	const uint8_t id = readReg(AD9670_REG_CHIP_ID);
	
	if (id == AD9670_CHIP_ID_AD9670) {
		result = writeRegisterTable(AD9670_REGS, _countof(AD9670_REGS));
				
	} else {
		result = false;
		assert(false);
	}
	
	return result;
}

#if XPAR_AXI_DMA_0_INCLUDE_SG

// Allocation for buffer descriptors.
#define RX_BD_SPACE_BASE	(0x20000000u)
#define RX_BD_SPACE_HIGH	(RX_BD_SPACE_BASE + 0x0000FFFF)

// The current invocation of the DMA only supports 32-bit addressses. 
#define SAMPLE_BUFFER_ADDRESS                                    0x40000000

// Size of each transfer.  Currently limited to burst size.
#define MAX_PKT_LEN		                                               2048
//XPAR_AXI_DMA_0_S2MM_BURST_SIZE

// Sets the IRQThreshold bits in the DMA CR register.
// This is the number of transfers per each interrupt.
#define COALESCING_COUNT		                                      1

// Sets the IRQDelay bits in the DMA CR register, for the timeout feature.
//  0 = disabled
//  1 = 125 SG clocks
//  2 = 250 (etc)
#define DELAY_TIMER_COUNT		                                     0

static int RxSetup(XAxiDma * AxiDmaInstPtr)
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

	RxRingPtr = XAxiDma_GetRxRing(AxiDmaInstPtr);

	/* Disable all RX interrupts before RxBD space setup */
	XAxiDma_BdRingIntDisable(RxRingPtr, XAXIDMA_IRQ_ALL_MASK);

	/* Setup Rx BD space */
	BdCount = XAxiDma_BdRingCntCalc(XAXIDMA_BD_MINIMUM_ALIGNMENT,
				RX_BD_SPACE_HIGH - RX_BD_SPACE_BASE + 1);

	Status = XAxiDma_BdRingCreate(RxRingPtr, RX_BD_SPACE_BASE,
					RX_BD_SPACE_BASE,
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

	Status = XAxiDma_BdRingAlloc(RxRingPtr, FreeBdCount, &BdPtr);
	if (Status != XST_SUCCESS) {
		xil_printf("Rx bd alloc failed with %d\r\n", Status);
		return XST_FAILURE;
	}

	BdCurPtr = BdPtr;
	RxBufferPtr = SAMPLE_BUFFER_ADDRESS;

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

	/* Enable all RX interrupts */
	XAxiDma_BdRingIntEnable(RxRingPtr, XAXIDMA_IRQ_ALL_MASK);
	/* Enable Cyclic DMA mode */
#if 0	
	XAxiDma_BdRingEnableCyclicDMA(RxRingPtr);
	XAxiDma_SelectCyclicMode(AxiDmaInstPtr, XAXIDMA_DEVICE_TO_DMA, 1);
#endif

	/* Start RX DMA channel */
	Status = XAxiDma_BdRingStart(RxRingPtr);
	if (Status != XST_SUCCESS) {
		xil_printf("Rx start BD ring failed with %d\r\n", Status);
		return XST_FAILURE;
	}

	return XST_SUCCESS;
}
#endif

static void rxDmaIsr(void *rxRingPtr)
{
	// Acknowledge pending interrupts:
	XAxiDma_BdRingAckIrq(
			(XAxiDma_BdRing*)rxRingPtr,
			XAxiDma_BdRingGetIrq((XAxiDma_BdRing*)rxRingPtr)
	);
	
	// Toggle GPIO for measurement:
	EMIO_GPIO_TOGGLE_PIN(EMIO_GPIO_PIN_PMOD1_7);
}

static bool setupDma(void)
{
	bool result;
	const int Status = XAxiDma_CfgInitialize(
			&hAxiDma, 
			XAxiDma_LookupConfig(XPAR_AXI_DMA_0_DEVICE_ID + ADC_INSTANCE)
	);
	if (Status != XST_SUCCESS) {
		result = false;
	} else {
		// Ok
#if XPAR_AXI_DMA_0_INCLUDE_SG
		const int rxStatus = RxSetup(&hAxiDma);
		
		if (rxStatus == XST_SUCCESS) {
			result = true;
			
			// Enable interrupts in the controller:
			intrConSetHandler(
					XPAR_FABRIC_AXI_DMA_0_S2MM_INTROUT_INTR + ADC_INSTANCE,// id
					rxDmaIsr,                       // callback
					XAxiDma_GetRxRing(&hAxiDma),    // user context
					0x00A00003u  // impl. specific flags (priority, trigger)
			);
			
			intrConEnable(
					XPAR_FABRIC_AXI_DMA_0_S2MM_INTROUT_INTR + ADC_INSTANCE // id
			);
			
		} else {
			result = false;
		}
#else
		result = true;
#endif
	}
	
	return result;
}

#define TRANSFER_SIZE                                                 0x400
static_assert(sizeof(UINTPTR) == 8, "32-bit!  addresses");
static bool testAdc(void)
{
// Disable caching:
Xil_DCacheDisable();

	// Enable interrupts:
	//ENABLE_INTR();
	Xil_ExceptionEnable();

	// Set the GPIO output to enable the ADC:
	EMIO_GPIO_SET_PIN(EMIO_GPIO_PIN_PMOD0_0);	

	// Initialize the ADC registers:
	bool result = testAdcSpi();
	
	// Wait for her to wake up from shutdown, tune filters, and lock the PLL:
	WAIT_USEC(500u);	
	
	if (result) {
		result = setupDma();
	} else {
		// If the SPI failed, the ADC won't run.
	}
	
	if (result) {
		
		// Reset the ADC:		
		AD9670_IP_REG_CONTROL(adcBaseAddr[ADC_INSTANCE])
				= AD9670_IP_CONTROL_RESET;
		
		WAIT_USEC(1);
		
		AD9670_IP_REG_CONTROL(adcBaseAddr[ADC_INSTANCE]) = 0u;
		
				
		// Zero destination:
		memset((void*) SAMPLE_BUFFER_ADDRESS, 0, TRANSFER_SIZE);
		
		// Set the GPIO output to enable the ADC:
		EMIO_GPIO_SET_PIN(EMIO_GPIO_PIN_PMOD0_0);
		
#if XPAR_AXI_DMA_0_INCLUDE_SG      // Scatter Gather

		// Flush cache:
/*		Xil_DCacheFlushRange(
				(UINTPTR) SAMPLE_BUFFER_ADDRESS,
				TRANSFER_SIZE
		);
*/

// Software trigger:		
//writeReg(AD9670_REG_PROF_IDX, AD9670_PROF_IDX_TX_TRIG_SOFTWARE | AD9670_PROF_IDX(0));		

		// Raise the TX_TRIGGER input:
//		EMIO_GPIO_SET_PIN(EMIO_GPIO_PIN_PMOD0_2);
		AD9670_IP_REG_CONTROL(adcBaseAddr[ADC_INSTANCE])
				= AD9670_IP_CONTROL_TRIGGER;
		
		WAIT_USEC(1);
		
		// Lower it:
//		EMIO_GPIO_CLEAR_PIN(EMIO_GPIO_PIN_PMOD0_2);
		AD9670_IP_REG_CONTROL(adcBaseAddr[ADC_INSTANCE]) = 0u;
		
		// Wait for the transfer to complete:
		while (XAxiDma_Busy(&hAxiDma, XAXIDMA_DEVICE_TO_DMA)) {
			// Wait
		}


#else // Simple DMA
	
#if 0 // one burst mode
// This doesn't work in simple mode, as each burst is only 128 bits long.
for (;;) {
	
		// Raise the TX_TRIGGER input:
//		EMIO_GPIO_SET_PIN(EMIO_GPIO_PIN_PMOD0_2);
		AD9670_IP_REG_CONTROL(adcBaseAddr[ADC_INSTANCE])
				= AD9670_IP_CONTROL_TRIGGER;

		WAIT_USEC(1);
		
		// Lower it:
//		EMIO_GPIO_CLEAR_PIN(EMIO_GPIO_PIN_PMOD0_2);
		AD9670_IP_REG_CONTROL(adcBaseAddr[ADC_INSTANCE]) = 0u;

		// Setup DMA transfer:		
		const int Status = XAxiDma_SimpleTransfer(
				&hAxiDma,
				(UINTPTR) SAMPLE_BUFFER_ADDRESS,
				TRANSFER_SIZE,
				XAXIDMA_DEVICE_TO_DMA
		);

		if (Status != XST_SUCCESS) {
			result = false;
		} else {		
			
			// Wait for the transfer to complete:
			while (XAxiDma_Busy(&hAxiDma, XAXIDMA_DEVICE_TO_DMA)) {
				// Wait
			}
		}
}
#else // multi-burst


for (;;) {
		// Flush cache:
		Xil_DCacheFlushRange(
				(UINTPTR) SAMPLE_BUFFER_ADDRESS,
				TRANSFER_SIZE
		);
	
	
		UINTPTR
			destAddr = SAMPLE_BUFFER_ADDRESS,
			nBytes = TRANSFER_SIZE;
			
		// Raise the TX_TRIGGER input:
		EMIO_GPIO_SET_PIN(EMIO_GPIO_PIN_PMOD0_2);
		
		WAIT_USEC(1);
		
		// Lower it:
		EMIO_GPIO_CLEAR_PIN(EMIO_GPIO_PIN_PMOD0_2);
		

		while (nBytes > 0) {
			
//writeReg(AD9670_REG_PROF_IDX, AD9670_PROF_IDX_TX_TRIG_SOFTWARE | AD9670_PROF_IDX(0));			

			// Setup DMA transfer:		
			const int Status = XAxiDma_SimpleTransfer(
					&hAxiDma,
					(UINTPTR) destAddr,
					XPAR_AXI_DMA_0_S2MM_BURST_SIZE,
					XAXIDMA_DEVICE_TO_DMA
			);

			if (Status != XST_SUCCESS) {
				result = false;
				break;
			} else {								
				// Wait for the transfer to complete:
				while (XAxiDma_Busy(&hAxiDma, XAXIDMA_DEVICE_TO_DMA)) {
					// Wait
				}
				// Change address/bytes by burst size:
				destAddr += XPAR_AXI_DMA_0_S2MM_BURST_SIZE;
				nBytes -= XPAR_AXI_DMA_0_S2MM_BURST_SIZE;
			}
		}
}

#endif
#endif

		// Lower the enable pin.
		EMIO_GPIO_CLEAR_PIN(EMIO_GPIO_PIN_PMOD0_0);
				
#if 0
		result = false;
		// Monitor the status word.
		uint16_t nAvail[1024];
		for (uint32_t iAvail = 0u; iAvail < _countof(nAvail); ++iAvail) {
			nAvail[iAvail] = (uint16_t) AD9670_IP_REG_STATUS(
					XPAR_AD9670_AXI4_1_S_AXI_BASEADDR
			);
			if (nAvail[iAvail] > 0u) {
				result = true;
			} else {
				// No results in the FIFO yet...
			}
			WAIT_USEC(1);
		}
#endif
	} else {
		// If the DMA setup failed, we won't get any data.
	}
	
	return result;	
}

static bool testAdcShifting(void)
{	
	// Disable caching:
	Xil_DCacheDisable();
	
	// Enable interrupts:
	Xil_ExceptionEnable();	
	
	// Set the GPIO output to enable the ADC:
	EMIO_GPIO_SET_PIN(EMIO_GPIO_PIN_PMOD0_0);	

	// Initialize the ADC registers:
	bool result = testAdcSpi();
	
	// Wait for her to wake up from shutdown, tune filters, and lock the PLL:
	WAIT_USEC(500u);	
	
for (int32_t fcoRotate = -4; fcoRotate <= 7; ++fcoRotate) {
	if (result) {
		writeReg(
				AD9670_REG_SERIAL_FORMAT,
				AD9670_SERIAL_FORMAT_FCO_START_CODE_EN
				| AD9670_SERIAL_FORMAT_FCO_CONTINUOUS
				| AD9670_SERIAL_FORMAT_FCO_ROTATE(fcoRotate)
		);
	} else {
		break;
	}
	
for (uint32_t dcoDelay = 0u; dcoDelay <= 3200u; dcoDelay += 100u) {

	if (result) {	
		writeReg(
				AD9670_REG_FLEX_OUT_DEL,
				AD9670_FLEX_OUT_DEL_ENABLE | AD9670_FLEX_OUT_DEL_PSEC(dcoDelay)
		);
		result = setupDma();
	} else {
		// If the SPI failed, the ADC won't run.
	}
	
	if (result) {

		// Reset the ADC:		
		AD9670_IP_REG_CONTROL(adcBaseAddr[ADC_INSTANCE])
				= AD9670_IP_CONTROL_RESET;
		
		WAIT_USEC(1);
		
		AD9670_IP_REG_CONTROL(adcBaseAddr[ADC_INSTANCE]) = 0u;
				
		// Zero destination:
		memset((void*) SAMPLE_BUFFER_ADDRESS, 0, TRANSFER_SIZE);
				
		// Set the GPIO output to enable the ADC:
//		EMIO_GPIO_SET_PIN(EMIO_GPIO_PIN_PMOD0_0);

		// Wait for her to warm up:		
//		WAIT_USEC(1000000u);
		
		
		// Flush cache:
/*		Xil_DCacheFlushRange(
				(UINTPTR) SAMPLE_BUFFER_ADDRESS,
				TRANSFER_SIZE
		);
*/
		// Raise the TX_TRIGGER input:
		AD9670_IP_REG_CONTROL(adcBaseAddr[ADC_INSTANCE])
				= AD9670_IP_CONTROL_TRIGGER;

		WAIT_USEC(1);
		
		// Lower it:
		AD9670_IP_REG_CONTROL(adcBaseAddr[ADC_INSTANCE]) = 0u;

		// Wait for the transfer to complete:
		while (XAxiDma_Busy(&hAxiDma, XAXIDMA_DEVICE_TO_DMA)) {
			// Wait
		}
		
		// Clear the GPIO output to disable the ADC peripheral:
//		EMIO_GPIO_CLEAR_PIN(EMIO_GPIO_PIN_PMOD0_0);		
		
		++bkpt;
				
	} else {
		// Failed, leave loop
		break;
	}
} // end dcoDelay loop
} // end fcoRotate loop


	return result;
}

static bool testDac(void)
{
	const uint32_t 
		BA = XPAR_AD5424_AXI4_0_S_AXI_BASEADDR,
		iDac = 1u;
	
	// Initialize the waveform:
	for (uint32_t iW = 0; iW < AD5424_N_WAVEFORM; ++iW) {
		AD5424_REG_WAVEFORM(BA, iW) = AD5424_WAVEFORM(iDac, iW * 2u);
	}
		
	// In a loop...
	for (;;) {
		// Pulse the DAC on:
//		AD5424_REG_CONTROL(BA) = AD5424_CONTROL_START;
		EMIO_GPIO_SET_PIN(EMIO_GPIO_PIN_DAC_START);
		// Wait for it to catch:
		WAIT_USEC(1u);
		// Reset start signal:
//		AD5424_REG_CONTROL(BA) = 0u;
		EMIO_GPIO_CLEAR_PIN(EMIO_GPIO_PIN_DAC_START);

		// Wait for waveform to complete.  100 @ 10MHz = 10 usec.
		WAIT_USEC(10u);
	}
	
	return false;
}

static bool testEmioGpio(void)
{
	// Generate 1 kHz waveform:
	for (;;) {
		EMIO_GPIO_TOGGLE_PIN(EMIO_GPIO_PIN_PMOD0_0);
		
		WAIT_USEC(500);		
	}
	
	return false;	
}

// Test for LED on eval board, connected to MIO23.
static bool testLed(void)
{
	// Setup GPIO for SDIO direction control:
	{
		XGpioPs_SetDirectionPin(&hGpio, 23, XGPIOPS_DIRECTION_OUTPUT);
		XGpioPs_SetOutputEnablePin(&hGpio, 23, true);
	}
	
	uint32_t onoff = 0u;
	for (;;) {
		XGpioPs_WritePin(&hGpio, 23, onoff);
		onoff ^= 1u;
		WAIT_USEC(1000000u);
	}
	
	return true;
}

static bool testPulser(void)
{
	const uint32_t BA = XPAR_HV7321_AXI4_0_S_AXI_BASEADDR;
	static uint32_t waveform[HV7321_N_WAVEFORM-2];  // TODO debug
	
	// Set Rx done for other unit in pair so debug output meaningful.
	HV7321_REG_CONTROL(XPAR_HV7321_AXI4_1_S_AXI_BASEADDR) 
			= HV7321_CONTROL_RX_DONE;

	// All waveforms start at zero:	
	waveform[0] = HV7321_WAVEFORM_RTZ(0u);
	
#if 1    // 0 to +80, 22 MHz
	for (int iW = 1; iW < _countof(waveform)-2; ++iW) {
		if (iW / 20 & 1) { // 10s, 30s, etc.  
			waveform[iW] = HV7321_WAVEFORM_RTZ(0u); // return-to-zero
		} else {
			waveform[iW] = HV7321_WAVEFORM_VPP0(0u);
		}
	}
#elif 1
	for (int iW = 1; iW < _countof(waveform)-2; ++iW) {
		if (iW & 1) { // odd  
			waveform[iW] = HV7321_WAVEFORM_VPP0(0u);  // +80V
		} else {
			waveform[iW] = HV7321_WAVEFORM_RTZ(0u); // return-to-zero
		}
	}
#elif 1  // all levels
	static const uint32_t levels[] = {
		HV7321_WAVEFORM_VPP1(0u),  // +40V
		HV7321_WAVEFORM_VPP0(0u),  // +80V
		HV7321_WAVEFORM_VPP1(0u),  // +40V
		HV7321_WAVEFORM_RTZ(0u), // return-to-zero
		HV7321_WAVEFORM_VNN1(0u),  // -40
		HV7321_WAVEFORM_VNN0(0u),  // -80
		HV7321_WAVEFORM_VNN1(0u),  // -40
		HV7321_WAVEFORM_RTZ(0u), // return-to-zero
	};		
		
	const int DUP = 10;
	int iW = 1, iL = 0;
	while (iW < _countof(waveform) - DUP) {
		for (int iD = 0; iD < DUP; ++iD) {
			waveform[iW++] = levels[iL];
		}
		if (++iL == _countof(levels)) {
			iL = 0;
		}
	}

	// Return to zero before Rx:	
	waveform[_countof(waveform)-2] = HV7321_WAVEFORM_RTZ(0u);
	
#else // just on
	for (int iW = 1; iW < _countof(waveform)-2; ++iW) {
		waveform[iW] = 
				  HV7321_WAVEFORM_VPP0(0u)   // +80V
				| HV7321_WAVEFORM_VPP0(1u)
				| HV7321_WAVEFORM_VPP0(2u)
				| HV7321_WAVEFORM_VPP0(3u);
	}

#endif

	// All end with all channels in RX.
	waveform[_countof(waveform)-1] =
		  HV7321_WAVEFORM_RX(0)
		| HV7321_WAVEFORM_RX(1)
		| HV7321_WAVEFORM_RX(2)
		| HV7321_WAVEFORM_RX(3);
		
	// Reset the peripheral:
	HV7321_REG_CONTROL(BA) = HV7321_CONTROL_RESET;

	WAIT_USEC(1);	

	// Enable the pulser's internal voltage regulators: 
	HV7321_REG_CONTROL(BA) = HV7321_CONTROL_REN
			| HV7321_CONTROL_OUT_CLK_DISABLE;

	// Wait for them to stabilize.
	WAIT_USEC(1000);
	
	// Load the waveform:
	for (uint32_t iWave = 0u; iWave < _countof(waveform); ++iWave) {
		HV7321_REG_WAVEFORM(BA, iWave) = waveform[iWave];
		if (HV7321_REG_WAVEFORM(BA, iWave) != waveform[iWave]) {
			for(;;) ;
		}
	}
	
	// Enable the outputs:
	HV7321_REG_CONTROL(BA) = HV7321_CONTROL_REN | HV7321_CONTROL_OEN;
			
	// Wait 200 usec for the output to enable.
	WAIT_USEC(200);

	uint32_t txCnt, rxCnt;
	
	for (;;) {
		// Start the waveform:
#if 0  // software start
		HV7321_REG_CONTROL(BA) = 
				HV7321_CONTROL_REN | HV7321_CONTROL_OEN | HV7321_CONTROL_START;
#else  // hardware start
		// Clear Rx Done bit:
		HV7321_REG_CONTROL(BA) = 
				HV7321_CONTROL_REN | HV7321_CONTROL_OEN;
		EMIO_GPIO_SET_PIN(EMIO_GPIO_PIN_PULSER_START);
#endif
		// Wait until the status register indicates the transmission is done:
		txCnt = 0u;
		while (!(HV7321_REG_STATUS(BA) & HV7321_STATUS_RX)) {
			// Wait
			++txCnt;
		}
		EMIO_GPIO_CLEAR_PIN(EMIO_GPIO_PIN_PULSER_START);

		// Simulate recording:
		WAIT_USEC(800);
		
		// Set the Rx_done bit, and clear the start bits.
		HV7321_REG_CONTROL(BA) = HV7321_CONTROL_REN | HV7321_CONTROL_OEN
				| HV7321_CONTROL_RX_DONE;

		// Wait for the peripheral to clear Rx mode.
		rxCnt = 0u;
		while ((HV7321_REG_STATUS(BA) & HV7321_STATUS_RX)) {
			++rxCnt;
		}
		
		WAIT_USEC(1);
	}
	
	return true;
}

