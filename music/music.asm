.var music = LoadSid("tln.sid")
BasicUpstart2(start)

start:
	lda #$00
	sta $d020
	sta $d021
	ldx #0
	ldy #0
	lda #music.startSong-1
	jsr music.init
	sei
	lda #<irq1
	sta $0314
	lda #>irq1
	sta $0315
	asl $d019
	lda #$7b
	sta $dc0d
	lda #$81
	sta $d01a
	lda #$1b
	sta $d011
	lda #$80
	sta $d012
	cli
	jmp *

irq1:
	asl $d019
	inc $d020
	jsr music.play 
	dec $d020
	pla
	tay
	pla
	tax
	pla
	rti

*=music.location "Music"
.fill music.size, music.getData(i)