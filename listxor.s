	.intel_syntax noprefix
	.section .data
	.global LISTXOR
	
	.section .text
	
LISTXOR:
	mov rsi, rbx
	
loop_start:
	mov rbx, QWORD PTR [rbx]
	call XOR_FRAG
	cmp QWORD PTR [rbx], 0
	je loop_end
	jmp loop_start

loop_end:
	mov rbx, rsi
	add rbx, 8
	ret
	
