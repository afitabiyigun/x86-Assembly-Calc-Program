	.intel_syntax noprefix
	.section .text
	.global LOWER_FRAG

LOWER_FRAG:
	mov rsp, QWORD PTR [rbx]

loop_start:
	cmp BYTE PTR [rsp], 0
	je end_loop
	
	cmp BYTE PTR [rsp], 'A'
	jl next_char

	cmp BYTE PTR [rsp], 'Z'
	jg next_char

	add BYTE PTR [rsp], 32

next_char:
	add rsp, 1
	inc rax
	jmp loop_start

end_loop:
	add rbx, 8
	ret
