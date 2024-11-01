# or.s file that includes the OR_FRAG label that is accessed by calc.s to call the or function
	.intel_syntax noprefix
	.section .text
	.global OR_FRAG #defining OR_FRAG to be able to access the label in calc.s for the ^ symbol
OR_FRAG:
	or rax, QWORD PTR [rbx] #using the or function to perform operation, acessing whats stores in rbx memory via qword ptr
	add rbx, 8 #moving to the next command before returning
	ret
