.include "memory.asm"
.include "modules.asm"

.incdir "data"
.include "data_include.asm"

.bank 15 SLOT 3
.orga $E000
.section "Fixed" FORCE	

RESET:
	cld
	sei
	ldx #$FF
	txs

	lda #$00
	sta $2000
	
-
	bit $2002
	bpl -
-
	bit $2002
	bpl -
-
	bit $2002
	bpl -
	
	sta $2006
	sta $2005
	sta $2005
	sta $2006
	sta $2001

	ldx #0
	txa
-
	sta $0,x
	sta $200,x
	sta $300,x
	sta $400,x
	sta $500,x
	sta $600,x
	sta $700,x
	inx
	bne -
	
	MMC3.Initialize()

	MMC3.BankSwitchA000() 14
	jsr Raycast.Mode0.Initialize
	
;******* Software Initialization ********
	lda #<Raycast.Mode0.Main
	sta Standard.MainL
	lda #>Raycast.Mode0.Main
	sta Standard.MainH

	lda #<Raycast.Mode0.NMI
	sta Standard.NMIL
	lda #>Raycast.Mode0.NMI
	sta Standard.NMIH
;***************************************
	lda #$80
	sta $2000

MainLoop:
	jmp (Standard.MainL)

MainLoopReturn:
	lda Standard.VBLCount
-
	cmp Standard.VBLCount
	beq -
	jmp MainLoop

IRQ:
	rti
	
NMI:
	jmp (Standard.NMIL)

.ends

.incdir "code"
.include "code_include.asm"

.bank 13 SLOT 2
.section "graphics" FREE
.incdir "data/standard/graphics"
.include "graphics.asm"
.ends

.bank 15 SLOT 3
.orga $FFFA
.section "vectors" FORCE
.dw NMI
.dw RESET
.dw IRQ
.ends