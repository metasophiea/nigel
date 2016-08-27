//H_Loop5 - 
// front porch (drop colour) - 0.5us
// sync pulse (drop H) - 3us
// back porch (raise H) - 1.5us
// active video (raise colour) - 25us

H_Loop:
// front porch - 0.5us (may have to be shorter due to loop (-2.44us))
	
// sync pulse (drop H) - 3us
	out PortD, R21
// back porch (raise H) - 1.5us
	out PortD, R22
// active video (raise colour, then drop it) - 25us
	out PortD, R22
	out PortD, R22
ret
