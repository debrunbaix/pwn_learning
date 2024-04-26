section .text
	global _start

_start:
	; attribution des valeurs aux registres
	mov rax, 0x5
	mov rbx, 0x3

	; aller a la procédure d'addition
	call _add
	call _sub

	jmp _fin

_add:
	; ajouter la valeur de B à A
	add rax, rbx
	; mettre le resultat dans C
	mov rcx, rax
	; remettre les valeurs par défaut
	sub rax, rbx
	
	ret

_sub:
	; soustraire la valeur de B à A
	sub rax, rbx
	; mettre le resultat dans D
	mov rdx, rax
	
	ret

_fin:
	mov rax, 60
	xor rdi, rdi
	syscall
