	.intel_syntax noprefix
	.section .text
	.global LOWER_FRAG

LOWER_FRAG:
	mov r8, QWORD PTR [rbx]

loop_start:
	cmp BYTE PTR [r8], 0
	je end_loop
	
	cmp BYTE PTR [r8], 'A'
	jl next_char

	cmp BYTE PTR [r8], 'Z'
	jg next_char

	add BYTE PTR [r8], 32

next_char:
	add r8, 1
	inc rax
	jmp loop_start

end_loop:
	add rbx, 8
	ret
