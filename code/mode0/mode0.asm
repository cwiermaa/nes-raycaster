Raycast.Mode0.Initialize:
	jsr Raycast.Mode0.ClearCHR
	jsr Raycast.Mode0.InitSprites
	
	jsr Raycast.DumpTestPal
	
	lda #$3F
	sta $2006
	lda #$00
	sta $2006
	
	ldx #0
	ldy #$20
-
	lda Raycast.Palette.w,x
	sta $2007
	inx
	dey
	bne -
	
	lda #<Raycast.CHR+$F0
	sta Standard.ZTempWord.0
	lda #>Raycast.CHR+$0F
	sta Standard.ZTempWord.0+1
	
	lda #$0F
	sta $2006
	lda #$F0
	sta $2006
	ldy #0
	ldx #16
-
	lda (Standard.ZTempWord.0),y
	sta $2007
	iny
	dex
	bne -
	
	
	lda #<Raycast.CHR+$F0
	sta Standard.ZTempWord.0
	lda #>Raycast.CHR+$0F
	sta Standard.ZTempWord.0+1
	
	lda #$0F
	sta $2006
	lda #$F0
	sta $2006
	ldy #0
	ldx #16
-
	lda (Standard.ZTempWord.0),y
	sta $2007
	iny
	dex
	bne -
	
	lda #$20
	sta $2006
	lda #$00
	sta $2006
	
	ldx #4
	ldy #0
	lda #$FE
-
	sta $2007
	iny
	bne -
	dex
	bne -
	
	lda #$23
	sta $2006
	lda #$C0
	sta $2006
	
	ldx #$40
	lda #0
-
	sta $2007
	dex
	bne -
	
	lda #$23
	sta $2006
	lda #$E0
	sta $2006
	lda #$FF
	sta $2007
	
	lda #$24
	sta $2006
	lda #$00
	sta $2006
	
	ldx #4
	ldy #0
	lda #$FE
-
	sta $2007
	iny
	bne -
	dex
	bne -
	
	lda #$27
	sta $2006
	lda #$C0
	sta $2006
	
	ldx #$40
	lda #0
-
	sta $2007
	dex
	bne -
	
	lda #$27
	sta $2006
	lda #$E0
	sta $2006
	lda #$FF
	sta $2007
	
	lda #$22
	sta $2006
	lda #$60
	sta $2006
	lda #$FF
	sta $2007
	
	lda #$26
	sta $2006
	lda #$60
	sta $2006
	lda #$FF
	sta $2007
	
	jsr Raycast.InitializeNT
	
	lda #$10
	sta Raycast.CHRBank				;Update Bank $1000
	lda #$00
	sta Raycast.$2000				;Show Table #1 and Bank $0000

	
	lda $2002
-	
	lda $2002
	bpl -
	
	lda #$00
	sta $2001

	lda #0
	sta Game.PlayerLeftAngle
	
	lda #40
	sta Game.PlayerXL
	sta Game.PlayerYL
	lda #$60
	sta Game.PlayerYH
	sta Game.PlayerXH
	
	
	lda #>Raycast.SpritePage
	sta $4014
	
	lda #$00
	sta $2005
	sta $2005
	lda #$1E
	sta $2001
	lda Raycast.$2000
	ora #$80
	sta $2000
	rts
	
Raycast.Mode0.ClearCHR:
;Clears virtual CHR table and Name Table

	ldx #0
	lda #$00
-
	sta Raycast.CHR.w,x
	sta Raycast.CHR.w+$100,x
	sta Raycast.CHR.w+$200,x
	sta Raycast.CHR.w+$300,x
	sta Raycast.CHR.w+$400,x
	sta Raycast.CHR.w+$500,x
	sta Raycast.CHR.w+$600,x
	sta Raycast.CHR.w+$700,x
	sta Raycast.CHR.w+$800,x
	sta Raycast.CHR.w+$900,x
	sta Raycast.CHR.w+$A00,x
	sta Raycast.CHR.w+$B00,x
	sta Raycast.CHR.w+$C00,x
	sta Raycast.CHR.w+$D00,x
	sta Raycast.CHR.w+$E00,x
	sta Raycast.CHR.w+$F00,x

	inx
	bne -
	
	ldx #0
	ldy #16
-	
	lda #$FF
	sta Raycast.CHR.w+$FF0,x
	inx
	dey
	bne -
	rts

Raycast.Mode0.NMI:
	pha
	txa
	pha
	tya
	pha

	jsr Raycast.Mode0.NMI.PPUUpdates
	jsr Raycast.Mode0.NMI.APUUpdates

	inc Standard.VBLCount

	pla
	tay
	pla
	tax
	pla
	rti


Raycast.Mode0.Main:
	.include "raycast_main_loop.asm"
	
	jmp MainLoopReturn


Raycast.Mode0.NMI.PPUUpdates:
	lda #$00
	sta $2001
	
	lda #$3F
	sta $2006
	lda #$00
	sta $2006
	
	ldx #32
	ldy #0
-
	lda Raycast.Palette.w,y
	sta $2007
	iny
	dex
	bne -
	
	lda #>Raycast.SpritePage
	sta $4014
	
	lda #$00
	sta $2005
	sta $2005
	lda #$1E
	sta $2001
	lda Raycast.$2000
	ora #$80
	sta $2000
	rts
	
Raycast.Mode0.NMI.APUUpdates:
	rts
	
Raycast.Mode0.InitSprites:
	
	lda #$F8
	sta Raycast.SpritePage+4
	sta Raycast.SpritePage+8
	sta Raycast.SpritePage+12
	sta Raycast.SpritePage+16
	sta Raycast.SpritePage+20
	sta Raycast.SpritePage+24
	sta Raycast.SpritePage+28
	sta Raycast.SpritePage+32
	sta Raycast.SpritePage+32+4
	sta Raycast.SpritePage+32+8
	sta Raycast.SpritePage+32+12
	sta Raycast.SpritePage+32+16
	sta Raycast.SpritePage+32+20
	sta Raycast.SpritePage+32+24
	sta Raycast.SpritePage+32+28
	sta Raycast.SpritePage+64
	sta Raycast.SpritePage+64+4
	sta Raycast.SpritePage+64+8
	sta Raycast.SpritePage+64+12
	sta Raycast.SpritePage+64+16
	sta Raycast.SpritePage+64+20
	sta Raycast.SpritePage+64+24
	sta Raycast.SpritePage+64+28
	sta Raycast.SpritePage+96
	sta Raycast.SpritePage+96+4
	sta Raycast.SpritePage+96+8
	sta Raycast.SpritePage+96+12
	sta Raycast.SpritePage+96+16
	sta Raycast.SpritePage+96+20
	sta Raycast.SpritePage+96+24
	sta Raycast.SpritePage+96+28
	sta Raycast.SpritePage+128
	sta Raycast.SpritePage+128+4
	sta Raycast.SpritePage+128+8
	sta Raycast.SpritePage+128+12
	sta Raycast.SpritePage+128+16
	sta Raycast.SpritePage+128+20
	sta Raycast.SpritePage+128+24
	sta Raycast.SpritePage+128+28
	sta Raycast.SpritePage+160
	sta Raycast.SpritePage+160+4
	sta Raycast.SpritePage+160+8
	sta Raycast.SpritePage+160+12
	sta Raycast.SpritePage+160+16
	sta Raycast.SpritePage+160+20
	sta Raycast.SpritePage+160+24
	sta Raycast.SpritePage+160+28
	sta Raycast.SpritePage+192
	sta Raycast.SpritePage+192+4
	sta Raycast.SpritePage+192+8
	sta Raycast.SpritePage+192+12
	sta Raycast.SpritePage+192+16
	sta Raycast.SpritePage+192+20
	sta Raycast.SpritePage+192+24
	sta Raycast.SpritePage+192+28
	sta Raycast.SpritePage+224
	sta Raycast.SpritePage+224+4
	sta Raycast.SpritePage+224+8
	sta Raycast.SpritePage+224+12
	sta Raycast.SpritePage+224+16
	sta Raycast.SpritePage+224+20
	sta Raycast.SpritePage+224+24
	sta Raycast.SpritePage+224+28
	
	
	lda #151
	sta Raycast.SpritePage
	lda #$FF
	sta Raycast.SpritePage+1
	lda #3
	sta Raycast.SpritePage+2
	lda #0
	sta Raycast.SpritePage+3
	rts
	
Raycast.DumpTestCHR:
	MMC3.BankSwitch8000() 13
	
	lda #$80
	sta Standard.ZTempWord.0+1
	lda #$00
	sta Standard.ZTempWord.0
	
	lda #<Raycast.CHR
	sta Standard.ZTempWord.1
	lda #>Raycast.CHR
	sta Standard.ZTempWord.1+1
	
	ldy #$40
	ldx #16
-
	lda (Standard.ZTempWord.0),y
	sta (Standard.ZTempWord.1),y
	iny
	bne -
	inc Standard.ZTempWord.0+1
	inc Standard.ZTempWord.1+1
	dex
	bne -
	rts
	
Raycast.DumpTestPal:
	ldx #0
	ldy #32
-
	lda Raycast.TestPal.w,x
	sta Raycast.Palette.w,x
	inx
	dey
	bne -
	rts
	
Raycast.TestPal:
	.db $0F,$00,$10,$30,$0F,$01,$11,$31,$0F,$05,$15,$35,$0F,$08,$18,$0F
	.db $0F,$00,$10,$30,$0F,$01,$11,$31,$0F,$05,$15,$35,$0F,$08,$18,$0F
	
Raycasting.DrawObjects.DrawColumn0toF:
	stx Standard.ZTempByte.0
	sty Standard.ZTempByte.1
	MMC3.BankSwitch8000() 6
	ldx Standard.ZTempByte.0
	ldy Standard.ZTempByte.1
	jsr Raycasting.ObjectDraw.DrawColumn0toF
	MMC3.BankSwitch8000() 5
	rts
	
Raycasting.DrawObjects.DrawColumn10to14:
	stx Standard.ZTempByte.0
	sty Standard.ZTempByte.1
	MMC3.BankSwitch8000() 6
	ldx Standard.ZTempByte.0
	ldy Standard.ZTempByte.1
	jsr Raycasting.ObjectDraw.DrawColumn10to14
	MMC3.BankSwitch8000() 5
	rts
	
Raycasting.DrawObjects.ClearColumnArrays:
	MMC3.BankSwitch8000() 6
	jsr Raycasting.DrawObject.ClearColumnArrays
	MMC3.BankSwitch8000() 5
	rts
	
Raycasting.DrawObjects.XORFillColumn0:
	MMC3.BankSwitch8000() 6
	jsr Raycasting.DrawObject.XORFillColumn0
	MMC3.BankSwitch8000() 5
	rts
Raycasting.DrawObjects.XORFillColumn1:
	MMC3.BankSwitch8000() 6
	jsr Raycasting.DrawObject.XORFillColumn1
	MMC3.BankSwitch8000() 5
	rts
Raycasting.DrawObjects.XORFillColor0:
	MMC3.BankSwitch8000() 6
	jsr Raycasting.DrawObject.XORFillColor0
	MMC3.BankSwitch8000() 5
	rts
	
.include "raycast_update_chr.asm"