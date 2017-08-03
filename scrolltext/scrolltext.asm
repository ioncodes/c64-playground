.pc = $0801 "Basic Upstart"
:BasicUpstart(start)

.pc = $0810 "Program"

.var pos = 7

start:
	lda #147 // clear
	jsr $FFD2 // jump to text output
	jmp main

main:
	lda $D016
	and #%11110000
	ora pos
	sta $D016
	lda #200
	cmp $D012
	beq *-3
	cmp $D012
	bne *-3
	dec pos
	lda #%00000111
	and pos
	sta pos
	cmp #7
	bne main
	jsr move_row
	ldx scrolltextpos
	lda scrolltext, X
	beq reset
	sta $0400 + 159
	inx
	stx scrolltextpos
	jmp main

reset:
	sta scrolltextpos
	jmp main

move_row:                 
	ldx #0
	jsr write_char
	rts

write_char:
	lda $0400 + 121, X
	sta $0400 + 120, X
	inx
	cpx #39
	bne write_char
	rts

scrolltextpos:
	.byte 0

scrolltext:
	.text "ion is love! "
	.byte $00