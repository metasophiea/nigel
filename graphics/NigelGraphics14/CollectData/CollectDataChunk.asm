//Here, one may change the action of collecting and storing the double pixel data

//Basic
//	Replaces data with new data
;	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea

//Memory Foam
//	Only replaces data with new data, when new data has a marker (the fourth bit)

; collect byte															 	
; collect currently in use byte	into blender byte	
;					switch
;|ChangeBoth				|ChangeHigh										|ChangeLow										|ChangeNeither
;|Simpley replace byte		|Place old data in blenderByte					|Place old data in blenderByte					|waste time
;|							|Clear top four bits							|Clear bottom four bits							|
;|							|Clear bottom four bits of FreshDataLandingArea	|Clear top four bits of FreshDataLandingArea	|
;|							|OR FreshDataLandingArea into blenderByte		|OR FreshDataLandingArea into blenderByte		|
; remove markers
; store blenderbyte

;the switch
;
;							(3)\/no-----------------TestHigh-----------------yes\/(4)
;							nop
;				(3)\/no-----TestLow-----yes\/(4)				  (3)\/no-----TestLow-----yes\/(4)
;				nop						jmp Low					  nop					  jmp Both
;				jmp Neither										  jmp High			

CollectDataChunk:
in FreshDataLandingArea, PinD 
ld R28, Z	

SBRC FreshDataLandingArea, 7
	jmp CollectDataChunk_TestAgain
nop
SBRC FreshDataLandingArea, 3
	jmp	CollectDataChunk_ChangeLow
nop
jmp	CollectDataChunk_ChangeNeither

CollectDataChunk_TestAgain:
	SBRC FreshDataLandingArea, 3
		jmp	CollectDataChunk_ChangeBoth
	nop
	jmp	CollectDataChunk_ChangeHigh

CollectDataChunk_ChangeBoth:
	mov R28, FreshDataLandingArea			//(1)
	nop nop nop nop							//(4)
	jmp CollectDataChunk_End				//(3)

CollectDataChunk_ChangeHigh:
	ld R28, Z								//(2)
	andi R28, 0b00001111					//(1)
	andi FreshDataLandingArea, 0b11110000	//(1)
	or R28, FreshDataLandingArea			//(1)
	jmp CollectDataChunk_End				//(3)

CollectDataChunk_ChangeLow:
	ld R28, Z								//(2)
	andi R28, 0b11110000					//(1)
	andi FreshDataLandingArea, 0b00001111	//(1)
	or R28, FreshDataLandingArea			//(1)
	jmp CollectDataChunk_End				//(3)

CollectDataChunk_ChangeNeither:
	nop nop nop nop nop						//(5)
	jmp CollectDataChunk_End				//(3)

CollectDataChunk_End:
	//remove markers and store blenderbyte
	andi R28, 0b01110111
	st Z+, R28
ret

