TINY JAVA COMPILER 

using Lex and Yacc

TO BUILD
call make script "make"
output of make is compiler executable file called "compile"

TO RUN
./compile sourceFile

errors output to screen


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Makefile:

output: par lex
	gcc lex.yy.c y.tab.c -w -o compile

par: parser.y
	yacc -d parser.y

lex: scanner.l
	lex scanner.l
