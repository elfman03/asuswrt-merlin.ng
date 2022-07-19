PREFIX   = /usr/local
LIBDIR   = $(PREFIX)/lib
DESTDIR  = /usr/sbin
CFLAGS   = -Os -Wall -Werror --std=gnu99 -g3 -Wmissing-declarations -Wno-unused-parameter $(EXTRACFLAGS)
CFLAGS  += -ffunction-sections -fdata-sections
LDFLAGS  = $(EXTRALDFLAGS)
LDFLAGS += -Wl,--gc-sections
LIBS     = -Wl,--as-needed -lrt
UBOXDIR  = ../libubox

TARGET = umbim
umbim_SRCS := cli.c mbim-enum.c mbim-dev.c mbim-msg.c
umbim_LIBS := -L../libubox -lubox

all: $(TARGET)

clean:
	rm -f *.o *.a *.so $(TARGET)

install: all install-common

install-common:
	$(INSTALL) -d $(DESTDIR)
	$(INSTALL) -m 755 $(TARGET) $(DESTDIR) 

$(TARGET): $(umbim_SRCS)
	$(CC) $(CFLAGS) -fPIC -I $(UBOXDIR) -o $(TARGET) $(umbim_SRCS) -L $(UBOXDIR) $(umbim_LIBS) $(LDFLAGS) $(LIBS)

.PHONY : all clean install install-common dummy
