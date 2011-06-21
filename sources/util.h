// *** util.h *********************************************************

// N.B. the usb controller bdt data structures and the usb protocol
// layers are defined to be little endian and the coldfire core is
// big endian, so we have to byteswap.  the zigflea transceiver and
// protocol layers are defined to be big endian and the pic32 core
// is little endian, so we have to byteswap.

#define TF_LITTLE(x)  (x)

void *
memcpy(void *d,  const void *s, size_t n);

void *
memset(void *p,  int d, size_t n);

char *
strcpy(char *dest, const char *src);
