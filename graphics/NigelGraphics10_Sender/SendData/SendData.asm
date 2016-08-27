//7.33333.. clock cycles to reach call stage (0.44)
// another 3 clock ticks for call to here (0.18)
// 10.33333.. total

//given 20 tick buffer

//using X pointer
PCINT1Change:
	//Dissable Global Interrupts
	CLI //(1)
	//Setup Chip As Master
	ldi R16, 0b11010000 sts 0x004C, R16
	//Select Output chip
	cbi PortC, 4 //(2)
//Go!
	ld R16, X+ sts 0x004E, R16
//Stop!

	//Deselect Output chip
	sbi PortC, 4

	//Setup Chip As Slave
	ldi R16, 0b11000000 sts 0x004C, R16

	//Enable Global Interrupts
	SEI

	//Reset X Pointer
	ldi R26, 0x00
	ldi R27, 0x01
ret