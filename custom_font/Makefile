KICKASS=$(KICK_HOME)/kickass

ifeq ($(KICK_HOME),)
KICKASS := kickass
endif

font.prg: font.asm
	$(KICKASS) font.asm -o font.prg