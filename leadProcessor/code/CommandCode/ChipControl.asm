; -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -> Chip Control
/*
OUT 1, R16
OUT 2, R16
OUT 3, R16 //PortB
OUT 4, R16 //DDRB

OUT 5, R16 //PinB
OUT 6, R16 //PortC
OUT 7, R16 //DDRC
OUT 8, R16 //PinC

OUT 9, R16 //PortD
OUT 10, R16//DDRD
OUT 11, R16//PinD
OUT 12, R16
*/

;jmp PortDirection ;Com|Port|N ;
PortDirection:
	;use program counter to select the first input
		call UPCTSTFI
	//move value of input 1 into var 1 (R16)
		ld R16, Z
	;select the next input
		call STNI
	//move value of input 2 into var 2 (R17)
		ld R17, Z

		//compare var 1 with each possible number
		//upon match, jump to judgement phase
		cpi R16, 0
		breq PortDirection_com0
		cpi R16, 1
		breq PortDirection_com1
		cpi R16, 2
		breq PortDirection_com2
		//error: invalid judgement command entered, jumping to end
		jmp PortDirection_error

	PortDirection_com0: ;PortB
			out DDRB, R17
			jmp PortDirection_Finished
	PortDirection_com1: ;PortC
			out DDRC, R17
			jmp PortDirection_Finished
	PortDirection_com2: ;PortD
			out DDRD, R17
			jmp PortDirection_Finished

	PortDirection_Finished:
	PortDirection_error:
	;adds 4 to the program counter and returnsto discover
		//add 4 to program counter
		sbr R25, 4
		add R0, R25
		jmp discover
;end

;jmp SetPort ;Com|Port|N ;
SetPort:
	;use program counter to select the first input
		call UPCTSTFI
	//move value of input 1 into var 1 (R16)
		ld R16, Z
	;select the next input
		call STNI
	//move value of input 2 into var 2 (R17)
		ld R17, Z

		//compare var 1 with each possible number
		//upon match, jump to judgement phase
		cpi R16, 0
		breq SetPort_com0
		cpi R16, 1
		breq SetPort_com1
		cpi R16, 2
		breq SetPort_com2
		//error: invalid judgement command entered, jumping to end
		jmp PortDirection_error

	SetPort_com0: ;PortB
			out PortB, R17
			jmp SetPort_Finished
	SetPort_com1: ;PortC
			out PortC, R17
			jmp SetPort_Finished
	SetPort_com2: ;PortD
			out PortD, R17
			jmp SetPort_Finished

	SetPort_Finished:
	SetPort_error:
	;adds 4 to the program counter and returnsto discover
		//add 4 to program counter
		sbr R25, 4
		add R0, R25
		jmp discover
;end

;jmp ReadPort ;Com|Port|F_High8|F_Low8
ReadPort:
	;adds 2 to the program counter and returnsto discover
		//add 2 to program counter
		sbr R25, 2
		add R0, R25
		jmp discover
;end


