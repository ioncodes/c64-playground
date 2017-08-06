.var picture = LoadBinary("jack.koa", BF_KOALA)

:BasicUpstart2(start)

start:
    lda $dd00  // set VIC-bank 2 since picture at $4000
    and #$fc
    ora #02
    sta $dd00 
    lda #$80   // Bitmap at $4000, screen att $6000 to $d018
    sta $d018
    lda #$18   // multicolor mode   
    sta $d016
    lda #$3b  // vic to bitmap mode
    sta $d011
    lda #picture.getBackgroundColor()
    sta $d020
    lda #picture.getBackgroundColor()
    sta $d021
    ldx #0
!loop:
    .for (var i=0; i<4; i++) {
        lda colorRam+i*$100,x
        sta $d800+i*$100,x
    }
    inx
    bne !loop-
    jmp *


.pc = $6000 "ScreenRam" 
.fill picture.getScreenRamSize(), picture.getScreenRam(i)

.pc = $3000 "ColorRam" 
colorRam: 
    .fill picture.getColorRamSize(), picture.getColorRam(i)

.pc = $4000 "Bitmap" 
.fill picture.getBitmapSize(), picture.getBitmap(i)