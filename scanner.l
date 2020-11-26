%{
	#include <stdio.h>
	#include "y.tab.h"
%}


/* Definitions */

%option yylineno

letter		[a-zA-Z]
digit		[0-9]
nonzero_digit	[1-9]
identifier      {letter}({letter}|{digit}|"_")*
int_literal	"0"|{nonzero_digit}{digit}*
exponent	("e"|"E")(("+"|"-"){digit}+|{digit}+)
float_literal	{digit}+"."{digit}+|{digit}+"."{digit}+("f"|"F")|{digit}+"."{digit}+{exponent}|{digit}+"."{digit}+{exponent}("f"|"F")
str_literal	\"([^\"\n])*\"

/* Rules */

%%

[ \t\r]+				{ /* DO NOTHING */ }	
[\n]					{ /* DO NOTHING */ }


"if"			{yylval = atoi(yytext); return IF;}
"then"			{yylval = atoi(yytext); return THEN;}
"else"			{yylval = atoi(yytext); return ELSE;}
"end"			{yylval = atoi(yytext); return END;}
"while"			{yylval = atoi(yytext); return WHILE;}
"do"			{yylval = atoi(yytext); return DO;}
"string"		{yylval = atoi(yytext); return TYPE;}
"bool"			{yylval = atoi(yytext); return TYPE;}
"int"			{yylval = atoi(yytext); return TYPE;}
"double"		{yylval = atoi(yytext); return TYPE;}
"float"			{yylval = atoi(yytext); return TYPE;}
"class"			{yylval = atoi(yytext); return CLASS;}
"void"			{yylval = atoi(yytext); return VOID;}
"return"		{yylval = atoi(yytext); return RETURN;}
"public"		{yylval = atoi(yytext); return PUBLIC;}
"static"		{yylval = atoi(yytext); return STATIC;}
{identifier}		{yylval = atoi(yytext); return ID;}
{int_literal}		{yylval = atoi(yytext); return INTLIT;}
{exponent}		{yylval = atoi(yytext); return EXP;}
{float_literal}		{yylval = atoi(yytext); return FLOATLIT;}
{str_literal}		{yylval = atoi(yytext); return STRLIT;}

"+"			{yylval = atoi(yytext); return PLUS;}
"-"			{yylval = atoi(yytext); return MINUS;}
"*"			{yylval = atoi(yytext); return MULT;}
"/"			{yylval = atoi(yytext); return DIV;}
"="			{yylval = atoi(yytext); return ASSG;}
"!="			{yylval = atoi(yytext); return NE;} 
"<"			{yylval = atoi(yytext); return LT;}
">"			{yylval = atoi(yytext); return GT;}
"<="			{yylval = atoi(yytext); return GE;}
">="			{yylval = atoi(yytext); return LE;}
","			{yylval = atoi(yytext); return COMMA;}
";"			{yylval = atoi(yytext); return SEMI;}
"("			{yylval = atoi(yytext); return LPAR;}
")"			{yylval = atoi(yytext); return RPAR;}
"{"			{yylval = atoi(yytext); return LCUR;}
"}"			{yylval = atoi(yytext); return RCUR;}
"["			{yylval = atoi(yytext); return LBRA;}
"]"			{yylval = atoi(yytext); return RBRA;}
"."			{yylval = atoi(yytext); return DOT;}
":"			{yylval = atoi(yytext); return COLON;}


"//".*                          	{ /* DO NOTHING */ }
[/][*][^*]*[*]+([^*/][^*]*[*]+)*[/]     { /* DO NOTHING */ }

.                           { yylval = atoi(yytext);  printf("ERROR(%d): lexical error\n", yylineno);   }
%%


int yywrap(){
   return 1;
}
