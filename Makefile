CC = gcc
CFLAGS = -O2 #-DDEBUG
OBJFILES = ifled.o
PROGRAM = ifled
VERSION = 0.6

all: $(OBJFILES)
	$(CC) $(CFLAGS) $(OBJFILES) -o $(PROGRAM)

clean:
	-rm $(OBJFILES)
	-rm ifled

dist:
	-cd .. ; tar cf ifled-$(VERSION).tar ifled-$(VERSION) ; gzip -9 ifled-$(VERSION).tar
