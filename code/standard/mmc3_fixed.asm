
JSRBankSwitch8000:
;Function: Given a bank number and an address, this routine will load the appropriate bank into $8000-$9FFF
;And jsr to an address within that bank.
;Expected: From Bank in A, Address L X, H in Y, To Bank in ToBank Variable. Expects that calling address is
;From the bank being switched.

	pha					;4
	stx Standard.MMC3.Bankjump.ToAddL	;7
	sty Standard.MMC3.Bankjump.ToAddH	;10
	lda #6					;12
	sta $8000				;16
	lda Standard.MMC3.Bankjump.ToBank	;19
	sta $8001				;23
	lda #>JSRBankSwitch8000R		;25
	pha					;28
	lda #<JSRBankSwitch8000R - 1		;30
	pha					;33
	lda Standard.MMC3.Bankjump.A		;36
	ldx Standard.MMC3.Bankjump.X		;39
	ldy Standard.MMC3.Bankjump.Y		;42
	jmp (Standard.MMC3.Bankjump.ToAddL)	;47
JSRBankSwitch8000R:
	sta Standard.MMC3.Bankjump.Temp		;50
	lda #6					;52
	sta $8000				;56
	pla					;60
	sta $8001				;64
	lda Standard.MMC3.Bankjump.Temp		;67
	rts					;+12 = 79

JSRBankSwitchA000:
;Function: Given a bank number and an address, this routine will load the appropriate bank into $A000-$BFFF
;And jsr to an address within that bank.
;Expected: From Bank in A, Address L X, H in Y, To Bank in ToBank Variable. Expects that calling address is
;From the bank being switched.

	pha
	stx Standard.MMC3.Bankjump.ToAddL
	sty Standard.MMC3.Bankjump.ToAddH
	lda #7
	sta $8000
	lda Standard.MMC3.Bankjump.ToBank
	sta $8001
	lda #>JSRBankSwitchA000R
	pha
	lda #<JSRBankSwitchA000R - 1
	pha
	lda Standard.MMC3.Bankjump.A
	ldx Standard.MMC3.Bankjump.X
	ldy Standard.MMC3.Bankjump.Y
	jmp (Standard.MMC3.Bankjump.ToAddL)
JSRBankSwitchA000R:
	sta Standard.MMC3.Bankjump.Temp
	lda #7
	sta $8000
	pla
	sta $8001
	lda Standard.MMC3.Bankjump.Temp
	rts
