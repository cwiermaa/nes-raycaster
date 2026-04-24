Raycast.ObjectDraw.ObjectTexture0:


Raycast.ObjectDraw.ObjectTexture0.12:
Raycast.ObjectDraw.ObjectTexture0.16:
ldy #21
ldx #23
jsr Raycasting.DrawObject.PSETRange0
ldy #31
jsr Raycasting.DrawObject.PSET10
ldy #18
ldx #20
jsr Raycasting.DrawObject.PSETRange1
ldy #21
ldx #23
jsr Raycasting.DrawObject.PSETRangeM
ldy #31
jsr Raycasting.DrawObject.PSETM1
jsr Raycasting.DrawObjects.XORFillColumn0
jsr Raycasting.DrawObjects.XORFillColumn1
jsr Raycasting.DrawObjects.XORFillColor0
jsr Raycasting.DrawObject.DrawColumn
jmp Raycast.ObjectDraw.ObjectTexture.Return

Raycast.ObjectDraw.ObjectTexture0.13:
Raycast.ObjectDraw.ObjectTexture0.15:
ldy #18
ldx #20
jsr Raycasting.DrawObject.PSETRange0
ldy #21
jsr Raycasting.DrawObject.PSET10
ldy #23
ldx #32
jsr Raycasting.DrawObject.PSETRange0
ldy #16
ldx #21
jsr Raycasting.DrawObject.PSETRange1
ldy #22
jsr Raycasting.DrawObject.PSET11
ldy #21
ldx #32
jsr Raycasting.DrawObject.PSETRangeM
jsr Raycasting.DrawObjects.XORFillColumn0
jsr Raycasting.DrawObjects.XORFillColumn1
jsr Raycasting.DrawObjects.XORFillColor0
jsr Raycasting.DrawObject.DrawColumn
jmp Raycast.ObjectDraw.ObjectTexture.Return

Raycast.ObjectDraw.ObjectTexture0.14:
ldy #16
ldx #21
jsr Raycasting.DrawObject.PSETRange0
ldy #22
jsr Raycasting.DrawObject.PSET10
ldy #31
jsr Raycasting.DrawObject.PSET10
ldy #15
ldx #22
jsr Raycasting.DrawObject.PSETRange1
ldy #23
ldx #31
jsr Raycasting.DrawObject.PSETRange1
ldy #21
ldx #32
jsr Raycasting.DrawObject.PSETRangeM
jsr Raycasting.DrawObjects.XORFillColumn0
jsr Raycasting.DrawObjects.XORFillColumn1
jsr Raycasting.DrawObjects.XORFillColor0
jsr Raycasting.DrawObject.DrawColumn
jmp Raycast.ObjectDraw.ObjectTexture.Return

Raycast.ObjectDraw.ObjectTexture0JumpTableH:
.db >Raycast.ObjectDraw.ObjectTexture0.12
.db >Raycast.ObjectDraw.ObjectTexture0.13
.db >Raycast.ObjectDraw.ObjectTexture0.14
.db >Raycast.ObjectDraw.ObjectTexture0.15
.db >Raycast.ObjectDraw.ObjectTexture0.16

.db $FF


Raycast.ObjectDraw.ObjectTexture0JumpTableL:
.db <Raycast.ObjectDraw.ObjectTexture0.12
.db <Raycast.ObjectDraw.ObjectTexture0.13
.db <Raycast.ObjectDraw.ObjectTexture0.14
.db <Raycast.ObjectDraw.ObjectTexture0.15
.db <Raycast.ObjectDraw.ObjectTexture0.16
