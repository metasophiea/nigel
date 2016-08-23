 ; -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -> bitwise opperations
// sets bit number N in file F
// uses R16, 17
SetFbit:
;use program counter to select the first input
	call UPCTSTFI
;load Y pointer with what Z is pointing at
	call LYPWWZIPA
	//move value of input 1 file to var 1 (R16)
	ld R16, y
;select the next input
	call STNI
	//move input 2 to var 2 (R17)
	ld R17, z

	//compare var 2 with each possible number
	//when matching, jump to setting phase
	cpi R17, 0
	breq SetFbit_bit0
	cpi R17, 1
	breq SetFbit_bit1
	cpi R17, 2
	breq SetFbit_bit2
	cpi R17, 3
	breq SetFbit_bit3
	cpi R17, 4
	breq SetFbit_bit4
	cpi R17, 5
	breq SetFbit_bit5
	cpi R17, 6
	breq SetFbit_bit6
	cpi R17, 7
	breq SetFbit_bit7

	//setting phase
	//set appropiate bit and jump to end
SetFbit_bit0:
		ori R16, 1
		jmp SetFbit_Jump
SetFbit_bit1:
		ori R16, 2
		jmp SetFbit_Jump
SetFbit_bit2:
		ori R16, 4
		jmp SetFbit_Jump
SetFbit_bit3:
		ori R16, 8
		jmp SetFbit_Jump
SetFbit_bit4:
		ori R16, 16
		jmp SetFbit_Jump
SetFbit_bit5:
		ori R16, 32
		jmp SetFbit_Jump
SetFbit_bit6:
		ori R16, 64
		jmp SetFbit_Jump
SetFbit_bit7:
		ori R16, 128
		jmp SetFbit_Jump

SetFbit_Jump:
	//store var 1 back in file
	st Y, R16
	//add 5 to program counter
	sbr R25, 5
	add R0, R25
	jmp discover
	;end

// clears bit number N in file F
// uses R16, 17
ClearFbit:
;use program counter to select the first input
	call UPCTSTFI
;load Y pointer with what Z is pointing at
	call LYPWWZIPA
	//move value of input 1 file to var 1 (R16)
	ld R16, y
;select the next input
	call STNI
	//move input 2 to var 2 (R17)
	ld R17, z

	//compare var 2 with each possible number
	//when matching, jump to setting phase
	cpi R17, 0
	breq ClearFbit_bit0
	cpi R17, 1
	breq ClearFbit_bit1
	cpi R17, 2
	breq ClearFbit_bit2
	cpi R17, 3
	breq ClearFbit_bit3
	cpi R17, 4
	breq ClearFbit_bit4
	cpi R17, 5
	breq ClearFbit_bit5
	cpi R17, 6
	breq ClearFbit_bit6
	cpi R17, 7
	breq ClearFbit_bit7

	//setting phase
	//set appropiate bit and jump to end
ClearFbit_bit0:
		andi R16, 0x00fe
		jmp ClearFbit_Jump
ClearFbit_bit1:
		andi R16, 0x00fd
		jmp ClearFbit_Jump
ClearFbit_bit2:
		andi R16, 0x00fb
		jmp ClearFbit_Jump
ClearFbit_bit3:
		andi R16, 0x00f7
		jmp ClearFbit_Jump
ClearFbit_bit4:
		andi R16, 0x00ef
		jmp ClearFbit_Jump
ClearFbit_bit5:
		andi R16, 0x00df
		jmp ClearFbit_Jump
ClearFbit_bit6:
		andi R16, 0x00bf
		jmp ClearFbit_Jump
ClearFbit_bit7:
		andi R16, 0x007f
		jmp ClearFbit_Jump

ClearFbit_Jump:
	//store var 1 back in file
	st Y, R16
	//add 5 to program counter
	sbr R25, 5
	add R0, R25
	jmp discover
	;end

// shifts bits in file F to the left
// uses R16
BitShiftFLeft:
;use program counter to select the first input
	call UPCTSTFI
;load Y pointer with what Z is pointing at
	call LYPWWZIPA
	//move value of input 1 file to var 1 (R16)
	ld R16, y

	//clear carry
	clc
	//shift var 1 (R16) to the left
	lsl R16
	brcc BitShiftFLeft_Jump
		inc R16
BitShiftFLeft_Jump:
	//store var 1 back in file
	st Y, R16

	//add 4 to program counter
	sbr R25, 4
	add R0, R25
	jmp discover
	;end

// shifts bits in file F to the right
// uses R16
BitShiftFRight:
;use program counter to select the first input
	call UPCTSTFI
;load Y pointer with what Z is pointing at
	call LYPWWZIPA
	//move value of input 1 file to var 1 (R16)
	ld R16, y

	//clear carry
	clc
	//shift var 1 (R16) to the left
	lsr R16
	brcc BitShiftFRight_Jump
		subi R16, -0x0080
BitShiftFRight_Jump:
	//store var 1 back in file
	st Y, R16

	//add 4 to program counter
	sbr R25, 4
	add R0, R25
	jmp discover
	;end


// swaps nibbles in file F
// uses R16
SwapNibblesInF:
;use program counter to select the first input
	call UPCTSTFI
;load Y with what Z is pointing at
	call LYPWWZIPA
	//move value of input 1 file to var 1 (R16)
	ld R16, y
	//swap nibbles
	swap R16

	//store var 1 back in file
	st Y, R16

	//add 4 to program counter
	sbr R25, 4
	add R0, R25
	jmp discover
	;end

//makes the value in file F negitive
//uses R16
FlipBits:
;use program counter to select the first input
	call UPCTSTFI
	
;load Y pointer with what Z is pointing at
	call LYPWWZIPA

	//move value of input 1 file into var 1 (R16)
	ld R16, Y

	//make negitive
	com R16

	//put var 1 (R16) into Y
	st Y, R16

	//add 4 to program counter
	sbr R25, 4
	add R0, R25
	jmp discover
	;end	


	;end