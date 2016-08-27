jmp RESET 	; Reset Handler
jmp EXT_INT0 	; IRQ0 Handler
jmp EXT_INT1 	; IRQ1 Handler
jmp PCINT0_interrupt 	; PCINT0 Handler
jmp PCINT1_interrupt 	; PCINT1 Handler
jmp PCINT2_interrupt 	; PCINT2 Handler
jmp WDT 		; Watchdog Timer Handler
jmp TIM2_COMPA	; Timer2 Compare A Handler
jmp TIM2_COMPB 	; Timer2 Compare B Handler
jmp TIM2_OVF 	; Timer2 Overflow Handler
jmp TIM1_CAPT 	; Timer1 Capture Handler
jmp TIM1_COMPA 	; Timer1 Compare A Handler
jmp TIM1_COMPB 	; Timer1 Compare B Handler
jmp TIM1_OVF 	; Timer1 Overflow Handler
jmp TIM0_COMPA 	; Timer0 Compare A Handler
jmp TIM0_COMPB	; Timer0 Compare B Handler
jmp TIM0_OVF 	; Timer0 Overflow Handler
jmp SPI_STC 	; SPI Transfer Complete Handler
jmp USART_RXC 	; USART, RX Complete Handler
jmp USART_UDRE 	; USART, UDR Empty Handler
jmp USART_TXC 	; USART, TX Complete Handler
jmp ADC_interrupt 		; ADC Conversion Complete Handler
jmp EE_RDY 	; EEPROM Ready Handler
jmp ANA_COMP 	; Analog Comparator Handler
jmp TWI 		; 2-wire Serial Interface Handler
jmp SPM_RDY 	; Store Program Memory Ready Handler

RESET: 

//	clock speed: 16MHz (16,000,000Hz)
//		that's one pulse every 0.000000062 seconds		(s)
//							   0.0000625 milliseconds	(ms)
//							   0.0625 microseconds		(us)
//							   62.5 nanoseconds			(ns)
//	
//	H_Loop - 30us
//	 front porch (drop colour) - 0.5us
//	 sync pulse (drop H) - 3us
//	 back porch (raise H) - 1.5us
//	 active video (raise colour) - 25us
//	
//	V_Loop - 
//	 front porch (drop colour) - 0.5us
//	 sync pulse (drop H&V) - 3us
//	 back porch (raise H&V) - 1.5us
//
//	
//	0.5us = 8 pulses
//	1.5us = 24 pulses
//	3us   = 48 pulses
//  5us   = 80 pulses
//	25us  = 400 pulses
//	30us  = 480 pulses
//		so, on a 1/8 clock..
//	0.5us = 1 pulses  (0x01)
//	1.5us = 3 pulses  (0x03)
//	3us   = 6 pulses  (0x06)
//  5us   = 10 pulses (0x0A)
//	25us  = 50 pulses (0x32)
//	30us  = 60 pulses (0x3C)
//		you can use the 8bit timer! :D

//Start timer 0 and 2 - n
//	n		- H_Loop front porch (drop colour)   - 0.5us
//	n+0.5us - H_Loop sync pulse (drop H)         - 3us
	ldi R16, 0x01
	sts 0x0047, R16 //timer 0 Compare Register A
//	n+3.5us - H_Loop back porch (raise H)        - 1.5us
	ldi R16, 0x07
	sts 0x0048, R16 //timer 0 Compare Register B
//	n+5us   - H_Loop active video (raise colour) - 25us
	ldi R16, 0x07
	sts 0x00B3, R16 //timer 2 Compare Register A
//	n+30us	reset timers
	ldi R16, 0x3C
	sts 0x00B4, R16 //timer 2 Compare Register B


//start clock (type: 1/8)
	ldi R16, 0b00000010
	sts 0x0045, R16 //TCCR0B
	sts 0x0081, R16 //TCCR1B
	sts 0x00B1, R16 //TCCR2B



//Start timer 1 - n
//	n+14400   - V_Loop front porch (drop colour) - 0.5us
//	n+14400.5 - sync pulse (drop H&V)			 - 3us
//	n+14403.5 - back porch (raise H&V)			 - 1.5us
//	n+14405	reset timer

//set OCR0A
	ldi R16, 0x3C
	sts 0x0047, R16 //timer 0 Compare Register A

//watch OCR0A
	ldi R16, 0x01
	sts 0x006E, R16 //timer 0 Compare Register A

	sei ; Enable interrupts

//start clock (type: 1/8)
	ldi R16, 0b00000010
	sts 0x0045, R16 //TCCR0B

Loop:
	jmp Loop



// interrupt collection list - default responses
EXT_INT0:
EXT_INT1:
PCINT0_interrupt: 	
PCINT1_interrupt: 	
PCINT2_interrupt: 	
WDT: 		
TIM2_COMPA:	
TIM2_COMPB: 
TIM2_OVF: 	
TIM1_CAPT: 	
TIM1_COMPA: 
TIM1_COMPB: 
TIM1_OVF: 	
TIM0_COMPA: 
TIM0_COMPB:	
TIM0_OVF: 	
SPI_STC: 	
USART_RXC: 	
USART_UDRE: 
USART_TXC: 	
ADC_interrupt:
EE_RDY: 		
ANA_COMP: 	
TWI: 		
SPM_RDY: 	
	sei ; Enable interrupts
	jmp Loop