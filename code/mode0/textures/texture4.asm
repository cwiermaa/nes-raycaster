Raycast.DrawWall.4:
ldy Raycast.SliceID
lda Raycast.DrawWall.4JumpTableL.w,y
sta Standard.ZTempWord.0
lda Raycast.DrawWall.4JumpTableH.w,y
sta Standard.ZTempWord.0+1
jmp (Standard.ZTempWord.0)


Raycast.DrawWall.40:
Raycast.DrawWall.415:
ldy #0
ldx #16
jsr Raycast.PSETRange1
rts

Raycast.DrawWall.41:
Raycast.DrawWall.414:
ldy #3
ldx #16
jsr Raycast.PSETRange0
ldy #0
ldx #3
jsr Raycast.PSETRange1
rts

Raycast.DrawWall.42:
Raycast.DrawWall.413:
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

Raycast.DrawWall.43:
Raycast.DrawWall.412:
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

Raycast.DrawWall.44:
Raycast.DrawWall.411:
ldy #0
ldx #16
jsr Raycast.PSETRange0
ldy #1
jsr Raycast.PSET11
ldy #3
jsr Raycast.PSET11
rts

Raycast.DrawWall.45:
Raycast.DrawWall.410:
ldy #0
ldx #5
jsr Raycast.PSETRange0
ldy #1
ldx #3
jsr Raycast.PSETRange1
rts

Raycast.DrawWall.46:
Raycast.DrawWall.49:
ldy #0
ldx #4
jsr Raycast.PSETRange0
rts

Raycast.DrawWall.47:
Raycast.DrawWall.48:
ldy #0
ldx #4
jsr Raycast.PSETRange0
ldy #1
ldx #3
jsr Raycast.PSETRange1
rts

Raycast.DrawWall.4JumpTableH:
.db >Raycast.DrawWall.40,
.db >Raycast.DrawWall.41,>Raycast.DrawWall.42,>Raycast.DrawWall.43,>Raycast.DrawWall.44,
.db >Raycast.DrawWall.45,>Raycast.DrawWall.46,>Raycast.DrawWall.47,>Raycast.DrawWall.48,
.db >Raycast.DrawWall.49,>Raycast.DrawWall.410,>Raycast.DrawWall.411,>Raycast.DrawWall.412,
.db >Raycast.DrawWall.413,>Raycast.DrawWall.414,>Raycast.DrawWall.415,

Raycast.DrawWall.4JumpTableL:
.db <Raycast.DrawWall.40,
.db <Raycast.DrawWall.41,<Raycast.DrawWall.42,<Raycast.DrawWall.43,<Raycast.DrawWall.44,
.db <Raycast.DrawWall.45,<Raycast.DrawWall.46,<Raycast.DrawWall.47,<Raycast.DrawWall.48,
.db <Raycast.DrawWall.49,<Raycast.DrawWall.410,<Raycast.DrawWall.411,<Raycast.DrawWall.412,
.db <Raycast.DrawWall.413,<Raycast.DrawWall.414,<Raycast.DrawWall.415,