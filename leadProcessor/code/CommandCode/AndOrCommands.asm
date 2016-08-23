; -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -> AND/OR Commands
//Ands N with the value in file F, and puts result in F
//uses R16, R17
AndNwithF:
;use program counter to select the first input
	call UPCTSTFI
	//move value of input 1 file into var 1 (R16)
	ld R16, Z
;select the next input
	call STNI
;load Y pointer with what Z is pointing at
	call LYPWWZIPA
	//move value of input 2 file into var 2 (R17)
	ld R17, y

	//And R16 with R17
	and R16, R17

	//put var 1 (R16) into Y
	st Y, R16

	//add 5 to program counter
	sbr R25, 5
	add R0, R25
	jmp discover
	;end

//Ands file F with file F, and places result in second F
//uses R16, R17
AndFwithF:
;use program counter to select the first input
	call UPCTSTFI
;load Y pointer with what Z is pointing at
	call LYPWWZIPA	
	//move value of input 1 file into var 1 (R16)
	ld R16, Y
;select the next input
	call STNI
	;load Y pointer with what Z is pointing at
	call LYPWWZIPA
	//move value of input 2 file into var 2 (R17)
	ld R17, Y

	//And R16 with R17
	and R16, R17

	//put var 1 (R16) into Y
	st Y, R16

	//add 6 to program counter
	sbr R25, 6
	add R0, R25
	jmp discover
	;end

//NAnds N with the value in file F, and puts result in F
//uses R16, R17
NAndNwithF:
;use program counter to select the first input
	call UPCTSTFI
	//move value of input 1 file into var 1 (R16)
	ld R16, Z
;select the next input
	call STNI
;load Y pointer with what Z is pointing at
	call LYPWWZIPA
	//move value of input 2 file into var 2 (R17)
	ld R17, y

	//And R16 with R17
	and R16, R17
	//Flip R16
	com R16

	//put var 1 (R16) into Y
	st Y, R16

	//add 5 to program counter
	sbr R25, 5
	add R0, R25
	jmp discover
	;end

//NAnds file F with file F, and places result in second F
//uses R16, R17
NAndFwithF:
;use program counter to select the first input
	call UPCTSTFI
;load Y pointer with what Z is pointing at
	call LYPWWZIPA	
	//move value of input 1 file into var 1 (R16)
	ld R16, Y
;select the next input
	call STNI
	;load Y pointer with what Z is pointing at
	call LYPWWZIPA
	//move value of input 2 file into var 2 (R17)
	ld R17, Y

	//And R16 with R17
	and R16, R17
	//Flip R16
	com R16

	//put var 1 (R16) into Y
	st Y, R16

	//add 6 to program counter
	sbr R25, 6
	add R0, R25
	jmp discover
	;end

//Ors N with the value in file F, and puts result in F
//uses R16, R17
OrNwithF:
;use program counter to select the first input
	call UPCTSTFI
	//move value of input 1 file into var 1 (R16)
	ld R16, Z
;select the next input
	call STNI
;load Y pointer with what Z is pointing at
	call LYPWWZIPA
	//move value of input 2 file into var 2 (R17)
	ld R17, y

	//or R16 with R17
	or R16, R17

	//put var 1 (R16) into Y
	st Y, R16

	//add 5 to program counter
	sbr R25, 5
	add R0, R25
	jmp discover
	;end

//Ors file F with file F, and places result in second F
//uses R16, R17
OrFwithF:
;use program counter to select the first input
	call UPCTSTFI
;load Y pointer with what Z is pointing at
	call LYPWWZIPA	
	//move value of input 1 file into var 1 (R16)
	ld R16, Y
;select the next input
	call STNI
;load Y pointer with what Z is pointing at
	call LYPWWZIPA
	//move value of input 2 file into var 2 (R17)
	ld R17, Y

	//or R16 with R17
	or R16, R17

	//put var 1 (R16) into Y
	st Y, R16

	//add 6 to program counter
	sbr R25, 6
	add R0, R25
	jmp discover
	;end

//NOrs N with the value in file F, and puts result in F
//uses R16, R17
NOrNwithF:
;use program counter to select the first input
	call UPCTSTFI
	//move value of input 1 file into var 1 (R16)
	ld R16, Z
;select the next input
	call STNI
;load Y pointer with what Z is pointing at
	call LYPWWZIPA
	//move value of input 2 file into var 2 (R17)
	ld R17, y

	//or R16 with R17
	or R16, R17
	//Flip R16
	com R16

	//put var 1 (R16) into Y
	st Y, R16

	//add 5 to program counter
	sbr R25, 5
	add R0, R25
	jmp discover
	;end

//NOrs file F with file F, and places result in second F
//uses R16, R17
NOrFwithF:
;use program counter to select the first input
	call UPCTSTFI
;load Y pointer with what Z is pointing at
	call LYPWWZIPA	
	//move value of input 1 file into var 1 (R16)
	ld R16, Y
;select the next input
	call STNI
;load Y pointer with what Z is pointing at
	call LYPWWZIPA
	//move value of input 2 file into var 2 (R17)
	ld R17, Y

	//or R16 with R17
	or R16, R17
	//Flip R16
	com R16

	//put var 1 (R16) into Y
	st Y, R16

	//add 6 to program counter
	sbr R25, 6
	add R0, R25
	jmp discover
	;end

//EOrs N with the value in file F, and puts result in F
//uses R16, R17
EOrNwithF:
;use program counter to select the first input
	call UPCTSTFI
	//move value of input 1 file into var 1 (R16)
	ld R16, Z
;select the next input
	call STNI
;load Y pointer with what Z is pointing at
	call LYPWWZIPA
	//move value of input 2 file into var 2 (R17)
	ld R17, y

	//EOr R16 with R17
	eor R16, R17

	//put var 1 (R16) into Y
	st Y, R16

	//add 5 to program counter
	sbr R25, 5
	add R0, R25
	jmp discover
	;end

//EOrs file F with file F, and places result in second F
//uses R16, R17
EOrFwithF:
;use program counter to select the first input
	call UPCTSTFI
;load Y pointer with what Z is pointing at
	call LYPWWZIPA	
	//move value of input 1 file into var 1 (R16)
	ld R16, Y
;select the next input
	call STNI
;load Y pointer with what Z is pointing at
	call LYPWWZIPA
	//move value of input 2 file into var 2 (R17)
	ld R17, Y

	//EOr R16 with R17
	eor R16, R17

	//put var 1 (R16) into Y
	st Y, R16

	//add 6 to program counter
	sbr R25, 6
	add R0, R25
	jmp discover
	;end

//NEOrs N with the value in file F, and puts result in F
//uses R16, R17
NEOrNwithF:
;use program counter to select the first input
	call UPCTSTFI
	//move value of input 1 file into var 1 (R16)
	ld R16, Z
;select the next input
	call STNI
;load Y pointer with what Z is pointing at
	call LYPWWZIPA
	//move value of input 2 file into var 2 (R17)
	ld R17, y

	//EOr R16 with R17
	eor R16, R17
	//Flip R16
	com R16

	//put var 1 (R16) into Y
	st Y, R16

	//add 5 to program counter
	sbr R25, 5
	add R0, R25
	jmp discover
	;end

//NEOrs file F with file F, and places result in second F
//uses R16, R17
NEOrFwithF:
;use program counter to select the first input
	call UPCTSTFI
;load Y pointer with what Z is pointing at
	call LYPWWZIPA	
	//move value of input 1 file into var 1 (R16)
	ld R16, Y
;select the next input
	call STNI
;load Y pointer with what Z is pointing at
	call LYPWWZIPA
	//move value of input 2 file into var 2 (R17)
	ld R17, Y

	//EOr R16 with R17
	eor R16, R17
	//Flip R16
	com R16

	//put var 1 (R16) into Y
	st Y, R16

	//add 6 to program counter
	sbr R25, 6
	add R0, R25
	jmp discover
	;end