data/basic_cmds.o: data/basic_cmds.s
	as -g data/basic_cmds.s -o data/basic_cmds.o

calc_basic: and.o or.o xor.o lower.o calc.o data/basic_cmds.o
	ld -g calc.o and.o or.o xor.o lower.o data/basic_cmds.o -o calc_basic

data/simpleone_cmds.o: data/simpleone_cmds.s
	as -g data/simpleone_cmds.s -o data/simpleone_cmds.o

calc_simpleone: calc.o and.o or.o xor.o lower.o data/simpleone_cmds.o
	ld -g calc.o and.o or.o xor.o lower.o data/simpleone_cmds.o -o calc_simpleone

data/loweronly_cmds.o: data/loweronly_cmds.s
	as -g data/loweronly_cmds.s -o data/loweronly_cmds.o

data/easy_cmds.o: data/easy_cmds.s
	as -g data/easy_cmds.s -o data/easy_cmds.o

data/basicwithlower_cmds.o: data/basicwithlower_cmds.s
	as -g data/basicwithlower_cmds.s -o data/basicwithlower_cmds.o

simplerandom_cmds.o: simplerandom_cmds.s
	as -g data/simplerandom_cmds.s -o data.simplerandom_cmds.o

calc_simplerandom: simplerandom_cmds.o data/basicwithlower_cmds.o data/easy.o data/loweronly_cmds.s
	ld -g simplerandom_cmds.o data/basicwithlower_cmds.o data/easy.o data/loweronly_cmds.s -o calc_simplerandom

and: and.o
	ld -g -o and and.o
and.o: and.s
	as -g -o and.o and.s

or: or.o
	ld -g -o or or.o
or.o: or.s
	as -g -o or.o or.s

xor: xor.o
	ld -g -o xor.o xor.s
xor.o: xor.s
	as -g -o xor.o xor.s

lower: lower.o
	ld -g -o lower lower.o
lower.o: lower.s
	as -g -o lower.o lower.s

calc.o: calc.s
	as -g -o calc.o calc.s
