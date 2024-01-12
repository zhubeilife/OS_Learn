sum:
	gcc -fdiagnostics-color=always -ggdb -Wall sum.c -o sum
sum-o1:
	gcc -fdiagnostics-color=always -O1 -ggdb -Wall sum.c -o sum-o1
sum-o2:
	gcc -fdiagnostics-color=always -O2 -ggdb -Wall sum.c -o sum-o2
dump:
	gcc sum.c -O1 -c
	objdump -d sum.o > O1.txt
