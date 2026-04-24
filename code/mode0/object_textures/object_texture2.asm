Raycast.DrawWall.2:
ldy Raycast.SliceID
lda Raycast.DrawWall.2JumpTableL.w,y
sta Standard.ZTempWord.0
lda Raycast.DrawWall.2JumpTableH.w,y
sta Standard.ZTempWord.0+1
jmp (Standard.ZTempWord.0)


Raycast.ObjectDraw.ObjectTexture2.0:
Raycast.ObjectDraw.ObjectTexture2.15:
ldy #0
ldx #16
jsr Raycast.PSETRange1
rts

Raycast.ObjectDraw.ObjectTexture2.1:
Raycast.ObjectDraw.ObjectTexture2.14:
ldy #3
ldx #16
jsr Raycast.PSETRange0
ldy #0
ldx #3
jsr Raycast.PSETRange1
rts

Raycast.ObjectDraw.ObjectTexture2.2:
Raycast.ObjectDraw.ObjectTexture2.13:
ldy #2
ldx #16
jsr Raycast.PSETRange0
ldy #0
ldx #2
jsr Raycast.PSETRange1
ldy #4
ldx #6
jsr Raycast.PSETRange1
ldy #8
ldx #10
jsr Raycast.PSETRange1
ldy #11
jsr Raycast.PSET11
ldy #14
ldx #16
jsr Raycast.PSETRange1
rts

Raycast.ObjectDraw.ObjectTexture2.3:
Raycast.ObjectDraw.ObjectTexture2.12:
ldy #1
ldx #16
jsr Raycast.PSETRange0
ldy #0
jsr Raycast.PSET11
ldy #2
ldx #4
jsr Raycast.PSETRange1
ldy #5
ldx #7
jsr Raycast.PSETRange1
ldy #8
ldx #10
jsr Raycast.PSETRange1
ldy #11
ldx #13
jsr Raycast.PSETRange1
ldy #14
ldx #16
jsr Raycast.PSETRange1
rts

Raycast.ObjectDraw.ObjectTexture2.4:
Raycast.ObjectDraw.ObjectTexture2.11:
ldy #0
ldx #16
jsr Raycast.PSETRange0
ldy #1
jsr Raycast.PSET11
ldy #3
jsr Raycast.PSET11
rts

Raycast.ObjectDraw.ObjectTexture2.5:
Raycast.ObjectDraw.ObjectTexture2.10:
ldy #0
ldx #5
jsr Raycast.PSETRange0
ldy #1
ldx #3
jsr Raycast.PSETRange1
rts

Raycast.ObjectDraw.ObjectTexture2.6:
Raycast.ObjectDraw.ObjectTexture2.9:
ldy #0
ldx #4
jsr Raycast.PSETRange0
ldy #9
jsr Raycast.PSET11
ldy #13
jsr Raycast.PSET11
rts

Raycast.ObjectDraw.ObjectTexture2.7:
Raycast.ObjectDraw.ObjectTexture2.8:
ldy #0
ldx #4
jsr Raycast.PSETRange0
ldy #1
ldx #3
jsr Raycast.PSETRange1
ldy #10
ldx #14
jsr Raycast.PSETRange1
rts

Raycast.ObjectDraw.ObjectTexture2.16:
ldy #3
ldx #8
jsr Raycast.PSETRange0
ldy #11
ldx #16
jsr Raycast.PSETRange0
ldy #0
ldx #3
jsr Raycast.PSETRange1
ldy #8
ldx #11
jsr Raycast.PSETRange1
rts

Raycast.ObjectDraw.ObjectTexture2.17:
Raycast.ObjectDraw.ObjectTexture2.18:
Raycast.ObjectDraw.ObjectTexture2.19:
Raycast.ObjectDraw.ObjectTexture2.20:
Raycast.ObjectDraw.ObjectTexture2.21:
Raycast.ObjectDraw.ObjectTexture2.22:
Raycast.ObjectDraw.ObjectTexture2.24:
Raycast.ObjectDraw.ObjectTexture2.25:
Raycast.ObjectDraw.ObjectTexture2.26:
Raycast.ObjectDraw.ObjectTexture2.27:
Raycast.ObjectDraw.ObjectTexture2.28:
Raycast.ObjectDraw.ObjectTexture2.29:
Raycast.ObjectDraw.ObjectTexture2.30:
Raycast.ObjectDraw.ObjectTexture2.31:
ldy #3
jsr Raycast.PSET10
ldy #7
jsr Raycast.PSET10
ldy #11
jsr Raycast.PSET10
ldy #15
jsr Raycast.PSET10
ldy #0
ldx #3
jsr Raycast.PSETRange1
ldy #4
ldx #7
jsr Raycast.PSETRange1
ldy #8
ldx #11
jsr Raycast.PSETRange1
ldy #12
ldx #15
jsr Raycast.PSETRange1
rts

Raycast.ObjectDraw.ObjectTexture2.23:
ldy #0
ldx #4
jsr Raycast.PSETRange0
ldy #7
ldx #12
jsr Raycast.PSETRange0
ldy #15
jsr Raycast.PSET10
ldy #4
ldx #7
jsr Raycast.PSETRange1
ldy #12
ldx #15
jsr Raycast.PSETRange1
rts

Raycast.ObjectDraw.ObjectTexture2JumpTableH:
.db >Raycast.ObjectDraw.ObjectTexture2.0,
.db >Raycast.ObjectDraw.ObjectTexture2.1,>Raycast.ObjectDraw.ObjectTexture2.2,>Raycast.ObjectDraw.ObjectTexture2.3,>Raycast.ObjectDraw.ObjectTexture2.4,
.db >Raycast.ObjectDraw.ObjectTexture2.5,>Raycast.ObjectDraw.ObjectTexture2.6,>Raycast.ObjectDraw.ObjectTexture2.7,>Raycast.ObjectDraw.ObjectTexture2.8,
.db >Raycast.ObjectDraw.ObjectTexture2.9,>Raycast.ObjectDraw.ObjectTexture2.10,>Raycast.ObjectDraw.ObjectTexture2.11,>Raycast.ObjectDraw.ObjectTexture2.12,
.db >Raycast.ObjectDraw.ObjectTexture2.13,>Raycast.ObjectDraw.ObjectTexture2.14,>Raycast.ObjectDraw.ObjectTexture2.15,>Raycast.ObjectDraw.ObjectTexture2.16,
.db >Raycast.ObjectDraw.ObjectTexture2.17,>Raycast.ObjectDraw.ObjectTexture2.18,>Raycast.ObjectDraw.ObjectTexture2.19,>Raycast.ObjectDraw.ObjectTexture2.20,
.db >Raycast.ObjectDraw.ObjectTexture2.21,>Raycast.ObjectDraw.ObjectTexture2.22,>Raycast.ObjectDraw.ObjectTexture2.23,>Raycast.ObjectDraw.ObjectTexture2.24,
.db >Raycast.ObjectDraw.ObjectTexture2.25,>Raycast.ObjectDraw.ObjectTexture2.26,>Raycast.ObjectDraw.ObjectTexture2.27,>Raycast.ObjectDraw.ObjectTexture2.28,
.db >Raycast.ObjectDraw.ObjectTexture2.29,>Raycast.ObjectDraw.ObjectTexture2.30,>Raycast.ObjectDraw.ObjectTexture2.31,

Raycast.ObjectDraw.ObjectTexture2JumpTableL:
.db <Raycast.ObjectDraw.ObjectTexture2.0,
.db <Raycast.ObjectDraw.ObjectTexture2.1,<Raycast.ObjectDraw.ObjectTexture2.2,<Raycast.ObjectDraw.ObjectTexture2.3,<Raycast.ObjectDraw.ObjectTexture2.4,
.db <Raycast.ObjectDraw.ObjectTexture2.5,<Raycast.ObjectDraw.ObjectTexture2.6,<Raycast.ObjectDraw.ObjectTexture2.7,<Raycast.ObjectDraw.ObjectTexture2.8,
.db <Raycast.ObjectDraw.ObjectTexture2.9,<Raycast.ObjectDraw.ObjectTexture2.10,<Raycast.ObjectDraw.ObjectTexture2.11,<Raycast.ObjectDraw.ObjectTexture2.12,
.db <Raycast.ObjectDraw.ObjectTexture2.13,<Raycast.ObjectDraw.ObjectTexture2.14,<Raycast.ObjectDraw.ObjectTexture2.15,<Raycast.ObjectDraw.ObjectTexture2.16,
.db <Raycast.ObjectDraw.ObjectTexture2.17,<Raycast.ObjectDraw.ObjectTexture2.18,<Raycast.ObjectDraw.ObjectTexture2.19,<Raycast.ObjectDraw.ObjectTexture2.20,
.db <Raycast.ObjectDraw.ObjectTexture2.21,<Raycast.ObjectDraw.ObjectTexture2.22,<Raycast.ObjectDraw.ObjectTexture2.23,<Raycast.ObjectDraw.ObjectTexture2.24,
.db <Raycast.ObjectDraw.ObjectTexture2.25,<Raycast.ObjectDraw.ObjectTexture2.26,<Raycast.ObjectDraw.ObjectTexture2.27,<Raycast.ObjectDraw.ObjectTexture2.28,
.db <Raycast.ObjectDraw.ObjectTexture2.29,<Raycast.ObjectDraw.ObjectTexture2.30,<Raycast.ObjectDraw.ObjectTexture2.31,