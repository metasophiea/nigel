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

H_Loop_blank:
// front porch - 5.75us (4.18 + calling(0.57))
	call wait_1us
	call wait_1us
	call wait_1us
	call wait_1us
	call wait_1us
	nop
	nop
	nop
// sync pulse (drop H) - 0.5us
	out PortD, R17
	nop
	nop
	nop
	nop
	nop

	nop
	nop
// back porch (raise H) - 1.5us
	out PortD, R18
	call wait_1us
	nop
	nop
	nop
	nop
	nop
	ldi R30, 0x00;nop
	ldi R31, 0x01;nop
// active video (raise colour, then drop colour) - 18us
	out PortB, R16
	call wait_10us
	call wait_1us
	call wait_1us
	call wait_1us
	call wait_1us
	call wait_1us
	call wait_1us
	call wait_1us
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
	clr R22
	clr R21

	nop//
	out PortB, R16
ret
