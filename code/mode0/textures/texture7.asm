Raycast.DrawWall.7:
ldy Raycast.SliceID
lda Raycast.DrawWall.7JumpTableL.w,y
sta Standard.ZTempWord.0
lda Raycast.DrawWall.7JumpTableH.w,y
sta Standard.ZTempWord.0+1
jmp (Standard.ZTempWord.0)


Raycast.DrawWall.70:
Raycast.DrawWall.71:
Raycast.DrawWall.72:
Raycast.DrawWall.713:
Raycast.DrawWall.714:
Raycast.DrawWall.715:
ldy #0
ldx #16
jsr Raycast.PSETRange1
rts

Raycast.DrawWall.73:
Raycast.DrawWall.75:
Raycast.DrawWall.710:
Raycast.DrawWall.712:
ldy #3
ldx #8
jsr Raycast.PSETRange0
ldy #0
ldx #3
jsr Raycast.PSETRange1
ldy #8
ldx #16
jsr Raycast.PSETRange1
rts

Raycast.DrawWall.74:
Raycast.DrawWall.711:
ldy #3
ldx #8
jsr Raycast.PSETRange0
ldy #0
ldx #3
jsr Raycast.PSETRange1
ldy #4
ldx #7
jsr Raycast.PSETRange1
ldy #8
ldx #16
jsr Raycast.PSETRange1
rts

Raycast.DrawWall.76:
Raycast.DrawWall.79:
ldy #7
jsr Raycast.PSET10
ldy #0
ldx #7
jsr Raycast.PSETRange1
ldy #8
ldx #16
jsr Raycast.PSETRange1
rts

Raycast.DrawWall.77:
Raycast.DrawWall.78:
ldy #7
ldx #13
jsr Raycast.PSETRange0
ldy #0
ldx #7
jsr Raycast.PSETRange1
ldy #13
ldx #16
jsr Raycast.PSETRange1
rts

Raycast.DrawWall.7JumpTableH:
.db >Raycast.DrawWall.70,
.db >Raycast.DrawWall.71,>Raycast.DrawWall.72,>Raycast.DrawWall.73,>Raycast.DrawWall.74,
.db >Raycast.DrawWall.75,>Raycast.DrawWall.76,>Raycast.DrawWall.77,>Raycast.DrawWall.78,
.db >Raycast.DrawWall.79,>Raycast.DrawWall.710,>Raycast.DrawWall.711,>Raycast.DrawWall.712,
.db >Raycast.DrawWall.713,>Raycast.DrawWall.714,>Raycast.DrawWall.715,

Raycast.DrawWall.7JumpTableL:
.db <Raycast.DrawWall.70,
.db <Raycast.DrawWall.71,<Raycast.DrawWall.72,<Raycast.DrawWall.73,<Raycast.DrawWall.74,
.db <Raycast.DrawWall.75,<Raycast.DrawWall.76,<Raycast.DrawWall.77,<Raycast.DrawWall.78,
.db <Raycast.DrawWall.79,<Raycast.DrawWall.710,<Raycast.DrawWall.711,<Raycast.DrawWall.712,
.db <Raycast.DrawWall.713,<Raycast.DrawWall.714,<Raycast.DrawWall.715,