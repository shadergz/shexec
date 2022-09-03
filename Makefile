ASMC=yasm
ASMFLAGS=-f bin

MW_SRC=mw.c
SHLOAD_SRC=shload.c
SHELL_CODE_SRC=shcode.asm

all: mw shcode shload

mw: $(MW_SRC)
	$(CC) -o $@ $^

shload: $(SHLOAD_SRC)
	$(CC) -o $@ $^

shcode: $(SHELL_CODE_SRC)
	$(ASMC) $(ASMFLAGS) -o $@ $<

clean:
	-rm -f mw shcode shload

.PHONY: all clean
