
#include "stmt.h"
#include "decl.h"
#include <stdio.h>
#include <stdlib.h>

struct stmt * stmt_create( stmt_t kind, struct decl *decl, struct expr *init_expr, struct expr *expr, struct expr *next_expr, struct stmt *body, struct stmt *else_body, struct stmt *next ) {
    struct stmt * s = malloc(sizeof(struct stmt));
    s->kind = kind;
    s->decl = decl;
    s->init_expr = init_expr;
    s->expr = expr;
    s->next_expr = next_expr;
    s->body = body;
    s->else_body = else_body;
    s->next = next;
    s->else_if = 0;
    return s; 
}

void stmt_print( struct stmt *s, int indent ) {
    if (!s) return;

    if (s->kind != STMT_DECL && s->else_if == 0) {
        indent_print(indent);
    }

    switch(s->kind) {
        case STMT_DECL:
            decl_print(s->decl, indent);
            break;
        case STMT_EXPR:
            expr_print(s->expr);
            printf(";\n");
            break;
        case STMT_IF_ELSE: 
            printf("if (");
            expr_print(s->expr);
            printf(") \n");
            if (s->body->kind == STMT_BLOCK)
                stmt_print(s->body, indent);
            else
                stmt_print(s->body, indent + 1);
            indent_print(indent);
                  
            if (s->else_body) {
                printf("else ");
                if (s->else_body->kind == STMT_IF_ELSE) {
                    s->else_body->else_if = 1;
                    stmt_print(s->else_body, indent); 
                } else {
                    printf("\n");
                    if (s->else_body->kind == STMT_BLOCK)
                        stmt_print(s->else_body, indent);
                    else 
                        stmt_print(s->else_body, indent + 1);
                } 
            } else {
                printf("\n");
            }
            break;
        case STMT_FOR:
            printf("for (");
            expr_print(s->init_expr);
            printf(";");
            expr_print(s->expr);
            printf(";");
            expr_print(s->next_expr);
            printf(")\n");
            if (s->body->kind == STMT_BLOCK) { 
                stmt_print(s->body, indent);
            } else {
                stmt_print(s->body, indent + 1);
            }
            break;
        case STMT_PRINT:
            printf("print ");
            expr_print(s->expr);
            printf(";\n");
            break;
        case STMT_RETURN:
            printf("return");
            if (s->expr) printf(" ");
            expr_print(s->expr);
            printf(";\n");
            break;
        case STMT_BLOCK:
            printf("{\n");
            stmt_print(s->body, indent + 1);
            indent_print(indent);
            printf("}\n");
            break;
    }

    stmt_print(s->next, indent);
}

