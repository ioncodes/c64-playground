/*
 *  X: color (0: yellow, 1: orange)
 */

.pc = $0801 "Basic Upstart"
:BasicUpstart(start)

.pc = $0810 "Program"


start: {
	jsr init
	jsr load
	jmp loop
}
init: {
	ldx 0
	rts
}
loop: {
	cpx 1 // check if orange
	beq set_yellow
	bne set_orange
}
load: {
	lda #$07
	jsr write_screen
	rts
}
set_orange: {
	lda #$08
	jsr write_screen
	ldx 1
	jmp loop
}
set_yellow: {
	lda #$07
	jsr write_screen
	ldx 0
	jmp loop
}
write_screen: {
	sta $D020
	sta $D021
	rts
}