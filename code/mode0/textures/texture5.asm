Raycast.DrawWall.5:
ldy Raycast.SliceID
lda Raycast.DrawWall.5JumpTableL.w,y
sta Standard.ZTempWord.0
lda Raycast.DrawWall.5JumpTableH.w,y
sta Standard.ZTempWord.0+1
jmp (Standard.ZTempWord.0)


Raycast.DrawWall.50:
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

Raycast.DrawWall.51:
Raycast.DrawWall.52:
Raycast.DrawWall.53:
Raycast.DrawWall.54:
Raycast.DrawWall.55:
Raycast.DrawWall.56:
Raycast.DrawWall.58:
Raycast.DrawWall.59:
Raycast.DrawWall.510:
Raycast.DrawWall.511:
Raycast.DrawWall.512:
Raycast.DrawWall.513:
Raycast.DrawWall.514:
Raycast.DrawWall.515:
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

Raycast.DrawWall.57:
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

Raycast.DrawWall.5JumpTableH:
.db >Raycast.DrawWall.50,
.db >Raycast.DrawWall.51,>Raycast.DrawWall.52,>Raycast.DrawWall.53,>Raycast.DrawWall.54,
.db >Raycast.DrawWall.55,>Raycast.DrawWall.56,>Raycast.DrawWall.57,>Raycast.DrawWall.58,
.db >Raycast.DrawWall.59,>Raycast.DrawWall.510,>Raycast.DrawWall.511,>Raycast.DrawWall.512,
.db >Raycast.DrawWall.513,>Raycast.DrawWall.514,>Raycast.DrawWall.515,

Raycast.DrawWall.5JumpTableL:
.db <Raycast.DrawWall.50,
.db <Raycast.DrawWall.51,<Raycast.DrawWall.52,<Raycast.DrawWall.53,<Raycast.DrawWall.54,
.db <Raycast.DrawWall.55,<Raycast.DrawWall.56,<Raycast.DrawWall.57,<Raycast.DrawWall.58,
.db <Raycast.DrawWall.59,<Raycast.DrawWall.510,<Raycast.DrawWall.511,<Raycast.DrawWall.512,
.db <Raycast.DrawWall.513,<Raycast.DrawWall.514,<Raycast.DrawWall.515,