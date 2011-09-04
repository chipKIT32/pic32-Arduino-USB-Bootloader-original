//************************************************************************
//	flash.c
//
// this file implements the low level flash control and access.
//
// This file originated from the cpustick.com skeleton project from
// http://www.cpustick.com/downloads.htm and was originally written
// by Rich Testardi; please preserve this reference and share bug
// fixes with rich@testardi.com.
//************************************************************************

#include "main.h"


#if defined(_BOARD_MIKROE_MULTIMEDIA_) || defined(_BOARD_MIKROE_MIKROMEDIA_)
	#define _USE_WORD_WRITE_
#endif

#define	NVMOP_PAGE_ERASE		0x4004		//	Page erase operation
#define	NVMOP_WORD_PGM			0x4001		// Word program operation

//************************************************************************
static void	__attribute__((nomips16))	flash_operation(unsigned int nvmop)
{
	// Enable Flash Write/Erase Operations
	NVMCON = NVMCON_WREN | nvmop;

	NVMKEY = 0xAA996655;
	NVMKEY = 0x556699AA;
	NVMCONSET = NVMCON_WR;

	// Wait for WR bit to clear
	while (NVMCON & NVMCON_WR)
	{
		// NULL
	}
	ASSERT(!(NVMCON & NVMCON_WR));

	// Disable Flash Write/Erase operations
	NVMCONCLR = NVMCON_WREN;

	// assert no errors
	ASSERT(!(NVMCON & (_NVMCON_WRERR_MASK | _NVMCON_LVDERR_MASK)));
}

//************************************************************************
void	flash_erase_pages(uint32 *addr_in, uint32 npages_in)
{
int		saveSpl;
uint32	*addr;
uint32	npages;

#if SODEBUG
	int ii;
#endif


#ifdef _DEBUG_VIA_SERIAL_
	Serial_print("flash_erase_pages addr_in=");
	Serial_PrintLongWordHex(addr_in);
	Serial_print(" npages_in=");
	Serial_PrintLongWordHex(npages_in);
	Serial_println();
#endif

	addr	=	addr_in;
	npages	=	npages_in;


	saveSpl		=	splx(7);
	DMACONSET	=	_DMACON_SUSPEND_MASK;
	while (!DMACONbits.SUSPEND)
	{
		// NULL
	}

#ifdef _DEBUG_VIA_SERIAL_
	Serial_print("Starting errase at ");
	Serial_PrintLongWordHex((unsigned long)addr_in);
	Serial_print(" pg cnt= ");
	Serial_PrintLongWordHex((unsigned long)npages_in);
	Serial_println();
#endif
	// while there are more pages to erase...
	while (npages)
	{
#ifdef _USE_NVM_FUNCTIONS_
		NVMErasePage(addr);
#else
		// Convert Address to Physical Address
		NVMADDR = KVA_TO_PA((unsigned int) addr);

		// Unlock and Erase Page
		flash_operation(NVMOP_PAGE_ERASE);
#endif


		npages--;
		addr += FLASH_PAGE_SIZE / sizeof (uint32);
	}
#ifdef _DEBUG_VIA_SERIAL_
	Serial_print("DONE---pages erased");
	Serial_println();
#endif

	DMACONCLR = _DMACON_SUSPEND_MASK;
	(void) splx(saveSpl);

#if SODEBUG
	for (ii = 0; ii < npages_in * FLASH_PAGE_SIZE / sizeof (uint32); ii++)
	{
		assert(addr_in[ii] == -1);
	}
#endif
#ifdef _DEBUG_VIA_SERIAL_
	Serial_print("DONE---flash_erase_pages");
	Serial_println();
#endif
}

//************************************************************************
void	flash_write_words(uint32 *addr_in, uint32 *data_in, uint32 nwords_in)
{
#if SODEBUG
	int i;
#endif
	int saveSpl;
	uint32 *addr;
	uint32 *data;
	uint32 nwords;
#ifdef _USE_NVM_FUNCTIONS_
	unsigned char	pagebuff[4096];
	unsigned int	returnCode;
#endif

	addr		=	addr_in;
	data		=	data_in;
	nwords		=	nwords_in;

	saveSpl		=	splx(7);
	DMACONSET = _DMACON_SUSPEND_MASK;
	while (!DMACONbits.SUSPEND)
	{
		// NULL
	}


#ifdef _DEBUG_VIA_SERIAL_
	Serial_print("Starting program at ");
	Serial_PrintLongWordHex((unsigned long)addr_in);
	Serial_print(" word cnt= ");
	Serial_PrintLongWordHex((unsigned long)nwords_in);
	Serial_println();
#endif

#ifdef _USE_NVM_FUNCTIONS_

	#ifdef _USE_WORD_WRITE_
		unsigned int ii;
		
		for (ii=0; ii<nwords_in; ii++)
		{
		unsigned long	theLongWord;
		
			theLongWord	=	data_in[ii];
		
			NVMWriteWord(addr, theLongWord);

			
		//	addr	+=	4;
			addr++;
		}
	#else



		returnCode	=	NVMProgram(	addr_in,
									data_in,
									(nwords_in * 4),
									pagebuff);

	#endif

#else
	while (nwords--)
	{
		// Convert Address to Physical Address
		NVMADDR = KVA_TO_PA((unsigned int) addr);

		// Load data into NVMDATA register
		NVMDATA = *data;

		// Unlock and Write Word
		flash_operation(NVMOP_WORD_PGM);

		addr++;
		data++;
	}
#endif
	DMACONCLR = _DMACON_SUSPEND_MASK;
	(void) splx(saveSpl);

#if SODEBUG
	for (i = 0; i < nwords_in; i++)
	{
		assert(addr_in[i] == data_in[i]);
	}
#endif
}
