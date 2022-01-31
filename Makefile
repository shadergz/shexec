ASMC=yasm
ASMFLAGS=-f bin

all: mw shcode shload

shcode: shcode.asm
	$(ASMC) $(ASMFLAGS) -o $@ $^

%.c: %.o

clean:
	-rm -f mw shcode shload

.PHONY: all clean
