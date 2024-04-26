section .data
	; variable contenant 'hello'
        message db "hello", 0

section .text
        global _start

_start:
	; mettre la valeur de message dans RSI
        mov rsi, message
        mov rbx, rsp          ; Sauvegarder l'état initial de rsp dans rbx pour référence future

_push_chars:
	; mettre le caractère sur lequel pointe RSI dans AL
        mov al, [rsi]
	; si c'est le caractère null :
        test al, al
	; commence à enlever les caractères de la pile
        jz _pop_chars
	; sinon met le caractère dans la pile
        push rax
	; incrémente RSI pour pointer vers le second caractère
        inc rsi
	; saut vers la fonction push 
        jmp _push_chars

_pop_chars:
        cmp rsp, rbx          ; Compare rsp actuel avec l'état initial stocké dans rbx
        ; saut vers la procédure de fin
	je _fin

	; met le haut de la pile dans RAX
        pop rax
	; saut dans la procédure pop
        jmp _pop_chars

_fin:
        mov rax, 60
        xor rdi, rdi
        syscall

