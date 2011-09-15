# gpSP makefile
# Gilead Kutnick - Exophase
# GP2X port(ion) - Z

# Global definitions

PREFIX  = /opt/native/arm/3.4.5-xscale-softvfp/armv5tel-cacko-linux
CC        = gcc
STRIP     = strip

OBJS      = main.o cpu.o memory.o video.o input.o sound.o gui.o \
            cheats.o zip.o cpu_threaded.o video_blend.o         \
            arm_stub.o
BIN       = gpsp.gpe 

# Platform specific definitions 

VPATH      += ..
CFLAGS     += -DARM_ARCH -DZAURUS
# NOTE: -funroll-loops will slow down compiling considerably
CFLAGS     += -O2 -fsigned-char -fno-common -mtune=xscale -mcpu=xscale          \
              -fno-builtin -fomit-frame-pointer                                 \

INCLUDES   = -I${PREFIX}/include -I${PREFIX}/include/SDL
LIBS       = -L${PREFIX}/lib -lSDL -lpthread -lz 

# Compilation:

.SUFFIXES: .c

%.o: %.c
	$(CC) $(CFLAGS) $(INCLUDES) -c -o $@ $<

%.o: %.S
	$(CC) $(ASFLAGS) $(INCLUDES) -c -o $@ $<

all:	$(OBJS)
	$(CC) $(OBJS) $(LIBS) -o $(BIN)  
	$(STRIP) $(BIN)

clean:
	rm -f *.o *.u *.z $(BIN) 

