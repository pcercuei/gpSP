# gpSP makefile
# Gilead Kutnick - Exophase
# GP2X port(ion) - Z

# Global definitions

PREFIX  = /Developer/dingux/mipsel-linux-uclibc
CC        = mipsel-linux-uclibc-gcc
STRIP     = mipsel-linux-uclibc-strip

OBJS      = main.o cpu.o memory.o video.o input.o sound.o gui.o \
            cheats.o zip.o cpu_threaded.o mips_stub.o
BIN       = gpsp.dge 

# Platform specific definitions 

COMMON_OPT = -g
COMMON_OPT += -O3 -fno-builtin -fomit-frame-pointer

VPATH      += ..
CFLAGS     += -DZAURUS
# NOTE: -funroll-loops will slow down compiling considerably
CFLAGS     += -mips32 -G0
CFLAGS     += $(COMMON_OPT)

ASFLAGS    += $(COMMON_OPT)
ASFLAGS    += -mips32

INCLUDES   = -I${PREFIX}/include -I${PREFIX}/include/SDL
LIBS       = -L${PREFIX}/lib -lSDL -lpthread -lz 

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
