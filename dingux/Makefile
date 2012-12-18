# gpSP makefile
# Gilead Kutnick - Exophase
# GP2X port(ion) - Z

# Global definitions

EXE_PREFIX = mipsel-linux-
CC        = ${EXE_PREFIX}gcc
STRIP     = ${EXE_PREFIX}strip

OBJS      = main.o cpu.o memory.o video.o input.o sound.o gui.o \
            cheats.o zip.o cpu_threaded.o mips_stub.o
BIN       = gpsp.dge 

# Platform specific definitions 

COMMON_OPT = -g
COMMON_OPT += -O2 -fno-builtin -fomit-frame-pointer

VPATH      += ..
CFLAGS     += -DZAURUS
# NOTE: -funroll-loops will slow down compiling considerably
CFLAGS     += $(COMMON_OPT)
CFLAGS     += `${DINGUX_SDK}/usr/bin/sdl-config --cflags`

ASFLAGS    += $(COMMON_OPT)

INCLUDES   =
LIBS       = `${DINGUX_SDK}/usr/bin/sdl-config --libs` -lz
#LIBS       = -lSDL -lpthread -lz -lm

# Compilation:

.SUFFIXES: .c

%.o: %.c
	$(CC) $(CFLAGS) $(INCLUDES) -c -o $@ $<

%.o: %.S
	$(CC) $(ASFLAGS) $(INCLUDES) -c -o $@ $<

all: $(BIN)

$(BIN) : $(OBJS)
	$(CC) $(COMMON_OPT) $(OBJS) $(LIBS) -o $(BIN)  

clean:
	rm -f *.o *.u *.z $(BIN) 

strip:
	$(STRIP) $(BIN)

release: $(BIN) strip	
