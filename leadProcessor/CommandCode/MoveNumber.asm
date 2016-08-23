; -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -> move number
//puts the number N in file F
//uses R16
putNinF:
;use program counter to select the first input
	call UPCTSTFI
	//load input 1 into var 1 (R16)
	ld R16, Z
;select the next input
	call STNI
;load Y pointer with what Z is pointing at
	call LYPWWZIPA

	//put var 1 (R16) into Y
	st Y, R16

	//add 5 to program counter
	sbr R25, 5
	add R0, R25
	jmp discover
	;end

//puts value in file f in file f
//uses R16
putFinF:
;use program counter to select the first input
	call UPCTSTFI
;load Y with what Z is pointing at
	call LYPWWZIPA
	//move value of input 1 file into var 1 (R16)
	ld R16, y
;select the next input
	call STNI
;load Y pointer with what Z is pointing at
	call LYPWWZIPA

	//put var 1 (R16) into Y
	st Y, R16

	//add 6 to program counter
	sbr R25, 6
	add R0, R25
	jmp discover
	;end