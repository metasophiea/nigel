; -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -> While Commands
WhileN_F:
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
		breq WhileN_F_com0
		cpi R16, 1
		breq WhileN_F_com1
		cpi R16, 2
		breq WhileN_F_com2
		cpi R16, 3
		breq WhileN_F_com3
		cpi R16, 4
		breq WhileN_F_com4
		cpi R16, 5
		breq WhileN_F_com5
		//error: invalid judgement command entered, forcing 'false'
		jmp WhileN_F_False

		//judgement phase
		//conduct appropiate judgement and jump to end
	WhileN_F_com0: ;equal
		//subtract var 3 from var 1 
			sub R17, R18
			breq WhileN_F_True
			jmp WhileN_F_False
	WhileN_F_com1: ;greater than
		//subtract var 3 from var 1 
			sub R18, R17
			brlo WhileN_F_True		
			jmp WhileN_F_False
	WhileN_F_com2: ;less than
		//subtract var 3 from var 1 
			sub R17, R18
			brlo WhileN_F_True		
			jmp WhileN_F_False
	WhileN_F_com3: ;greater than or equal to
		//subtract var 3 from var 1 
			sub R17, R18
			brsh WhileN_F_True	
			jmp WhileN_F_False
	WhileN_F_com4: ;less than or equal to
		//subtract var 3 from var 1 
			sub R18, R17
			brsh WhileN_F_True
			jmp WhileN_F_False
	WhileN_F_com5: ;not equal to
		//subtract var 3 from var 1 
			sub R17, R18
			brne WhileN_F_True
			jmp WhileN_F_False

	// if true
	WhileN_F_True:
		mov R1, R25
		mov R0, R24
		dec R1
		clc
		clz
		jmp discover	

	//if false
	//add 8 to program counter
	WhileN_F_False:
		ldi R25, 8
		add R0, R25
		jmp discover
;end

WhileF_F:
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
		breq WhileF_F_com0
		cpi R16, 1
		breq WhileF_F_com1
		cpi R16, 2
		breq WhileF_F_com2
		cpi R16, 3
		breq WhileF_F_com3
		cpi R16, 4
		breq WhileF_F_com4
		cpi R16, 5
		breq WhileF_F_com5
		//error: invalid judgement command entered, forcing 'false'
		jmp WhileF_F_False

		//judgement phase
		//conduct appropiate judgement and jump to end
	WhileF_F_com0: ;equal
		//subtract var 3 from var 1 
			sub R17, R18
			breq WhileF_F_True
			jmp WhileF_F_False
	WhileF_F_com1: ;greater than
		//subtract var 3 from var 1 
			sub R18, R17
			brlo WhileF_F_True		
			jmp WhileF_F_False
	WhileF_F_com2: ;less than
		//subtract var 3 from var 1 
			sub R17, R18
			brlo WhileF_F_True		
			jmp WhileF_F_False
	WhileF_F_com3: ;greater than or equal to
		//subtract var 3 from var 1 
			sub R17, R18
			brsh WhileF_F_True	
			jmp WhileF_F_False
	WhileF_F_com4: ;less than or equal to
		//subtract var 3 from var 1 
			sub R18, R17
			brsh WhileF_F_True
			jmp WhileF_F_False
	WhileF_F_com5: ;not equal to
		//subtract var 3 from var 1 
			sub R17, R18
			brne WhileF_F_True
			jmp WhileF_F_False

	// if true
	WhileF_F_True:
		mov R1, R25
		mov R0, R24
		dec R1
		clc
		clz
		jmp discover	

	//if false
	//add 9 to program counter
	WhileF_F_False:
		ldi R25, 9
		add R0, R25
		jmp discover
;end