%{
	#include <stdio.h>	
	int yyparse(void);
	int yylex(void);
	void yyerror();

	extern int yylineno;

%}

/* definitions */


%token IF
%token THEN
%token ELSE
%token END
%token WHILE
%token DO
%token ID
%token INTLIT
%token EXP
%token FLOATLIT
%token STRLIT
%token TYPE
%token CLASS
%token VOID
%token RETURN
%token PUBLIC
%token STATIC

%token PLUS
%token MINUS
%token MULT
%token DIV
%token ASSG
%token NE
%token LT
%token LE
%token GT
%token GE
%token EQ
%token COMMA
%token SEMI
%token LPAR
%token RPAR
%token RCUR
%token LCUR
%token RBRA
%token LBRA
%token DOT
%token COLON


%%

/* rules */

tiny_java_program
	: class_decl
	;

class_decl
	: PUBLIC CLASS ID LCUR member_decl_list RCUR
	| error SEMI
	;

member_decl_list
	: member_decl 
	| member_decl member_decl_list
	| error SEMI
	;

member_decl
	: field_decl 
	| method_decl
	;

field_decl
	: STATIC type ID ASSG literal SEMI
	;

method_decl	
	: STATIC return_type ID LPAR formal_param_list RPAR
	| LCUR method_body RCUR
	| STATIC return_type ID LPAR RPAR LCUR method_body RCUR
	| PUBLIC STATIC VOID ID LPAR ID LBRA RBRA ID RPAR LCUR method_body RCUR
	| error SEMI
	;

type
	: TYPE
	;

return_type
	: type 
	| VOID
	;
	
formal_param_list
	: formal_param 
	| formal_param COMMA formal_param_list
	| error SEMI
	;

formal_param
	: type ID
	;
	
method_body
	: local_decl_list method_statement_list
	| error SEMI
	;

local_decl_list
	: local_decl local_decl_list 
	| 
	| error SEMI
	;

local_decl
	: type ID ASSG literal SEMI
	| error SEMI
	;

method_statement_list
	: statement method_statement_list
	| return_statement
	| error SEMI
	;

statement_list
	: statement statement_list 
	| 
	;

statement
	: ID ASSG expression SEMI
	| IF LPAR expression RPAR statement
	| ID LPAR expression RPAR statement ELSE statement 
	| WHILE LPAR expression RPAR statement
	| method_invocation SEMI
	| LCUR statement_list RCUR
	| COLON
	| error SEMI
	;

return_statement
	: RETURN expression SEMI
 	| RETURN SEMI
	;

method_invocation 
	: qualified_name LPAR argument_list RPAR
	| qualified_name LPAR RPAR
	;

qualified_name
	: ID DOT ID
	| ID
	;


argument_list
	: expression
	| expression COMMA argument_list
	| error SEMI
	;

expression
	: relational_expression
	| relational_expression EQ relational_expression
	| relational_expression NE relational_expression	
	;

relational_expression
	: additive_expression
	| additive_expression LT additive_expression
	| additive_expression GT additive_expression
	| additive_expression LE additive_expression
	| additive_expression GE additive_expression
	| error SEMI
	;

additive_expression
	: multiplicative_expression
	| additive_expression PLUS multiplicative_expression
	| additive_expression MINUS multiplicative_expression
	;

multiplicative_expression
	: unary_expression
	| multiplicative_expression MULT unary_expression
	| multiplicative_expression DIV unary_expression
	;

unary_expression
	: primary_expression 
	| PLUS unary_expression
	| MINUS unary_expression
	| LPAR type RPAR unary_expression
	;

primary_expression
	: literal
	| ID
	| method_invocation
	| LPAR expression RPAR
	;

literal
	: INTLIT	
	| FLOATLIT	
	| STRLIT
	;


%%

/* auxiliary routines */


void yyerror(char const *s) {
    fprintf(stderr, "ERROR(%d): %s\n", yylineno, s);
    return;
}

int main(int argc, char *argv[]) {
	extern FILE *yyin;
	yyin = fopen(argv[1], "r");
	yyparse();
	return 1;
}
