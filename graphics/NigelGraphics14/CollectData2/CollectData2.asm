;For when you don't have to break up the collection (v2)

// memory range: 0x0100 - 0x07F8
// collect all 2040 bytes

// DataUpdateAddressCounter
;	.def DataUpdateAddressCounter_High8 = R26 
;	.def DataUpdateAddressCounter_Low8 = R27 
;	.def FreshDataLandingArea = R25 clr R25

CollectNextPixel: //(including call and return) - 
//prepare for sending 'Signal Ready'
;	in FreshDataLandingArea, PortC //Discover what C is currently signalling 
;	mov R2, FreshDataLandingArea //Disactivate 'Signal Ready' Prepared
;		ldi R30, 0x20
;		mov R3, R30
;	or R3, FreshDataLandingArea	 //Activate 'Signal Ready' Prepared

	ldi R30, 0x00
	ldi R31, 0x01 // Z pointer prepared (should be reset afterwards anyway)
	
//Go!
	sbi PortC, 5 // interupts controller
	nop nop nop nop nop
	nop nop nop nop nop
	nop nop nop nop nop

	//2040 times
	#include "CollectData2\1000CollectDataChunksV2.asm"
	#include "CollectData2\1000CollectDataChunksV2.asm"
	#include "CollectData2\10CollectDataChunksV2.asm"
	#include "CollectData2\10CollectDataChunksV2.asm"
	#include "CollectData2\10CollectDataChunksV2.asm"
	#include "CollectData2\10CollectDataChunksV2.asm"

//Stop!
	cbi PortC, 5

ret

