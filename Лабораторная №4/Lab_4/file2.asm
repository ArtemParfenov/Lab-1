.586 
.MODEL flat, C
.DATA
	; ������������� �����
	SUM DD 0.0
	; ����� �������� ����
	i_local DD 0
.CODE
	extern fun_el:near ; ���������� ������� ������� fun_el
	public SumR
	SumR proc C
		push ebp
		mov ebp, esp
		mov i_local, 0
		; ��������� �� ����� ���������� ���������
		mov ecx, dword ptr [ebp+8]
		add ecx, 1
		@@for_i: ; ������ �����
			; �������� ���������� ��������� ���� � ����
			push ecx
			; �������� ������ �������� (x) � ����
			push dword ptr [ebp + 12]
			; �������� � ���� ����� �������� ����
			push i_local
			; �������� ������� fun_el �� ������ C => fun_el(i_local, x)
			call fun_el
			; ������ ������ �� SUM
			fabs
			; �������� SUM �� ������� �����
			fld SUM
			; ���������� ��������� ������� ����� �� ��������� �������
			add esp, 8
			; ���������� st(0), st(1)
			fadd
			; ��������� ����� � ecx
			pop ecx
			; ����������� ������� �����
			inc i_local
			; �������� ������� ����� � SUM
			fstp SUM
		loop @@for_i ; ����� �����
		; �������� SUM �� ������� �����
		fld SUM
		mov esp, ebp
		pop ebp
		ret
	SumR endp
End