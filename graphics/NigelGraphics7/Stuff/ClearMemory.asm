ldi R30, 0x00
ldi R31, 0x01
//50x40=2000 (0x07D0) "ldi R16, 0x00 st Z+, R16"

ClearMemoryLoop:
//Clearing Type
	call ClearMemory_Toggler

	st Z+, R16

	cpi R31, 0x08 //High8
	brne ClearMemoryLoop_High8NotEqual
		cpi R30, 0xF8 //Low8
		breq ClearMemoryLoop_End		
	ClearMemoryLoop_High8NotEqual:
jmp ClearMemoryLoop
ClearMemoryLoop_End:

ldi R30, 0x00
ldi R31, 0x01




jmp ClearMemory_JumpFunctions
//////////////////////////////////
ClearMemory_BlockColour:
	ldi R16, 0x07
ret
//////////////////////////////////
ClearMemory_Toggler:
	cpi R16, 0x00
	breq ClearMemoryLoop_Toggle_Equal
		ldi R16, 0x00
		jmp ClearMemoryLoop_Toggle_End
	ClearMemoryLoop_Toggle_Equal:
		ldi R16, 0x07 
		jmp ClearMemoryLoop_Toggle_End
	ClearMemoryLoop_Toggle_End:
ret
//////////////////////////////////
ClearMemory_Rounds:
	inc R16
	cpi R16, 0x08
	brne ClearMemory_Rounds_NotEqual
	clr R16
	ClearMemory_Rounds_NotEqual:
ret
//////////////////////////////////
ClearMemory_JumpFunctions: