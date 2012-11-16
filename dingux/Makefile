# gpSP makefile
# Gilead Kutnick - Exophase
# GP2X port(ion) - Z

# Global definitions

CC        = mipsel-linux-gcc
STRIP     = mipsel-linux-strip

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

ASFLAGS    += $(COMMON_OPT)

INCLUDES   =
LIBS       = -lSDL -lpthread -lz -lm

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
