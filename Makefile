#generates the object file for basic commands by assembling `data/basic_cmds.s`
data/basic_cmds.o: data/basic_cmds.s 
	as -g data/basic_cmds.s -o data/basic_cmds.o
#links all dependency object files to create the executable `calc_basic`
calc_basic: and.o or.o xor.o lower.o calc.o data/basic_cmds.o
	ld -g calc.o and.o or.o xor.o lower.o data/basic_cmds.o -o calc_basic
#generates the object file for simple one commands by assembling `data/simpleone_cmds.s`
data/simpleone_cmds.o: data/simpleone_cmds.s
	as -g data/simpleone_cmds.s -o data/simpleone_cmds.o
#links object files to create the `calc_simpleone` executable
calc_simpleone: calc.o and.o or.o xor.o lower.o data/simpleone_cmds.o
	ld -g calc.o and.o or.o xor.o lower.o data/simpleone_cmds.o -o calc_simpleone
#generates the object file for lower-only commands by assembling `data/loweronly_cmds.s`
data/loweronly_cmds.o: data/loweronly_cmds.s
	as -g data/loweronly_cmds.s -o data/loweronly_cmds.o
#links object files to create the `calc_loweronly` executable
calc_loweronly: calc.o and.o or.o xor.o lower.o data/loweronly_cmds.o
	ld -g calc.o and.o or.o xor.o lower.o data/loweronly_cmds.o -o calc_loweronly
#generates the object file for easy commands by assembling `data/easy_cmds.s`
data/easy_cmds.o: data/easy_cmds.s
	as -g data/easy_cmds.s -o data/easy_cmds.o
#links object files to create the `calc_easy` executable
calc_easy: calc.o and.o or.o xor.o lower.o data/easy_cmds.o
	ld -g calc.o and.o or.o xor.o lower.o data/easy_cmds.o -o calc_easy
#generates the object file for basic with lower commands by assembling `data/basicwithlower_cmds.s`
data/basicwithlower_cmds.o: data/basicwithlower_cmds.s
	as -g data/basicwithlower_cmds.s -o data/basicwithlower_cmds.o
#links object files to create the `calc_basicwithlower` executable
calc_basicwithlower: calc.o and.o or.o xor.o lower.o data/basicwithlower_cmds.o
	ld -g calc.o and.o or.o xor.o lower.o data/basicwithlower_cmds.o -o calc_basicwithlower
#generates the object file for simple random commands by assembling `data/simplerandom_cmds.s`
data/simplerandom_cmds.o: data/simplerandom_cmds.s
	as -g data/simplerandom_cmds.s -o data/simplerandom_cmds.o
#links object files to create the `calc_simplerandom` executable
calc_simplerandom: calc.o and.o or.o xor.o lower.o data/simplerandom_cmds.o
	ld -g calc.o lower.o and.o or.o xor.o data/simplerandom_cmds.o -o calc_simplerandom

data/arrayxor_cmds.o: data/arrayxor_cmds.s
	as -g data/arrayxor_cmds.s -o data/arrayxor_cmds.o
calc_arrayxor: calc.o data/arrayxor_cmds.o arrayxor.o and.o or.o xor.o lower.o listxor.o
	ld -g calc.o data/arrayxor_cmds.o arrayxor.o and.o or.o xor.o lower.o listxor.o -o calc_arrayxor

data/listxor_cmds.o:  data/listxor_cmds.s
	as -g data/listxor_cmds.s -o data/listxor_cmds.o
calc_listxor: calc.o data/listxor_cmds.o listxor.o and.o or.o xor.o lower.o arrayxor.o
	ld -g calc.o data/listxor_cmds.o listxor.o and.o or.o xor.o lower.o arrayxor.o -o calc_listxor

#creates the `and` executable by linking the `and.o` object file and assembles the `and.s` source file to produce the `and.o` object file
and: and.o
	ld -g -o and and.o
and.o: and.s
	as -g -o and.o and.s
#creates the `or` executable by linking the `or.o` object file and assembles the `or.s` source file to produce the `or.o` object file
or: or.o
	ld -g -o or or.o
or.o: or.s
	as -g -o or.o or.s
#creates the `xor` executable by linking the `xor.o` object file and assembles the `xor.s` source file to produce the `xor.o` object file
xor: xor.o
	ld -g -o xor.o xor.s
xor.o: xor.s
	as -g -o xor.o xor.s
#creates the `lower` executable by linking the `lower.o` object file and assembles the `lower.s` source file to produce the `lower.o` object file
lower: lower.o
	ld -g -o lower lower.o
lower.o: lower.s
	as -g -o lower.o lower.s
calc.o: calc.s 
	as -g -o calc.o calc.s

arrayxor: arrayxor.o
	ld -g -o arrayxor arrayxor.o
arrayxor.o: arrayxor.s
	as -g -o arrayxor.o arrayxor.s
listxor: listxor.o
	ld -g -o listxor listxor.o
listxor.o: listxor.s
	as -g -o listxor.o listxor.s
