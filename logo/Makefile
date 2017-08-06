KICKASS=$(KICK_HOME)/kickass

ifeq ($(KICK_HOME),)
KICKASS := kickass
endif

logo.prg: logo.asm
	$(KICKASS) logo.asm -o logo.prg