	ORG 00H				 	; reset
	LJMP MAIN			 
	ORG 0BH				   	; timer0 interrupt
	LJMP TIMER_INT0			
	ORG 30H	
						


MAIN:	
	MOV IE, #82H			; enable global, timer0 interrupt

	MOV TMOD, #01H			; timer0, mode 16-bit
	MOV TL0, #LOW(-5000)	; 100Hz <-> 10,000us 
	MOV TH0, #HIGH(-5000)
	SETB TR0				; start timer0

	SJMP $					; while(1)


													
TIMER_INT0:
	CPL P1.0				; toggle
			
	MOV TL0, #LOW(-5000)	; 5,000us
	MOV TH0, #HIGH(-5000)
	SETB TR0		 		; start timer0
						
	RETI



END								  	