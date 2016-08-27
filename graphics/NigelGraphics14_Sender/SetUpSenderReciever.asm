/*
SPI Interrupts-yes (1)
SPI-On (1)
Data Order-MSB (0)
Master-yes (1)
Clock Polarity-low when idle (0)
Clock Phase-LeadingEdge-sample (0)
			TrailingEdge-setup
SPI Clock Rate-F_osc/4 (0)
*/
//Input All Of Above
	ldi R16, 0b11010000
	sts SPCR, R16

//Select Chip (setting B2 low)
	cbi PortB, 2

//setup pin B1 as interrupt//
	//PCICR
	ldi R16, 0b00000001
	sts 0x68, R16
	//PCMSK0
	ldi R16, 0b00000001
	sts 0x6B, R16

//Enable Global Interrupts
	;SEI

//Write Out to SPI
;	ldi R16, 0b00000010
;	sts 0x004E, R16