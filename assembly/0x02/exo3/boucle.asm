section .text
	global _start

_start:
	; initialisation à 1 d'un registre qui servira de compteur
	mov rcx, 0x1

	; initialisation à 0 du registre qui sera incrémenté
	xor rax, rax
	
_loop:
	; ajout du compteur a rbx
	add rax, rcx
	; incrémentation du compteur
	add rcx, 0x1

	; tant que rax n'atteind pas 10
	cmp rcx, 0xa
	; éxécuter la fonction loop
	jle _loop

	; fin du programme
	mov rax, 60
	xor rdi, rdi
	syscall
	
