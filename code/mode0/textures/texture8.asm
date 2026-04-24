Raycast.DrawWall.8:
ldy Raycast.SliceID
lda Raycast.DrawWall.8JumpTableL.w,y
sta Standard.ZTempWord.0
lda Raycast.DrawWall.8JumpTableH.w,y
sta Standard.ZTempWord.0+1
jmp (Standard.ZTempWord.0)


Raycast.DrawWall.80:
Raycast.DrawWall.81:
Raycast.DrawWall.814:
Raycast.DrawWall.815:
ldy #0
ldx #2
jsr Raycast.PSETRange0
rts

Raycast.DrawWall.82:
Raycast.DrawWall.813:
ldy #0
ldx #2
jsr Raycast.PSETRange0
ldy #11
ldx #13
jsr Raycast.PSETRange0
rts

Raycast.DrawWall.83:
Raycast.DrawWall.85:
Raycast.DrawWall.810:
Raycast.DrawWall.812:
ldy #0
ldx #16
jsr Raycast.PSETRange0
rts

Raycast.DrawWall.84:
Raycast.DrawWall.811:
ldy #0
ldx #2
jsr Raycast.PSETRange0
ldy #2
ldx #16
jsr Raycast.PSETRange1
rts

Raycast.DrawWall.86:
Raycast.DrawWall.89:
ldy #0
ldx #2
jsr Raycast.PSETRange0
ldy #7
jsr Raycast.PSET12
ldy #12
jsr Raycast.PSET10
rts

Raycast.DrawWall.87:
Raycast.DrawWall.88:
ldy #0
ldx #2
jsr Raycast.PSETRange0
ldy #4
jsr Raycast.PSET10
rts

Raycast.DrawWall.8JumpTableH:
.db >Raycast.DrawWall.80,
.db >Raycast.DrawWall.81,>Raycast.DrawWall.82,>Raycast.DrawWall.83,>Raycast.DrawWall.84,
.db >Raycast.DrawWall.85,>Raycast.DrawWall.86,>Raycast.DrawWall.87,>Raycast.DrawWall.88,
.db >Raycast.DrawWall.89,>Raycast.DrawWall.810,>Raycast.DrawWall.811,>Raycast.DrawWall.812,
.db >Raycast.DrawWall.813,>Raycast.DrawWall.814,>Raycast.DrawWall.815,

Raycast.DrawWall.8JumpTableL:
.db <Raycast.DrawWall.80,
.db <Raycast.DrawWall.81,<Raycast.DrawWall.82,<Raycast.DrawWall.83,<Raycast.DrawWall.84,
.db <Raycast.DrawWall.85,<Raycast.DrawWall.86,<Raycast.DrawWall.87,<Raycast.DrawWall.88,
.db <Raycast.DrawWall.89,<Raycast.DrawWall.810,<Raycast.DrawWall.811,<Raycast.DrawWall.812,
.db <Raycast.DrawWall.813,<Raycast.DrawWall.814,<Raycast.DrawWall.815,