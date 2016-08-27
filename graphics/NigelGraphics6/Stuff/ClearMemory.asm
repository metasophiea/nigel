/*
ldi R16, 0x00
ClearMemoryLoop:
	st Z+, R16
	cpi R30, 0xE4
	breq ClearMemoryLoop_TestHigh8
		jmp ClearMemoryLoop
	ClearMemoryLoop_TestHigh8:
	cpi R31, 0x06
	breq ClearMemoryLoop_End
	jmp ClearMemoryLoop
ClearMemoryLoop_End:

	ldi R30, 0x00
	ldi R31, 0x01
*/

ldi R30, 0x00
ldi R31, 0x01
//51x40=2040 (0x07F8) "ldi R16, 0x00 st Z+, R16"
	ldi R16, 0x02

ClearMemoryLoop:
	ldi R16, 0x01
	st Z+, R16

	/*cpi R16, 0x00
	breq ClearMemoryLoop_Toggle_Equal
		ldi R16, 0x00
		jmp ClearMemoryLoop_Toggle_End
	ClearMemoryLoop_Toggle_Equal:
		ldi R16, 0x07 
		jmp ClearMemoryLoop_Toggle_End
	ClearMemoryLoop_Toggle_End:*/

	cpi R31, 0x08 //High8
	brne ClearMemoryLoop_High8NotEqual
		cpi R30, 0xF8 //Low8
		breq ClearMemoryLoop_End		
	ClearMemoryLoop_High8NotEqual:
jmp ClearMemoryLoop
ClearMemoryLoop_End:

ldi R30, 0x00
ldi R31, 0x01