; -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -> If Statements
IsN_F:
	;use program counter to select the first input
		call UPCTSTFI	
	//move value of 'Com' into var 1 (R16)
		ld R16, Z
	;select the next input
		call STNI
	//move value of 'N' into var 2 (R17)
		ld R17, Z
	;select the next input
		call STNI
	;load Y pointer with what Z is pointing at
		call LYPWWZIPA
	//move value of file F into var 3 (R18)
		ld R18, Y
	;select the next input
		call STNI
	//move file that Z points at, into R24 & R25
		ld R25, Z+
		ld R24, Z
		dec R30

		//compare var 1 with each possible number
		//upon match, jump to judgement phase
		cpi R16, 0
		breq IsN_F_com0
		cpi R16, 1
		breq IsN_F_com1
		cpi R16, 2
		breq IsN_F_com2
		cpi R16, 3
		breq IsN_F_com3
		cpi R16, 4
		breq IsN_F_com4
		cpi R16, 5
		breq IsN_F_com5
		//error: invalid judgement command entered, forcing 'false'
		jmp IsN_F_False

		//judgement phase
		//conduct appropiate judgement and jump to end
	IsN_F_com0: ;equal
		//subtract var 3 from var 1 
			sub R17, R18
			breq IsN_F_True
			jmp IsN_F_False
	IsN_F_com1: ;greater than
		//subtract var 3 from var 1 
			sub R18, R17
			brlo IsN_F_True		
			jmp IsN_F_False
	IsN_F_com2: ;less than
		//subtract var 3 from var 1 
			sub R17, R18
			brlo IsN_F_True		
			jmp IsN_F_False
	IsN_F_com3: ;greater than or equal to
		//subtract var 3 from var 1 
			sub R17, R18
			brsh IsN_F_True	
			jmp IsN_F_False
	IsN_F_com4: ;less than or equal to
		//subtract var 3 from var 1 
			sub R18, R17
			brsh IsN_F_True
			jmp IsN_F_False
	IsN_F_com5: ;not equal to
		//subtract var 3 from var 1 
			sub R17, R18
			brne IsN_F_True
			jmp IsN_F_False

	// if false
	IsN_F_False:
		mov R1, R25
		mov R0, R24
		dec R1
		clc
		clz
		jmp discover	

	//if true
	//add 8 to program counter
	IsN_F_true:
		ldi R25, 8
		add R0, R25
		jmp discover
;end

IsF_F:
	;use program counter to select the first input
		call UPCTSTFI	
	//move value of 'Com' into var 1 (R16)
		ld R16, Z
	;select the next input
		call STNI
	;load Y pointer with what Z is pointing at
		call LYPWWZIPA
	//move value of 'N' into var 2 (R17)
		ld R17, Y
	;select the next input
		call STNI
	;load Y pointer with what Z is pointing at
		call LYPWWZIPA
	//move value of file F into var 3 (R18)
		ld R18, Y
	;select the next input
		call STNI
	//move file that Z points at, into R24 & R25
		ld R25, Z+
		ld R24, Z
		dec R30

		//compare var 1 with each possible number
		//upon match, jump to judgement phase
		cpi R16, 0
		breq IsF_F_com0
		cpi R16, 1
		breq IsF_F_com1
		cpi R16, 2
		breq IsF_F_com2
		cpi R16, 3
		breq IsF_F_com3
		cpi R16, 4
		breq IsF_F_com4
		cpi R16, 5
		breq IsF_F_com5
		//error: invalid judgement command entered, forcing 'false'
		jmp IsF_F_False

		//judgement phase
		//conduct appropiate judgement and jump to end
	IsF_F_com0: ;equal
		//subtract var 3 from var 1 
			sub R17, R18
			breq IsF_F_True
			jmp IsF_F_False
	IsF_F_com1: ;greater than
		//subtract var 3 from var 1 
			sub R18, R17
			brlo IsF_F_True		
			jmp IsF_F_False
	IsF_F_com2: ;less than
		//subtract var 3 from var 1 
			sub R17, R18
			brlo IsF_F_True		
			jmp IsF_F_False
	IsF_F_com3: ;greater than or equal to
		//subtract var 3 from var 1 
			sub R17, R18
			brsh IsF_F_True	
			jmp IsF_F_False
	IsF_F_com4: ;less than or equal to
		//subtract var 3 from var 1 
			sub R18, R17
			brsh IsF_F_True
			jmp IsF_F_False
	IsF_F_com5: ;not equal to
		//subtract var 3 from var 1 
			sub R17, R18
			brne IsF_F_True
			jmp IsF_F_False

	// if false
	IsF_F_False:
		mov R1, R25
		mov R0, R24
		dec R1
		clc
		clz
		jmp discover	

	//if true
	//add 9 to program counter
	IsF_F_true:
		ldi R25, 9
		add R0, R25
		jmp discover
;end






; -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -> old If Statements
/*
// checks if value N is equal to value in file F
//	-> equal, adds 7 to program counter and carries on
//	-> not equal, puts address of input 3 "FirstCommandAfterIf'dCodeAddress" into program counter
//uses var 1 (R16), var 2 (R17) and CommandIn (R24 & R25)
IsNequaltoF:
	;use program counter to select the first input
		call UPCTSTFI		
	//move value of input 1 file into var 1 (R16)
	ld R16, Z
	;select the next input
		call STNI
	;load Y pointer with what Z is pointing at
		call LYPWWZIPA
	//move value of input 1 file into var 2 (R17)
	ld R17, Y
	;select the next input
		call STNI

	//move file that Z points at, into R24 & R25
		ld R25, Z+
		ld R24, Z
		dec R30

	//subtract var 2 from var 1 
		sub R16, R17

	//is this false or true?
		breq IsNequaltoF_True

	// if false
		mov R1, R25
		mov R0, R24
		dec R1
		clc
		clz
		jmp discover	
	IsNequaltoF_True:

	//if true
	//add 7 to program counter
		sbr R25, 7
		add R0, R25
		jmp discover
;end

// checks if value in file F is equal to value in file F
//	-> equal, adds 8 to program counter and carries on
//	-> not equal, puts address of input 3 "FirstCommandAfterIf'dCodeAddress" into program counter
//uses var 1 (R16), var 2 (R17) and CommandIn (R24 & R25)
IsFequaltoF:
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
	//move value of input 1 file into var 2 (R17)
	ld R17, Y
	;select the next input
		call STNI

	//move file that Z points at, into R24 & R25
		ld R25, Z+
		ld R24, Z
		dec R30

	//subtract var 2 from var 1 
		sub R16, R17

	//is this false or true?
		breq IsFequaltoF_True

	// if false
		mov R1, R25
		mov R0, R24
		dec R1
		clc
		clz
		jmp discover	
	IsFequaltoF_True:

	//if true
	//add 8 to program counter
		ldi R25, 8
		add R0, R25
		jmp discover
;end

// checks if value N is greater than the value in file F
//	-> equal, adds 7 to program counter and carries on
//	-> not equal, puts address of input 3 "FirstCommandAfterIf'dCodeAddress" into program counter
//uses var 1 (R16), var 2 (R17) and CommandIn (R24 & R25)
IsNGreaterThanF:
	;use program counter to select the first input
		call UPCTSTFI		
	//move value of input 1 file into var 1 (R16)
	ld R16, Z
	;select the next input
		call STNI
	;load Y pointer with what Z is pointing at
		call LYPWWZIPA
	//move value of input 1 file into var 2 (R17)
	ld R17, Y
	;select the next input
		call STNI

	//move file that Z points at, into R24 & R25
		ld R25, Z+
		ld R24, Z
		dec R30

	//subtract var 2 from var 1 
		sub R17, R16

	//is this false or true?
		brlo IsNGreaterThanF_True

	// if false
		mov R1, R25
		mov R0, R24
		dec R1
		clc
		clz
		jmp discover	
	IsNGreaterThanF_True:

	//if true
	//add 7 to program counter
		ldi R25, 7
		add R0, R25
		jmp discover
;end

// checks if value in file F is greater than the value in file F
//	-> equal, adds 8 to program counter and carries on
//	-> not equal, puts address of input 3 "FirstCommandAfterIf'dCodeAddress" into program counter
//uses var 1 (R16), var 2 (R17) and CommandIn (R24 & R25)
IsFGreaterThanF:
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
	//move value of input 1 file into var 2 (R17)
	ld R17, Y
	;select the next input
		call STNI

	//move file that Z points at, into R24 & R25
		ld R25, Z+
		ld R24, Z
		dec R30

	//subtract var 2 from var 1 
		sub R17, R16

	//is this false or true?
		brlo IsFGreaterThanF_True

	// if false
		mov R1, R25
		mov R0, R24
		dec R1
		clc
		clz
		jmp discover	
	IsFGreaterThanF_True:

	//if true
	//add 8 to program counter
		ldi R25, 8
		add R0, R25
		jmp discover
;end

// checks if value N is less than the value in file F
//	-> equal, adds 7 to program counter and carries on
//	-> not equal, puts address of input 3 "FirstCommandAfterIf'dCodeAddress" into program counter
//uses var 1 (R16), var 2 (R17) and CommandIn (R24 & R25)
IsNLessThanF:
	;use program counter to select the first input
		call UPCTSTFI		
	//move value of input 1 file into var 1 (R16)
	ld R16, Z
	;select the next input
		call STNI
	;load Y pointer with what Z is pointing at
		call LYPWWZIPA
	//move value of input 1 file into var 2 (R17)
	ld R17, Y
	;select the next input
		call STNI

	//move file that Z points at, into R24 & R25
		ld R25, Z+
		ld R24, Z
		dec R30

	//subtract var 2 from var 1 
		sub R16, R17

	//is this false or true?
		brlo IsNLessThanF_True

	// if false
		mov R1, R25
		mov R0, R24
		dec R1
		clc
		clz
		jmp discover	
	IsNLessThanF_True:

	//if true
	//add 7 to program counter
		ldi R25, 7
		add R0, R25
		jmp discover
;end

// checks if value in file F is less than the value in file F
//	-> equal, adds 8 to program counter and carries on
//	-> not equal, puts address of input 3 "FirstCommandAfterIf'dCodeAddress" into program counter
//uses var 1 (R16), var 2 (R17) and CommandIn (R24 & R25)
IsFLessThanF:
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
	//move value of input 1 file into var 2 (R17)
	ld R17, Y
	;select the next input
		call STNI

	//move file that Z points at, into R24 & R25
		ld R25, Z+
		ld R24, Z
		dec R30

	//subtract var 2 from var 1 
		sub R16, R17

	//is this false or true?
		brlo IsFLessThanF_True

	// if false
		mov R1, R25
		mov R0, R24
		dec R1
		clc
		clz
		jmp discover	
	IsFLessThanF_True:

	//if true
	//add 8 to program counter
		ldi R25, 8
		add R0, R25
		jmp discover
;end

// checks if value N is Greater than or equal to the value in file F
//	-> equal, adds 7 to program counter and carries on
//	-> not equal, puts address of input 3 "FirstCommandAfterIf'dCodeAddress" into program counter
//uses var 1 (R16), var 2 (R17) and CommandIn (R24 & R25)
IsNGreaterThanOrEqualToF:
	;use program counter to select the first input
		call UPCTSTFI		
	//move value of input 1 file into var 1 (R16)
	ld R16, Z
	;select the next input
		call STNI
	;load Y pointer with what Z is pointing at
		call LYPWWZIPA
	//move value of input 1 file into var 2 (R17)
	ld R17, Y
	;select the next input
		call STNI

	//move file that Z points at, into R24 & R25
		ld R25, Z+
		ld R24, Z
		dec R30

	//subtract var 2 from var 1 
		sub R16, R17

	//is this false or true?
		brsh IsNGreaterThanOrEqualToF_True

	// if false
		mov R1, R25
		mov R0, R24
		dec R1
		clc
		clz
		jmp discover	
	IsNGreaterThanOrEqualToF_True:

	//if true
	//add 7 to program counter
		ldi R25, 7
		add R0, R25
		jmp discover
;end

// checks if value in file F is Greater than or equal to the value in file F
//	-> equal, adds 8 to program counter and carries on
//	-> not equal, puts address of input 3 "FirstCommandAfterIf'dCodeAddress" into program counter
//uses var 1 (R16), var 2 (R17) and CommandIn (R24 & R25)
IsFGreaterThanOrEqualToF:
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
	//move value of input 1 file into var 2 (R17)
	ld R17, Y
	;select the next input
		call STNI

	//move file that Z points at, into R24 & R25
		ld R25, Z+
		ld R24, Z
		dec R30

	//subtract var 2 from var 1 
		sub R16, R17

	//is this false or true?
		brsh IsFGreaterThanOrEqualToF_True

	// if false
		mov R1, R25
		mov R0, R24
		dec R1
		clc
		clz
		jmp discover	
	IsFGreaterThanOrEqualToF_True:

	//if true
	//add 8 to program counter
		ldi R25, 8
		add R0, R25
		jmp discover
;end

// checks if value N is less than or equal to the value in file F
//	-> equal, adds 7 to program counter and carries on
//	-> not equal, puts address of input 3 "FirstCommandAfterIf'dCodeAddress" into program counter
//uses var 1 (R16), var 2 (R17) and CommandIn (R24 & R25)
IsNLessThanOrEqualToF:
	;use program counter to select the first input
		call UPCTSTFI		
	//move value of input 1 file into var 1 (R16)
	ld R16, Z
	;select the next input
		call STNI
	;load Y pointer with what Z is pointing at
		call LYPWWZIPA
	//move value of input 1 file into var 2 (R17)
	ld R17, Y
	;select the next input
		call STNI

	//move file that Z points at, into R24 & R25
		ld R25, Z+
		ld R24, Z
		dec R30

	//subtract var 2 from var 1 
		sub R17, R16

	//is this false or true?
		brsh IsNLessThanOrEqualToF_True

	// if false
		mov R1, R25
		mov R0, R24
		dec R1
		clc
		clz
		jmp discover	
	IsNLessThanOrEqualToF_True:

	//if true
	//add 7 to program counter
		ldi R25, 7
		add R0, R25
		jmp discover
;end

// checks if value in file F is less than or equal to the value in file F
//	-> equal, adds 8 to program counter and carries on
//	-> not equal, puts address of input 3 "FirstCommandAfterIf'dCodeAddress" into program counter
//uses var 1 (R16), var 2 (R17) and CommandIn (R24 & R25)
IsFLessThanOrEqualToF:
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
	//move value of input 1 file into var 2 (R17)
	ld R17, Y
	;select the next input
		call STNI

	//move file that Z points at, into R24 & R25
		ld R25, Z+
		ld R24, Z
		dec R30

	//subtract var 2 from var 1 
		sub R17, R16

	//is this false or true?
		brsh IsFLessThanOrEqualToF_True

	// if false
		mov R1, R25
		mov R0, R24
		dec R1
		clc
		clz
		jmp discover	
	IsFLessThanOrEqualToF_True:

	//if true
	//add 8 to program counter
		ldi R25, 8
		add R0, R25
		jmp discover
;end

*/