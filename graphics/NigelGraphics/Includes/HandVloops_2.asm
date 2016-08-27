//V_Loop2 - 16684us
// front porch - 95us
// sync pulse - 64us
// back porch - 763us
// active video - 15762us

//H_Loop2 - 31.778us
// sync pulse (drop H) - 3.813us
// back porch (raise H) - 1.589us (1.907us for borderless)
// active video (raise colour) - 26.058us (25.422us for borderless)
// front porch (drop colour) - 0.318us (0.636us for borderless)

// When you think about it, the V_loop2 active time, includes all the H_loop2 loops..thus:
//V_Loop2 - 16684us
// front porch - 95us
// sync pulse - 64us
// back porch - 763us


V_Loop2:
//sync pulse - 64us
//back porch - 763us
//active video - 15762us
//front porch - 95us
ret

H_Loop2: // - 31.778us
//sync pulse (drop H) - 3.813us
	out PortD, R17
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
//back porch (raise H) - 1.589us
	out PortD, R16	
	call wait_1us
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	//(missing 0.02us)
//active video (raise colour) - 26.058us
	out PortD, R19
	call wait_10us
	call wait_10us
	call wait_1us
	call wait_1us
	call wait_1us
	call wait_1us
	call wait_1us
	call wait_1us
	//(0.02us too long)
//front porch (drop colour) - 0.318us
	out PortD, R16
ret