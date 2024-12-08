	.intel_syntax noprefix
	.section .data
	.global ARRAYXOR

ARRAYXOR:
	push rbx
	push rcx
	push rdx

	
	xor rdx, rdx #index counter for the iteration of the array loop
	xor rax, rax
	xor rcx, rcx

	mov rdx, QWORD PTR [rbx]
	add rbx, 8
	mov rbx, QWORD PTR [rbx]
	
loop_start:
	cmp rdx, 0
	jz loop_end

	mov rax, QWORD PTR [rsi + rdx*8]
	xor rax, rcx

loop_end:	
	
