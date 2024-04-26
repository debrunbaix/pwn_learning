section .text
	global _start

_start:
	; attribution des valeurs aux deux registres
	mov rax, 0x1
	mov rbx, 0x2

	; comparaison des registres
	cmp rax, rbx
	; si rax plus grand, fonction rax_greater
	jg rax_greater
	; si rax inférieure ou égal, fonction rax_less_equal
	jle rax_less_equal

rax_greater:
	mov rcx, rax
	jmp _fin
	
rax_less_equal:
	mov rcx, rbx
	jmp _fin

_fin:
	mov rax, 60
	xor rdi, rdi
	syscall
