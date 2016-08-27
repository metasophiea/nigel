// Max memory 2048bytes (0x0800)
// so, 51*40 NigelPixels results in a 1.275 aspect ratio
// (that's 51 colums and 40 rows) 
// 2040 pixels, same amount of bytes requred

// memory range: 0x0100 - 0x07F8

// DataUpdateAddressCounter
;	.def DataUpdateAddressCounter_High8 = R26 
;	.def DataUpdateAddressCounter_Low8 = R27 
;	.def FreshDataLandingArea = R25 clr R25

CollectNextPixel: //(including call and return) - 3.13us
//Test that we're in range, and when we get to 0x08F9 (0x08F8+1 on one pixel a loop)
//	If so, carry on
//	If not, Reset DataUpdateAddressCounter to 0x0100
;compare DataUpdateAddressCounter_High8 (R26) with 0x08
;			|	BranchOnEqual ->	|NotEqual	- (1)		||Equal						
;			|						|nop					||			 - (2)
;			|						|nop					|Compare DataUpdateAddressCounter_Low8 (R27) with 0xF9
;			|						|nop					||BranchOnEqual ->	|NotEqual	- (1)		||Equal	
;			|						|nop					||					|nop					||			 - (2)
;			|						||Jump					||					|Jump					|Clear DataUpdateAddressCounter_High8
;			|						||To					||					|To						|Clear DataUpdateAddressCounter_Low8
;			|						||End		- (3)		||					|End		- (3)		|Incriemnt DataUpdateAddressCounter_High8							
;																										#End


//always comapre number to max memory address used (0x08F8) plus the number of collections made in this loop
//	currently: 8 (0x08)
//	0x08F8 + 0x08 = 0x0900

 	cpi R26, 0x08
	breq CollectNextPixel_DataUpdateAddressCounter_High8_Equal	
		nop
		nop
		nop
		nop
		jmp CollectNextPixel_DataUpdateAddressCounter_End
	CollectNextPixel_DataUpdateAddressCounter_High8_Equal:
		cpi R27, 0xF8
		breq CollectNextPixel_DataUpdateAddressCounter_Low8_Equal
			nop
			jmp CollectNextPixel_DataUpdateAddressCounter_End
		CollectNextPixel_DataUpdateAddressCounter_Low8_Equal:
			clr R26
			clr R27
			inc R26 
	CollectNextPixel_DataUpdateAddressCounter_End:

	//High8 unequal:			 0.56
	//High8 equal, Low8 unequal: 0.56
	//High8 equal, Low8 equal:	 0.56

//prepare for sending 'Signal Ready'
	mov R30, R27 //
	mov R31, R26 // Z pointer prepared (should be reset afterwards anyway)
	in FreshDataLandingArea, PortC
	mov R2, FreshDataLandingArea //Disactivate 'Signal Ready' Prepared
	or R3, FreshDataLandingArea	 //Activate 'Signal Ready' Prepared
	
//Go!
	out PortC, R3 // interupts controller
	//<could need a delay here, for controller to react>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea //(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea	//(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea	//(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea //(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea	//(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea	//(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea	//(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea	//(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea //(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea	//(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea	//(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea //(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea	//(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea	//(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea	//(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea	//(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea //(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea	//(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea	//(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea //(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea	//(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea	//(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea	//(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea	//(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea //(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea	//(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea	//(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea //(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea	//(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea	//(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea	//(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea	//(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea //(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea	//(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea	//(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea //(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea	//(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea	//(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea	//(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea	//(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea //(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea	//(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea	//(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea //(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea	//(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea	//(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea	//(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea	//(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea //(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea	//(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea	//(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea //(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea	//(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea	//(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea	//(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea	//(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea //(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea	//(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea	//(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea //(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea	//(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea	//(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea	//(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea	//(3) <could need delay here, for controller to obtain new data> //64

	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea //(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea	//(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea	//(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea //(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea	//(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea	//(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea	//(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea	//(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea //(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea	//(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea	//(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea //(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea	//(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea	//(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea	//(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea	//(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea //(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea	//(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea	//(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea //(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea	//(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea	//(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea	//(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea	//(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea //(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea	//(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea	//(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea //(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea	//(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea	//(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea	//(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea	//(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea //(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea	//(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea	//(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea //(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea	//(3) <could need delay here, for controller to obtain new data>
	in FreshDataLandingArea, PinD 	st Z+, FreshDataLandingArea	//(3) <could need delay here, for controller to obtain new data> //38
//Stop!
	out PortC, R2
	mov R27, R30 //	store next requred pixel address
	mov R26, R31 // 
ret