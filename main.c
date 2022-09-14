#include "token.h"
#include "string.h"
#include <stdio.h>
#include <stdlib.h>
extern FILE *yyin;
extern int yylex();
extern char *yytext;


/**
 * Display usage message.
 * @param       program     String containing name of program.
 **/
void usage(const char *program) {
    fprintf(stderr, "Usage: %s [options]\n\n", program);
    fprintf(stderr, "Options:\n");
    fprintf(stderr, "    -scan FILE           run scanner on FILE\n");
}

void print_stripped_str(char * string_literal) {

    char *curr = string_literal;
    char *str_new = string_literal;
    curr++;

    while (*curr != '\0') {
        if (*curr == '\\') { 
            curr++;
            switch (*curr) {
                case 'n':
                    *str_new = '\n';
                    break;
                case '0':
                    *str_new = '\0';
                    break;
                default:
                    *str_new = *curr;
                    break;
            }
        } else {
            *str_new = *curr;
        }
        curr++;
        str_new++;
    }
    str_new--;
    *str_new = '\0';

    printf("%-20s %10s\n", "STRING LITERAL", string_literal);
}

void print_char(char * char_literal) {
    char * curr = char_literal;
    curr++;
    if (*curr == '\\') {
        curr++;
        switch(*curr) {
            case '0':
                printf("%-20s \0\n", "CHARACTER LITERAL");
                return;
            case 'n':
                printf("%-20s \n\n", "CHARACTER LITERAL");
                return;
            default:
                printf("%-20s %20c\n", "CHARACTER LITERAL", char_literal[2]);
                break;
        }
    } 
    printf("%-20s %10c\n", "CHARACTER LITERAL", char_literal[1]);
}

int main(int argc, char*argv[]) {

    char* tokens[] = {
        "EOF",
        "MULTI_COMMENT",
        "SINGLE_COMMENT",
        "STRING",
        "CHARACTER ERROR",
        "CHARACTER_LITERAL",
        "ARRAY",
        "AUTO",
        "BOOLEAN",
        "KEYWORD_CHAR",
        "ELSE",
        "FOR",
        "FUNCTION",
        "IF",
        "INTEGER",
        "PRINT",
        "RETURN",
        "KEYWORD STRING",
        "VOID",
        "WHILE",
        "TRUE",
        "FALSE",
        "AND",
        "OR",
        "TERNARY",
        "COLON",
        "SEMICOLON",
        "COMMA",
        "OPEN SQUARE BRACKET",
        "CLOSE SQUARE BRACKET",
        "OPEN CURLY BRACE",
        "CLOSE CURLY BRACE",
        "OPEN PARENTHESES",
        "CLOSE PARENTHESES",
        "ASSIGNMENT",
        "EXPONENT",
        "INCREMENT",
        "DECREMENT",
        "ADD",
        "HYPHEN",
        "ASTERISK",
        "FORWARD SLASH",
        "PERCENT",
        "EQUALS SIGN",
        "LESS THAN OR EQUAL TO",
        "GREATER THAN OR EQUAL TO",
        "LESS THAN",
        "GREATER THAN",
        "NOT EQUAL TO",
        "NOT",
        "IDENTIFIER",
        "INTEGER_LITERAL",
        "TOKEN ERROR"
    };


    int argind = 1;
    char *opt;
    char *arg;

    while (argind < argc && strlen(argv[argind]) > 1 && argv[argind][0] == '-')
    {
        if (strcmp(argv[argind++], "-scan") == 0) {
            opt = argv[argind++];
        } else {
            usage(argv[0]);
            return 1;
        }
    }
    yyin = fopen(opt, "r");
    if (!yyin) {
        usage(argv[0]);
        return 1;
    }

    while (1) {
        token_t t = yylex();
        if (t == TOKEN_EOF) break;
        if (t == TOKEN_STRING) {
            if (strlen(yytext) > 255) {
                printf("%-20s\n", "STRING TOO LONG");
                exit(EXIT_FAILURE);
            } else {
                print_stripped_str(yytext);
            }
        }
        else if (t == TOKEN_CHAR) {
            print_char(yytext);
        } else if (t == TOKEN_NUMBER 
                || t == TOKEN_IDENT) {
            printf("%-20s %20s\n", tokens[t], yytext);
        } else if (t == TOKEN_ERROR_CHAR 
                    || t == TOKEN_ERROR_INVALID) {
                fprintf(stderr, "%-20s %20s\n", tokens[t], yytext);
                exit(EXIT_FAILURE);
        }
    }
    exit(EXIT_SUCCESS);
}

/* vim: set expandtab sts=4 sw=4 ts=8 ft=c: */
