// ----- Interrupt List ----- //
	jmp start 			; First Command
	jmp EXT_INT0 		; IRQ0 Handler
	jmp EXT_INT1 		; IRQ1 Handler
	jmp PCINT0Change	; PCINT0 Handler
	jmp PCINT1Change	; PCINT1 Handler
	jmp PCINT2Change	; PCINT2 Handler
	jmp WDT 			; Watchdog Timer Handler
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
	jmp ADCCC 			; ADC Conversion Complete Handler
	jmp EE_RDY 			; EEPROM Ready Handler
	jmp ANA_COMP 		; Analog Comparator Handler
	jmp TWI 			; 2-wire Serial Interface Handler
	jmp SPM_RDY 		; Store Program Memory Ready Handler
; --------------------------------------------------------------- ;
start:

//Clear Memory////////////
#include "ClearMemory.asm"
//////////////////////////

//Setup X pointer for Sending data//
	ldi R26, 0x00
	ldi R27, 0x01
////////////////////////////////////

//Setup Port D as output//
	ldi R16, 0xFF 
	out DDRD, R16
	//Clear
	ldi R16, 0x00 out PortD, R16
//////////////////////////

//setup pin C5 as interrupt//
	//PCICR
	ldi R16, 0b00000010
	sts 0x68, R16
	//PCMSK1
	ldi R16, 0b00100000
	sts 0x6C, R16
	//Enable Global Interrupts
	;SEI
/////////////////////////////

EndLoop:
	#include "SendNonsenseData.asm"
jmp EndLoop

#include "InterruptCode.asm"
#include "SendData/SendData.asm"
