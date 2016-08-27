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
	jmp SPI_STC 		; SPI Transfer Complete Handler ----
	jmp USART_RXC 		; USART, RX Complete Handler
	jmp USART_UDRE		; USART, UDR Empty Handler
	jmp USART_TXC		; USART, TX Complete Handler
	jmp ADCCC 			; ADC Conversion Complete Handler
	jmp EE_RDY 			; EEPROM Ready Handler
	jmp ANA_COMP 		; Analog Comparator Handler
	jmp TWI 			; 2-wire Serial Interface Handler
	jmp SPM_RDY 		; Store Program Memory Ready Handler

EXT_INT0: 		; IRQ0 Handler
EXT_INT1: 		; IRQ1 Handler
PCINT0Change: 	; PCINT0 Handler
PCINT1Change:	; PCINT1 Handler
PCINT2Change: 	; PCINT2 Handler
WDT: 			; Watchdog Timer Handler
TIM2_COMPA:		; Timer2 Compare A Handler
TIM2_COMPB:		; Timer2 Compare B Handler
TIM2_OVF: 		; Timer2 Overflow Handler
TIM1_CAPT:		; Timer1 Capture Handler
TIM1_COMPA:		; Timer1 Compare A Handler
TIM1_COMPB:		; Timer1 Compare B Handler
TIM1_OVF: 		; Timer1 Overflow Handler
TIM0_COMPA:		; Timer0 Compare A Handler
TIM0_COMPB:		; Timer0 Compare B Handler
TIM0_OVF: 		; Timer0 Overflow Handler
;SPI_STC: 		;; SPI Transfer Complete Handler
USART_RXC: 		; USART, RX Complete Handler
USART_UDRE:		; USART, UDR Empty Handler
USART_TXC:		; USART, TX Complete Handler
ADCCC: 			; ADC Conversion Complete Handler
EE_RDY: 		; EEPROM Ready Handler
ANA_COMP: 		; Analog Comparator Handler
TWI: 			; 2-wire Serial Interface Handler
SPM_RDY: 		; Store Program Memory Ready Handler
reti
	start: