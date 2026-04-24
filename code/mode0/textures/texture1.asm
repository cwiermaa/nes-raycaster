Raycast.DrawWall.1:
ldy Raycast.SliceID
lda Raycast.DrawWall.1JumpTableL.w,y
sta Standard.ZTempWord.0
lda Raycast.DrawWall.1JumpTableH.w,y
sta Standard.ZTempWord.0+1
jmp (Standard.ZTempWord.0)


Raycast.DrawWall.10:
Raycast.DrawWall.11:
Raycast.DrawWall.114:
Raycast.DrawWall.115:
ldy #0
ldx #3
jsr Raycast.PSETRange0
ldy #13
ldx #16
jsr Raycast.PSETRange0
ldy #2
jsr Raycast.PSET11
ldy #13
jsr Raycast.PSET11
rts

Raycast.DrawWall.12:
Raycast.DrawWall.13:
Raycast.DrawWall.14:
Raycast.DrawWall.15:
Raycast.DrawWall.16:
Raycast.DrawWall.17:
Raycast.DrawWall.18:
Raycast.DrawWall.19:
Raycast.DrawWall.110:
Raycast.DrawWall.111:
Raycast.DrawWall.112:
Raycast.DrawWall.113:
ldy #0
ldx #3
jsr Raycast.PSETRange0
ldy #13
ldx #16
jsr Raycast.PSETRange0
ldy #2
jsr Raycast.PSET11
ldy #6
ldx #10
jsr Raycast.PSETRange1
ldy #13
jsr Raycast.PSET11
rts

Raycast.DrawWall.1JumpTableH:
.db >Raycast.DrawWall.10,
.db >Raycast.DrawWall.11,>Raycast.DrawWall.12,>Raycast.DrawWall.13,>Raycast.DrawWall.14,
.db >Raycast.DrawWall.15,>Raycast.DrawWall.16,>Raycast.DrawWall.17,>Raycast.DrawWall.18,
.db >Raycast.DrawWall.19,>Raycast.DrawWall.110,>Raycast.DrawWall.111,>Raycast.DrawWall.112,
.db >Raycast.DrawWall.113,>Raycast.DrawWall.114,>Raycast.DrawWall.115,

Raycast.DrawWall.1JumpTableL:
.db <Raycast.DrawWall.10,
.db <Raycast.DrawWall.11,<Raycast.DrawWall.12,<Raycast.DrawWall.13,<Raycast.DrawWall.14,
.db <Raycast.DrawWall.15,<Raycast.DrawWall.16,<Raycast.DrawWall.17,<Raycast.DrawWall.18,
.db <Raycast.DrawWall.19,<Raycast.DrawWall.110,<Raycast.DrawWall.111,<Raycast.DrawWall.112,
.db <Raycast.DrawWall.113,<Raycast.DrawWall.114,<Raycast.DrawWall.115,