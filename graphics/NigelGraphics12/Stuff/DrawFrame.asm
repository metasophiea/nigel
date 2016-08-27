ldi R30, 0x00
ldi R31, 0x01
//51x40=2040 (0x07f8, to which you add 0x0100 to get the proper addresses) "ldi R16, 0x00 st Z+, R16"

/*
DrawFrameLoop:

	cpi R31, 0x01 //High8
	brlo DrawFrame_Frame_LessThan
		cpi R30, 0x28 //Low8
		brlo DrawFrame_Frame_LessThan
		ldi R16, 0x00
		jmp DrawFrame_Frame_GreaterThan
	DrawFrame_Frame_LessThan:
	ldi R16, 0x77
	DrawFrame_Frame_GreaterThan:
	st Z+, R16





	//loop test if finished
	cpi R31, 0x08 //High8
	brne DrawFrameLoop_High8NotEqual
		cpi R30, 0xF8 //Low8
		breq DrawFrameLoop_End		
	DrawFrameLoop_High8NotEqual:

//loop
jmp DrawFrameLoop
DrawFrameLoop_End:
*/
///////////////////// Top Part
ldi R16, 0x27
st Z+, R16
st Z+, R16
st Z+, R16
st Z+, R16
st Z+, R16
st Z+, R16
st Z+, R16
st Z+, R16
st Z+, R16
st Z+, R16

st Z+, R16
st Z+, R16
st Z+, R16
st Z+, R16
st Z+, R16
st Z+, R16
st Z+, R16
st Z+, R16
st Z+, R16
st Z+, R16

st Z+, R16
st Z+, R16
st Z+, R16
st Z+, R16
st Z+, R16
st Z+, R16
st Z+, R16
st Z+, R16
st Z+, R16
st Z+, R16

st Z+, R16
st Z+, R16
st Z+, R16
st Z+, R16
st Z+, R16
st Z+, R16
st Z+, R16
/////////////////////Bottom Part
ldi R30, 0xCE
ldi R31, 0x08
st Z+, R16
st Z+, R16
st Z+, R16
st Z+, R16
st Z+, R16
st Z+, R16
st Z+, R16
st Z+, R16
st Z+, R16
st Z+, R16

st Z+, R16
st Z+, R16
st Z+, R16
st Z+, R16
st Z+, R16
st Z+, R16
st Z+, R16
st Z+, R16
st Z+, R16
st Z+, R16

st Z+, R16
st Z+, R16
st Z+, R16
st Z+, R16
st Z+, R16
st Z+, R16
st Z+, R16
st Z+, R16
st Z+, R16
st Z+, R16

st Z+, R16
st Z+, R16
st Z+, R16
st Z+, R16
st Z+, R16
st Z+, R16
st Z+, R16



ldi R30, 0x00
ldi R31, 0x01

jmp DrawFrame_JumpFunctions
DrawFrame_JumpFunctions: