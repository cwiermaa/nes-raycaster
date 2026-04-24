Raycasting.DrawObject:
	lda Game.PlayerLeftAngle
	asl a
	sta Standard.ZTempByte.0
	
	lda #180
	sec
	sbc Standard.ZTempByte.0
	sta Raycast.ObjectDraw.PixelColumn
	sec
	lda #$40
	sbc Game.PlayerYH
	sta Raycast.ObjectDraw.ObjectDist
	tax
	asl a
	sta Raycast.ObjectDraw.ObjectDistDouble
	inx
	inx
	inx
	inx
	jsr Raycasting.ObjectDraw.GetWallWidths
	jsr Raycasting.DrawObject.StandardColumnReInit
	ldx Raycast.ObjectDraw.ObjectDist
	lda RaycastOD.PixelLocationsL.w,x
	sta Standard.ZTempWord.0
	lda RaycastOD.PixelLocationsH.w,x
	sta Standard.ZTempWord.0+1
	
	lda #0
	sta Raycast.ObjectDraw.TextureSlice
	lda #<Raycast.ObjectDraw.ObjectTexture1JumpTableL
	sta Raycast.ObjectDraw.TexturesLL
	lda #>Raycast.ObjectDraw.ObjectTexture1JumpTableL
	sta Raycast.ObjectDraw.TexturesLH
	lda #<Raycast.ObjectDraw.ObjectTexture1JumpTableH
	sta Raycast.ObjectDraw.TexturesHL
	lda #>Raycast.ObjectDraw.ObjectTexture1JumpTableH
	sta Raycast.ObjectDraw.TexturesHH
	jsr Raycast.ObjectDraw.ObjectTexture
	rts
	
Raycasting.DrawObject.DrawColumn:
	lda Raycast.ObjectDraw.PixelColumn
	cmp #64
	bcc +
	ldy Raycast.ObjectDraw.TileColumn
	ldx #0
	jsr Raycasting.DrawObjects.DrawColumn10to14
	rts
+
	ldy Raycast.ObjectDraw.TileColumn
	ldx #0
	jsr Raycasting.DrawObjects.DrawColumn0toF
	rts
	
Raycasting.DrawObject.PSET0:
	lda (Standard.ZTempWord.0),y
	tax
	lda Raycast.ObjectDraw.Column0.w,x
	eor Raycast.ObjectDraw.ColumnMask
	sta Raycast.ObjectDraw.Column0.w,x
	rts
	
Raycasting.DrawObject.PSET1:
	lda (Standard.ZTempWord.0),y
	tax
	lda Raycast.ObjectDraw.Column1.w,x
	eor Raycast.ObjectDraw.ColumnMask
	sta Raycast.ObjectDraw.Column1.w,x
	rts
	
Raycasting.DrawObject.PSET2:
	lda (Standard.ZTempWord.0),y
	tax
	lda Raycast.ObjectDraw.Column0.w,x
	eor Raycast.ObjectDraw.ColumnMask
	sta Raycast.ObjectDraw.Column0.w,x
	lda Raycast.ObjectDraw.Column1.w,x
	eor Raycast.ObjectDraw.ColumnMask
	sta Raycast.ObjectDraw.Column1.w,x
	rts
	
Raycasting.DrawObject.PSETM:
	lda (Standard.ZTempWord.0),y
	tax
	lda Raycast.ObjectDraw.Color0.w,x
	eor Raycast.ObjectDraw.ColumnMask
	sta Raycast.ObjectDraw.Color0.w,x
	rts
	
;PSET 1

Raycasting.DrawObject.PSET10:
	lda (Standard.ZTempWord.0),y
	tax
	lda Raycast.ObjectDraw.Column0.w,x
	eor Raycast.ObjectDraw.ColumnMask
	sta Raycast.ObjectDraw.Column0.w,x
	iny
	lda (Standard.ZTempWord.0),y
	tax
	lda Raycast.ObjectDraw.Column0.w,x
	eor Raycast.ObjectDraw.ColumnMask
	sta Raycast.ObjectDraw.Column0.w,x
	rts
	
Raycasting.DrawObject.PSET11:
	lda (Standard.ZTempWord.0),y
	tax
	lda Raycast.ObjectDraw.Column1.w,x
	eor Raycast.ObjectDraw.ColumnMask
	sta Raycast.ObjectDraw.Column1.w,x
	iny
	lda (Standard.ZTempWord.0),y
	tax
	lda Raycast.ObjectDraw.Column1.w,x
	eor Raycast.ObjectDraw.ColumnMask
	sta Raycast.ObjectDraw.Column1.w,x
	rts
	

Raycasting.DrawObject.PSET12:
	lda (Standard.ZTempWord.0),y
	tax
	lda Raycast.ObjectDraw.Column0.w,x
	eor Raycast.ObjectDraw.ColumnMask
	sta Raycast.ObjectDraw.Column0.w,x
	lda Raycast.ObjectDraw.Column1.w,x
	eor Raycast.ObjectDraw.ColumnMask
	sta Raycast.ObjectDraw.Column1.w,x
	iny
	lda (Standard.ZTempWord.0),y
	tax
	lda Raycast.ObjectDraw.Column0.w,x
	eor Raycast.ObjectDraw.ColumnMask
	sta Raycast.ObjectDraw.Column0.w,x
	lda Raycast.ObjectDraw.Column1.w,x
	eor Raycast.ObjectDraw.ColumnMask
	sta Raycast.ObjectDraw.Column1.w,x
	rts
	
Raycasting.DrawObject.PSETM1:
	lda (Standard.ZTempWord.0),y
	tax
	lda Raycast.ObjectDraw.Color0.w,x
	eor Raycast.ObjectDraw.ColumnMask
	sta Raycast.ObjectDraw.Color0.w,x
	iny
	lda (Standard.ZTempWord.0),y
	tax
	lda Raycast.ObjectDraw.Color0.w,x
	eor Raycast.ObjectDraw.ColumnMask
	sta Raycast.ObjectDraw.Color0.w,x
	rts
	
;PSET Range

Raycasting.DrawObject.PSETRange0:
	stx Standard.ZTempByte.4
	lda (Standard.ZTempWord.0),y
	tax
	lda Raycast.ObjectDraw.Column0.w,x
	eor Raycast.ObjectDraw.ColumnMask
	sta Raycast.ObjectDraw.Column0.w,x
	ldy Standard.ZTempByte.4
	lda (Standard.ZTempWord.0),y
	tax
	lda Raycast.ObjectDraw.Column0.w,x
	eor Raycast.ObjectDraw.ColumnMask
	sta Raycast.ObjectDraw.Column0.w,x
	rts
	
Raycasting.DrawObject.PSETRange1:
	stx Standard.ZTempByte.4
	lda (Standard.ZTempWord.0),y
	tax
	lda Raycast.ObjectDraw.Column1.w,x
	eor Raycast.ObjectDraw.ColumnMask
	sta Raycast.ObjectDraw.Column1.w,x
	ldy Standard.ZTempByte.4
	lda (Standard.ZTempWord.0),y
	tax
	lda Raycast.ObjectDraw.Column1.w,x
	eor Raycast.ObjectDraw.ColumnMask
	sta Raycast.ObjectDraw.Column1.w,x
	rts
	

Raycasting.DrawObject.PSETRange2:

	stx Standard.ZTempByte.4
	lda (Standard.ZTempWord.0),y
	tax
	lda Raycast.ObjectDraw.Column0.w,x
	eor Raycast.ObjectDraw.ColumnMask
	sta Raycast.ObjectDraw.Column0.w,x
	lda Raycast.ObjectDraw.Column1.w,x
	eor Raycast.ObjectDraw.ColumnMask
	sta Raycast.ObjectDraw.Column1.w,x
	
	ldy Standard.ZTempByte.4
	lda (Standard.ZTempWord.0),y
	tax
	lda Raycast.ObjectDraw.Column0.w,x
	eor Raycast.ObjectDraw.ColumnMask
	sta Raycast.ObjectDraw.Column0.w,x
	lda Raycast.ObjectDraw.Column1.w,x
	eor Raycast.ObjectDraw.ColumnMask
	sta Raycast.ObjectDraw.Column1.w,x
	rts
	
Raycasting.DrawObject.PSETRangeM:
	stx Standard.ZTempByte.4
	lda (Standard.ZTempWord.0),y
	tax
	lda Raycast.ObjectDraw.Color0.w,x
	eor Raycast.ObjectDraw.ColumnMask
	sta Raycast.ObjectDraw.Color0.w,x
	ldy Standard.ZTempByte.4
	lda (Standard.ZTempWord.0),y
	tax
	lda Raycast.ObjectDraw.Color0.w,x
	eor Raycast.ObjectDraw.ColumnMask
	sta Raycast.ObjectDraw.Color0.w,x
	rts
	
Raycasting.DrawObject.StandardColumnReInit:
	jsr Raycasting.DrawObjects.ClearColumnArrays
	
	ldx Raycast.ObjectDraw.PixelColumn
	lda Raycast.DrawObjects.ColumnMasks.w,x
	sta Raycast.ObjectDraw.ColumnMask
	lda Raycast.DrawObjects.ColumnIDs.w,x
	sta Raycast.ObjectDraw.TileColumn
	
	ldx Raycast.ObjectDraw.ObjectDist
	lda RaycastOD.PixelLocationsL.w,x
	sta Standard.ZTempWord.0
	lda RaycastOD.PixelLocationsH.w,x
	sta Standard.ZTempWord.0+1
	rts
	
.include "object_pixel_locations.asm"