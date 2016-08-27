/*
SPI Interrupts-yes (1)
SPI-On (1)
Data Order-MSB (0)
Master-yes (0)
Clock Polarity-low when idle (0)
Clock Phase-LeadingEdge-sample (0)
			TrailingEdge-setup
SPI Clock Rate-F_osc/4 (0)(0)
*/
	ldi R29, 0b11000000
	sts 0x004C, R29

//Enable Global Interrupts
	sei
