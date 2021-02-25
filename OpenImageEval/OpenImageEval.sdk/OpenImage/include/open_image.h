/*
	open_image.h
	
	Declarations for the Open Image application.
	
	2020-08-05  WHF  Created.
*/

#ifndef __OPEN_IMAGE_H__
#define __OPEN_IMAGE_H__

#include <assert.h>
#include <stdbool.h>
#include <stdint.h>

#include <xgpiops.h>
#include <xparameters.h>
#include <xscugic.h>


#pragma GCC diagnostic ignored "-Wparentheses"

//********************************  Constants  *******************************//

/////  Communications  /////
// TCP/IP Port used to connect to the OpenImager.
#define OI_TCP_PORT                                                  26000u
// First byte of every packet.  260 doesn't fit so we div 2.
#define OI_MAGIC                                                  (260u/2u)

///  Command Codes  ///
#define OI_CMD_GET_STATUS                                             0x01u

#define OI_CMD_QUEUE_FRAME                                            0x11u
#define OI_CMD_GET_FRAME                                              0x12u

///  Response Codes  ///
#define OI_RES_ACK                                                    0x80u
#define OI_RES_STATUS                                                 0x81u

#define OI_RES_FRAME                                                  0x92u

#define OI_RES_NACK                                                   0xFFu



// Total number of channels for transmit and receive.
#define OI_N_CHAN                                                       16u

// Number of entires for the level sequencer.
#define OI_MAX_N_LEVEL_SEQUENCE                                        252u


// Number of ADC devices present in the system.
#define OI_RX_N_CHIPS                                                    2u

// Maximum number of Time Gain Compensation values that may be specified.
#define OI_RX_MAX_N_TGC                                                300u

// Maximum number of shots in one frame.
#define OI_MAX_N_SHOTS                                                 100u


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

#define USER_LED_PIN                                                     23


//**********************************  Types  *********************************//

typedef enum tag_event {
	EVENT_INIT_COMPLETE,
	EVENT_ARM,
	EVENT_SHOT,
	EVENT_SHOT_DONE,
	EVENT_REC_DONE,
	EVENT_FAULT,
	EVENT_CLEAR_FAULT,
	
	N_EVENTS
} event_t;

typedef enum tag_state {
	STATE_INIT,
	STATE_READY,
	STATE_ARMED,
	STATE_RECORD,
	STATE_FAULT,
	
	N_STATES,
	
	STATE_ANY
} state_t;

typedef enum tag_oi_error {
	OI_ERR_NONE,
	OI_ERR_UNRECOGNIZED_COMMAND,
	OI_ERR_BAD_PACKET,
	OI_ERR_INCORRECT_SIZE,
	OI_ERR_ILLEGAL_STATE,
	OI_ERR_INVALID_PARAMETER,
	
} oi_error_t;

// NOTE: all data structures should have 32-bit alignment.

typedef struct tag_oi_status {
	uint32_t 
		state,
		flags;
	
	uint8_t buildDate[32];
} OI_STATUS;

typedef struct tag_oi_tx_channel {
	uint32_t 
		enable,
		nLevelSequence;
	
	// Waveform to generate.  The waveform will be output at
	//   oi_tx.CLOCK_RATE.
	//  2 = Vpp0, 1 = Vpp1, 0 = RTZ, -1 = Vnn1, -2 = Vnn0;
	//  e.g., [2 -2] would be  single-cycle square wave.
	//  Note that the waveform *must* begin and end with RTZ.
	int8_t levelSequence[OI_MAX_N_LEVEL_SEQUENCE];
	
} OI_TX_CHANNEL;

typedef struct tag_oi_tx {
	OI_TX_CHANNEL channels[OI_N_CHAN];
} OI_TX;

typedef struct tag_oi_rx_channel {
	uint32_t enable;
	
} OI_RX_CHANNEL;

typedef struct tag_oi_rx {
	OI_RX_CHANNEL channels[OI_N_CHAN];
	
	uint32_t
		nSamples,
		nTgc[OI_RX_N_CHIPS];

	uint8_t
		lpfMul[OI_RX_N_CHIPS],
		lpfDiv[OI_RX_N_CHIPS],
		tgc[OI_RX_N_CHIPS][OI_RX_MAX_N_TGC],
		lna[OI_RX_N_CHIPS],
		pga[OI_RX_N_CHIPS],
		hpf_divisor[OI_RX_N_CHIPS],
		testMode[OI_RX_N_CHIPS]; 
		
} OI_RX;

typedef struct tag_oi_shot {
	OI_TX tx;
	
	OI_RX rx;
	
} OI_SHOT;

typedef struct tag_oi_frame {
	uint32_t
		handle,
		nShots;
		
	OI_SHOT shots[OI_MAX_N_SHOTS];
} OI_FRAME;


typedef struct tag_oi_frame_data_req {
	uint32_t 
		iAdc,
		byteOffset,
		nBytes;
} OI_FRAME_DATA_REQ;

//*******************************  Global Data  ******************************//
// Global GPIO instance.
extern XGpioPs hGpio;


//*********************************  Macros  *********************************//
#define ENABLE_INTR()                                 Xil_ExceptionEnable()
#define DISABLE_INTR()                               Xil_ExceptionDisable()


#define EMIO_GPIO_SET_PIN(pin)   (EMIO_GPIO_BANK_3_DATA_REG |= 1u << (pin))
#define EMIO_GPIO_CLEAR_PIN(pin)                                          \
		(EMIO_GPIO_BANK_3_DATA_REG &= ~(1u << (pin)))
#define EMIO_GPIO_TOGGLE_PIN(pin)                                         \
	(EMIO_GPIO_BANK_3_DATA_REG ^= 1u << (pin))
	
// Set a bitfield of pins simultaneously.
#define EMIO_GPIO_SET_PINS(pins)      (EMIO_GPIO_BANK_3_DATA_REG |= (pins))

// The number of cycles per loop in 'delay_cycles'.
#define CYCLES_PER_DELAY_LOOP                                            1U
#define USEC_PER_SEC                                               1000000U
#define WAIT_USEC(usec)   delay_cycles(                                   \
		(CPU_FREQ_HZ / CYCLES_PER_DELAY_LOOP / USEC_PER_SEC) * (usec))

// Integer division that rounds up.
#define CEIL_DIV(x, y)                                   (((x)+(y)-1u)/(y))
		
#define _countof(x)                            (sizeof(x) / sizeof((x)[0]))

#define UNUSED(x)                                              ((void) (x))

//********************************  Functions  *******************************//

void delay_cycles(uint32_t nCycles);


void oiAdcInit(void);
void oiAdcVisit(void);
void oiAdcSetup(const OI_RX* pRx);

void oiAdcDmaInit(void);
void oiAdcDmaVisit(void);
void oiAdcDmaSetup(uint32_t nSamples);
const uint8_t* oiAdcDmaGetFrameData(const OI_FRAME_DATA_REQ* pReq);
void oiAdcDmaRestartRecording(void);

void oiCmdHandle(void *pPacket, uint32_t nBytes);

void oiInit(void);

void oiPulserInit(void);
void oiPulserVisit(void);	
bool oiPulserSetup(const OI_TX* pTx);

void oiServerInit(void);
void oiServerVisit(void);
void oiServerReply(uint8_t cmd, const void* pData, uint32_t nData);

void oiShotManInit(void);
void oiShotManVisit(void);
oi_error_t oiShotManQueueFrame(const void* pBytes, uint32_t nBytes);

void oiSmVisit(void);
void oiSmSetEvent(event_t event);
state_t oiSmGetState(void);

void oiTgcInit(void);
void oiTgcSetup(const OI_RX* pRx);


#endif /* __OPEN_IMAGE_H__ */

