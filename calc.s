	.intel_syntax noprefix
	.section .data
	.global _start

_start:
	xor rax, rax
	xor rbx, rbx
	xor cl, cl # 1 byte register to read the first symbol from CALC_DATA_BEGIN
	mov rbx, OFFSET [CALC_DATA_BEGIN]
	mov cl, BYTE PTR [CALC_DATA_BEGIN] #moving the first byte into cl


