/*
	oiSm.c

	Implementation of the State Machine module for the Open Image application.

	2020-08-05  WHF  Created.
*/

#include "open_image.h"

#include <state_mach.h>

//*******************************  Module Data  ******************************//
static uint32_t oiEvents = 0U;
	
static state_t oiState = STATE_INIT;

// Define state machine transition table.
static const struct tag_transitions {
	state_t 
		srcState,     // state for which this transition applies
		destState;    // end state for the transition 
	event_t 
		event;        // event to trigger transition
} TRANSITIONS[] = {
	// Highest priority
	{ STATE_INIT,          STATE_READY,     EVENT_INIT_COMPLETE       },
	{ STATE_ANY,           STATE_FAULT,     EVENT_FAULT               },
	{ STATE_READY,         STATE_ARMED,     EVENT_ARM                 },
	{ STATE_ARMED,         STATE_RECORD,    EVENT_SHOT                },
	{ STATE_RECORD,        STATE_ARMED,     EVENT_SHOT_DONE           },
	{ STATE_ARMED,         STATE_READY,     EVENT_REC_DONE            },
	{ STATE_FAULT,         STATE_READY,     EVENT_CLEAR_FAULT         },	
	// Lowest priority
};
	

//****************************  Global Functions  ****************************//
void oiSmSetEvent(event_t toSet) { oiEvents |= 1u << toSet; }

state_t oiSmGetState(void) { return oiState; }

// Handle events, that may cause state machine transitions.  
//  Return true if an event was processed; false otherwise.
void oiSmVisit(void)
{
	// Perform state transitions in a critical section:
	DISABLE_INTR();
		
	STATE_MACHINE_TRANSITION(TRANSITIONS, oiState, oiEvents, STATE_ANY);
	
	// Zero any unconsumed events.
	oiEvents = 0u;
	
	ENABLE_INTR();
}

