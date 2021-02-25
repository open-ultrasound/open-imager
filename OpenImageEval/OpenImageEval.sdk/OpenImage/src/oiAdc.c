/*
	oiAdc.c

	Implementation of the Adc module for the Open Image application.

	2020-08-05  WHF  Created.
*/

#include "open_image.h"

#include <ad9670_axi4.h>

#include <xspips.h>

//********************************  Constants  *******************************//
// ADC Settings.
#define FCO_ROTATE_ADC0                                                  -2
#define DCO_DELAY_ADC0                                                  200

#define FCO_ROTATE_ADC1                                                  -2
#define DCO_DELAY_ADC1                                                  300

//**********************************  Types  *********************************//
typedef struct tag_verified_reg {
	uint16_t reg;
	uint8_t 
		value,
		mask;    // anded for verification
} verified_reg_t;

//*******************************  Module Data  ******************************//
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
	{ AD9670_REG_GLOBAL_MODES, AD9670_GLOBAL_MODES_TGC, 
			AD9670_GLOBAL_MODES_MASK },
	{ AD9670_REG_FLEX_SERIAL_CTRL,
		AD9670_FLEX_SERIAL_CTRL_8_LANES | AD9670_FLEX_SERIAL_CTRL_16_BIT_WORD,
		0xFF },
	{ AD9670_REG_SAMP_CLK_COUNTER, AD9670_SAMP_CLK_COUNTER_ENABLE, 
		AD9670_SAMP_CLK_COUNTER_ENABLE },
	{ AD9670_REG_USR_PAT1_LSB, 0x34, 0xFF },
	{ AD9670_REG_USR_PAT1_MSB, 0x12, 0xFF },
	{ AD9670_REG_USR_PAT2_LSB, 0xAD, 0xFF },
	{ AD9670_REG_USR_PAT2_MSB, 0xDE, 0xFF },
	{ AD9670_REG_USR_PAT3_LSB, 0x0D, 0xFF },
	{ AD9670_REG_USR_PAT3_MSB, 0xF0, 0xFF },
	{ AD9670_REG_USR_PAT4_LSB, 0xCE, 0xFF },
	{ AD9670_REG_USR_PAT4_MSB, 0xFA, 0xFF },		
	{ AD9670_REG_PLL_STARTUP, AD9670_PLL_STARTUP_ENABLE, 
		AD9670_PLL_STARTUP_MASK },
}; // end base registers

static const verified_reg_t ADC_SPECIFIC_REGS[][7] = { 
	{ // ADC_INSTANCE == 0
		// Channel 7 is inverted here:
		{ AD9670_REG_DEVICE_INDEX_1, 0, 0x3F },
		{ AD9670_REG_DEVICE_INDEX_2, 0x08, 0x0F },
		{ AD9670_REG_OUTPUT_MODE, 5, 0 },
		{ AD9670_REG_DEVICE_INDEX_1, 0x3F, 0x3F }, // restore global index
		{ AD9670_REG_DEVICE_INDEX_2, 0x0F, 0x0F },
			
		{ AD9670_REG_SERIAL_FORMAT,
			AD9670_SERIAL_FORMAT_FCO_START_CODE_EN
			| AD9670_SERIAL_FORMAT_FCO_CONTINUOUS
			| AD9670_SERIAL_FORMAT_FCO_ROTATE(FCO_ROTATE_ADC0),
			AD9670_SERIAL_FORMAT_MASK },
		{ AD9670_REG_FLEX_OUT_DEL,
			AD9670_FLEX_OUT_DEL_ENABLE
			| AD9670_FLEX_OUT_DEL_PSEC(DCO_DELAY_ADC0),
			AD9670_FLEX_OUT_DEL_MASK },
	}, { // ADC_INSTANCE == 1
		// Set just channel 0 to inverted mode (due to some error somewhere):
		{ AD9670_REG_DEVICE_INDEX_1, 1, 0x3F },
		{ AD9670_REG_DEVICE_INDEX_2, 0, 0x0F },
		{ AD9670_REG_OUTPUT_MODE, 5, 0 },
		{ AD9670_REG_DEVICE_INDEX_1, 0x3F, 0x3F }, // restore global index
		{ AD9670_REG_DEVICE_INDEX_2, 0x0F, 0x0F },
		
		{ AD9670_REG_SERIAL_FORMAT,
			AD9670_SERIAL_FORMAT_FCO_START_CODE_EN
			| AD9670_SERIAL_FORMAT_FCO_CONTINUOUS
			| AD9670_SERIAL_FORMAT_FCO_ROTATE(FCO_ROTATE_ADC1),
			AD9670_SERIAL_FORMAT_MASK },
		{ AD9670_REG_FLEX_OUT_DEL,
			AD9670_FLEX_OUT_DEL_ENABLE
			| AD9670_FLEX_OUT_DEL_PSEC(DCO_DELAY_ADC1),
			AD9670_FLEX_OUT_DEL_MASK },
	}
};
/////  Test Modes  /////
static const verified_reg_t TEST_NORMAL_OPERATION_REGS[] = {
	{ AD9670_REG_TEST_IO, AD9670_TEST_IO_MODE_OFF, AD9670_TEST_IO_MODE_MASK },
	{ AD9670_REG_TST_MODE_CFG, AD9670_TST_MODE_DISABLE, AD9670_TST_MODE_MASK },
	// Although unclear, this enables the test tones on a per-channel basis.
	{ AD9670_REG_TST_MODE_CH_EN, 0x00, 0xFF }, // no channels
};

static const verified_reg_t TEST_CHAN_ID_REGS[] = { 
	{ AD9670_REG_TEST_IO, AD9670_TEST_IO_MODE_OFF, AD9670_TEST_IO_MODE_MASK },
	{ AD9670_REG_TST_MODE_CFG, AD9670_TST_MODE_CHAN_ID,	AD9670_TST_MODE_MASK },
};

static const verified_reg_t TEST_SINE_REGS[] = { 
	{ AD9670_REG_TEST_IO, AD9670_TEST_IO_MODE_OFF, AD9670_TEST_IO_MODE_MASK },

	//	{ AD9670_REG_TST_MODE_CH_EN, 0xFF, 0xFF }, // all channels

	{ AD9670_REG_DIG_SIN_TST_FREQ, 0x1F, 0x1F }, 
	{ AD9670_REG_DIG_SIN_TST_AMP, 0x1, 0x0f },  
	{ AD9670_REG_DIG_SIN_TST_OFF, 0x7F, 0xFF },  
	{ AD9670_REG_TST_MODE_CFG, AD9670_TST_MODE_SINE,	AD9670_TST_MODE_MASK },
};

static const verified_reg_t TEST_ANA_TONES_REGS[] = {
	{ AD9670_REG_TEST_IO, AD9670_TEST_IO_MODE_OFF, AD9670_TEST_IO_MODE_MASK },
	{ AD9670_REG_ANA_TST_TONE,    0x3, 0xF }, 
	{ AD9670_REG_TST_MODE_CFG, AD9670_TST_MODE_ANA_TONE, AD9670_TST_MODE_MASK },

	// Although unclear, this enables the test tones on a per-channel basis.
	{ AD9670_REG_TST_MODE_CH_EN, 0xFF, 0xFF }, // all channels
};
	
static const verified_reg_t TEST_USER_IO_REGS[] = {
	{ AD9670_REG_TST_MODE_CFG, AD9670_TST_MODE_DISABLE, AD9670_TST_MODE_MASK },
	{ AD9670_REG_TEST_IO, AD9670_TEST_IO_MODE_USER, AD9670_TEST_IO_MODE_MASK },
};

static const struct tag_test_choice {		
	const verified_reg_t *pRegs;
	uint32_t nRegs;
} TEST_CHOICES[] = {
	{ TEST_NORMAL_OPERATION_REGS, _countof(TEST_NORMAL_OPERATION_REGS) },
	{ TEST_CHAN_ID_REGS, _countof(TEST_CHAN_ID_REGS) }, 
	{ TEST_SINE_REGS, _countof(TEST_SINE_REGS) },
	{ TEST_ANA_TONES_REGS, _countof(TEST_ANA_TONES_REGS) },
	{ TEST_USER_IO_REGS, _countof(TEST_USER_IO_REGS) },
};

static XSpiPs hSpi;

static const uint32_t adcBaseAddr[] = {
	XPAR_AD9670_AXI4_0_S_AXI_BASEADDR,
	XPAR_AD9670_AXI4_1_S_AXI_BASEADDR
};

//***********************  Local Function Declarations  **********************//
static uint8_t readReg(uint32_t reg);
static void writeReg(uint32_t reg, uint8_t val);
static bool writeRegisterTable(const verified_reg_t* pTable, uint32_t n);

//****************************  Global Functions  ****************************//

void oiAdcInit(void)
{
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

	for (uint32_t iAdc = 0u; iAdc < OI_RX_N_CHIPS; ++iAdc) {	
		// Note that AFE1 is mapped to Channel 0.
		// Indicate which chip select to use:
		hSpi.SlaveSelect = (!iAdc) << XSPIPS_CR_SSCTRL_SHIFT;   // TODO fix
		// Perform a read of the ID register.
		const uint8_t id = readReg(AD9670_REG_CHIP_ID);

		bool result = false;
		uint32_t onoff = 0u;
		
		while (result == false) {
			if (id == AD9670_CHIP_ID_AD9670) {
				// Ok.  We're talking successfully to the chip.  Reset it.
				result = writeRegisterTable(AD9670_REGS, _countof(AD9670_REGS));
				
				if (result) {
					result = writeRegisterTable(
							ADC_SPECIFIC_REGS[iAdc],
							_countof(ADC_SPECIFIC_REGS[iAdc])
					);
				} else {
					// Fail.
				}			
			} else {
				result = false;
			}
	
			XGpioPs_WritePin(&hGpio, USER_LED_PIN, onoff);
			onoff ^= 1u;
			WAIT_USEC(100000u);  // 100 msec
		}
		
		if (!result) {
			// TODO
			assert(false);
		} else {
			// Ok.
		}
	}
	
	// Set the GPIO output to enable the ADC:
	EMIO_GPIO_SET_PIN(EMIO_GPIO_PIN_ADC_ENABLE);	
}

void oiAdcVisit(void)
{
	// TODO
}

static struct tag_per_setup_regs { 
	verified_reg_t
		flexGain,
		flexChannelInput,
		flexFilter; // last as starts tuning
} setupRegs = {
	{ AD9670_REG_FLEX_GAIN, 0, 0xFF },
	{ AD9670_REG_FLEX_CHAN_IN, 0, 0xFC }, 
	{ AD9670_REG_FLEX_FILTER, 0, 0x0B }
};
	
void oiAdcSetup(const OI_RX* pRx)
{			
	for (uint32_t iAdc = 0u; iAdc < OI_RX_N_CHIPS; ++iAdc) {
		bool result;
		
		// Note that AFE1 is mapped to Channel 0.
		// Indicate which chip select to use:
		hSpi.SlaveSelect = (!iAdc) << XSPIPS_CR_SSCTRL_SHIFT;   // TODO fix	
		
		// Write the flex filtering registers:
		setupRegs.flexGain.value = pRx->pga[iAdc] << 2 | pRx->lna[iAdc];
		setupRegs.flexChannelInput.value = !0x40 // low BW mode
				| pRx->lpfMul[iAdc] << 3
				| pRx->lpfDiv[iAdc] << 6;
		setupRegs.flexFilter.value = 0x40 | pRx->hpf_divisor[iAdc] & 0x3;
		
		result = writeRegisterTable(
				(verified_reg_t*) &setupRegs, 
				sizeof(setupRegs) / sizeof(verified_reg_t)
		);
		assert(result);

		// Write the test mode registers:
		uint32_t testChoice = pRx->testMode[iAdc];
		if (testChoice >= _countof(TEST_CHOICES)) {
			testChoice = 0u; // silently deactivate
		} else {
			// ok
		}
		result = writeRegisterTable(
				TEST_CHOICES[testChoice].pRegs,
				TEST_CHOICES[testChoice].nRegs
		);
		assert(result);
		
		// Reset the ADCs:		
		AD9670_IP_REG_CONTROL(adcBaseAddr[iAdc])
				= AD9670_IP_CONTROL_RESET;
		
		WAIT_USEC(1);
		
		AD9670_IP_REG_CONTROL(adcBaseAddr[iAdc]) = 0u;
		
	}
	
	oiAdcDmaSetup(pRx->nSamples);

	// Set the GPIO output to enable the ADC:	
//	EMIO_GPIO_SET_PIN(EMIO_GPIO_PIN_ADC_ENABLE);	
		
	// It is now ready for the trigger which will come from the 
	//  pulser IP.
		
#if 0
		// Raise the TX_TRIGGER input:
//		EMIO_GPIO_SET_PIN(EMIO_GPIO_PIN_PMOD0_2);
		AD9670_IP_REG_CONTROL(adcBaseAddr[ADC_INSTANCE])
				= AD9670_IP_CONTROL_TRIGGER;
		
		WAIT_USEC(1);
		
		// Lower it:
//		EMIO_GPIO_CLEAR_PIN(EMIO_GPIO_PIN_PMOD0_2);
		AD9670_IP_REG_CONTROL(adcBaseAddr[ADC_INSTANCE]) = 0u;
#endif
}

//***********************  Local Function Definitions  ***********************//
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

