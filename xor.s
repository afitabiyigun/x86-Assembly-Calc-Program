	.intel_syntax noprefix
	.section .data
	.global SUM_POSITIVE
	.global SUM_NEGATIVE

#defining the globally defined sum variables to zero
SUM_POSITIVE: .quad 0x0
SUM_NEGATIVE: .quad 0x0

	.section .text
	.global XOR_FRAG #defining XOR_FRAG globally to access it in calc.s to call the xor function

XOR_FRAG:
	mov rdx, QWORD PTR [rbx] #moving whats stored in the memory address of rbx into rdx
	xor rax, rdx #performing the actual operation using rdx instead of rbx

	cmp rdx, 0 #comparing rdx to zero to determine to proceed with the negative or positive case labels
	jl NEG_CASE #
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
