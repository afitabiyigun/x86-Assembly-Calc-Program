	.intel_syntax noprefix
	.section .text
	.global ARRAYXOR
		
ARRAYXOR:
	xor r9, r9
	mov r9, QWORD PTR [rbx]
	add rbx, 8
	xor rcx, rcx
	mov rcx, rbx
	mov rbx, QWORD PTR [rbx]

loop_start:
	cmp r9, 0
	je loop_end

	call XOR_FRAG

	dec r9
	jmp loop_start

loop_end:
	mov rbx, rcx
	add rbx, 8
	ret
	
