%{
#include <stdio.h>
#include <stdlib.h>
extern char* yytext;
extern int yylex();
extern int yyerror(char *str);
%}
%token TOKEN_MULTI_COMMENT
%token TOKEN_SINGLE_COMMENT
%token TOKEN_STRING
%token TOKEN_ERROR_CHAR
%token TOKEN_CHAR
%token TOKEN_ARRAY
%token TOKEN_AUTO
%token TOKEN_BOOLEAN
%token TOKEN_KEYWORD_CHAR
%token TOKEN_ELSE
%token TOKEN_FOR
%token TOKEN_FUNCTION
%token TOKEN_IF
%token TOKEN_INTEGER
%token TOKEN_PRINT
%token TOKEN_RETURN
%token TOKEN_KEYWORD_STRING
%token TOKEN_VOID
%token TOKEN_WHILE
%token TOKEN_TRUE
%token TOKEN_FALSE
%token TOKEN_AND
%token TOKEN_OR
%token TOKEN_TERNARY
%token TOKEN_COLON
%token TOKEN_SEMICOLON
%token TOKEN_COMMA
%token TOKEN_LBRACKET
%token TOKEN_RBRACKET
%token TOKEN_LBRACE
%token TOKEN_RBRACE
%token TOKEN_LPAREN
%token TOKEN_RPAREN
%token TOKEN_ASSIGNMENT
%token TOKEN_EXPONENT
%token TOKEN_INCREMENT
%token TOKEN_DECREMENT
%token TOKEN_ADD
%token TOKEN_HYPHEN
%token TOKEN_ASTERISK
%token TOKEN_FORWARD_SLASH
%token TOKEN_PERCENT
%token TOKEN_EQ
%token TOKEN_LE
%token TOKEN_GE
%token TOKEN_LT
%token TOKEN_GT
%token TOKEN_NE
%token TOKEN_NOT
%token TOKEN_IDENT
%token TOKEN_NUMBER
%token TOKEN_ERROR_INVALID

%%
program : decls                 
        ;  

expr    : expr TOKEN_ASSIGNMENT expr1
        | expr TOKEN_TERNARY expr TOKEN_COLON expr1
        | expr1
        ;

expr1   : expr2 TOKEN_OR expr1                      
        | expr2
        ;

expr2   : expr3 TOKEN_AND expr2
        | expr3

expr3   : expr4 TOKEN_EQ expr3
        | expr4 TOKEN_LE expr3
        | expr4 TOKEN_GE expr3
        | expr4 TOKEN_LT expr3
        | expr4 TOKEN_GT expr3
        | expr4 TOKEN_NE expr3
        | expr4
        ;

expr4   : expr5 TOKEN_ADD expr4
        | expr5 TOKEN_HYPHEN expr4
        | expr5
        ;

expr5   : expr6 TOKEN_ASTERISK expr5
        | expr6 TOKEN_FORWARD_SLASH expr5
        | expr6 TOKEN_PERCENT expr5
        | expr6
        ;

expr6   : expr6 TOKEN_EXPONENT expr7
        | expr7
        ;

expr7   : TOKEN_NOT expr7
        | TOKEN_HYPHEN expr7
        | expr8
        ;

expr8   : expr8 TOKEN_DECREMENT
        | expr8 TOKEN_INCREMENT 
        | expr9
        ;

expr9   : TOKEN_LPAREN expr TOKEN_RPAREN
        | ident TOKEN_LPAREN expr_list TOKEN_RPAREN  /* function call */
        | array_index
        | atomic 
        ;

expr_list: expr_list_not_empty
        |
        ;

expr_or_nothing: expr
        | 
        ;

expr_list_not_empty: expr TOKEN_COMMA expr_list_not_empty
        | expr
        ;

atomic  : TOKEN_NUMBER
        | TOKEN_STRING
        | TOKEN_CHAR
        | TOKEN_TRUE
        | TOKEN_FALSE
        | ident
        | array_init
        ;

array_init: TOKEN_LBRACE expr_list_not_empty TOKEN_RBRACE
        ;

array_index: TOKEN_IDENT TOKEN_LBRACKET expr TOKEN_RBRACKET
        | array_index TOKEN_LBRACKET expr TOKEN_RBRACKET
        ;

stmts_or_nothing: stmts
        |
        ;

stmts   : stmt stmts
        | stmt  
        ;

stmt    : open_stmt
        | closed_stmt
        ;

cond    : TOKEN_LPAREN expr TOKEN_RPAREN
        ;

for_params: TOKEN_LPAREN expr_or_nothing TOKEN_SEMICOLON expr_or_nothing TOKEN_SEMICOLON expr_or_nothing TOKEN_RPAREN
        ;

open_stmt: TOKEN_IF cond closed_stmt TOKEN_ELSE open_stmt
        | TOKEN_IF cond closed_stmt
        | TOKEN_WHILE cond open_stmt
        | TOKEN_FOR for_params open_stmt
        ;

closed_stmt: TOKEN_IF cond closed_stmt TOKEN_ELSE closed_stmt 
        | TOKEN_WHILE cond closed_stmt
        | TOKEN_FOR for_params closed_stmt
        | simple_stmt
        ;

simple_stmt: TOKEN_RETURN expr_or_nothing TOKEN_SEMICOLON                         
        | TOKEN_PRINT expr_list TOKEN_SEMICOLON
        | expr TOKEN_SEMICOLON
        | decl
        | TOKEN_LBRACE stmts_or_nothing TOKEN_RBRACE
        ; 

ident   : TOKEN_IDENT
        ;

decl    : ident TOKEN_COLON type TOKEN_ASSIGNMENT expr TOKEN_SEMICOLON
        | ident TOKEN_COLON type TOKEN_ASSIGNMENT TOKEN_LBRACE stmts_or_nothing TOKEN_RBRACE
        | ident TOKEN_COLON type TOKEN_SEMICOLON
        ;

decls   : decl decls
        | 
        ;

type    : TOKEN_KEYWORD_CHAR
        | TOKEN_KEYWORD_STRING
        | TOKEN_INTEGER
        | TOKEN_BOOLEAN
        | TOKEN_AUTO
        | TOKEN_VOID
        | TOKEN_ARRAY TOKEN_LBRACKET expr_or_nothing TOKEN_RBRACKET type
        | TOKEN_FUNCTION type TOKEN_LPAREN param_list TOKEN_RPAREN
        ;

param_list: param_list_not_empty
        |
        ;

param_list_not_empty: param TOKEN_COMMA param_list_not_empty
        | param
        ;

param   : ident TOKEN_COLON type
        ;

%%
int yyerror(char* str) {
    printf("parse error: %s\n", str);
    return 0;
}
