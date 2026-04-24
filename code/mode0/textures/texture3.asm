Raycast.DrawWall.3:
ldy Raycast.SliceID
lda Raycast.DrawWall.3JumpTableL.w,y
sta Standard.ZTempWord.0
lda Raycast.DrawWall.3JumpTableH.w,y
sta Standard.ZTempWord.0+1
jmp (Standard.ZTempWord.0)


Raycast.DrawWall.30:
Raycast.DrawWall.34:
Raycast.DrawWall.38:
Raycast.DrawWall.312:
ldy #0
ldx #16
jsr Raycast.PSETRange0
ldy #0
jsr Raycast.PSET11
ldy #15
jsr Raycast.PSET11
rts

Raycast.DrawWall.31:
Raycast.DrawWall.32:
Raycast.DrawWall.33:
Raycast.DrawWall.39:
Raycast.DrawWall.310:
Raycast.DrawWall.311:
ldy #0
ldx #2
jsr Raycast.PSETRange0
ldy #4
jsr Raycast.PSET10
ldy #11
jsr Raycast.PSET10
ldy #14
ldx #16
jsr Raycast.PSETRange0
ldy #0
jsr Raycast.PSET11
ldy #2
ldx #4
jsr Raycast.PSETRange1
ldy #5
ldx #11
jsr Raycast.PSETRange1
ldy #12
ldx #14
jsr Raycast.PSETRange1
ldy #15
jsr Raycast.PSET11
rts

Raycast.DrawWall.35:
Raycast.DrawWall.36:
Raycast.DrawWall.37:
Raycast.DrawWall.313:
Raycast.DrawWall.314:
Raycast.DrawWall.315:
ldy #0
ldx #2
jsr Raycast.PSETRange0
ldy #7
jsr Raycast.PSET10
ldy #14
ldx #16
jsr Raycast.PSETRange0
ldy #0
jsr Raycast.PSET11
ldy #2
ldx #7
jsr Raycast.PSETRange1
ldy #8
ldx #14
jsr Raycast.PSETRange1
ldy #15
jsr Raycast.PSET11
rts

Raycast.DrawWall.3JumpTableH:
.db >Raycast.DrawWall.30,
.db >Raycast.DrawWall.31,>Raycast.DrawWall.32,>Raycast.DrawWall.33,>Raycast.DrawWall.34,
.db >Raycast.DrawWall.35,>Raycast.DrawWall.36,>Raycast.DrawWall.37,>Raycast.DrawWall.38,
.db >Raycast.DrawWall.39,>Raycast.DrawWall.310,>Raycast.DrawWall.311,>Raycast.DrawWall.312,
.db >Raycast.DrawWall.313,>Raycast.DrawWall.314,>Raycast.DrawWall.315,

Raycast.DrawWall.3JumpTableL:
.db <Raycast.DrawWall.30,
.db <Raycast.DrawWall.31,<Raycast.DrawWall.32,<Raycast.DrawWall.33,<Raycast.DrawWall.34,
.db <Raycast.DrawWall.35,<Raycast.DrawWall.36,<Raycast.DrawWall.37,<Raycast.DrawWall.38,
.db <Raycast.DrawWall.39,<Raycast.DrawWall.310,<Raycast.DrawWall.311,<Raycast.DrawWall.312,
.db <Raycast.DrawWall.313,<Raycast.DrawWall.314,<Raycast.DrawWall.315,