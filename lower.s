	.intel_syntax noprefix
	.section .text
	.global LOWER_FRAG

LOWER_FRAG:
	mov rsp, QWORD PTR [rbx]
	mov r8, QWORD PTR [rsp]

loop_start:
	cmp r8, 'A'
	jl next_char

	cmp r8, 'Z'
	jg next_char

	add rax, 1
	# update to lower case ascii value

	jmp end_loop

next_char:
	add rsp, 1
	jmp loop_start

end_loop:
	ret
