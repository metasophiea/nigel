//7.33333.. clock cycles to reach call stage (0.44)
// another 3 clock ticks for call to here (0.18)
// 10.33333.. total

//given 15 tick buffer

//using X pointer
PCINT1Change:
	//Dissable Global Interrupts
	CLI //(1)
	
	

//Go!

	ld R16, X+ out PortD, R16

	;#include "SendData\1000SendDataLoops.asm"
	;#include "SendData\1000SendDataLoops.asm"
	;#include "SendData\10SendDataLoops.asm"
	;#include "SendData\10SendDataLoops.asm"
	;#include "SendData\10SendDataLoops.asm"
	;#include "SendData\10SendDataLoops.asm"
//Stop!
	
	//Clear
	//ldi R16, 0x00 out PortD, R16

	//Enable Global Interrupts
	SEI

	//Clean Pointer
	 cpi R26, 0x08
	breq PCINT1Change_Cleanpointer_High8_Equal	
		jmp PCINT1Change_Cleanpointer_End
	PCINT1Change_Cleanpointer_High8_Equal:
		cpi R27, 0xF8
		breq PCINT1Change_Cleanpointer_Low8_Equal
			jmp PCINT1Change_Cleanpointer_End
		PCINT1Change_Cleanpointer_Low8_Equal:
			clr R26
			clr R27
			inc R26 
	PCINT1Change_Cleanpointer_End:


	//Reset X Pointer
	;ldi R26, 0x00
	;ldi R27, 0x01
ret