Wait_1us:
 	    nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
ret

Wait_10us:
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
ret

Wait_100us:
	call wait_10us
	call wait_10us
	call wait_10us
	call wait_10us
	call wait_10us
	call wait_10us
	call wait_10us
	call wait_10us
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
ret