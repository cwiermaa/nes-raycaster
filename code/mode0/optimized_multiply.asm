Raycasting.Multiply1:
	jmp Raycasting.Multiply.Return
	
Raycasting.Multiply2:
	stx Standard.ZTempByte.0
	asl a
	rol Standard.ZTempByte.0
	ldx Standard.ZTempByte.0
	jmp Raycasting.Multiply.Return
	
Raycasting.Multiply3:
	stx Standard.ZTempByte.1
	stx Standard.ZTempByte.3
	sta Standard.ZTempByte.0
	asl a
	rol Standard.ZTempByte.3
	clc
	adc Standard.ZTempByte.0
	sta Standard.ZTempByte.2
	lda Standard.ZTempByte.3
	adc Standard.ZTempByte.1
	tax
	lda Standard.ZTempByte.2
	jmp Raycasting.Multiply.Return
	
Raycasting.Multiply4:
	stx Standard.ZTempByte.0
	asl a
	rol Standard.ZTempByte.0
	asl a
	rol Standard.ZTempByte.0
	ldx Standard.ZTempByte.0
	jmp Raycasting.Multiply.Return
	
Raycasting.Multiply5:
	stx Standard.ZTempByte.1
	stx Standard.ZTempByte.3
	sta Standard.ZTempByte.0
	asl a
	rol Standard.ZTempByte.3
	asl a
	rol Standard.ZTempByte.3
	clc
	adc Standard.ZTempByte.0
	sta Standard.ZTempByte.2
	lda Standard.ZTempByte.3
	adc Standard.ZTempByte.1
	tax
	lda Standard.ZTempByte.2
	jmp Raycasting.Multiply.Return
	
Raycasting.Multiply6:

	stx Standard.ZTempByte.3
	asl a
	sta Standard.ZTempByte.0
	rol Standard.ZTempByte.3
	ldx Standard.ZTempByte.3
	stx Standard.ZTempByte.1
	asl a
	rol Standard.ZTempByte.3
	clc
	adc Standard.ZTempByte.0
	sta Standard.ZTempByte.2
	lda Standard.ZTempByte.3
	adc Standard.ZTempByte.1
	tax
	lda Standard.ZTempByte.2
	jmp Raycasting.Multiply.Return
	
Raycasting.Multiply7:

	stx Standard.ZTempByte.1
	stx Standard.ZTempByte.3
	sta Standard.ZTempByte.0
	asl a
	rol Standard.ZTempByte.3
	asl a
	rol Standard.ZTempByte.3
	asl a
	rol Standard.ZTempByte.3
	sec
	sbc Standard.ZTempByte.0
	sta Standard.ZTempByte.2
	lda Standard.ZTempByte.3
	sbc Standard.ZTempByte.1
	tax
	lda Standard.ZTempByte.2
	jmp Raycasting.Multiply.Return
	
Raycasting.Multiply8:

	stx Standard.ZTempByte.0
	asl a
	rol Standard.ZTempByte.0
	asl a
	rol Standard.ZTempByte.0
	asl a
	rol Standard.ZTempByte.0
	ldx Standard.ZTempByte.0
	jmp Raycasting.Multiply.Return
Raycasting.Multiply9:
	stx Standard.ZTempByte.1	;$FF
	stx Standard.ZTempByte.3	;$FF
	sta Standard.ZTempByte.0	;$FF
	asl a						;$FE
	rol Standard.ZTempByte.1	;$FF
	asl a						;$FC
	rol Standard.ZTempByte.1	;$FF
	asl a						;$F8
	rol Standard.ZTempByte.1	;$FF
	clc
	adc Standard.ZTempByte.0
	sta Standard.ZTempByte.2
	lda Standard.ZTempByte.1
	adc Standard.ZTempByte.3
	tax
	lda Standard.ZTempByte.2
	jmp Raycasting.Multiply.Return
	
Raycasting.Multiply10:

	stx Standard.ZTempByte.3
	asl a
	sta Standard.ZTempByte.0
	rol Standard.ZTempByte.3
	ldx Standard.ZTempByte.3
	stx Standard.ZTempByte.1
	asl a
	rol Standard.ZTempByte.3
	asl a
	rol Standard.ZTempByte.3
	clc
	adc Standard.ZTempByte.0
	sta Standard.ZTempByte.2
	lda Standard.ZTempByte.3
	adc Standard.ZTempByte.1
	tax
	lda Standard.ZTempByte.2
	jmp Raycasting.Multiply.Return
	
Raycasting.Multiply11:

	stx Standard.ZTempByte.3
	stx Standard.ZTempByte.5
	sta Standard.ZTempByte.4
	asl a
	rol Standard.ZTempByte.3
	asl a
	sta Standard.ZTempByte.0
	rol Standard.ZTempByte.3
	ldx Standard.ZTempByte.3
	stx Standard.ZTempByte.1
	asl a
	rol Standard.ZTempByte.3
	clc
	adc Standard.ZTempByte.0
	sta Standard.ZTempByte.2
	lda Standard.ZTempByte.3
	adc Standard.ZTempByte.1
	sta Standard.ZTempByte.3
	sec
	lda Standard.ZTempByte.2
	sbc Standard.ZTempByte.4
	sta Standard.ZTempByte.2
	lda Standard.ZTempByte.3
	sbc Standard.ZTempByte.5
	tax
	lda Standard.ZTempByte.2
	jmp Raycasting.Multiply.Return
	
Raycasting.Multiply12:

	stx Standard.ZTempByte.3
	asl a
	rol Standard.ZTempByte.3
	asl a
	sta Standard.ZTempByte.0
	rol Standard.ZTempByte.3
	ldx Standard.ZTempByte.3
	stx Standard.ZTempByte.1
	asl a
	rol Standard.ZTempByte.3
	clc
	adc Standard.ZTempByte.0
	sta Standard.ZTempByte.2
	lda Standard.ZTempByte.3
	adc Standard.ZTempByte.1
	tax
	lda Standard.ZTempByte.2
	jmp Raycasting.Multiply.Return
	
Raycasting.Multiply13:

	stx Standard.ZTempByte.3			;6
	stx Standard.ZTempByte.5			;9
	sta Standard.ZTempByte.4			;12
	asl a								;14
	rol Standard.ZTempByte.3			;19
	asl a								;26
	sta Standard.ZTempByte.0			;29
	rol Standard.ZTempByte.3			;34
	ldx Standard.ZTempByte.3
	stx Standard.ZTempByte.1
	asl a								;41
	rol Standard.ZTempByte.3			;46
	clc									;48
	adc Standard.ZTempByte.0			;51
	sta Standard.ZTempByte.2			;54
	lda Standard.ZTempByte.3			;57
	adc Standard.ZTempByte.1			;60
	sta Standard.ZTempByte.3			;63
	clc									;65
	lda Standard.ZTempByte.2			;68
	adc Standard.ZTempByte.4			;71
	sta Standard.ZTempByte.2			;74
	lda Standard.ZTempByte.3			;77
	adc Standard.ZTempByte.5			;80
	tax									;82
	lda Standard.ZTempByte.2			;85
	jmp Raycasting.Multiply.Return
	
Raycasting.Multiply14:
;X = $01, A = $F1
	stx Standard.ZTempByte.3	;$01
	asl a						;$E2
	sta Standard.ZTempByte.0	;$E2
	rol Standard.ZTempByte.3	;$03
	ldx Standard.ZTempByte.3
	stx Standard.ZTempByte.1
	asl a						;$C4
	rol Standard.ZTempByte.3	;$07
	asl a						;$88
	rol Standard.ZTempByte.3	;$0F
	asl a						;$10
	rol Standard.ZTempByte.3	;$1F
	sec
	sbc Standard.ZTempByte.0	;$2E
	sta Standard.ZTempByte.2	;$2E
	lda Standard.ZTempByte.3	;$1F
	sbc Standard.ZTempByte.1	;$1C
	tax
	lda Standard.ZTempByte.2
	jmp Raycasting.Multiply.Return
	
Raycasting.Multiply15:

	stx Standard.ZTempByte.1
	stx Standard.ZTempByte.3
	sta Standard.ZTempByte.0
	asl a
	rol Standard.ZTempByte.3
	asl a
	rol Standard.ZTempByte.3
	asl a
	rol Standard.ZTempByte.3
	asl a
	rol Standard.ZTempByte.3
	sec
	sbc Standard.ZTempByte.0
	sta Standard.ZTempByte.2
	lda Standard.ZTempByte.3
	sbc Standard.ZTempByte.1
	tax
	lda Standard.ZTempByte.2
	jmp Raycasting.Multiply.Return
	
Raycasting.Multiply16:

	stx Standard.ZTempByte.0
	asl a
	rol Standard.ZTempByte.0
	asl a
	rol Standard.ZTempByte.0
	asl a
	rol Standard.ZTempByte.0
	asl a
	rol Standard.ZTempByte.0
	ldx Standard.ZTempByte.0
	jmp Raycasting.Multiply.Return
	
Raycasting.Multiply:
	jmp (Standard.ZTempWord.0)
Raycasting.Multiply.Return:
	rts
	
Raycasting.MultiplyL:
	.db <Raycasting.Multiply1,<Raycasting.Multiply2,<Raycasting.Multiply3,<Raycasting.Multiply4,
	.db <Raycasting.Multiply5,<Raycasting.Multiply6,<Raycasting.Multiply7,<Raycasting.Multiply8,
	.db <Raycasting.Multiply9,<Raycasting.Multiply10,<Raycasting.Multiply11,<Raycasting.Multiply12,
	.db <Raycasting.Multiply13,<Raycasting.Multiply14,<Raycasting.Multiply15,<Raycasting.Multiply16
	
Raycasting.MultiplyH:
	.db >Raycasting.Multiply1,>Raycasting.Multiply2,>Raycasting.Multiply3,>Raycasting.Multiply4,
	.db >Raycasting.Multiply5,>Raycasting.Multiply6,>Raycasting.Multiply7,>Raycasting.Multiply8,
	.db >Raycasting.Multiply9,>Raycasting.Multiply10,>Raycasting.Multiply11,>Raycasting.Multiply12,
	.db >Raycasting.Multiply13,>Raycasting.Multiply14,>Raycasting.Multiply15,>Raycasting.Multiply16