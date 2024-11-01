	.intel_syntax noprefix
	.section .data

out_rax: .quad 0x0

	.global OUT_RAX
	.global _start
	.section .text
_start:
	xor rax, rax
	mov rbx, OFFSET [CALC_DATA_BEGIN]
	
loop_start:	
	cmp BYTE PTR [rbx], 0
	je loop_end

	cmp BYTE PTR [rbx], '&'
	je if_and

	cmp BYTE PTR [rbx], '|'
	je if_or
	
	cmp BYTE PTR [rbx], '^'
	je if_xor

	cmp BYTE PTR [rbx], 'U'
	je if_lower
	
if_and:
	add rbx, 8
	call AND_FRAG
	jmp loop_start

if_or:
	add rbx, 8
	call OR_FRAG
	jmp loop_start

if_xor:
	add rbx, 8
	call XOR_FRAG
	jmp loop_start
	
if_lower:
	add rbx, 8
	call LOWER_FRAG
	jmp loop_start
	
loop_end:
	mov QWORD PTR [OUT_RAX], rax
	mov rax, 1
	mov rdi, 1
	mov rsi, OFFSET [OUT_RAX]
	mov rdx, 8
	syscall

	mov rax, 1
	mov rdi, 1
	mov rsi, OFFSET [SUM_POSITIVE]
	mov rdx, 8
	syscall

	mov rax, 1
	mov rdi, 1
	mov rsi, OFFSET [SUM_NEGATIVE]
	mov rdx, 8
	syscall

	mov rax, 1
	mov rdi, 1
	mov rsi, OFFSET [CALC_DATA_BEGIN]
	mov rdx, OFFSET [CALC_DATA_END]
	sub rdx, rsi
	syscall

	mov rax, 60
	mov rdi, 0
	syscall
	

	
	


	

	
