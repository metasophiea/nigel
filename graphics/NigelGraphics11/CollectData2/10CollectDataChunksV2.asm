;-Sender-						-Reciever-			
;getting value	ld R16, X+		getting value	lds FreshDataLandingArea, 0x004E
;getting value					getting value 
;loading value	sts 0x004E, R16	storing value	st Z+, FreshDataLandingArea	
;loading value					storing value
;sending value					nop				nop
;sending value					nop				nop
;sending value					nop 			nop
;sending value					nop				nop

lds FreshDataLandingArea, 0x004E st Z+, FreshDataLandingArea nop nop nop nop
lds FreshDataLandingArea, 0x004E st Z+, FreshDataLandingArea nop nop nop nop
lds FreshDataLandingArea, 0x004E st Z+, FreshDataLandingArea nop nop nop nop
lds FreshDataLandingArea, 0x004E st Z+, FreshDataLandingArea nop nop nop nop
lds FreshDataLandingArea, 0x004E st Z+, FreshDataLandingArea nop nop nop nop
lds FreshDataLandingArea, 0x004E st Z+, FreshDataLandingArea nop nop nop nop
lds FreshDataLandingArea, 0x004E st Z+, FreshDataLandingArea nop nop nop nop
lds FreshDataLandingArea, 0x004E st Z+, FreshDataLandingArea nop nop nop nop
lds FreshDataLandingArea, 0x004E st Z+, FreshDataLandingArea nop nop nop nop
lds FreshDataLandingArea, 0x004E st Z+, FreshDataLandingArea nop nop nop nop
