// *** util.c *********************************************************
// this file implements generic utility functions.

#include "main.h"

void *
memcpy(void *d,  const void *s, size_t n)
{
    uint8 *dtemp = d;
    const uint8 *stemp = s;

    while (n--) {
        *(dtemp++) = *(stemp++);
    }
    return d;
}

void *
memset(void *p,  int d, size_t n)
{
    uint8 *ptemp = p;

    while (n--) {
        *(ptemp++) = d;
    }
    return p;
}

char *
strcpy(char *dest, const char *src)
{
    char *orig_dest = dest;

    do {
        *(dest++) = *src;
    } while (*(src++));

    return orig_dest;
}
