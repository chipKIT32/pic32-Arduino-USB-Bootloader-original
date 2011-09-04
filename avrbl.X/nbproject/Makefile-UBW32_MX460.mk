#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
include Makefile

# Environment
MKDIR=mkdir -p
RM=rm -f 
CP=cp 

# Macros
CND_CONF=UBW32_MX460
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/avrbl.X.${IMAGE_TYPE}.elf
else
IMAGE_TYPE=production
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/avrbl.X.${IMAGE_TYPE}.elf
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1472/nvm_operation_lib.o ${OBJECTDIR}/_ext/592584297/cdcacm.o ${OBJECTDIR}/_ext/592584297/flash.o ${OBJECTDIR}/_ext/592584297/main.o ${OBJECTDIR}/_ext/592584297/pic32bootloaderusb.o ${OBJECTDIR}/_ext/592584297/usb.o ${OBJECTDIR}/_ext/592584297/util.o


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

# Path to java used to run MPLAB X when this makefile was created
MP_JAVA_PATH=/System/Library/Frameworks/JavaVM.framework/Versions/1.6.0/Home/bin/
OS_CURRENT="$(shell uname -s)"
############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
MP_CC=/Applications/microchip/mplabc32/v1.11a/bin/pic32-gcc
# MP_BC is not defined
MP_AS=/Applications/microchip/mplabc32/v1.11a/bin/pic32-as
MP_LD=/Applications/microchip/mplabc32/v1.11a/bin/pic32-ld
MP_AR=/Applications/microchip/mplabc32/v1.11a/bin/pic32-ar
# MP_BC is not defined
MP_CC_DIR=/Applications/microchip/mplabc32/v1.11a/bin
# MP_BC_DIR is not defined
MP_AS_DIR=/Applications/microchip/mplabc32/v1.11a/bin
MP_LD_DIR=/Applications/microchip/mplabc32/v1.11a/bin
MP_AR_DIR=/Applications/microchip/mplabc32/v1.11a/bin
# MP_BC_DIR is not defined

.build-conf: ${BUILD_SUBPROJECTS}
	${MAKE}  -f nbproject/Makefile-UBW32_MX460.mk dist/${CND_CONF}/${IMAGE_TYPE}/avrbl.X.${IMAGE_TYPE}.elf

MP_PROCESSOR_OPTION=32MX460F512L
MP_LINKER_FILE_OPTION=,--script=../boot-linkerscript.ld
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
${OBJECTDIR}/_ext/592584297/usb.o: ../sources/usb.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/592584297 
	@${RM} ${OBJECTDIR}/_ext/592584297/usb.o.d 
	@${RM} ${OBJECTDIR}/_ext/592584297/usb.o.ok ${OBJECTDIR}/_ext/592584297/usb.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -mno-float -D_BOARD_UBW32_MX460_ -I".." -I"../sources" -Os -fomit-frame-pointer -fno-builtin -MMD -MF ${OBJECTDIR}/_ext/592584297/usb.o.d -o ${OBJECTDIR}/_ext/592584297/usb.o ../sources/usb.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -mno-float -D_BOARD_UBW32_MX460_ -I".." -I"../sources" -Os -fomit-frame-pointer -fno-builtin -MMD -MF ${OBJECTDIR}/_ext/592584297/usb.o.d -o ${OBJECTDIR}/_ext/592584297/usb.o ../sources/usb.c   2>&1  > ${OBJECTDIR}/_ext/592584297/usb.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/_ext/592584297/usb.o.ok ; fi 
	@touch ${OBJECTDIR}/_ext/592584297/usb.o.d 
	
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/592584297/usb.o.d > ${OBJECTDIR}/_ext/592584297/usb.o.tmp
	@${RM} ${OBJECTDIR}/_ext/592584297/usb.o.d 
	@${CP} ${OBJECTDIR}/_ext/592584297/usb.o.tmp ${OBJECTDIR}/_ext/592584297/usb.o.d 
	@${RM} ${OBJECTDIR}/_ext/592584297/usb.o.tmp
endif
	@touch ${OBJECTDIR}/_ext/592584297/usb.o.err 
	@cat ${OBJECTDIR}/_ext/592584297/usb.o.err 
	@if [ -f ${OBJECTDIR}/_ext/592584297/usb.o.ok ] ; then rm -f ${OBJECTDIR}/_ext/592584297/usb.o.ok; else exit 1; fi
	
${OBJECTDIR}/_ext/1472/nvm_operation_lib.o: ../nvm_operation_lib.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/nvm_operation_lib.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/nvm_operation_lib.o.ok ${OBJECTDIR}/_ext/1472/nvm_operation_lib.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -mno-float -D_BOARD_UBW32_MX460_ -I".." -I"../sources" -Os -fomit-frame-pointer -fno-builtin -MMD -MF ${OBJECTDIR}/_ext/1472/nvm_operation_lib.o.d -o ${OBJECTDIR}/_ext/1472/nvm_operation_lib.o ../nvm_operation_lib.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -mno-float -D_BOARD_UBW32_MX460_ -I".." -I"../sources" -Os -fomit-frame-pointer -fno-builtin -MMD -MF ${OBJECTDIR}/_ext/1472/nvm_operation_lib.o.d -o ${OBJECTDIR}/_ext/1472/nvm_operation_lib.o ../nvm_operation_lib.c   2>&1  > ${OBJECTDIR}/_ext/1472/nvm_operation_lib.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/_ext/1472/nvm_operation_lib.o.ok ; fi 
	@touch ${OBJECTDIR}/_ext/1472/nvm_operation_lib.o.d 
	
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/1472/nvm_operation_lib.o.d > ${OBJECTDIR}/_ext/1472/nvm_operation_lib.o.tmp
	@${RM} ${OBJECTDIR}/_ext/1472/nvm_operation_lib.o.d 
	@${CP} ${OBJECTDIR}/_ext/1472/nvm_operation_lib.o.tmp ${OBJECTDIR}/_ext/1472/nvm_operation_lib.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/nvm_operation_lib.o.tmp
endif
	@touch ${OBJECTDIR}/_ext/1472/nvm_operation_lib.o.err 
	@cat ${OBJECTDIR}/_ext/1472/nvm_operation_lib.o.err 
	@if [ -f ${OBJECTDIR}/_ext/1472/nvm_operation_lib.o.ok ] ; then rm -f ${OBJECTDIR}/_ext/1472/nvm_operation_lib.o.ok; else exit 1; fi
	
${OBJECTDIR}/_ext/592584297/main.o: ../sources/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/592584297 
	@${RM} ${OBJECTDIR}/_ext/592584297/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/592584297/main.o.ok ${OBJECTDIR}/_ext/592584297/main.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -mno-float -D_BOARD_UBW32_MX460_ -I".." -I"../sources" -Os -fomit-frame-pointer -fno-builtin -MMD -MF ${OBJECTDIR}/_ext/592584297/main.o.d -o ${OBJECTDIR}/_ext/592584297/main.o ../sources/main.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -mno-float -D_BOARD_UBW32_MX460_ -I".." -I"../sources" -Os -fomit-frame-pointer -fno-builtin -MMD -MF ${OBJECTDIR}/_ext/592584297/main.o.d -o ${OBJECTDIR}/_ext/592584297/main.o ../sources/main.c   2>&1  > ${OBJECTDIR}/_ext/592584297/main.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/_ext/592584297/main.o.ok ; fi 
	@touch ${OBJECTDIR}/_ext/592584297/main.o.d 
	
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/592584297/main.o.d > ${OBJECTDIR}/_ext/592584297/main.o.tmp
	@${RM} ${OBJECTDIR}/_ext/592584297/main.o.d 
	@${CP} ${OBJECTDIR}/_ext/592584297/main.o.tmp ${OBJECTDIR}/_ext/592584297/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/592584297/main.o.tmp
endif
	@touch ${OBJECTDIR}/_ext/592584297/main.o.err 
	@cat ${OBJECTDIR}/_ext/592584297/main.o.err 
	@if [ -f ${OBJECTDIR}/_ext/592584297/main.o.ok ] ; then rm -f ${OBJECTDIR}/_ext/592584297/main.o.ok; else exit 1; fi
	
${OBJECTDIR}/_ext/592584297/flash.o: ../sources/flash.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/592584297 
	@${RM} ${OBJECTDIR}/_ext/592584297/flash.o.d 
	@${RM} ${OBJECTDIR}/_ext/592584297/flash.o.ok ${OBJECTDIR}/_ext/592584297/flash.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -mno-float -D_BOARD_UBW32_MX460_ -I".." -I"../sources" -Os -fomit-frame-pointer -fno-builtin -MMD -MF ${OBJECTDIR}/_ext/592584297/flash.o.d -o ${OBJECTDIR}/_ext/592584297/flash.o ../sources/flash.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -mno-float -D_BOARD_UBW32_MX460_ -I".." -I"../sources" -Os -fomit-frame-pointer -fno-builtin -MMD -MF ${OBJECTDIR}/_ext/592584297/flash.o.d -o ${OBJECTDIR}/_ext/592584297/flash.o ../sources/flash.c   2>&1  > ${OBJECTDIR}/_ext/592584297/flash.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/_ext/592584297/flash.o.ok ; fi 
	@touch ${OBJECTDIR}/_ext/592584297/flash.o.d 
	
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/592584297/flash.o.d > ${OBJECTDIR}/_ext/592584297/flash.o.tmp
	@${RM} ${OBJECTDIR}/_ext/592584297/flash.o.d 
	@${CP} ${OBJECTDIR}/_ext/592584297/flash.o.tmp ${OBJECTDIR}/_ext/592584297/flash.o.d 
	@${RM} ${OBJECTDIR}/_ext/592584297/flash.o.tmp
endif
	@touch ${OBJECTDIR}/_ext/592584297/flash.o.err 
	@cat ${OBJECTDIR}/_ext/592584297/flash.o.err 
	@if [ -f ${OBJECTDIR}/_ext/592584297/flash.o.ok ] ; then rm -f ${OBJECTDIR}/_ext/592584297/flash.o.ok; else exit 1; fi
	
${OBJECTDIR}/_ext/592584297/cdcacm.o: ../sources/cdcacm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/592584297 
	@${RM} ${OBJECTDIR}/_ext/592584297/cdcacm.o.d 
	@${RM} ${OBJECTDIR}/_ext/592584297/cdcacm.o.ok ${OBJECTDIR}/_ext/592584297/cdcacm.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -mno-float -D_BOARD_UBW32_MX460_ -I".." -I"../sources" -Os -fomit-frame-pointer -fno-builtin -MMD -MF ${OBJECTDIR}/_ext/592584297/cdcacm.o.d -o ${OBJECTDIR}/_ext/592584297/cdcacm.o ../sources/cdcacm.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -mno-float -D_BOARD_UBW32_MX460_ -I".." -I"../sources" -Os -fomit-frame-pointer -fno-builtin -MMD -MF ${OBJECTDIR}/_ext/592584297/cdcacm.o.d -o ${OBJECTDIR}/_ext/592584297/cdcacm.o ../sources/cdcacm.c   2>&1  > ${OBJECTDIR}/_ext/592584297/cdcacm.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/_ext/592584297/cdcacm.o.ok ; fi 
	@touch ${OBJECTDIR}/_ext/592584297/cdcacm.o.d 
	
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/592584297/cdcacm.o.d > ${OBJECTDIR}/_ext/592584297/cdcacm.o.tmp
	@${RM} ${OBJECTDIR}/_ext/592584297/cdcacm.o.d 
	@${CP} ${OBJECTDIR}/_ext/592584297/cdcacm.o.tmp ${OBJECTDIR}/_ext/592584297/cdcacm.o.d 
	@${RM} ${OBJECTDIR}/_ext/592584297/cdcacm.o.tmp
endif
	@touch ${OBJECTDIR}/_ext/592584297/cdcacm.o.err 
	@cat ${OBJECTDIR}/_ext/592584297/cdcacm.o.err 
	@if [ -f ${OBJECTDIR}/_ext/592584297/cdcacm.o.ok ] ; then rm -f ${OBJECTDIR}/_ext/592584297/cdcacm.o.ok; else exit 1; fi
	
${OBJECTDIR}/_ext/592584297/pic32bootloaderusb.o: ../sources/pic32bootloaderusb.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/592584297 
	@${RM} ${OBJECTDIR}/_ext/592584297/pic32bootloaderusb.o.d 
	@${RM} ${OBJECTDIR}/_ext/592584297/pic32bootloaderusb.o.ok ${OBJECTDIR}/_ext/592584297/pic32bootloaderusb.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -mno-float -D_BOARD_UBW32_MX460_ -I".." -I"../sources" -Os -fomit-frame-pointer -fno-builtin -MMD -MF ${OBJECTDIR}/_ext/592584297/pic32bootloaderusb.o.d -o ${OBJECTDIR}/_ext/592584297/pic32bootloaderusb.o ../sources/pic32bootloaderusb.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -mno-float -D_BOARD_UBW32_MX460_ -I".." -I"../sources" -Os -fomit-frame-pointer -fno-builtin -MMD -MF ${OBJECTDIR}/_ext/592584297/pic32bootloaderusb.o.d -o ${OBJECTDIR}/_ext/592584297/pic32bootloaderusb.o ../sources/pic32bootloaderusb.c   2>&1  > ${OBJECTDIR}/_ext/592584297/pic32bootloaderusb.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/_ext/592584297/pic32bootloaderusb.o.ok ; fi 
	@touch ${OBJECTDIR}/_ext/592584297/pic32bootloaderusb.o.d 
	
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/592584297/pic32bootloaderusb.o.d > ${OBJECTDIR}/_ext/592584297/pic32bootloaderusb.o.tmp
	@${RM} ${OBJECTDIR}/_ext/592584297/pic32bootloaderusb.o.d 
	@${CP} ${OBJECTDIR}/_ext/592584297/pic32bootloaderusb.o.tmp ${OBJECTDIR}/_ext/592584297/pic32bootloaderusb.o.d 
	@${RM} ${OBJECTDIR}/_ext/592584297/pic32bootloaderusb.o.tmp
endif
	@touch ${OBJECTDIR}/_ext/592584297/pic32bootloaderusb.o.err 
	@cat ${OBJECTDIR}/_ext/592584297/pic32bootloaderusb.o.err 
	@if [ -f ${OBJECTDIR}/_ext/592584297/pic32bootloaderusb.o.ok ] ; then rm -f ${OBJECTDIR}/_ext/592584297/pic32bootloaderusb.o.ok; else exit 1; fi
	
${OBJECTDIR}/_ext/592584297/util.o: ../sources/util.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/592584297 
	@${RM} ${OBJECTDIR}/_ext/592584297/util.o.d 
	@${RM} ${OBJECTDIR}/_ext/592584297/util.o.ok ${OBJECTDIR}/_ext/592584297/util.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -mno-float -D_BOARD_UBW32_MX460_ -I".." -I"../sources" -Os -fomit-frame-pointer -fno-builtin -MMD -MF ${OBJECTDIR}/_ext/592584297/util.o.d -o ${OBJECTDIR}/_ext/592584297/util.o ../sources/util.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -mno-float -D_BOARD_UBW32_MX460_ -I".." -I"../sources" -Os -fomit-frame-pointer -fno-builtin -MMD -MF ${OBJECTDIR}/_ext/592584297/util.o.d -o ${OBJECTDIR}/_ext/592584297/util.o ../sources/util.c   2>&1  > ${OBJECTDIR}/_ext/592584297/util.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/_ext/592584297/util.o.ok ; fi 
	@touch ${OBJECTDIR}/_ext/592584297/util.o.d 
	
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/592584297/util.o.d > ${OBJECTDIR}/_ext/592584297/util.o.tmp
	@${RM} ${OBJECTDIR}/_ext/592584297/util.o.d 
	@${CP} ${OBJECTDIR}/_ext/592584297/util.o.tmp ${OBJECTDIR}/_ext/592584297/util.o.d 
	@${RM} ${OBJECTDIR}/_ext/592584297/util.o.tmp
endif
	@touch ${OBJECTDIR}/_ext/592584297/util.o.err 
	@cat ${OBJECTDIR}/_ext/592584297/util.o.err 
	@if [ -f ${OBJECTDIR}/_ext/592584297/util.o.ok ] ; then rm -f ${OBJECTDIR}/_ext/592584297/util.o.ok; else exit 1; fi
	
else
${OBJECTDIR}/_ext/592584297/usb.o: ../sources/usb.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/592584297 
	@${RM} ${OBJECTDIR}/_ext/592584297/usb.o.d 
	@${RM} ${OBJECTDIR}/_ext/592584297/usb.o.ok ${OBJECTDIR}/_ext/592584297/usb.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -mno-float -D_BOARD_UBW32_MX460_ -I".." -I"../sources" -Os -fomit-frame-pointer -fno-builtin -MMD -MF ${OBJECTDIR}/_ext/592584297/usb.o.d -o ${OBJECTDIR}/_ext/592584297/usb.o ../sources/usb.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -mno-float -D_BOARD_UBW32_MX460_ -I".." -I"../sources" -Os -fomit-frame-pointer -fno-builtin -MMD -MF ${OBJECTDIR}/_ext/592584297/usb.o.d -o ${OBJECTDIR}/_ext/592584297/usb.o ../sources/usb.c   2>&1  > ${OBJECTDIR}/_ext/592584297/usb.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/_ext/592584297/usb.o.ok ; fi 
	@touch ${OBJECTDIR}/_ext/592584297/usb.o.d 
	
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/592584297/usb.o.d > ${OBJECTDIR}/_ext/592584297/usb.o.tmp
	@${RM} ${OBJECTDIR}/_ext/592584297/usb.o.d 
	@${CP} ${OBJECTDIR}/_ext/592584297/usb.o.tmp ${OBJECTDIR}/_ext/592584297/usb.o.d 
	@${RM} ${OBJECTDIR}/_ext/592584297/usb.o.tmp
endif
	@touch ${OBJECTDIR}/_ext/592584297/usb.o.err 
	@cat ${OBJECTDIR}/_ext/592584297/usb.o.err 
	@if [ -f ${OBJECTDIR}/_ext/592584297/usb.o.ok ] ; then rm -f ${OBJECTDIR}/_ext/592584297/usb.o.ok; else exit 1; fi
	
${OBJECTDIR}/_ext/1472/nvm_operation_lib.o: ../nvm_operation_lib.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/nvm_operation_lib.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/nvm_operation_lib.o.ok ${OBJECTDIR}/_ext/1472/nvm_operation_lib.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -mno-float -D_BOARD_UBW32_MX460_ -I".." -I"../sources" -Os -fomit-frame-pointer -fno-builtin -MMD -MF ${OBJECTDIR}/_ext/1472/nvm_operation_lib.o.d -o ${OBJECTDIR}/_ext/1472/nvm_operation_lib.o ../nvm_operation_lib.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -mno-float -D_BOARD_UBW32_MX460_ -I".." -I"../sources" -Os -fomit-frame-pointer -fno-builtin -MMD -MF ${OBJECTDIR}/_ext/1472/nvm_operation_lib.o.d -o ${OBJECTDIR}/_ext/1472/nvm_operation_lib.o ../nvm_operation_lib.c   2>&1  > ${OBJECTDIR}/_ext/1472/nvm_operation_lib.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/_ext/1472/nvm_operation_lib.o.ok ; fi 
	@touch ${OBJECTDIR}/_ext/1472/nvm_operation_lib.o.d 
	
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/1472/nvm_operation_lib.o.d > ${OBJECTDIR}/_ext/1472/nvm_operation_lib.o.tmp
	@${RM} ${OBJECTDIR}/_ext/1472/nvm_operation_lib.o.d 
	@${CP} ${OBJECTDIR}/_ext/1472/nvm_operation_lib.o.tmp ${OBJECTDIR}/_ext/1472/nvm_operation_lib.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/nvm_operation_lib.o.tmp
endif
	@touch ${OBJECTDIR}/_ext/1472/nvm_operation_lib.o.err 
	@cat ${OBJECTDIR}/_ext/1472/nvm_operation_lib.o.err 
	@if [ -f ${OBJECTDIR}/_ext/1472/nvm_operation_lib.o.ok ] ; then rm -f ${OBJECTDIR}/_ext/1472/nvm_operation_lib.o.ok; else exit 1; fi
	
${OBJECTDIR}/_ext/592584297/main.o: ../sources/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/592584297 
	@${RM} ${OBJECTDIR}/_ext/592584297/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/592584297/main.o.ok ${OBJECTDIR}/_ext/592584297/main.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -mno-float -D_BOARD_UBW32_MX460_ -I".." -I"../sources" -Os -fomit-frame-pointer -fno-builtin -MMD -MF ${OBJECTDIR}/_ext/592584297/main.o.d -o ${OBJECTDIR}/_ext/592584297/main.o ../sources/main.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -mno-float -D_BOARD_UBW32_MX460_ -I".." -I"../sources" -Os -fomit-frame-pointer -fno-builtin -MMD -MF ${OBJECTDIR}/_ext/592584297/main.o.d -o ${OBJECTDIR}/_ext/592584297/main.o ../sources/main.c   2>&1  > ${OBJECTDIR}/_ext/592584297/main.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/_ext/592584297/main.o.ok ; fi 
	@touch ${OBJECTDIR}/_ext/592584297/main.o.d 
	
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/592584297/main.o.d > ${OBJECTDIR}/_ext/592584297/main.o.tmp
	@${RM} ${OBJECTDIR}/_ext/592584297/main.o.d 
	@${CP} ${OBJECTDIR}/_ext/592584297/main.o.tmp ${OBJECTDIR}/_ext/592584297/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/592584297/main.o.tmp
endif
	@touch ${OBJECTDIR}/_ext/592584297/main.o.err 
	@cat ${OBJECTDIR}/_ext/592584297/main.o.err 
	@if [ -f ${OBJECTDIR}/_ext/592584297/main.o.ok ] ; then rm -f ${OBJECTDIR}/_ext/592584297/main.o.ok; else exit 1; fi
	
${OBJECTDIR}/_ext/592584297/flash.o: ../sources/flash.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/592584297 
	@${RM} ${OBJECTDIR}/_ext/592584297/flash.o.d 
	@${RM} ${OBJECTDIR}/_ext/592584297/flash.o.ok ${OBJECTDIR}/_ext/592584297/flash.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -mno-float -D_BOARD_UBW32_MX460_ -I".." -I"../sources" -Os -fomit-frame-pointer -fno-builtin -MMD -MF ${OBJECTDIR}/_ext/592584297/flash.o.d -o ${OBJECTDIR}/_ext/592584297/flash.o ../sources/flash.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -mno-float -D_BOARD_UBW32_MX460_ -I".." -I"../sources" -Os -fomit-frame-pointer -fno-builtin -MMD -MF ${OBJECTDIR}/_ext/592584297/flash.o.d -o ${OBJECTDIR}/_ext/592584297/flash.o ../sources/flash.c   2>&1  > ${OBJECTDIR}/_ext/592584297/flash.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/_ext/592584297/flash.o.ok ; fi 
	@touch ${OBJECTDIR}/_ext/592584297/flash.o.d 
	
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/592584297/flash.o.d > ${OBJECTDIR}/_ext/592584297/flash.o.tmp
	@${RM} ${OBJECTDIR}/_ext/592584297/flash.o.d 
	@${CP} ${OBJECTDIR}/_ext/592584297/flash.o.tmp ${OBJECTDIR}/_ext/592584297/flash.o.d 
	@${RM} ${OBJECTDIR}/_ext/592584297/flash.o.tmp
endif
	@touch ${OBJECTDIR}/_ext/592584297/flash.o.err 
	@cat ${OBJECTDIR}/_ext/592584297/flash.o.err 
	@if [ -f ${OBJECTDIR}/_ext/592584297/flash.o.ok ] ; then rm -f ${OBJECTDIR}/_ext/592584297/flash.o.ok; else exit 1; fi
	
${OBJECTDIR}/_ext/592584297/cdcacm.o: ../sources/cdcacm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/592584297 
	@${RM} ${OBJECTDIR}/_ext/592584297/cdcacm.o.d 
	@${RM} ${OBJECTDIR}/_ext/592584297/cdcacm.o.ok ${OBJECTDIR}/_ext/592584297/cdcacm.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -mno-float -D_BOARD_UBW32_MX460_ -I".." -I"../sources" -Os -fomit-frame-pointer -fno-builtin -MMD -MF ${OBJECTDIR}/_ext/592584297/cdcacm.o.d -o ${OBJECTDIR}/_ext/592584297/cdcacm.o ../sources/cdcacm.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -mno-float -D_BOARD_UBW32_MX460_ -I".." -I"../sources" -Os -fomit-frame-pointer -fno-builtin -MMD -MF ${OBJECTDIR}/_ext/592584297/cdcacm.o.d -o ${OBJECTDIR}/_ext/592584297/cdcacm.o ../sources/cdcacm.c   2>&1  > ${OBJECTDIR}/_ext/592584297/cdcacm.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/_ext/592584297/cdcacm.o.ok ; fi 
	@touch ${OBJECTDIR}/_ext/592584297/cdcacm.o.d 
	
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/592584297/cdcacm.o.d > ${OBJECTDIR}/_ext/592584297/cdcacm.o.tmp
	@${RM} ${OBJECTDIR}/_ext/592584297/cdcacm.o.d 
	@${CP} ${OBJECTDIR}/_ext/592584297/cdcacm.o.tmp ${OBJECTDIR}/_ext/592584297/cdcacm.o.d 
	@${RM} ${OBJECTDIR}/_ext/592584297/cdcacm.o.tmp
endif
	@touch ${OBJECTDIR}/_ext/592584297/cdcacm.o.err 
	@cat ${OBJECTDIR}/_ext/592584297/cdcacm.o.err 
	@if [ -f ${OBJECTDIR}/_ext/592584297/cdcacm.o.ok ] ; then rm -f ${OBJECTDIR}/_ext/592584297/cdcacm.o.ok; else exit 1; fi
	
${OBJECTDIR}/_ext/592584297/pic32bootloaderusb.o: ../sources/pic32bootloaderusb.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/592584297 
	@${RM} ${OBJECTDIR}/_ext/592584297/pic32bootloaderusb.o.d 
	@${RM} ${OBJECTDIR}/_ext/592584297/pic32bootloaderusb.o.ok ${OBJECTDIR}/_ext/592584297/pic32bootloaderusb.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -mno-float -D_BOARD_UBW32_MX460_ -I".." -I"../sources" -Os -fomit-frame-pointer -fno-builtin -MMD -MF ${OBJECTDIR}/_ext/592584297/pic32bootloaderusb.o.d -o ${OBJECTDIR}/_ext/592584297/pic32bootloaderusb.o ../sources/pic32bootloaderusb.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -mno-float -D_BOARD_UBW32_MX460_ -I".." -I"../sources" -Os -fomit-frame-pointer -fno-builtin -MMD -MF ${OBJECTDIR}/_ext/592584297/pic32bootloaderusb.o.d -o ${OBJECTDIR}/_ext/592584297/pic32bootloaderusb.o ../sources/pic32bootloaderusb.c   2>&1  > ${OBJECTDIR}/_ext/592584297/pic32bootloaderusb.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/_ext/592584297/pic32bootloaderusb.o.ok ; fi 
	@touch ${OBJECTDIR}/_ext/592584297/pic32bootloaderusb.o.d 
	
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/592584297/pic32bootloaderusb.o.d > ${OBJECTDIR}/_ext/592584297/pic32bootloaderusb.o.tmp
	@${RM} ${OBJECTDIR}/_ext/592584297/pic32bootloaderusb.o.d 
	@${CP} ${OBJECTDIR}/_ext/592584297/pic32bootloaderusb.o.tmp ${OBJECTDIR}/_ext/592584297/pic32bootloaderusb.o.d 
	@${RM} ${OBJECTDIR}/_ext/592584297/pic32bootloaderusb.o.tmp
endif
	@touch ${OBJECTDIR}/_ext/592584297/pic32bootloaderusb.o.err 
	@cat ${OBJECTDIR}/_ext/592584297/pic32bootloaderusb.o.err 
	@if [ -f ${OBJECTDIR}/_ext/592584297/pic32bootloaderusb.o.ok ] ; then rm -f ${OBJECTDIR}/_ext/592584297/pic32bootloaderusb.o.ok; else exit 1; fi
	
${OBJECTDIR}/_ext/592584297/util.o: ../sources/util.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/592584297 
	@${RM} ${OBJECTDIR}/_ext/592584297/util.o.d 
	@${RM} ${OBJECTDIR}/_ext/592584297/util.o.ok ${OBJECTDIR}/_ext/592584297/util.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -mno-float -D_BOARD_UBW32_MX460_ -I".." -I"../sources" -Os -fomit-frame-pointer -fno-builtin -MMD -MF ${OBJECTDIR}/_ext/592584297/util.o.d -o ${OBJECTDIR}/_ext/592584297/util.o ../sources/util.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -mno-float -D_BOARD_UBW32_MX460_ -I".." -I"../sources" -Os -fomit-frame-pointer -fno-builtin -MMD -MF ${OBJECTDIR}/_ext/592584297/util.o.d -o ${OBJECTDIR}/_ext/592584297/util.o ../sources/util.c   2>&1  > ${OBJECTDIR}/_ext/592584297/util.o.err ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/_ext/592584297/util.o.ok ; fi 
	@touch ${OBJECTDIR}/_ext/592584297/util.o.d 
	
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/592584297/util.o.d > ${OBJECTDIR}/_ext/592584297/util.o.tmp
	@${RM} ${OBJECTDIR}/_ext/592584297/util.o.d 
	@${CP} ${OBJECTDIR}/_ext/592584297/util.o.tmp ${OBJECTDIR}/_ext/592584297/util.o.d 
	@${RM} ${OBJECTDIR}/_ext/592584297/util.o.tmp
endif
	@touch ${OBJECTDIR}/_ext/592584297/util.o.err 
	@cat ${OBJECTDIR}/_ext/592584297/util.o.err 
	@if [ -f ${OBJECTDIR}/_ext/592584297/util.o.ok ] ; then rm -f ${OBJECTDIR}/_ext/592584297/util.o.ok; else exit 1; fi
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/avrbl.X.${IMAGE_TYPE}.elf: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mdebugger -D__MPLAB_DEBUGGER_ICD3=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/avrbl.X.${IMAGE_TYPE}.elf ${OBJECTFILES}        -Wl,--defsym=__MPLAB_BUILD=1,--report-mem$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__ICD2RAM=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_ICD3=1,--defsym=_min_heap_size=0,--defsym=_min_stack_size=3072,--gc-sections,-L"../../../../Program Files/Microchip/MPLAB C32/lib",-L"../../../../Program Files/Microchip/MPLAB C32/pic32mx/lib",-Map="$(BINDIR_)$(TARGETBASE).map" 
else
dist/${CND_CONF}/${IMAGE_TYPE}/avrbl.X.${IMAGE_TYPE}.elf: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/avrbl.X.${IMAGE_TYPE}.elf ${OBJECTFILES}        -Wl,--defsym=__MPLAB_BUILD=1,--report-mem$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=0,--defsym=_min_stack_size=3072,--gc-sections,-L"../../../../Program Files/Microchip/MPLAB C32/lib",-L"../../../../Program Files/Microchip/MPLAB C32/pic32mx/lib",-Map="$(BINDIR_)$(TARGETBASE).map"
	${MP_CC_DIR}/pic32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/avrbl.X.${IMAGE_TYPE}.elf  
endif


# Subprojects
.build-subprojects:

# Clean Targets
.clean-conf:
	${RM} -r build/UBW32_MX460
	${RM} -r dist/UBW32_MX460

# Enable dependency checking
.dep.inc: .depcheck-impl

include .dep.inc
