	.intel_syntax noprefix
	.section .data
	.global SUM_POSITIVE
	.global SUM_NEGATIVE

SUM_POSITIVE: .quad 0x0
SUM_NEGATIVE: .quad 0x0

	.section .text
	.global XOR_FRAG

XOR_FRAG:
	mov rdx, QWORD PTR [rbx]
	xor rax, rdx

	cmp rdx, 0
	jl NEG_CASE
	jg POS_CASE
	jmp _end

NEG_CASE:
	add QWORD PTR [SUM_NEGATIVE], rdx
	jmp _end
	
POS_CASE:
	add QWORD PTR [SUM_POSITIVE], rdx
	jmp _end

_end:
	add rbx, 8
	ret
