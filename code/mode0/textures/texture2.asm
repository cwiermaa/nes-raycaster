Raycast.DrawWall.2:
ldy Raycast.SliceID
lda Raycast.DrawWall.2JumpTableL.w,y
sta Standard.ZTempWord.0
lda Raycast.DrawWall.2JumpTableH.w,y
sta Standard.ZTempWord.0+1
jmp (Standard.ZTempWord.0)


Raycast.DrawWall.20:
Raycast.DrawWall.215:
ldy #0
ldx #16
jsr Raycast.PSETRange0
rts

Raycast.DrawWall.21:
Raycast.DrawWall.214:
ldy #0
ldx #16
jsr Raycast.PSETRange0
ldy #2
ldx #14
jsr Raycast.PSETRange1
rts

Raycast.DrawWall.22:
Raycast.DrawWall.213:
ldy #0
jsr Raycast.PSET10
ldy #2
ldx #14
jsr Raycast.PSETRange0
ldy #15
jsr Raycast.PSET10
ldy #1
jsr Raycast.PSET11
ldy #3
ldx #13
jsr Raycast.PSETRange1
ldy #14
jsr Raycast.PSET11
rts

Raycast.DrawWall.23:
Raycast.DrawWall.212:
ldy #0
jsr Raycast.PSET10
ldy #3
ldx #13
jsr Raycast.PSETRange0
ldy #15
jsr Raycast.PSET10
ldy #1
ldx #3
jsr Raycast.PSETRange1
ldy #4
ldx #12
jsr Raycast.PSETRange1
ldy #13
ldx #15
jsr Raycast.PSETRange1
rts

Raycast.DrawWall.24:
Raycast.DrawWall.211:
ldy #0
jsr Raycast.PSET10
ldy #4
ldx #12
jsr Raycast.PSETRange0
ldy #15
jsr Raycast.PSET10
ldy #1
ldx #4
jsr Raycast.PSETRange1
ldy #5
ldx #11
jsr Raycast.PSETRange1
ldy #12
ldx #15
jsr Raycast.PSETRange1
rts

Raycast.DrawWall.25:
Raycast.DrawWall.210:
ldy #0
jsr Raycast.PSET10
ldy #5
ldx #11
jsr Raycast.PSETRange0
ldy #15
jsr Raycast.PSET10
ldy #1
ldx #5
jsr Raycast.PSETRange1
ldy #6
ldx #10
jsr Raycast.PSETRange1
ldy #11
ldx #15
jsr Raycast.PSETRange1
rts

Raycast.DrawWall.26:
Raycast.DrawWall.29:
ldy #0
jsr Raycast.PSET10
ldy #6
ldx #10
jsr Raycast.PSETRange0
ldy #15
jsr Raycast.PSET10
ldy #1
ldx #6
jsr Raycast.PSETRange1
ldy #7
ldx #9
jsr Raycast.PSETRange1
ldy #10
ldx #15
jsr Raycast.PSETRange1
rts

Raycast.DrawWall.27:
Raycast.DrawWall.28:
ldy #0
jsr Raycast.PSET10
ldy #7
ldx #9
jsr Raycast.PSETRange0
ldy #15
jsr Raycast.PSET10
ldy #1
ldx #7
jsr Raycast.PSETRange1
ldy #9
ldx #15
jsr Raycast.PSETRange1
rts

Raycast.DrawWall.2JumpTableH:
.db >Raycast.DrawWall.20,
.db >Raycast.DrawWall.21,>Raycast.DrawWall.22,>Raycast.DrawWall.23,>Raycast.DrawWall.24,
.db >Raycast.DrawWall.25,>Raycast.DrawWall.26,>Raycast.DrawWall.27,>Raycast.DrawWall.28,
.db >Raycast.DrawWall.29,>Raycast.DrawWall.210,>Raycast.DrawWall.211,>Raycast.DrawWall.212,
.db >Raycast.DrawWall.213,>Raycast.DrawWall.214,>Raycast.DrawWall.215,

Raycast.DrawWall.2JumpTableL:
.db <Raycast.DrawWall.20,
.db <Raycast.DrawWall.21,<Raycast.DrawWall.22,<Raycast.DrawWall.23,<Raycast.DrawWall.24,
.db <Raycast.DrawWall.25,<Raycast.DrawWall.26,<Raycast.DrawWall.27,<Raycast.DrawWall.28,
.db <Raycast.DrawWall.29,<Raycast.DrawWall.210,<Raycast.DrawWall.211,<Raycast.DrawWall.212,
.db <Raycast.DrawWall.213,<Raycast.DrawWall.214,<Raycast.DrawWall.215,