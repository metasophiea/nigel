//7.33333.. clock cycles to reach call stage (0.44)
// another 3 clock ticks for call to here (0.18)
// 10.33333.. total

//given 15 tick buffer

//using X pointer
PCINT1Change:
	//Dissable Global Interrupts
	CLI //(1)
	
	nop nop nop nop
//Go!
	#include "SendData\1000SendDataLoops.asm"
	#include "SendData\1000SendDataLoops.asm"
	#include "SendData\10SendDataLoops.asm"
	#include "SendData\10SendDataLoops.asm"
	#include "SendData\10SendDataLoops.asm"
	#include "SendData\10SendDataLoops.asm"
//Stop!
	
	//Clear
	ldi R16, 0x00 out PortD, R16

	//Enable Global Interrupts
	SEI

	//Reset X Pointer
	ldi R26, 0x00
	ldi R27, 0x01
ret