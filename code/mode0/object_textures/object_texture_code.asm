Raycast.ObjectDraw.ObjectTexture:
	lda Raycast.ObjectDraw.ObjectDist
	bne +
	rts
+
	ldy Raycast.ObjectDraw.TextureSlice
	lda Raycast.ObjectSliceCounts,y
	bne +
	lda (Raycast.ObjectDraw.TexturesHL),y
	cmp #$FF
	beq ++
	iny
	cpy #32
	beq ++
	sty Raycast.ObjectDraw.TextureSlice
	jmp Raycast.ObjectDraw.ObjectTexture
++
	rts
+
	sta Raycast.ObjectDraw.TextureSliceCount
	lda (Raycast.ObjectDraw.TexturesLL),y
	sta Raycast.ObjectDraw.DrawSliceL
	lda (Raycast.ObjectDraw.TexturesHL),y
	cmp #$FF
	bne +
	rts
+
	sta Raycast.ObjectDraw.DrawSliceH
	ldx Raycast.ObjectDraw.PixelColumn
	lda Raycast.WallDistances.w,x
	cmp Raycast.ObjectDraw.ObjectDistDouble
	bcc Raycast.ObjectDraw.ObjectTexture.Return
	jmp (Raycast.ObjectDraw.DrawSliceL)
Raycast.ObjectDraw.ObjectTexture.Return:
	inc Raycast.ObjectDraw.PixelColumn
	lda Raycast.ObjectDraw.PixelColumn
	cmp #84
	bcc +
	rts
+
	jsr Raycasting.DrawObject.StandardColumnReInit
	dec Raycast.ObjectDraw.TextureSliceCount
	beq +
	ldx Raycast.ObjectDraw.PixelColumn
	lda Raycast.WallDistances.w,x
	cmp Raycast.ObjectDraw.ObjectDistDouble
	bcc Raycast.ObjectDraw.ObjectTexture.Return
	jmp (Raycast.ObjectDraw.DrawSliceL)
+
	ldy Raycast.ObjectDraw.TextureSlice
	iny
	cpy #32
	beq ++
	sty Raycast.ObjectDraw.TextureSlice
	jmp Raycast.ObjectDraw.ObjectTexture
++
	rts