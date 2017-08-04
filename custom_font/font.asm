.pc = $0801 "Basic Upstart"
:BasicUpstart(start)

.pc = $0810 "Program"


start:
	lda #$18 // char mode
	sta $d018
	lda #147 // clear
	jsr $ffd2
	ldy #$01 // white
	sty $0286 // text color
	ldy #$00 // black
    sty $d021
    sty $d020
	jsr write
	jmp loop

write:
	lda msg, X
	sta $0590, X
	inx
	cpx #12
	bne write
	rts

loop:
	jmp loop

msg:
	.text "ion was here"

.pc = $2000 "Font"

.import c64 "antik_1.64c"