.DELETE_ON_ERROR:

AS = armips

ASM = hack.asm
ROM = gawg4.gba
HACK = hack.gba

$(HACK): $(ASM)
	cp $(ROM) $(HACK)
	$(AS) $(ASM)

clean:
	rm -rf $(HACK)
