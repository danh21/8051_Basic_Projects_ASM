SI BIT P3.0 		; Serial Data
SCK BIT P3.1 		; Clock
RCK BIT P3.2 		; Latch

SelectRow EQU P2 	
Pointer EQU R0
Address	EQU R1	
numOfCols EQU R2
Speed EQU R3



ORG 0000H 
MAIN: 
	MOV DPTR, #Content


		       
ShiftRight:  
	MOV Address, #0		
	MOV Speed, #3



LRAM_P: 
	LCALL UploadToRam

	LCALL Scan8Rows

	DJNZ Speed, LRAM_P

	MOV Speed, #3
	DEC Address
	CJNE Address, #80, LRAM_P

	LJMP ShiftRight 



UploadToRam:
	PUSH 01H				; Address
	MOV Pointer, #5fH 		; RAM from 5fH
	MOV numOfCols, #160 	; 80 cols  ?
   
LoopUpload: 
	MOV A, Address 
	MOVC A, @A+DPTR			; get data
	INC Address	 			

	MOV @Pointer, A 		; write into RAM
	INC Pointer	 			

	DJNZ numOfCols, LoopUpload 

	POP 01H

	RET



Scan8Rows: 
	MOV R7, #7 						; init row

LoopRow: 
  	MOV Pointer, #5fH 
 	CLR RCK	

LoopCol:
	CLR SCK 

	MOV A, @Pointer					; get data from RAM	to handle
	CLR C
	RRC A
	MOV @Pointer, A

	SETB SCK  						; SI is shifted into shift reg

	MOV SI, C
		
	INC Pointer	
	CJNE Pointer, #0ffH, LoopCol 	; 160 times
	
	SETB RCK						; latch shift reg data

	MOV SelectRow, R7	 			; scan row		
	LCALL Delay
	MOV SelectRow, #8
	DEC R7
	CJNE R7, #-1, LoopRow

	RET



Delay:	
  	MOV 09H, #8

LoopDelay: 
  	MOV 10H, #250 
    DJNZ 10H, $  			
    DJNZ 09H, LoopDelay		
    RET 



Content: 
	DB 0FFH,90H,90H,90H,0F0H,0H,0FFH,10H,10H,10H,0FFH,0H,3FH,50H,90H,50H,3FH,0H,0FFH,60H,18H,6H,0FFH,0H		// PHAN
	DB 0H,0H,0H,0H 																							// space
	DB 7EH,81H,81H,81H,42H,0H,7EH,81H,81H,81H,7EH,0H,0FFH,60H,18H,6H,0FFH,0H,7EH,81H,89H,89H,4FH,0H         // CONG   
	DB 0H,0H,0H,0H																							// space
	DB 0FFH,81H,81H,81H,7EH,0H,3FH,50H,90H,50H,3FH,0H,0FFH,60H,18H,6H,0FFH,0H,0FFH,10H,10H,10H,0FFH,0H    	// DANH
	END 