Raycast.ObjectDraw.ObjectTexture1:


Raycast.ObjectDraw.ObjectTexture1.11:
Raycast.ObjectDraw.ObjectTexture1.19:
ldy #20
ldx #22
jsr Raycasting.DrawObject.PSETRange0
ldy #31
jsr Raycasting.DrawObject.PSET10
ldy #20
ldx #22
jsr Raycasting.DrawObject.PSETRangeM
ldy #31
jsr Raycasting.DrawObject.PSETM1
jsr Raycasting.DrawObjects.XORFillColumn0
jsr Raycasting.DrawObjects.XORFillColumn1
jsr Raycasting.DrawObjects.XORFillColor0
jsr Raycasting.DrawObject.DrawColumn
jmp Raycast.ObjectDraw.ObjectTexture.Return

Raycast.ObjectDraw.ObjectTexture1.12:
Raycast.ObjectDraw.ObjectTexture1.18:
ldy #13
ldx #16
jsr Raycasting.DrawObject.PSETRange0
ldy #19
ldx #25
jsr Raycasting.DrawObject.PSETRange0
ldy #29
ldx #32
jsr Raycasting.DrawObject.PSETRange0
ldy #13
jsr Raycasting.DrawObject.PSET11
ldy #20
ldx #22
jsr Raycasting.DrawObject.PSETRange1
ldy #31
jsr Raycasting.DrawObject.PSET11
ldy #13
ldx #16
jsr Raycasting.DrawObject.PSETRangeM
ldy #19
ldx #25
jsr Raycasting.DrawObject.PSETRangeM
ldy #29
ldx #32
jsr Raycasting.DrawObject.PSETRangeM
jsr Raycasting.DrawObjects.XORFillColumn0
jsr Raycasting.DrawObjects.XORFillColumn1
jsr Raycasting.DrawObjects.XORFillColor0
jsr Raycasting.DrawObject.DrawColumn
jmp Raycast.ObjectDraw.ObjectTexture.Return

Raycast.ObjectDraw.ObjectTexture1.13:
Raycast.ObjectDraw.ObjectTexture1.17:
ldy #12
ldx #14
jsr Raycasting.DrawObject.PSETRange0
ldy #16
jsr Raycasting.DrawObject.PSET10
ldy #18
ldx #28
jsr Raycasting.DrawObject.PSETRange0
ldy #29
ldx #32
jsr Raycasting.DrawObject.PSETRange0
ldy #12
jsr Raycasting.DrawObject.PSET11
ldy #21
ldx #25
jsr Raycasting.DrawObject.PSETRange1
ldy #28
ldx #32
jsr Raycasting.DrawObject.PSETRange1
ldy #12
ldx #17
jsr Raycasting.DrawObject.PSETRangeM
ldy #18
ldx #32
jsr Raycasting.DrawObject.PSETRangeM
jsr Raycasting.DrawObjects.XORFillColumn0
jsr Raycasting.DrawObjects.XORFillColumn1
jsr Raycasting.DrawObjects.XORFillColor0
jsr Raycasting.DrawObject.DrawColumn
jmp Raycast.ObjectDraw.ObjectTexture.Return

Raycast.ObjectDraw.ObjectTexture1.14:
Raycast.ObjectDraw.ObjectTexture1.16:
ldy #11
ldx #13
jsr Raycasting.DrawObject.PSETRange0
ldy #17
ldx #21
jsr Raycasting.DrawObject.PSETRange0
ldy #22
jsr Raycasting.DrawObject.PSET10
ldy #24
ldx #32
jsr Raycasting.DrawObject.PSETRange0
ldy #11
jsr Raycasting.DrawObject.PSET11
ldy #14
jsr Raycasting.DrawObject.PSET11
ldy #19
ldx #22
jsr Raycasting.DrawObject.PSETRange1
ldy #23
ldx #26
jsr Raycasting.DrawObject.PSETRange1
ldy #27
ldx #31
jsr Raycasting.DrawObject.PSETRange1
ldy #11
ldx #32
jsr Raycasting.DrawObject.PSETRangeM
jsr Raycasting.DrawObjects.XORFillColumn0
jsr Raycasting.DrawObjects.XORFillColumn1
jsr Raycasting.DrawObjects.XORFillColor0
jsr Raycasting.DrawObject.DrawColumn
jmp Raycast.ObjectDraw.ObjectTexture.Return

Raycast.ObjectDraw.ObjectTexture1.15:
ldy #11
ldx #13
jsr Raycasting.DrawObject.PSETRange0
ldy #18
ldx #24
jsr Raycasting.DrawObject.PSETRange0
ldy #26
ldx #32
jsr Raycasting.DrawObject.PSETRange0
ldy #11
jsr Raycasting.DrawObject.PSET11
ldy #18
ldx #23
jsr Raycasting.DrawObject.PSETRange1
ldy #24
ldx #26
jsr Raycasting.DrawObject.PSETRange1
ldy #28
ldx #32
jsr Raycasting.DrawObject.PSETRange1
ldy #11
ldx #32
jsr Raycasting.DrawObject.PSETRangeM
jsr Raycasting.DrawObjects.XORFillColumn0
jsr Raycasting.DrawObjects.XORFillColumn1
jsr Raycasting.DrawObjects.XORFillColor0
jsr Raycasting.DrawObject.DrawColumn
jmp Raycast.ObjectDraw.ObjectTexture.Return

Raycast.ObjectDraw.ObjectTexture1JumpTableH:
.db >Raycast.ObjectDraw.ObjectTexture1.11
.db >Raycast.ObjectDraw.ObjectTexture1.12
.db >Raycast.ObjectDraw.ObjectTexture1.13
.db >Raycast.ObjectDraw.ObjectTexture1.14
.db >Raycast.ObjectDraw.ObjectTexture1.15
.db >Raycast.ObjectDraw.ObjectTexture1.16
.db >Raycast.ObjectDraw.ObjectTexture1.17
.db >Raycast.ObjectDraw.ObjectTexture1.18
.db >Raycast.ObjectDraw.ObjectTexture1.19

.db $FF


Raycast.ObjectDraw.ObjectTexture1JumpTableL:
.db <Raycast.ObjectDraw.ObjectTexture1.11
.db <Raycast.ObjectDraw.ObjectTexture1.12
.db <Raycast.ObjectDraw.ObjectTexture1.13
.db <Raycast.ObjectDraw.ObjectTexture1.14
.db <Raycast.ObjectDraw.ObjectTexture1.15
.db <Raycast.ObjectDraw.ObjectTexture1.16
.db <Raycast.ObjectDraw.ObjectTexture1.17
.db <Raycast.ObjectDraw.ObjectTexture1.18
.db <Raycast.ObjectDraw.ObjectTexture1.19
