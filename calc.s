	.intel_syntax noprefix
	.section .data

OUT_RAX:
	.quad 0x0 

	.global OUT_RAX #defining a variable globally to store the value of rax before doing syscalls
	.global _start #defining _start globally to be able to run the testscripts
	.section .text 
_start:
	xor rax, rax #initializing rax to zero
	mov rbx, OFFSET [CALC_DATA_BEGIN] #initializing rbx to the address of CALC_DATA_BEGIN
	
loop_start:	
	cmp BYTE PTR [rbx], 0 #checking if the first byte of current command is zero via byte pointer
	je loop_end #exiting out of the loop by jumping to loop_end that exits out of the program

	cmp BYTE PTR [rbx], '&' #checking if the first byte of current command is the and symbol via byte pointer
	je if_and #jumping to the if_and label where AND_FRAG function is called

	cmp BYTE PTR [rbx], '|' #checking if the first byte of current command is the or symbol via byte pointer
	je if_or #jumping to the if_or label where OR_FRAG function is called
	
	cmp BYTE PTR [rbx], '^' #checking if the first byte of current command is the xor symbol via byte pointer
	je if_xor #jumping to the if_xor label where XOR_FRAG function is called

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
	

	
	


	

	
