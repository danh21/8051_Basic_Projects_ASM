; view datasheet (LD)
; sw7-sw4 -> num1
; sw3-sw0 -> num2
; sum -> led7seg



; 0-9 on led7seg
MOV 30H, #0C0H	
MOV 31H, #0F9H
MOV 32H, #0A4H
MOV 33H, #0B0H
MOV 34H, #99H
MOV 35H, #92H
MOV 36H, #82H
MOV 37H, #0F8H
MOV 38H, #80H
MOV 39H, #90H 



; calculate sum
MOV A, P2
MOV R1, A
SWAP A
ADD A, R1
ANL A, #0FH



; show result	
ORL A, #30H
MOV R0, A		; address	
MOV P1, @R0		










