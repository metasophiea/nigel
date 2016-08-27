//V_Loop5 - 
// front porch (drop colour) - 0.5us
// sync pulse (drop H&V) - 3us
// back porch (raise H&V) - 1.5us

V_Loop:
// front porch - 0.5us (-2.44)

// sync pulse (drop H&V) - 3us
	out PortD, R20
// back porch (raise H&V) - 1.5us
	out PortD, R22
// active video (raise colour, then drop it) - 25us
	out PortD, R22
	out PortD, R22
ret
