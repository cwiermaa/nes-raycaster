.MACRO Raycast.ResetScroll()
	lda #$00
	sta $2006
	lda #41
	sta $2005
	ldx #0
	lda #$A0
	ldy #$1E
	stx $2005.w
	sta $2006
	sty $2001.w
	lda Raycast.$2000								;Update CHR2
	sta $2000										;Re-enable rendering /TIMED CODE
.ENDM

	jsr Raycasting.Raycast
	
	lda Raycast.DrawObject
	bne +
	
	;MMC3.BankSwitch8000() 5
	;jsr Raycasting.DrawObject
	
	MMC3.BankSwitch8000() 11
	ldx #0
	jsr Raycast.XORFill
	ldx #8
	jsr Raycast.XORFill
	
	MMC3.BankSwitch8000() 10
	ldx #0
	jsr Raycast.XORFill2
	ldx #8
	jsr Raycast.XORFill2
	
	
+

-
	bit $2002
	bvs -
-
	bit $2002
	bvc -
	
	
	lda #$00
	sta $2001
	jsr Raycast.UpdateCHR1							;/TIMED CODE, disable rendering
	
	Raycast.ResetScroll()

	jsr Raycast.ClearVirtualCHR1
-
	bit $2002
	bvs -
-
	bit $2002
	bvc -

													;Wait for sprite #0

	lda #$00
	sta $2001
	jsr Raycast.UpdateCHR2							;/TIMED CODE, disable rendering
	
	Raycast.ResetScroll()
													;Re-enable rendering /TIMED CODE
	
	jsr Raycast.ClearVirtualCHR2

	lda Raycast.CHRBank
	eor #$10
	sta Raycast.CHRBank
	lda Raycast.$2000
	ora #$80
	sta $2000
	lda Raycast.$2000
	eor #$18
	sta Raycast.$2000
	