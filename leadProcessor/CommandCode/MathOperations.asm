; -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -> math opperations
//incriements value in file F
//uses R16, R17
incrimentFby1:
;use program counter to select the first input
	call UPCTSTFI
;load Y pointer with what Z is pointing at
	call LYPWWZIPA
	//move value of input 1 file into var 1 (R16)
	ld R16, Y

	//incriment R16
	inc R16
	//if the result is zero, set the Status Register Z to high
	//(using R17)
	brne incrimentFby1_zeroFlagSetSkip
	ori R17, 2
	mov R2, R17
incrimentFby1_zeroFlagSetSkip:
	//put var 1 (R16) into Y
	st Y, R16

	//add 4 to program counter
	sbr R25, 4
	add R0, R25
	jmp discover
	;end

//decriements value in file F
//uses R16, R17
decrimentFby1:
;use program counter to select the first input
	call UPCTSTFI
;load Y pointer with what Z is pointing at
	call LYPWWZIPA
	//move value of input 1 file into var 1 (R16)
	ld R16, Y

	//decriment R16
	dec R16
	//if the result is zero, set the Status Register Z to high
	//(using R17)
	brne decrimentFby1_zeroFlagSetSkip
	ori R17, 2
	mov R2, R17
decrimentFby1_zeroFlagSetSkip:
	//put var 1 (R16) into Y
	st Y, R16

	//add 4 to program counter
	sbr R25, 4
	add R0, R25
	jmp discover
	;end

//makes the value in file F negitive
//uses R16
MakeFnegitive:
;use program counter to select the first input
	call UPCTSTFI
	
;load Y pointer with what Z is pointing at
	call LYPWWZIPA

	//move value of input 1 file into var 1 (R16)
	ld R16, Y

	//make negitive
	neg R16

	//put var 1 (R16) into Y
	st Y, R16

	//add 4 to program counter
	sbr R25, 4
	add R0, R25
	jmp discover
	;end

//adds value N to file F
//uses R16, R17, R18
addNtoF:
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

	//add var 1 (R16) to var 2 (R17)
	add R16, R17
	//if the result is zero, set the Status Register Z to high
	//(using R18)
	brne addNtoF_zeroFlagSetSkip
	ori R18, 2
	mov R2, R18
addNtoF_zeroFlagSetSkip:

	//if the result results a carry, set the Status Register C to high
	//(using R18)
	brcc addNtoF_CarrySetSkip
	ori R18, 1
	mov R2, R18
addNtoF_CarrySetSkip:

	//put var 1 (R16) into Y
	st Y, R16

	//add 5 to program counter
	sbr R25, 5
	add R0, R25
	jmp discover
	;end

//adds file F to file F
//uses R16, R17, R18
addFtoF:
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
	ld R17, y

	//add var 1 (R16) to var 2 (R17)
	add R16, R17
	//if the result is zero, set the Status Register Z to high
	//(using R18)
	brne addFtoF_zeroFlagSetSkip
	ori R18, 2
	mov R2, R18
addFtoF_zeroFlagSetSkip:

	//if the result results a carry, set the Status Register C to high
	//(using R18)
	brcc addFtoF_CarrySetSkip
	ori R18, 1
	mov R2, R18
addFtoF_CarrySetSkip:

	//put var 1 (R16) into Y
	st Y, R16

	//add 5 to program counter
	sbr R25, 5
	add R0, R25
	jmp discover
	;end

//subtracts value N from file F
//uses R16, R17, R18
subtractNfromF:
;use program counter to select the first input
	call UPCTSTFI
	//move value of input 1 file into var 2 (R17)
	ld R17, Z	
;select the next input
	call STNI
;load Y pointer with what Z is pointing at
	call LYPWWZIPA
	//move value of input 2 file into var 1 (R16)
	ld R16, y

	//add var 1 (R16) to var 2 (R17)
	sub R16, R17
	//if the result is zero, set the Status Register Z to high
	//(using R18)
	brne subtractNtoF_zeroFlagSetSkip
	ori R18, 2
	mov R2, R18
subtractNtoF_zeroFlagSetSkip:

	//if the result results a carry, set the Status Register C to high
	//(using R18)
	brpl subtractNtoF_NegitiveSetSkip
	ori R18, 4
	mov R2, R18
subtractNtoF_NegitiveSetSkip:

	//put var 1 (R16) into Y
	st Y, R16

	//add 5 to program counter
	sbr R25, 5
	add R0, R25
	jmp discover
	;end

//subtracts file F from file F
//uses R16, R17, R18
subtractFfromF:
;use program counter to select the first input
	call UPCTSTFI
;load Y pointer with what Z is pointing at
	call LYPWWZIPA
	//move value of input 1 file into var 2 (R17)
	ld R17, y	
;select the next input
	call STNI
;load Y pointer with what Z is pointing at
	call LYPWWZIPA
	//move value of input 2 file into var 1 (R16)
	ld R16, y

	//add var 1 (R16) to var 2 (R17)
	sub R16, R17
	//if the result is zero, set the Status Register Z to high
	//(using R18)
	brne subtractFfromF_zeroFlagSetSkip
	ori R18, 2
	mov R2, R18
subtractFfromF_zeroFlagSetSkip:

	//if the result results a carry, set the Status Register C to high
	//(using R18)
	brpl subtractFfromF_NegitiveSetSkip
	ori R18, 4
	mov R2, R18
subtractFfromF_NegitiveSetSkip:

	//put var 1 (R16) into Y
	st Y, R16

	//add 5 to program counter
	sbr R25, 5
	add R0, R25
	jmp discover
	;end

//multiplies F by the value N, and places the answer in F(High8) and F(Low8)
//uses R16, R17, R18, R19
// also R28, R29 for temporary program counter storage
MultiplyFbyN:

;use program counter to select the first input
	call UPCTSTFI
;load Y pointer with what Z is pointing at
	call LYPWWZIPA
//move value of input 1 file into var 1 (R16)
	ld R16, Y
;select the next input
	call STNI
//move value of input 2 into var 2 (R17)
	ld R17, Z


	// place program counter in R24&R25 for safe keeping
	mov R24, R0
	mov R25, R1

	mul R16, R17

	// put asnwer in R18&R19
	mov R18, R0
	mov R19, R1
	// put program counter values back
	mov R0, R24
	mov R1, R25


	// Test that there's a loaction for it, and place the Low8 (R19) answer in that location
		call THTALFIAPR19ITL

	// Test that there's a loaction for it, and place the High8 (R18) answer in that location
		call THTALFIAPR18ITL


;adds 9 to the program counter and returnsto discover
	//add 9 to program counter
	sbr R25, 9
	add R0, R25
	jmp discover
	;end

//multiplies F by F, and places the answer in F(High8) and F(Low8)
//uses R16, R17, R18, R19
// also R28, R29 for temporary program counter storage
MultiplyFbyF:

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

	// place program counter in R24&R25 for safe keeping
	mov R24, R0
	mov R25, R1

	mul R16, R17

	// put asnwer in R18&R19
	mov R18, R0
	mov R19, R1
	// put program counter values back
	mov R0, R24
	mov R1, R25


	// Test that there's a loaction for it, and place the Low8 (R19) answer in that location
		call THTALFIAPR18ITL

	// Test that there's a loaction for it, and place the High8 (R18) answer in that location
		call THTALFIAPR18ITL


;adds 10 to the program counter and returnsto discover
	//add 10 to program counter
	sbr R25, 10
	add R0, R25
	jmp discover
	;end



;jmp MultiplyFbyN	;|Com_High8|Com_Low8|F_High8|F_Low8|N|F_High8|F_Low8|F_High8|F_Low8| ;|||
//uses R16, R17, R18, R19
// also R28, R29 for temporary program counter storage
SignedMultiplyFbyN:

;use program counter to select the first input
	call UPCTSTFI
;load Y pointer with what Z is pointing at
	call LYPWWZIPA
//move value of input 1 file into var 1 (R16)
	ld R16, Y
;select the next input
	call STNI
//move value of input 2 into var 2 (R17)
	ld R17, Z

	// place program counter in R24&R25 for safe keeping
	mov R24, R0
	mov R25, R1

	muls R16, R17

	// put asnwer in R18&R19
	mov R18, R0
	mov R19, R1
	// put program counter values back
	mov R0, R24
	mov R1, R25

	// Test that there's a loaction for it, and place the Low8 (R19) answer in that location
		call THTALFIAPR19ITL

	// Test that there's a loaction for it, and place the High8 (R18) answer in that location
		call THTALFIAPR18ITL

;adds 9 to the program counter and returnsto discover
	//add 9 to program counter
	sbr R25, 9
	add R0, R25
	jmp discover
	;end

;	jmp MultiplyFbyF	;|Com_High8|Com_Low8|F_High8|F_Low8|F_High8|F_Low8|F_High8|F_Low8|F_High8|F_Low8|
//uses R16, R17, R18, R19
// also R28, R29 for temporary program counter storage
SignedMultiplyFbyF:

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

	// place program counter in R24&R25 for safe keeping
	mov R24, R0
	mov R25, R1

	muls R16, R17

	// put asnwer in R18&R19
	mov R18, R0
	mov R19, R1
	// put program counter values back
	mov R0, R24
	mov R1, R25

	// Test that there's a loaction for it, and place the Low8 (R19) answer in that location
	call THTALFIAPR19ITL

	// Test that there's a loaction for it, and place the High8 (R18) answer in that location
	call THTALFIAPR18ITL

;adds 10 to the program counter and returnsto discover
	//add 10 to program counter
	sbr R25, 10
	add R0, R25
	jmp discover
	;end




;jmp DevideNbyFWithRemainder		;|Com_High8|Com_Low8|N|F_High8|F_Low8|F_High8|F_Low8|F_High8|F_Low8|
//uses R16, R17, R18, R19, R20, R21
DevideNbyFWithRemainder:
;use program counter to select the first input
	call UPCTSTFI
//move value of input 1 into var 1 (R16)
	ld R16, Z
;select the next input
	call STNI
;load Y pointer with what Z is pointing at
	call LYPWWZIPA
//move value of input 2 file into var 2 (R17)
	ld R17, Y

; --- devision ---

// R16 - N - Numerator (and then Remainder)
// R17 - D - Denominator (and then Quotient)
// R18 - AH
// R19 - subtraction tester for R17
// R20 - add one
// R21 - count
// N/D

	tst R17
	brne DevideNbyFWithRemainder_noerror ; Error - cannot devide by 0
	;adds 9 to the program counter and returns to discover
	//add 9 to program counter
		sbr R25, 9
		add R0, R25
		jmp discover
DevideNbyFWithRemainder_noerror:

//simplistic division loop (useless now, but nice to think about)
/*
	DevideNbyFWithRemainder_loop:
		sub R16, R17
		brmi DevideNbyFWithRemainder_end
		inc R18
		jmp DevideNbyFWithRemainder_loop
	DevideNbyFWithRemainder_end:
	add R16, R17
*/

//more efficient division loop
ldi R21, 0x08
DevideNbyFWithRemainder_divisionloop:
dec R21
	clr R20
		lsl R18
		lsl R16
		brcc DevideNbyFWithRemainder_divisionloop_carryskip
		inc R18
		DevideNbyFWithRemainder_divisionloop_carryskip:
	mov R19, R18
	sub R19, R17
	brmi DevideNbyFWithRemainder_divisionloop_subtractskip
	sub R18, R17
	inc R20
	DevideNbyFWithRemainder_divisionloop_subtractskip:
		add R16, R20
tst R21
breq DevideNbyFWithRemainder_divisionloop_end
jmp DevideNbyFWithRemainder_divisionloop
DevideNbyFWithRemainder_divisionloop_end:

	// Test that there's a loaction for it, and place the Quotient (R18) answer in that location
	call THTALFIAPR16ITL

	// Test that there's a loaction for it, and place the Remainder (R16) answer in that location
	call THTALFIAPR18ITL

;adds 9 to the program counter and returns to discover
	//add 9 to program counter
	sbr R25, 9
	add R0, R25
	jmp discover
	;end

;jmp DevideFbyNWithRemainder		;|Com_High8|Com_Low8|F_High8|F_Low8|N|F_High8|F_Low8|F_High8|F_Low8|
//uses R16, R17, R18, R19, R20, R21
DevideFbyNWithRemainder:
;use program counter to select the first input
	call UPCTSTFI
;load Y pointer with what Z is pointing at
	call LYPWWZIPA
//move value of input 1 file into var 1 (R16)
	ld R16, Y
;select the next input
	call STNI
//move value of input 2 file into var 2 (R17)
	ld R17, Z

; --- devision ---

// R16 - N - Numerator (and then Remainder)
// R17 - D - Denominator (and then Quotient)
// R18 - AH
// R19 - subtraction tester for R17
// R20 - add one
// R21 - count
// N/D

	tst R17
	brne DevideFbyNWithRemainder_noerror ; Error - cannot devide by 0
	;adds 9 to the program counter and returns to discover
	//add 9 to program counter
		sbr R25, 9
		add R0, R25
		jmp discover
DevideFbyNWithRemainder_noerror:

//simplistic division loop (useless now, but nice to think about)
/*
	DevideFbyNWithRemainder_loop:
		sub R16, R17
		brmi DevideFbyNWithRemainder_end
		inc R18
		jmp DevideFbyNWithRemainder_loop
	DevideFbyNWithRemainder_end:
	add R16, R17
*/

//more efficient division loop
ldi R21, 0x08
DevideFbyNWithRemainder_divisionloop:
dec R21
	clr R20
		lsl R18
		lsl R16
		brcc DevideFbyNWithRemainder_divisionloop_carryskip
		inc R18
		DevideFbyNWithRemainder_divisionloop_carryskip:
	mov R19, R18
	sub R19, R17
	brmi DevideFbyNWithRemainder_divisionloop_subtractskip
	sub R18, R17
	inc R20
	DevideFbyNWithRemainder_divisionloop_subtractskip:
		add R16, R20
tst R21
breq DevideFbyNWithRemainder_divisionloop_end
jmp DevideFbyNWithRemainder_divisionloop
DevideFbyNWithRemainder_divisionloop_end:

	// Test that there's a loaction for it, and place the Quotient (R18) answer in that location
	call THTALFIAPR16ITL

	// Test that there's a loaction for it, and place the Remainder (R16) answer in that location
	call THTALFIAPR18ITL

;adds 9 to the program counter and returns to discover
	//add 9 to program counter
	sbr R25, 9
	add R0, R25
	jmp discover
	;end

;jmp DevideFbyFWithRemainder		;|Com_High8|Com_Low8|F_High8|F_Low8|F_High8|F_Low8|F_High8|F_Low8|F_High8|F_Low8|
//uses R16, R17, R18, R19, R20, R21
DevideFbyFWithRemainder:
;use program counter to select the first input
	call UPCTSTFI
;load Y pointer with what Z is pointing at
	call LYPWWZIPA
//move value of input 1 into var 1 (R16)
	ld R16, Y
;select the next input
	call STNI
;load Y pointer with what Z is pointing at
	call LYPWWZIPA
//move value of input 2 file into var 2 (R17)
	ld R17, Y

; --- devision ---

// R16 - N - Numerator (and then Remainder)
// R17 - D - Denominator (and then Quotient)
// R18 - AH
// R19 - subtraction tester for R17
// R20 - add one
// R21 - count
// N/D

	tst R17
	brne DevideFbyFWithRemainder_noerror ; Error - cannot devide by 0
	;adds 9 to the program counter and returns to discover
	//add 9 to program counter
		sbr R25, 9
		add R0, R25
		jmp discover
DevideFbyFWithRemainder_noerror:

//simplistic division loop (useless now, but nice to think about)
/*
	DevideNbyFWithRemainder_loop:
		sub R16, R17
		brmi DevideNbyFWithRemainder_end
		inc R18
		jmp DevideNbyFWithRemainder_loop
	DevideNbyFWithRemainder_end:
	add R16, R17
*/

//more efficient division loop
ldi R21, 0x08
DevideFbyFWithRemainder_divisionloop:
dec R21
	clr R20
		lsl R18
		lsl R16
		brcc DevideFbyFWithRemainder_divisionloop_carryskip
		inc R18
		DevideFbyFWithRemainder_divisionloop_carryskip:
	mov R19, R18
	sub R19, R17
	brmi DevideFbyFWithRemainder_divisionloop_subtractskip
	sub R18, R17
	inc R20
	DevideFbyFWithRemainder_divisionloop_subtractskip:
		add R16, R20
tst R21
breq DevideFbyFWithRemainder_divisionloop_end
jmp DevideFbyFWithRemainder_divisionloop
DevideFbyFWithRemainder_divisionloop_end:

	// Test that there's a loaction for it, and place the Quotient (R18) answer in that location
	call THTALFIAPR16ITL

	// Test that there's a loaction for it, and place the Remainder (R16) answer in that location
	call THTALFIAPR18ITL

;adds 9 to the program counter and returns to discover
	//add 9 to program counter
	sbr R25, 9
	add R0, R25
	jmp discover
	;end






//takes the value in file F and squares it
//	if a second address is provided and if
//	the result is 16bit, the High8 is placed
//	in this second address
//uses	R16 - input value
//		R17 - counter Low8
//		R18 - counter High8
//		R19 - result Low8
//		R20 - result High8
SquareF:
;use program counter to select the first input
	call UPCTSTFI
;load Y pointer with what Z is pointing at
	call LYPWWZIPA
	//move value of input 1 file into var 1 (R16)
	ld R16, Y
		
	//put 1 in var 2 (R17)
	ldi R17, 1

	//clear var 3 (R18), var 4 (R19) and var 5 (R20) just in case
	clr R18
	clr R19
	clr R20
	//clear zero flag
	clz

//using addition of odd numbers, the square is found
SquareF_loop:
	breq SquareF_end
	add R19, R17
		brcc SquareF_loopSkip
		inc R20
		SquareF_loopSkip:
	add R20, R18

	inc R17
	inc R17
	brne SquareF_additionSkip
	inc R18
SquareF_additionSkip:

	dec R16
	jmp SquareF_loop
SquareF_end:

	//put var 4 (R19) into Y
	st Y, R19

	// Test that there's a loaction for it, and place the Low8 (R20) answer in that location
		call THTALFIAPR20ITL

	//add 6 to program counter
	sbr R25, 6
	add R0, R25
	jmp discover
	;end



//Shelved//////////////////////////////////////////////////////////////
//Takes the value in F, factorises it and places the result in F
Ffactorial:
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


	// place program counter in R24&R25 for safe keeping
	mov R24, R0
	mov R25, R1


	tst R16
	brpl Ffactorial_IsNotNegative
	neg R16
Ffactorial_IsNotNegative:

	mov R17, R16
	mov R0, R16
	dec R17

Ffactorial_Loop:
	mov R16, R0
	muls R16, R17
	dec R17
	tst R17
	brne Ffactorial_Loop

	// put asnwer in R18&R19
	mov R16, R0
	mov R17, R1
	// put program counter values back
	mov R0, R24
	mov R1, R25

	//put var 1 (R16) into Y
		st Y, R16

// Test that there's a loaction for it, and places R17 in that location
	call THTALFIAPR17ITL

	//add 8 to program counter
	sbr R25, 8
	add R0, R25
	jmp discover
;end
///////////////////////////////////////////////////////////////////////