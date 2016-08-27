ldi R16, 0x01
sts 0x0100, R16

//Setoutputs
	ldi R16, 0xFF
	//out DDRB, R16
	out DDRD, R16
//setup pulses
	ldi R16, 0x00 // drop H&V (VSynce pluse)
	ldi R17, 0x01 // drop H   (HSync pulse)
	ldi R18, 0x03 // raise H&V
	ldi R19, 0x03 // raise colour

//Setup pixel retrieval
ldi R30, 0x17
ldi R31, 0x01
clr R20 ;pixel landing area
ldi R21, 0x0F

// 800x600
//	V_loop, then 599 H_loops

loop:
	call BeginingH_Loop
	#include "Includes/22H_loops.asm"
	call SpecialH_loop
	#include "Includes/23H_loops.asm"
	call SpecialH_loop
	#include "Includes/23H_loops.asm"
	call SpecialH_loop
	#include "Includes/23H_loops.asm"
	call SpecialH_loop
	#include "Includes/23H_loops.asm"
	call SpecialH_loop
	#include "Includes/23H_loops.asm"
	call SpecialH_loop
	#include "Includes/23H_loops.asm"
	call SpecialH_loop
	#include "Includes/23H_loops.asm"
	call SpecialH_loop
	#include "Includes/23H_loops.asm"
	call SpecialH_loop
	#include "Includes/23H_loops.asm"
	call SpecialH_loop

	#include "Includes/23H_loops.asm"
	call SpecialH_loop
	#include "Includes/23H_loops.asm"
	call SpecialH_loop
	#include "Includes/23H_loops.asm"
	call SpecialH_loop
	#include "Includes/23H_loops.asm"
	call SpecialH_loop
	#include "Includes/23H_loops.asm"
	call SpecialH_loop
	#include "Includes/23H_loops.asm"
	call SpecialH_loop
	#include "Includes/23H_loops.asm"
	call SpecialH_loop
	#include "Includes/23H_loops.asm"
	call SpecialH_loop
	#include "Includes/23H_loops.asm"
	call SpecialH_loop
	#include "Includes/23H_loops.asm"
	call SpecialH_loop

	#include "Includes/23H_loops.asm"
	call SpecialH_loop
	#include "Includes/23H_loops.asm"
	call SpecialH_loop
	#include "Includes/23H_loops.asm"
	call SpecialH_loop
	#include "Includes/23H_loops.asm"
	call SpecialH_loop
	#include "Includes/23H_loops.asm"
	call V_loop
jmp loop

//time: 16 ticks - 0.96us
GetNextPixel:
	ld R20, Z+	//collect pixel
	lsl R20		//allign and insert into 'raise colour'
	lsl R20
	lsl R20
	lsl R20
	ldi R19, 0x03
	or R19, R20
ret

#include "Includes/H_loop.asm"
#include "Includes/V_loop.asm"
#include "Includes/SpecialH_loop.asm"
#include "Includes/BeginingH_loop.asm"
#include "Includes/wait_16mhz.asm"
