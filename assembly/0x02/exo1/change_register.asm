section .text
	global _start

_start:
	mov rax, 0x1
	mov rbx, 0x2

	xor rax, rbx
	xor rbx, rax
	xor rax, rbx

	mov rax, 60
	xor rdi, rdi
	syscall
