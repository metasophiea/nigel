//V_Loop5 - 
// front porch (drop colour) - 0.5us
// sync pulse (drop H&V) - 3us
// back porch (raise H&V) - 1.5us

V_Loop:
// front porch - 1.5us (- whatever a call is)
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop

// sync pulse (drop H&V) - 3us
	out PortD, R16
	call Wait_1us
	call Wait_1us
	ldi R30, 0x00
	ldi R31, 0x01
	nop
	nop
	nop

	nop
	nop
	nop
	nop
	nop

	nop
	nop
	nop
	nop
	nop
// back porch (raise H&V) - 1.5us
	out PortD, R18
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	call GetNextPixel
// active video (raise colour) - 25us
	out PortD, R19
	call GetNextPixel
	out PortD, R19
	call GetNextPixel
	out PortD, R19
	call GetNextPixel
	out PortD, R19
	call GetNextPixel
	out PortD, R19
	call GetNextPixel
	out PortD, R19
	call GetNextPixel
	out PortD, R19
	call GetNextPixel
	out PortD, R19
	call GetNextPixel
	out PortD, R19
	call GetNextPixel
	out PortD, R19
	call GetNextPixel
	out PortD, R19
	call GetNextPixel
	out PortD, R19
	call GetNextPixel
	out PortD, R19
	call GetNextPixel
	out PortD, R19
	call GetNextPixel
	out PortD, R19
	call GetNextPixel
	out PortD, R19
	call GetNextPixel
	out PortD, R19
	call GetNextPixel
	out PortD, R19
	call GetNextPixel
	out PortD, R19
	call GetNextPixel
	out PortD, R19
	call GetNextPixel
	out PortD, R19
	call GetNextPixel
	out PortD, R19
	call GetNextPixel
	out PortD, R19
	call GetNextPixel
	out PortD, R19
	/*call GetNextPixel
	out PortD, R19*/

	nop
	nop
	nop
	nop
	nop

	nop
	nop
	nop

	out PortD, R18
ret
