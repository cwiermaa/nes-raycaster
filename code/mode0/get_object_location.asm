Raycast.ObjectDraw.GetObjectDistance:

	lda #30
	sta Standard.ZTempByte.0			;X Distance
	lda #40
	sta Standard.ZTempByte.1			;Y Distance
	
	ldx Standard.ZTempByte.0
	lda Math.ReciprocalL.w,x
	sta System.Main.Math.B0
	lda Math.ReciprocalH.w,x
	sta System.Main.Math.B1
	
	lda Standard.ZTempByte.1
	sta System.Main.Math.A0
	jsr System.Main.Multiply.8.16		;Answer will by Rise multiplied by reciprocal of the Run, or in other words, Rise/Run. 24 Bits.
										;High 16 bits, Low 8 are precision.
										;Note that this is calculated from the absolute value of rise and run.
										;We will check the "quadrant" the object is in to get the real angle, as we are dealing
										;specifically with absolute value.
										
										;If PlayerX > ObjX AND PlayerY > ObjY, Obj is in 270 - 360
										;If PlayerX > ObjX AND PlayerY < ObjY, Obj is in 180 - 270
										;If PlayerX < ObjX AND PlayerY > ObjY, Obj is in 0 - 90
										;If PlayerX < ObjX AND PlayerY < ObjY, Obj is in 90 - 180
										
										
										;Need table of tangents for each 2 degrees, to keep it under 256.
										;Get the two indexes that correspond with table values the rise/run falls between.
										;This represents the rough angle.
										
										;Once you know the angle, look up the Cosine table we already have. Multiply the run by this value
										;to get the distance.
	rts
	
System.Main.Multiply.8.16:			;240 to 464 cycles

	lda #$00				;2
	sta System.Main.Math.B2
	sta System.Main.Math.Answer0		;5
	sta System.Main.Math.Answer1		;8
	sta System.Main.Math.Answer2		;11
	
-
	lsr System.Main.Math.A0			;5
	bcc +					;7
	clc					;9
	lda System.Main.Math.Answer0		;12
	adc System.Main.Math.B0			;15
	sta System.Main.Math.Answer0		;18
	lda System.Main.Math.Answer1		;21
	adc System.Main.Math.B1			;24
	sta System.Main.Math.Answer1		;27
	lda System.Main.Math.Answer2		;30
	adc System.Main.Math.B2			;33
	sta System.Main.Math.Answer2		;36
+
	asl System.Main.Math.B0			;13/41
	rol System.Main.Math.B1			;18/46
	rol System.Main.Math.B2			;23/51
	dex					;25/53
	bne -					;28/56

	rts
