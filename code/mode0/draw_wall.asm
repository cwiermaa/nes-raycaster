Raycast.DrawWall:
;Given: Wall distance in Y, WallID in WallID, Current X Pixel in PixelX.

	sty Standard.ZTempByte.1
	ldx Raycast.WallID
	lda Raycast.WallRoutineL.w,x
	sta Standard.ZTempWord.3
	lda Raycast.WallRoutineH.w,x
	sta Standard.ZTempWord.3+1
	lda Raycast.PixelLocationArraysL.w,y
	sta Standard.ZTempWord.1
	lda Raycast.PixelLocationArraysH.w,y
	sta Standard.ZTempWord.1+1
	jmp (Standard.ZTempWord.3)

.include "Textures.asm"
	
Raycast.WallRoutineL:
	.db <Raycast.DrawWall.0, <Raycast.DrawWall.1, <Raycast.DrawWall.2, <Raycast.DrawWall.3
	.db <Raycast.DrawWall.4, <Raycast.DrawWall.5, <Raycast.DrawWall.8, <Raycast.DrawWall.7
	;.db <Raycast.DrawWall.8, <Raycast.DrawWall.9, <Raycast.DrawWall.10, <Raycast.DrawWall.11
	;.db <Raycast.DrawWall.12, <Raycast.DrawWall.13, <Raycast.DrawWall.14, <Raycast.DrawWall.15
	
Raycast.WallRoutineH:
	.db >Raycast.DrawWall.0, >Raycast.DrawWall.1, >Raycast.DrawWall.2, >Raycast.DrawWall.3
	.db >Raycast.DrawWall.4, >Raycast.DrawWall.5, >Raycast.DrawWall.8, >Raycast.DrawWall.7
	;.db >Raycast.DrawWall.8, >Raycast.DrawWall.9, >Raycast.DrawWall.10, >Raycast.DrawWall.11
	;.db >Raycast.DrawWall.12, >Raycast.DrawWall.13, >Raycast.DrawWall.14, >Raycast.DrawWall.15
	

Raycast.Draw0:
	lda #0
	jsr Raycast.PSET2ExactY
	ldy #0
	jsr Raycast.PSET2
	rts

Raycast.Draw1:
	lda #87
	jsr Raycast.PSET1ExactY
	ldy #16
	jsr Raycast.PSET1
	rts