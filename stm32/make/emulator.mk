#
# Copyright (c) 2013 Ell-i co-operative
#
# Define make variables for the Emulator
#

VARIABLE_FILES := $(TOP)make/arduino.txt $(TOP)platform.txt

EXTRA_CFLAGS += \
        -DEMULATOR \
	-m32 -march=i386 \
	-D__STM32F051__ \
	-Dmain=emulated_main \
	-I$(TOP)emulator/inc \
	-I$(TOP)cores/arduelli \
	-I$(TOP)system/stm32/inc \
	-I$(TOP)system/stm32/CMSIS/Include \

#
# No user serviceable parts below
#
ifeq ($(SCRIPTDIR),)
SCRIPTDIR=$(TOP)scripts/
endif

define expand
$(shell $(SCRIPTDIR)expand-arduino-ide-definition.sh $(1) $(VARIABLE_FILES))
endef


CC  := g++
CXX := g++
# LD  := g++ -m32 -march=i386
LD  := g++
AR  := ar

CFLAGS   := \
  $(subst -std=c99,-std=c++98,$(subst -mcpu=cortex-m0,,$(call expand,compiler.cmd.cc.flags)))

CXXFLAGS := \
  $(subst -std=gnu++0x,-std=c++98,$(subst -mcpu=cortex-m0,,$(call expand,compiler.cmd.cxx.flags)))

LDFLAGS  := -m32 -demangle
ARFLAGS  := $(call expand,compiler.cmd.ar.flags)

LIBS     := $(call expand,compiler.cmd.ld.libs)

CFLAGS   += $(EXTRA_CFLAGS)
CXXFLAGS += $(EXTRA_CFLAGS)

#
# Figure out the GCC installation directories to locate libc.a
#

LIBGCC_LIBRARY := \
	$(shell $(CC) -m32 -print-libgcc-file-name)

LIBS += -lstdc++ $(LIBGCC_LIBRARY)

#
# Additional system objects
#

SYSTEM_OBJS := emulator.o Register.o RCC.o FLASH.o
VPATH := $(TOP)emulator/src
