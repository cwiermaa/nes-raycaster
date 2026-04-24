.include "drawing_macros.asm"

Polygon.DrawLine:

	Standard.Main.ReadController()

	lda Standard.Control.Current
	and #$08
	beq +
	
	dec Polygon.Drawing.TestYStart
+
	lda Standard.Control.Current
	and #$04
	beq +
	
	inc Polygon.Drawing.TestYStart
+
	lda Standard.Control.Current
	and #$02
	beq +
	
	dec Polygon.Drawing.TestXStart
+
	lda Standard.Control.Current
	and #$01
	beq +
	
	inc Polygon.Drawing.TestXStart
	
+
	lda Standard.Control.Trigger
	and #$80
	beq +
	dec Polygon.Drawing.TestLength
+
	lda Standard.Control.Trigger
	and #$40
	beq +
	inc Polygon.Drawing.TestLength
+

	lda Standard.Control.Current
	and #$10
	beq +
	sec
	lda Polygon.Drawing.SlopeYL
	sbc #$80
	sta Polygon.Drawing.SlopeYL
	lda Polygon.Drawing.SlopeYH
	sbc #0
	sta Polygon.Drawing.SlopeYH
+
	lda Standard.Control.Current
	and #$20
	beq +
	clc
	lda Polygon.Drawing.SlopeYL
	adc #$80
	sta Polygon.Drawing.SlopeYL
	lda Polygon.Drawing.SlopeYH
	adc #0
	sta Polygon.Drawing.SlopeYH
+


	lda #3
	sta Polygon.CurrentTile
	
	lda Polygon.Drawing.TestYStart
	sta Polygon.Drawing.PixelYH
	lda #$00
	sta Polygon.Drawing.PixelYL

	lda Polygon.Drawing.TestXStart
	sta Polygon.Drawing.StartXPixel
	lda Polygon.Drawing.TestLength
	sta Polygon.Drawing.LineXLength
	
	jsr Polygon.Drawline.DownPlane1
	
	clc
	lda Polygon.Drawing.TestYStart
	adc #1
	sta Polygon.Drawing.PixelYH
	lda #$00
	sta Polygon.Drawing.PixelYL

	lda Polygon.Drawing.TestXStart
	sta Polygon.Drawing.StartXPixel
	lda Polygon.Drawing.TestLength
	sta Polygon.Drawing.LineXLength

	lda Polygon.Drawing.SlopeYL
	eor #$FF
	sta Polygon.Drawing.SlopeYL
	lda Polygon.Drawing.SlopeYH
	eor #$FF
	sta Polygon.Drawing.SlopeYH
	
	clc
	lda Polygon.Drawing.SlopeYL
	adc #1
	sta Polygon.Drawing.SlopeYL
	lda Polygon.Drawing.SlopeYH
	adc #0
	sta Polygon.Drawing.SlopeYH
	
	jsr Polygon.Drawline.DownPlane1
	
	lda Polygon.Drawing.SlopeYL
	eor #$FF
	sta Polygon.Drawing.SlopeYL
	lda Polygon.Drawing.SlopeYH
	eor #$FF
	sta Polygon.Drawing.SlopeYH
	
	clc
	lda Polygon.Drawing.SlopeYL
	adc #1
	sta Polygon.Drawing.SlopeYL
	lda Polygon.Drawing.SlopeYH
	adc #0
	sta Polygon.Drawing.SlopeYH

	pha
	lda Polygon.Drawing.SlopeYL
	pha
	
	lda #$FE
	sta Polygon.Drawing.SlopeYH
	lda #$40
	sta Polygon.Drawing.SlopeYL
	
	lda #$80
	sta Polygon.Drawing.StartXPixel
	lda #$60
	sta Polygon.Drawing.PixelYH
	lda #$00
	sta Polygon.Drawing.PixelYL
	
	lda #$12
	sta Polygon.Drawing.LineXLength
	
	jsr Polygon.Drawline.Down
	lda #$80
	sta Polygon.Drawing.StartXPixel
	lda #$80
	sta Polygon.Drawing.PixelYH
	lda #$00
	sta Polygon.Drawing.PixelYL
	lda #$12
	sta Polygon.Drawing.LineXLength
	
	jsr Polygon.Drawline.Down
	
	pla
	sta Polygon.Drawing.SlopeYL
	pla
	sta Polygon.Drawing.SlopeYH
	
	rts
	