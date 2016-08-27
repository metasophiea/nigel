;	H_Loop:
;		-> front porch									 - 5.75us (4.18 + calling(0.57))
;		-> sync pulse (drop H)							 - 0.5us
;		-> back porch (raise H)							 - 1.5us
;			|While here:
;			|	Incriment 'Screen_ScanLineCount'							- (1)
;			|	Compare 'Screen_ScanLineCount' with 'Screen_ScanLineNumber'	- (1)					
;			|	BranchOnEqual ->	|NotEqual	- (1)		||Equal						
;			|						||Jump					||											 - (2)
;			|						||To					|Clear 'Screen_ScanLineCount'				 - (1)
;			|						||End		- (3)		|Incriment 'Nigel_HorizontalPixelLineCount'	 - (1)									
;			|												|#End
;			|	Multiply 'Nigel_HorizontalPixelNumber' by 'Nigel_VerticalPixelLineCount' - (2)
;			|	Incriment R1 (the High8 result, to get it above the 0x00nn range)		 - (1)
;			|	Move R1 to R31	(setting up Z to collect 								 - (1)
;			|	Move R0 to R30		the next pixel colour data)							 - (1)
;			|This totals 11 ticks
;		-> active video (raise colour, then drop colour) - 18us
;
;				Here, PixelColourData must be collected from the RAM and placed into the output pins
;
;	return			

H_Loop:
// front porch - 2.63us (2.06 + return&calling(0.57))
	call wait_1us
	call wait_1us
	nop
// sync pulse (drop H) - 0.5us
	out PortC, DropH 
	nop nop nop nop nop
	nop	nop
// back porch (raise H) - 1.5us
	out PortC, RaiseHV

	inc Screen_ScanLineCount
	cp Screen_ScanLineCount, Screen_ScanLineNumber
	breq H_Loop_CountTest_Equal
		jmp H_Loop_CountTest_End
	H_Loop_CountTest_Equal:
		ldi Screen_ScanLineCount, 0xFF
		inc Nigel_VerticalPixelLineCount
	H_Loop_CountTest_End:
	
	mul Nigel_HorizontalPixelNumber, Nigel_VerticalPixelLineCount
	inc R1 ;(the High8 result, to get it above the 0x00nn range)
	mov R31, R1 ;(setting up Z to collect 
	mov R30, R0 ;	the next pixel colour data)	

	nop nop nop nop nop
	nop nop nop nop nop

	ld PixelColourData, Z+
// active video (raise colour, then drop colour) - 21.13us
	//there's 51
	out PortB, PixelColourData nop nop swap PixelColourData out PortB, PixelColourData

// collect byte:	ld PixelColourData, Z+
// display byte:	out PortB, PixelColourData
// swap byte:		swap PixelColourData
// display byte:	out PortB, PixelColourData

	ld PixelColourData, Z+ nop out PortB, PixelColourData nop nop swap PixelColourData out PortB, PixelColourData 
	ld PixelColourData, Z+ nop out PortB, PixelColourData nop nop swap PixelColourData out PortB, PixelColourData 
	ld PixelColourData, Z+ nop out PortB, PixelColourData nop nop swap PixelColourData out PortB, PixelColourData 
	ld PixelColourData, Z+ nop out PortB, PixelColourData nop nop swap PixelColourData out PortB, PixelColourData 
	ld PixelColourData, Z+ nop out PortB, PixelColourData nop nop swap PixelColourData out PortB, PixelColourData 
	ld PixelColourData, Z+ nop out PortB, PixelColourData nop nop swap PixelColourData out PortB, PixelColourData 
	ld PixelColourData, Z+ nop out PortB, PixelColourData nop nop swap PixelColourData out PortB, PixelColourData 
	ld PixelColourData, Z+ nop out PortB, PixelColourData nop nop swap PixelColourData out PortB, PixelColourData 
	ld PixelColourData, Z+ nop out PortB, PixelColourData nop nop swap PixelColourData out PortB, PixelColourData 
	ld PixelColourData, Z+ nop out PortB, PixelColourData nop nop swap PixelColourData out PortB, PixelColourData 
	ld PixelColourData, Z+ nop out PortB, PixelColourData nop nop swap PixelColourData out PortB, PixelColourData 
	ld PixelColourData, Z+ nop out PortB, PixelColourData nop nop swap PixelColourData out PortB, PixelColourData 
	ld PixelColourData, Z+ nop out PortB, PixelColourData nop nop swap PixelColourData out PortB, PixelColourData 
	ld PixelColourData, Z+ nop out PortB, PixelColourData nop nop swap PixelColourData out PortB, PixelColourData 
	ld PixelColourData, Z+ nop out PortB, PixelColourData nop nop swap PixelColourData out PortB, PixelColourData 
	ld PixelColourData, Z+ nop out PortB, PixelColourData nop nop swap PixelColourData out PortB, PixelColourData 
	ld PixelColourData, Z+ nop out PortB, PixelColourData nop nop swap PixelColourData out PortB, PixelColourData 
	ld PixelColourData, Z+ nop out PortB, PixelColourData nop nop swap PixelColourData out PortB, PixelColourData 
	ld PixelColourData, Z+ nop out PortB, PixelColourData nop nop swap PixelColourData out PortB, PixelColourData 
	ld PixelColourData, Z+ nop out PortB, PixelColourData nop nop swap PixelColourData out PortB, PixelColourData 
	ld PixelColourData, Z+ nop out PortB, PixelColourData nop nop swap PixelColourData out PortB, PixelColourData 
	ld PixelColourData, Z+ nop out PortB, PixelColourData nop nop swap PixelColourData out PortB, PixelColourData 
	ld PixelColourData, Z+ nop out PortB, PixelColourData nop nop swap PixelColourData out PortB, PixelColourData 
	ld PixelColourData, Z+ nop out PortB, PixelColourData nop nop swap PixelColourData out PortB, PixelColourData 
	ld PixelColourData, Z+ nop out PortB, PixelColourData nop nop swap PixelColourData out PortB, PixelColourData 
	ld PixelColourData, Z+ nop out PortB, PixelColourData nop nop swap PixelColourData out PortB, PixelColourData 
	ld PixelColourData, Z+ nop out PortB, PixelColourData nop nop swap PixelColourData out PortB, PixelColourData 
	ld PixelColourData, Z+ nop out PortB, PixelColourData nop nop swap PixelColourData out PortB, PixelColourData 
	ld PixelColourData, Z+ nop out PortB, PixelColourData nop nop swap PixelColourData out PortB, PixelColourData 
	ld PixelColourData, Z+ nop out PortB, PixelColourData nop nop swap PixelColourData out PortB, PixelColourData 
	ld PixelColourData, Z+ nop out PortB, PixelColourData nop nop swap PixelColourData out PortB, PixelColourData 
	ld PixelColourData, Z+ nop out PortB, PixelColourData nop nop swap PixelColourData out PortB, PixelColourData 
	ld PixelColourData, Z+ nop out PortB, PixelColourData nop nop swap PixelColourData out PortB, PixelColourData 
	ld PixelColourData, Z+ nop out PortB, PixelColourData nop nop swap PixelColourData out PortB, PixelColourData 
	ld PixelColourData, Z+ nop out PortB, PixelColourData nop nop swap PixelColourData out PortB, PixelColourData 
	ld PixelColourData, Z+ nop out PortB, PixelColourData nop nop swap PixelColourData out PortB, PixelColourData 
	ld PixelColourData, Z+ nop out PortB, PixelColourData nop nop swap PixelColourData out PortB, PixelColourData 
	ld PixelColourData, Z+ nop out PortB, PixelColourData nop nop swap PixelColourData out PortB, PixelColourData 
	ld PixelColourData, Z+ nop out PortB, PixelColourData nop nop swap PixelColourData out PortB, PixelColourData nop nop//39

	out PortB, DropV ;extra (to stop last pixel from streching) (Black Frame on right)
	nop nop nop nop nop
	nop nop nop nop nop
	nop nop	nop nop nop 
	nop nop nop
	
	out PortB, Blank
ret
