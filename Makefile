
output: par lex
	gcc lex.yy.c y.tab.c -w -o compile

par: parser.y
	yacc -d parser.y

lex: scanner.l
	lex scanner.l
