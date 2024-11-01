	.intel_syntax noprefix
	.section .text
	.global LOWER_FRAG #defining the label globally to be able to call the loop function in calc.s when we have 'U'

LOWER_FRAG:
	mov r8, QWORD PTR [rbx] #moving the value stores in the memory address of rbx into r8 to easily access each char with a byte pointer

loop_start:
	cmp BYTE PTR [r8], 0 #comparing char at byte to 0 to jump to end_loop label, where function is returned if 0
	je end_loop

	#bound must be 'Z'>char >'A'
	cmp BYTE PTR [r8], 'A' #comparing current char to 'A'
	jl next_char #if less than 'A' jumping to next_char because considered out of bounds 

	cmp BYTE PTR [r8], 'Z' #comparing current char to 'z'
	jg next_char #if greater than 'Z' jumping to next_char becauze out of bounds

	add BYTE PTR [r8], 32 #if neither conditionals are true, considered in bounds and convert to lower case by adding 32 to the ascii value

#label that we jump to if out of bounds to move to the next char byte of the ascii string that increments both r8 and rax
next_char: 
	add r8, 1
	inc rax #will be written to standard out syscall in OUT_RAX in calc.s before returning the program
	jmp loop_start #jump back to the start of the loop to go through the same process for the next char

end_loop:
	add rbx, 8 #moving to the next command before returning
	ret
