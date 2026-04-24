Raycasting.Raycast:

	MMC3.BankSwitch8000() 9
	ldx #0
	ldy #11
-
	lda TestRoom.w,x
	sta Raycast.Room.w,x
	lda TestRoom.w+11,x
	sta Raycast.Room.w+$10,x
	lda TestRoom.w+22,x
	sta Raycast.Room.w+$20,x
	lda TestRoom.w+33,x
	sta Raycast.Room.w+$30,x
	lda TestRoom.w+44,x
	sta Raycast.Room.w+$40,x
	lda TestRoom.w+55,x
	sta Raycast.Room.w+$50,x
	lda TestRoom.w+66,x
	sta Raycast.Room.w+$60,x
	lda TestRoom.w+77,x
	sta Raycast.Room.w+$70,x
	lda TestRoom.w+88,x
	sta Raycast.Room.w+$80,x
	lda TestRoom.w+99,x
	sta Raycast.Room.w+$90,x
	lda TestRoom.w+110,x
	sta Raycast.Room.w+$A0,x
	inx
	dey
	bne -


;**************************
;Code for turning
	
	Standard.Main.ReadController()
	lda Standard.Control.Current
	and #$02
	beq ++

	sec
	lda Game.PlayerLeftAngle
	sbc #6
	cmp #180
	bcc +
	lda #174
+
	sta Game.PlayerLeftAngle
++
	lda Standard.Control.Current
	and #$01
	beq ++

	clc
	lda Game.PlayerLeftAngle
	adc #6
	cmp #180
	bcc +
	lda #0
+
	sta Game.PlayerLeftAngle
++
	lda Standard.Control.Current
	and #$08
	beq ++
	jsr Raycaster.MoveForward
++
	
	lda Standard.Control.Current
	and #$04
	beq ++
	jsr Raycaster.MoveBackward
++

	lda Standard.Control.Trigger
	and #$20
	beq ++
	lda Raycast.DrawObject
	eor #1
	sta Raycast.DrawObject
++
;**************************
	lda Game.PlayerXH
	cmp #$A0
	bcc +
	sec
	lda Game.PlayerXH
	sbc #$A0
	sta Game.PlayerXH
+

	jsr Raycasting.DDA	
	rts
	
Raycasting.CorrectWall:
	sta System.Main.Math.A0
	lda #$00				;2
	sta System.Main.Math.Answer0		;5
	sta System.Main.Math.Answer1		;8
	sta System.Main.Math.Answer2		;11
	sta System.Main.Math.B2
	
	ldy Raycast.CurrentAngleFromFacing
	
	lda Raycasting.CorrectL.w,y
	sta System.Main.Math.B0
	lda Raycasting.CorrectH.w,y
	sta System.Main.Math.B1
	
	ldx #8
	
-
	lsr System.Main.Math.A0			;5
	bcc +					;7
	clc					;9
	lda System.Main.Math.Answer0		;12
	adc System.Main.Math.B0			;15
	sta System.Main.Math.Answer0		;18
	lda System.Main.Math.Answer1		;21
	adc System.Main.Math.B1			;24
	sta System.Main.Math.Answer1		;27
	lda System.Main.Math.Answer2		;30
	adc System.Main.Math.B2			;33
	sta System.Main.Math.Answer2		;36
+
	asl System.Main.Math.B0			;13/41
	rol System.Main.Math.B1			;18/46
	rol System.Main.Math.B2			;23/51
	dex					;25/53
	bne -					;28/56
	rts
	
Raycaster.MoveForward:
	MMC3.BankSwitch8000() 9

	ldy #0
	lda Game.PlayerLeftAngle
	clc
	adc #21
	cmp #$B4
	bcc +
	sec
	sbc #$B4
+
	sta Raycast.FacingAngle
	asl a
	sta Standard.ZTempByte.0
	lda #0
	rol a
	sta Standard.ZTempByte.1
	
	ldy #0
	lda Standard.ZTempByte.0
	clc
	adc #<Raycasting.RunLow
	sta Standard.ZTempWord.0
	lda Standard.ZTempByte.1
	adc #>Raycasting.RunLow
	sta Standard.ZTempWord.0+1
	lda (Standard.ZTempWord.0),y
	sta Standard.ZTempByte.4
	sta Raycast.Move.YL
	
	lda Standard.ZTempByte.0
	clc
	adc #<Raycasting.RunHigh
	sta Standard.ZTempWord.0
	lda Standard.ZTempByte.1
	adc #>Raycasting.RunHigh
	sta Standard.ZTempWord.0+1
	lda (Standard.ZTempWord.0),y
	sta Standard.ZTempByte.5
	sta Raycast.Move.YH
	
	lda Standard.ZTempByte.0
	clc
	adc #<Raycasting.RiseLow
	sta Standard.ZTempWord.0
	lda Standard.ZTempByte.1
	adc #>Raycasting.RiseLow
	sta Standard.ZTempWord.0+1
	lda (Standard.ZTempWord.0),y
	sta Standard.ZTempByte.6
	sta Raycast.Move.XL
	
	lda Standard.ZTempByte.0
	clc
	adc #<Raycasting.RiseHigh
	sta Standard.ZTempWord.0
	lda Standard.ZTempByte.1
	adc #>Raycasting.RiseHigh
	sta Standard.ZTempWord.0+1
	lda (Standard.ZTempWord.0),y
	sta Standard.ZTempByte.7
	sta Raycast.Move.XH
	

	clc
	lda Game.PlayerXL
	adc Standard.ZTempByte.4
	sta Game.PlayerXL
	lda Game.PlayerXH
	adc Standard.ZTempByte.5
	sta Game.PlayerXH
	sec
	lda Game.PlayerYL
	sbc Standard.ZTempByte.6
	sta Game.PlayerYL
	lda Game.PlayerYH
	sbc Standard.ZTempByte.7
	sta Game.PlayerYH
	

	clc
	lda Game.PlayerXL
	adc Standard.ZTempByte.4
	sta Game.PlayerXL
	lda Game.PlayerXH
	adc Standard.ZTempByte.5
	sta Game.PlayerXH
	sec
	lda Game.PlayerYL
	sbc Standard.ZTempByte.6
	sta Game.PlayerYL
	lda Game.PlayerYH
	sbc Standard.ZTempByte.7
	sta Game.PlayerYH
	
	clc
	lda Game.PlayerXL
	adc Standard.ZTempByte.4
	sta Game.PlayerXL
	lda Game.PlayerXH
	adc Standard.ZTempByte.5
	sta Game.PlayerXH
	sec
	lda Game.PlayerYL
	sbc Standard.ZTempByte.6
	sta Game.PlayerYL
	lda Game.PlayerYH
	sbc Standard.ZTempByte.7
	sta Game.PlayerYH
		
	clc
	lda Game.PlayerXL
	adc Standard.ZTempByte.4
	sta Game.PlayerXL
	lda Game.PlayerXH
	adc Standard.ZTempByte.5
	sta Game.PlayerXH
	sec
	lda Game.PlayerYL
	sbc Standard.ZTempByte.6
	sta Game.PlayerYL
	lda Game.PlayerYH
	sbc Standard.ZTempByte.7
	sta Game.PlayerYH
	rts
	
	
Raycaster.MoveBackward:
	MMC3.BankSwitch8000() 9

	ldy #0
	lda Game.PlayerLeftAngle
	clc
	adc #21
	cmp #$B4
	bcc +
	sec
	sbc #$B4
+
	sta Raycast.FacingAngle
	asl a
	sta Standard.ZTempByte.0
	lda #0
	rol a
	sta Standard.ZTempByte.1
	
	ldy #0
	lda Standard.ZTempByte.0
	clc
	adc #<Raycasting.RunLow
	sta Standard.ZTempWord.0
	lda Standard.ZTempByte.1
	adc #>Raycasting.RunLow
	sta Standard.ZTempWord.0+1
	lda (Standard.ZTempWord.0),y
	sta Standard.ZTempByte.4
	
	lda Standard.ZTempByte.0
	clc
	adc #<Raycasting.RunHigh
	sta Standard.ZTempWord.0
	lda Standard.ZTempByte.1
	adc #>Raycasting.RunHigh
	sta Standard.ZTempWord.0+1
	lda (Standard.ZTempWord.0),y
	sta Standard.ZTempByte.5
	
	lda Standard.ZTempByte.0
	clc
	adc #<Raycasting.RiseLow
	sta Standard.ZTempWord.0
	lda Standard.ZTempByte.1
	adc #>Raycasting.RiseLow
	sta Standard.ZTempWord.0+1
	lda (Standard.ZTempWord.0),y
	sta Standard.ZTempByte.6
	
	lda Standard.ZTempByte.0
	clc
	adc #<Raycasting.RiseHigh
	sta Standard.ZTempWord.0
	lda Standard.ZTempByte.1
	adc #>Raycasting.RiseHigh
	sta Standard.ZTempWord.0+1
	lda (Standard.ZTempWord.0),y
	sta Standard.ZTempByte.7
	

	sec
	lda Game.PlayerXL
	sbc Standard.ZTempByte.4
	sta Game.PlayerXL
	lda Game.PlayerXH
	sbc Standard.ZTempByte.5
	sta Game.PlayerXH
	clc
	lda Game.PlayerYL
	adc Standard.ZTempByte.6
	sta Game.PlayerYL
	lda Game.PlayerYH
	adc Standard.ZTempByte.7
	sta Game.PlayerYH
	
	sec
	lda Game.PlayerXL
	sbc Standard.ZTempByte.4
	sta Game.PlayerXL
	lda Game.PlayerXH
	sbc Standard.ZTempByte.5
	sta Game.PlayerXH
	clc
	lda Game.PlayerYL
	adc Standard.ZTempByte.6
	sta Game.PlayerYL
	lda Game.PlayerYH
	adc Standard.ZTempByte.7
	sta Game.PlayerYH
	
	sec
	lda Game.PlayerXL
	sbc Standard.ZTempByte.4
	sta Game.PlayerXL
	lda Game.PlayerXH
	sbc Standard.ZTempByte.5
	sta Game.PlayerXH
	clc
	lda Game.PlayerYL
	adc Standard.ZTempByte.6
	sta Game.PlayerYL
	lda Game.PlayerYH
	adc Standard.ZTempByte.7
	sta Game.PlayerYH
	rts
	
Raycasting.DDA:

	lda Game.PlayerXH
	and #$F0
	lsr a
	lsr a
	lsr a
	lsr a
	sta Raycast.PlayerLocation
	lda Game.PlayerYH
	and #$F0
	ora Raycast.PlayerLocation
	sta Raycast.PlayerLocation
	sta Raycast.RayLocation
	
	lda Game.PlayerXH
	and #$0F
	sta Raycast.InBlockX
	sta Raycast.FromLeft
	eor #$0F
	sta Raycast.FromRight
	lda Game.PlayerYH
	and #$0F
	sta Raycast.InBlockY
	sta Raycast.FromTop
	eor #$0F
	sta Raycast.FromBottom
	
	
	lda #0
	sta Game.CurrentColumn
	ldy #0
	lda Game.PlayerLeftAngle
	asl a
	sta Raycast.CurrentAngleL
	lda #0
	rol a
	sta Raycast.CurrentAngleH
	lda #$00
	sta Raycast.CurrentAngleFromFacing

	lda Raycast.CurrentAngleH
	bne +
	lda Raycast.CurrentAngleL
	cmp #181
	bcs +
	MMC3.BankSwitch8000() 7
	jsr Raycast1.StartAtAngle
	rts
+	
	MMC3.BankSwitch8000() 8
	jsr Raycast2.StartAtAngle
	rts
	
Raycast1.DrawingWall:
	lda Raycast.WallDist
	jsr Raycast1.CorrectWall
	jsr Raycast1.GetInWall
	MMC3.BankSwitch8000() 12
	ldy System.Main.Math.Answer1
	ldx Game.CurrentColumn
	lda Raycast.WallDist
	sta Raycast.WallDistances.w,x
	txa
	asl a
	sta Raycast.Drawing.PixelX
	jsr Raycast.DrawWall
	MMC3.BankSwitch8000() 7
	inc Game.CurrentColumn
	inc Raycast.CurrentAngleFromFacing
	rts
	
Raycast2.DrawingWall:
	lda Raycast.WallDist
	jsr Raycast2.CorrectWall
	jsr Raycast2.GetInWall
	MMC3.BankSwitch8000() 12
	ldy System.Main.Math.Answer1
	ldx Game.CurrentColumn
	lda Raycast.WallDist
	sta Raycast.WallDistances.w,x
	txa
	asl a
	sta Raycast.Drawing.PixelX
	jsr Raycast.DrawWall
	MMC3.BankSwitch8000() 8
	inc Game.CurrentColumn
	inc Raycast.CurrentAngleFromFacing
	rts
	
Raycast.SwitchTo1:
	MMC3.BankSwitch8000() 7
	jmp Raycast1.0
	
Raycast.SwitchTo2:
	MMC3.BankSwitch8000() 8
	jmp Raycast2.181


Raycast1.GetInWall:
	lda Raycast.WallDist
	sta System.Main.Math.A02
	lda #$00				;2
	sta System.Main.Math.Answer02		;5
	sta System.Main.Math.Answer12		;8
	sta System.Main.Math.Answer22		;11
	sta System.Main.Math.B22
	
	lda Raycast.Side
	bne +
	ldy Raycast.SemiAngle
	lda Raycasting1.CosLow.w,y
	sta System.Main.Math.B02
	lda Raycasting1.CosHigh.w,y
	sta System.Main.Math.B12
	jmp ++
+
	ldy Raycast.SemiAngle
	lda Raycasting1.SinLow.w,y
	sta System.Main.Math.B02
	lda Raycasting1.SinHigh.w,y
	sta System.Main.Math.B12
++	
	ldx #8
	
-
	lsr System.Main.Math.A02			;5
	bcc +					;7
	clc					;9
	lda System.Main.Math.Answer02		;12
	adc System.Main.Math.B02			;15
	sta System.Main.Math.Answer02		;18
	lda System.Main.Math.Answer12		;21
	adc System.Main.Math.B12			;24
	sta System.Main.Math.Answer12		;27
	lda System.Main.Math.Answer22		;30
	adc System.Main.Math.B22			;33
	sta System.Main.Math.Answer22		;36
+
	asl System.Main.Math.B02			;13/41
	rol System.Main.Math.B12			;18/46
	rol System.Main.Math.B22			;23/51
	dex					;25/53
	bne -					;28/56
	
	lda Raycast.Side
	bne ++
	sec
	lda Raycast.InBlockY
	sbc System.Main.Math.Answer12
	eor Raycast.SliceID
	and #$0F
	sta Raycast.SliceID
	rts
++
	clc
	lda Raycast.InBlockX
	adc System.Main.Math.Answer12
	eor Raycast.SliceID
	and #$0F
	sta Raycast.SliceID
	rts

Raycast2.GetInWall:
	lda Raycast.WallDist
	sta System.Main.Math.A02
	lda #$00				;2
	sta System.Main.Math.Answer02		;5
	sta System.Main.Math.Answer12		;8
	sta System.Main.Math.Answer22		;11
	sta System.Main.Math.B22
	
	lda Raycast.Side
	bne +
	ldy Raycast.SemiAngle
	lda Raycasting2.CosLow.w,y
	sta System.Main.Math.B02
	lda Raycasting2.CosHigh.w,y
	sta System.Main.Math.B12
	jmp ++
+
	ldy Raycast.SemiAngle
	lda Raycasting2.SinLow.w,y
	sta System.Main.Math.B02
	lda Raycasting2.SinHigh.w,y
	sta System.Main.Math.B12
++	
	ldx #8
	
-
	lsr System.Main.Math.A02			;5
	bcc +					;7
	clc					;9
	lda System.Main.Math.Answer02		;12
	adc System.Main.Math.B02			;15
	sta System.Main.Math.Answer02		;18
	lda System.Main.Math.Answer12		;21
	adc System.Main.Math.B12			;24
	sta System.Main.Math.Answer12		;27
	lda System.Main.Math.Answer22		;30
	adc System.Main.Math.B22			;33
	sta System.Main.Math.Answer22		;36
+
	asl System.Main.Math.B02			;13/41
	rol System.Main.Math.B12			;18/46
	rol System.Main.Math.B22			;23/51
	dex					;25/53
	bne -					;28/56
	
	lda Raycast.Side
	bne ++
	lda Raycast.SliceID
	beq +
	sec
	lda Raycast.InBlockY
	sbc System.Main.Math.Answer12
	eor Raycast.SliceID
	clc
	adc #1
	and #$0F
	sta Raycast.SliceID
	rts
+
	sec
	lda Raycast.InBlockY
	sbc System.Main.Math.Answer12
	and #$0F
	sta Raycast.SliceID
	rts
++
	lda Raycast.SliceID
	beq +
	clc
	lda Raycast.InBlockX
	adc System.Main.Math.Answer12
	eor Raycast.SliceID
	and #$0F
	sta Raycast.SliceID
	rts
+
	clc
	lda Raycast.InBlockX
	adc System.Main.Math.Answer12
	and #$0F
	sta Raycast.SliceID
	rts
	
Raycasting.ObjectDraw.GetWallWidths:
;Expected: Distance in X
	txa
	pha
	MMC3.BankSwitch8000() 10
	pla
	tax
	lda ObjectDraw.SlicesAtDistancesH.w,x
	sta Raycast.ObjectDraw.SliceCountH
	lda ObjectDraw.SlicesAtDistancesL.w,x
	sta Raycast.ObjectDraw.SliceCountL
	
	ldy #0
-
	lda (Raycast.ObjectDraw.SliceCountL),y
	sta Raycast.ObjectSliceCounts,y
	iny
	cpy #32
	bne -
	
	MMC3.BankSwitch8000() 5
	rts
	
Raycasting1.SinLow:
.db $00
.db $04,$08,$0D,$11,$16,$1A,$1F,$23,$28,$2C,$30,$35,$39,$3D,$42,$46
.db $4A,$4F,$53,$57,$5B,$5F,$64,$68,$6C,$70,$74,$78,$7C,$80,$83,$87
.db $8B,$8F,$92,$96,$9A,$9D,$A1,$A4,$A7,$AB,$AE,$B1,$B5,$B8,$BB,$BE
.db $C1,$C4,$C6,$C9,$CC,$CF,$D1,$D4,$D6,$D9,$DB,$DD,$DF,$E2,$E4,$E6
.db $E8,$E9,$EB,$ED,$EE,$F0,$F2,$F3,$F4,$F6,$F7,$F8,$F9,$FA,$FB,$FC
.db $FC,$FD,$FE,$FE,$FF,$FF,$FF,$FF,$FF,$00,$FF,$FF,$FF,$FF,$FF,$FE
.db $FE,$FD,$FC,$FC,$FB,$FA,$F9,$F8,$F7,$F6,$F4,$F3,$F2,$F0,$EE,$ED
.db $EB,$E9,$E8,$E6,$E4,$E2,$DF,$DD,$DB,$D9,$D6,$D4,$D1,$CF,$CC,$C9
.db $C6,$C4,$C1,$BE,$BB,$B8,$B5,$B1,$AE,$AB,$A7,$A4,$A1,$9D,$9A,$96
.db $92,$8F,$8B,$87,$83,$7F,$7C,$78,$74,$70,$6C,$68,$64,$5F,$5B,$57
.db $53,$4F,$4A,$46,$42,$3D,$39,$35,$30,$2C,$28,$23,$1F,$1A,$16,$11
.db $0D,$08,$04,$00

Raycasting1.SinHigh:
.db $00
.db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.db $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$00,$00
.db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.db $00,$00,$00,$00

Raycasting1.CosLow:
.db $00
.db $FF,$FF,$FF,$FF,$FF,$FE,$FE,$FD,$FC,$FC,$FB,$FA,$F9,$F8,$F7,$F6
.db $F4,$F3,$F2,$F0,$EE,$ED,$EB,$E9,$E8,$E6,$E4,$E2,$DF,$DD,$DB,$D9
.db $D6,$D4,$D1,$CF,$CC,$C9,$C6,$C4,$C1,$BE,$BB,$B8,$B5,$B1,$AE,$AB
.db $A7,$A4,$A1,$9D,$9A,$96,$92,$8F,$8B,$87,$83,$7F,$7C,$78,$74,$70
.db $6C,$68,$64,$5F,$5B,$57,$53,$4F,$4A,$46,$42,$3D,$39,$35,$30,$2C
.db $28,$23,$1F,$1A,$16,$11,$0D,$08,$04,$00,$FC,$F8,$F3,$EF,$EA,$E6
.db $E1,$DD,$D8,$D4,$D0,$CB,$C7,$C3,$BE,$BA,$B6,$B1,$AD,$A9,$A5,$A1
.db $9C,$98,$94,$90,$8C,$88,$84,$80,$7D,$79,$75,$71,$6E,$6A,$66,$63
.db $5F,$5C,$59,$55,$52,$4F,$4B,$48,$45,$42,$3F,$3C,$3A,$37,$34,$31
.db $2F,$2C,$2A,$27,$25,$23,$21,$1E,$1C,$1A,$18,$17,$15,$13,$12,$10
.db $0E,$0D,$0C,$0A,$09,$08,$07,$06,$05,$04,$04,$03,$02,$02,$01,$01
.db $01,$01,$01,$00


Raycasting1.CosHigh:
.db $01
.db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$FF,$FF,$FF,$FF,$FF,$FF
.db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
.db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
.db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
.db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
.db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
.db $FF,$FF,$FF,$FF




Raycasting2.SinLow:

.db             $00,$FC,$F8,$F3,$EF,$EA,$E6,$E1,$DD,$D8,$D4,$D0,$CB
.db $C7,$C3,$BE,$BA,$B6,$B1,$AD,$A9,$A5,$A1,$9C,$98,$94,$90,$8C,$88
.db $84,$80,$7D,$79,$75,$71,$6E,$6A,$66,$63,$5F,$5C,$59,$55,$52,$4F
.db $4B,$48,$45,$42,$3F,$3C,$3A,$37,$34,$31,$2F,$2C,$2A,$27,$25,$23
.db $21,$1E,$1C,$1A,$18,$17,$15,$13,$12,$10,$0E,$0D,$0C,$0A,$09,$08
.db $07,$06,$05,$04,$04,$03,$02,$02,$01,$01,$01,$01,$01,$00,$01,$01
.db $01,$01,$01,$02,$02,$03,$04,$04,$05,$06,$07,$08,$09,$0A,$0C,$0D
.db $0E,$10,$12,$13,$15,$17,$18,$1A,$1C,$1E,$21,$23,$25,$27,$2A,$2C
.db $2F,$31,$34,$37,$3A,$3C,$3F,$42,$45,$48,$4B,$4F,$52,$55,$59,$5C
.db $5F,$63,$66,$6A,$6E,$71,$75,$79,$7D,$81,$84,$88,$8C,$90,$94,$98
.db $9C,$A1,$A5,$A9,$AD,$B1,$B6,$BA,$BE,$C3,$C7,$CB,$D0,$D4,$D8,$DD
.db $E1,$E6,$EA,$EF,$F3,$F8,$FC,$00

Raycasting2.SinHigh:

.db             $00,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
.db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
.db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
.db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
.db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
.db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
.db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
.db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
.db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
.db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
.db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
.db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$00

Raycasting2.CosLow:

.db             $00,$01,$01,$01,$01,$01,$02,$02,$03,$04,$04,$05,$06
.db $07,$08,$09,$0A,$0C,$0D,$0E,$10,$12,$13,$15,$17,$18,$1A,$1C,$1E
.db $21,$23,$25,$27,$2A,$2C,$2F,$31,$34,$37,$3A,$3C,$3F,$42,$45,$48
.db $4B,$4F,$52,$55,$59,$5C,$5F,$63,$66,$6A,$6E,$71,$75,$79,$7D,$81
.db $84,$88,$8C,$90,$94,$98,$9C,$A1,$A5,$A9,$AD,$B1,$B6,$BA,$BE,$C3
.db $C7,$CB,$D0,$D4,$D8,$DD,$E1,$E6,$EA,$EF,$F3,$F8,$FC,$00,$04,$08
.db $0D,$11,$16,$1A,$1F,$23,$28,$2C,$30,$35,$39,$3D,$42,$46,$4A,$4F
.db $53,$57,$5B,$5F,$64,$68,$6C,$70,$74,$78,$7C,$80,$83,$87,$8B,$8F
.db $92,$96,$9A,$9D,$A1,$A4,$A7,$AB,$AE,$B1,$B5,$B8,$BB,$BE,$C1,$C4
.db $C6,$C9,$CC,$CF,$D1,$D4,$D6,$D9,$DB,$DD,$DF,$E2,$E4,$E6,$E8,$E9
.db $EB,$ED,$EE,$F0,$F2,$F3,$F4,$F6,$F7,$F8,$F9,$FA,$FB,$FC,$FC,$FD
.db $FE,$FE,$FF,$FF,$FF,$FF,$FF,$00


Raycasting2.CosHigh:
.db             $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
.db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
.db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
.db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
.db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
.db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$00,$00,$00
.db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.db $00,$00,$00,$00,$00,$00,$00,$01