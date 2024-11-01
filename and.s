# and.s file that includes the AND_FRAG label that is accessed in calc.s to call the and function
	.intel_syntax noprefix
	.section .text
	.global AND_FRAG #defining AND_FRAG to be able to access the label in calc.s for the & symbol
AND_FRAG:
	and rax, QWORD PTR [rbx] #using the and function for operation, acessing what's inside the memory address of rbx via qword ptr
	add rbx, 8 #moving to the next command before returning
	ret
	
