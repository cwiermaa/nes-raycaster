
;For columns 0 to F
.MACRO Raycasting.ObjectDraw.DrawColumn0.Pixel()
	lda \2,y		;4
	and Raycast.ObjectDraw.Color0+\1		;8
	ora Raycast.ObjectDraw.Column0+\1		;12
	sta \2,y		;16
.ENDM

.MACRO Raycasting.ObjectDraw.DrawColumn1.Pixel()
	lda \2,y		;4
	and Raycast.ObjectDraw.Color0+\1		;8
	ora Raycast.ObjectDraw.Column1+\1		;12
	sta \2,y		;16
.ENDM

.MACRO Raycasting.ObjectDraw.DrawColumn0.Tile()
	Raycasting.ObjectDraw.DrawColumn0.Pixel() 0+\2, Raycast.CHR+\1
	Raycasting.ObjectDraw.DrawColumn0.Pixel() 0+\2, Raycast.CHR+1+\1
	Raycasting.ObjectDraw.DrawColumn0.Pixel() 1+\2, Raycast.CHR+2+\1
	Raycasting.ObjectDraw.DrawColumn0.Pixel() 1+\2, Raycast.CHR+3+\1
	Raycasting.ObjectDraw.DrawColumn0.Pixel() 2+\2, Raycast.CHR+4+\1
	Raycasting.ObjectDraw.DrawColumn0.Pixel() 2+\2, Raycast.CHR+5+\1
	Raycasting.ObjectDraw.DrawColumn0.Pixel() 3+\2, Raycast.CHR+6+\1
	Raycasting.ObjectDraw.DrawColumn0.Pixel() 3+\2, Raycast.CHR+7+\1
.ENDM

.MACRO Raycasting.ObjectDraw.DrawColumn1.Tile()
	Raycasting.ObjectDraw.DrawColumn1.Pixel() 0+\2, Raycast.CHR+8+\1
	Raycasting.ObjectDraw.DrawColumn1.Pixel() 0+\2, Raycast.CHR+9+\1
	Raycasting.ObjectDraw.DrawColumn1.Pixel() 1+\2, Raycast.CHR+10+\1
	Raycasting.ObjectDraw.DrawColumn1.Pixel() 1+\2, Raycast.CHR+11+\1
	Raycasting.ObjectDraw.DrawColumn1.Pixel() 2+\2, Raycast.CHR+12+\1
	Raycasting.ObjectDraw.DrawColumn1.Pixel() 2+\2, Raycast.CHR+13+\1
	Raycasting.ObjectDraw.DrawColumn1.Pixel() 3+\2, Raycast.CHR+14+\1
	Raycasting.ObjectDraw.DrawColumn1.Pixel() 3+\2, Raycast.CHR+15+\1
.ENDM

Raycasting.ObjectDraw.DrawColumn0toF:
;X = Tile to start from
	lda Raycasting.ObjectDraw.DrawColumn0toF.JumpTableL.w,x
	sta Standard.ZTempWord.0
	lda Raycasting.ObjectDraw.DrawColumn0toF.JumpTableH.w,x
	sta Standard.ZTempWord.0+1
	jmp (Standard.ZTempWord.0)
	
Raycasting.ObjectDraw.DrawColumn0toF.0:
	Raycasting.ObjectDraw.DrawColumn0.Tile() $0,0
	Raycasting.ObjectDraw.DrawColumn1.Tile() $0,0
Raycasting.ObjectDraw.DrawColumn0toF.1:
	Raycasting.ObjectDraw.DrawColumn0.Tile() $150,4
	Raycasting.ObjectDraw.DrawColumn1.Tile() $150,4
Raycasting.ObjectDraw.DrawColumn0toF.2:
	Raycasting.ObjectDraw.DrawColumn0.Tile() $2A0,8
	Raycasting.ObjectDraw.DrawColumn1.Tile() $2A0,8
Raycasting.ObjectDraw.DrawColumn0toF.3:
	Raycasting.ObjectDraw.DrawColumn0.Tile() $3F0,12
	Raycasting.ObjectDraw.DrawColumn1.Tile() $3F0,12
Raycasting.ObjectDraw.DrawColumn0toF.4:
	Raycasting.ObjectDraw.DrawColumn0.Tile() $540,16
	Raycasting.ObjectDraw.DrawColumn1.Tile() $540,16
Raycasting.ObjectDraw.DrawColumn0toF.5:
	Raycasting.ObjectDraw.DrawColumn0.Tile() $690,20
	Raycasting.ObjectDraw.DrawColumn1.Tile() $690,20
Raycasting.ObjectDraw.DrawColumn0toF.6:
	Raycasting.ObjectDraw.DrawColumn0.Tile() $7E0,24
	Raycasting.ObjectDraw.DrawColumn1.Tile() $7E0,24
	cpx #3
	bcc +
	beq +
	rts
+
Raycasting.ObjectDraw.DrawColumn0toF.7:
	Raycasting.ObjectDraw.DrawColumn0.Tile() $930,28
	Raycasting.ObjectDraw.DrawColumn1.Tile() $930,28
	cpx #2
	bcc +
	beq +
	rts
+
Raycasting.ObjectDraw.DrawColumn0toF.8:
	Raycasting.ObjectDraw.DrawColumn0.Tile() $A80,32
	Raycasting.ObjectDraw.DrawColumn1.Tile() $A80,32
	cpx #1
	bcc +
	beq +
	rts
+
Raycasting.ObjectDraw.DrawColumn0toF.9:
	Raycasting.ObjectDraw.DrawColumn0.Tile() $BD0,36
	Raycasting.ObjectDraw.DrawColumn1.Tile() $BD0,36
	cpx #0
	bcc +
	beq +
	rts
+
Raycasting.ObjectDraw.DrawColumn0toF.10:
	Raycasting.ObjectDraw.DrawColumn0.Tile() $D20,40
	Raycasting.ObjectDraw.DrawColumn1.Tile() $D20,40
	rts

Raycasting.ObjectDraw.DrawColumn0toF.JumpTableL:
	.db <Raycasting.ObjectDraw.DrawColumn0toF.0
	.db <Raycasting.ObjectDraw.DrawColumn0toF.1
	.db <Raycasting.ObjectDraw.DrawColumn0toF.2
	.db <Raycasting.ObjectDraw.DrawColumn0toF.3
	.db <Raycasting.ObjectDraw.DrawColumn0toF.4
	.db <Raycasting.ObjectDraw.DrawColumn0toF.5
	.db <Raycasting.ObjectDraw.DrawColumn0toF.6
	.db <Raycasting.ObjectDraw.DrawColumn0toF.7
	.db <Raycasting.ObjectDraw.DrawColumn0toF.8
	.db <Raycasting.ObjectDraw.DrawColumn0toF.9
	.db <Raycasting.ObjectDraw.DrawColumn0toF.10
	
Raycasting.ObjectDraw.DrawColumn0toF.JumpTableH:
	.db >Raycasting.ObjectDraw.DrawColumn0toF.0
	.db >Raycasting.ObjectDraw.DrawColumn0toF.1
	.db >Raycasting.ObjectDraw.DrawColumn0toF.2
	.db >Raycasting.ObjectDraw.DrawColumn0toF.3
	.db >Raycasting.ObjectDraw.DrawColumn0toF.4
	.db >Raycasting.ObjectDraw.DrawColumn0toF.5
	.db >Raycasting.ObjectDraw.DrawColumn0toF.6
	.db >Raycasting.ObjectDraw.DrawColumn0toF.7
	.db >Raycasting.ObjectDraw.DrawColumn0toF.8
	.db >Raycasting.ObjectDraw.DrawColumn0toF.9
	.db >Raycasting.ObjectDraw.DrawColumn0toF.10
	
;***********************************************************************
;For columns $10 to $14

.MACRO Raycasting.ObjectDraw.DrawColumn0.Tile.10to14()
	Raycasting.ObjectDraw.DrawColumn0.Pixel() 0+\2, Raycast.CHR+\1+$100
	Raycasting.ObjectDraw.DrawColumn0.Pixel() 0+\2, Raycast.CHR+1+\1+$100
	Raycasting.ObjectDraw.DrawColumn0.Pixel() 1+\2, Raycast.CHR+2+\1+$100
	Raycasting.ObjectDraw.DrawColumn0.Pixel() 1+\2, Raycast.CHR+3+\1+$100
	Raycasting.ObjectDraw.DrawColumn0.Pixel() 2+\2, Raycast.CHR+4+\1+$100
	Raycasting.ObjectDraw.DrawColumn0.Pixel() 2+\2, Raycast.CHR+5+\1+$100
	Raycasting.ObjectDraw.DrawColumn0.Pixel() 3+\2, Raycast.CHR+6+\1+$100
	Raycasting.ObjectDraw.DrawColumn0.Pixel() 3+\2, Raycast.CHR+7+\1+$100
.ENDM

.MACRO Raycasting.ObjectDraw.DrawColumn1.Tile.10to14()
	Raycasting.ObjectDraw.DrawColumn1.Pixel() 0+\2, Raycast.CHR+8+\1+$100
	Raycasting.ObjectDraw.DrawColumn1.Pixel() 0+\2, Raycast.CHR+9+\1+$100
	Raycasting.ObjectDraw.DrawColumn1.Pixel() 1+\2, Raycast.CHR+10+\1+$100
	Raycasting.ObjectDraw.DrawColumn1.Pixel() 1+\2, Raycast.CHR+11+\1+$100
	Raycasting.ObjectDraw.DrawColumn1.Pixel() 2+\2, Raycast.CHR+12+\1+$100
	Raycasting.ObjectDraw.DrawColumn1.Pixel() 2+\2, Raycast.CHR+13+\1+$100
	Raycasting.ObjectDraw.DrawColumn1.Pixel() 3+\2, Raycast.CHR+14+\1+$100
	Raycasting.ObjectDraw.DrawColumn1.Pixel() 3+\2, Raycast.CHR+15+\1+$100
.ENDM

Raycasting.ObjectDraw.DrawColumn10to14:
	lda Raycasting.ObjectDraw.DrawColumn10to14.JumpTableL.w,x
	sta Standard.ZTempWord.0
	lda Raycasting.ObjectDraw.DrawColumn10to14.JumpTableH.w,x
	sta Standard.ZTempWord.0+1
	jmp (Standard.ZTempWord.0)
	
Raycasting.ObjectDraw.DrawColumn10to14.0:
	Raycasting.ObjectDraw.DrawColumn0.Tile.10to14() $0,0
	Raycasting.ObjectDraw.DrawColumn1.Tile.10to14() $0,0
Raycasting.ObjectDraw.DrawColumn10to14.1:
	Raycasting.ObjectDraw.DrawColumn0.Tile.10to14() $150,4
	Raycasting.ObjectDraw.DrawColumn1.Tile.10to14() $150,4
Raycasting.ObjectDraw.DrawColumn10to14.2:
	Raycasting.ObjectDraw.DrawColumn0.Tile.10to14() $2A0,8
	Raycasting.ObjectDraw.DrawColumn1.Tile.10to14() $2A0,8
Raycasting.ObjectDraw.DrawColumn10to14.3:
	Raycasting.ObjectDraw.DrawColumn0.Tile.10to14() $3F0,12
	Raycasting.ObjectDraw.DrawColumn1.Tile.10to14() $3F0,12
Raycasting.ObjectDraw.DrawColumn10to14.4:
	Raycasting.ObjectDraw.DrawColumn0.Tile.10to14() $540,16
	Raycasting.ObjectDraw.DrawColumn1.Tile.10to14() $540,16
Raycasting.ObjectDraw.DrawColumn10to14.5:
	Raycasting.ObjectDraw.DrawColumn0.Tile.10to14() $690,20
	Raycasting.ObjectDraw.DrawColumn1.Tile.10to14() $690,20
Raycasting.ObjectDraw.DrawColumn10to14.6:
	Raycasting.ObjectDraw.DrawColumn0.Tile.10to14() $7E0,24
	Raycasting.ObjectDraw.DrawColumn1.Tile.10to14() $7E0,24
	cpx #3
	bcc +
	beq +
	rts
+
Raycasting.ObjectDraw.DrawColumn10to14.7:
	Raycasting.ObjectDraw.DrawColumn0.Tile.10to14() $930,28
	Raycasting.ObjectDraw.DrawColumn1.Tile.10to14() $930,28
	cpx #2
	bcc +
	beq +
	rts
+
Raycasting.ObjectDraw.DrawColumn10to14.8:
	Raycasting.ObjectDraw.DrawColumn0.Tile.10to14() $A80,32
	Raycasting.ObjectDraw.DrawColumn1.Tile.10to14() $A80,32
	cpx #1
	bcc +
	beq +
	rts
+
Raycasting.ObjectDraw.DrawColumn10to14.9:
	Raycasting.ObjectDraw.DrawColumn0.Tile.10to14() $BD0,36
	Raycasting.ObjectDraw.DrawColumn1.Tile.10to14() $BD0,36
	cpx #0
	bcc +
	beq +
	rts
+
Raycasting.ObjectDraw.DrawColumn10to14.10:
	Raycasting.ObjectDraw.DrawColumn0.Tile.10to14() $D20,40
	Raycasting.ObjectDraw.DrawColumn1.Tile.10to14() $D20,40
	rts
	

Raycasting.ObjectDraw.DrawColumn10to14.JumpTableL:
	.db <Raycasting.ObjectDraw.DrawColumn10to14.0
	.db <Raycasting.ObjectDraw.DrawColumn10to14.1
	.db <Raycasting.ObjectDraw.DrawColumn10to14.2
	.db <Raycasting.ObjectDraw.DrawColumn10to14.3
	.db <Raycasting.ObjectDraw.DrawColumn10to14.4
	.db <Raycasting.ObjectDraw.DrawColumn10to14.5
	.db <Raycasting.ObjectDraw.DrawColumn10to14.6
	.db <Raycasting.ObjectDraw.DrawColumn10to14.7
	.db <Raycasting.ObjectDraw.DrawColumn10to14.8
	.db <Raycasting.ObjectDraw.DrawColumn10to14.9
	.db <Raycasting.ObjectDraw.DrawColumn10to14.10
	
Raycasting.ObjectDraw.DrawColumn10to14.JumpTableH:
	.db >Raycasting.ObjectDraw.DrawColumn10to14.0
	.db >Raycasting.ObjectDraw.DrawColumn10to14.1
	.db >Raycasting.ObjectDraw.DrawColumn10to14.2
	.db >Raycasting.ObjectDraw.DrawColumn10to14.3
	.db >Raycasting.ObjectDraw.DrawColumn10to14.4
	.db >Raycasting.ObjectDraw.DrawColumn10to14.5
	.db >Raycasting.ObjectDraw.DrawColumn10to14.6
	.db >Raycasting.ObjectDraw.DrawColumn10to14.7
	.db >Raycasting.ObjectDraw.DrawColumn10to14.8
	.db >Raycasting.ObjectDraw.DrawColumn10to14.9
	.db >Raycasting.ObjectDraw.DrawColumn10to14.10
;********************************************************************************
	.include "object_draw_xor_fill.asm"