BasicUpstart2(preload)

.var screen = $0400
.var shift = $00fb

preload:
    lda #147
    jsr $ffd2 // jump to text output
    lda #$00
    sta $d020
    sta $d021
    lda #0
    sta shift

    jmp start

start:
    ldx #5
    ldy shift
    jsr write
    jmp start
    
write:
    lda msg, x
    sta screen, y
    dey
    dex
    cpx #-1
    bne write
    lda msg+2 // get space
    sta screen, y // overwrite first char
    ldy #0
    inc shift
    rts

msg:
    .text "by ion"
    .byte $00