//V_Loop - 
// Hfront porch (-)
// Vfront Porch (-)
// VSync		(drop V (or all))
// Vback porch	(raise V (drop H))
// Hsync		(drop H)
// Hback porch	(raise H)
// activat video (raise colour, then drop colour)




V_Loop:
// Hfront porch - 4.75us (4 + calling and jump(0.75))
	call wait_1us
	call wait_1us
	call wait_1us
	call wait_1us
// Vfront porch - 1us
	call wait_1us
// Vsync (drop all) - 31us
	out PortD, R20
	call wait_10us
	call wait_10us
	call wait_10us
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
// Vback porch	(raise V (drop H)) - 20us
	out PortD, R17
	call wait_10us
	call wait_1us
	call wait_1us
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
	nop
	nop

// Hsync pulse (drop H) - 0.5us
	out PortD, R17
	nop
	nop
	nop
	nop
	nop

	nop
	nop
// Hback porch (raise H) - 0.5us
	out PortD, R18
	nop
	nop
	nop
	nop
	nop
	nop
	nop
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
	nop
	nop
	out PortB, R16
ret