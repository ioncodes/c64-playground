KICKASS=$(KICK_HOME)/kickass

ifeq ($(KICK_HOME),)
KICKASS := kickass
endif

music.prg: music.asm
	$(KICKASS) music.asm -o music.prg