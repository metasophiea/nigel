//H_Loop4 - 30us
// front porch (drop colour) - 0.5us
// sync pulse (drop H) - 3us
// back porch (raise H) - 1.5us
// active video (raise colour) - 25us

//V_Loop4 - 5us
// front porch (drop colour) - 0.5us
// sync pulse (drop H&V) - 3us
// back porch (raise H&V) - 1.5us

V_Loop4: // - 
//front porch (drop colour) - 80.5us
	out PortD, R16
	call wait_10us
	call wait_10us
	call wait_10us
	call wait_10us
	call wait_10us
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
//sync pulse (drop H&V) - 50us
	out PortD, R18
	call wait_1us
	call wait_1us
	call wait_1us
	call wait_1us
	call wait_1us
	call wait_1us
	call wait_1us
	call wait_1us
	call wait_1us

	call wait_10us
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
//back porch (raise H&V) - 1.5us
	out PortD, R16	
	call wait_1us
		nop
		nop
		nop
ret

H_Loop4: // - 30us
//front porch (drop colour) - 0.5us
	out PortD, R16
	nop
	nop
	nop
	nop
	nop
	nop
	nop
//sync pulse (drop H) - 3us
	out PortD, R17
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
//back porch (raise H) - 1.5us
	out PortD, R16	
	call wait_1us
		nop
		nop
		nop
		nop
		nop
		nop
		nop
//active video (raise colour) - 22us
	out PortD, R19
	call wait_10us
	call wait_10us
	call wait_1us
		nop
		nop
		nop
		nop
		nop
		nop
		nop
ret
