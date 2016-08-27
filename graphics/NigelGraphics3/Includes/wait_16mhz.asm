wait_1us://at 16mhz
 	    nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
ret

wait_10us://at 16mhz
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

wait_60us://at 16mhz
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