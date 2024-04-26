section .text
    global _start

_start:
    mov rax, 2
    mov rbx, 4

    ; Calcul de la somme
    mov rcx, rbx
    add rcx, rax

    ; Calcul de la différence
    mov rdx, rbx
    sub rdx, rax
    
    ; Calcul du produit
    mov rsi, rbx
    imul rsi, rax

    ; Préparation pour la division
    xor rdx, rdx    ; Important pour éviter des erreurs avec des nombres 64 bits
    mov rax, rbx    ; Le dividende doit être dans RAX
    div rax         ; Divise RDX:RAX par rbx, quotient dans RAX, reste dans RDX
    
    ; Fin du programme
    mov rax, 60
    xor rdi, rdi
    syscall

