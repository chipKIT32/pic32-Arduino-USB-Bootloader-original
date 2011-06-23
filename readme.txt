This project builds a simple Stk500v2 bootloader that is compatible with
avrdude and MPIDE (used on the chipKIT boards) for any PIC32 MX4, 5, 6, or 7
MCU.  The bootloader lives wholly in bootflash, leaving all primary flash
(0x9d000000 and higher) for use by applications.

When running the bootloader, the MCU exposes a CDC/ACM serial port function
out the USB, and you can configure avrdude or MPIDE to talk to it.  You
install the bootloader on your MCU using a Pickit3 or equivalent.

You need to install the Stk500v2.inf file to talk to the CDC/ACM port on
Windows (using the Microsoft driver usbser.sys -- the inf file just binds
a human-readable name "Stk500v2" to the VID/PID used by the CDC/ACM port).
Just right-click on Stk500v2.inf and select Install.

You can then use MPIDE to talk to the CDC/ACM port -- reset the board before
uploading your sketch (you have 10 seconds to get to the upload or else the
bootloader will transfer control to the previous sketch on the MCU).

If your board has a PRG switch (like CUI32 and UBW32), there is no 10 second
timeout.  Instead, the procedure is:

0. assume MCU is powered and connected to the USB
1. press the PRG button and reset the MCU (MCU will enter bootloader mode and
   enumerate CDC/ACM device and OS will create device file)
2. start MPIDE
3. Upload
4. when your code works, go to step 7
5. press the PRG button and reset the MCU (MCU will enter bootloader mode again)
6. go to step 3.
7. done!

To build bits in MPLAB X that can be loaded to the bootloader, you must use a
bootloader-compatible .ld file :chipKIT-MAX32-application-32MX795F512L.ld or
chipKIT-UNO32-application-32MX320F128L.ld.

You can see an example of how to do this in the StickOS skeleton project:
http://www.cpustick.com/downloads.htm

-- Rich Testardi (rich@testardi.com)

ISSUES
======

1. If you unpack this MPLAB X project to Mac or Linux, the Windows paths in
   the Makefiles will obviously be wrong -- you have to edit them by hand.
   "find . -type f | xargs grep -i c:\\\\" will show you where.

2. If you don't have a license for the optimizer (-Os), the bits won't fit
   by default in the first 8k of kseg0 bootflash.  You can edit the linker
   file to use 3.9k more space (still wholly within the 12k bootflash) by
   giving up some debug functionality that is rarely used with bootloaders.
   Just change boot-linkerscript.ld and grow this line:

     kseg0_boot_mem       (rx)  : ORIGIN = 0x9FC00490, LENGTH = 0x1B70

   You can easily grow it to 0x2B00 (not 0x2B70, or you'll wipe config bits!)
   by removing these lines:

     _DBG_CODE_ADDR           = 0xBFC02000;
     ...
       debug_exec_mem             : ORIGIN = 0xBFC02000, LENGTH = 0xFF0
     ...
       .dbg_code _DBG_CODE_ADDR (NOLOAD) :
       {
         . += (DEFINED (_DEBUGGER) ? 0xFF0 : 0x0);
       } > debug_exec_mem

// These files originated from the cpustick.com skeleton project from
// http://www.cpustick.com/downloads.htm and were originally written
// by Rich Testardi; please preserve this reference.
