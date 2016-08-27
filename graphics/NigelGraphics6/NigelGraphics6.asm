//using 800x600 resolution
//		LoopLayout
//			V_loop
//			20 Black H_loops
//			597	display H_loops
//			82 Black H_loops
//		Currently Outputting
//			57 coloums of pixels (of a potential 96 (if I had the memory))
//			40 rows of pixels

// Max memory 2048bytes (0x0800)

#include "Stuff/ClearMemory.asm"

// Chip Output Array B: Colour Control
	ldi R16, 0xFF out DDRB, R16
// Chip Output Array C: Sync Control
	ldi R16, 0xFF out DDRC, R16
// Chip Output Array D: Data Port
	ldi R16, 0x00 out DDRD, R16

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
// Screen_ScanLineNumber (number of vertical dots in a Nigel_Pixel)
	.def Screen_ScanLineNumber = R21 ldi R21, 0x0C
// Nigel_VerticalPixelLineCount (multiplied by Nigel_HorizontalPixelNumber to determine PixelColourData location to start printing this loop with)
	.def Nigel_VerticalPixelLineCount = R22 clr R22
// Nigel_HorizontalPixelNumber (number of horizontal Nigel_Pixels in an image)
	.def Nigel_HorizontalPixelNumber = R23 ldi R23, 0x33
// PixelColourData
	.def PixelColourData = R24 clr R24

// V_loop
// 20 Blank H_loops
// 600 display H_loops
// 80 Blank H_loops

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

		#include "Stuff/10H_Loops.asm"
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

	#include "Stuff/10BlankH_Loops.asm"
	#include "Stuff/10BlankH_Loops.asm"
	#include "Stuff/10BlankH_Loops.asm"

	#include "Stuff/10BlankH_Loops.asm" 
	#include "Stuff/10BlankH_Loops.asm"
	#include "Stuff/10BlankH_Loops.asm" 
	#include "Stuff/10BlankH_Loops.asm"
	#include "Stuff/10BlankH_Loops.asm" 
	#include "Stuff/10BlankH_Loops.asm"
jmp Loop

#include "Loops/V_Loop.asm"
#include "Loops/H_Loop.asm"
#include "Loops/H_Loop_Blank.asm"
#include "Stuff/Wait.asm"
