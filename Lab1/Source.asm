.686 
.model flat,stdcall

.stack 100h

.data

x db 8 
y db -5 
z db 14
M db ?

.code
ExitProcess PROTO STDCALL :DWORD
Start:
	mov al, z
	add al, x ; Сложение z + x + y в регистре al
	add al, y
	add al, 0

	rcr x, 6
	add bl, x	; Сдвигаем x, y, z и складываем с bl
	rcr y, 6
	add bl, y
	rcr z, 6
	add bl, z

	or al, bl
	mov M, al ; Результат в M

exit:
Invoke ExitProcess, 0
End Start