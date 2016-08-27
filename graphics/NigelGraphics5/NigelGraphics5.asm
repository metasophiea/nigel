//Setoutputs
	ldi R16, 0xFF
	out DDRB, R16
	out DDRD, R16
//Setup pixel data collection
	ldi R30, 0x00
	ldi R31, 0x01
	#include "Includes/ClearMemory.asm"
	//simple print
		//#include "Includes/SimplePrint1.asm"
		#include "Includes/SimplePrint3.asm"

//setup pulses
	ldi R16, 0x00 // drop H&V (All pluse)(also clear)
	ldi R17, 0x01 // drop H   (HSync pulse)
	ldi R18, 0x03 // raise H&V
	ldi R19, 0x03 // raise colour
	ldi R20, 0x02 // drop V   (VSync pulse)

	ldi R21, 0x00 // line count
	ldi R22, 0x00 // we're on:


//using 800x600 resolution

// V_loop
// 20 Black H_loops
// 597 display H_loops
// 82 Black H_loops

//42 coloums
//42 rows

Loop:
	call V_Loop
	#include "Includes/Collections of Loops and Guff Like That/10H_loops_blank.asm"
	#include "Includes/Collections of Loops and Guff Like That/10H_loops_blank.asm"
	
	#include "Includes/Collections of Loops and Guff Like That/10H_loops.asm"
	#include "Includes/Collections of Loops and Guff Like That/10H_loops.asm"
	#include "Includes/Collections of Loops and Guff Like That/10H_loops.asm"
	#include "Includes/Collections of Loops and Guff Like That/10H_loops.asm"
	#include "Includes/Collections of Loops and Guff Like That/10H_loops.asm"
	#include "Includes/Collections of Loops and Guff Like That/10H_loops.asm"
	#include "Includes/Collections of Loops and Guff Like That/10H_loops.asm"
	#include "Includes/Collections of Loops and Guff Like That/10H_loops.asm"
	#include "Includes/Collections of Loops and Guff Like That/10H_loops.asm"
	#include "Includes/Collections of Loops and Guff Like That/10H_loops.asm"

	#include "Includes/Collections of Loops and Guff Like That/10H_loops.asm"
	#include "Includes/Collections of Loops and Guff Like That/10H_loops.asm"
	#include "Includes/Collections of Loops and Guff Like That/10H_loops.asm"
	#include "Includes/Collections of Loops and Guff Like That/10H_loops.asm"
	#include "Includes/Collections of Loops and Guff Like That/10H_loops.asm"
	#include "Includes/Collections of Loops and Guff Like That/10H_loops.asm"
	#include "Includes/Collections of Loops and Guff Like That/10H_loops.asm"
	#include "Includes/Collections of Loops and Guff Like That/10H_loops.asm"
	#include "Includes/Collections of Loops and Guff Like That/10H_loops.asm"
	#include "Includes/Collections of Loops and Guff Like That/10H_loops.asm"

	#include "Includes/Collections of Loops and Guff Like That/10H_loops.asm"
	#include "Includes/Collections of Loops and Guff Like That/10H_loops.asm"
	#include "Includes/Collections of Loops and Guff Like That/10H_loops.asm"
	#include "Includes/Collections of Loops and Guff Like That/10H_loops.asm"
	#include "Includes/Collections of Loops and Guff Like That/10H_loops.asm"
	#include "Includes/Collections of Loops and Guff Like That/10H_loops.asm"
	#include "Includes/Collections of Loops and Guff Like That/10H_loops.asm"
	#include "Includes/Collections of Loops and Guff Like That/10H_loops.asm"
	#include "Includes/Collections of Loops and Guff Like That/10H_loops.asm"
	#include "Includes/Collections of Loops and Guff Like That/10H_loops.asm"

	#include "Includes/Collections of Loops and Guff Like That/10H_loops.asm"
	#include "Includes/Collections of Loops and Guff Like That/10H_loops.asm"
	#include "Includes/Collections of Loops and Guff Like That/10H_loops.asm"
	#include "Includes/Collections of Loops and Guff Like That/10H_loops.asm"
	#include "Includes/Collections of Loops and Guff Like That/10H_loops.asm"
	#include "Includes/Collections of Loops and Guff Like That/10H_loops.asm"
	#include "Includes/Collections of Loops and Guff Like That/10H_loops.asm"
	#include "Includes/Collections of Loops and Guff Like That/10H_loops.asm"
	#include "Includes/Collections of Loops and Guff Like That/10H_loops.asm"
	#include "Includes/Collections of Loops and Guff Like That/10H_loops.asm"

	#include "Includes/Collections of Loops and Guff Like That/10H_loops.asm"
	#include "Includes/Collections of Loops and Guff Like That/10H_loops.asm"
	#include "Includes/Collections of Loops and Guff Like That/10H_loops.asm"
	#include "Includes/Collections of Loops and Guff Like That/10H_loops.asm"
	#include "Includes/Collections of Loops and Guff Like That/10H_loops.asm"
	#include "Includes/Collections of Loops and Guff Like That/10H_loops.asm"
	#include "Includes/Collections of Loops and Guff Like That/10H_loops.asm"
	#include "Includes/Collections of Loops and Guff Like That/10H_loops.asm"
	#include "Includes/Collections of Loops and Guff Like That/10H_loops.asm"
	#include "Includes/Collections of Loops and Guff Like That/10H_loops.asm"

	#include "Includes/Collections of Loops and Guff Like That/10H_loops.asm"
	#include "Includes/Collections of Loops and Guff Like That/10H_loops.asm"
	#include "Includes/Collections of Loops and Guff Like That/10H_loops.asm"
	#include "Includes/Collections of Loops and Guff Like That/10H_loops.asm"
	#include "Includes/Collections of Loops and Guff Like That/10H_loops.asm"
	#include "Includes/Collections of Loops and Guff Like That/10H_loops.asm"
	#include "Includes/Collections of Loops and Guff Like That/10H_loops.asm"

	#include "Includes/Collections of Loops and Guff Like That/10H_loops.asm"
	    call H_loop
	    call H_loop
		call H_Loop
		call H_Loop
		call H_Loop
		call H_Loop
		call H_Loop
		call H_Loop_blank
		call H_Loop_blank
		call H_Loop_blank

	#include "Includes/Collections of Loops and Guff Like That/10H_loops_blank.asm"
	#include "Includes/Collections of Loops and Guff Like That/10H_loops_blank.asm"
	#include "Includes/Collections of Loops and Guff Like That/10H_loops_blank.asm"
	#include "Includes/Collections of Loops and Guff Like That/10H_loops_blank.asm"
	#include "Includes/Collections of Loops and Guff Like That/10H_loops_blank.asm"
	#include "Includes/Collections of Loops and Guff Like That/10H_loops_blank.asm"
	#include "Includes/Collections of Loops and Guff Like That/10H_loops_blank.asm"

	    call H_loop_blank
		call H_Loop_blank
		call H_Loop_blank
		call H_Loop_blank
		call H_Loop_blank
		call H_Loop_blank
		call H_Loop_blank
		call H_Loop_blank
		call H_Loop_blank
jmp Loop

#include "Includes/Loops/H_loop.asm"
#include "Includes/Loops/H_Loop_blank.asm"
#include "Includes/Loops/V_loop.asm"
#include "Includes/Collections of Loops and Guff Like That/wait_16mhz.asm"
