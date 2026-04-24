Raycast.PSET0:
;Expected: Y Pixel (in wall texture slice) in Y.
	lda (Standard.ZTempWord.1),y
Raycast.PSET0ExactY:
	sta Raycast.Drawing.PixelY				;3
	tay										;5
	lda Raycast.PixelYDiv8t21.w,y			;9
	ldx Raycast.Drawing.PixelX				;12
	clc										;14
	adc Raycast.PixelXDiv8.w,x				;19
	tay										;21
	lda Raycast.CHRLowT,y					;25
	sta Standard.ZTempWord.0				;28
	lda Raycast.CHRHighT,y					;32
	sta Standard.ZTempWord.0+1				;35
	lda Raycast.Drawing.PixelY				;38
	and #7									;40
	tay										;42
	lda (Standard.ZTempWord.0),y			;47
	eor Raycast.PixelInLine.w,x				;51
	sta (Standard.ZTempWord.0),y			;56
	rts
	
Raycast.PSET1:
	lda (Standard.ZTempWord.1),y
Raycast.PSET1ExactY:
	sta Raycast.Drawing.PixelY
	tay
	lda Raycast.PixelYDiv8t21.w,y
	ldx Raycast.Drawing.PixelX
	clc
	adc Raycast.PixelXDiv8.w,x
	tay
	lda Raycast.CHRLowT,y
	sta Standard.ZTempWord.0
	lda Raycast.CHRHighT,y
	sta Standard.ZTempWord.0+1
	lda Raycast.Drawing.PixelY
	and #7
	clc
	adc #8
	tay
	lda (Standard.ZTempWord.0),y
	eor Raycast.PixelInLine.w,x
	sta (Standard.ZTempWord.0),y
	rts
	
Raycast.PSET2:
	lda (Standard.ZTempWord.1),y

Raycast.PSET2ExactY:
	sta Raycast.Drawing.PixelY
	tay
	lda Raycast.PixelYDiv8t21.w,y
	ldx Raycast.Drawing.PixelX
	clc
	adc Raycast.PixelXDiv8.w,x
	tay
	lda Raycast.CHRLowT,y
	sta Standard.ZTempWord.0
	lda Raycast.CHRHighT,y
	sta Standard.ZTempWord.0+1
	lda Raycast.Drawing.PixelY
	and #7
	tay
	lda (Standard.ZTempWord.0),y
	eor Raycast.PixelInLine.w,x
	sta (Standard.ZTempWord.0),y
	tya
	clc
	adc #8
	tay
	lda (Standard.ZTempWord.0),y
	eor Raycast.PixelInLine.w,x
	sta (Standard.ZTempWord.0),y
	rts
	
	

Raycast.PSETRange0:
;Expected: Y Pixel (in wall texture slice) in Y, second index in X.
	stx Standard.ZTempByte.4
	jsr Raycast.PSET0
	ldy Standard.ZTempByte.4
	jsr Raycast.PSET0
	rts
	
Raycast.PSETRange1:
;Expected: Y Pixel (in wall texture slice) in Y, second index in X.
	stx Standard.ZTempByte.4
	jsr Raycast.PSET1
	ldy Standard.ZTempByte.4
	jsr Raycast.PSET1
	rts
	
Raycast.PSETRange2:
;Expected: Y Pixel (in wall texture slice) in Y, second index in X.
	stx Standard.ZTempByte.4
	jsr Raycast.PSET2
	ldy Standard.ZTempByte.4
	jsr Raycast.PSET2
	rts
	
Raycast.PSET10:	
	sty Standard.ZTempByte.4
	jsr Raycast.PSET0
	ldy Standard.ZTempByte.4
	iny
	jsr Raycast.PSET0
	rts
	
Raycast.PSET11:
	sty Standard.ZTempByte.4
	jsr Raycast.PSET1
	ldy Standard.ZTempByte.4
	iny
	jsr Raycast.PSET1
	rts
	
Raycast.PSET12:
	sty Standard.ZTempByte.4
	jsr Raycast.PSET2
	ldy Standard.ZTempByte.4
	iny
	jsr Raycast.PSET2
	rts