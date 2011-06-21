// *** ftdi.h *********************************************************

extern bool ftdi_active;

typedef void (*ftdi_reset_cbfn)(void);

void
ftdi_print(const byte *line, int length);

void
ftdi_command_ack(void);

void
ftdi_register(ftdi_reset_cbfn reset);  // revisit -- register receive upcall!

