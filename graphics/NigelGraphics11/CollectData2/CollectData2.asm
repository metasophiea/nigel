;For when you don't have to break up the collection (v2)

// memory range: 0x0100 - 0x07F8
// collect all 2040 bytes

// DataUpdateAddressCounter
;	.def DataUpdateAddressCounter_High8 = R26 
;	.def DataUpdateAddressCounter_Low8 = R27 
;	.def FreshDataLandingArea = R25 clr R25

CollectNextPixel: //(including call and return) - 
//prepare for sending 'Signal Ready'

	ldi R30, 0x00
	ldi R31, 0x01 // Z pointer prepared (should be reset afterwards anyway)

//Go!
	sbi PortB, 1 // interupts controller

	//10 to react
		nop nop nop nop nop
		nop nop nop nop nop 
	//6 to prepare
		nop nop nop nop nop
		nop 
	//8 to load and send first data
		nop nop nop nop nop
		nop nop nop

	// 2040/2040=1
	lds FreshDataLandingArea, 0x004E st Z+, FreshDataLandingArea nop nop nop nop
	

//Stop!
	cbi PortB, 1


ret


;-Sender-						-Reciever-			
;getting value	ld R16, X+		getting value	lds FreshDataLandingArea, 0x004E
;getting value					getting value 
;loading value	sts 0x004E, R16	storing value	st Z+, FreshDataLandingArea	
;loading value					storing value
;sending value					nop				nop
;sending value					nop				nop
;sending value					nop 			nop
;sending value					nop				nop
