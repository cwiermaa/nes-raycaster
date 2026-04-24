.MACRO Raycast.XORFill.FirstTile()
	lda Raycast.CHR.w+\1,x
	eor Raycast.CHR.w+1+\1,x
	sta Raycast.CHR.w+1+\1,x
	eor Raycast.CHR.w+2+\1,x
	sta Raycast.CHR.w+2+\1,x
	eor Raycast.CHR.w+3+\1,x
	sta Raycast.CHR.w+3+\1,x
	eor Raycast.CHR.w+4+\1,x
	sta Raycast.CHR.w+4+\1,x
	eor Raycast.CHR.w+5+\1,x
	sta Raycast.CHR.w+5+\1,x
	eor Raycast.CHR.w+6+\1,x
	sta Raycast.CHR.w+6+\1,x
	eor Raycast.CHR.w+7+\1,x
	sta Raycast.CHR.w+7+\1,x
.ENDM

.MACRO Raycast.XORFill.OtherTile()
	eor Raycast.CHR.w+\1,x
	sta Raycast.CHR.w+\1,x
	eor Raycast.CHR.w+1+\1,x
	sta Raycast.CHR.w+1+\1,x
	eor Raycast.CHR.w+2+\1,x
	sta Raycast.CHR.w+2+\1,x
	eor Raycast.CHR.w+3+\1,x
	sta Raycast.CHR.w+3+\1,x
	eor Raycast.CHR.w+4+\1,x
	sta Raycast.CHR.w+4+\1,x
	eor Raycast.CHR.w+5+\1,x
	sta Raycast.CHR.w+5+\1,x
	eor Raycast.CHR.w+6+\1,x
	sta Raycast.CHR.w+6+\1,x
	eor Raycast.CHR.w+7+\1,x
	sta Raycast.CHR.w+7+\1,x
.ENDM

.MACRO Raycast.XORFill.Column()
	Raycast.XORFill.FirstTile() 0+\1
	Raycast.XORFill.OtherTile() $150+\1
	Raycast.XORFill.OtherTile() $2A0+\1
	Raycast.XORFill.OtherTile() $3F0+\1
	Raycast.XORFill.OtherTile() $540+\1
	Raycast.XORFill.OtherTile() $690+\1
	Raycast.XORFill.OtherTile() $7E0+\1
	Raycast.XORFill.OtherTile() $930+\1
	Raycast.XORFill.OtherTile() $A80+\1
	Raycast.XORFill.OtherTile() $BD0+\1
	Raycast.XORFill.OtherTile() $D20+\1
.ENDM

Raycast.XORFill:
	Raycast.XORFill.Column() 0
	Raycast.XORFill.Column() 16
	Raycast.XORFill.Column() 32
	Raycast.XORFill.Column() 48
	Raycast.XORFill.Column() 64
	Raycast.XORFill.Column() 80
	Raycast.XORFill.Column() 96
	Raycast.XORFill.Column() 112
	Raycast.XORFill.Column() 128
	Raycast.XORFill.Column() 144
	Raycast.XORFill.Column() 160
	Raycast.XORFill.Column() 176
	Raycast.XORFill.Column() 192
	Raycast.XORFill.Column() 208
	rts