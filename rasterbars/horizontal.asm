.pc = $0801 "Basic Upstart"
:BasicUpstart(preload)

.pc = $0810 "Program"

// note: 312 lines per frame

preload:
   lda #$7a // load the start line
   sta $00fb // write it here
   lda #1
   sta $032e
   jmp start

start:
   sei
   lda #$00
   sta $d011
   sta $d020
   jsr check
   //inc $00fb // next raster
   jsr move
   ldy $00fb // start from next raster
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

check:
   // check if end reached
   ldx $d012
   stx $02a7
   .for(var i=0; i<51; i++) {
      inc $02a7
   }
   ldx $02a7
   cpx #300
   beq debug // break

   // check if start reached
   ldx $d012
   stx $02a7
   cpx #112
   beq debug // break

   rts

// could call @up and @down directly
debug:
   ldx $032e
   cpx 1
   beq @up
   bne @down
   rts
   // brk

up:
   ldx 2
   stx $032e
   rts

down:
   ldx 1
   stx $032e
   rts

move:
   ldx $032e
   cpx 1
   beq move_down
   bne move_up
   rts

move_up:
   dec $00fb
   rts

move_down:
   inc $00fb
   rts

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