//H_Loop5 - 
// front porch (drop colour) - 0.5us
// sync pulse (drop H) - 3us
// back porch (raise H) - 1.5us
// active video (raise colour) - 25us


//25 "pixels"
// 1us
//	collect next pixel data from RAM
//	insert into 'Raise Colour' (top for bits of R19)
//	output R19 to port
//
// that's 1 in the 'back porch' section and
// 24 in the 'active video' section

SpecialH_loop:
// front porch - 0.75us (- whatever a call is)
	nop
	nop
	nop

// sync pulse (drop H) - 3us
	out PortD, R17
	call Wait_1us
	call Wait_1us
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
	nop
	nop
// back porch (raise H) - 1.5us
	out PortD, R18
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	call GetNextPixel
// active video (raise colour, then drop colour) - 25us
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
	nop
	nop
	nop
	nop

	out PortD, R18
ret
