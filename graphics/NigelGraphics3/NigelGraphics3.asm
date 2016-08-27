// R16 & R17 Horizontal count
	ldi R16, 0x00 //low8
	ldi R17, 0x00 //high8
// R18 & R19 Horizontal limit (one less than you want)
	ldi R18, 0x64 //low8
	ldi R19, 0x01 //high8

	ldi R20, 0x00 // drop H&V (VSynce pluse)
	ldi R21, 0x01 // drop H   (HSync pulse)
	ldi R22, 0x03 // raise H&V

	ldi R23, 0x01 // should I?

//	loop + the four basic actions of H and V loops (there's three in V_loop, so add 2 nops)
// is a total of 2.44us (sometimes losing 0.01us, but we'll see how it goes) thus, 
loop:
//judgement on which loop should be run
//						compare A&C (1)
//			-|NotEqual  				-Equal (1)
//			 |(2)						compare B&D (1)
//			nop (1)			-|NotEqual					-Equal (1)
//			nop (1)			 |(2)						 do it!
//			nop (1)			 nop (1)					 clear R16 (1)				
//			nop (1)			 nop (1)					 clear R17 (1)		
//			|Jump			 |Jump			 			 |Jump
//			|to				 |to						 |to		
//			|end (3)		 |end (3)					 |end (3)
	cp R16, R18	
	brne NotEqual1
		cp R17, R19
		brne NotEqual2
			inc R23
			clr R16
			clr R17
		NotEqual2:
		jmp EndEqual
	NotEqual1:
		nop
		nop
		nop
		nop
		jmp EndEqual
	EndEqual:

//running either loop
//						compare R23 & 0 (1)
//			 -|NotEqual  					-Equal (1)		
//			  |(2)							 nop (1)
//			  Call V Loop (x)				 Call H Loop (x)
//			  clr R23					     clr R23
//			  |Jump 					     |Jump
//			  |to						     |to	
//			  |end (3)						 |end (3)
	cpi R23, 0x00
	brne NotEqual3
		nop
		call H_Loop
		clr R23
		jmp NotEqual3_end
	NotEqual3:
		call V_Loop
		clr R23
		jmp NotEqual3_end
	NotEqual3_end:

//incrimentation
	inc R16
	brne NoCarry
		inc R17
		nop
		jmp EndCarry
	NoCarry:
		nop
		jmp EndCarry
	EndCarry:
jmp loop

#include "Includes/H_loop.asm"
#include "Includes/V_loop.asm"
#include "Includes/wait_16mhz.asm"
