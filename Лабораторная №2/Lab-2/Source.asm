.686
.model flat,stdcall
.stack 100h
.data
	; X new 7000h
	;X dw 0FC6Ah
	;Y dw 0F639h
	Z dw 6132h
	M dw ?
	R dw ?
	ans dw ?
	tmp1 dw ? ; X'
	tmp2 dw ? ; Y'
	arr dw 0FC6Ah, 0F639h
.code
ExitProcess PROTO STDCALL :DWORD
Start:
	mov eax, 0
	mov ebx, 0

	mov ecx, 2
	mov ax, arr[0]
	mov bx, arr[0 + 2]
	; Task 1
lp:
	cmp cx, 2
	je ymark
	jmp xmark

ymark:
	and bx, 1111011110111101b
	mov tmp2, bx
	jmp L1
xmark:
	or ax, 0000100010001000b
	mov tmp1, ax
	jmp L1
L1:
loop lp
; Task 2
; Calc M
mov ax, tmp1
sub ax, Z ; X' - Z
mov bx, tmp2
sub bx, Z ; Y' - Z
and ax, bx
mov M, ax
; Comparison
cmp M, 0
jl P1
jmp P2

P1:
	add ax, 123h
	mov R, ax
	jmp T3
P2:
	sub ax, 999h
	mov R, ax
	jmp T3

; Task 3
T3:
	cmp R, 09h
	jle L2
	jmp L3
L2:
	call fun_1
	jmp exit
L3:
	call fun_2
	jmp exit

fun_1:
	mov ax, R
	rcl ax, 4
	mov ans, ax
	ret

fun_2:
	mov ax, R
	or ax, 1001h
	mov ans, ax
	ret

exit:
Invoke ExitProcess,1
End Start
