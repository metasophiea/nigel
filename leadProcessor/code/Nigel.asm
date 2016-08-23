//         _____     ___   ___  _________  ________   ___
//        /     |   /  /  /  / /  ______/ /  _____/  /  /
//       /  /|  |  /  /  /  / /  /       /  /____   /  /
//      /  / |  | /  /  /  / /  /  ___  /  _____/  /  /
//     /  /  |  |/  /  /  / /  /__/  / /  /____   /  /___
//    /__/   |_____/  /__/ /________/ /_______/  /______/
// 					for atmega328p
// ---- notes ---- //
/*
 - main Nigel programming memory starts at 0x0100 and ends at 0x08FF
 - Code format: Com1|Com2|Details
*/
; --------------------------------------------------------------- ;
// ----- Interrupt List ----- //
	jmp start 		; First Command
	jmp EXT_INT0 		; IRQ0 Handler
	jmp EXT_INT1 		; IRQ1 Handler
	jmp PCINT0Change	; PCINT0 Handler
	jmp PCINT1Change	; PCINT1 Handler
	jmp PCINT2Change	; PCINT2 Handler
	jmp WDT 		; Watchdog Timer Handler
	jmp TIM2_COMPA		; Timer2 Compare A Handler
	jmp TIM2_COMPB 		; Timer2 Compare B Handler
	jmp TIM2_OVF 		; Timer2 Overflow Handler
	jmp TIM1_CAPT 		; Timer1 Capture Handler
	jmp TIM1_COMPA 		; Timer1 Compare A Handler
	jmp TIM1_COMPB 		; Timer1 Compare B Handler
	jmp TIM1_OVF 		; Timer1 Overflow Handler
	jmp TIM0_COMPA 		; Timer0 Compare A Handler
	jmp TIM0_COMPB		; Timer0 Compare B Handler
	jmp TIM0_OVF 		; Timer0 Overflow Handler
	jmp SPI_STC 		; SPI Transfer Complete Handler
	jmp USART_RXC 		; USART, RX Complete Handler
	jmp USART_UDRE		; USART, UDR Empty Handler
	jmp USART_TXC		; USART, TX Complete Handler
	jmp ADCCC 		; ADC Conversion Complete Handler
	jmp EE_RDY 		; EEPROM Ready Handler
	jmp ANA_COMP 		; Analog Comparator Handler
	jmp TWI 		; 2-wire Serial Interface Handler
	jmp SPM_RDY 		; Store Program Memory Ready Handler
; --------------------------------------------------------------- ;
// ----- Command list ----- //
// - system commands -
	jmp STOP		;|Com_High8|Com_Low8| ;|00|34|
	jmp RESET_		;|Com_High8|Com_Low8| ;|00|36|
	jmp Soft_Restart	;|Com_High8|Com_Low8| ;|00|38|
	jmp goto_		;|Com_High8|Com_Low8|N_High8|N_Low8| ;|00|3A|
	jmp Sleep_		;|Com_High8|Com_Low8| ;|00|3C|
	jmp Nop_		;|Com_High8|Com_Low8| ;|00|3E|
	jmp Wait		;|Com_High8|Com_Low8|Com|N_High8|N_Low8| ;|00|40|
				;Time Types:
				/*
				00 Milliseconds (desired time + 0.00425 milliseconds) (gains 3.1 milliseconds every 10 seconds)
				01 Seconds (can't recommend it right now for accuracy reasons)
				*/

// - Chip Pin Control -
	jmp PortDirection	;|Com_High8|Com_Low8|Port|N ;|00|42|
	jmp SetPort		;|Com_High8|Com_Low8|Port|N ;|00|44|
	jmp ReadPort		;|Com_High8|Com_Low8|Port|F_High8|F_Low8 ;|00|46|

// - bitwise operations - 
	jmp SetFbit		;|Com_High8|Com_Low8|F_High8|F_Low8|N ;|00|48|
	jmp ClearFbit		;|Com_High8|Com_Low8|F_High8|F_Low8|N ;|00|4A|
	jmp BitShiftFLeft	;|Com_High8|Com_Low8|F_High8|F_Low8 ;|00|4C|
	jmp BitShiftFRight	;|Com_High8|Com_Low8|F_High8|F_Low8 ;|00|4E|
	jmp SwapNibblesInF	;|Com_High8|Com_Low8|F_High8|F_Low8 ;|00|50|
	jmp FlipBits		;|Com_High8|Com_Low8|F_High8|F_Low8 ;|00|52|

// - move number -
	jmp putNinF		;|Com_High8|Com_Low8|N|F_High8|F_Low8 ;|00|54|
	jmp putFinF		;|Com_High8|Com_Low8|F_High8|F_Low8|F_High8|F_Low8 ;|00|56|

// - And/Or commands -
	jmp AndNwithF		;|Com_High8|Com_Low8|N|F_High8|F_Low8 ;|00|58|
	jmp AndFwithF		;|Com_High8|Com_Low8|F_High8|F_Low8|F_High8|F_Low8 ;|00|5A|
	jmp NAndNwithF		;|Com_High8|Com_Low8|N|F_High8|F_Low8 ;|00|5C|
	jmp NAndFwithF		;|Com_High8|Com_Low8|F_High8|F_Low8|F_High8|F_Low8 ;|00|5E|

	jmp OrNwithF		;|Com_High8|Com_Low8|N|F_High8|F_Low8 ;|00|60|
	jmp OrFwithF		;|Com_High8|Com_Low8|F_High8|F_Low8|F_High8|F_Low8 ;|00|62|
	jmp NOrNwithF		;|Com_High8|Com_Low8|N|F_High8|F_Low8 ;|00|64|
	jmp NOrFwithF		;|Com_High8|Com_Low8|F_High8|F_Low8|F_High8|F_Low8 ;|00|66|

	jmp EOrNwithF		;|Com_High8|Com_Low8|N|F_High8|F_Low8 ;|00|68|
	jmp EOrFwithF		;|Com_High8|Com_Low8|F_High8|F_Low8|F_High8|F_Low8 ;|00|6A|
	jmp NEOrNwithF		;|Com_High8|Com_Low8|N|F_High8|F_Low8 ;|00|6C|
	jmp NEOrFwithF		;|Com_High8|Com_Low8|F_High8|F_Low8|F_High8|F_Low8 ;|00|6E|

// - number control (unfinished)
; basic numbers are a bit doddgy,, finding them has a flaw where other commands 
; could potentially be mistaken as a BasicNumber confusing the Retriever.
; Bug count: 1
	jmp BasicNumber			;|Com_High8|Com_Low8|IDNumber|Type|X| ;|00|70|
					; 00 - Int ; 01 - Float ; 02 - Fractional ; 03 - Power ; 04 - Root 
	jmp BasicNumber2		;|Com_High8|Com_Low8|IDNumber_High8|IDNumber_Low8|Type|X| ;|00|72|
					; 00 - Int ; 01 - Float ; 02 - Fractional ; 03 - Power ; 04 - Root 
	jmp BasicNumberRetriever 	;|Com_High8|Com_Low8|IDNumber|F_High8|F_Low8| ;|00|74|
	jmp BasicNumber2Retriever 	;|Com_High8|Com_Low8|IDNumber_High8|IDNumber_Low8|F_High8|F_Low8| ;|00|76|


	jmp DynamicNumber	;|Com_High8|Com_Low8|Type|IDNumber|Length|X| ;|00|78|
				; 00 - Int ; 01 - Float ; 02 - Fractional ; 03 - Power ; 04 - Root
;	jmp DynamicNumberRetriever

;	jmp RegularToFloating ;|00||
;	jmp RegularToFractional ;|00||
;	jmp RegularToRoot ;|00||
;
;	jmp FloatingToRegular ;|00||
;	jmp FloatingToFractional ;|00||
;	jmp FloatingToRoot ;|00||
;
;	jmp FractionalToRegular ;|00||
;	jmp FractionalToFloating ;|00||
;	jmp FractionalToRoot ;|00||
;
;	jmp RootToRegular ;|00||
;	jmp RootToFloating ;|00||
;	jmp RootToFractional ;|00||

// - math operations -
	jmp incrimentFby1	;|Com_High8|Com_Low8|F_High8|F_Low8 ;|00||
	jmp decrimentFby1	;|Com_High8|Com_Low8|F_High8|F_Low8 ;|00||
	jmp MakeFnegitive	;|Com_High8|Com_Low8|F_High8|F_Low8 ;|00||

	jmp addNtoF		;|Com_High8|Com_Low8|N|F_High8|F_Low8 ;|00||
	jmp addFtoF		;|Com_High8|Com_Low8|F_High8|F_Low8|F_High8|F_Low8 ;|00||
	jmp subtractNfromF	;|Com_High8|Com_Low8|N|F_High8|F_Low8 ;|00||
	jmp subtractFfromF	;|Com_High8|Com_Low8|F_High8|F_Low8|F_High8|F_Low8 ;|00||

	jmp MultiplyFbyN	;|Com_High8|Com_Low8|F_High8|F_Low8|N|F_High8|F_Low8|F_High8|F_Low8| ;|00||
	jmp MultiplyFbyF	;|Com_High8|Com_Low8|F_High8|F_Low8|F_High8|F_Low8|F_High8|F_Low8|F_High8|F_Low8| ;|00||
	jmp SignedMultiplyFbyN	;|Com_High8|Com_Low8|F_High8|F_Low8|N|F_High8|F_Low8|F_High8|F_Low8| ;|00||
	jmp SignedMultiplyFbyF	;|Com_High8|Com_Low8|F_High8|F_Low8|F_High8|F_Low8|F_High8|F_Low8|F_High8|F_Low8| ;|00||

	jmp DevideNbyFWithRemainder		;|Com_High8|Com_Low8|N|F_High8|F_Low8|F_High8|F_Low8|F_High8|F_Low8| ;|00||
	jmp DevideFbyNWithRemainder		;|Com_High8|Com_Low8|F_High8|F_Low8|N|F_High8|F_Low8|F_High8|F_Low8| ;|00||
	jmp DevideFbyFWithRemainder		;|Com_High8|Com_Low8|F_High8|F_Low8|F_High8|F_Low8|F_High8|F_Low8|F_High8|F_Low8| ;|00||

	jmp SquareF		;|Com_High8|Com_Low8|F_High8|F_Low8|F_High8|F_Low8| ;|||
	;jmp SquareRootF	;|Com_High8|Com_Low8|F_High8|F_Low8|F_High8|F_Low8| ;|||

	;jmp FtothepowerofN	;|Com_High8|Com_Low8|N|F_High8|F_Low8| ;|||
	;jmp FtothepowerofF	;|Com_High8|Com_Low8|F_High8|F_Low8|F_High8|F_Low8| ;|||

	;jmp Ffactorial (postponed)		;|Com_High8|Com_Low8|F_High8|F_Low8|F_High8|F_Low8|F_High8|F_Low8| ;|00|96|

	;jmp SinF		;|Com_High8|Com_Low8|F_High8|F_Low8| ;|||
	;jmp InverseSinF	;|Com_High8|Com_Low8|F_High8|F_Low8| ;|||
	;jmp CosF		;|Com_High8|Com_Low8|F_High8|F_Low8| ;|||
	;jmp InverseCosF	;|Com_High8|Com_Low8|F_High8|F_Low8| ;|||
	;jmp Tanf		;|Com_High8|Com_Low8|F_High8|F_Low8| ;|||
	;jmp InverseTanf	;|Com_High8|Com_Low8|F_High8|F_Low8| ;|||

	;jmp LogF		;|Com_High8|Com_Low8|F_High8|F_Low8| ;|||

// - if statements -	
	jmp IsN_F	;ComHigh8|ComLow8|Com|N|F_High8|F_Low8|FirstCommandAfterIf'dCodeAddress_High8|FirstCommandAfterIf'dCodeAddress_Low8	;|00||
			;00 = ;01 > ;02 < ;03 >= ;04 <= ;05 !=
	jmp IsF_F	;ComHigh8|ComLow8|Com|F_High8|F_Low8|F_High8|F_Low8|FirstCommandAfterIf'dCodeAddress_High8|FirstCommandAfterIf'dCodeAddress_Low8	;|00||
			;00 = ;01 > ;02 < ;03 >= ;04 <= ;05 !=

// - if with else -
/*
	to do an else with an if, add a goto jump as the last code in the if'd code and have it jump to the 
	end of the else'd code. For example..

 -code-
 -code-
 if
	-code-
	-code-
	 goto endelse
 endif (start of else section)
 	-code- <-- first command after If'd code
	-code-
 endelse
 -code-
 -code-

*/

// - while loop -
	jmp WhileN_F	;ComHigh8|ComLow8|Com|N|F_High8|F_Low8|FirstCommandOfWhile'dCodeAddress_High8|FirstCommandOfWhile'dCodeAddress_Low8	;|00||
				;00 = ;01 > ;02 < ;03 >= ;04 <= ;05 !=
	jmp WhileF_F	;ComHigh8|ComLow8|Com|F_High8|F_Low8|F_High8|F_Low8|FirstCommandOfWhile'dCodeAddress_High8|FirstCommandOfWhile'dCodeAddress_Low8	;|00||
				;00 = ;01 > ;02 < ;03 >= ;04 <= ;05 !=

/*
	to do a while loop, use an While statement, and set the "FirstCommandOfWhile'dCodeAddress" 
	to a location before the While statement begins. Then before this point, add in a Goto command
	to bring you to the start of the if statement (unless you want a DoWhile loop)
	(and don't forget a way to change the F so you don't get an infinate loop)
*/

// - for loops -
	jmp For_	;ComHigh8|ComLow8|Com|i_F_High8|i_F_Low8|EndNumber|StepSize|FirstCommandOfFor'dCodeAddress_High8|FirstCommandOfFor'dCodeAddress_Low8 ;|00||
			;00 = ;01 > ;02 < ;03 >= ;04 <= ;05 !=
	jmp For_E	;ComHigh8|ComLow8|Com|i_F_High8|i_F_Low8|EndNumber_F_High8|EndNumber_F_Low8|StepSize|FirstCommandOfFor'dCodeAddress_High8|FirstCommandOfFor'dCodeAddress_Low8 ;|00||
			;00 = ;01 > ;02 < ;03 >= ;04 <= ;05 !=
	jmp For_S	;ComHigh8|ComLow8|Com|i_F_High8|i_F_Low8|EndNumber|StepSize_F_High8|StepSize_F_Low8|FirstCommandOfFor'dCodeAddress_High8|FirstCommandOfFor'dCodeAddress_Low8 ;|00||
			;00 = ;01 > ;02 < ;03 >= ;04 <= ;05 !=
	jmp For_ES	;ComHigh8|ComLow8|Com|i_F_High8|i_F_Low8|EndNumber_F_High8|EndNumber_F_Low8|StepSize_F_High8|StepSize_F_Low8|FirstCommandOfFor'dCodeAddress_High8|FirstCommandOfFor'dCodeAddress_Low8 ;|00||
			;00 = ;01 > ;02 < ;03 >= ;04 <= ;05 !=

// - sub functions - (unfinished)
;	jmp SetUpFunction ;ComHigh8|ComLow8
;	jmp CallFunction  ;ComHigh8|ComLow8|AddressOfCode_High8|AddressOfCode_Low8

; --------------------------------------------------------------- ;
// ----- startup commands ----- //
// this section only runs once at startup 
start:
//clear all registers
	clr R0 // program counter Low8
	clr R1 // program counter High8 (and when you think about it: Page Number)
	clr R2 // status register I T H S V N Z C // Interrupts T H S V Negitive Zero Carry 
	clr R3 // DynamicNumber Count 
	clr R4 
	clr R5
	clr R6
	clr R7
	clr R8
	clr R9
	clr R10
	clr R11
	clr R12
	clr R13
	clr R14
	clr R15
	clr R16 // var 1
	clr R17 // var 2
	clr R18 // var 3
	clr R19 // var 4
	clr R20 // var 5
	clr R21 // var 6
	clr R22
	clr R23
	clr R24 // Command in Low8												& waiting timer interrupt return Low8	& program counter Low8 Temporary Holding Area
	clr R25 // Command in High8		& "add this many to program counter"	& waiting timer interrupt return High8	& program counter High8 Temporary Holding Area
	clr R26 //file select address Low8 X
	clr R27 //file select address High8 X
	clr R28 //file select address Low8 Y
	clr R29 //file select address High8 Y
	clr R30 //file select address Low8 Z
	clr R31 //file select address High8 Z

;Autocode
	inc R31
//page data
	ldi R16, 0x00
	st Z, R16
	inc R30
	ldi R16, 0x00
	st Z, R16
	inc R30
	ldi R16, 0x00
	st Z, R16
	inc R30
	ldi R16, 0x01
	st Z, R16
	inc R30
	ldi R16, 0x20
	st Z, R16
	inc R30
	ldi R16, 0x00
	st Z, R16
	inc R30
//program
	ldi R16, 0x00
	st Z, R16
	inc R30
	ldi R16, 0x78
	st Z, R16
	inc R30
	ldi R16, 0x01
	st Z, R16
	inc R30
	ldi R16, 0x01
	st Z, R16
	inc R30
	ldi R16, 0x02
	st Z, R16
	inc R30
	ldi R16, 0x22
	st Z, R16
	inc R30
	ldi R16, 0x33
	st Z, R16
	inc R30

	ldi R16, 0x00
	st Z, R16
	inc R30
	ldi R16, 0x38
	st Z, R16
	inc R30

// move R0 into status register (clearing it)
	STS 0x005F, R0

;avoid page info
	call AvoidPageInfo

	jmp discover
; --------------------------------------------------------------- ;
// ----- discover loop ----- //
discover:
; - 8 + 8 = 16
	brcc discover_carryClearSet
	// if status register 'C' is high (indicating 
	//	that we have maxed-out 'program counter Low8'),
	//	add 1 to 'program counter High8'
		inc R1
discover_carryClearSet:
; - breath command in
	// move program counter to Z
	mov R31, R1
	mov R30, R0
	// add 0x0100 (magic number (where program space begins))
	inc R31
	// move file that Z points at, into R24 & R25
	ld R25, Z+
	ld R24, Z
	dec R30

; - command verification
	// check if command is zero
	// is High8 = zero?
	// - yes -> check Low8
	// - no -> carry on
	tst R25
		breq discover_check2
		jmp discover_carryOn

	// is Low8 = zero?
	// - yes -> run skipping routine (emptyCommand)
	// - no -> carry on
discover_check2:
	tst R24
	breq discover_emptyCommandSkippingRoutine
	jmp discover_carryOn

	// command invalid
	// add 1 to the program counter and start over
discover_emptyCommandSkippingRoutine:
	inc R0
	jmp discover

; - command execution
	// move these into Z
discover_carryOn:
	mov R31, R25
	mov R30, R24

	// move 'program counter High8' and 'program counter Low8'
	//	to equivalent in the Z Registers for ijmp
	ijmp 
; --------------------------------------------------------------- ;
// ----- code blocks ----- //
#include "CommandCode/CodeBlocks.asm"
/*
;use program counter to select the first input
	call UPCTSTFI

;select the next input
	call STNI

;load Y pointer with what Z is pointing at
	call LYPWWZIPA

//move value of input 1 file into var 1 (R16)
ld R16, Z

//put var 1 (R16) into Y
st Y, R16

// - handy (but uncallable) code - //
;adds 4 to the program counter and returnsto discover
	//add 4 to program counter
	sbr R25, 4
	add R0, R25
	jmp discover

// Test that there's a loaction for it, and places R16 in that location
	call THTALFIAPR16ITL
// Test that there's a loaction for it, and places R17 in that location
	call THTALFIAPR17ITL
// Test that there's a loaction for it, and places R18 in that location
	call THTALFIAPR18ITL
// Test that there's a loaction for it, and places R19 in that location
	call THTALFIAPR19ITL
// Test that there's a loaction for it, and places R20 in that location
	call THTALFIAPR20ITL

*/
; --------------------------------------------------------------- ;
// ----- command code ----- //
#include "CommandCode/ImportantThings.asm"
#include "CommandCode/InterruptCode.asm"
#include "CommandCode/ChipControl.asm"
#include "CommandCode/SystemCommands.asm"
#include "CommandCode/BitwiseOperations.asm"
#include "CommandCode/NumberCommands.asm"
#include "CommandCode/MoveNumber.asm"
#include "CommandCode/AndOrCommands.asm"
#include "CommandCode/MathOperations.asm"
#include "CommandCode/IfStatements.asm"
#include "CommandCode/WhileCommands.asm"
#include "CommandCode/ForLoops.asm"
