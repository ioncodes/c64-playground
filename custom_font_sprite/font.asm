.pc = $0801 "Basic Upstart"
:BasicUpstart(start)

.pc = $0810 "Program"

start:
	lda #$00
	sta $d020   
	sta $d021	
	tax
	jsr loadimage
	jmp loop

loadimage:
	lda $3f40,x
	sta $0400,x
	lda $4040,x
	sta $0500,x
	lda $4140,x
	sta $0600,x
	lda $4240,x
	sta $0700,x
	lda $4328,x
	sta $d800,x
	lda $4428,x
	sta $d900,x
	lda $4528,x
	sta $da00,x
	lda $4628,x
	sta $db00,x
	dex
	bne loadimage

	lda #$3b
	ldx #$18
	ldy #$18
	sta $d011
	stx $d016
	sty $d018

	rts

loop:
	jmp loop

msg:
	.text "ion was here" // not used yet

.pc = $2000 "Font"
.import binary "mirror.prg"