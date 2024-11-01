	.intel_syntax noprefix
	.section .data
	.global SUM_POSITIVE
	.global SUM_NEGATIVE

#initilazing the globally defined sum variables to zero
SUM_POSITIVE: .quad 0x0
SUM_NEGATIVE: .quad 0x0

	.section .text
	.global XOR_FRAG #defining XOR_FRAG globally to access it in calc.s to call the xor function

XOR_FRAG:
	mov rdx, QWORD PTR [rbx] #moving whats stored in the memory address of rbx into rdx
	xor rax, rdx #performing the actual operation using rdx instead of rbx

	cmp rdx, 0 #comparing rdx to zero to determine where to jump
	jl NEG_CASE #if the argument is less than zero, jump to the negative case label
	jg POS_CASE #if the argument is greater than zero, jump to the positive case label
	jmp _end

NEG_CASE:
	add QWORD PTR [SUM_NEGATIVE], rdx #into an 8 byte value stored at a location marked by SUM_NEGATIVE
	jmp _end
	
POS_CASE:
	add QWORD PTR [SUM_POSITIVE], rdx #add y into an 8 byte value stored in SUM_POSITIVE
	jmp _end

_end:
	add rbx, 8 #updating rbx to equal &y + 8 to move to the next command
	ret
