; -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -> For Loops
; -- example --
// -code- 
// -code- 
// goto (first file of For code)
// -code- 
// -code- 
// -code- 
// -code- 
// For
// command, i, endNumber, StepSize, FirstCommandOfFor'dCodeAddress 
// tests if i is 'command' endNumber
//	-> false, goto FirstCommandOfFor'dCodeAddress
//	-> true, carry on out of For into rest of code
// -code- 
// -code- 
; -- example -- 

//	jmp For_	;ComHigh8|ComLow8|Com|i_F_High8|i_F_Low8|EndNumber|StepSize|FirstCommandOfFor'dCodeAddress_High8|FirstCommandOfFor'dCodeAddress_Low8 ;|00|45| & |00|46|
			;00 = ;01 > ;02 < ;03 >= ;04 <= ;05 !=
For_:
	;use program counter to select the first input
		call UPCTSTFI
	//move value of 'Com' into var 1 (R16)
		ld R16, Z
	;select the next input
		call STNI
	;load Y pointer with what Z is pointing at
		call LYPWWZIPA
	//move value of input 2 file into var 2 (R17)
		ld R17, Y
	;select the next input
		call STNI
	//move value of input 3 into var 3 (R18)
		ld R18, Z
	;select the next input
		call STNI
	//move value of input 4 into var 4 (R19)
		ld R19, Z
		tst R19
		breq For__error
	;select the next input
		call STNI
	//move file that Z points at, into R24 & R25
		ld R25, Z+
		ld R24, Z
		dec R30

		//compare var 1 with each possible number
		//upon match, jump to judgement phase
		cpi R16, 0
		breq For__com0
		cpi R16, 1
		breq For__com1
		cpi R16, 2
		breq For__com2
		cpi R16, 3
		breq For__com3
		cpi R16, 4
		breq For__com4
		cpi R16, 5
		breq For__com5
		//error: invalid judgement command entered, forcing 'true'
		jmp For__True

		//judgement phase
		//conduct appropiate judgement and jump to end
	For__com0: ;equal
		//subtract var 3 from var 2
			sub R17, R18
			breq For__True
			jmp For__False
	For__com1: ;greater than
		//subtract var 2 from var 3
			sub R18, R17
			brlo For__True		
			jmp For__False
	For__com2: ;less than
		//subtract var 2 from var 3 
			sub R17, R18
			brlo For__True		
			jmp For__False
	For__com3: ;greater than or equal to
		//subtract var 2 from var 3 
			sub R17, R18
			brsh For__True	
			jmp For__False
	For__com4: ;less than or equal to
		//subtract var 3 from var 2 
			sub R18, R17
			brsh For__True
			jmp For__False
	For__com5: ;not equal to
		//subtract var 2 from var 3 
			sub R17, R18
			brne For__True
			jmp For__False

	// if false
	For__False:
		;use program counter to select the first input
			call UPCTSTFI
		;select the next input
			call STNI
		;load Y pointer with what Z is pointing at
			call LYPWWZIPA
		//move value of input 2 file into var 2 (R17)
			ld R17, Y

		//add step
		add R17, R19
		
		//put var 2 (R17) into Y
			st Y, R17

		//set up destination for next discover loop
		mov R1, R25
		mov R0, R24
		dec R1
		clc
		clz
		jmp discover	

	//error detected: forcing true
	For__error:
	//if true
	//add 9 to program counter
	For__true:
		ldi R25, 9
		add R0, R25
		jmp discover
;end

//	jmp For_E	;ComHigh8|ComLow8|Com|i_F_High8|i_F_Low8|EndNumber_F_High8|EndNumber_F_Low8|StepSize|FirstCommandOfFor'dCodeAddress_High8|FirstCommandOfFor'dCodeAddress_Low8 ;|00|47|
			;00 = ;01 > ;02 < ;03 >= ;04 <= ;05 !=
For_E:
	;use program counter to select the first input
		call UPCTSTFI
	//move value of 'Com' into var 1 (R16)
		ld R16, Z
	;select the next input
		call STNI
	;load Y pointer with what Z is pointing at
		call LYPWWZIPA
	//move value of input 2 file into var 2 (R17)
		ld R17, Y
	;select the next input
		call STNI
	;load Y pointer with what Z is pointing at
		call LYPWWZIPA
	//move value of input 3 file into var 3 (R18)
		ld R18, Y
	;select the next input
		call STNI
	//move value of input 4 into var 4 (R19)
		ld R19, Z
		tst R19
		breq For_E_error
	;select the next input
		call STNI
	//move file that Z points at, into R24 & R25
		ld R25, Z+
		ld R24, Z
		dec R30

		//compare var 1 with each possible number
		//upon match, jump to judgement phase
		cpi R16, 0
		breq For_E_com0
		cpi R16, 1
		breq For_E_com1
		cpi R16, 2
		breq For_E_com2
		cpi R16, 3
		breq For_E_com3
		cpi R16, 4
		breq For_E_com4
		cpi R16, 5
		breq For_E_com5
		//error: invalid judgement command entered, forcing 'true'
		jmp For_E_True

		//judgement phase
		//conduct appropiate judgement and jump to end
	For_E_com0: ;equal
		//subtract var 3 from var 2
			sub R17, R18
			breq For_E_True
			jmp For_E_False
	For_E_com1: ;greater than
		//subtract var 2 from var 3
			sub R18, R17
			brlo For_E_True		
			jmp For_E_False
	For_E_com2: ;less than
		//subtract var 2 from var 3 
			sub R17, R18
			brlo For_E_True		
			jmp For_E_False
	For_E_com3: ;greater than or equal to
		//subtract var 2 from var 3 
			sub R17, R18
			brsh For_E_True	
			jmp For_E_False
	For_E_com4: ;less than or equal to
		//subtract var 3 from var 2 
			sub R18, R17
			brsh For_E_True
			jmp For_E_False
	For_E_com5: ;not equal to
		//subtract var 2 from var 3 
			sub R17, R18
			brne For_E_True
			jmp For_E_False

	// if false
	For_E_False:
		;use program counter to select the first input
			call UPCTSTFI
		;select the next input
			call STNI
		;load Y pointer with what Z is pointing at
			call LYPWWZIPA
		//move value of input 2 file into var 2 (R17)
			ld R17, Y

		//add step
		add R17, R19
		
		//put var 2 (R17) into Y
			st Y, R17

		//set up destination for next discover loop
		mov R1, R25
		mov R0, R24
		dec R1
		clc
		clz
		jmp discover	

	//error detected: forcing true
	For_E_error:
	//if true
	//add 10 to program counter
	For_E_true:
		ldi R25, 10
		add R0, R25
		jmp discover
;end

//	jmp For_S	;ComHigh8|ComLow8|Com|i_F_High8|i_F_Low8|EndNumber|StepSize_F_High8|StepSize_F_Low8|FirstCommandOfFor'dCodeAddress_High8|FirstCommandOfFor'dCodeAddress_Low8 ;|00|49|
			;00 = ;01 > ;02 < ;03 >= ;04 <= ;05 !=
For_S:
	;use program counter to select the first input
		call UPCTSTFI
	//move value of 'Com' into var 1 (R16)
		ld R16, Z
	;select the next input
		call STNI
	;load Y pointer with what Z is pointing at
		call LYPWWZIPA
	//move value of input 2 file into var 2 (R17)
		ld R17, Y
	;select the next input
		call STNI
	//move value of input 3 into var 3 (R18)
		ld R18, Z
	;select the next input
		call STNI
	;load Y pointer with what Z is pointing at
		call LYPWWZIPA
	//move value of input 4 file into var 4 (R19)
		ld R19, Y
		tst R19
		breq For_S_error
	;select the next input
		call STNI
	//move file that Z points at, into R24 & R25
		ld R25, Z+
		ld R24, Z
		dec R30

		//compare var 1 with each possible number
		//upon match, jump to judgement phase
		cpi R16, 0
		breq For_S_com0
		cpi R16, 1
		breq For_S_com1
		cpi R16, 2
		breq For_S_com2
		cpi R16, 3
		breq For_S_com3
		cpi R16, 4
		breq For_S_com4
		cpi R16, 5
		breq For_S_com5
		//error: invalid judgement command entered, forcing 'true'
		jmp For_S_True

		//judgement phase
		//conduct appropiate judgement and jump to end
	For_S_com0: ;equal
		//subtract var 3 from var 2
			sub R17, R18
			breq For_S_True
			jmp For_S_False
	For_S_com1: ;greater than
		//subtract var 2 from var 3
			sub R18, R17
			brlo For_S_True		
			jmp For_S_False
	For_S_com2: ;less than
		//subtract var 2 from var 3 
			sub R17, R18
			brlo For_S_True		
			jmp For_S_False
	For_S_com3: ;greater than or equal to
		//subtract var 2 from var 3 
			sub R17, R18
			brsh For_S_True	
			jmp For_S_False
	For_S_com4: ;less than or equal to
		//subtract var 3 from var 2 
			sub R18, R17
			brsh For_S_True
			jmp For_S_False
	For_S_com5: ;not equal to
		//subtract var 2 from var 3 
			sub R17, R18
			brne For_S_True
			jmp For_S_False

	// if false
	For_S_False:
		;use program counter to select the first input
			call UPCTSTFI
		;select the next input
			call STNI
		;load Y pointer with what Z is pointing at
			call LYPWWZIPA
		//move value of input 2 file into var 2 (R17)
			ld R17, Y

		//add step
		add R17, R19
		
		//put var 2 (R17) into Y
			st Y, R17

		//set up destination for next discover loop
		mov R1, R25
		mov R0, R24
		dec R1
		clc
		clz
		jmp discover	

	//error detected: forcing true
	For_S_error:
	//if true
	//add 10 to program counter
	For_S_true:
		ldi R25, 10
		add R0, R25
		jmp discover
;end

//	jmp For_ES	;ComHigh8|ComLow8|Com|i_F_High8|i_F_Low8|EndNumber_F_High8|EndNumber_F_Low8|StepSize_F_High8|StepSize_F_Low8|FirstCommandOfFor'dCodeAddress_High8|FirstCommandOfFor'dCodeAddress_Low8 ;|00|4C|
			;00 = ;01 > ;02 < ;03 >= ;04 <= ;05 !=
For_ES:
	;use program counter to select the first input
		call UPCTSTFI
	//move value of 'Com' into var 1 (R16)
		ld R16, Z
	;select the next input
		call STNI
	;load Y pointer with what Z is pointing at
		call LYPWWZIPA
	//move value of input 2 file into var 2 (R17)
		ld R17, Y
	;select the next input
		call STNI
	;load Y pointer with what Z is pointing at
		call LYPWWZIPA
	//move value of input 3 file into var 3 (R18)
		ld R18, Y
	;select the next input
		call STNI
	;load Y pointer with what Z is pointing at
		call LYPWWZIPA
	//move value of input 4 file into var 4 (R19)
		ld R19, Y
		tst R19
		breq For_ES_error
	;select the next input
		call STNI
	//move file that Z points at, into R24 & R25
		ld R25, Z+
		ld R24, Z
		dec R30

		//compare var 1 with each possible number
		//upon match, jump to judgement phase
		cpi R16, 0
		breq For_ES_com0
		cpi R16, 1
		breq For_ES_com1
		cpi R16, 2
		breq For_ES_com2
		cpi R16, 3
		breq For_ES_com3
		cpi R16, 4
		breq For_ES_com4
		cpi R16, 5
		breq For_ES_com5
		//error: invalid judgement command entered, forcing 'true'
		jmp For_ES_True

		//judgement phase
		//conduct appropiate judgement and jump to end
	For_ES_com0: ;equal
		//subtract var 3 from var 2
			sub R17, R18
			breq For_ES_True
			jmp For_ES_False
	For_ES_com1: ;greater than
		//subtract var 2 from var 3
			sub R18, R17
			brlo For_ES_True		
			jmp For_ES_False
	For_ES_com2: ;less than
		//subtract var 2 from var 3 
			sub R17, R18
			brlo For_ES_True		
			jmp For_ES_False
	For_ES_com3: ;greater than or equal to
		//subtract var 2 from var 3 
			sub R17, R18
			brsh For_ES_True	
			jmp For_ES_False
	For_ES_com4: ;less than or equal to
		//subtract var 3 from var 2 
			sub R18, R17
			brsh For_ES_True
			jmp For_ES_False
	For_ES_com5: ;not equal to
		//subtract var 2 from var 3 
			sub R17, R18
			brne For_ES_True
			jmp For_ES_False

	// if false
	For_ES_False:
		;use program counter to select the first input
			call UPCTSTFI
		;select the next input
			call STNI
		;load Y pointer with what Z is pointing at
			call LYPWWZIPA
		//move value of input 2 file into var 2 (R17)
			ld R17, Y

		//add step
		add R17, R19
		
		//put var 2 (R17) into Y
			st Y, R17

		//set up destination for next discover loop
		mov R1, R25
		mov R0, R24
		dec R1
		clc
		clz
		jmp discover	

	//error detected: forcing true
	For_ES_error:
	//if true
	//add 11 to program counter
	For_ES_true:
		ldi R25, 11
		add R0, R25
		jmp discover
;end