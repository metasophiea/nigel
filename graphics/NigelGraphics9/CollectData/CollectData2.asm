;For when you don't have to break up the collection (v1) //(4198.13)
/*

// Max memory 2048bytes (0x0800)
// 74*55 NigelPixels results in a 1.3454545.. aspect ratio, with in 4070 NigelPixels, using 2035 bytes
// (that's 74 colums and 55 rows) 

// memory range: 0x0100 - 0x08F3

CollectNextPixel: //(including call and return) - 

//prepare for sending 'Signal Ready'

	ldi R30, 0x00 //
	ldi R31, 0x01 // Z pointer prepared (should be reset afterwards anyway)
	in FreshDataLandingArea, PortC
	mov R2, FreshDataLandingArea //'Disactivate Signal Ready' Prepared
	or R3, FreshDataLandingArea	 //'Activate Signal Ready' Prepared
	
//Go!
	out PortC, R3 // interupts controller
	//<could need a delay here, for controller to react>
	// now take, store and advance Z pointer for all bytes (2035)
	#include "CollectData/1000CollectDataChunks.asm"
	#include "CollectData/1000CollectDataChunks.asm"
	#include "CollectData/10CollectDataChunks.asm"
	#include "CollectData/10CollectDataChunks.asm"
	#include "CollectData/10CollectDataChunks.asm"
	call CollectDataChunk //(2.07)
	call CollectDataChunk
	call CollectDataChunk
	call CollectDataChunk
	call CollectDataChunk
//Stop!
	out PortC, R2//signals controler to stop
ret

*/