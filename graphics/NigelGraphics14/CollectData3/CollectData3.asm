// memory range: 0x0100 - 0x07F8
// collect all 2040 bytes

// DataUpdateAddressCounter
;	.def DataUpdateAddressCounter_High8 = R26 
;	.def DataUpdateAddressCounter_Low8 = R27 
;	.def FreshDataLandingArea = R25 clr R25

//Signal Other Chip That We're Ready
	sbi PortC, 3 ;(2)

//wait
	sbi PortD, 0
CollectData3_Loop:
	in R29, SPSR
	sbrs R29, SPIF
	jmp CollectData3_Loop ;(3)
//byte recieved
SPI_STC:

//Stop Signal
	cbi PortC, 3 ;(2)
	cbi PortD, 0

//Now Ship Byte into place
;	lds R25, 0x004E ;(2)
;	St X+, R25 ;(2)

