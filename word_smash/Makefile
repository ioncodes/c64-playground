KICKASS=$(KICK_HOME)/kickass

ifeq ($(KICK_HOME),)
KICKASS := kickass
endif

word.prg: word.asm
	$(KICKASS) word.asm -o word.prg