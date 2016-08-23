/*
	-- Number Types --

	- Int
	- Floating Point
	- Fractional
	- Power
	- Root

	(all perhaps with nonreserve style for larger numbers; Int[n])
*/
; -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -> Basic Numbers (doesn't work, frankly)
// --- installizer --- //
// creates a sigle byte number
;|Com_High8|Com_Low8|IDNumber|Type|X|
; 00 - Int
; 01 - Float
; 02 - Fractional
; 03 - Power
; 04 - Root

BasicNumber:
	//add 5 to program counter
	sbr R25, 5
	add R0, R25
	jmp discover
;end

// creates a sigle byte number
;|Com_High8|Com_Low8|IDNumber_High8|IDNumber_Low8|Type|X|
; 00 - Int
; 01 - Float
; 02 - Fractional
; 03 - Power
; 04 - Root
BasicNumber2:
	//add 6 to program counter
	sbr R25, 6
	add R0, R25
	jmp discover
;end

// --- retrivier --- //
//Finds BasicNumber with id "IDNumber" and places in F
// uses R16, R17, R18, R19
;|Com_High8|Com_Low8|IDNumber|F_High8|F_Low8|
BasicNumberRetriever:
	;use program counter to select the first input
		call UPCTSTFI
	//move value of input 1 into var 1 (R16)
		ld R16, Z

// Now search through program for |00|70|R16|
	clr R26 ;set x to 0100
	clr R27
	inc R27

	clr R28 ;set y to 0101
	clr R29
	inc R28
	inc R29

	clr R30 ;set z to 0102
	clr R31
	inc R30
	inc R30
	inc R31

BasicNumberRetriever_Loop:
	ld R17, X+
	ld R18, Y+
	ld R19, Z+

	tst R17
	brne BasicNumberRetriever_Loop ;Com_High8 wrong

	subi R18, 0x70
	tst R18
	brne BasicNumberRetriever_Loop ;Com_Low8 wrong

	sub R19, R16
	tst R19
	brne BasicNumberRetriever_Loop ;Idnumber wrong

//success, now place in F
	ld R19, Z+
	ld R19, Z

	;use program counter to select the first input
		call UPCTSTFI
	;select the next input
		call STNI
	;load Y pointer with what Z is pointing at
		call LYPWWZIPA

	//put var 4 (R19) into Y
	st Y, R19

	//add 5 to program counter
	sbr R25, 5
	add R0, R25
	jmp discover
;end


//Finds BasicNumber2 with id "IDNumber" and places in F
// uses R16, R17, R18, R19, R20
;|Com_High8|Com_Low8|IDNumber_High8|IDNumber_Low8|F_High8|F_Low8|
BasicNumber2Retriever:
	;use program counter to select the first input
		call UPCTSTFI
	//move value of input 1 into var 1 (R16)
		ld R16, Z
	;select the next input
		call STNI
	//move value of input 2 into var 2 (R17)
		ld R17, Z

// Now search through program for |00|72|R16|
	ser R19 ;use as "what one we're on" counter
	clr R20 ;start at begining (0x0100)

BasicNumber2Retriever_Loop:
	inc R19
	brne BasicNumber2Retriever_Loop_Skip
		inc R20
	BasicNumber2Retriever_Loop_Skip:
	mov R26, R19
	mov R27, R20

	ld R18, X+
	ld R19, X

/*
BasicNumber2Retriever_Loop:
	inc R19
	brne BasicNumber2Retriever_Loop_Skip
		inc R20
	BasicNumber2Retriever_Loop_Skip:
	mov R26, R19
	mov R27, R20
// check
	ld R18, X+
	tst R18
	brne BasicNumber2Retriever_Loop ;Com_High8 wrong

	ld R18, X+
	subi R18, 0x72
	tst R18
	brne BasicNumber2Retriever_Loop ;Com_Low8 wrong

	ld R18, X+
	sub R18, R16
	tst R18
	brne BasicNumber2Retriever_Loop ;IDNumber_High8 wrong

	ld R18, X+
	sub R18, R17
	tst R18
	brne BasicNumber2Retriever_Loop ;IDNumber_Low8 wrong
*/

//success, now place in F
	ld R19, X+
	ld R19, X

	;select the next input
		call STNI
	;load Y pointer with what Z is pointing at
		call LYPWWZIPA

	//put var 4 (R19) into Y
	st Y, R19

BasicNumber2Retriever_error:
	//add 5 to program counter
	sbr R25, 6
	add R0, R25
	jmp discover
;end

; -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -> Dynamic Numbers
// --- installizer --- //
//moves to page's "Start of RAM space" and begins looking for
//a free space, when found, it loads in the desired data
//if it detects that the page is full, is moves to the next one
//uses R16, R17, R18, R19, X, Y
;|Com_High8|Com_Low8|Type|IDNumber|Length|X|
; 01 - Int
; 02 - Float
; 03 - Fractional
; 04 - Power
; 05 - Root
DynamicNumber:
	;use program counter to select the first input
		call UPCTSTFI
	mov R27 ,R31
	clr R30
	sbr R30, 4
	//move value of 'Start of RAM Space' into Low8 of X (R28)
		ld R26, Z

;searches through bytes for number types
;	- if one is found, searcher jumps ahead by Number Size + 1
;	- if not, we use this space
DynamicNumber_Loop:
;test if current page is full
	mov R29, R27
	clr R28
	sbr R28, 0x05
	ld R16, Y
	sbrs R16, 1
		jmp DynamicNumber_Loop_PageTest_allGood
		call CodeAccessingNextPage						
		inc R27											
		clr R26											
		sbr R26, 0x06	
		jmp DynamicNumber_Loop

DynamicNumber_Loop_PageTest_allGood:
	ld R20, X
	tst R20
	brne DynamicNumber_SkipSpace ;a number is here
	jmp DynamicNumber_Loop_SpaceFound

;number already in use, skipping forward
	DynamicNumber_SkipSpace:
		call STNIOX
		call STNIOX
		ld R16, X
		add R26, R16
		brcc DynamicNumber_SkipSpace_carryskip
			inc R27
		DynamicNumber_SkipSpace_carryskip:
		call STNIOX

	;test for potential collision with next page's data
		call DynamicNumber_TFPCWNPD
		jmp DynamicNumber_Loop

;empty space found
DynamicNumber_Loop_SpaceFound:
	;test for potential collision with next page's data
		call DynamicNumber_TFPCWNPD

	;use program counter to select the first input
		call UPCTSTFI
;print number Type
	//move value of input 1 into var 1 (R16)
		ld R16, Z
	st X+, R16
	;select the next input
		call STNI
;print NumberID
	//move value of input 2 into var 1 (R16)
		ld R16, Z
	st X+, R16
	;select the next input
		call STNI
;Print number length
	//move value of input 3 into var 1 (R16)
		ld R16, Z
	st X+, R16
	;select the next input
		call STNI

;place 'number of values' into R25, to be added to program counter later
		mov R25, R16

DynamicNumber_Loop_SpaceFound_ValuePrintingLoop:
;test for collision with (potentially) next page's data
	tst R26
	brne DynamicNumber_Loop_SpaceFound_ValuePrintingLoop_Skip
	subi R26, -6
DynamicNumber_Loop_SpaceFound_ValuePrintingLoop_Skip:
	ld R17, Z+
	st X+, R17
	dec R16
	tst R16
	brne DynamicNumber_Loop_SpaceFound_ValuePrintingLoop

	//add R25 and 5 to program counter
	subi R25, -5
	add R0, R25
	jmp discover
;end

;subs
DynamicNumber_TFPCWNPD:
;test for potential collision with next page's data
	;use program counter to select the first input		
		call UPCTSTFI									
	;select the next input								
		call STNI										
	;select the next input								
		call STNI										
	//move value of input 3 into var 3 (R18)			
		ld R18, Z										
		subi R18, -3									
		mov R19, R26									
		add R19, R18									
		brcc DynamicNumber_Loop_SpaceFound_NeverMind	
		call CodeAccessingNextPage						
		inc R27											
		clr R26											
		sbr R26, 0x06															
DynamicNumber_Loop_SpaceFound_NeverMind:				
ret
// --- installizer end --- //

// --- retrivier --- //












; -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -> Number Type Conversion Code
// Regular -> Floating
RegularToFloating:
	lsl R16
	lsl R16
	lsl R16
	lsl R16
	inc R16
ret
// Regular -> Fractional
RegularToFractional:
	lsl R16
	lsl R16
	lsl R16
	lsl R16
	inc R16
ret
// Regular -> Root
RegularToRoot:
	lsl R16
	lsl R16
	lsl R16
	lsl R16
	inc R16
ret

// Floating -> Regular
; uses R14, R15
FloatingToRegular:

ret
// Floating -> Fractional
// Floating -> Root

// Fractional -> Regular
// Fractional -> Floating
// Fractional -> Root

// Root -> Regular
// Root -> Floating
// Root -> Fractional