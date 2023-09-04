org 0H
	enable EQU P3.1
	num1 EQU P1
	num2 EQU P2
	result EQU P0
	LJMP MAIN



MAIN:
	JNB enable, MAIN  	; check enable

	CLR A				; rst
	JB P3.2, SUM	   	; check operator
	
	MOV A, num1		  	; sub
	CLR C				; rst carry-bit flag
	SUBB A, num2



showResult:
	MOV result, A
	SJMP MAIN



SUM:
	MOV A, num1
	ADD A, num2
	SJMP showResult



END