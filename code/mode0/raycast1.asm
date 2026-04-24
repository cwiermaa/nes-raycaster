.MACRO Raycast1.StandardRay()

	lda #\1			;1/Cos L
	ldx #\2			;1/Cos H
	jsr Raycast1.MultiplyCosFromTop
	lda #\3			;1/Sin L
	ldx #\4			;1/Sin H
	jsr Raycast1.MultiplySinFromRight
	lda #\9
	sta Raycast.SemiAngle
	lda #\5			;DeltaYL
	sta Raycast.DeltaYL
	lda #\6			;DeltaYH
	ldx #\7	;DeltaXL
	ldy #\8		;DeltaXH
	jsr Raycast1.DDA
.ENDM

.MACRO Raycast1.StandardRay.Conditional()

	lda #\1			;1/Cos L
	ldx #\2			;1/Cos H
	jsr Raycast1.MultiplyCosFromTop
	
	lda #\10
	cmp Raycast.FromRight
	bcs +
	lda #$FF
	sta Raycast.SideXDistL
	sta Raycast.SideXDistH
	jmp ++
+
	lda #\3			;1/Sin L
	ldx #\4			;1/Sin H
	jsr Raycast1.MultiplySinFromRight
++
	lda #\9
	sta Raycast.SemiAngle
	lda #\5			;DeltaYL
	sta Raycast.DeltaYL
	lda #\6			;DeltaYH
	ldx #\7	;DeltaXL
	ldy #\8		;DeltaXH
	jsr Raycast1.DDA
.ENDM

.MACRO Raycast1.StandardRay.Conditional2()

	lda #\10
	cmp Raycast.FromTop
	bcs +
	
	lda #$FF
	sta Raycast.SideYDistL
	sta Raycast.SideYDistH
	jmp ++
+
	lda #\1			;1/Cos L
	ldx #\2			;1/Cos H
	jsr Raycast1.MultiplyCosFromTop
++
	lda #\3			;1/Sin L
	ldx #\4			;1/Sin H
	jsr Raycast1.MultiplySinFromRight
	lda #\9
	sta Raycast.SemiAngle
	lda #\5			;DeltaYL
	sta Raycast.DeltaYL
	lda #\6			;DeltaYH
	ldx #\7	;DeltaXL
	ldy #\8		;DeltaXH
	jsr Raycast1.DDA
.ENDM

.MACRO Raycast1.StandardRay2()
	lda #\1			;1/Cos L
	ldx #\2			;1/Cos H
	jsr Raycast1.MultiplyCosFromBottom
	lda #\3			;1/Sin L
	ldx #\4			;1/Sin H
	jsr Raycast1.MultiplySinFromRight

	lda #\9
	sta Raycast.SemiAngle
	lda #<(\1 * 16)			;DeltaYL
	sta Raycast.DeltaYL
	lda #>((\2 * 4096) + (\1 * 16))			;DeltaYH
	ldx #<(\3 * 16)			;DeltaXL
	ldy #>((\4 * 4096) + (\3 * 16))		;DeltaXH
	jsr Raycast1.DDA2
.ENDM

.MACRO Raycast1.StandardRay2.Conditional()
	lda #\10
	cmp Raycast.FromBottom
	bcs +
	lda #$FF
	sta Raycast.SideYDistL
	sta Raycast.SideYDistH
	jmp ++
+
	lda #\1			;1/Cos L
	ldx #\2			;1/Cos H
	jsr Raycast1.MultiplyCosFromBottom
++
	lda #\3			;1/Sin L
	ldx #\4			;1/Sin H
	jsr Raycast1.MultiplySinFromRight

	lda #\9
	sta Raycast.SemiAngle
	lda #<(\1 * 16)			;DeltaYL
	sta Raycast.DeltaYL
	lda #>((\2 * 4096) + (\1 * 16))			;DeltaYH
	ldx #<(\3 * 16)			;DeltaXL
	ldy #>((\4 * 4096) + (\3 * 16))		;DeltaXH
	jsr Raycast1.DDA2
.ENDM

.MACRO Raycast1.StandardRay2.Conditional2()
	lda #\1			;1/Cos L
	ldx #\2			;1/Cos H
	jsr Raycast1.MultiplyCosFromBottom
	
	lda #\10
	cmp Raycast.FromRight
	bcs +
	lda #$FF
	sta Raycast.SideXDistL
	sta Raycast.SideXDistH
	jmp ++
+
	lda #\3			;1/Sin L
	ldx #\4			;1/Sin H
	jsr Raycast1.MultiplySinFromRight
++
	lda #\9
	sta Raycast.SemiAngle
	lda #<(\1 * 16)			;DeltaYL
	sta Raycast.DeltaYL
	lda #>((\2 * 4096) + (\1 * 16))			;DeltaYH
	ldx #<(\3 * 16)			;DeltaXL
	ldy #>((\4 * 4096) + (\3 * 16))		;DeltaXH
	jsr Raycast1.DDA2
.ENDM
Raycast1.0:
	Raycast1.StandardRay.Conditional() $00,$01,$4C,$39,$01,$10,$C7,$94,0,3
Raycast1.1:
	Raycast1.StandardRay.Conditional() $00,$01,$4C,$39,$01,$10,$C7,$94,1,3
Raycast1.2:
	Raycast1.StandardRay.Conditional() $00,$01,$A7,$1C,$02,$10,$76,$CA,2,7
Raycast1.3:
	Raycast1.StandardRay.Conditional() $00,$01,$1B,$13,$06,$10,$B8,$31,3,12
Raycast1.4:
	Raycast1.StandardRay() $00,$01,$55,$0E,$0A,$10,$5F,$E5,4
Raycast1.5:
	Raycast1.StandardRay() $00,$01,$79,$0B,$10,$10,$94,$B7,5
Raycast1.6:
	Raycast1.StandardRay() $01,$01,$91,$09,$17,$10,$11,$99,6
Raycast1.7:
	Raycast1.StandardRay() $01,$01,$34,$08,$1F,$10,$4A,$83,7
Raycast1.8:
	Raycast1.StandardRay() $02,$01,$2F,$07,$28,$10,$F7,$72,8
Raycast1.9:
	Raycast1.StandardRay() $03,$01,$64,$06,$33,$10,$47,$66,9
Raycast1.10:
	Raycast1.StandardRay() $03,$01,$C2,$05,$3F,$10,$24,$5C,10
Raycast1.11:
	Raycast1.StandardRay() $04,$01,$3D,$05,$4D,$10,$DA,$53,11
Raycast1.12:
	Raycast1.StandardRay() $05,$01,$CF,$04,$5C,$10,$F5,$4C,12
Raycast1.13:
	Raycast1.StandardRay() $06,$01,$72,$04,$6C,$10,$20,$47,13
Raycast1.14:
	Raycast1.StandardRay() $07,$01,$22,$04,$7D,$10,$23,$42,14
Raycast1.15:
	Raycast1.StandardRay() $09,$01,$DD,$03,$90,$10,$D2,$3D,15
Raycast1.16:
	Raycast1.StandardRay() $0A,$01,$A0,$03,$A5,$10,$0C,$3A,16
Raycast1.17:
	Raycast1.StandardRay() $0B,$01,$6B,$03,$BB,$10,$BA,$36,17
Raycast1.18:
	Raycast1.StandardRay() $0D,$01,$3C,$03,$D3,$10,$C7,$33,18
Raycast1.19:
	Raycast1.StandardRay() $0E,$01,$12,$03,$EC,$10,$25,$31,19
Raycast1.20:
	Raycast1.StandardRay() $10,$01,$EC,$02,$07,$11,$C8,$2E,20
Raycast1.21:
	Raycast1.StandardRay() $12,$01,$CA,$02,$23,$11,$A6,$2C,21
Raycast1.22:
	Raycast1.StandardRay() $14,$01,$AB,$02,$42,$11,$B6,$2A,22
Raycast1.23:
	Raycast1.StandardRay() $16,$01,$8F,$02,$62,$11,$F3,$28,23
Raycast1.24:
	Raycast1.StandardRay() $18,$01,$75,$02,$84,$11,$56,$27,24
Raycast1.25:
	Raycast1.StandardRay() $1A,$01,$5D,$02,$A7,$11,$DC,$25,25
Raycast1.26:
	Raycast1.StandardRay() $1C,$01,$47,$02,$CD,$11,$80,$24,26
Raycast1.27:
	Raycast1.StandardRay() $1F,$01,$33,$02,$F5,$11,$3E,$23,27
Raycast1.28:
	Raycast1.StandardRay() $21,$01,$21,$02,$1F,$12,$15,$22,28
Raycast1.29:
	Raycast1.StandardRay() $24,$01,$10,$02,$4B,$12,$01,$21,29
Raycast1.30:
	Raycast1.StandardRay() $27,$01,$FF,$01,$7A,$12,$00,$1F,30
Raycast1.31:
	Raycast1.StandardRay() $2A,$01,$F1,$01,$AB,$12,$11,$1F,31
Raycast1.32:
	Raycast1.StandardRay() $2D,$01,$E3,$01,$DE,$12,$31,$1E,32
Raycast1.33:
	Raycast1.StandardRay() $31,$01,$D6,$01,$14,$13,$61,$1D,33
Raycast1.34:
	Raycast1.StandardRay() $34,$01,$C9,$01,$4D,$13,$9D,$1C,34
Raycast1.35:
	Raycast1.StandardRay() $38,$01,$BE,$01,$88,$13,$E5,$1B,35
Raycast1.36:
	Raycast1.StandardRay() $3C,$01,$B3,$01,$C7,$13,$39,$1B,36
Raycast1.37:
	Raycast1.StandardRay() $40,$01,$A9,$01,$09,$14,$96,$1A,37
Raycast1.38:
	Raycast1.StandardRay() $44,$01,$9F,$01,$4E,$14,$FD,$19,38
Raycast1.39:
	Raycast1.StandardRay() $49,$01,$96,$01,$97,$14,$6D,$19,39
Raycast1.40:
	Raycast1.StandardRay() $4E,$01,$8E,$01,$E3,$14,$E4,$18,40
Raycast1.41:
	Raycast1.StandardRay() $53,$01,$86,$01,$33,$15,$63,$18,41
Raycast1.42:
	Raycast1.StandardRay() $58,$01,$7E,$01,$88,$15,$E9,$17,42
Raycast1.43:
	Raycast1.StandardRay() $5E,$01,$77,$01,$E1,$15,$76,$17,43
Raycast1.44:
	Raycast1.StandardRay() $63,$01,$70,$01,$3E,$16,$08,$17,44
Raycast1.45:
	Raycast1.StandardRay() $6A,$01,$6A,$01,$A1,$16,$A1,$16,45
Raycast1.46:
	Raycast1.StandardRay() $70,$01,$63,$01,$08,$17,$3E,$16,46
Raycast1.47:
	Raycast1.StandardRay() $77,$01,$5E,$01,$76,$17,$E1,$15,47
Raycast1.48:
	Raycast1.StandardRay() $7E,$01,$58,$01,$E9,$17,$88,$15,48
Raycast1.49:
	Raycast1.StandardRay() $86,$01,$53,$01,$63,$18,$33,$15,49
Raycast1.50:
	Raycast1.StandardRay() $8E,$01,$4E,$01,$E4,$18,$E3,$14,50
Raycast1.51:
	Raycast1.StandardRay() $96,$01,$49,$01,$6D,$19,$97,$14,51
Raycast1.52:
	Raycast1.StandardRay() $9F,$01,$44,$01,$FD,$19,$4E,$14,52
Raycast1.53:
	Raycast1.StandardRay() $A9,$01,$40,$01,$96,$1A,$09,$14,53
Raycast1.54:
	Raycast1.StandardRay() $B3,$01,$3C,$01,$39,$1B,$C7,$13,54
Raycast1.55:
	Raycast1.StandardRay() $BE,$01,$38,$01,$E5,$1B,$88,$13,55
Raycast1.56:
	Raycast1.StandardRay() $C9,$01,$34,$01,$9D,$1C,$4D,$13,56
Raycast1.57:
	Raycast1.StandardRay() $D6,$01,$31,$01,$61,$1D,$14,$13,57
Raycast1.58:
	Raycast1.StandardRay() $E3,$01,$2D,$01,$31,$1E,$DE,$12,58
Raycast1.59:
	Raycast1.StandardRay() $F1,$01,$2A,$01,$11,$1F,$AB,$12,59
Raycast1.60:
	Raycast1.StandardRay() $00,$02,$27,$01,$00,$20,$7A,$12,60
Raycast1.61:
	Raycast1.StandardRay() $10,$02,$24,$01,$01,$21,$4B,$12,61
Raycast1.62:
	Raycast1.StandardRay() $21,$02,$21,$01,$15,$22,$1F,$12,62
Raycast1.63:
	Raycast1.StandardRay() $33,$02,$1F,$01,$3E,$23,$F5,$11,63
Raycast1.64:
	Raycast1.StandardRay() $47,$02,$1C,$01,$80,$24,$CD,$11,64
Raycast1.65:
	Raycast1.StandardRay() $5D,$02,$1A,$01,$DC,$25,$A7,$11,65
Raycast1.66:
	Raycast1.StandardRay() $75,$02,$18,$01,$56,$27,$84,$11,66
Raycast1.67:
	Raycast1.StandardRay() $8F,$02,$16,$01,$F3,$28,$62,$11,67
Raycast1.68:
	Raycast1.StandardRay() $AB,$02,$14,$01,$B6,$2A,$42,$11,68
Raycast1.69:
	Raycast1.StandardRay() $CA,$02,$12,$01,$A6,$2C,$23,$11,69
Raycast1.70:
	Raycast1.StandardRay() $EC,$02,$10,$01,$C8,$2E,$07,$11,70
Raycast1.71:
	Raycast1.StandardRay() $12,$03,$0E,$01,$25,$31,$EC,$10,71
Raycast1.72:
	Raycast1.StandardRay() $3C,$03,$0D,$01,$C7,$33,$D3,$10,72
Raycast1.73:
	Raycast1.StandardRay() $6B,$03,$0B,$01,$BA,$36,$BB,$10,73
Raycast1.74:
	Raycast1.StandardRay() $A0,$03,$0A,$01,$0C,$3A,$A5,$10,74
Raycast1.75:
	Raycast1.StandardRay() $DD,$03,$09,$01,$D2,$3D,$90,$10,75
Raycast1.76:
	Raycast1.StandardRay() $22,$04,$07,$01,$23,$42,$7D,$10,76
Raycast1.77:
	Raycast1.StandardRay() $72,$04,$06,$01,$20,$47,$6C,$10,77
Raycast1.78:
	Raycast1.StandardRay() $CF,$04,$05,$01,$F5,$4C,$5C,$10,78
Raycast1.79:
	Raycast1.StandardRay() $3D,$05,$04,$01,$DA,$53,$4D,$10,79
Raycast1.80:
	Raycast1.StandardRay() $C2,$05,$03,$01,$24,$5C,$3F,$10,80
Raycast1.81:
	Raycast1.StandardRay() $64,$06,$03,$01,$47,$66,$33,$10,81
Raycast1.82:
	Raycast1.StandardRay() $2F,$07,$02,$01,$F7,$72,$28,$10,82
Raycast1.83:
	Raycast1.StandardRay() $34,$08,$01,$01,$4A,$83,$1F,$10,83
Raycast1.84:
	Raycast1.StandardRay() $91,$09,$01,$01,$11,$99,$17,$10,84
Raycast1.85:
	Raycast1.StandardRay() $79,$0B,$00,$01,$94,$B7,$10,$10,85
Raycast1.86:
	Raycast1.StandardRay() $55,$0E,$00,$01,$5F,$E5,$0A,$10,86
Raycast1.87:
	Raycast1.StandardRay.Conditional2() $1B,$13,$00,$01,$B8,$31,$06,$10,87,12
Raycast1.88:
	Raycast1.StandardRay.Conditional2() $A7,$1C,$00,$01,$76,$CA,$02,$10,88,7
Raycast1.89:
	Raycast1.StandardRay.Conditional2() $4C,$39,$00,$01,$C7,$94,$01,$10,89,3
Raycast1.90:
	Raycast1.StandardRay2.Conditional() $4C,$39,$00,$01,2,2,2,2,90,3
Raycast1.91:
	Raycast1.StandardRay2.Conditional() $4C,$39,$00,$01,2,2,2,2,91,3
Raycast1.92:
	Raycast1.StandardRay2.Conditional() $A7,$1C,$00,$01,2,2,2,2,92,7
Raycast1.93:
	Raycast1.StandardRay2.Conditional() $1B,$13,$00,$01,2,2,2,2,93,12
Raycast1.94:
	Raycast1.StandardRay2() $55,$0E,$00,$01,2,2,2,2,94
Raycast1.95:
	Raycast1.StandardRay2() $79,$0B,$00,$01,2,2,2,2,95
Raycast1.96:
	Raycast1.StandardRay2() $91,$09,$01,$01,2,2,2,2,96
Raycast1.97:
	Raycast1.StandardRay2() $34,$08,$01,$01,2,2,2,2,97
Raycast1.98:
	Raycast1.StandardRay2() $2F,$07,$02,$01,2,2,2,2,98
Raycast1.99:
	Raycast1.StandardRay2() $64,$06,$03,$01,2,2,2,2,99
Raycast1.100:
	Raycast1.StandardRay2() $C2,$05,$03,$01,2,2,2,2,100
Raycast1.101:
	Raycast1.StandardRay2() $3D,$05,$04,$01,2,2,2,2,101
Raycast1.102:
	Raycast1.StandardRay2() $CF,$04,$05,$01,2,2,2,2,102
Raycast1.103:
	Raycast1.StandardRay2() $72,$04,$06,$01,2,2,2,2,103
Raycast1.104:
	Raycast1.StandardRay2() $22,$04,$07,$01,2,2,2,2,104
Raycast1.105:
	Raycast1.StandardRay2() $DD,$03,$09,$01,2,2,2,2,105
Raycast1.106:
	Raycast1.StandardRay2() $A0,$03,$0A,$01,2,2,2,2,106
Raycast1.107:
	Raycast1.StandardRay2() $6B,$03,$0B,$01,2,2,2,2,107
Raycast1.108:
	Raycast1.StandardRay2() $3C,$03,$0D,$01,2,2,2,2,108
Raycast1.109:
	Raycast1.StandardRay2() $12,$03,$0E,$01,2,2,2,2,109
Raycast1.110:
	Raycast1.StandardRay2() $EC,$02,$10,$01,2,2,2,2,110
Raycast1.111:
	Raycast1.StandardRay2() $CA,$02,$12,$01,2,2,2,2,111
Raycast1.112:
	Raycast1.StandardRay2() $AB,$02,$14,$01,2,2,2,2,112
Raycast1.113:
	Raycast1.StandardRay2() $8F,$02,$16,$01,2,2,2,2,113
Raycast1.114:
	Raycast1.StandardRay2() $75,$02,$18,$01,2,2,2,2,114
Raycast1.115:
	Raycast1.StandardRay2() $5D,$02,$1A,$01,2,2,2,2,115
Raycast1.116:
	Raycast1.StandardRay2() $47,$02,$1C,$01,2,2,2,2,116
Raycast1.117:
	Raycast1.StandardRay2() $33,$02,$1F,$01,2,2,2,2,117
Raycast1.118:
	Raycast1.StandardRay2() $21,$02,$21,$01,2,2,2,2,118
Raycast1.119:
	Raycast1.StandardRay2() $10,$02,$24,$01,2,2,2,2,119
Raycast1.120:
	Raycast1.StandardRay2() $00,$02,$27,$01,2,2,2,2,120
Raycast1.121:
	Raycast1.StandardRay2() $F1,$01,$2A,$01,2,2,2,2,121
Raycast1.122:
	Raycast1.StandardRay2() $E3,$01,$2D,$01,2,2,2,2,122
Raycast1.123:
	Raycast1.StandardRay2() $D6,$01,$31,$01,2,2,2,2,123
Raycast1.124:
	Raycast1.StandardRay2() $C9,$01,$34,$01,2,2,2,2,124
Raycast1.125:
	Raycast1.StandardRay2() $BE,$01,$38,$01,2,2,2,2,125
Raycast1.126:
	Raycast1.StandardRay2() $B3,$01,$3C,$01,2,2,2,2,126
Raycast1.127:
	Raycast1.StandardRay2() $A9,$01,$40,$01,2,2,2,2,127
Raycast1.128:
	Raycast1.StandardRay2() $9F,$01,$44,$01,2,2,2,2,128
Raycast1.129:
	Raycast1.StandardRay2() $96,$01,$49,$01,2,2,2,2,129
Raycast1.130:
	Raycast1.StandardRay2() $8E,$01,$4E,$01,2,2,2,2,130
Raycast1.131:
	Raycast1.StandardRay2() $86,$01,$53,$01,2,2,2,2,131
Raycast1.132:
	Raycast1.StandardRay2() $7E,$01,$58,$01,2,2,2,2,132
Raycast1.133:
	Raycast1.StandardRay2() $77,$01,$5E,$01,2,2,2,2,133
Raycast1.134:
	Raycast1.StandardRay2() $70,$01,$63,$01,2,2,2,2,134
Raycast1.135:
	Raycast1.StandardRay2() $6A,$01,$6A,$01,2,2,2,2,135
Raycast1.136:
	Raycast1.StandardRay2() $63,$01,$70,$01,2,2,2,2,136
Raycast1.137:
	Raycast1.StandardRay2() $5E,$01,$77,$01,2,2,2,2,137
Raycast1.138:
	Raycast1.StandardRay2() $58,$01,$7E,$01,2,2,2,2,138
Raycast1.139:
	Raycast1.StandardRay2() $53,$01,$86,$01,2,2,2,2,139
Raycast1.140:
	Raycast1.StandardRay2() $4E,$01,$8E,$01,2,2,2,2,140
Raycast1.141:
	Raycast1.StandardRay2() $49,$01,$96,$01,2,2,2,2,141
Raycast1.142:
	Raycast1.StandardRay2() $44,$01,$9F,$01,2,2,2,2,142
Raycast1.143:
	Raycast1.StandardRay2() $40,$01,$A9,$01,2,2,2,2,143
Raycast1.144:
	Raycast1.StandardRay2() $3C,$01,$B3,$01,2,2,2,2,144
Raycast1.145:
	Raycast1.StandardRay2() $38,$01,$BE,$01,2,2,2,2,145
Raycast1.146:
	Raycast1.StandardRay2() $34,$01,$C9,$01,2,2,2,2,146
Raycast1.147:
	Raycast1.StandardRay2() $31,$01,$D6,$01,2,2,2,2,147
Raycast1.148:
	Raycast1.StandardRay2() $2D,$01,$E3,$01,2,2,2,2,148
Raycast1.149:
	Raycast1.StandardRay2() $2A,$01,$F1,$01,2,2,2,2,149
Raycast1.150:
	Raycast1.StandardRay2() $27,$01,$00,$02,2,2,2,2,150
Raycast1.151:
	Raycast1.StandardRay2() $24,$01,$10,$02,2,2,2,2,151
Raycast1.152:
	Raycast1.StandardRay2() $21,$01,$21,$02,2,2,2,2,152
Raycast1.153:
	Raycast1.StandardRay2() $1F,$01,$33,$02,2,2,2,2,153
Raycast1.154:
	Raycast1.StandardRay2() $1C,$01,$47,$02,2,2,2,2,154
Raycast1.155:
	Raycast1.StandardRay2() $1A,$01,$5D,$02,2,2,2,2,155
Raycast1.156:
	Raycast1.StandardRay2() $18,$01,$75,$02,2,2,2,2,156
Raycast1.157:
	Raycast1.StandardRay2() $16,$01,$8F,$02,2,2,2,2,157
Raycast1.158:
	Raycast1.StandardRay2() $14,$01,$AB,$02,2,2,2,2,158
Raycast1.159:
	Raycast1.StandardRay2() $12,$01,$CA,$02,2,2,2,2,159
Raycast1.160:
	Raycast1.StandardRay2() $10,$01,$EC,$02,2,2,2,2,160
Raycast1.161:
	Raycast1.StandardRay2() $0E,$01,$12,$03,2,2,2,2,161
Raycast1.162:
	Raycast1.StandardRay2() $0D,$01,$3C,$03,2,2,2,2,162
Raycast1.163:
	Raycast1.StandardRay2() $0B,$01,$6B,$03,2,2,2,2,163
Raycast1.164:
	Raycast1.StandardRay2() $0A,$01,$A0,$03,2,2,2,2,164
Raycast1.165:
	Raycast1.StandardRay2() $09,$01,$DD,$03,2,2,2,2,165
Raycast1.166:
	Raycast1.StandardRay2() $07,$01,$22,$04,2,2,2,2,166
Raycast1.167:
	Raycast1.StandardRay2() $06,$01,$72,$04,2,2,2,2,167
Raycast1.168:
	Raycast1.StandardRay2() $05,$01,$CF,$04,2,2,2,2,168
Raycast1.169:
	Raycast1.StandardRay2() $04,$01,$3D,$05,2,2,2,2,169
Raycast1.170:
	Raycast1.StandardRay2() $03,$01,$C2,$05,2,2,2,2,170
Raycast1.171:
	Raycast1.StandardRay2() $03,$01,$64,$06,2,2,2,2,171
Raycast1.172:
	Raycast1.StandardRay2() $02,$01,$2F,$07,2,2,2,2,172
Raycast1.173:
	Raycast1.StandardRay2() $01,$01,$34,$08,2,2,2,2,173
Raycast1.174:
	Raycast1.StandardRay2() $01,$01,$91,$09,2,2,2,2,174
Raycast1.175:
	Raycast1.StandardRay2() $00,$01,$79,$0B,2,2,2,2,175
Raycast1.176:
	Raycast1.StandardRay2() $00,$01,$55,$0E,2,2,2,2,176
Raycast1.177:
	Raycast1.StandardRay2.Conditional2() $00,$01,$1B,$13,2,2,2,2,177, 12
Raycast1.178:
	Raycast1.StandardRay2.Conditional2() $00,$01,$A7,$1C,2,2,2,2,178, 7
Raycast1.179:
	Raycast1.StandardRay2.Conditional2() $00,$01,$4C,$39,2,2,2,2,179, 3
Raycast1.180:
	jmp Raycast.SwitchTo2

Raycast1.MultiplyCosFromTop:
	pha
	ldy Raycast.FromTop
	lda Raycasting.MultiplyL.w,y
	sta Standard.ZTempWord.0
	lda Raycasting.MultiplyH.w,y
	sta Standard.ZTempWord.0+1
	pla
	jsr Raycasting.Multiply
	sta Raycast.SideYDistL
	stx Raycast.SideYDistH
	rts


Raycast1.MultiplyCosFromBottom:
	pha
	ldy Raycast.FromBottom
	lda Raycasting.MultiplyL.w,y
	sta Standard.ZTempWord.0
	lda Raycasting.MultiplyH.w,y
	sta Standard.ZTempWord.0+1
	pla
	jsr Raycasting.Multiply
	sta Raycast.SideYDistL
	stx Raycast.SideYDistH
	rts

	
Raycast1.MultiplySinFromRight:
	pha
	ldy Raycast.FromRight
	lda Raycasting.MultiplyL.w,y
	sta Standard.ZTempWord.0
	lda Raycasting.MultiplyH.w,y
	sta Standard.ZTempWord.0+1
	pla
	jsr Raycasting.Multiply
	sta Raycast.SideXDistL
	stx Raycast.SideXDistH
	rts
	
Raycast1.DDA:
	sta Raycast.DeltaYH
	stx Raycast.DeltaXL
	sty Raycast.DeltaXH
	lda Raycast.PlayerLocation
	sta Raycast.RayIndex
	
	ldy #0
	sty Raycast.SliceID
	
	ldx #$01
	stx Raycast.StepX
	
	ldx #$F0
	stx Raycast.StepY
	
--	
	lda Raycast.SideXDistH
	cmp Raycast.SideYDistH
	bcc ++
	beq +++++
-	
	clc
	lda Raycast.RayIndex
	adc Raycast.StepY
	sta Raycast.RayIndex
	tay
	ldx Raycast.SideYDistH
	lda Raycast.Room.w,y
	beq +
	sta Raycast.WallID
	stx Raycast.WallDist
	ldy #1
	sty Raycast.Side
	jmp ++++
	
+
	clc
	lda Raycast.SideYDistL
	adc Raycast.DeltaYL
	sta Raycast.SideYDistL
	lda Raycast.SideYDistH
	adc Raycast.DeltaYH
	sta Raycast.SideYDistH
	bcs +
	jmp --
+
	lda #$FF
	sta Raycast.SideYDistH
	sta Raycast.SideYDistL
	jmp --
+++++
	lda Raycast.SideYDistL
	cmp Raycast.SideXDistL
	bcc -
++
	clc
	lda Raycast.RayIndex
	adc Raycast.StepX
	sta Raycast.RayIndex
	tay
	ldx Raycast.SideXDistH
	lda Raycast.Room.w,y
	beq +
	sta Raycast.WallID
	stx Raycast.WallDist
	ldy #0
	sty Raycast.Side
	jmp ++++
	
+
	clc
	lda Raycast.SideXDistL
	adc Raycast.DeltaXL
	sta Raycast.SideXDistL
	lda Raycast.SideXDistH
	adc Raycast.DeltaXH
	sta Raycast.SideXDistH
	bcs +
	jmp --
+
	lda #$FF
	sta Raycast.SideXDistH
	sta Raycast.SideXDistL
	jmp --
++++
	jsr Raycast1.DrawingWall
	lda Game.CurrentColumn
	cmp #84
	bne +
	pla
	pla
	rts
+
	rts
	
Raycast1.DDA2:

	
	sta Raycast.DeltaYH
	stx Raycast.DeltaXL
	sty Raycast.DeltaXH
	lda Raycast.PlayerLocation
	sta Raycast.RayIndex
	
	
	ldy #$00
	sty Raycast.SliceID
	
	ldx #$01
	stx Raycast.StepX
	
	ldx #$10
	stx Raycast.StepY

--	
	lda Raycast.SideXDistH
	cmp Raycast.SideYDistH
	bcc ++
	beq +++++
-	
	clc
	lda Raycast.RayIndex
	adc Raycast.StepY
	sta Raycast.RayIndex
	tay
	ldx Raycast.SideYDistH
	lda Raycast.Room.w,y
	beq +
	sta Raycast.WallID
	stx Raycast.WallDist
	ldy #1
	sty Raycast.Side
	ldy #$0F
	sty Raycast.SliceID
	jmp ++++
	
+
	clc
	lda Raycast.SideYDistL
	adc Raycast.DeltaYL
	sta Raycast.SideYDistL
	lda Raycast.SideYDistH
	adc Raycast.DeltaYH
	sta Raycast.SideYDistH
	bcs +
	jmp --
+
	lda #$FF
	sta Raycast.SideYDistH
	sta Raycast.SideYDistL
	jmp --
+++++
	lda Raycast.SideYDistL
	cmp Raycast.SideXDistL
	bcc -
++
	clc
	lda Raycast.RayIndex
	adc Raycast.StepX
	sta Raycast.RayIndex
	tay
	ldx Raycast.SideXDistH
	lda Raycast.Room.w,y
	beq +
	sta Raycast.WallID
	stx Raycast.WallDist
	ldy #0
	sty Raycast.Side
	jmp ++++
	
+
	clc
	lda Raycast.SideXDistL
	adc Raycast.DeltaXL
	sta Raycast.SideXDistL
	lda Raycast.SideXDistH
	adc Raycast.DeltaXH
	sta Raycast.SideXDistH
	bcs +
	jmp --
+
	lda #$FF
	sta Raycast.SideXDistH
	sta Raycast.SideXDistL
	jmp --
++++
	jsr Raycast1.DrawingWall
	lda Game.CurrentColumn
	cmp #84
	bne +
	pla
	pla
	rts
+
	rts
	
Raycast1.CorrectWall:
	sta System.Main.Math.A0
	lda #$00				;2
	sta System.Main.Math.Answer0		;5
	sta System.Main.Math.Answer1		;8
	sta System.Main.Math.Answer2		;11
	sta System.Main.Math.B2
	
	ldy Raycast.CurrentAngleFromFacing
	
	lda Raycast1.CorrectL.w,y
	sta System.Main.Math.B0
	lda Raycast1.CorrectH.w,y
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
	
Raycast1.StartAtAngle:
	ldx Raycast.CurrentAngleL
	lda Raycast1.Lows.w,x
	sta Standard.ZTempWord.0
	lda Raycast1.Highs.w,x
	sta Standard.ZTempWord.0+1
	jmp (Standard.ZTempWord.0)
	
Raycast1.CorrectL:
.db $C1,$C4,
.db $C7,$CA,$CC,$CF,$D2,$D4,$D7,$D9,$DB,$DE,$E0,$E2,$E4,$E6,$E8,$EA,
.db $EC,$ED,$EF,$F1,$F2,$F3,$F5,$F6,$F7,$F8,$F9,$FA,$FB,$FC,$FD,$FE,
.db $FE,$FF,$FF,$FF,$FF,$FF,$FF,$FF

.db $FF
.db $FF,$FF,$FF,$FF,$FF,$FF,$FE,$FE,$FD,$FC,$FB,$FA,$F9,$F8,$F7,$F6,
.db $F5,$F3,$F2,$F1,$EF,$ED,$EC,$EA,$E8,$E6,$E4,$E2,$E0,$DE,$DB,$D9,
.db $D7,$D4,$D2,$CF,$CC,$CA,$C7,$C4,$C1


Raycast1.CorrectH:

.db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00

.db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00

Raycast1.Lows:
.db <Raycast1.0,
.db <Raycast1.1,<Raycast1.2,<Raycast1.3,<Raycast1.4,<Raycast1.5,<Raycast1.6,<Raycast1.7,<Raycast1.8,
.db <Raycast1.9,<Raycast1.10,<Raycast1.11,<Raycast1.12,<Raycast1.13,<Raycast1.14,<Raycast1.15,<Raycast1.16,
.db <Raycast1.17,<Raycast1.18,<Raycast1.19,<Raycast1.20,<Raycast1.21,<Raycast1.22,<Raycast1.23,<Raycast1.24,
.db <Raycast1.25,<Raycast1.26,<Raycast1.27,<Raycast1.28,<Raycast1.29,<Raycast1.30,<Raycast1.31,<Raycast1.32,
.db <Raycast1.33,<Raycast1.34,<Raycast1.35,<Raycast1.36,<Raycast1.37,<Raycast1.38,<Raycast1.39,<Raycast1.40,
.db <Raycast1.41,<Raycast1.42,<Raycast1.43,<Raycast1.44,<Raycast1.45,<Raycast1.46,<Raycast1.47,<Raycast1.48,
.db <Raycast1.49,<Raycast1.50,<Raycast1.51,<Raycast1.52,<Raycast1.53,<Raycast1.54,<Raycast1.55,<Raycast1.56,
.db <Raycast1.57,<Raycast1.58,<Raycast1.59,<Raycast1.60,<Raycast1.61,<Raycast1.62,<Raycast1.63,<Raycast1.64,
.db <Raycast1.65,<Raycast1.66,<Raycast1.67,<Raycast1.68,<Raycast1.69,<Raycast1.70,<Raycast1.71,<Raycast1.72,
.db <Raycast1.73,<Raycast1.74,<Raycast1.75,<Raycast1.76,<Raycast1.77,<Raycast1.78,<Raycast1.79,<Raycast1.80,
.db <Raycast1.81,<Raycast1.82,<Raycast1.83,<Raycast1.84,<Raycast1.85,<Raycast1.86,<Raycast1.87,<Raycast1.88,
.db <Raycast1.89,<Raycast1.90,<Raycast1.91,<Raycast1.92,<Raycast1.93,<Raycast1.94,<Raycast1.95,<Raycast1.96,
.db <Raycast1.97,<Raycast1.98,<Raycast1.99,<Raycast1.100,<Raycast1.101,<Raycast1.102,<Raycast1.103,<Raycast1.104,
.db <Raycast1.105,<Raycast1.106,<Raycast1.107,<Raycast1.108,<Raycast1.109,<Raycast1.110,<Raycast1.111,<Raycast1.112,
.db <Raycast1.113,<Raycast1.114,<Raycast1.115,<Raycast1.116,<Raycast1.117,<Raycast1.118,<Raycast1.119,<Raycast1.120,
.db <Raycast1.121,<Raycast1.122,<Raycast1.123,<Raycast1.124,<Raycast1.125,<Raycast1.126,<Raycast1.127,<Raycast1.128,
.db <Raycast1.129,<Raycast1.130,<Raycast1.131,<Raycast1.132,<Raycast1.133,<Raycast1.134,<Raycast1.135,<Raycast1.136,
.db <Raycast1.137,<Raycast1.138,<Raycast1.139,<Raycast1.140,<Raycast1.141,<Raycast1.142,<Raycast1.143,<Raycast1.144,
.db <Raycast1.145,<Raycast1.146,<Raycast1.147,<Raycast1.148,<Raycast1.149,<Raycast1.150,<Raycast1.151,<Raycast1.152,
.db <Raycast1.153,<Raycast1.154,<Raycast1.155,<Raycast1.156,<Raycast1.157,<Raycast1.158,<Raycast1.159,<Raycast1.160,
.db <Raycast1.161,<Raycast1.162,<Raycast1.163,<Raycast1.164,<Raycast1.165,<Raycast1.166,<Raycast1.167,<Raycast1.168,
.db <Raycast1.169,<Raycast1.170,<Raycast1.171,<Raycast1.172,<Raycast1.173,<Raycast1.174,<Raycast1.175,<Raycast1.176,
.db <Raycast1.177,<Raycast1.178,<Raycast1.179,<Raycast1.180

Raycast1.Highs:
.db >Raycast1.0,
.db >Raycast1.1,>Raycast1.2,>Raycast1.3,>Raycast1.4,>Raycast1.5,>Raycast1.6,>Raycast1.7,>Raycast1.8,
.db >Raycast1.9,>Raycast1.10,>Raycast1.11,>Raycast1.12,>Raycast1.13,>Raycast1.14,>Raycast1.15,>Raycast1.16,
.db >Raycast1.17,>Raycast1.18,>Raycast1.19,>Raycast1.20,>Raycast1.21,>Raycast1.22,>Raycast1.23,>Raycast1.24,
.db >Raycast1.25,>Raycast1.26,>Raycast1.27,>Raycast1.28,>Raycast1.29,>Raycast1.30,>Raycast1.31,>Raycast1.32,
.db >Raycast1.33,>Raycast1.34,>Raycast1.35,>Raycast1.36,>Raycast1.37,>Raycast1.38,>Raycast1.39,>Raycast1.40,
.db >Raycast1.41,>Raycast1.42,>Raycast1.43,>Raycast1.44,>Raycast1.45,>Raycast1.46,>Raycast1.47,>Raycast1.48,
.db >Raycast1.49,>Raycast1.50,>Raycast1.51,>Raycast1.52,>Raycast1.53,>Raycast1.54,>Raycast1.55,>Raycast1.56,
.db >Raycast1.57,>Raycast1.58,>Raycast1.59,>Raycast1.60,>Raycast1.61,>Raycast1.62,>Raycast1.63,>Raycast1.64,
.db >Raycast1.65,>Raycast1.66,>Raycast1.67,>Raycast1.68,>Raycast1.69,>Raycast1.70,>Raycast1.71,>Raycast1.72,
.db >Raycast1.73,>Raycast1.74,>Raycast1.75,>Raycast1.76,>Raycast1.77,>Raycast1.78,>Raycast1.79,>Raycast1.80,
.db >Raycast1.81,>Raycast1.82,>Raycast1.83,>Raycast1.84,>Raycast1.85,>Raycast1.86,>Raycast1.87,>Raycast1.88,
.db >Raycast1.89,>Raycast1.90,>Raycast1.91,>Raycast1.92,>Raycast1.93,>Raycast1.94,>Raycast1.95,>Raycast1.96,
.db >Raycast1.97,>Raycast1.98,>Raycast1.99,>Raycast1.100,>Raycast1.101,>Raycast1.102,>Raycast1.103,>Raycast1.104,
.db >Raycast1.105,>Raycast1.106,>Raycast1.107,>Raycast1.108,>Raycast1.109,>Raycast1.110,>Raycast1.111,>Raycast1.112,
.db >Raycast1.113,>Raycast1.114,>Raycast1.115,>Raycast1.116,>Raycast1.117,>Raycast1.118,>Raycast1.119,>Raycast1.120,
.db >Raycast1.121,>Raycast1.122,>Raycast1.123,>Raycast1.124,>Raycast1.125,>Raycast1.126,>Raycast1.127,>Raycast1.128,
.db >Raycast1.129,>Raycast1.130,>Raycast1.131,>Raycast1.132,>Raycast1.133,>Raycast1.134,>Raycast1.135,>Raycast1.136,
.db >Raycast1.137,>Raycast1.138,>Raycast1.139,>Raycast1.140,>Raycast1.141,>Raycast1.142,>Raycast1.143,>Raycast1.144,
.db >Raycast1.145,>Raycast1.146,>Raycast1.147,>Raycast1.148,>Raycast1.149,>Raycast1.150,>Raycast1.151,>Raycast1.152,
.db >Raycast1.153,>Raycast1.154,>Raycast1.155,>Raycast1.156,>Raycast1.157,>Raycast1.158,>Raycast1.159,>Raycast1.160,
.db >Raycast1.161,>Raycast1.162,>Raycast1.163,>Raycast1.164,>Raycast1.165,>Raycast1.166,>Raycast1.167,>Raycast1.168,
.db >Raycast1.169,>Raycast1.170,>Raycast1.171,>Raycast1.172,>Raycast1.173,>Raycast1.174,>Raycast1.175,>Raycast1.176,
.db >Raycast1.177,>Raycast1.178,>Raycast1.179,>Raycast1.180

.include "optimized_multiply.asm"