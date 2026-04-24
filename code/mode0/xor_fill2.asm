.MACRO Raycast.XORFill.FirstTile2()
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

.MACRO Raycast.XORFill.OtherTile2()
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

.MACRO Raycast.XORFill.Column2()
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

Raycast.XORFill2:
	Raycast.XORFill.Column() 224
	Raycast.XORFill.Column() 240
	Raycast.XORFill.Column() 256
	Raycast.XORFill.Column() 272
	Raycast.XORFill.Column() 288
	Raycast.XORFill.Column() 304
	Raycast.XORFill.Column() 320
	rts