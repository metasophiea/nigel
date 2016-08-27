ldi R30, 0x00
ldi R31, 0x01
//51x40=2040 (0x07f8, to which you add 0x0100 to get the proper addresses) "ldi R16, 0x00 st Z+, R16"

ldi R16, 0x57

ClearMemoryLoop:
//Clearing Type
	call ClearMemory_HalfToggler

	st Z+, R16

	cpi R31, 0x08 //High8
	brne ClearMemoryLoop_High8NotEqual
		cpi R30, 0xFF //Low8
		breq ClearMemoryLoop_End		
	ClearMemoryLoop_High8NotEqual:
jmp ClearMemoryLoop
ClearMemoryLoop_End:

ldi R30, 0x00
ldi R31, 0x01

jmp ClearMemory_JumpFunctions
//////////////////////////////////
ClearMemory_BlockColour:
	ldi R16, 0x33
ret
//////////////////////////////////
ClearMemory_Toggler:
	cpi R16, 0x57
	breq ClearMemoryLoop_Toggle_Equal
		ldi R16, 0x00
		jmp ClearMemoryLoop_Toggle_End
	ClearMemoryLoop_Toggle_Equal:
		ldi R16, 0x57 
		jmp ClearMemoryLoop_Toggle_End
	ClearMemoryLoop_Toggle_End:
ret
//////////////////////////////////
ClearMemory_Rounds:
	inc R16
	cpi R16, 0x08
	brne ClearMemory_Rounds_0x08_NotEqual
	ldi R16, 0x10
	ClearMemory_Rounds_0x08_NotEqual:

	cpi R16, 0x18
	brne ClearMemory_Rounds_0x18_NotEqual
	ldi R16, 0x20
	ClearMemory_Rounds_0x18_NotEqual:

	cpi R16, 0x28
	brne ClearMemory_Rounds_0x28_NotEqual
	ldi R16, 0x30
	ClearMemory_Rounds_0x28_NotEqual:

	cpi R16, 0x38
	brne ClearMemory_Rounds_0x38_NotEqual
	ldi R16, 0x40
	ClearMemory_Rounds_0x38_NotEqual:

	cpi R16, 0x48
	brne ClearMemory_Rounds_0x48_NotEqual
	ldi R16, 0x50
	ClearMemory_Rounds_0x48_NotEqual:

	cpi R16, 0x58
	brne ClearMemory_Rounds_0x58_NotEqual
	ldi R16, 0x60
	ClearMemory_Rounds_0x58_NotEqual:

	cpi R16, 0x68
	brne ClearMemory_Rounds_0x68_NotEqual
	ldi R16, 0x70
	ClearMemory_Rounds_0x68_NotEqual:

	cpi R16, 0x78
	brne ClearMemory_Rounds_0x78_NotEqual
	ldi R16, 0x00
	ClearMemory_Rounds_0x78_NotEqual:

ret
//////////////////////////////////
ClearMemory_HalfToggler:

	inc R17
	mov R18, R17
	subi R18, 0x33
	brne ClearMemory_HalfToggler_NotEqual	
		
		cpi R16, 0x57
		breq ClearMemory_HalfToggler_Toggle_Equal
			ldi R16, 0x57
			jmp ClearMemory_HalfToggler_Toggle_End
		ClearMemory_HalfToggler_Toggle_Equal:
			ldi R16, 0x00 
			jmp ClearMemory_HalfToggler_Toggle_End
		ClearMemory_HalfToggler_Toggle_End:

		clr R17
	ClearMemory_HalfToggler_NotEqual:
ret
//////////////////////////////////
ClearMemory_JumpFunctions: