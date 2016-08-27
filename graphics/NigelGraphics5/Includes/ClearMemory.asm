call ClearMemory_FourtyTwoPaints
call ClearMemory_FourtyTwoPaints
call ClearMemory_FourtyTwoPaints
call ClearMemory_FourtyTwoPaints
call ClearMemory_FourtyTwoPaints
call ClearMemory_FourtyTwoPaints
call ClearMemory_FourtyTwoPaints
call ClearMemory_FourtyTwoPaints
call ClearMemory_FourtyTwoPaints
call ClearMemory_FourtyTwoPaints

call ClearMemory_FourtyTwoPaints
call ClearMemory_FourtyTwoPaints
call ClearMemory_FourtyTwoPaints
call ClearMemory_FourtyTwoPaints
call ClearMemory_FourtyTwoPaints
call ClearMemory_FourtyTwoPaints
call ClearMemory_FourtyTwoPaints
call ClearMemory_FourtyTwoPaints
call ClearMemory_FourtyTwoPaints
call ClearMemory_FourtyTwoPaints

call ClearMemory_FourtyTwoPaints
call ClearMemory_FourtyTwoPaints
call ClearMemory_FourtyTwoPaints
call ClearMemory_FourtyTwoPaints
call ClearMemory_FourtyTwoPaints
call ClearMemory_FourtyTwoPaints
call ClearMemory_FourtyTwoPaints
call ClearMemory_FourtyTwoPaints
call ClearMemory_FourtyTwoPaints
call ClearMemory_FourtyTwoPaints

call ClearMemory_FourtyTwoPaints
call ClearMemory_FourtyTwoPaints
call ClearMemory_FourtyTwoPaints
call ClearMemory_FourtyTwoPaints
call ClearMemory_FourtyTwoPaints
call ClearMemory_FourtyTwoPaints
call ClearMemory_FourtyTwoPaints
call ClearMemory_FourtyTwoPaints
call ClearMemory_FourtyTwoPaints
call ClearMemory_FourtyTwoPaints

call ClearMemory_FourtyTwoPaints
call ClearMemory_FourtyTwoPaints

ldi R30, 0x00
ldi R31, 0x01


jmp ClearMemory_SkipFunctions

ClearMemory_FourtyTwoPaints:
	ldi R16, 0x00 st Z+, R16
	ldi R16, 0x00 st Z+, R16
	ldi R16, 0x00 st Z+, R16
	ldi R16, 0x00 st Z+, R16
	ldi R16, 0x00 st Z+, R16
	ldi R16, 0x00 st Z+, R16
	ldi R16, 0x00 st Z+, R16
	ldi R16, 0x00 st Z+, R16
	ldi R16, 0x00 st Z+, R16
	ldi R16, 0x00 st Z+, R16
	ldi R16, 0x00 st Z+, R16
	ldi R16, 0x00 st Z+, R16
	ldi R16, 0x00 st Z+, R16
	ldi R16, 0x00 st Z+, R16
	ldi R16, 0x00 st Z+, R16
	ldi R16, 0x00 st Z+, R16
	ldi R16, 0x00 st Z+, R16
	ldi R16, 0x00 st Z+, R16
	ldi R16, 0x00 st Z+, R16
	ldi R16, 0x00 st Z+, R16
	ldi R16, 0x00 st Z+, R16
	ldi R16, 0x00 st Z+, R16
	ldi R16, 0x00 st Z+, R16
	ldi R16, 0x00 st Z+, R16
	ldi R16, 0x00 st Z+, R16
	ldi R16, 0x00 st Z+, R16
	ldi R16, 0x00 st Z+, R16
	ldi R16, 0x00 st Z+, R16
	ldi R16, 0x00 st Z+, R16
	ldi R16, 0x00 st Z+, R16
	ldi R16, 0x00 st Z+, R16
	ldi R16, 0x00 st Z+, R16
	ldi R16, 0x00 st Z+, R16
	ldi R16, 0x00 st Z+, R16
	ldi R16, 0x00 st Z+, R16
	ldi R16, 0x00 st Z+, R16
	ldi R16, 0x00 st Z+, R16
	ldi R16, 0x00 st Z+, R16
	ldi R16, 0x00 st Z+, R16
	ldi R16, 0x00 st Z+, R16
	ldi R16, 0x00 st Z+, R16
	ldi R16, 0x00 st Z+, R16
ret
ClearMemory_SkipFunctions:


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