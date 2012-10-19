#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-Microchip_USB_Starter_Kit.mk)" "nbproject/Makefile-local-Microchip_USB_Starter_Kit.mk"
include nbproject/Makefile-local-Microchip_USB_Starter_Kit.mk
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=Microchip_USB_Starter_Kit
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/avrbl.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/avrbl.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/592584297/cdcacm.o ${OBJECTDIR}/_ext/592584297/flash.o ${OBJECTDIR}/_ext/592584297/main.o ${OBJECTDIR}/_ext/592584297/pic32bootloaderusb.o ${OBJECTDIR}/_ext/592584297/usb.o ${OBJECTDIR}/_ext/592584297/util.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/592584297/cdcacm.o.d ${OBJECTDIR}/_ext/592584297/flash.o.d ${OBJECTDIR}/_ext/592584297/main.o.d ${OBJECTDIR}/_ext/592584297/pic32bootloaderusb.o.d ${OBJECTDIR}/_ext/592584297/usb.o.d ${OBJECTDIR}/_ext/592584297/util.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/592584297/cdcacm.o ${OBJECTDIR}/_ext/592584297/flash.o ${OBJECTDIR}/_ext/592584297/main.o ${OBJECTDIR}/_ext/592584297/pic32bootloaderusb.o ${OBJECTDIR}/_ext/592584297/usb.o ${OBJECTDIR}/_ext/592584297/util.o


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
	${MAKE} ${MAKE_OPTIONS} -f nbproject/Makefile-Microchip_USB_Starter_Kit.mk dist/${CND_CONF}/${IMAGE_TYPE}/avrbl.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MX795F512L
MP_LINKER_FILE_OPTION=,--script="..\boot-linkerscript.ld"
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/592584297/cdcacm.o: ../sources/cdcacm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/592584297 
	@${RM} ${OBJECTDIR}/_ext/592584297/cdcacm.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/592584297/cdcacm.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -mno-float -D_BOARD_PIC32_USB_STARTER_KIT_ -I".." -I"../sources" -Os -fomit-frame-pointer -MMD -MF "${OBJECTDIR}/_ext/592584297/cdcacm.o.d" -o ${OBJECTDIR}/_ext/592584297/cdcacm.o ../sources/cdcacm.c   -fno-builtin
	
${OBJECTDIR}/_ext/592584297/flash.o: ../sources/flash.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/592584297 
	@${RM} ${OBJECTDIR}/_ext/592584297/flash.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/592584297/flash.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -mno-float -D_BOARD_PIC32_USB_STARTER_KIT_ -I".." -I"../sources" -Os -fomit-frame-pointer -MMD -MF "${OBJECTDIR}/_ext/592584297/flash.o.d" -o ${OBJECTDIR}/_ext/592584297/flash.o ../sources/flash.c   -fno-builtin
	
${OBJECTDIR}/_ext/592584297/main.o: ../sources/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/592584297 
	@${RM} ${OBJECTDIR}/_ext/592584297/main.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/592584297/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -mno-float -D_BOARD_PIC32_USB_STARTER_KIT_ -I".." -I"../sources" -Os -fomit-frame-pointer -MMD -MF "${OBJECTDIR}/_ext/592584297/main.o.d" -o ${OBJECTDIR}/_ext/592584297/main.o ../sources/main.c   -fno-builtin
	
${OBJECTDIR}/_ext/592584297/pic32bootloaderusb.o: ../sources/pic32bootloaderusb.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/592584297 
	@${RM} ${OBJECTDIR}/_ext/592584297/pic32bootloaderusb.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/592584297/pic32bootloaderusb.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -mno-float -D_BOARD_PIC32_USB_STARTER_KIT_ -I".." -I"../sources" -Os -fomit-frame-pointer -MMD -MF "${OBJECTDIR}/_ext/592584297/pic32bootloaderusb.o.d" -o ${OBJECTDIR}/_ext/592584297/pic32bootloaderusb.o ../sources/pic32bootloaderusb.c   -fno-builtin
	
${OBJECTDIR}/_ext/592584297/usb.o: ../sources/usb.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/592584297 
	@${RM} ${OBJECTDIR}/_ext/592584297/usb.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/592584297/usb.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -mno-float -D_BOARD_PIC32_USB_STARTER_KIT_ -I".." -I"../sources" -Os -fomit-frame-pointer -MMD -MF "${OBJECTDIR}/_ext/592584297/usb.o.d" -o ${OBJECTDIR}/_ext/592584297/usb.o ../sources/usb.c   -fno-builtin
	
${OBJECTDIR}/_ext/592584297/util.o: ../sources/util.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/592584297 
	@${RM} ${OBJECTDIR}/_ext/592584297/util.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/592584297/util.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -mno-float -D_BOARD_PIC32_USB_STARTER_KIT_ -I".." -I"../sources" -Os -fomit-frame-pointer -MMD -MF "${OBJECTDIR}/_ext/592584297/util.o.d" -o ${OBJECTDIR}/_ext/592584297/util.o ../sources/util.c   -fno-builtin
	
else
${OBJECTDIR}/_ext/592584297/cdcacm.o: ../sources/cdcacm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/592584297 
	@${RM} ${OBJECTDIR}/_ext/592584297/cdcacm.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/592584297/cdcacm.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -mno-float -D_BOARD_PIC32_USB_STARTER_KIT_ -I".." -I"../sources" -Os -fomit-frame-pointer -MMD -MF "${OBJECTDIR}/_ext/592584297/cdcacm.o.d" -o ${OBJECTDIR}/_ext/592584297/cdcacm.o ../sources/cdcacm.c   -fno-builtin
	
${OBJECTDIR}/_ext/592584297/flash.o: ../sources/flash.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/592584297 
	@${RM} ${OBJECTDIR}/_ext/592584297/flash.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/592584297/flash.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -mno-float -D_BOARD_PIC32_USB_STARTER_KIT_ -I".." -I"../sources" -Os -fomit-frame-pointer -MMD -MF "${OBJECTDIR}/_ext/592584297/flash.o.d" -o ${OBJECTDIR}/_ext/592584297/flash.o ../sources/flash.c   -fno-builtin
	
${OBJECTDIR}/_ext/592584297/main.o: ../sources/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/592584297 
	@${RM} ${OBJECTDIR}/_ext/592584297/main.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/592584297/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -mno-float -D_BOARD_PIC32_USB_STARTER_KIT_ -I".." -I"../sources" -Os -fomit-frame-pointer -MMD -MF "${OBJECTDIR}/_ext/592584297/main.o.d" -o ${OBJECTDIR}/_ext/592584297/main.o ../sources/main.c   -fno-builtin
	
${OBJECTDIR}/_ext/592584297/pic32bootloaderusb.o: ../sources/pic32bootloaderusb.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/592584297 
	@${RM} ${OBJECTDIR}/_ext/592584297/pic32bootloaderusb.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/592584297/pic32bootloaderusb.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -mno-float -D_BOARD_PIC32_USB_STARTER_KIT_ -I".." -I"../sources" -Os -fomit-frame-pointer -MMD -MF "${OBJECTDIR}/_ext/592584297/pic32bootloaderusb.o.d" -o ${OBJECTDIR}/_ext/592584297/pic32bootloaderusb.o ../sources/pic32bootloaderusb.c   -fno-builtin
	
${OBJECTDIR}/_ext/592584297/usb.o: ../sources/usb.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/592584297 
	@${RM} ${OBJECTDIR}/_ext/592584297/usb.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/592584297/usb.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -mno-float -D_BOARD_PIC32_USB_STARTER_KIT_ -I".." -I"../sources" -Os -fomit-frame-pointer -MMD -MF "${OBJECTDIR}/_ext/592584297/usb.o.d" -o ${OBJECTDIR}/_ext/592584297/usb.o ../sources/usb.c   -fno-builtin
	
${OBJECTDIR}/_ext/592584297/util.o: ../sources/util.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/592584297 
	@${RM} ${OBJECTDIR}/_ext/592584297/util.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/592584297/util.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -mno-float -D_BOARD_PIC32_USB_STARTER_KIT_ -I".." -I"../sources" -Os -fomit-frame-pointer -MMD -MF "${OBJECTDIR}/_ext/592584297/util.o.d" -o ${OBJECTDIR}/_ext/592584297/util.o ../sources/util.c   -fno-builtin
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/avrbl.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mdebugger -D__MPLAB_DEBUGGER_ICD3=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/avrbl.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}       -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__ICD2RAM=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_ICD3=1,--defsym=_min_heap_size=0,--defsym=_min_stack_size=3072,--gc-sections,-L"../../../../Program Files/Microchip/MPLAB C32/lib",-L"../../../../Program Files/Microchip/MPLAB C32/pic32mx/lib",-Map="$(BINDIR_)$(TARGETBASE).map" 
else
dist/${CND_CONF}/${IMAGE_TYPE}/avrbl.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/avrbl.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}       -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=0,--defsym=_min_stack_size=3072,--gc-sections,-L"../../../../Program Files/Microchip/MPLAB C32/lib",-L"../../../../Program Files/Microchip/MPLAB C32/pic32mx/lib",-Map="$(BINDIR_)$(TARGETBASE).map"
	${MP_CC_DIR}\\pic32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/avrbl.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/Microchip_USB_Starter_Kit
	${RM} -r dist/Microchip_USB_Starter_Kit

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
