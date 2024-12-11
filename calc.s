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

	cmp BYTE PTR [rbx], 'U' #checking if the first byte of current command is the lower symbol via byte pointer
	je if_lower #jumping to the if_lower label where LOWER_FRAG function is called
	
	cmp BYTE PTR [rbx], 'a'
	je if_arrayxor

	cmp BYTE PTR [rbx], 'l'
	je if_listxor
	
if_and:
	add rbx, 8 #moving to the next command
	call AND_FRAG #calling the and.s function
	jmp loop_start #jumping back to the loop for the next command

if_or:
	add rbx, 8 #moving to the next command
	call OR_FRAG #calling the or.s function
	jmp loop_start #jumping back to the loop for the next command

if_xor:
	add rbx, 8 #moving to the next command
	call XOR_FRAG #calling the xor.s function
	jmp loop_start #jumping back to the loop for the next command
	
if_lower:
	add rbx, 8 #moving to the next command
	call LOWER_FRAG #calling the lower.s function
	jmp loop_start #jumping back to the loop for the next command

if_arrayxor:
	add rbx, 8
	call ARRAYXOR
	jmp loop_start

if_listxor:
	add rbx, 8
	call LISTXOR
	jmp loop_start

loop_end:
	mov QWORD PTR [OUT_RAX], rax #moving the value inside rax register to my globally defined OUT_RAX data object via qword pointer
	mov rax, 1
	mov rdi, 1
	mov rsi, OFFSET [OUT_RAX]
	mov rdx, 8
	syscall #performing syscall to write standard output for OUT_RAX

	mov rax, 1
	mov rdi, 1
	mov rsi, OFFSET [SUM_POSITIVE]
	mov rdx, 8
	syscall #performing syscall to write standard output for SUM_POSITIVE

	mov rax, 1
	mov rdi, 1
	mov rsi, OFFSET [SUM_NEGATIVE] 
	mov rdx, 8
	syscall #performing syscall to write standard output for SUM_NEGATIVE

	mov rax, 1
	mov rdi, 1
	mov rsi, OFFSET [CALC_DATA_BEGIN]
	mov rdx, OFFSET [CALC_DATA_END]
	sub rdx, rsi #subracting CALC_DATA_END from CALC_DATA_BEGIN to calculate the number of bytes used in memory
	syscall #performing syscall to write standard output for the number of bytes used in memory

	mov rax, 60
	mov rdi, 0
	syscall #performing syscall to return
	

	
	


	

	
