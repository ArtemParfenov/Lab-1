$MOD51 
org 00h 
	mov dptr,#0b00h ; start at 0B00h
	mov r2, #2000h ; cycle counter
	mov r1, #055h  ; nabor
	clr P1.0
test:
	mov a, r1 
	movx @dptr, a ; xram[dptr] = a
	movx a, @dptr ; a = xram[dptr] -> check 
	xrl a, #055h ; a xor 055h
	jnz error ; if a != 0 -> go to error
	inc dptr ; else increase address
	djnz r2, test ; decrease cycle counter and if r2 != 0 -> go to test
error: ; else error
	setb P1.0 ; light an indicator 
END