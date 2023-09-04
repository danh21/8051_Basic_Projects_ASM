ORG 0000H
	Col EQU P2
	Row EQU P0
	select_Col EQU R2
    MOV select_Col, #07FH	; init, select column 0



MAIN:
	MOV DPTR, #BITMAP		; data pointer to get each byte



SUBMAIN:   
    MOV A, #0				; display led matrix
    MOVC A, @A+DPTR	 
    MOV Row, A			 
    MOV Col, select_Col			 

    CALL  DELAY		

   	MOV Col, #0FFH       	; unselect columns

    INC DPTR			 	; get next byte

    MOV A, select_Col		; select next column
    RR A				 	
    MOV select_Col, A	

    CJNE A, #07FH, SUBMAIN	 
    JMP MAIN			 	; reset



DELAY:
    MOV R7, #200		 
    DJNZ R7, $			 	; decrease R7, until R7 = 0 -> exit loop
	RET		



BITMAP:	     
	DB 0H,0FFH,0FFH,0C3H,0C3H,7EH,3CH,0H


   
END