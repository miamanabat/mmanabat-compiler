
#include "stmt.h"
#include "decl.h"
#include <stdio.h>
#include <stdlib.h>

extern int typecheck_error;

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

void stmt_resolve(struct scope *s, struct stmt *stmt) {
    if (!stmt) return;
    switch (stmt->kind) {
        case STMT_DECL:
            decl_resolve(s, stmt->decl);
            break;
        case STMT_BLOCK:
            scope_enter(s);
            stmt_resolve(s->next, stmt->body);
            scope_exit(s->next);
            break;
        case STMT_IF_ELSE:
            expr_resolve(s, stmt->expr);
            stmt_resolve(s, stmt->body);
            stmt_resolve(s, stmt->else_body);
            break;
        case STMT_FOR:
            expr_resolve(s, stmt->init_expr);
            expr_resolve(s, stmt->expr);
            expr_resolve(s, stmt->next_expr);
            stmt_resolve(s, stmt->body);
            break;
        case STMT_EXPR:
        case STMT_PRINT:
        case STMT_RETURN:
            expr_resolve(s, stmt->expr);
            break;
    }
    stmt_resolve(s, stmt->next);
}

void stmt_typecheck(struct stmt *s, struct decl *decl) {
    if (!s) return;
    struct type *t;
    switch(s->kind) {
        case STMT_DECL:
            decl_typecheck(s->decl);
            break;
        case STMT_EXPR:
            t = expr_typecheck(s->expr);
            break;
        case STMT_IF_ELSE:
            // must be conditions in the if else statements
            t = expr_typecheck(s->expr);
            if (t->kind!=TYPE_BOOLEAN) {
                printf("type error: ");
                expr_type_print(s->expr, t);
                printf("is not allowed in if condition. Should be a boolean value.\n");
                typecheck_error = 1;
            }
            stmt_typecheck(s->body, decl);
            stmt_typecheck(s->else_body, decl);
            break;
        case STMT_FOR:
            t = expr_typecheck(s->init_expr);
            t = expr_typecheck(s->expr);
            t = expr_typecheck(s->next_expr);
            stmt_typecheck(s->body, decl);
            break;
        case STMT_BLOCK:
            stmt_typecheck(s->body, decl);
            break;
        case STMT_PRINT:
            expr_typecheck(s->expr);
            break;
        case STMT_RETURN:
            t = expr_typecheck(s->expr);
            if (t) {
                if (decl->symbol->type->subtype->kind == TYPE_VOID) {
                // if return type of void function is non-void
                    printf("type error: function return type void cannot return type ");
                    expr_type_print(s->expr, t);
                    printf("\n");
                    typecheck_error = 1;
                } else if (t->kind == TYPE_AUTO || t->kind == TYPE_VOID || t->kind == TYPE_FUNCTION || t->kind == TYPE_ARRAY) {
                // return type cannot be auto void function, or array
                    printf("type error: return type ");
                    expr_type_print(s->expr, t);
                    printf(" is invalid\n");  
                    typecheck_error = 1;
                } else if (decl->symbol->type->subtype->kind == TYPE_AUTO) {
                // if function return type is auto, then assign return type to that type
                    decl->symbol->type->subtype = type_copy(t); 
                } else if (type_compare(t, decl->symbol->type->subtype, 0)) {
                // if types are not the same, print error
                    printf("type error: return type ");
                    expr_type_print(s->expr, t);
                    printf(" does not match the function return type ");
                    type_print(decl->symbol->type->subtype);
                    printf("\n");
                    typecheck_error = 1;
                }
            } else if (decl->symbol->type->subtype->kind != TYPE_VOID) {
            // if no return expression but its not type void
                printf("type error: function return type (");
                type_print(decl->symbol->type->subtype);
                printf(") requires a non-void return type.\n");
                typecheck_error = 1;
            }
            // mark that there was a return statement
            decl->return_exists = 1;
            break;
    }
    stmt_typecheck(s->next, decl);
    
}


// make sure to check that there is something returned
