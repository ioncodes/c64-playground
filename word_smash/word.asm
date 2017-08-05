BasicUpstart2(start)

start:
    jsr $e544
    lda #$00
    sta $d020
    sta $d021

    ldx #$00 
    jsr write

    jmp *
  
write:
    lda msg, x 
    sta $0400,x 
    lda #$01 
    sta $d800,x 
    inx 
    cpx #52
    bne write
    rts

msg:
    .text "lorem ipsum forgot ipserum me not know lorem anymore "
    .byte $00  