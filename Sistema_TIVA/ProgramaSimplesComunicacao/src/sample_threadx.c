/*__________________________________________________________________________________
|       Disciplina de Sistemas Embarcados - 2022-1
|       Prof. Douglas Renaux
| __________________________________________________________________________________
|
|		Lab 5
| __________________________________________________________________________________
*/

/**
 * @file     sample_threadx.c
 * @author   Luis Camilo Jussiani Moreira e João Victor Laskoski
 * @version  V2 -for 2022-2 semester
 * @date     Out, 2022
 ******************************************************************************/

/*------------------------------------------------------------------------------
 *
 *      File includes
 *
 *------------------------------------------------------------------------------*/
#include "tx_api.h"

#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

#include "driverlib/gpio.h"
#include "driverlib/pin_map.h"
#include "driverlib/sysctl.h"
#include "inc/hw_memmap.h"
/*------------------------------------------------------------------------------
 *
 *      Typedefs and constants
 *
 *------------------------------------------------------------------------------*/

#define DEMO_STACK_SIZE         1024
#define DEMO_BYTE_POOL_SIZE     9120


/* Define the ThreadX object control blocks...  */

TX_THREAD               thread_0;
TX_BYTE_POOL            byte_pool_0;

/* Define byte pool memory.  */

UCHAR                   byte_pool_memory[DEMO_BYTE_POOL_SIZE];

/* Define event buffer.  */

#ifdef TX_ENABLE_EVENT_TRACE
UCHAR   trace_buffer[0x10000];
#endif
/*------------------------------------------------------------------------------
 *
 *      Global vars
 *
 *------------------------------------------------------------------------------*/
uint32_t ui32SysClock;
/* Define the counters used in the demo application...  */
ULONG                   thread_0_counter;
/*------------------------------------------------------------------------------
 *
 *      Functions and Methods
 *
 *------------------------------------------------------------------------------*/
/* Define thread prototypes.  */
void    thread_0_entry(ULONG thread_input);

/* Define what the initial system looks like.  */

void    tx_application_define(void *first_unused_memory)
{

CHAR    *pointer = TX_NULL;


#ifdef TX_ENABLE_EVENT_TRACE
    tx_trace_enable(trace_buffer, sizeof(trace_buffer), 32);
#endif

    /* Create a byte memory pool from which to allocate the thread stacks.  */
    tx_byte_pool_create(&byte_pool_0, "byte pool 0", byte_pool_memory, DEMO_BYTE_POOL_SIZE);

    /* Put system definition stuff in here, e.g. thread creates and other assorted
       create information.  */

    /* Allocate the stack for thread 0.  */
    tx_byte_allocate(&byte_pool_0, (VOID **) &pointer, DEMO_STACK_SIZE, TX_NO_WAIT);

    /* Create the main thread.  */
    tx_thread_create(&thread_0, "thread 0", thread_0_entry, 0,  
            pointer, DEMO_STACK_SIZE, 
            1, 1, TX_NO_TIME_SLICE, TX_AUTO_START);

}

void thread_0_entry(ULONG thread_input)
{
    /* This thread simply sits in while-forever-sleep loop.  */
    while(1)
    {
        GPIOPinWrite(GPIO_PORTB_BASE, GPIO_PIN_4, GPIO_PIN_4);  //Turn on LED	
        /* Sleep for 1 second.  */
        tx_thread_sleep(500);
		
		
	GPIOPinWrite(GPIO_PORTB_BASE, GPIO_PIN_4, 0);         //Turn off led
        /* Sleep for 1 second.  */
        tx_thread_sleep(500);
    }
}

void GPIOInit() {
	//
    // Enable the GPIO port that is used for the on-board LED. (PB4)
    //
    SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOB);
	while(!SysCtlPeripheralReady(SYSCTL_PERIPH_GPIOB))
    {
    }
    GPIOPinTypeGPIOOutput(GPIO_PORTB_BASE, GPIO_PIN_4);   //Configure the pin PB4 like a gpio pin
    GPIOPinWrite(GPIO_PORTB_BASE, GPIO_PIN_4, 0);         //Init the pin with 0
}

/**
 * Main function.
 *
 * @param[in] argc - not used, declared for compatibility
 * @param[in] argv - not used, declared for compatibility
 * @returns int    - not used, declared for compatibility
 */

int main()
{
    //
    // Run from the PLL at 120 MHz.
    // Note: SYSCTL_CFG_VCO_240 is a new setting provided in TivaWare 2.2.x and
    // later to better reflect the actual VCO speed due to SYSCTL#22.
    //
    ui32SysClock = SysCtlClockFreqSet((SYSCTL_XTAL_25MHZ |
                                       SYSCTL_OSC_MAIN |
                                       SYSCTL_USE_PLL |
                                       SYSCTL_CFG_VCO_240), 120000000);
	   
	GPIOInit();   

    /* Enter the ThreadX kernel.  */
    tx_kernel_enter();
}