	.intel_syntax noprefix
	.section .data
	.global _start

_start:
	xor rax, rax
	xor rbx, rbx
	xor cl, cl
	mov rbx, OFFSET [CALC_DATA_BEGIN]
	mov cl, BYTE PTR [CALC_DATA_BEGIN]


