################################################################################
# Makefile for AVR
#
# How to use:
# 	-Edit Project Settings
#	-This file should be at the root dir of the project
#
# 	-Commans:
#		make				to compile
#		make clean	        to clean
#	-TODO:
#		make up				to upload
#		make doc			to generate docs w/ doxygen
#
################################################################################



################################################################################
################################################################################
################################################################################
########### Project Settings starts here

# project root dir
PRJDIR      :=  $(shell pwd)
# binaries (.elf and .hex)
BINDIR      :=  bin
# compiled object files
OBJDIR      :=  obj
# project documentation
DOCDIR		:=  doc
# libraries
LIBDIR      :=  lib
# .c sources files
SRCDIR      :=  src
# Project target and sources to be compiled
MAIN 		= 	main
# Define microcontroller settings
MCU 		?=	atmega328p
F_CPU		?=	16000000UL
# Optimization
OPT=s
# documentation (auto generated)
DOXYFILE_MK		=	Doxyfile

########### Project Settings ends here
################################################################################
################################################################################
################################################################################



# These will automatically be checked if they are set to YES
SPECIAL_DEFS +=

TARGET = $(lastword $(subst /, ,$(CURDIR)))

SRCS	=	$(shell find $(SRCDIR) -type f -name \*.c)
OBJS	=	$(patsubst $(SRCDIR)/%,$(OBJDIR)/%,$(SRCS:.c=.o))

SILENT ?= @
CROSS ?= avr-
ifneq ($(CROSS), )
	CC = $(CROSS)gcc
	CXX = $(CROSS)g++
	OBJCOPY = $(CROSS)objcopy
	OBJDUMP = $(CROSS)objdump
	SIZE = $(CROSS)size
endif

ifneq ($(F_CPU),)
 	CFLAGS += -DF_CPU=$(F_CPU)
endif

## Special defines

define CHECK_ANSWER
	ifeq ($$($(1)), YES)
   		CFLAGS += -D$(1)
	endif
endef

$(foreach i,$(SPECIAL_DEFS),$(eval $(call CHECK_ANSWER,$(i))))

##


CFLAGS += \
	-O$(OPT) \
	-Wall \
	-std=gnu99 \
	-mmcu=$(MCU)

LDFLAGS = -Wl,-Map=$(OBJDIR)/$(TARGET).map
LDFLAGS += $(patsubst %,-L%,$(EXTRALIBDIRS))
LDFLAGS += $(PRINTF_LIB) $(SCANF_LIB) $(MATH_LIB)
LDFLAGS += -Llib/avr-can-lib/src/ -lcan
LDFLAGS += -static -Llib/DISPLAYS/SSD1306_AVR/ -lssd1306

## Intel Hex file production flags
HEX_FLASH_FLAGS = \
	-R .eeprom \
	-R .fuse \
	-R .lock \
	-R .signature
HEX_EEPROM_FLAGS = \
	-j .eeprom \
	--set-section-flags=.eeprom="alloc,load" \
	--change-section-lma .eeprom=0 --no-change-warnings

.PHONY: directories doc

# all
all: directories $(TARGET).elf size

# directories
directories: 
	$(SILENT) $(MKDIR_P) $(BINDIR) $(OBJDIR) $(DOCDIR) $(LIBDIR) $(SRCDIR)

# size
size: $(TARGET).elf
	$(SILENT) $(SIZE) -C --mcu=$(MCU) $(BINDIR)/$<

# clean
ifneq ($(wildcard $(OBJS) $(TARGET).elf $(TARGET).hex $(TARGET).eep $(TARGET).map $(OBJS:%.o=%.d=%.map) $(OBJS:%.o=%.lst=%.map)), )
clean: rmdoc
	-rm $(wildcard $(OBJS) $(TARGET).elf $(TARGET).hex $(TARGET).eep $(TARGET).map $(OBJS:%.o=%.d=%.map) $(OBJS:%.o=%.lst=%.map))
else
clean:
	@echo "Nothing to clean."
endif

MKDIR_P := mkdir -p

.SECONDARY:

## Link
%.elf: $(OBJS)
	@echo "Linking:" $@...
	@echo ""
	$(SILENT) $(CC) $(CFLAGS) $(OBJS) -o $(BINDIR)/$@ $(LDFLAGS)

%.hex: $(TARGET)
	@echo "hex..:"
	@echo ""
	$(SILENT) $(OBJCPY) -O ihex $(HEX_FLASH_FLAGS)
 
## Compile
$(OBJDIR)/%.o: $(SRCDIR)/%.c
	@echo "[$(TARGET)] Compiling:" $@...
	@echo ""
	$(SILENT) $(CC) $(CFLAGS) -MMD -MF $(@:%.o=%.d) -c $< -o $@

$(OBJDIR)/%.d: $(SRCDIR)/%.c
	@echo "[$(TARGET)] Generating dependency:" $@...
	@echo ""
	$(SILENT) $(CC) $(CFLAGS) -MM -MT $(addsuffix .o, $(basename $@)) -MF $@ $<

## Docs

# If makefile changes, maybe the list of sources has changed, so update doxygens list

doc: $(SRCS)
	@echo "Generating docs..."
	@echo ""
	$(SILENT) @mkdir -p $(DOCDIR)
	@echo $(cat $(DOXYFILE) ; echo INPUT = $(SRCDIR) ; echo PROJECT_NAME = $(shell basename $(PRJDIR))) | doxygen

rmdoc:
	@rm -rf doc
###############



## Programming

AVRDUDE := avrdude
AVRDUDE_PORT = /dev/ttyACM0
#AVRDUDE_SPEED = 9600
AVRDUDE_PROGRAMMER = arduino

AVRDUDE_FLAGS += -p $(MCU)
ifneq ($(AVRDUDE_PORT), )
  AVRDUDE_FLAGS += -P $(AVRDUDE_PORT)
endif
ifneq ($(AVRDUDE_PROGRAMMER), )
  AVRDUDE_FLAGS += -c $(AVRDUDE_PROGRAMMER)
endif
ifneq ($(AVRDUDE_SPEED), )
  AVRDUDE_FLAGS += -b $(AVRDUDE_SPEED)
endif

#Add more verbose output if we dont have SILENT set
ifeq ($(SILENT), )
  AVRDUDE_FLAGS += -v -v
endif

# Fuses for internal 8MHz oscillator
ifeq ($(MCU), atmega328p)
  AVRDUDE_WRITE_FUSE ?= -U lfuse:w:0xe2:m -U hfuse:w:0xd9:m
endif
ifeq ($(MCU), atmega88)
  AVRDUDE_WRITE_FUSE ?= -U lfuse:w:0xe2:m -U hfuse:w:0xdf:m
endif
ifeq ($(MCU), atmega8)
  AVRDUDE_WRITE_FUSE ?= -U lfuse:w:0xe4:m -U hfuse:w:0xd9:m
endif
ifeq ($(MCU), $(filter $(MCU), attiny2313 attiny4313))
  AVRDUDE_WRITE_FUSE ?= -U lfuse:w:0xE4:m
  #AVRDUDE_WRITE_FLASH := -U lfuse:w:0x64:m #run with 1 Mhz clock #default clock mode
endif

# flash and fuse
ifneq ($(AVRDUDE_PROGRAMMER), )
flash: $(TARGET).hex #$(TARGET).eep
	$(AVRDUDE) $(AVRDUDE_FLAGS) -U flash:w:$(TARGET).hex
	#$(AVRDUDE) $(AVRDUDE_FLAGS) -U eeprom:w:$(TARGET).eep

fuse:
	$(AVRDUDE) $(AVRDUDE_FLAGS) $(AVRDUDE_WRITE_FUSE)

%.hex: $(BINDIR)/%.elf
	@echo "Creating flash file:" $@...
	$(SILENT) $(OBJCOPY) -O ihex -R .eeprom $< $(BINDIR)/$@

%.eep: $(BINDIR)/%.elf
	@echo "Creating eeprom file:" $@...
	$(SILENT) $(OBJCOPY) -j .eeprom --set-section-flags=.eeprom="alloc,load" \
	--change-section-lma .eeprom=0 -O ihex $< $@
else
FLASH_MSG="You need to set AVRDUDE_PROGRAMMER/AVRDUDE_PORT/AVRDUDE_SPEED in ~/user.mk"
flash:
	@echo $(FLASH_MSG)

fuse:
	@echo $(FLASH_MSG)
endif

# bootloader

OPTIBOOT_BOOTLOADER = /Applications/Arduino.app/Contents/Resources/Java/hardware/arduino/bootloaders/optiboot/optiboot_atmega328_pro_8MHz.hex
ARDUINO_BOOTLOADER = /Applications/Arduino.app/Contents/Resources/Java/hardware/arduino/bootloaders/optiboot/optiboot_atmega328_pro_8MHz.hex
AVRDUDE_UNLOCK_FUSE = -U lock:w:0x3F:m
AVRDUDE_LOCK_FUSE = -U lock:w:0x0F:m
AVRDUDE_BOOTLOADER_FUSE_INT_8MHZ = -U lfuse:w:0xe2:m -U efuse:w:0x05:m
AVRDUDE_BOOTLOADER_FUSE_EXT_16MHZ =  -U lfuse:w:0xff:m -U efuse:w:0x05:m
AVRDUDE_BOOTLOADER_FUSE_SIZE_OPTIBOOT = -U hfuse:w:0xde:m
AVRDUDE_BOOTLOADER_FUSE_SIZE_ARDUINO = -U hfuse:w:0xda:m

bootloader_8mhz:
	@echo "Burning bootloader..."
	$(AVRDUDE) $(AVRDUDE_FLAGS) $(AVRDUDE_UNLOCK_FUSE)
	$(AVRDUDE) $(AVRDUDE_FLAGS) $(AVRDUDE_BOOTLOADER_FUSE_INT_8MHZ) $(AVRDUDE_BOOTLOADER_FUSE_SIZE_ARDUINO)
	$(AVRDUDE) $(AVRDUDE_FLAGS) -e -U flash:w:$(ARDUINO_BOOTLOADER)
	$(AVRDUDE) $(AVRDUDE_FLAGS) $(AVRDUDE_LOCK_FUSE)

bootloader_16mhz:
	@echo "Burning bootloader..."
	$(AVRDUDE) $(AVRDUDE_FLAGS) $(AVRDUDE_UNLOCK_FUSE)
	$(AVRDUDE) $(AVRDUDE_FLAGS) $(AVRDUDE_BOOTLOADER_FUSE_EXT_16MHZ) $(AVRDUDE_BOOTLOADER_FUSE_SIZE_ARDUINO)
	$(AVRDUDE) $(AVRDUDE_FLAGS) -e -U flash:w:$(ARDUINO_BOOTLOADER)
	$(AVRDUDE) $(AVRDUDE_FLAGS) $(AVRDUDE_LOCK_FUSE)

optiboot_8mhz:
	@echo "Burning bootloader..."
	$(AVRDUDE) $(AVRDUDE_FLAGS) $(AVRDUDE_UNLOCK_FUSE)
	$(AVRDUDE) $(AVRDUDE_FLAGS) $(AVRDUDE_BOOTLOADER_FUSE_INT_8MHZ) $(AVRDUDE_BOOTLOADER_FUSE_SIZE_OPTIBOOT)
	$(AVRDUDE) $(AVRDUDE_FLAGS) -e -U flash:w:$(OPTIBOOT_BOOTLOADER)
	$(AVRDUDE) $(AVRDUDE_FLAGS) $(AVRDUDE_LOCK_FUSE)

optiboot_16mhz:
	@echo "Burning bootloader..."
	$(AVRDUDE) $(AVRDUDE_FLAGS) $(AVRDUDE_UNLOCK_FUSE)
	$(AVRDUDE) $(AVRDUDE_FLAGS) $(AVRDUDE_BOOTLOADER_FUSE_EXT_16MHZ) $(AVRDUDE_BOOTLOADER_FUSE_SIZE_OPTIBOOT)
	$(AVRDUDE) $(AVRDUDE_FLAGS) -e -U flash:w:$(OPTIBOOT_BOOTLOADER)
	$(AVRDUDE) $(AVRDUDE_FLAGS) $(AVRDUDE_LOCK_FUSE)


###############

# Check which .o files we already have and include their dependency files.
PRIOR_OBJS := $(wildcard $(OBJS))
include $(PRIOR_OBJS:%.o=%.d)
