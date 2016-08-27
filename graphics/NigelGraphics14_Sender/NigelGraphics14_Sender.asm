#include "InterruptCode.asm"
#include "SetUpSenderReciever.asm"

// Chip Pin Array B: 
//	(6 pin) 
//	Pin 0: -unused-		
//	Pin 1: -unused-
//	Pin 2: - Pin Secector (Straight to SS on Output chip)
//	Pin 3: - MOSI
//	Pin 4: - MISO
//	Pin 5: - SCK Clock OUT
	ldi R16, 0b00110100 
	out DDRB, R16

// Chip Pin Array C:
//	(6 pin) 
//	Pin 0: -unused- 
//	Pin 1: -unused-
//	Pin 2: -unused-
//	Pin 3: - "Signal Other Chip That We're Ready" pin input 
//	Pin 4: -unused-
//	Pin 5: -unused-
	ldi R16, 0b00000000 
	out DDRC, R16

// Chip Pin Array D:
//	(8 pin) 
//	Pin 0: -unused- 
//	Pin 1: -unused- Light blink
//	Pin 2: -unused-
//	Pin 3: -unused-
//	Pin 4: -unused-
//	Pin 5: -unused-
//	Pin 6: -unused-
//	Pin 7: -unused-
	ldi R16, 0xFF
	out DDRD, R16

//Regular Opperation
Main_Loop:
	/*in R16, PortD
	andi R16, 0x01
	cpi R16, 0x01

	breq Main_Loop_Jump
		sbi PortD, 0
		jmp Main_Loop_Jump_end
	Main_Loop_Jump:
		cbi PortD, 0
	Main_Loop_Jump_end:

	
	Main_Loop_Sub:
		nop
	jmp Main_Loop_Sub*/

	in R16, PinC
	andi R16, 0b00001000
	cpi R16, 0b00001000
	breq PCINT0Change

	cbi PortD, 1

	jmp Main_Loop



PCINT0Change:
	sbi PortD, 1

	//Send
	ldi R16, 0b11111111
	sts 0x004E, R16	

jmp Main_Loop


SPI_STC:
reti
