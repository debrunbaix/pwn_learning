section .text
	global _start

_start:
	; attribution de la valeur 0 à A
	xor rax, rax

	; appel de la section boucle
	jmp _boucle

_boucle:
	; ajouter 1 à A
	add rax, 0x1
	; comparer la valeur contenu dans A à 5
	cmp rax, 0x5
	; si égal, affiche 5
	je _display_five
	; si pas égal, vérifi si c'est égal a 9
	cmp rax, 0x9
	; si pas égal, continue la boucle
	jne _boucle
	; si égal, terminer le programme
	jmp _fin

_display_five:
	mov rcx, 0x5
	jmp _boucle

_fin:
	mov rax, 60
	xor rdi, rdi
	syscall
