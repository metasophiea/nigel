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

H_Loop:
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

	inc R21
	cpi R21, 0x0E
	brne H_Loop_CountTest_NotEqual
	nop
		clr R21
		inc R22
		//ldi R19, 0x02 sts 0x0100, R19
		jmp H_Loop_CountTest_End
	H_Loop_CountTest_NotEqual:
		nop
		nop
		//ldi R19, 0x00 sts 0x0100, R19
		jmp H_Loop_CountTest_End
	H_Loop_CountTest_End:


	//multiply 0x2a by R22 to get current starting address
	ldi R19, 0x2A
	mul R22, R19
	inc R1
	mov R31, R1
	mov R30, R0

	//nop
	nop

	nop
	nop
	nop
	nop
	nop;ldi R30, 0x00;nop
	nop;ldi R31, 0x01;nop
	ld R19, Z+	//collect pixel 
// active video (raise colour, then drop colour) - 18us (300 commands)
	out PortB, R19 nop nop nop nop

	ld R19, Z+ out PortB, R19  nop nop nop nop
	ld R19, Z+ out PortB, R19  nop nop nop nop
	ld R19, Z+ out PortB, R19  nop nop nop nop
	ld R19, Z+ out PortB, R19  nop nop nop nop
	ld R19, Z+ out PortB, R19  nop nop nop nop
	ld R19, Z+ out PortB, R19  nop nop nop nop
	ld R19, Z+ out PortB, R19  nop nop nop nop
	ld R19, Z+ out PortB, R19  nop nop nop nop
	ld R19, Z+ out PortB, R19  nop nop nop nop
	ld R19, Z+ out PortB, R19  nop nop nop nop
							   	   
	ld R19, Z+ out PortB, R19  nop nop nop nop
	ld R19, Z+ out PortB, R19  nop nop nop nop
	ld R19, Z+ out PortB, R19  nop nop nop nop
	ld R19, Z+ out PortB, R19  nop nop nop nop
	ld R19, Z+ out PortB, R19  nop nop nop nop
	ld R19, Z+ out PortB, R19  nop nop nop nop
	ld R19, Z+ out PortB, R19  nop nop nop nop
	ld R19, Z+ out PortB, R19  nop nop nop nop
	ld R19, Z+ out PortB, R19  nop nop nop nop
	ld R19, Z+ out PortB, R19  nop nop nop nop
							   	   
	ld R19, Z+ out PortB, R19  nop nop nop nop
	ld R19, Z+ out PortB, R19  nop nop nop nop
	ld R19, Z+ out PortB, R19  nop nop nop nop
	ld R19, Z+ out PortB, R19  nop nop nop nop
	ld R19, Z+ out PortB, R19  nop nop nop nop
	ld R19, Z+ out PortB, R19  nop nop nop nop
	ld R19, Z+ out PortB, R19  nop nop nop nop
	ld R19, Z+ out PortB, R19  nop nop nop nop
	ld R19, Z+ out PortB, R19  nop nop nop nop
	ld R19, Z+ out PortB, R19  nop nop nop nop
							   	   
	ld R19, Z+ out PortB, R19  nop nop nop nop
	ld R19, Z+ out PortB, R19  nop nop nop nop
	ld R19, Z+ out PortB, R19  nop nop nop nop
	ld R19, Z+ out PortB, R19  nop nop nop nop
	ld R19, Z+ out PortB, R19  nop nop nop nop
	ld R19, Z+ out PortB, R19  nop nop nop nop
	ld R19, Z+ out PortB, R19  nop nop nop nop
	ld R19, Z+ out PortB, R19  nop nop nop 
	ld R19, Z+ out PortB, R19  nop nop nop 
	ld R19, Z+ out PortB, R19  nop nop nop 
							   	   
	ld R19, Z+ out PortB, R19  nop nop nop 
	//ld R19, Z+ out PortB, R19  nop nop nop 
	//ld R19, Z+ out PortB, R19  nop nop nop 
	//ld R19, Z+ out PortB, R19  nop nop nop 
	out PortB, R16
ret
