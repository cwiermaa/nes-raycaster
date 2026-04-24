

.MACRO Standard.Main.ReadController()
	lda Standard.Control.Current				;3
	sta Standard.Control.Previous				;6

	ldx #1												;8
	stx $4016.w											;12
	dex													;14
	stx $4016.w											;18

	ldy #8												;20
-
	lda $4016											;4
	lsr a												;6
	rol Standard.Control.Current				;11
	dey													;13
	bne -												;16 * 8 - 1 = 127
														;147
	lda Standard.Control.Current				;150
	and Standard.Control.Previous				;153
	eor Standard.Control.Current				;156
	sta Standard.Control.Trigger				;159 Gives us a 1 for each button that is NEWLY pressed.
														;And wasn't pressed last frame.

.ENDM

;***********************************************************************************************
;MMC3 Macros


.MACRO MMC3.Initialize()
	lda #0
	sta $A000			;Set vertical mirroring
	lda #$80
	sta $A001			;Enable WRAM, Allow writes
	ldy #6			;Initialized $8000-$BFFF with banks 0 and 1.
	ldx #0
	sty $8000.w
	stx $8001.w
	iny
	inx
	sty $8000.w
	stx $8001.w

	ldx #0
-
	stx $8000.w
	lda MMC3.Initialize.CHRBanks.w,x
	sta $8001
	inx
	cpx #6
	bne -
	jmp +
MMC3.Initialize.CHRBanks:
	.db $00,$02,$04,$05,$06,$07
	
+
.ENDM

.MACRO MMC3.BankSwitch8000()
;Bank switch bank at $8000-$9FFF

	lda #6
	sta $8000
	lda #\1
	sta $8001
.ENDM

.MACRO MMC3.BankSwitchA000()
;Bank switch bank at $A000-$BFFF

	lda #7
	sta $8000
	lda #\1
	sta $8001
.ENDM

.DEFINE MMC3.JSRToBank.PreserveNone 0
.DEFINE MMC3.JSRToBank.PreserveY 1
.DEFINE MMC3.JSRToBank.PreserveX 2
.DEFINE MMC3.JSRToBank.PreserveXY 3
.DEFINE MMC3.JSRToBank.PreserveA 4
.DEFINE MMC3.JSRToBank.PreserveAY 5
.DEFINE MMC3.JSRToBank.PreserveAX 6
.DEFINE MMC3.JSRToBank.PreserveAXY 7

.MACRO MMC3.JSRToBank8000()
;Function: Given a calling bank number, destination address, and a destination bank number, this routine
;calls a subroutine in another bank formatted for the same bank as the calling bank, and returns to the original
;position from which the routine was called. Also has the ability to preserve arguments passed in A/X/Y if desired.
;Expected arguments: Calling Bank #, Destination Add L, Destination Add H, Destination Bank #, PreserveA/X/Y


.IF \5 == MMC3.JSRToBank.PreserveY
	sty Standard.MMC3.Bankjump.Y
.ENDIF
.IF \5 == MMC3.JSRToBank.PreserveX
	stx Standard.MMC3.Bankjump.X
.ENDIF
.IF \5 == MMC3.JSRToBank.PreserveXY
	sty Standard.MMC3.Bankjump.Y
	stx Standard.MMC3.Bankjump.X
.ENDIF
.IF \5 == MMC3.JSRToBank.PreserveA
	sta Standard.MMC3.Bankjump.A
.ENDIF
.IF \5 == MMC3.JSRToBank.PreserveAY
	sta Standard.MMC3.Bankjump.A
	sty Standard.MMC3.Bankjump.Y
.ENDIF
.IF \5 == MMC3.JSRToBank.PreserveAX
	sta Standard.MMC3.Bankjump.A
	stx Standard.MMC3.Bankjump.X
.ENDIF
.IF \5 == MMC3.JSRToBank.PreserveAXY
	sta Standard.MMC3.Bankjump.A
	stx Standard.MMC3.Bankjump.X
	sty Standard.MMC3.Bankjump.Y
.ENDIF

	lda #\4					;2
	sta Standard.MMC3.Bankjump.ToBank	;5
	lda #\1					;7
	ldx #\2					;9
	ldy #\3					;11
	jsr JSRBankSwitch8000			;79 + 12 = 91 cycles + 11 = 102 cycles

.ENDM


.MACRO MMC3.JSRToBankA000()
;Function: Given a calling bank number, destination address, and a destination bank number, this routine
;calls a subroutine in another bank formatted for the same bank as the calling bank, and returns to the original
;position from which the routine was called. Also has the ability to preserve arguments passed in A/X/Y if desired.
;Expected arguments: Calling Bank #, Destination Add L, Destination Add H, Destination Bank #, PreserveA/X/Y


.IF \5 == MMC3.JSRToBank.PreserveY
	sty Standard.MMC3.Bankjump.Y
.ENDIF
.IF \5 == MMC3.JSRToBank.PreserveX
	stx Standard.MMC3.Bankjump.X
.ENDIF
.IF \5 == MMC3.JSRToBank.PreserveXY
	sty Standard.MMC3.Bankjump.Y
	stx Standard.MMC3.Bankjump.X
.ENDIF
.IF \5 == MMC3.JSRToBank.PreserveA
	sta Standard.MMC3.Bankjump.A
.ENDIF
.IF \5 == MMC3.JSRToBank.PreserveAY
	sta Standard.MMC3.Bankjump.A
	sty Standard.MMC3.Bankjump.Y
.ENDIF
.IF \5 == MMC3.JSRToBank.PreserveAX
	sta Standard.MMC3.Bankjump.A
	stx Standard.MMC3.Bankjump.X
.ENDIF
.IF \5 == MMC3.JSRToBank.PreserveAXY
	sta Standard.MMC3.Bankjump.A
	stx Standard.MMC3.Bankjump.X
	sty Standard.MMC3.Bankjump.Y
.ENDIF

	lda #\4
	sta Standard.MMC3.Bankjump.ToBank
	lda #\1
	ldx #\2
	ldy #\3
	jsr JSRBankSwitchA000

.ENDM
;***********************************************************************************************