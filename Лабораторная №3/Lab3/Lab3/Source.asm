.686

.model flat,stdcall
.stack 100h

.data
	res db 0
	off dd 0

	; ������ ��������� T2_y2 T1_y1 T2_x2 T1_x1 T4_y4 T3_y3 T4_x4 T3_x3
	lines dq 4.0, 1.0, 3.0, 1.0, 4.0, 1.0, 2.0, 3.0, 2.0, 2.0, 8.0, 4.0, 4.0, 1.0, 8.0, 6.0
	; ���������� ������
	num_lines dd 4
	tmp dd ?
	ks dq 4 dup(0.0)
	results dq 16 dup(0)

.code

ExitProcess PROTO STDCALL :DWORD
Start:
	finit
	xor eax, eax
	; � ebx ����� ������ ������� lines
	lea ebx, lines
	lea edx, ks

	mov ecx, num_lines
	; ���� �� ������� ������� ������������� ������ ������
	coefs:
		; ��������� ���������� ������ ������
		fld qword ptr [ebx]
		fld qword ptr [ebx + 8]
		fsub
		fld qword ptr [ebx + 16]
		fld qword ptr [ebx + 24]
		fsub
		fdiv
		; �������� �������� ������������ � ������
		fst qword ptr [edx]
		; ��������� ��������
		add edx, 8
		add ebx, 32
	loop coefs

	lea ebx, ks
	add ebx, 8
	add off, 8
	lea edx, results
	mov eax, 0
	; ����, ��� ������������ ������������ ���� � ������
	outer:
		sub num_lines, 1
		cmp num_lines, 0
		je exit

		mov ecx, num_lines
		fld ks[eax]

		inner:
			fld qword ptr [ebx]
			fcomip st(0), st(1)
			jz parallel

			call intersect

		T1:
		add ebx, 8
		add off, 8
		loop inner

		mov edi, num_lines
		mov tmp, edi
		cmp tmp, 0
		je exit
		sub tmp, 1

		L1:
			sub ebx, 8
			sub off, 8
			sub tmp, 1
			cmp tmp, 0
			jne L1

		add eax, 8
		jmp outer

	intersect:
		mov edi, off
		add dword ptr results[eax * 4 + edi], 1
		ret

	parallel:
		jmp T1
		

exit:
Invoke ExitProcess,1
End Start