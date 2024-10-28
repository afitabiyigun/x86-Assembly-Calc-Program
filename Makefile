data/basic_cmds.o: data/basic_cmds.s
	as -g -o data/basic_cmds.o data/basic_cmds.s
calc_basic: and.o or.o xor.o lower.o calc.o data/basic_cmds.o
	ld -g -o calc_basic and.o or.o xor. lower.o data/basic_cmds.o


