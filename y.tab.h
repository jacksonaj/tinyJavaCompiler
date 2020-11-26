/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     IF = 258,
     THEN = 259,
     ELSE = 260,
     END = 261,
     WHILE = 262,
     DO = 263,
     ID = 264,
     INTLIT = 265,
     EXP = 266,
     FLOATLIT = 267,
     STRLIT = 268,
     TYPE = 269,
     CLASS = 270,
     VOID = 271,
     RETURN = 272,
     PUBLIC = 273,
     STATIC = 274,
     PLUS = 275,
     MINUS = 276,
     MULT = 277,
     DIV = 278,
     ASSG = 279,
     NE = 280,
     LT = 281,
     LE = 282,
     GT = 283,
     GE = 284,
     EQ = 285,
     COMMA = 286,
     SEMI = 287,
     LPAR = 288,
     RPAR = 289,
     RCUR = 290,
     LCUR = 291,
     RBRA = 292,
     LBRA = 293,
     DOT = 294,
     COLON = 295
   };
#endif
/* Tokens.  */
#define IF 258
#define THEN 259
#define ELSE 260
#define END 261
#define WHILE 262
#define DO 263
#define ID 264
#define INTLIT 265
#define EXP 266
#define FLOATLIT 267
#define STRLIT 268
#define TYPE 269
#define CLASS 270
#define VOID 271
#define RETURN 272
#define PUBLIC 273
#define STATIC 274
#define PLUS 275
#define MINUS 276
#define MULT 277
#define DIV 278
#define ASSG 279
#define NE 280
#define LT 281
#define LE 282
#define GT 283
#define GE 284
#define EQ 285
#define COMMA 286
#define SEMI 287
#define LPAR 288
#define RPAR 289
#define RCUR 290
#define LCUR 291
#define RBRA 292
#define LBRA 293
#define DOT 294
#define COLON 295




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

