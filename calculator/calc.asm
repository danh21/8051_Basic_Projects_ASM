;sw7 = 1 -> add
;sw7 = 0 -> sub
;sw[6:4] is num1, sw[2:0] is num2
;show result on led7seg



; 0-14 on led7seg
mov 30H, #0C0H
mov 31H, #0F9H
mov 32H, #0A4H
mov 33H, #0B0H
mov 34H, #099H
mov 35H, #092H
mov 36H, #082H
mov 37H, #0F8H
mov 38H, #080H
mov 39H, #090H 
mov 3AH, #088H
mov 3BH, #083H
mov 3CH, #0C6H
mov 3DH, #0A1H
mov 3EH, #086H



; store num2
mov a, P2
mov 40H, a
anl a, #07H 
mov 41H, a

; store num1
anl 40H, #70H
mov a, 40H
swap a



; check operator
jnb P2.7, subtraction

addition:
	add a, 41H
	jmp showResult

subtraction:
	subb a, 41H



showResult:
	add a, #30H
	mov R0, a
	mov p1, @R0
