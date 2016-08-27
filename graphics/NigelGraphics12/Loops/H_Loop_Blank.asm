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
// front porch - 2.63us (2.06 + return&calling(0.57))
	call wait_1us
	call wait_1us
	nop
// sync pulse (drop H) - 0.5us
	out PortB, DropH
	nop
	nop
	nop
	nop
	nop
	nop
	nop
// back porch (raise H) - 1.5us
	out PortB, RaiseHV
	call Wait_1us
	nop
	nop
	nop
	nop
	nop
	nop
	nop
// active video (raise colour, then drop colour) - 23.2usus
	out PortC, Blank
	call Wait_10us
	call Wait_10us
	nop nop nop nop nop
	nop nop nop nop nop
	nop nop nop	nop nop 
	nop nop 
	out PortC, Blank
ret
