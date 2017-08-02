/*
 *  X: color (0: yellow, 1: orange)
 *  EP: 49152 (0xc000)
 */

.pc = $c000
.const TIMER = 4

start: {
  jsr init
  jsr load
  jmp loop
}
init: {
  ldx 0
  ldy 0
  rts
}
loop: {
  cpy 0
  beq pause
  cpy TIMER
  ldy 0
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
pause: {
  cpy TIMER
  beq loop
  iny
  jmp pause
}
