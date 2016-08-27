;	H_Loop_Blank:
;		-> front porch									 - 5.75us (4.18 + calling(0.57))
;		-> sync pulse (drop H)							 - 0.5us
;		-> back porch (raise H)							 - 1.5us;
;		-> active video (raise colour, then drop colour) - 18us
;
;				Here, output data must all be 0
;
;	return			

H_Loop_Blank:
// front porch - 5.75us (5.18 + return&calling(0.57))
	call wait_1us
	call wait_1us
	call wait_1us
	call wait_1us
	call wait_1us
	nop
	nop
	nop
// sync pulse (drop H) - 0.5us
	out PortC, DropH
	nop
	nop
	nop
	nop
	nop
	nop
	nop
// back porch (raise H) - 1.5us
	out PortC, RaiseHV
	call Wait_1us
	nop
	nop
	nop
	nop
	nop
	nop
	nop
// active video (raise colour, then drop colour) - 18us
	out PortB, Blank
	call Wait_10us
	call Wait_1us
	call Wait_1us
	call Wait_1us
	call Wait_1us
	call Wait_1us
	call Wait_1us
	call Wait_1us
	nop nop nop nop nop
	nop nop nop nop nop
	nop nop nop nop nop
	out PortB, Blank
ret
