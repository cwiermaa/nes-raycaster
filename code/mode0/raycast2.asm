.MACRO Raycast2.StandardRay()
	lda #\1			;1/Cos L
	ldx #\2			;1/Cos H
	jsr Raycast2.MultiplyCosFromTop
	lda #\3			;1/Sin L
	ldx #\4			;1/Sin H
	jsr Raycast2.MultiplySinFromLeft

	lda #\9
	sta Raycast.SemiAngle
	lda #<(\1 * 16)			;DeltaYL
	sta Raycast.DeltaYL
	lda #>((\2 * 4096) + (\1 * 16))			;DeltaYH
	ldx #<(\3 * 16)			;DeltaXL
	ldy #>((\4 * 4096) + (\3 * 16))		;DeltaXH
	jsr Raycast2.DDA2
.ENDM


.MACRO Raycast2.StandardRay.Conditional()

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
	jsr Raycast2.MultiplyCosFromTop
++
	lda #\3			;1/Sin L
	ldx #\4			;1/Sin H
	jsr Raycast2.MultiplySinFromLeft
	lda #\9
	sta Raycast.SemiAngle
	lda #<(\1 * 16)			;DeltaYL
	sta Raycast.DeltaYL
	lda #>((\2 * 4096) + (\1 * 16))			;DeltaYH
	ldx #<(\3 * 16)			;DeltaXL
	ldy #>((\4 * 4096) + (\3 * 16))		;DeltaXH
	jsr Raycast2.DDA2
.ENDM

.MACRO Raycast2.StandardRay.Conditional2()
	lda #\1			;1/Cos L
	ldx #\2			;1/Cos H
	jsr Raycast2.MultiplyCosFromTop
	
	lda #\10
	cmp Raycast.FromLeft
	bcs +
	lda #$FF
	sta Raycast.SideXDistL
	sta Raycast.SideXDistH
	jmp ++
+
	lda #\3			;1/Sin L
	ldx #\4			;1/Sin H
	jsr Raycast2.MultiplySinFromLeft
++
	lda #\9
	sta Raycast.SemiAngle
	lda #<(\1 * 16)			;DeltaYL
	sta Raycast.DeltaYL
	lda #>((\2 * 4096) + (\1 * 16))			;DeltaYH
	ldx #<(\3 * 16)			;DeltaXL
	ldy #>((\4 * 4096) + (\3 * 16))		;DeltaXH
	jsr Raycast2.DDA2
.ENDM

.MACRO Raycast2.StandardRay2()
	lda #\1			;1/Cos L
	ldx #\2			;1/Cos H
	jsr Raycast2.MultiplyCosFromBottom
	lda #\3			;1/Sin L
	ldx #\4			;1/Sin H
	jsr Raycast2.MultiplySinFromLeft

	lda #\9
	sta Raycast.SemiAngle
	lda #<(\1 * 16)			;DeltaYL
	sta Raycast.DeltaYL
	lda #>((\2 * 4096) + (\1 * 16))			;DeltaYH
	ldx #<(\3 * 16)			;DeltaXL
	ldy #>((\4 * 4096) + (\3 * 16))		;DeltaXH
	jsr Raycast2.DDA
.ENDM


.MACRO Raycast2.StandardRay2.Conditional()

	lda #\1			;1/Cos L
	ldx #\2			;1/Cos H
	jsr Raycast2.MultiplyCosFromBottom
	
	
	lda #\10
	cmp Raycast.FromLeft
	bcs +
	lda #$FF
	sta Raycast.SideXDistL
	sta Raycast.SideXDistH
	jmp ++
+
	lda #\3			;1/Sin L
	ldx #\4			;1/Sin H
	jsr Raycast2.MultiplySinFromLeft
++
	lda #\9
	sta Raycast.SemiAngle
	lda #<(\1 * 16)			;DeltaYL
	sta Raycast.DeltaYL
	lda #>((\2 * 4096) + (\1 * 16))			;DeltaYH
	ldx #<(\3 * 16)			;DeltaXL
	ldy #>((\4 * 4096) + (\3 * 16))		;DeltaXH
	jsr Raycast2.DDA
.ENDM


.MACRO Raycast2.StandardRay2.Conditional2()

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
	jsr Raycast2.MultiplyCosFromBottom
++	
	lda #\3			;1/Sin L
	ldx #\4			;1/Sin H
	jsr Raycast2.MultiplySinFromLeft
	lda #\9
	sta Raycast.SemiAngle
	lda #<(\1 * 16)			;DeltaYL
	sta Raycast.DeltaYL
	lda #>((\2 * 4096) + (\1 * 16))			;DeltaYH
	ldx #<(\3 * 16)			;DeltaXL
	ldy #>((\4 * 4096) + (\3 * 16))		;DeltaXH
	jsr Raycast2.DDA
.ENDM


Raycast2.181:
	Raycast2.StandardRay2.Conditional() $00,$01,$4C,$39,2,2,2,2,0,3
Raycast2.182:
	Raycast2.StandardRay2.Conditional() $00,$01,$A7,$1C,2,2,2,2,1,7
Raycast2.183:
	Raycast2.StandardRay2.Conditional() $00,$01,$1B,$13,2,2,2,2,2,12
Raycast2.184:
	Raycast2.StandardRay2() $00,$01,$55,$0E,2,2,2,2,3
Raycast2.185:
	Raycast2.StandardRay2() $00,$01,$79,$0B,2,2,2,2,4
Raycast2.186:
	Raycast2.StandardRay2() $01,$01,$91,$09,2,2,2,2,5
Raycast2.187:
	Raycast2.StandardRay2() $01,$01,$34,$08,2,2,2,2,6
Raycast2.188:
	Raycast2.StandardRay2() $02,$01,$2F,$07,2,2,2,2,7
Raycast2.189:
	Raycast2.StandardRay2() $03,$01,$64,$06,2,2,2,2,8
Raycast2.190:
	Raycast2.StandardRay2() $03,$01,$C2,$05,2,2,2,2,9
Raycast2.191:
	Raycast2.StandardRay2() $04,$01,$3D,$05,2,2,2,2,10
Raycast2.192:
	Raycast2.StandardRay2() $05,$01,$CF,$04,2,2,2,2,11
Raycast2.193:
	Raycast2.StandardRay2() $06,$01,$72,$04,2,2,2,2,12
Raycast2.194:
	Raycast2.StandardRay2() $07,$01,$22,$04,2,2,2,2,13
Raycast2.195:
	Raycast2.StandardRay2() $09,$01,$DD,$03,2,2,2,2,14
Raycast2.196:
	Raycast2.StandardRay2() $0A,$01,$A0,$03,2,2,2,2,15
Raycast2.197:
	Raycast2.StandardRay2() $0B,$01,$6B,$03,2,2,2,2,16
Raycast2.198:
	Raycast2.StandardRay2() $0D,$01,$3C,$03,2,2,2,2,17
Raycast2.199:
	Raycast2.StandardRay2() $0E,$01,$12,$03,2,2,2,2,18
Raycast2.200:
	Raycast2.StandardRay2() $10,$01,$EC,$02,2,2,2,2,19
Raycast2.201:
	Raycast2.StandardRay2() $12,$01,$CA,$02,2,2,2,2,20
Raycast2.202:
	Raycast2.StandardRay2() $14,$01,$AB,$02,2,2,2,2,21
Raycast2.203:
	Raycast2.StandardRay2() $16,$01,$8F,$02,2,2,2,2,22
Raycast2.204:
	Raycast2.StandardRay2() $18,$01,$75,$02,2,2,2,2,23
Raycast2.205:
	Raycast2.StandardRay2() $1A,$01,$5D,$02,2,2,2,2,24
Raycast2.206:
	Raycast2.StandardRay2() $1C,$01,$47,$02,2,2,2,2,25
Raycast2.207:
	Raycast2.StandardRay2() $1F,$01,$33,$02,2,2,2,2,26
Raycast2.208:
	Raycast2.StandardRay2() $21,$01,$21,$02,2,2,2,2,27
Raycast2.209:
	Raycast2.StandardRay2() $24,$01,$10,$02,2,2,2,2,28
Raycast2.210:
	Raycast2.StandardRay2() $27,$01,$FF,$01,2,2,2,2,29
Raycast2.211:
	Raycast2.StandardRay2() $2A,$01,$F1,$01,2,2,2,2,30
Raycast2.212:
	Raycast2.StandardRay2() $2D,$01,$E3,$01,2,2,2,2,31
Raycast2.213:
	Raycast2.StandardRay2() $31,$01,$D6,$01,2,2,2,2,32
Raycast2.214:
	Raycast2.StandardRay2() $34,$01,$C9,$01,2,2,2,2,33
Raycast2.215:
	Raycast2.StandardRay2() $38,$01,$BE,$01,2,2,2,2,34
Raycast2.216:
	Raycast2.StandardRay2() $3C,$01,$B3,$01,2,2,2,2,35
Raycast2.217:
	Raycast2.StandardRay2() $40,$01,$A9,$01,2,2,2,2,36
Raycast2.218:
	Raycast2.StandardRay2() $44,$01,$9F,$01,2,2,2,2,37
Raycast2.219:
	Raycast2.StandardRay2() $49,$01,$96,$01,2,2,2,2,38
Raycast2.220:
	Raycast2.StandardRay2() $4E,$01,$8E,$01,2,2,2,2,39
Raycast2.221:
	Raycast2.StandardRay2() $53,$01,$86,$01,2,2,2,2,40
Raycast2.222:
	Raycast2.StandardRay2() $58,$01,$7E,$01,2,2,2,2,41
Raycast2.223:
	Raycast2.StandardRay2() $5E,$01,$77,$01,2,2,2,2,42
Raycast2.224:
	Raycast2.StandardRay2() $63,$01,$70,$01,2,2,2,2,43
Raycast2.225:
	Raycast2.StandardRay2() $6A,$01,$6A,$01,2,2,2,2,44
Raycast2.226:
	Raycast2.StandardRay2() $70,$01,$63,$01,2,2,2,2,45
Raycast2.227:
	Raycast2.StandardRay2() $77,$01,$5E,$01,2,2,2,2,46
Raycast2.228:
	Raycast2.StandardRay2() $7E,$01,$58,$01,2,2,2,2,47
Raycast2.229:
	Raycast2.StandardRay2() $86,$01,$53,$01,2,2,2,2,48
Raycast2.230:
	Raycast2.StandardRay2() $8E,$01,$4E,$01,2,2,2,2,49
Raycast2.231:
	Raycast2.StandardRay2() $96,$01,$49,$01,2,2,2,2,50
Raycast2.232:
	Raycast2.StandardRay2() $9F,$01,$44,$01,2,2,2,2,51
Raycast2.233:
	Raycast2.StandardRay2() $A9,$01,$40,$01,2,2,2,2,52
Raycast2.234:
	Raycast2.StandardRay2() $B3,$01,$3C,$01,2,2,2,2,53
Raycast2.235:
	Raycast2.StandardRay2() $BE,$01,$38,$01,2,2,2,2,54
Raycast2.236:
	Raycast2.StandardRay2() $C9,$01,$34,$01,2,2,2,2,55
Raycast2.237:
	Raycast2.StandardRay2() $D6,$01,$31,$01,2,2,2,2,56
Raycast2.238:
	Raycast2.StandardRay2() $E3,$01,$2D,$01,2,2,2,2,57
Raycast2.239:
	Raycast2.StandardRay2() $F1,$01,$2A,$01,2,2,2,2,58
Raycast2.240:
	Raycast2.StandardRay2() $00,$02,$27,$01,2,2,2,2,59
Raycast2.241:
	Raycast2.StandardRay2() $10,$02,$24,$01,2,2,2,2,60
Raycast2.242:
	Raycast2.StandardRay2() $21,$02,$21,$01,2,2,2,2,61
Raycast2.243:
	Raycast2.StandardRay2() $33,$02,$1F,$01,2,2,2,2,62
Raycast2.244:
	Raycast2.StandardRay2() $47,$02,$1C,$01,2,2,2,2,63
Raycast2.245:
	Raycast2.StandardRay2() $5D,$02,$1A,$01,2,2,2,2,64
Raycast2.246:
	Raycast2.StandardRay2() $75,$02,$18,$01,2,2,2,2,65
Raycast2.247:
	Raycast2.StandardRay2() $8F,$02,$16,$01,2,2,2,2,66
Raycast2.248:
	Raycast2.StandardRay2() $AB,$02,$14,$01,2,2,2,2,67
Raycast2.249:
	Raycast2.StandardRay2() $CA,$02,$12,$01,2,2,2,2,68
Raycast2.250:
	Raycast2.StandardRay2() $EC,$02,$10,$01,2,2,2,2,69
Raycast2.251:
	Raycast2.StandardRay2() $12,$03,$0E,$01,2,2,2,2,70
Raycast2.252:
	Raycast2.StandardRay2() $3C,$03,$0D,$01,2,2,2,2,71
Raycast2.253:
	Raycast2.StandardRay2() $6B,$03,$0B,$01,2,2,2,2,72
Raycast2.254:
	Raycast2.StandardRay2() $A0,$03,$0A,$01,2,2,2,2,73
Raycast2.255:
	Raycast2.StandardRay2() $DD,$03,$09,$01,2,2,2,2,74
Raycast2.256:
	Raycast2.StandardRay2() $22,$04,$07,$01,2,2,2,2,75
Raycast2.257:
	Raycast2.StandardRay2() $72,$04,$06,$01,2,2,2,2,76
Raycast2.258:
	Raycast2.StandardRay2() $CF,$04,$05,$01,2,2,2,2,77
Raycast2.259:
	Raycast2.StandardRay2() $3D,$05,$04,$01,2,2,2,2,78
Raycast2.260:
	Raycast2.StandardRay2() $C2,$05,$03,$01,2,2,2,2,79
Raycast2.261:
	Raycast2.StandardRay2() $64,$06,$03,$01,2,2,2,2,80
Raycast2.262:
	Raycast2.StandardRay2() $2F,$07,$02,$01,2,2,2,2,81
Raycast2.263:
	Raycast2.StandardRay2() $34,$08,$01,$01,2,2,2,2,82
Raycast2.264:
	Raycast2.StandardRay2() $91,$09,$01,$01,2,2,2,2,83
Raycast2.265:
	Raycast2.StandardRay2() $79,$0B,$00,$01,2,2,2,2,84
Raycast2.266:
	Raycast2.StandardRay2() $55,$0E,$00,$01,2,2,2,2,85
Raycast2.267:
	Raycast2.StandardRay2.Conditional2() $1B,$13,$00,$01,2,2,2,2,86,12
Raycast2.268:
	Raycast2.StandardRay2.Conditional2() $A7,$1C,$00,$01,2,2,2,2,87,7
Raycast2.269:
	Raycast2.StandardRay2.Conditional2() $4C,$39,$00,$01,2,2,2,2,88,3
Raycast2.270:
	Raycast2.StandardRay.Conditional() $4C,$39,$00,$01,2,2,2,2,89,3
Raycast2.271:
	Raycast2.StandardRay.Conditional() $4C,$39,$00,$01,2,2,2,2,90,3
Raycast2.272:
	Raycast2.StandardRay.Conditional() $A7,$1C,$00,$01,2,2,2,2,91,7
Raycast2.273:
	Raycast2.StandardRay.Conditional() $1B,$13,$00,$01,2,2,2,2,92,12
Raycast2.274:
	Raycast2.StandardRay() $55,$0E,$00,$01,2,2,2,2,93
Raycast2.275:
	Raycast2.StandardRay() $79,$0B,$00,$01,2,2,2,2,94
Raycast2.276:
	Raycast2.StandardRay() $91,$09,$01,$01,2,2,2,2,95
Raycast2.277:
	Raycast2.StandardRay() $34,$08,$01,$01,2,2,2,2,96
Raycast2.278:
	Raycast2.StandardRay() $2F,$07,$02,$01,2,2,2,2,97
Raycast2.279:
	Raycast2.StandardRay() $64,$06,$03,$01,2,2,2,2,98
Raycast2.280:
	Raycast2.StandardRay() $C2,$05,$03,$01,2,2,2,2,99
Raycast2.281:
	Raycast2.StandardRay() $3D,$05,$04,$01,2,2,2,2,100
Raycast2.282:
	Raycast2.StandardRay() $CF,$04,$05,$01,2,2,2,2,101
Raycast2.283:
	Raycast2.StandardRay() $72,$04,$06,$01,2,2,2,2,102
Raycast2.284:
	Raycast2.StandardRay() $22,$04,$07,$01,2,2,2,2,103
Raycast2.285:
	Raycast2.StandardRay() $DD,$03,$09,$01,2,2,2,2,104
Raycast2.286:
	Raycast2.StandardRay() $A0,$03,$0A,$01,2,2,2,2,105
Raycast2.287:
	Raycast2.StandardRay() $6B,$03,$0B,$01,2,2,2,2,106
Raycast2.288:
	Raycast2.StandardRay() $3C,$03,$0D,$01,2,2,2,2,107
Raycast2.289:
	Raycast2.StandardRay() $12,$03,$0E,$01,2,2,2,2,108
Raycast2.290:
	Raycast2.StandardRay() $EC,$02,$10,$01,2,2,2,2,109
Raycast2.291:
	Raycast2.StandardRay() $CA,$02,$12,$01,2,2,2,2,110
Raycast2.292:
	Raycast2.StandardRay() $AB,$02,$14,$01,2,2,2,2,111
Raycast2.293:
	Raycast2.StandardRay() $8F,$02,$16,$01,2,2,2,2,112
Raycast2.294:
	Raycast2.StandardRay() $75,$02,$18,$01,2,2,2,2,113
Raycast2.295:
	Raycast2.StandardRay() $5D,$02,$1A,$01,2,2,2,2,114
Raycast2.296:
	Raycast2.StandardRay() $47,$02,$1C,$01,2,2,2,2,115
Raycast2.297:
	Raycast2.StandardRay() $33,$02,$1F,$01,2,2,2,2,116
Raycast2.298:
	Raycast2.StandardRay() $21,$02,$21,$01,2,2,2,2,117
Raycast2.299:
	Raycast2.StandardRay() $10,$02,$24,$01,2,2,2,2,118
Raycast2.300:
	Raycast2.StandardRay() $00,$02,$27,$01,2,2,2,2,119
Raycast2.301:
	Raycast2.StandardRay() $F1,$01,$2A,$01,2,2,2,2,120
Raycast2.302:
	Raycast2.StandardRay() $E3,$01,$2D,$01,2,2,2,2,121
Raycast2.303:
	Raycast2.StandardRay() $D6,$01,$31,$01,2,2,2,2,122
Raycast2.304:
	Raycast2.StandardRay() $C9,$01,$34,$01,2,2,2,2,123
Raycast2.305:
	Raycast2.StandardRay() $BE,$01,$38,$01,2,2,2,2,124
Raycast2.306:
	Raycast2.StandardRay() $B3,$01,$3C,$01,2,2,2,2,125
Raycast2.307:
	Raycast2.StandardRay() $A9,$01,$40,$01,2,2,2,2,126
Raycast2.308:
	Raycast2.StandardRay() $9F,$01,$44,$01,2,2,2,2,127
Raycast2.309:
	Raycast2.StandardRay() $96,$01,$49,$01,2,2,2,2,128
Raycast2.310:
	Raycast2.StandardRay() $8E,$01,$4E,$01,2,2,2,2,129
Raycast2.311:
	Raycast2.StandardRay() $86,$01,$53,$01,2,2,2,2,130
Raycast2.312:
	Raycast2.StandardRay() $7E,$01,$58,$01,2,2,2,2,131
Raycast2.313:
	Raycast2.StandardRay() $77,$01,$5E,$01,2,2,2,2,132
Raycast2.314:
	Raycast2.StandardRay() $70,$01,$63,$01,2,2,2,2,133
Raycast2.315:
	Raycast2.StandardRay() $6A,$01,$6A,$01,2,2,2,2,134
Raycast2.316:
	Raycast2.StandardRay() $63,$01,$70,$01,2,2,2,2,135
Raycast2.317:
	Raycast2.StandardRay() $5E,$01,$77,$01,2,2,2,2,136
Raycast2.318:
	Raycast2.StandardRay() $58,$01,$7E,$01,2,2,2,2,137
Raycast2.319:
	Raycast2.StandardRay() $53,$01,$86,$01,2,2,2,2,138
Raycast2.320:
	Raycast2.StandardRay() $4E,$01,$8E,$01,2,2,2,2,139
Raycast2.321:
	Raycast2.StandardRay() $49,$01,$96,$01,2,2,2,2,140
Raycast2.322:
	Raycast2.StandardRay() $44,$01,$9F,$01,2,2,2,2,141
Raycast2.323:
	Raycast2.StandardRay() $40,$01,$A9,$01,2,2,2,2,142
Raycast2.324:
	Raycast2.StandardRay() $3C,$01,$B3,$01,2,2,2,2,143
Raycast2.325:
	Raycast2.StandardRay() $38,$01,$BE,$01,2,2,2,2,144
Raycast2.326:
	Raycast2.StandardRay() $34,$01,$C9,$01,2,2,2,2,145
Raycast2.327:
	Raycast2.StandardRay() $31,$01,$D6,$01,2,2,2,2,146
Raycast2.328:
	Raycast2.StandardRay() $2D,$01,$E3,$01,2,2,2,2,147
Raycast2.329:
	Raycast2.StandardRay() $2A,$01,$F1,$01,2,2,2,2,148
Raycast2.330:
	Raycast2.StandardRay() $27,$01,$FF,$01,2,2,2,2,149
Raycast2.331:
	Raycast2.StandardRay() $24,$01,$10,$02,2,2,2,2,150
Raycast2.332:
	Raycast2.StandardRay() $21,$01,$21,$02,2,2,2,2,151
Raycast2.333:
	Raycast2.StandardRay() $1F,$01,$33,$02,2,2,2,2,152
Raycast2.334:
	Raycast2.StandardRay() $1C,$01,$47,$02,2,2,2,2,153
Raycast2.335:
	Raycast2.StandardRay() $1A,$01,$5D,$02,2,2,2,2,154
Raycast2.336:
	Raycast2.StandardRay() $18,$01,$75,$02,2,2,2,2,155
Raycast2.337:
	Raycast2.StandardRay() $16,$01,$8F,$02,2,2,2,2,156
Raycast2.338:
	Raycast2.StandardRay() $14,$01,$AB,$02,2,2,2,2,157
Raycast2.339:
	Raycast2.StandardRay() $12,$01,$CA,$02,2,2,2,2,158
Raycast2.340:
	Raycast2.StandardRay() $10,$01,$EC,$02,2,2,2,2,159
Raycast2.341:
	Raycast2.StandardRay() $0E,$01,$12,$03,2,2,2,2,160
Raycast2.342:
	Raycast2.StandardRay() $0D,$01,$3C,$03,2,2,2,2,161
Raycast2.343:
	Raycast2.StandardRay() $0B,$01,$6B,$03,2,2,2,2,162
Raycast2.344:
	Raycast2.StandardRay() $0A,$01,$A0,$03,2,2,2,2,163
Raycast2.345:
	Raycast2.StandardRay() $09,$01,$DD,$03,2,2,2,2,164
Raycast2.346:
	Raycast2.StandardRay() $07,$01,$22,$04,2,2,2,2,165
Raycast2.347:
	Raycast2.StandardRay() $06,$01,$72,$04,2,2,2,2,166
Raycast2.348:
	Raycast2.StandardRay() $05,$01,$CF,$04,2,2,2,2,167
Raycast2.349:
	Raycast2.StandardRay() $04,$01,$3D,$05,2,2,2,2,168
Raycast2.350:
	Raycast2.StandardRay() $03,$01,$C2,$05,2,2,2,2,169
Raycast2.351:
	Raycast2.StandardRay() $03,$01,$64,$06,2,2,2,2,170
Raycast2.352:
	Raycast2.StandardRay() $02,$01,$2F,$07,2,2,2,2,171
Raycast2.353:
	Raycast2.StandardRay() $01,$01,$34,$08,2,2,2,2,172
Raycast2.354:
	Raycast2.StandardRay() $01,$01,$91,$09,2,2,2,2,173
Raycast2.355:
	Raycast2.StandardRay() $00,$01,$79,$0B,2,2,2,2,174
Raycast2.356:
	Raycast2.StandardRay() $00,$01,$55,$0E,2,2,2,2,175
Raycast2.357:
	Raycast2.StandardRay.Conditional2() $00,$01,$1B,$13,2,2,2,2,176,12
Raycast2.358:
	Raycast2.StandardRay.Conditional2() $00,$01,$A7,$1C,2,2,2,2,177,7
Raycast2.359:
	Raycast2.StandardRay.Conditional2() $00,$01,$4C,$39,2,2,2,2,178,3
	jmp Raycast.SwitchTo1
	
Raycast2.MultiplyCosFromBottom:
	pha
	ldy Raycast.FromBottom
	lda Raycast2.MultiplyL.w,y
	sta Standard.ZTempWord.0
	lda Raycast2.MultiplyH.w,y
	sta Standard.ZTempWord.0+1
	pla
	jsr Raycast2.Multiply
	sta Raycast.SideYDistL
	stx Raycast.SideYDistH
	rts
	
	
Raycast2.MultiplyCosFromTop:
	pha
	ldy Raycast.FromTop
	lda Raycast2.MultiplyL.w,y
	sta Standard.ZTempWord.0
	lda Raycast2.MultiplyH.w,y
	sta Standard.ZTempWord.0+1
	pla
	jsr Raycast2.Multiply
	sta Raycast.SideYDistL
	stx Raycast.SideYDistH
	rts
	
Raycast2.MultiplySinFromLeft:
	pha
	ldy Raycast.FromLeft
	lda Raycast2.MultiplyL.w,y
	sta Standard.ZTempWord.0
	lda Raycast2.MultiplyH.w,y
	sta Standard.ZTempWord.0+1
	pla
	jsr Raycast2.Multiply
	sta $5554
	sta Raycast.SideXDistL
	stx Raycast.SideXDistH
	rts
	
Raycast2.DDA2:

	sta Raycast.DeltaYH
	stx Raycast.DeltaXL
	sty Raycast.DeltaXH
	lda Raycast.PlayerLocation
	sta Raycast.RayIndex
	
	ldy #$00
	sty Raycast.SliceID
	
	ldx #$FF
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
	ldy #$0F
	sty Raycast.SliceID
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
	jsr Raycast2.DrawingWall
	lda Game.CurrentColumn
	cmp #84
	bne +
	pla
	pla
	rts
+
	rts
	
Raycast2.DDA:

	sta Raycast.DeltaYH
	stx Raycast.DeltaXL
	sty Raycast.DeltaXH
	lda Raycast.PlayerLocation
	sta Raycast.RayIndex
	
	ldy #$0F
	sty Raycast.SliceID
	
	ldx #$FF
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
	jsr Raycast2.DrawingWall
	lda Game.CurrentColumn
	cmp #84
	bne +
	pla
	pla
	rts
+
	rts
	
Raycast2.CorrectWall:
	sta System.Main.Math.A0
	lda #$00				;2
	sta System.Main.Math.Answer0		;5
	sta System.Main.Math.Answer1		;8
	sta System.Main.Math.Answer2		;11
	sta System.Main.Math.B2
	
	ldy Raycast.CurrentAngleFromFacing
	
	lda Raycast2.CorrectL.w,y
	sta System.Main.Math.B0
	lda Raycast2.CorrectH.w,y
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
	
Raycast2.StartAtAngle:
	sec
	lda Raycast.CurrentAngleL
	sbc #180
	tax
	lda Raycast2.Lows.w,x
	sta Standard.ZTempWord.0
	lda Raycast2.Highs.w,x
	sta Standard.ZTempWord.0+1
	jmp (Standard.ZTempWord.0)
	
Raycast2.CorrectL:
.db $C1,$C4,
.db $C7,$CA,$CC,$CF,$D2,$D4,$D7,$D9,$DB,$DE,$E0,$E2,$E4,$E6,$E8,$EA,
.db $EC,$ED,$EF,$F1,$F2,$F3,$F5,$F6,$F7,$F8,$F9,$FA,$FB,$FC,$FD,$FE,
.db $FE,$FF,$FF,$FF,$FF,$FF,$FF,$FF

.db $FF
.db $FF,$FF,$FF,$FF,$FF,$FF,$FE,$FE,$FD,$FC,$FB,$FA,$F9,$F8,$F7,$F6,
.db $F5,$F3,$F2,$F1,$EF,$ED,$EC,$EA,$E8,$E6,$E4,$E2,$E0,$DE,$DB,$D9,
.db $D7,$D4,$D2,$CF,$CC,$CA,$C7,$C4,$C1


Raycast2.CorrectH:

.db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00

.db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00

Raycast2.Lows:
.db <Raycast2.181,<Raycast2.182,<Raycast2.183,<Raycast2.184,
.db <Raycast2.185,<Raycast2.186,<Raycast2.187,<Raycast2.188,<Raycast2.189,<Raycast2.190,<Raycast2.191,<Raycast2.192,
.db <Raycast2.193,<Raycast2.194,<Raycast2.195,<Raycast2.196,<Raycast2.197,<Raycast2.198,<Raycast2.199,<Raycast2.200,
.db <Raycast2.201,<Raycast2.202,<Raycast2.203,<Raycast2.204,<Raycast2.205,<Raycast2.206,<Raycast2.207,<Raycast2.208,
.db <Raycast2.209,<Raycast2.210,<Raycast2.211,<Raycast2.212,<Raycast2.213,<Raycast2.214,<Raycast2.215,<Raycast2.216,
.db <Raycast2.217,<Raycast2.218,<Raycast2.219,<Raycast2.220,<Raycast2.221,<Raycast2.222,<Raycast2.223,<Raycast2.224,
.db <Raycast2.225,<Raycast2.226,<Raycast2.227,<Raycast2.228,<Raycast2.229,<Raycast2.230,<Raycast2.231,<Raycast2.232,
.db <Raycast2.233,<Raycast2.234,<Raycast2.235,<Raycast2.236,<Raycast2.237,<Raycast2.238,<Raycast2.239,<Raycast2.240,
.db <Raycast2.241,<Raycast2.242,<Raycast2.243,<Raycast2.244,<Raycast2.245,<Raycast2.246,<Raycast2.247,<Raycast2.248,
.db <Raycast2.249,<Raycast2.250,<Raycast2.251,<Raycast2.252,<Raycast2.253,<Raycast2.254,<Raycast2.255,<Raycast2.256,
.db <Raycast2.257,<Raycast2.258,<Raycast2.259,<Raycast2.260,<Raycast2.261,<Raycast2.262,<Raycast2.263,<Raycast2.264,
.db <Raycast2.265,<Raycast2.266,<Raycast2.267,<Raycast2.268,<Raycast2.269,<Raycast2.270,<Raycast2.271,<Raycast2.272,
.db <Raycast2.273,<Raycast2.274,<Raycast2.275,<Raycast2.276,<Raycast2.277,<Raycast2.278,<Raycast2.279,<Raycast2.280,
.db <Raycast2.281,<Raycast2.282,<Raycast2.283,<Raycast2.284,<Raycast2.285,<Raycast2.286,<Raycast2.287,<Raycast2.288,
.db <Raycast2.289,<Raycast2.290,<Raycast2.291,<Raycast2.292,<Raycast2.293,<Raycast2.294,<Raycast2.295,<Raycast2.296,
.db <Raycast2.297,<Raycast2.298,<Raycast2.299,<Raycast2.300,<Raycast2.301,<Raycast2.302,<Raycast2.303,<Raycast2.304,
.db <Raycast2.305,<Raycast2.306,<Raycast2.307,<Raycast2.308,<Raycast2.309,<Raycast2.310,<Raycast2.311,<Raycast2.312,
.db <Raycast2.313,<Raycast2.314,<Raycast2.315,<Raycast2.316,<Raycast2.317,<Raycast2.318,<Raycast2.319,<Raycast2.320,
.db <Raycast2.321,<Raycast2.322,<Raycast2.323,<Raycast2.324,<Raycast2.325,<Raycast2.326,<Raycast2.327,<Raycast2.328,
.db <Raycast2.329,<Raycast2.330,<Raycast2.331,<Raycast2.332,<Raycast2.333,<Raycast2.334,<Raycast2.335,<Raycast2.336,
.db <Raycast2.337,<Raycast2.338,<Raycast2.339,<Raycast2.340,<Raycast2.341,<Raycast2.342,<Raycast2.343,<Raycast2.344,
.db <Raycast2.345,<Raycast2.346,<Raycast2.347,<Raycast2.348,<Raycast2.349,<Raycast2.350,<Raycast2.351,<Raycast2.352,
.db <Raycast2.353,<Raycast2.354,<Raycast2.355,<Raycast2.356,<Raycast2.357,<Raycast2.358,<Raycast2.359

Raycast2.Highs:
.db >Raycast2.181,>Raycast2.182,>Raycast2.183,>Raycast2.184,
.db >Raycast2.185,>Raycast2.186,>Raycast2.187,>Raycast2.188,>Raycast2.189,>Raycast2.190,>Raycast2.191,>Raycast2.192,
.db >Raycast2.193,>Raycast2.194,>Raycast2.195,>Raycast2.196,>Raycast2.197,>Raycast2.198,>Raycast2.199,>Raycast2.200,
.db >Raycast2.201,>Raycast2.202,>Raycast2.203,>Raycast2.204,>Raycast2.205,>Raycast2.206,>Raycast2.207,>Raycast2.208,
.db >Raycast2.209,>Raycast2.210,>Raycast2.211,>Raycast2.212,>Raycast2.213,>Raycast2.214,>Raycast2.215,>Raycast2.216,
.db >Raycast2.217,>Raycast2.218,>Raycast2.219,>Raycast2.220,>Raycast2.221,>Raycast2.222,>Raycast2.223,>Raycast2.224,
.db >Raycast2.225,>Raycast2.226,>Raycast2.227,>Raycast2.228,>Raycast2.229,>Raycast2.230,>Raycast2.231,>Raycast2.232,
.db >Raycast2.233,>Raycast2.234,>Raycast2.235,>Raycast2.236,>Raycast2.237,>Raycast2.238,>Raycast2.239,>Raycast2.240,
.db >Raycast2.241,>Raycast2.242,>Raycast2.243,>Raycast2.244,>Raycast2.245,>Raycast2.246,>Raycast2.247,>Raycast2.248,
.db >Raycast2.249,>Raycast2.250,>Raycast2.251,>Raycast2.252,>Raycast2.253,>Raycast2.254,>Raycast2.255,>Raycast2.256,
.db >Raycast2.257,>Raycast2.258,>Raycast2.259,>Raycast2.260,>Raycast2.261,>Raycast2.262,>Raycast2.263,>Raycast2.264,
.db >Raycast2.265,>Raycast2.266,>Raycast2.267,>Raycast2.268,>Raycast2.269,>Raycast2.270,>Raycast2.271,>Raycast2.272,
.db >Raycast2.273,>Raycast2.274,>Raycast2.275,>Raycast2.276,>Raycast2.277,>Raycast2.278,>Raycast2.279,>Raycast2.280,
.db >Raycast2.281,>Raycast2.282,>Raycast2.283,>Raycast2.284,>Raycast2.285,>Raycast2.286,>Raycast2.287,>Raycast2.288,
.db >Raycast2.289,>Raycast2.290,>Raycast2.291,>Raycast2.292,>Raycast2.293,>Raycast2.294,>Raycast2.295,>Raycast2.296,
.db >Raycast2.297,>Raycast2.298,>Raycast2.299,>Raycast2.300,>Raycast2.301,>Raycast2.302,>Raycast2.303,>Raycast2.304,
.db >Raycast2.305,>Raycast2.306,>Raycast2.307,>Raycast2.308,>Raycast2.309,>Raycast2.310,>Raycast2.311,>Raycast2.312,
.db >Raycast2.313,>Raycast2.314,>Raycast2.315,>Raycast2.316,>Raycast2.317,>Raycast2.318,>Raycast2.319,>Raycast2.320,
.db >Raycast2.321,>Raycast2.322,>Raycast2.323,>Raycast2.324,>Raycast2.325,>Raycast2.326,>Raycast2.327,>Raycast2.328,
.db >Raycast2.329,>Raycast2.330,>Raycast2.331,>Raycast2.332,>Raycast2.333,>Raycast2.334,>Raycast2.335,>Raycast2.336,
.db >Raycast2.337,>Raycast2.338,>Raycast2.339,>Raycast2.340,>Raycast2.341,>Raycast2.342,>Raycast2.343,>Raycast2.344,
.db >Raycast2.345,>Raycast2.346,>Raycast2.347,>Raycast2.348,>Raycast2.349,>Raycast2.350,>Raycast2.351,>Raycast2.352,
.db >Raycast2.353,>Raycast2.354,>Raycast2.355,>Raycast2.356,>Raycast2.357,>Raycast2.358,>Raycast2.359


Raycast2.Multiply1:
	jmp Raycast2.Multiply.Return
	
Raycast2.Multiply2:
	stx Standard.ZTempByte.0
	asl a
	rol Standard.ZTempByte.0
	ldx Standard.ZTempByte.0
	jmp Raycast2.Multiply.Return
	
Raycast2.Multiply3:
	stx Standard.ZTempByte.1
	stx Standard.ZTempByte.3
	sta Standard.ZTempByte.0
	asl a
	rol Standard.ZTempByte.3
	clc
	adc Standard.ZTempByte.0
	sta Standard.ZTempByte.2
	lda Standard.ZTempByte.3
	adc Standard.ZTempByte.1
	tax
	lda Standard.ZTempByte.2
	jmp Raycast2.Multiply.Return
	
Raycast2.Multiply4:
	stx Standard.ZTempByte.0
	asl a
	rol Standard.ZTempByte.0
	asl a
	rol Standard.ZTempByte.0
	ldx Standard.ZTempByte.0
	jmp Raycast2.Multiply.Return
	
Raycast2.Multiply5:
	stx Standard.ZTempByte.1
	stx Standard.ZTempByte.3
	sta Standard.ZTempByte.0
	asl a
	rol Standard.ZTempByte.3
	asl a
	rol Standard.ZTempByte.3
	clc
	adc Standard.ZTempByte.0
	sta Standard.ZTempByte.2
	lda Standard.ZTempByte.3
	adc Standard.ZTempByte.1
	tax
	lda Standard.ZTempByte.2
	jmp Raycast2.Multiply.Return
	
Raycast2.Multiply6:

	stx Standard.ZTempByte.1
	stx Standard.ZTempByte.3
	asl a
	sta Standard.ZTempByte.0
	rol Standard.ZTempByte.3
	ldx Standard.ZTempByte.3
	stx Standard.ZTempByte.1
	asl a
	rol Standard.ZTempByte.3
	clc
	adc Standard.ZTempByte.0
	sta Standard.ZTempByte.2
	lda Standard.ZTempByte.3
	adc Standard.ZTempByte.1
	tax
	lda Standard.ZTempByte.2
	jmp Raycast2.Multiply.Return
	
Raycast2.Multiply7:

	stx Standard.ZTempByte.1
	stx Standard.ZTempByte.3
	sta Standard.ZTempByte.0
	asl a
	rol Standard.ZTempByte.3
	asl a
	rol Standard.ZTempByte.3
	asl a
	rol Standard.ZTempByte.3
	sec
	sbc Standard.ZTempByte.0
	sta Standard.ZTempByte.2
	lda Standard.ZTempByte.3
	sbc Standard.ZTempByte.1
	tax
	lda Standard.ZTempByte.2
	jmp Raycast2.Multiply.Return
	
Raycast2.Multiply8:

	stx Standard.ZTempByte.0
	asl a
	rol Standard.ZTempByte.0
	asl a
	rol Standard.ZTempByte.0
	asl a
	rol Standard.ZTempByte.0
	ldx Standard.ZTempByte.0
	jmp Raycast2.Multiply.Return
Raycast2.Multiply9:
	stx Standard.ZTempByte.1	;$FF
	stx Standard.ZTempByte.3	;$FF
	sta Standard.ZTempByte.0	;$FF
	asl a						;$FE
	rol Standard.ZTempByte.1	;$FF
	asl a						;$FC
	rol Standard.ZTempByte.1	;$FF
	asl a						;$F8
	rol Standard.ZTempByte.1	;$FF
	clc
	adc Standard.ZTempByte.0
	sta Standard.ZTempByte.2
	lda Standard.ZTempByte.1
	adc Standard.ZTempByte.3
	tax
	lda Standard.ZTempByte.2
	jmp Raycast2.Multiply.Return
	
Raycast2.Multiply10:

	stx Standard.ZTempByte.3
	asl a
	sta Standard.ZTempByte.0
	rol Standard.ZTempByte.3
	ldx Standard.ZTempByte.3
	stx Standard.ZTempByte.1
	asl a
	rol Standard.ZTempByte.3
	asl a
	rol Standard.ZTempByte.3
	clc
	adc Standard.ZTempByte.0
	sta Standard.ZTempByte.2
	lda Standard.ZTempByte.3
	adc Standard.ZTempByte.1
	tax
	lda Standard.ZTempByte.2
	jmp Raycast2.Multiply.Return
	
Raycast2.Multiply11:

	stx Standard.ZTempByte.3
	stx Standard.ZTempByte.5
	sta Standard.ZTempByte.4
	asl a
	rol Standard.ZTempByte.3
	asl a
	sta Standard.ZTempByte.0
	rol Standard.ZTempByte.3
	ldx Standard.ZTempByte.3
	stx Standard.ZTempByte.1
	asl a
	rol Standard.ZTempByte.3
	clc
	adc Standard.ZTempByte.0
	sta Standard.ZTempByte.2
	lda Standard.ZTempByte.3
	adc Standard.ZTempByte.1
	sta Standard.ZTempByte.3
	sec
	lda Standard.ZTempByte.2
	sbc Standard.ZTempByte.4
	sta Standard.ZTempByte.2
	lda Standard.ZTempByte.3
	sbc Standard.ZTempByte.5
	tax
	lda Standard.ZTempByte.2
	jmp Raycast2.Multiply.Return
	
Raycast2.Multiply12:

	stx Standard.ZTempByte.3
	asl a
	rol Standard.ZTempByte.3
	asl a
	sta Standard.ZTempByte.0
	rol Standard.ZTempByte.3
	ldx Standard.ZTempByte.3
	stx Standard.ZTempByte.1
	asl a
	rol Standard.ZTempByte.3
	clc
	adc Standard.ZTempByte.0
	sta Standard.ZTempByte.2
	lda Standard.ZTempByte.3
	adc Standard.ZTempByte.1
	tax
	lda Standard.ZTempByte.2
	jmp Raycast2.Multiply.Return
	
Raycast2.Multiply13:

	stx Standard.ZTempByte.3			;6
	stx Standard.ZTempByte.5			;9
	sta Standard.ZTempByte.4			;12
	asl a								;14
	rol Standard.ZTempByte.3			;19
	asl a								;26
	sta Standard.ZTempByte.0			;29
	rol Standard.ZTempByte.3			;34
	ldx Standard.ZTempByte.3
	stx Standard.ZTempByte.1
	asl a								;41
	rol Standard.ZTempByte.3			;46
	clc									;48
	adc Standard.ZTempByte.0			;51
	sta Standard.ZTempByte.2			;54
	lda Standard.ZTempByte.3			;57
	adc Standard.ZTempByte.1			;60
	sta Standard.ZTempByte.3			;63
	clc									;65
	lda Standard.ZTempByte.2			;68
	adc Standard.ZTempByte.4			;71
	sta Standard.ZTempByte.2			;74
	lda Standard.ZTempByte.3			;77
	adc Standard.ZTempByte.5			;80
	tax									;82
	lda Standard.ZTempByte.2			;85
	jmp Raycast2.Multiply.Return
	
Raycast2.Multiply14:
;X = $01, A = $F1
	stx Standard.ZTempByte.3	;$01
	asl a						;$E2
	sta Standard.ZTempByte.0	;$E2
	rol Standard.ZTempByte.3	;$03
	ldx Standard.ZTempByte.3
	stx Standard.ZTempByte.1
	asl a						;$C4
	rol Standard.ZTempByte.3	;$07
	asl a						;$88
	rol Standard.ZTempByte.3	;$0F
	asl a						;$10
	rol Standard.ZTempByte.3	;$1F
	sec
	sbc Standard.ZTempByte.0	;$2E
	sta Standard.ZTempByte.2	;$2E
	lda Standard.ZTempByte.3	;$1F
	sbc Standard.ZTempByte.1	;$1C
	tax
	lda Standard.ZTempByte.2
	jmp Raycast2.Multiply.Return
	
Raycast2.Multiply15:

	stx Standard.ZTempByte.1
	stx Standard.ZTempByte.3
	sta Standard.ZTempByte.0
	asl a
	rol Standard.ZTempByte.3
	asl a
	rol Standard.ZTempByte.3
	asl a
	rol Standard.ZTempByte.3
	asl a
	rol Standard.ZTempByte.3
	sec
	sbc Standard.ZTempByte.0
	sta Standard.ZTempByte.2
	lda Standard.ZTempByte.3
	sbc Standard.ZTempByte.1
	tax
	lda Standard.ZTempByte.2
	jmp Raycast2.Multiply.Return
	
Raycast2.Multiply16:

	stx Standard.ZTempByte.0
	asl a
	rol Standard.ZTempByte.0
	asl a
	rol Standard.ZTempByte.0
	asl a
	rol Standard.ZTempByte.0
	asl a
	rol Standard.ZTempByte.0
	ldx Standard.ZTempByte.0
	jmp Raycast2.Multiply.Return
	
Raycast2.Multiply:
	jmp (Standard.ZTempWord.0)
Raycast2.Multiply.Return:
	rts
	
Raycast2.MultiplyL:
	.db <Raycast2.Multiply1,<Raycast2.Multiply2,<Raycast2.Multiply3,<Raycast2.Multiply4,
	.db <Raycast2.Multiply5,<Raycast2.Multiply6,<Raycast2.Multiply7,<Raycast2.Multiply8,
	.db <Raycast2.Multiply9,<Raycast2.Multiply10,<Raycast2.Multiply11,<Raycast2.Multiply12,
	.db <Raycast2.Multiply13,<Raycast2.Multiply14,<Raycast2.Multiply15,<Raycast2.Multiply16
	
Raycast2.MultiplyH:
	.db >Raycast2.Multiply1,>Raycast2.Multiply2,>Raycast2.Multiply3,>Raycast2.Multiply4,
	.db >Raycast2.Multiply5,>Raycast2.Multiply6,>Raycast2.Multiply7,>Raycast2.Multiply8,
	.db >Raycast2.Multiply9,>Raycast2.Multiply10,>Raycast2.Multiply11,>Raycast2.Multiply12,
	.db >Raycast2.Multiply13,>Raycast2.Multiply14,>Raycast2.Multiply15,>Raycast2.Multiply16