; -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -> code blocks
// --- regular blocks --- //
UPCTSTFI:
;use program counter to select the first input
	//get program counter value and place in Z
	mov R30, R0
	mov R31, R1
	//add secret sause (0x0100)
	inc R31
	clc
	inc R30
	inc R30
	brcc UPCTSTFI_skip
		inc R31
UPCTSTFI_skip:
ret

STNI:
;select the next input
	clc
	inc R30
	brcc STNI_skip
		inc R31
STNI_skip:
ret

STNIOX:
;select the next input of X
	clc
	inc R26
	brcc STNIOX_skip
		inc R27
STNIOX_skip:
ret

LYPWWZIPA:
;load Y with what Z is pointing at
	//load Y with input 1 file address
	ld R29, Z+
	ld R28, Z
ret

// --- testing for provided address and then placement of values --- //
THTALFIAPR16ITL:
// Test that there's a location for it, and places R18 in that location
;select the next input
	call STNI
;load Y pointer with what Z is pointing at
	call LYPWWZIPA
	//test input 2 destination for Zero
	// -> zero, then forget about putting the second value anywhere
	// -> not zero, then place it wherever they want it to go
	tst R29
	breq THTALFIAPR16ITL_YHigh8wasZero
	jmp THTALFIAPR16ITL_carryOn
THTALFIAPR16ITL_YHigh8wasZero:
	tst R28
	breq THTALFIAPR16ITL_dontDoHigh8Result
THTALFIAPR16ITL_carryOn:
	//
	st Y, R16
THTALFIAPR16ITL_dontDoHigh8Result:
ret

THTALFIAPR17ITL:
// Test that there's a location for it, and places R18 in that location
;select the next input
	call STNI
;load Y pointer with what Z is pointing at
	call LYPWWZIPA
	//test input 2 destination for Zero
	// -> zero, then forget about putting the second value anywhere
	// -> not zero, then place it wherever they want it to go
	tst R29
	breq THTALFIAPR17ITL_YHigh8wasZero
	jmp THTALFIAPR17ITL_carryOn
THTALFIAPR17ITL_YHigh8wasZero:
	tst R28
	breq THTALFIAPR17ITL_dontDoHigh8Result
THTALFIAPR17ITL_carryOn:
	//
	st Y, R17
THTALFIAPR17ITL_dontDoHigh8Result:
ret

THTALFIAPR18ITL:
// Test that there's a location for it, and places R18 in that location
;select the next input
	call STNI
;load Y pointer with what Z is pointing at
	call LYPWWZIPA
	//test input 2 destination for Zero
	// -> zero, then forget about putting the second value anywhere
	// -> not zero, then place it wherever they want it to go
	tst R29
	breq THTALFIAPR18ITL_YHigh8wasZero
	jmp THTALFIAPR18ITL_carryOn
THTALFIAPR18ITL_YHigh8wasZero:
	tst R28
	breq THTALFIAPR18ITL_dontDoHigh8Result
THTALFIAPR18ITL_carryOn:
	//
	st Y, R18
THTALFIAPR18ITL_dontDoHigh8Result:
ret

THTALFIAPR19ITL:
// Test that there's a location for it, and places R18 in that location
;select the next input
	call STNI
;load Y pointer with what Z is pointing at
	call LYPWWZIPA
	//test input 2 destination for Zero
	// -> zero, then forget about putting the second value anywhere
	// -> not zero, then place it wherever they want it to go
	tst R29
	breq THTALFIAPR19ITL_YHigh8wasZero
	jmp THTALFIAPR19ITL_carryOn
THTALFIAPR19ITL_YHigh8wasZero:
	tst R28
	breq THTALFIAPR19ITL_dontDoHigh8Result
THTALFIAPR19ITL_carryOn:
	//
	st Y, R19
THTALFIAPR19ITL_dontDoHigh8Result:
ret

THTALFIAPR20ITL:
// Test that there's a location for it, and places R18 in that location
;select the next input
	call STNI
;load Y pointer with what Z is pointing at
	call LYPWWZIPA
	//test input 2 destination for Zero
	// -> zero, then forget about putting the second value anywhere
	// -> not zero, then place it wherever they want it to go
	tst R29
	breq THTALFIAPR20ITL_YHigh8wasZero
	jmp THTALFIAPR20ITL_carryOn
THTALFIAPR20ITL_YHigh8wasZero:
	tst R28
	breq THTALFIAPR20ITL_dontDoHigh8Result
THTALFIAPR20ITL_carryOn:
	//
	st Y, R20
THTALFIAPR20ITL_dontDoHigh8Result:
ret

// --- page stuff --- //

AvoidPageInfo:
;avoid page info
	inc R0
	inc R0
	inc R0
	inc R0
	inc R0
	inc R0
ret