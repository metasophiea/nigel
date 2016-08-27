//using 800x600 resolution
// Max memory 2048bytes (0x0800)
// so, 51*40 NigelPixels results in a 1.275 aspect ratio
// (that's 51 colums and 40 rows) 
// 2040 pixels, same amount of bytes requred

// V_loop
// 40 Blank H_loops
// 658 display H_loops
// 2 Blank H_loops 

// H_Loop takes 25.76us

#include "Stuff/ClearMemory.asm"

// Chip Pin Array B: Colour Control (Output)
//	(6 pin) 
//	Pin 0: Red Out		to screen
//	Pin 1: Green Out 	to screen
//	Pin 2: Blue Out 	to screen
//	Pin 3: -unused-
//	Pin 4: -unused-
//	Pin 5: -unused-
	ldi R16, 0xFF out DDRB, R16
// Chip Pin Array C: Sync Control (Output)
//	(6 pin) 
//	Pin 0: V_Sync 		to screen
//	Pin 1: H_Sync 		to screen
//	Pin 2: -unused-
//	Pin 3: -unused-
//	Pin 4: -unused-	
//	Pin 5: -unused- ;Signal Ready 		to Control
	ldi R16, 0xFF out DDRC, R16
// Chip Pin Array D: Data Port (Input/Output) (8 pin)
//	(8 pin) 
//	Pin 0: -unused- 		from Control
//	Pin 1: -unused- 		from Control
//	Pin 2: -unused- 		from Control
//	Pin 3: -unused- 		from Control
//	Pin 4: -unused- 		from Control
//	Pin 5: -unused- 		from Control
//	Pin 6: -unused- 		from Control
//	Pin 7: -unused- 		from Control
	ldi R16, 0x00 out DDRD, R16


// Multiplication Answer Result Low8
	clr R0
// Multiplication Answer Result High8
	clr R1
// drop H&V
	.def Blank = R16 ldi R16, 0b00000000
// drop H
	.def DropH = R17 ldi R17, 0b00000001
// drop V
	.def DropV = R18 ldi R18, 0b00000010
// raise H&V
	.def RaiseHV = R19 ldi R19, 0b00000011
// Screen_ScanLineCount (counter used for...)
	.def Screen_ScanLineCount = R20 clr R20
// Screen_ScanLineNumber (number of vertical dots in a Nigel_Pixel (devide number of H_Loops run, by number of NigelPixel rows))
	.def Screen_ScanLineNumber = R21 ldi R21, 0x0E
// Nigel_VerticalPixelLineCount (multiplied by Nigel_HorizontalPixelNumber to determine PixelColourData location to start printing this loop with)
	.def Nigel_VerticalPixelLineCount = R22 clr R22
// Nigel_HorizontalPixelNumber (number of Nigel_Pixels colums in an image)
	.def Nigel_HorizontalPixelNumber = R23 ldi R23, 0x33
// PixelColourData
	.def PixelColourData = R24 clr R24

//Used by 'CollectNextPixel'
	// Disactivate 'Signal Ready'
		clr R2
	// Activate 'Signal Ready'
		ldi R25, 0x20
		mov R3, R25
	// DataUpdateAddressCounter
	.def FreshDataLandingArea = R25 clr R25
		//DataUpdateAddressCounter_High8 = R26 
		clr R26
		inc R26
		//DataUpdateAddressCounter_Low8 = R27 
		clr R27


Loop:
	call V_Loop

	#include "Stuff/10BlankH_Loops.asm"
	#include "Stuff/10BlankH_Loops.asm"
	#include "Stuff/10BlankH_Loops.asm"
	#include "Stuff/10BlankH_Loops.asm"	

	#include "Stuff/100H_Loops.asm"
	#include "Stuff/100H_Loops.asm"
	#include "Stuff/100H_Loops.asm"
	#include "Stuff/100H_Loops.asm"
	#include "Stuff/100H_Loops.asm"
	#include "Stuff/100H_Loops.asm"

	#include "Stuff/10H_Loops.asm"
	#include "Stuff/10H_Loops.asm"	
	#include "Stuff/10H_Loops.asm"
	#include "Stuff/10H_Loops.asm"
	#include "Stuff/10H_Loops.asm"	
		call H_Loop
		call H_Loop
		call H_Loop
		call H_Loop
		call H_Loop

		call H_Loop
		call H_Loop
		call H_Loop
		call H_Loop_Blank
		call H_Loop_Blank

jmp Loop

#include "Loops/V_Loop.asm"
#include "Loops/H_Loop.asm"
#include "Loops/H_Loop_Blank.asm"
#include "Stuff/Wait.asm"
#include "CollectData.asm"
