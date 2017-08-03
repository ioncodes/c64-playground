.pc = $0801 "Basic Upstart"
:BasicUpstart(preload)

.pc = $0810 "Program"

// note: 312 lines per frame

preload:
   lda #$7a // load the start line
   sta $00fb // write it here
   jmp start

start:
   sei
   lda #$00
   sta $d011
   sta $d020
   inc $00fb // next line
   ldy $00fb // start from next line
   ldx #$00
   jmp loop

loop:
   lda colors, X
   cpy $d012
   bne *-3 // line cycle
   sta $d020
   cpx #51
   beq start // end
   inx
   iny
   jmp loop

colors:
   .byte $06,$06,$06,$0e,$06,$0e
   .byte $0e,$06,$0e,$0e,$0e,$03
   .byte $0e,$03,$03,$0e,$03,$03
   .byte $03,$01,$03,$01,$01,$03
   .byte $01,$01,$01,$03,$01,$01
   .byte $03,$01,$03,$03,$03,$0e
   .byte $03,$03,$0e,$03,$0e,$0e
   .byte $0e,$06,$0e,$0e,$06,$0e
   .byte $06,$06,$06,$00,$00,$00

   .byte $ff