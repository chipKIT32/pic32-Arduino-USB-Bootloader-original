//************************************************************************
//	pic32bootloaderusb.c
//
// this file implements the main program loop of the PIC32 USB CDC/ACM
// avrdude bootloader that lives entirely in bootflash
//
// This file originated from the cpustick.com skeleton project from
// http://www.cpustick.com/downloads.htm and was originally written
// by Rich Testardi; please preserve this reference and share bug
// fixes with rich@testardi.com.
//
//************************************************************************
//	<MLS> = Mark Sproul msproul@skychariot.com
//************************************************************************
//*	Edit History
//************************************************************************
//*	Jul  1,	2011	<MLS> Adding #ifdefs for various boards
//*	Aug	25,	2011	<MLS> Added support for _BOARD_PIC32_USB_STARTER_KIT_
//*	Aug	25,	2011	<MLS> Added support for _BOARD_PIC32_ETHERNET_STARTER_KIT_
//*	Aug 27,	2011	<MLS> Adding serial debug
//*	Aug 28,	2011	<MLS> Discovered bug with pic32mx460F512L 801/PT 
//*	Aug 28,	2011	<MLS> Changed to NVM routines (added _USE_NVM_FUNCTIONS_)
//*	Dec  4,	2011	<MLS> Issue #4  Incomplete refactoring in avrbl_run
//************************************************************************

#include "main.h"

// our LED interface

#if defined(_BOARD_PIC32_USB_STARTER_KIT_) || defined(_BOARD_PIC32_ETHERNET_STARTER_KIT_)

	#define	PRGSWITCH			0					//*	PRGSWITCH active low

	//*	LED on port D bit 0
	#define	LEDTRIS				TRISDbits.TRISD0
	#define	LEDLAT				LATDbits.LATD0

	//*	switch on port D bit 6
	#define PRGTRIS				TRISDbits.TRISD6
	#define PRGPORT				PORTDbits.RD6

#elif defined(_BOARD_CEREBOT_32MX4_)
	#warning _BOARD_CEREBOT_32MX4_
	#define	PRGSWITCH			1					//*	PRGSWITCH active high

	//*	LED on port B, bit 10
	#define	LEDTRIS				TRISBbits.TRISB10	// RB10
	#define	LEDLAT				LATBbits.LATB10		// RB10

	//*	switch on port A bit 6
	#define PRGTRIS				TRISAbits.TRISA6	// RA6
	#define PRGPORT				PORTAbits.RA6		// RA6

#elif defined(_BOARD_CEREBOT_32MX7_)
	#warning _BOARD_CEREBOT_32MX7_

	#define	PRGSWITCH			0					//*	PRGSWITCH active low

	#define	LEDTRIS				TRISGbits.TRISG12	// RG12
	#define	LEDLAT				LATGbits.LATG12		// RG12
	// our PRG switch
	#define PRGTRIS				TRISGbits.TRISG6	// RG6
	#define PRGPORT				PORTGbits.RG6		// RG6

#elif defined(_BOARD_UBW32_MX460_) || defined(_BOARD_UBW32_MX795_)

	#define	PRGSWITCH			0					//*	PRGSWITCH active low

	#define	LEDTRIS				TRISEbits.TRISE0	// RE0
	#define	LEDLAT				LATEbits.LATE0		// RE0

	//*	switch on port E bit 7
	#define PRGTRIS				TRISEbits.TRISE7	// RE7
	#define PRGPORT				PORTEbits.RE7		// RE7


#elif defined(_BOARD_CUI32_)
	#warning _BOARD_CUI32_

	#define	PRGSWITCH			1					//*	PRGSWITCH active high

	#define	LEDTRIS				TRISEbits.TRISE0	// RE0
	#define	LEDLAT				LATEbits.LATE0		// RE0
	// our PRG switch
	#define PRGTRIS				TRISEbits.TRISE7	// RE7
	#define PRGPORT				PORTEbits.RE7		// RE7

#elif defined(_BOARD_MIKROE_MIKROMEDIA_)

	#define	PRGSWITCH			0					//*	PRGSWITCH active low

	//*	LED on port G bit 14
	#define	LEDTRIS				TRISGbits.TRISG13
	#define	LEDLAT				LATGbits.LATG13
	// our PRG switch
	#define PRGTRIS				TRISGbits.TRISG14
	#define PRGPORT				PORTGbits.RG14

#elif defined(_BOARD_MIKROE_MULTIMEDIA_)

	#define	PRGSWITCH			0					//*	PRGSWITCH active low

	//*	LED on port A bit 3
	#define	LEDTRIS				TRISAbits.TRISA3
	#define	LEDLAT				LATAbits.LATA3
	// our PRG switch
	#define PRGTRIS				TRISAbits.TRISA10
	#define PRGPORT				PORTAbits.RA10

#else
	#define	LEDTRIS				TRISEbits.TRISE0	// RE0
	#define	LEDLAT				LATEbits.LATE0		// RE0
	// our PRG switch
	#define PRGTRIS				TRISEbits.TRISE7	// RE7
	#define PRGPORT				PORTEbits.RE7		// RE7
#endif






// this is a 32 bit LED blink pattern that may be specified in the gcc configuration
#ifndef LEDBLINK
	#define	LEDBLINK	0x55aa55aa
#endif
#ifndef LEDXOR
	#define	LEDXOR		0
#endif

#if ! INTERRUPT
	#define LED_BLINK_LOOPS		100000	// about 4Hz
#else
	#define LED_BLINK_LOOPS		200000	// about 4Hz
#endif

// if PRGSWITCH is #defined, we'll loop for ever otherwise, we use a 10 second timer.
#ifdef PRGSWITCH
	#define AVRBL_LOOPS		0			// forever
#else
	#define AVRBL_LOOPS		8000000		// about 10 seconds
#endif

#define AVRBL_DELAY			400000		// about 0.5 seconds


// the stk500v2 state machine states
// see: http://www.atmel.com/dyn/resources/prod_documents/doc2591.pdf

enum
{
	STATE_START,
	STATE_GETSEQ,
	STATE_GETMS1,
	STATE_GETMS2,
	STATE_GETTOK,
	STATE_GETDATA,
	STATE_GETCSUM
};

// the stk500v2 constants
#define CMD_SIGN_ON						0x01
#define CMD_SET_PARAMETER				0x02
#define CMD_GET_PARAMETER				0x03
#define CMD_LOAD_ADDRESS				0x06
#define CMD_ENTER_PROGMODE_ISP			0x10
#define CMD_LEAVE_PROGMODE_ISP			0x11
#define CMD_CHIP_ERASE_ISP				0x12
#define CMD_PROGRAM_FLASH_ISP			0x13
#define CMD_READ_FLASH_ISP				0x14
#define CMD_SPI_MULTI					0x1D

#define STATUS_CMD_OK					0x00

#define SIGNATURE_BYTES 0x504943

// indicates stk500v2 protocol is active
static volatile bool	gActive;	// bootloader is active
static volatile uint	gLoaded;	// bootloader has loaded
static volatile uint	gLoops;
static bool				gErased;	// indicates flash has been erased

// stk500v2 request state
static int state	=	STATE_START;
static byte seq;
static int size;
static byte csum;

// stk500v2 request message
static bool ready;			// request has been received and is ready to process
static int requesti;		// number of request bytes
static byte request[1024];	// request buffer
#define REQUEST_OFFSET	2	// shift request buffer so flash data at byte offset 10 is 32-bit aligned

// stk500v2 reply message
static int replyi;			// number of reply bytes
static byte reply[1024];	// reply buffer



//*****************************************************************************
#ifdef _DEBUG_VIA_SERIAL_

#define	kDEBUG_BAUD_RATE	230400
#define	__PIC32_pbClk		80000000L

unsigned char	gOutputRvdData;

//*****************************************************************************
static void  Serial_begin(long buadRate)
{
	U1MODE				=	(UART_EN);
	U1STA				=	(UART_RX_ENABLE | UART_TX_ENABLE);
	U1BRG				=	(__PIC32_pbClk / 16 / (buadRate - 1));	// calculate actual BAUD generate value.
	U1MODEbits.UARTEN	=	0x01;
	U1STAbits.UTXEN		=	0x01;
	
	gOutputRvdData		=	false;
}

//*****************************************************************************
static void  Serial_write(char theChar)
{
	while (! U1STAbits.TRMT)
	{
		//*	wait for the buffer to be clear
	}
	U1TXREG	=	theChar;
}

//************************************************************************
static void 	Serial_PrintHexByte(unsigned char theByte)
{
char	theChar;

	theChar	=	0x30 + ((theByte >> 4) & 0x0f);
	if (theChar > 0x39)
	{
		theChar	+=	7;
	}
	Serial_write(theChar );

	theChar	=	0x30 + (theByte & 0x0f);
	if (theChar > 0x39)
	{
		theChar	+=	7;
	}
	Serial_write(theChar );
}

//************************************************************************
void 	Serial_PrintLongWordHex(unsigned long longWord)
{
	Serial_PrintHexByte((longWord >> 24) & 0x0ff);
	Serial_PrintHexByte((longWord >> 16) & 0x0ff);
	Serial_PrintHexByte((longWord >> 8) & 0x0ff);
	Serial_PrintHexByte(longWord & 0x0ff);
}


//*****************************************************************************
void  Serial_print(char *textString)
{
char			theChar;
unsigned int	ii;

	theChar		=	1;
	ii			=	0;
	while (theChar != 0)
	{
		theChar	=	textString[ii];
		if (theChar != 0)
		{
			Serial_write(theChar);
		}
		ii++;
	}
}
	
//*****************************************************************************
void  Serial_println(void)
{
	Serial_write(0x0d);
	Serial_write(0x0a);
}

//*****************************************************************************
static void DumpHex(unsigned long startAddress, unsigned char numRows)
{
#if 1
unsigned long	myAddressPointer;
unsigned char	ii;
unsigned char	theValue;
char			asciiDump[18];

unsigned char	*gFlashPtr;

	gFlashPtr			=	0x9D000000;
	theValue			=	0;
	myAddressPointer	=	startAddress;
	while (numRows > 0)
	{

		Serial_PrintLongWordHex(gFlashPtr);
		Serial_write('-');

		if (myAddressPointer > 0x10000)
		{
			Serial_PrintHexByte((myAddressPointer >> 16) & 0x00ff);
		}
		Serial_PrintHexByte((myAddressPointer >> 8) & 0x00ff);
		Serial_PrintHexByte(myAddressPointer & 0x00ff);
		Serial_print(" - ");

		asciiDump[0]		=	0;
		for (ii=0; ii<16; ii++)
		{
			theValue	=	gFlashPtr[myAddressPointer];

			Serial_PrintHexByte(theValue);
			Serial_write(0x20);
			if ((theValue >= 0x20) && (theValue < 0x7f))
			{
				asciiDump[ii % 16]	=	theValue;
			}
			else
			{
				asciiDump[ii % 16]	=	'.';
			}

			myAddressPointer++;
		}
		asciiDump[16]	=	0;
		Serial_print(asciiDump);
		Serial_println();

		numRows--;
	}
#endif
}

	#define	DEBUG_VIA_SERIAL(x)	Serial_print(x);Serial_println();
#else
	#define	DEBUG_VIA_SERIAL(x)
#endif


//************************************************************************
// this function handles the stk500v2 message protocol state machine
//************************************************************************
void avrbl_state_machine(byte rcvdByte)
{
#ifdef _DEBUG_VIA_SERIAL_
	if (gOutputRvdData)
	{
		Serial_PrintHexByte(rcvdByte);
		Serial_write(0x20);
		if (rcvdByte >= 0x20)
		{
			Serial_write(rcvdByte & 0x7f);
		}
		Serial_println();
	}
#endif


	csum	^=	rcvdByte;

	switch (state)
	{
		case STATE_START:
			if (rcvdByte == 27)
			{
				state	=	STATE_GETSEQ;
			}
			csum	=	rcvdByte;
			break;

		case STATE_GETSEQ:
			seq		=	rcvdByte;
			state	=	STATE_GETMS1;
			break;
			
		case STATE_GETMS1:
			size	=	rcvdByte << 8;
			state	=	STATE_GETMS2;
			break;
			
		case STATE_GETMS2:
			size	|=	rcvdByte;
			state	=	STATE_GETTOK;
			break;
			
		case STATE_GETTOK:
			if (rcvdByte == 14)
			{
				requesti	=	0;
				state	=	STATE_GETDATA;
			}
			else
			{
				state	=	STATE_START;
			}
			break;
			
		case STATE_GETDATA:
			request[REQUEST_OFFSET + requesti++]	=	rcvdByte;
			if (requesti == size)
			{
				state	=	STATE_GETCSUM;
			}
			break;
			
		case STATE_GETCSUM:
			if (csum)
			{
				assert(0);
			}
			else
			{
				ready	=	true;
			}
			state	=	STATE_START;
			break;
			
		default:
			ASSERT(0);
			break;
	}
}

//************************************************************************
// this function receives bytes from the CDC/ACM port
// N.B. if this routine returns false, cdcacm will drop the ball and we'll
// call cdcacm_command_ack() later to pick it up again.
//************************************************************************
bool avrbl_receive(const byte *buffer, int length)
{
	int ii;

	for (ii	= 0; ii < length; ii++)
	{
		avrbl_state_machine(buffer[ii]);
	}

	return true;
}

static volatile uint delay;

// this function jumps to the user application if it is present;
// it returns otherwise

//************************************************************************
void	jump_to_app(void)
{
//	DEBUG_VIA_SERIAL("jump_to_app");

	if (*(uint *) USER_APP_ADDR != -1)
	{
		// disconnect the USB device from the bus
		usb_uninitialize();

		// wait a small while
		for (delay = 0; delay < 10000000; delay++)
		{
			// NULL
		}

		// jump to the user application
		((void(*)(void))USER_APP_ADDR)();
	}
//	DEBUG_VIA_SERIAL("no program");
}

//************************************************************************
// this function sends bytes to the CDC/ACM port
//************************************************************************
void	avrbl_print(const byte *buffer, int length)
{
	if (cdcacm_attached && cdcacm_active)
	{
		cdcacm_print(buffer, length);
	}
}

//************************************************************************
// this function handle an stk500v2 message
//************************************************************************
void	avrbl_message(byte *request, int size)
{
	uint ii;
	uint nbytes;
	uint address;
	int rawi;
	byte raw[64];
	static uint load_address;		// load address for stk500v2 flash read/write operations
	static byte parameters[256];	// track stk500v2 parameters (we ignore them all)

	assert(!replyi);

	// our reply message always starts with the message and status bytes
	reply[replyi++]	=	*request;
	reply[replyi++]	=	STATUS_CMD_OK;

	// process the request message and generate additional reply message bytes
	switch (*request)
	{
		case CMD_SIGN_ON:
			DEBUG_VIA_SERIAL("CMD_SIGN_ON");
			
			gActive	=	true;
			gErased	=	false;
			reply[replyi++]	=	8;
			strcpy(reply + replyi, "STK500_2");
			replyi += 8;
			break;
			
		case CMD_SET_PARAMETER:
//			DEBUG_VIA_SERIAL("CMD_SET_PARAMETER");
			parameters[request[1]]	=	request[2];
			break;
			
		case CMD_GET_PARAMETER:
//			DEBUG_VIA_SERIAL("CMD_GET_PARAMETER");
			reply[replyi++]	=	parameters[request[1]];
			break;
			
		case CMD_ENTER_PROGMODE_ISP:
			DEBUG_VIA_SERIAL("CMD_ENTER_PROGMODE_ISP");
			break;
			
		case CMD_SPI_MULTI:
//			DEBUG_VIA_SERIAL("CMD_SPI_MULTI");
			reply[replyi++]	=	0;
			reply[replyi++]	=	request[4];
			reply[replyi++]	=	0;
			if (request[4] == 0x30)
			{
				if (request[6] == 0)
				{
					reply[replyi++]	=	(byte) (SIGNATURE_BYTES >> 16);
				}
				else if (request[6] == 1)
				{
					reply[replyi++]	=	(byte) (SIGNATURE_BYTES >> 8);
				}
				else
				{
					reply[replyi++]	=	(byte) SIGNATURE_BYTES;
				}
			}
			else if ((request[4] == 0x20) || (request[4] == 0x28))
			{
				//* read one byte from flash
				//* 0x20 is read odd byte
				//* 0x28 is read even byte

				//* read the even address
				address	=	(request[5] << 8) | (request[6]);
				//* the address is in 16 bit words
				address	=	address << 1;

				if (request[4] == 0x20)
				{
					reply[replyi++]	=	*(uint16 *) (FLASH_START + address);
				}
				else
				{
					reply[replyi++]	=	(*(uint16 *) (FLASH_START + address)) >> 8;
				}
			}
			else
			{
				reply[replyi++]	=	0;
			}
			reply[replyi++]	=	STATUS_CMD_OK;
			break;
			
		case CMD_CHIP_ERASE_ISP:
			DEBUG_VIA_SERIAL("CMD_SPI_MULTI");
			flash_erase_pages((void *) FLASH_START, FLASH_BYTES / FLASH_PAGE_SIZE);
			
		
			gErased	=	true;
			break;
			
		case CMD_LOAD_ADDRESS:
			DEBUG_VIA_SERIAL("CMD_LOAD_ADDRESS");
			load_address	=	(request[1] << 24) | (request[2] << 16) | (request[3] << 8) | (request[4]);
			//* the address is in 16 bit words
			load_address	=	load_address << 1;
			ASSERT((load_address & 3) == 0);
			break;
			
		case CMD_PROGRAM_FLASH_ISP:
			DEBUG_VIA_SERIAL("CMD_PROGRAM_FLASH_ISP");
			// if somebody forgot to do an erase...
			if (!gErased)
			{
//				DEBUG_VIA_SERIAL("CMD_PROGRAM_FLASH_ISP erasing");
				
				flash_erase_pages((void *) FLASH_START, FLASH_BYTES / FLASH_PAGE_SIZE);
				gErased	=	true;

//				DEBUG_VIA_SERIAL("CMD_PROGRAM_FLASH_ISP done erasing");
			#ifdef _DEBUG_VIA_SERIAL_
				DumpHex(0, 32);
			#endif
			}
			
			
			ASSERT(((uintptr) (request + 10)&3) == 0);
			nbytes	=	((request[1]) << 8) | (request[2]);
			ASSERT((nbytes & 3) == 0);
			flash_write_words((uint32 *) (FLASH_START + load_address), (uint32 *) (request + 10), nbytes / 4);
			load_address += nbytes;
			break;
			
		case CMD_READ_FLASH_ISP:
//			DEBUG_VIA_SERIAL("CMD_READ_FLASH_ISP");
			nbytes	=	((request[1]) << 8) | (request[2]);
			memcpy(reply + replyi, (void *) (FLASH_START + load_address), nbytes);
			replyi += nbytes;
			reply[replyi++]	=	STATUS_CMD_OK;
			load_address += nbytes;
			break;
			
		case CMD_LEAVE_PROGMODE_ISP:
			DEBUG_VIA_SERIAL("CMD_LEAVE_PROGMODE_ISP");
			gLoaded	=	gLoops;

		#ifdef _DEBUG_VIA_SERIAL_
			DumpHex(0, 32);
			Serial_println();
			DumpHex(0x1000, 64);
		#endif

			break;
			
		default:
			ASSERT(0);
			break;
	}

	// send our reply header
	rawi		=	0;
	raw[rawi++]	=	27;
	raw[rawi++]	=	seq;
	raw[rawi++]	=	replyi >> 8;
	raw[rawi++]	=	replyi;
	raw[rawi++]	=	14;
	csum		=	0;

	for (ii = 0; ii < rawi; ii++)
	{
		csum ^= raw[ii];
	}
	avrbl_print(raw, rawi);

	// send the reply message bytes
	for (ii = 0; ii < replyi; ii++)
	{
		csum ^= reply[ii];
	}
	avrbl_print(reply, replyi);

	// send the reply checksum
	avrbl_print(&csum, 1);

	replyi	=	0;
}

//************************************************************************
// this function implements the main avrdude bootloader program loop.
//************************************************************************
void	avrbl_run(void)
{
	uint bits;

#ifdef PRGSWITCH
	// configure the PRG switch
	PRGTRIS	=	1;

	// if the PRG switch is not pressed...
	if (PRGPORT != PRGSWITCH)
	{
		// launch the application!
		jump_to_app();
	}
#endif

	// configure the heartbeat LED
	LEDTRIS	=	0;


#ifdef _DEBUG_VIA_SERIAL_
	Serial_begin(kDEBUG_BAUD_RATE);

	Serial_println();
	Serial_print("USB-Bootloader debug");
	Serial_println();
	Serial_print(__VERSION__);
	Serial_println();
	Serial_print(__DATE__);
	Serial_println();

#endif


	// forever...
	bits	=	1;
	gLoops	=	0;
	for (;;)
	{
		// increment our loop counter
		gLoops++;

		// if it may be time for a blink...
		if (gLoops % LED_BLINK_LOOPS == 0)
		{
			// (circular) rotate bits left
			bits	=	(bits << 1) | !!(bits & 0x80000000);

			// blink the heartbeat LED with the specified pattern
			//			LEDLAT	=	!!(bits & LEDBLINK) ^ LEDXOR;
			//*	just blink, no need for any silly pattern
			LEDLAT	=	(gLoops / LED_BLINK_LOOPS) % 2;

		#ifndef PRGSWITCH
			// if we've been here too long without stk500v2 becoming active...
			if (gLoops >= AVRBL_LOOPS && !active)
			{
				// launch the application!
				jump_to_app();
			}
		#endif

			// if we've loaded the application and had a small delay...
			if (gLoaded && gLoops >= gLoaded + AVRBL_DELAY)
			{
				// launch the application!
				jump_to_app();
				gLoaded	=	false;
			}
		}

#if ! INTERRUPT
		// we poll the USB periodically
		usb_isr();
#endif

		// if we've received an stk500v2 request...
		if (ready)
		{
			// process it
			avrbl_message(request + REQUEST_OFFSET, requesti);
			ready	=	false;
		}
	}
}


//************************************************************************
// this function is called by the CDC/ACM transport when the USB device
// is reset.
//************************************************************************
static void	avrbl_reset_cbfn(void)
{
}

//************************************************************************
// this function is called by upper level code to register callback
// functions.
//************************************************************************
void	avrbl_initialize(void)
{
	cdcacm_register(avrbl_reset_cbfn);
}
