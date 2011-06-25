// *** main.h ******************************************************************

#ifndef MAIN_INCLUDED

// enable SODEBUG to enable assert()s; ASSERT()s are always enabled
#define SODEBUG  1
#define DEBUGGING  1

#define INTERRUPT  0

#if ! INTERRUPT
#define splx(x)  x
#endif

#define NULL ((void*)0)

#define FLASH_START  0x9D000000
#define FLASH_BYTES  (256*1024)  // the smallest part we support
#define FLASH_PAGE_SIZE  4096

#define USER_APP_ADDR  0x9D001000

#define asm_halt()  asm("SDBBP");

#include <plib.h>
typedef char int8;
typedef unsigned char uint8;
typedef short int16;
typedef unsigned short uint16;
typedef int int32;
typedef unsigned int uint32;
typedef int intptr;
typedef unsigned int uintptr;

typedef unsigned char bool;
typedef unsigned char byte;
typedef unsigned int uint;

enum {
    false,
    true
};

#define IN
#define OUT
#define OPTIONAL
#define VARIABLE  1
#define MIN(a, b)  ((a) < (b) ? (a) : (b))
#define MAX(a, b)  ((a) > (b) ? (a) : (b))
#define ROUNDUP(n, s)  (((n)+(s)-1)&~((s)-1))  // N.B. s must be power of 2!
#define ROUNDDOWN(n, s)  ((n)&~((s)-1))  // N.B. s must be power of 2!
#define LENGTHOF(a)  (sizeof(a)/sizeof(a[0]))
#define OFFSETOF(t, f)  ((int)(intptr)(&((t *)0)->f))
#define IS_POWER_OF_2(x) ((((x)-1)&(x))==0)

extern uint32 cpu_frequency;
extern uint32 oscillator_frequency;
extern uint32 bus_frequency;

#include <stdarg.h>

#include "flash.h"
#include "cdcacm.h"
#include "usb.h"
#include "util.h"

#include "avrbl.h"

#if SODEBUG
#define assert(x)  do { if (! (x)) { asm_halt(); } } while (0)
#else
#define assert(x)
#endif

#define ASSERT(x)  do { if (! (x)) { asm_halt(); } } while (0)

#define MAIN_INCLUDED  1
#endif  // MAIN_INCLUDED
