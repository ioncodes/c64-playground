KICKASS=$(KICK_HOME)/kickass

ifeq ($(KICK_HOME),)
KICKASS := kickass
endif

all: horizontal vertical

horizontal: horizontal.asm
	$(KICKASS) horizontal.asm -o horizontal.prg
vertical: vertical.asm
	$(KICKASS) vertical.asm -o vertical.prg