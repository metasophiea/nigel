//H_Loop3 - 15us
// front porch (drop colour) - 0.5us
// sync pulse (drop H) - 3us
// back porch (raise H) - 1.5us
// active video (raise colour) - 10us

//V_Loop3 - 5us
// front porch (drop colour) - 0.5us
// sync pulse (drop H&V) - 3us
// back porch (raise H&V) - 1.5us

/*
- H_loop3 preformed 489 times, followed by a V_loop3 -
H_loop3 takes 15us


*/
V_Loop3: // - 5us
//front porch (drop colour) - 0.5us
	out PortD, R16
		nop
		nop
		nop
		nop
		nop
		nop
		nop
//sync pulse (drop H&V) - 3us
	out PortD, R18
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
//back porch (raise H&V) - 1.5us
	out PortD, R16	
	call wait_1us
		nop
		nop
		nop
ret

H_Loop3: // - 15us
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
//active video (raise colour) - 10us
	out PortD, R19
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
ret

/*
V_Loop3: // - 5us
//front porch (drop colour) - 0.5us
	out PortD, R16
		nop
		nop
		nop
		nop
		nop
		nop
		nop
//sync pulse (drop H&V) - 3us
	out PortD, R18
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
//back porch (raise H&V) - 1.5us
	out PortD, R16	
	call wait_1us
		nop
		nop
		nop
ret
*/



/* double V_loop3

V_Loop3: // - 10us
//front porch (drop colour) - 1us
	out PortD, R16
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
//sync pulse (drop H&V) - 6us
	out PortD, R18
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
//back porch (raise H&V) - 3us
	out PortD, R16	
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
ret

*/

/* V_loop3 at 40us
V_Loop3: // - 40us
//front porch (drop colour) - 4us
	out PortD, R16
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
//sync pulse (drop H&V) - 24us
	out PortD, R18
	call wait_1us
	call wait_10us
	call wait_10us
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
//back porch (raise H&V) - 12us
	out PortD, R16	
	call wait_10us
	
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
ret
*/