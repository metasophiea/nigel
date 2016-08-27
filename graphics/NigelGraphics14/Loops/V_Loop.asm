;	V_Loop
;		-> H front porch									 - 5.75us (4.18 + calling(0.57))
;		-> V front porch									 - 1us
;		-> V sync (drop all)								 - 31us
;		-> V back porch	(raise V (drop H))					 - 20us
;		-> H sync pulse (drop H)							 - 0.5us
;		-> H back porch (raise H)							 - 1.5us;
;		-> H active video (raise colour, then drop colour) - 18us
;
;				Here, output data must all be 0
;
;	return	


V_Loop:
// H front porch - 2.62us (1.87 + calling and jump(0.75))
	call wait_1us
	nop nop nop nop nop nop nop nop nop nop
	nop nop nop nop

// V front porch - 1us
	call wait_1us
// V sync (drop all) - (382.56us)
	out PortD, Blank
	#include "CollectData3/CollectData3.asm"
	call Wait_100us
	call Wait_100us
	call Wait_100us
	call Wait_10us
	call Wait_10us
	call Wait_10us
	call Wait_10us
	call Wait_10us
	call Wait_10us
	call Wait_10us
	call Wait_10us
	call Wait_1us
	call Wait_1us
	call Wait_1us
	call Wait_1us
	call Wait_1us

	nop nop nop nop nop
	nop nop nop nop nop
	nop nop nop nop nop

// V back porch	(raise V (drop H)) - 20us
	out PortD, DropH
	call Wait_10us
	call Wait_10us
	nop nop nop nop nop 
	nop nop nop nop nop
	nop nop
	
	clr Screen_ScanLineCount
	clr Nigel_VerticalPixelLineCount
	ldi R30, 0x00
	ldi R31, 0x01
// H sync pulse (drop H) - 0.5us 
	out PortD, DropH
	nop nop nop nop nop
	nop nop
// H back porch (raise H) - 1.5us
	out PortD, RaiseHV
	call Wait_1us
	nop nop nop nop nop
	nop 
	nop

// H active video (raise colour, then drop colour) - 23.2usus
	out PortC, Blank
	call Wait_10us
	call Wait_10us
	nop nop nop nop nop
	nop nop nop nop nop
	nop nop nop	nop nop 
	nop nop 
	out PortC, Blank
ret
