Raycast.UpdateCHR:
	
	lda #$00
	sta $2001
	
	jsr Raycast.UpdateCHR1
	jsr Raycast.UpdateCHR2
	rts
	
	
Raycast.UpdateCHR1:
	lda Raycast.$2000			;3
	ora #4						;5
	sta $2000					;7
	ldx #0						;9
	ldy #32						;11
	lda Raycast.CHRBank			;14
	sta $2006					;20
	stx $2006.w					;28
-
	lda Raycast.CHR.w,x
	sta $2007
	lda Raycast.CHR.w+$20,x
	sta $2007
	lda Raycast.CHR.w+$40,x
	sta $2007
	lda Raycast.CHR.w+$60,x
	sta $2007
	lda Raycast.CHR.w+$80,x
	sta $2007
	lda Raycast.CHR.w+$A0,x
	sta $2007
	lda Raycast.CHR.w+$C0,x
	sta $2007
	lda Raycast.CHR.w+$E0,x
	sta $2007
	lda Raycast.CHR.w+$100,x
	sta $2007
	lda Raycast.CHR.w+$120,x
	sta $2007
	lda Raycast.CHR.w+$140,x
	sta $2007
	lda Raycast.CHR.w+$160,x
	sta $2007
	lda Raycast.CHR.w+$180,x
	sta $2007
	lda Raycast.CHR.w+$1A0,x
	sta $2007
	lda Raycast.CHR.w+$1C0,x
	sta $2007
	lda Raycast.CHR.w+$1E0,x
	sta $2007
	lda Raycast.CHR.w+$200,x
	sta $2007
	lda Raycast.CHR.w+$220,x
	sta $2007
	lda Raycast.CHR.w+$240,x
	sta $2007
	lda Raycast.CHR.w+$260,x
	sta $2007
	lda Raycast.CHR.w+$280,x
	sta $2007
	lda Raycast.CHR.w+$2A0,x
	sta $2007
	lda Raycast.CHR.w+$2C0,x
	sta $2007
	lda Raycast.CHR.w+$2E0,x
	sta $2007
	lda Raycast.CHR.w+$300,x
	sta $2007
	lda Raycast.CHR.w+$320,x
	sta $2007
	lda Raycast.CHR.w+$340,x
	sta $2007
	lda Raycast.CHR.w+$360,x
	sta $2007
	lda Raycast.CHR.w+$380,x
	sta $2007
	lda Raycast.CHR.w+$3A0,x
	sta $2007
	lda Raycast.CHR.w+$3C0,x
	sta $2007
	lda Raycast.CHR.w+$3E0,x
	sta $2007
	lda Raycast.CHR.w+$400,x
	sta $2007
	lda Raycast.CHR.w+$20+$400,x
	sta $2007
	lda Raycast.CHR.w+$40+$400,x
	sta $2007
	lda Raycast.CHR.w+$60+$400,x
	sta $2007
	lda Raycast.CHR.w+$80+$400,x
	sta $2007
	lda Raycast.CHR.w+$A0+$400,x
	sta $2007
	lda Raycast.CHR.w+$C0+$400,x
	sta $2007
	lda Raycast.CHR.w+$E0+$400,x
	sta $2007
	lda Raycast.CHR.w+$100+$400,x
	sta $2007
	lda Raycast.CHR.w+$120+$400,x
	sta $2007
	lda Raycast.CHR.w+$140+$400,x
	sta $2007
	lda Raycast.CHR.w+$160+$400,x
	sta $2007
	lda Raycast.CHR.w+$180+$400,x
	sta $2007
	lda Raycast.CHR.w+$1A0+$400,x
	sta $2007
	lda Raycast.CHR.w+$1C0+$400,x
	sta $2007
	lda Raycast.CHR.w+$1E0+$400,x
	sta $2007
	lda Raycast.CHR.w+$200+$400,x
	sta $2007
	lda Raycast.CHR.w+$220+$400,x
	sta $2007
	lda Raycast.CHR.w+$240+$400,x
	sta $2007
	lda Raycast.CHR.w+$260+$400,x
	sta $2007
	lda Raycast.CHR.w+$280+$400,x
	sta $2007
	lda Raycast.CHR.w+$2A0+$400,x
	sta $2007
	lda Raycast.CHR.w+$2C0+$400,x
	sta $2007
	lda Raycast.CHR.w+$2E0+$400,x
	sta $2007
	lda Raycast.CHR.w+$300+$400,x
	sta $2007
	lda Raycast.CHR.w+$320+$400,x
	sta $2007
	lda Raycast.CHR.w+$340+$400,x
	sta $2007
	lda Raycast.CHR.w+$360+$400,x
	sta $2007
	lda Raycast.CHR.w+$380+$400,x
	sta $2007
	lda Raycast.CHR.w+$3A0+$400,x
	sta $2007
	lda Raycast.CHR.w+$3C0+$400,x
	sta $2007
	lda Raycast.CHR.w+$3E0+$400,x
	sta $2007
	
	inx						;2
	dey						;4
	beq +					;6
	lda Raycast.CHRBank		;9
	ora #$00				;11
	sta $2006				;15
	stx $2006.w				;23
	jmp -					;26
+
	rts

	
Raycast.UpdateCHR2:

	lda Raycast.$2000
	ora #4
	sta $2000
	ldx #0
	ldy #32
	lda Raycast.CHRBank
	ora #$08
	sta $2006
	stx $2006.w
-

	lda Raycast.CHR.w+$800,x
	sta $2007
	lda Raycast.CHR.w+$20+$800,x
	sta $2007
	lda Raycast.CHR.w+$40+$800,x
	sta $2007
	lda Raycast.CHR.w+$60+$800,x
	sta $2007
	lda Raycast.CHR.w+$80+$800,x
	sta $2007
	lda Raycast.CHR.w+$A0+$800,x
	sta $2007
	lda Raycast.CHR.w+$C0+$800,x
	sta $2007
	lda Raycast.CHR.w+$E0+$800,x
	sta $2007
	lda Raycast.CHR.w+$100+$800,x
	sta $2007
	lda Raycast.CHR.w+$120+$800,x
	sta $2007
	lda Raycast.CHR.w+$140+$800,x
	sta $2007
	lda Raycast.CHR.w+$160+$800,x
	sta $2007
	lda Raycast.CHR.w+$180+$800,x
	sta $2007
	lda Raycast.CHR.w+$1A0+$800,x
	sta $2007
	lda Raycast.CHR.w+$1C0+$800,x
	sta $2007
	lda Raycast.CHR.w+$1E0+$800,x
	sta $2007
	lda Raycast.CHR.w+$200+$800,x
	sta $2007
	lda Raycast.CHR.w+$220+$800,x
	sta $2007
	lda Raycast.CHR.w+$240+$800,x
	sta $2007
	lda Raycast.CHR.w+$260+$800,x
	sta $2007
	lda Raycast.CHR.w+$280+$800,x
	sta $2007
	lda Raycast.CHR.w+$2A0+$800,x
	sta $2007
	
	lda Raycast.CHR.w+$2C0+$800,x
	sta $2007
	lda Raycast.CHR.w+$2E0+$800,x
	sta $2007
	lda Raycast.CHR.w+$300+$800,x
	sta $2007
	lda Raycast.CHR.w+$320+$800,x
	sta $2007
	lda Raycast.CHR.w+$340+$800,x
	sta $2007
	lda Raycast.CHR.w+$360+$800,x
	sta $2007
	lda Raycast.CHR.w+$380+$800,x
	sta $2007
	lda Raycast.CHR.w+$3A0+$800,x
	sta $2007
	lda Raycast.CHR.w+$3C0+$800,x
	sta $2007
	lda Raycast.CHR.w+$3E0+$800,x
	sta $2007
	lda Raycast.CHR.w+$C00,x
	sta $2007
	lda Raycast.CHR.w+$20+$C00,x
	sta $2007
	lda Raycast.CHR.w+$40+$C00,x
	sta $2007
	lda Raycast.CHR.w+$60+$C00,x
	sta $2007
	lda Raycast.CHR.w+$80+$C00,x
	sta $2007
	lda Raycast.CHR.w+$A0+$C00,x
	sta $2007
	lda Raycast.CHR.w+$C0+$C00,x
	sta $2007
	lda Raycast.CHR.w+$E0+$C00,x
	sta $2007
	lda Raycast.CHR.w+$100+$C00,x
	sta $2007
	lda Raycast.CHR.w+$120+$C00,x
	sta $2007
	lda Raycast.CHR.w+$140+$C00,x
	sta $2007
	lda Raycast.CHR.w+$160+$C00,x
	sta $2007
	lda Raycast.CHR.w+$180+$C00,x
	sta $2007
	lda Raycast.CHR.w+$1A0+$C00,x
	sta $2007
	lda Raycast.CHR.w+$1C0+$C00,x
	sta $2007
	lda Raycast.CHR.w+$1E0+$C00,x
	sta $2007
	lda Raycast.CHR.w+$200+$C00,x
	sta $2007
	lda Raycast.CHR.w+$220+$C00,x
	sta $2007
	lda Raycast.CHR.w+$240+$C00,x
	sta $2007
	lda Raycast.CHR.w+$260+$C00,x
	sta $2007
	lda Raycast.CHR.w+$280+$C00,x
	sta $2007
	lda Raycast.CHR.w+$2A0+$C00,x
	sta $2007
	lda Raycast.CHR.w+$2C0+$C00,x
	sta $2007
	lda Raycast.CHR.w+$2E0+$C00,x
	sta $2007
	lda Raycast.CHR.w+$300+$C00,x
	sta $2007
	lda Raycast.CHR.w+$320+$C00,x
	sta $2007
	lda Raycast.CHR.w+$340+$C00,x
	sta $2007
	lda Raycast.CHR.w+$360+$C00,x
	sta $2007
	lda Raycast.CHR.w+$380+$C00,x
	sta $2007
	lda Raycast.CHR.w+$3A0+$C00,x
	sta $2007
	lda Raycast.CHR.w+$3C0+$C00,x
	sta $2007
	lda Raycast.CHR.w+$3E0+$C00,x
	sta $2007
	inx
	dey
	beq +
	lda Raycast.CHRBank
	ora #$08
	sta $2006
	stx $2006.w
	jmp -
+
	rts
	
Raycast.ClearVirtualCHR1:
	ldx #31
	lda #$00
-
	sta Raycast.CHR.w,x
	sta Raycast.CHR.w+$20,x
	sta Raycast.CHR.w+$40,x
	sta Raycast.CHR.w+$60,x
	sta Raycast.CHR.w+$80,x
	sta Raycast.CHR.w+$A0,x
	sta Raycast.CHR.w+$C0,x
	sta Raycast.CHR.w+$E0,x
	sta Raycast.CHR.w+$100,x
	sta Raycast.CHR.w+$100+$20,x
	sta Raycast.CHR.w+$100+$40,x
	sta Raycast.CHR.w+$100+$60,x
	sta Raycast.CHR.w+$100+$80,x
	sta Raycast.CHR.w+$100+$A0,x
	sta Raycast.CHR.w+$100+$C0,x
	sta Raycast.CHR.w+$100+$E0,x
	sta Raycast.CHR.w+$200,x
	sta Raycast.CHR.w+$200+$20,x
	sta Raycast.CHR.w+$200+$40,x
	sta Raycast.CHR.w+$200+$60,x
	sta Raycast.CHR.w+$200+$80,x
	sta Raycast.CHR.w+$200+$A0,x
	sta Raycast.CHR.w+$200+$C0,x
	sta Raycast.CHR.w+$200+$E0,x
	sta Raycast.CHR.w+$300,x
	sta Raycast.CHR.w+$300+$20,x
	sta Raycast.CHR.w+$300+$40,x
	sta Raycast.CHR.w+$300+$60,x
	sta Raycast.CHR.w+$300+$80,x
	sta Raycast.CHR.w+$300+$A0,x
	sta Raycast.CHR.w+$300+$C0,x
	sta Raycast.CHR.w+$300+$E0,x
	sta Raycast.CHR.w+$400,x
	sta Raycast.CHR.w+$400+$20,x
	sta Raycast.CHR.w+$400+$40,x
	sta Raycast.CHR.w+$400+$60,x
	sta Raycast.CHR.w+$400+$80,x
	sta Raycast.CHR.w+$400+$A0,x
	sta Raycast.CHR.w+$400+$C0,x
	sta Raycast.CHR.w+$400+$E0,x
	sta Raycast.CHR.w+$500,x
	sta Raycast.CHR.w+$500+$20,x
	sta Raycast.CHR.w+$500+$40,x
	sta Raycast.CHR.w+$500+$60,x
	
	sta Raycast.CHR.w+$500+$80,x
	sta Raycast.CHR.w+$500+$A0,x
	sta Raycast.CHR.w+$500+$C0,x
	sta Raycast.CHR.w+$500+$E0,x
	sta Raycast.CHR.w+$600,x
	sta Raycast.CHR.w+$600+$20,x
	sta Raycast.CHR.w+$600+$40,x
	sta Raycast.CHR.w+$600+$60,x
	sta Raycast.CHR.w+$600+$80,x
	sta Raycast.CHR.w+$600+$A0,x
	sta Raycast.CHR.w+$600+$C0,x
	sta Raycast.CHR.w+$600+$E0,x
	sta Raycast.CHR.w+$700,x
	sta Raycast.CHR.w+$700+$20,x
	sta Raycast.CHR.w+$700+$40,x
	sta Raycast.CHR.w+$700+$60,x
	sta Raycast.CHR.w+$700+$80,x
	sta Raycast.CHR.w+$700+$A0,x
	sta Raycast.CHR.w+$700+$C0,x
	sta Raycast.CHR.w+$700+$E0,x
	dex
	bmi +
	jmp -
+
	rts
	
Raycast.ClearVirtualCHR2:
	ldx #31
	lda #$00
-
	sta Raycast.CHR.w+$800,x
	sta Raycast.CHR.w+$800+$20,x
	sta Raycast.CHR.w+$800+$40,x
	sta Raycast.CHR.w+$800+$60,x
	sta Raycast.CHR.w+$800+$80,x
	sta Raycast.CHR.w+$800+$A0,x
	sta Raycast.CHR.w+$800+$C0,x
	sta Raycast.CHR.w+$800+$E0,x
	sta Raycast.CHR.w+$900,x
	sta Raycast.CHR.w+$900+$20,x
	sta Raycast.CHR.w+$900+$40,x
	sta Raycast.CHR.w+$900+$60,x
	sta Raycast.CHR.w+$900+$80,x
	sta Raycast.CHR.w+$900+$A0,x
	sta Raycast.CHR.w+$900+$C0,x
	sta Raycast.CHR.w+$900+$E0,x
	sta Raycast.CHR.w+$A00,x
	sta Raycast.CHR.w+$A00+$20,x
	sta Raycast.CHR.w+$A00+$40,x
	sta Raycast.CHR.w+$A00+$60,x
	sta Raycast.CHR.w+$A00+$80,x
	sta Raycast.CHR.w+$A00+$A0,x
	sta Raycast.CHR.w+$A00+$C0,x
	sta Raycast.CHR.w+$A00+$E0,x
	sta Raycast.CHR.w+$B00,x
	sta Raycast.CHR.w+$B00+$20,x
	sta Raycast.CHR.w+$B00+$40,x
	sta Raycast.CHR.w+$B00+$60,x
	sta Raycast.CHR.w+$B00+$80,x
	sta Raycast.CHR.w+$B00+$A0,x
	sta Raycast.CHR.w+$B00+$C0,x
	sta Raycast.CHR.w+$B00+$E0,x
	sta Raycast.CHR.w+$C00,x
	sta Raycast.CHR.w+$C00+$20,x
	sta Raycast.CHR.w+$C00+$40,x
	sta Raycast.CHR.w+$C00+$60,x
	sta Raycast.CHR.w+$C00+$80,x
	sta Raycast.CHR.w+$C00+$A0,x
	sta Raycast.CHR.w+$C00+$C0,x
	sta Raycast.CHR.w+$C00+$E0,x
	sta Raycast.CHR.w+$D00,x
	sta Raycast.CHR.w+$D00+$20,x
	sta Raycast.CHR.w+$D00+$40,x
	sta Raycast.CHR.w+$D00+$60,x
	sta Raycast.CHR.w+$D00+$80,x
	sta Raycast.CHR.w+$D00+$A0,x
	sta Raycast.CHR.w+$D00+$C0,x
	sta Raycast.CHR.w+$D00+$E0,x
	sta Raycast.CHR.w+$E00,x
	sta Raycast.CHR.w+$E00+$20,x
	sta Raycast.CHR.w+$E00+$40,x
	sta Raycast.CHR.w+$E00+$60,x
	sta Raycast.CHR.w+$E00+$80,x
	sta Raycast.CHR.w+$E00+$A0,x
	sta Raycast.CHR.w+$E00+$C0,x
	sta Raycast.CHR.w+$E00+$E0,x
	sta Raycast.CHR.w+$F00,x
	sta Raycast.CHR.w+$F00+$20,x
	sta Raycast.CHR.w+$F00+$40,x
	sta Raycast.CHR.w+$F00+$60,x
	sta Raycast.CHR.w+$F00+$80,x
	sta Raycast.CHR.w+$F00+$A0,x
	sta Raycast.CHR.w+$F00+$C0,x
	dex
	bmi +
	jmp -
+
	rts

Raycast.InitializeNT:
	lda #$21
	sta $2006
	sta Standard.ZTempWord.0+1
	lda #$06
	sta $2006
	sta Standard.ZTempWord.0
	lda #11
	sta Standard.ZTempByte.0
	ldx #21
	ldy #0
-
	sty $2007.w
	iny
	dex
	bne -
	clc
	lda Standard.ZTempWord.0
	adc #$20
	sta Standard.ZTempWord.0
	lda Standard.ZTempWord.0+1
	adc #0
	sta Standard.ZTempWord.0+1
	sta $2006
	lda Standard.ZTempWord.0
	sta $2006
	ldx #21
	dec Standard.ZTempByte.0
	bne -
	rts