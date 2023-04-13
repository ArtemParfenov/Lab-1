.586 
.MODEL flat, C
.DATA
	; Промежуточная сумма
	SUM DD 0.0
	; Номер элемента ряда
	i_local DD 0
.CODE
	extern fun_el:near ; объявление внешней функции fun_el
	public SumR
	SumR proc C
		push ebp
		mov ebp, esp
		mov i_local, 0
		; Считываем из стека количество элементов
		mov ecx, dword ptr [ebp+8]
		add ecx, 1
		@@for_i: ; начало цикла
			; Помещаем количество элементов ряда в стек
			push ecx
			; Помещаем второй параметр (x) в стек
			push dword ptr [ebp + 12]
			; Помещаем в стек номер элемента ряда
			push i_local
			; Вызываем функцию fun_el из модуля C => fun_el(i_local, x)
			call fun_el
			; Взятие модуля от SUM
			fabs
			; Помещаем SUM на вершину стека
			fld SUM
			; Перемещаем указатель вершины стека на следующий элемент
			add esp, 8
			; Складываем st(0), st(1)
			fadd
			; Извлекаем сумму в ecx
			pop ecx
			; Увеличиваем счетчик цикла
			inc i_local
			; Загрузка вершины стека в SUM
			fstp SUM
		loop @@for_i ; конец цикла
		; Загрузка SUM на вершину стека
		fld SUM
		mov esp, ebp
		pop ebp
		ret
	SumR endp
End