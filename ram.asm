.DEFINE Standard.NMIL $00
.DEFINE Standard.NMIH $01
.DEFINE Standard.MainL $02
.DEFINE Standard.MainH $03
.DEFINE Standard.VBLCount $04
.DEFINE Standard.Control.Current $05
.DEFINE Standard.Control.Previous $06
.DEFINE Standard.Control.Trigger $07

.DEFINE Standard.MMC3.MainBank0 $08
.DEFINE Standard.MMC3.MainBank1 $09

.DEFINE Standard.MMC3.Bankjump.ToBank $0A
.DEFINE Standard.MMC3.Bankjump.ToAddL $0B
.DEFINE Standard.MMC3.Bankjump.ToAddH $0C
.DEFINE Standard.MMC3.Bankjump.Temp $0D
.DEFINE Standard.MMC3.Bankjump.A $0E
.DEFINE Standard.MMC3.Bankjump.X $0F
.DEFINE Standard.MMC3.Bankjump.Y $10

.DEFINE Standard.ZTempByte.0 $11
.DEFINE Standard.ZTempByte.1 $12
.DEFINE Standard.ZTempByte.2 $13
.DEFINE Standard.ZTempByte.3 $14
.DEFINE Standard.ZTempByte.4 $15
.DEFINE Standard.ZTempByte.5 $16
.DEFINE Standard.ZTempByte.6 $17
.DEFINE Standard.ZTempByte.7 $18
.DEFINE Standard.ZTempByte.8 $19

.DEFINE Standard.ZTempWord.0 $1A
.DEFINE Standard.ZTempWord.1 $1C
.DEFINE Standard.ZTempWord.2 $1E
.DEFINE Standard.ZTempWord.3 $20
.DEFINE Standard.ZTempWord.4 $22
.DEFINE Standard.ZTempWord.5 $24
.DEFINE Standard.ZTempWord.6 $26
.DEFINE Standard.ZTempWord.7 $28
.DEFINE Standard.ZTempWord.8 $2A

.DEFINE Standard.ZTempByte.9 $2B
.DEFINE Standard.ZTempByte.A $2C

.DEFINE Raycast.ObjectSliceCounts $30


;**************************************************
;Raycast Constants


;************************************************
;Raycast RAM Definitions

.DEFINE Raycast.CHRBank $80
.DEFINE Raycast.$2000 $81

.DEFINE Raycast.CurrentTile $83

.DEFINE Raycast.ScrollYHighOld $84
.DEFINE Raycast.ScrollYLowOld $85
.DEFINE Raycast.ScrollXHighOld $86
.DEFINE Raycast.ScrollXLowOld $87
.DEFINE Raycast.PPUHigh $88
.DEFINE Raycast.PPULow $89

.DEFINE Raycast.Drawing.PixelY $8A
.DEFINE Raycast.Drawing.PixelX $8B
.DEFINE Raycast.Drawing.CurrentXTile $8C
.DEFINE Raycast.Drawing.CHRL $8D
.DEFINE Raycast.Drawing.CHRH $8E

.DEFINE Game.PlayerLeftAngle $8F			;Must rotate in 2 degree increments. Hold left FOV ray in 1 byte, only 256 options.
.DEFINE Game.PlayerXL $90
.DEFINE Game.PlayerXH $91					;High 4 MSb are tile
.DEFINE Game.PlayerYL $92
.DEFINE Game.PlayerYH $93
.DEFINE Game.CurrentColumn $94
.DEFINE Raycast.RayCast $95
.DEFINE Raycast.FacingAngle $96
.DEFINE Raycast.CurrentAngleFromFacing $97
.DEFINE Raycast.WallID $98
.DEFINE Raycast.SliceID $99
.DEFINE Raycast.RayLocation $9A
.DEFINE Raycast.PlayerLocation $9B
.DEFINE Raycast.InBlockX $9C
.DEFINE Raycast.InBlockY $9D
.DEFINE Raycast.FromTop $9E
.DEFINE Raycast.FromBottom $9F
.DEFINE Raycast.FromLeft $A0
.DEFINE Raycast.FromRight $A1

.DEFINE Raycast.CurrentAngleL $A2
.DEFINE Raycast.CurrentAngleH $A3

.DEFINE Raycast.RunLL $A4
.DEFINE Raycast.RunLH $A5
.DEFINE Raycast.RunHL $A6
.DEFINE Raycast.RunHH $A7
.DEFINE Raycast.RiseLL $A8
.DEFINE Raycast.RiseLH $A9
.DEFINE Raycast.RiseHL $AA
.DEFINE Raycast.RiseHH $AB
.DEFINE Raycast.1OverCosLL $AC
.DEFINE Raycast.1OverCosLH $AD
.DEFINE Raycast.1OverCosHL $AE
.DEFINE Raycast.1OverCosHH $AF
.DEFINE Raycast.1OverSinLL $B0
.DEFINE Raycast.1OverSinLH $B1
.DEFINE Raycast.1OverSinHL $B2
.DEFINE Raycast.1OverSinHH $B3

.DEFINE Raycast.RaysToEdge $B4

.DEFINE Raycast.SideXDistL $B5
.DEFINE Raycast.SideXDistH $B6
.DEFINE Raycast.SideYDistL $B7
.DEFINE Raycast.SideYDistH $B8

.DEFINE Raycast.DeltaYL $B9
.DEFINE Raycast.DeltaYH $BA
.DEFINE Raycast.DeltaXL $BB
.DEFINE Raycast.DeltaXH $BC

.DEFINE Raycast.WallDist $BD
.DEFINE Raycast.RayIndex $BE
.DEFINE Raycast.StepX $BF
.DEFINE Raycast.StepY $C0

.DEFINE Raycast.SemiAngle $C1
.DEFINE Raycast.Side $C2

.DEFINE Raycast.Move.YL $C3
.DEFINE Raycast.Move.YH $C4
.DEFINE Raycast.Move.XL $C5
.DEFINE Raycast.Move.XH $C6

.DEFINE Raycast.DrawObject $C7
.DEFINE Raycast.ObjectDraw.ColumnMask $C8
.DEFINE Raycast.ObjectDraw.ObjectDist $C9
.DEFINE Raycast.ObjectDraw.PixelColumn $CA
.DEFINE Raycast.ObjectDraw.TileColumn $CB

.DEFINE System.Main.Math.Answer0 $D0		;5
.DEFINE System.Main.Math.Answer1 $D1	;8
.DEFINE System.Main.Math.Answer2 $D2

.DEFINE System.Main.Math.B0 $D3
.DEFINE System.Main.Math.B1 $D4
.DEFINE System.Main.Math.B2 $D5

.DEFINE System.Main.Math.A0 $D6


.DEFINE System.Main.Math.Answer02 $D7		;5
.DEFINE System.Main.Math.Answer12 $D8	;8
.DEFINE System.Main.Math.Answer22 $D9

.DEFINE System.Main.Math.B02 $DA
.DEFINE System.Main.Math.B12 $DB
.DEFINE System.Main.Math.B22 $DC

.DEFINE System.Main.Math.A02 $DD

.DEFINE Raycast.ObjectDraw.TextureSlice $DE

.DEFINE Raycast.ObjectDraw.TexturesLL $DF
.DEFINE Raycast.ObjectDraw.TexturesLH $E0
.DEFINE Raycast.ObjectDraw.TexturesHL $E1
.DEFINE Raycast.ObjectDraw.TexturesHH $E2
.DEFINE Raycast.ObjectDraw.SliceCountL $E3
.DEFINE Raycast.ObjectDraw.SliceCountH $E4
.DEFINE Raycast.ObjectDraw.TextureSliceCount $E5
.DEFINE Raycast.ObjectDraw.DrawSliceL $E6
.DEFINE Raycast.ObjectDraw.DrawSliceH $E7
.DEFINE Raycast.ObjectDraw.ObjectDistDouble $E8

.DEFINE Raycast.WallDistances $200

.DEFINE Raycast.ObjectDraw.Column0 $400
.DEFINE Raycast.ObjectDraw.Column1 $42D
.DEFINE Raycast.ObjectDraw.Color0 $45A


.DEFINE Raycast.SpritePage $300
.DEFINE Raycast.ObjectDraw.Objects $500
.DEFINE Raycast.ObjectDraw.InMapX $501

.DEFINE Raycast.CHR	$6000
.DEFINE Raycast.Room $7000
.DEFINE Raycast.Palette $7400