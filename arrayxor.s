	.intel_syntax noprefix
	.section .data
	.global ARRAYXOR

	.section .text
	
ARRAYXOR:
	push rbx
	push rdx
	
	xor rdx, rdx #index counter for the iteration of the array loop
	xor rax, rax

	mov rdx, QWORD PTR [rbx]
	add rbx, 8
	mov r8, QWORD PTR [rbx]
	
loop_start:
	cmp rdx, 0
	jz loop_end

	mov rax, QWORD PTR [r8]
	call XOR_FRAG
	dec rdx
	jp loop_start

loop_end:	
	pop rdx
	pop rbx
	add rbx, 8
	ret
	
