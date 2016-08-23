; -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -> system commands
// resets device
RESET_:
	jmp 0
	;end

// ends program (in infinate loop)
STOP:
endloop:
	cli
	jmp endloop
	;end

// resets program counter, clears carry
// and returns to discover
Soft_Restart:
	clr R0
	clr R1
	;avoid page info
		call AvoidPageInfo
	clc
	jmp discover
	;end

// gets value in input 1 and places in program counter
// then returns to dsicovery
goto_:
;use program counter to select the first input
	call UPCTSTFI

	//move input 1 to program counter
	ld R1, Z+
	ld R0, Z
	;avoid page info
		call AvoidPageInfo

	//clear carry flag
	clc
	jmp discover
	;end

// activates the chip's sleep function
Sleep_:
	Sleep

	inc R0
	inc R0
	jmp discover
	;end



/*
chip vibrates at 16MHz (that's 16,000,000 times a second)
						that's once every 0.000000062 seconds
										  0.0000625 milliseconds 
										  0.0625 microseconds
										  62.5 nanoseconds

So, 16,000,000 vibrations go by every 1 second
									  1000 milliseconds
									  1,000,000 microseconds
									  1,000,000,000 nanoseconds

Thus, for the 16bit counter, with clock/1	= 244.140625 overflows a second
								  clock/8	= 30.51757813
								  clock/64	= 3.814697266
								  clock/256	= 0.953674316	
								  clock/1024= 0.238418579
And for the 8bit counter, with	  clock/1	= 62500 overflows a second
								  clock/8	= 7812.5
								  clock/64	= 976.5625
								  clock/256	= 244.140625
								  clock/1024= 61.03515625
*/

//uses R16, R17, R18, R19
// R20 & R21 for counting out milliseconds
Wait:
	;use program counter to select the first input
		call UPCTSTFI
	//move value of input 1 into var 1 (R16)
		ld R16, Z
	;select the next input
		call STNI
	//move value of input 2 into var 2 (R17)
		ld R17, Z
	;select the next input
		call STNI
	//move value of input 3 into var 3 (R18)
		ld R18, Z

		//compare var 1 with each possible number
		//upon match, jump to timing phase phase
		cpi R16, 0
		breq Wait_TT_com0
		cpi R16, 1
		breq Wait_TT_com1
		//error: invalid timing command entered, forcing 'end'
		jmp Wait_end

	//timing phase
		//conduct appropiate waiting and jump to end
	Wait_TT_com0: ;Milliseconds
	//test to see if values are zero
		tst R17
		brne Wait_TT_com0_Loop
		tst R18
		brne Wait_TT_com0_Loop
		jmp Wait_end

	//begin inner loop
	Wait_TT_com0_Loop:
		//decriment Low8 and wait for a millisecond
		dec R18

		call Wait_OneMillisecond

		//test to see if values are zero
		//	if Low8 is zero but High8 isn't set to FF and decriemnt High8
		//	if Low8 and High8 are zero, jump out of loop
		clz
		tst R18
		brne Wait_TT_com0_Loop
		clz
		tst R17
		breq Wait_end

		dec R17
		ldi R18, 0xFF
		jmp Wait_TT_com0_Loop

	Wait_TT_com1: ;Seconds
	//test to see if values are zero
		tst R17
		brne Wait_TT_com1_Loop
		tst R18
		brne Wait_TT_com1_Loop
		jmp Wait_end

	//begin inner loop
	Wait_TT_com1_Loop:
		//decriment Low8 and wait for a millisecond
		dec R18
		ldi R20, 0x03
		ldi R21, 0xE8

		Wait_1000MillisecondsLoop:
		dec R21
		call Wait_OneMillisecond

		clz
		tst R21
		brne Wait_1000MillisecondsLoop
		clz
		tst R20
		breq Wait_1000MillisecondsLoopEnd

		dec R20
		ldi R21, 0xFF
		jmp Wait_1000MillisecondsLoop
	Wait_1000MillisecondsLoopEnd:

		//test to see if values are zero
		//	if Low8 is zero but High8 isn't set to FF and decriemnt High8
		//	if Low8 and High8 are zero, jump out of loop
		clz
		tst R18
		brne Wait_TT_com1_Loop
		clz
		tst R17
		breq Wait_end

		dec R17
		ldi R18, 0xFF
		jmp Wait_TT_com1_Loop
		



	Wait_end:
	;adds 5 to the program counter and returnsto discover
	sbr R25, 5
	add R0, R25
	jmp discover


//private subs
// it takes One Millisecond to run this loop
Wait_OneMillisecond:
		ldi R19, 0x64
		clz
		Wait_OneMillisecondLoop:
			breq Wait_OneMillisecond_Out
			call Wait_1MicrosecondOfWastedTime
			call Wait_1MicrosecondOfWastedTime
			call Wait_1MicrosecondOfWastedTime
			call Wait_1MicrosecondOfWastedTime
			call Wait_1MicrosecondOfWastedTime
			call Wait_1MicrosecondOfWastedTime
			call Wait_1MicrosecondOfWastedTime
			call Wait_1MicrosecondOfWastedTime
			call Wait_1MicrosecondOfWastedTime
			nop
			nop
			nop
			nop
			nop
			nop
			nop
			nop
			dec R19
				jmp Wait_OneMillisecondLoop
		Wait_OneMillisecond_Out:
		call Wait_1MicrosecondOfWastedTime
		call Wait_1MicrosecondOfWastedTime
		call Wait_1MicrosecondOfWastedTime
		call Wait_1MicrosecondOfWastedTime
		call Wait_1MicrosecondOfWastedTime
		call Wait_1MicrosecondOfWastedTime
		call Wait_1MicrosecondOfWastedTime
		call Wait_1MicrosecondOfWastedTime
		call Wait_1MicrosecondOfWastedTime
		call Wait_1MicrosecondOfWastedTime
		call Wait_1MicrosecondOfWastedTime
		call Wait_1MicrosecondOfWastedTime
		call Wait_1MicrosecondOfWastedTime
		call Wait_1MicrosecondOfWastedTime
		call Wait_1MicrosecondOfWastedTime
		call Wait_1MicrosecondOfWastedTime
		call Wait_1MicrosecondOfWastedTime
		call Wait_1MicrosecondOfWastedTime
ret

Wait_1MicrosecondOfWastedTime:
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
ret
;end








/*
Wait:
	;use program counter to select the first input
		call UPCTSTFI
	//move value of input 1 into var 1 (R16)
		ld R16, Z
	;select the next input
		call STNI
	//move value of input 2 into var 2 (R17)
		ld R17, Z
	;select the next input
		call STNI
	//move value of input 3 into var 3 (R18)
		ld R18, Z

	//clear Var 4 (for changing commands in the timer)
		clr R19

		//compare var 1 with each possible number
		//upon match, jump to timing phase phase
		cpi R16, 0
		breq Wait_TT_com0
		cpi R16, 1
		breq Wait_TT_com1
		cpi R16, 2
		breq Wait_TT_com2
		cpi R16, 3
		breq Wait_TT_com3
		cpi R16, 4
		breq Wait_TT_com4
		cpi R16, 5
		breq Wait_TT_com5
		//error: invalid Type Type command entered, forcing 'end'
		jmp Wait_End

		//Timing phase
		//wait for appropiate duration then jump to end
	Wait_TT_com0: ;Nanoseconds (in multiples of 62.5)
		sts 0x0085, R19 ;clear counter High8
		sts 0x0084, R19 ;clear counter Low8

		sts 0x0089, R17 ;Fill Timer 1 Compare Register A High8 with N_High8
		sts 0x0088, R18 ;Fill Timer 1 Compare Register A Low8 with N_Low8

		ldi R19, 0x02 //Tell timer 1 to watch Comparitor A
		sts 0x006F, R19

		ldi R18, 0x02 //load Var 1 with flag checker

		ldi R19, 0x01 //connect clock to timer
		sts 0x0081, R19

		
		;//values are in, so we can now reuse Var 1, 2 and 3
		;wait_Loop:
		;	ldi R17, 0x02
		;	lds R16, 0x0036
		;	And R17, R16
		;	CP R17, R18
		;	breq Wait_End
		;	jmp wait_Loop
		

		clz
		sei
		wait_loop:
			breq Wait_End
			jmp wait_loop


	Wait_TT_com1: ;Microseconds	
			jmp Wait_End
	Wait_TT_com2: ;Milliseconds	
			jmp Wait_End
	Wait_TT_com3: ;Seconds
			jmp Wait_End
	Wait_TT_com4: ;Minutes
			jmp Wait_End
	Wait_TT_com5: ;Hours
			jmp Wait_End

	Wait_End:
	cli
	ldi R19, 0x00
	sts 0x0081, R19 ;stop clock
	sts 0x0036, R19 ;reset flag


	;adds 5 to the program counter and returns to discover
		sbr R25, 5
		add R0, R25
		jmp discover
;end
*/












/*
// uses Var 1 (R16) and Var 2 (R17)
Wait:
	ldi R18, 0x01

	ldi R16, 0x00
	sts 0x0085, R16 ;clear counter High8
	sts 0x0084, R16 ;clear counter Low8
	ldi R16, 0x01
	sts 0x0036, R16 ; clear timer 1 flags

	ldi R16, 0x01
	sts 0x006f, R16 ;watch overflow
	//load TCCR1B clock select with /256
	ldi R16, 0x03
	sts 0x0081, R16 ;clock ticking

wait_Loop:
	ldi R17, 0x01
	lds R16, 0x0036
	And R17, R16
	CP R17, R18
	breq wait_end
	jmp wait_Loop

wait_end:
	ldi R16, 0x00
	sts 0x0081, R16 ;stop clock
	sts 0x0036, R16 ;reset flag


;adds 2 to the program counter and returnsto discover
	//add 2 to program counter
	sbr R25, 2
	add R0, R25
	jmp discover
	;end
*/
//Nop
Nop_:
	inc R0
	jmp discover
	;end