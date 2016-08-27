//using 800x600 resolution
// Max memory 2048bytes (0x0800)
//
// so, 51*40 NigelPixels results in a 1.275 aspect ratio
// (that's 51 colums and 40 rows) 
// 2040 pixels, same amount of bytes requred
//
// Pixel data is 3 bits long, so we can store two pixels per byte, effectively doubling the storage space
// 2048 becomes 4096
//
// 74*55 NigelPixels results in a 1.3454545.. aspect ratio, with in 4070 NigelPixels, using 2035 bytes
// (that's 74 colums and 55 rows) 

// V_loop
// 60 Blank H_loops
// 608 display H_loops
// 22 Blank H_loops 
//	691 total

#include "Stuff/ClearMemory.asm"
#include "Stuff/DrawFrame.asm"

// Chip Pin Array B: Colour Control (Output)
//	(6 pin) 
//	Pin 0: -clock out-
//	Pin 1: V_Sync 		to screen
//	Pin 2: H_Sync 		to screen
//	Pin 3: -unused-
//	Pin 4: -unused-
//	Pin 5: -unused-		
	ldi R16, 0x06 out DDRB, R16
// Chip Pin Array C: Sync Control (Output)
//	(6 pin) 
//	Pin 0: Red Out		to screen
//	Pin 1: Green Out 	to screen
//	Pin 2: Blue Out 	to screen
//	Pin 3: -unused-
//	Pin 4: -unused-	
//	Pin 5: -unused-		;Signal Ready to Control
	ldi R16, 0x27 out DDRC, R16
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
	ldi R16, 0xFF out PortD, R16

// Multiplication Answer Result Low8
	clr R0
// Multiplication Answer Result High8
	clr R1
//Used by 'CollectNextPixel'
	// Disactivate 'Signal Ready'
		clr R2
	// Activate 'Signal Ready'
		ldi R25, 0x20
		mov R3, R25
// drop H&V
	.def Blank = R16 ldi R16, 0b00000000
// drop H
	.def DropH = R17 ldi R17, 0b00000010
// drop V
	.def DropV = R18 ldi R18, 0b00000100
// raise H&V
	.def RaiseHV = R19 ldi R19, 0b00000110
// Screen_ScanLineCount (counter used for...)
	.def Screen_ScanLineCount = R20 clr R20
// Screen_ScanLineNumber (number of vertical dots in a Nigel_Pixel (devide number of H_Loops run, by number of NigelPixel rows, then take away 3...for this this specific instance))
	.def Screen_ScanLineNumber = R21 ldi R21, 0x09
// Nigel_VerticalPixelLineCount (multiplied by Nigel_HorizontalPixelNumber to determine PixelColourData location to start printing this loop with)
	.def Nigel_VerticalPixelLineCount = R22 clr R22
// Nigel_HorizontalPixelNumber (number of Nigel_Pixels colums in an image)
	.def Nigel_HorizontalPixelNumber = R23 ldi R23, 0x25
// PixelColourData
	.def PixelColourData = R24 clr R24



	// DataUpdate
	.def FreshDataLandingArea = R25 clr R25
		//AddressCounter	
			clr R26 //Z Store High8
			clr R27 //Z Store Low8
			inc R26 
//Used by 'CollectDataChunk Bytes'
	;.def BlenderByte = R28
	clr R28

Loop:
	call V_Loop

	#include "Stuff/10BlankH_Loops.asm"
	#include "Stuff/10BlankH_Loops.asm"
	#include "Stuff/10BlankH_Loops.asm"
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
	#include "Stuff/10BlankH_Loops.asm"	
	#include "Stuff/10BlankH_Loops.asm"
		
	
jmp Loop

#include "Loops/V_Loop.asm"
#include "Loops/H_Loop.asm"
#include "Loops/H_Loop_Blank.asm"
#include "Stuff/Wait.asm"
#include "CollectData/CollectData.asm"
;#include "CollectData2/CollectData2.asm"
#include "CollectData/CollectDataChunk.asm"
