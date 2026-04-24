Polygon.CalcValues:
	lda Polygon.ScrollYHighOld	;3
	asl a			;5
	asl a			;7
	asl a			;9
	ora #$20		;12
	sta Polygon.PPUHigh		;15
	lda Polygon.ScrollXHighOld	;18
	asl a			;20
	asl a			;22
	ora Polygon.PPUHigh		;25
	sta Polygon.PPUHigh		;28

	lda Polygon.ScrollXLowOld	;31
	lsr a			;33
	lsr a			;35
	lsr a			;37
	sta Polygon.PPULow		;40
	lda #$00		;42
	sta Standard.ZTempByte.0		;45
	lda Polygon.ScrollYLowOld	;48
	asl a			;50
	rol Standard.ZTempByte.0		;55
	asl a			;57
	rol Standard.ZTempByte.0		;62
	and #$E0		;64
	ora Polygon.PPULow		;67
	sta Polygon.PPULow		;70
	lda Standard.ZTempByte.0		;73
	ora Polygon.PPUHigh		;76
	sta Polygon.PPUHigh		;79


	nop
	nop
	nop

	lda Polygon.$2000
	;sta $2000

	lda Polygon.PPUHigh
	;sta $2006
	lda Polygon.ScrollYLowOld
	;sta $2005
	lda Polygon.ScrollXLowOld
	;sta $2005
	lda Polygon.PPULow
	;sta $2006

	;lda Polygon.$2001
	;sta $2001
	sta $5555
	rts