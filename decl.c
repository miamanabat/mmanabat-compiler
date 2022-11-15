#include "decl.h"
#include <stdio.h>
#include <stdlib.h>

extern int typecheck_error;
extern int resolve_error;

struct decl * decl_create( char *name, struct type *type, struct expr *value, struct stmt *code, struct decl *next ) {
    struct decl* d = malloc(sizeof(struct decl));
    d->name = name;
    d->type = type;
    d->value = value;
    d->code = code;
    d->symbol = NULL;
    d->next = next;
    d->func_def = 0;
    return d;
}

struct decl * decl_func_def_create(char *name, struct type *type, struct expr *value, struct stmt *code, struct decl *next) {
    struct decl *d = decl_create(name, type, value, code, next);
    d->func_def = 1;
    return d;
}
void decl_print( struct decl *d, int indent ) {
    if (!d) return;

    indent_print(indent);
    printf("%s: ", d->name);
    type_print(d->type);
    if (d->value) {
        printf(" = ");
        expr_print(d->value);
        printf(";\n");
    } else if (d->type->kind == TYPE_FUNCTION) {
        if (d->func_def == 0){
            printf(";\n");
        } else {
            printf(" = \n");
            indent_print(indent);
            printf("{\n");
            stmt_print(d->code, indent + 1);
            indent_print(indent);
            printf("}\n");  
        }
    } else {
        printf(";\n");
    }
    decl_print(d->next, indent);
}

void indent_print(int indent) {
    if (indent < 0) return;
    for (int i = 0; i < indent * 4; i++) {
        printf(" ");
    }
}

// add return ints and stuff
void decl_resolve(struct scope *s, struct decl *d) {
    if(!d) return;
    symbol_t kind = scope_level(s) > 1 ?
        SYMBOL_LOCAL : SYMBOL_GLOBAL;

    d->symbol = symbol_create(kind,d->type,d->name); 
    d->symbol->which = s->var_count;
    inc_var_counter(s);
    
    expr_resolve(s, d->value);

    // if already in the symbol table
    if (scope_bind(s, d->name,d->symbol) != 0) {
        // if function, compare parameters- must be consistent
        if (d->type->kind == TYPE_FUNCTION) {
            // check return type
            struct symbol *symbol = scope_lookup(s, d->name);
            if (type_compare(d->type->subtype, symbol->type->subtype, 0)) {
                printf("%s is already defined with a different return type of ", d->name);
                type_print(symbol->type->subtype);
                printf("\n");
                resolve_error = 1;
            }
            // check param list
            if (param_list_compare(d->type->params, symbol->type->params, 1)) {
                printf("%s is already defined, conflicting param types\n", d->name);
                resolve_error = 1;    
            } 
            // check if function is being redefined --> error
            if (symbol->defined && d->code) {
                printf("%s is already defined\n", d->name);
                resolve_error = 1;
            }

            // might neeed to check for whether it is defined and if it is then you have to say error? might be in typechecking
        } else {
            printf("%s is already defined\n", d->name); 
            resolve_error = 1;
        }
    } 
    // function: enter scope, resolve things
    if(d->code) {
        d->symbol->defined = 1;
        scope_enter(s);
        param_list_resolve(s->next, d->type->params);
        reset_var_counter(s->next);
        stmt_resolve(s->next, d->code);
        scope_exit(s->next);
        
    }
    decl_resolve(s, d->next);
}

void decl_typecheck( struct decl *d ) {
    if (!d) return;

    if (d->symbol->type->kind == TYPE_ARRAY) {
        if (d->symbol->type->subtype->kind == TYPE_FUNCTION || d->symbol->type->subtype->kind == TYPE_VOID) {
            printf("type error: cannot declare an array of type ");
            type_print(d->symbol->type->subtype);
            printf("\n");
            typecheck_error = 1;
        }
        // make sure that the array size is a literal int value or null
        if (d->symbol->type->arr_expr) {
           if (d->symbol->type->arr_expr->kind != EXPR_NUMBER) {
                printf("type error: cannot declare an array with a non-int literal value");
                expr_type_print(d->symbol->type->arr_expr, expr_typecheck(d->symbol->type->arr_expr));
                printf("\n");
                typecheck_error = 1;
            }
            d->symbol->type->num_elements = d->symbol->type->arr_expr->literal_value;

        } else {
            d->symbol->type->num_elements = 0;
        }
        if (d->symbol->kind == SYMBOL_LOCAL) {
            printf("type error: cannot declare array (%s) in local scope\n", d->symbol->name);
        }
    } else if (d->symbol->type->kind == TYPE_FUNCTION) {
        // if function, check param_list for any autos
        param_list_auto(d->symbol->type->params);
    }

    if (d->value) {
        struct type *t = expr_typecheck(d->value);
        // check that globals are literal values only
        if (d->symbol->kind == SYMBOL_GLOBAL) {
            switch (d->value->kind) {
                case EXPR_NUMBER:
                case EXPR_STRING:
                case EXPR_CHAR:
                case EXPR_BOOL:
                case EXPR_ARR_INIT:
                    break;
                default:
                    printf("type error: cannot declare non-literal value");
                    expr_type_print(d->value, t);
                    printf(" in global scope\n");
                    typecheck_error = 1;
                    break;
            }
            if (d->symbol->type->kind == TYPE_ARRAY) {
                if (!d->symbol->type->arr_expr) {
                    printf("type error: array (%s) must be declared with integer length outside of params\n", d->symbol->name);
                    typecheck_error = 1;
                }
            }
        } 
        // check types of d and d value
        if (type_compare(d->symbol->type, t, 1)) {
            printf("type error: cannot declare a type ");
            type_print(d->symbol->type);
            printf(" to be");
            expr_type_print(d->value, t);
            printf("\n");
            typecheck_error = 1;
        }
        d->symbol->defined = 1; 
    }
    if (d->code) {
        // check return type
        struct type *return_type = d->type->subtype;
        if (return_type->kind == TYPE_FUNCTION || return_type->kind == TYPE_ARRAY) {
            printf("type error: return type of function canot be ");
            type_print(return_type);
            printf("\n");  
            typecheck_error = 1;
        }
        stmt_typecheck(d->code, d);
        if (return_type->kind != TYPE_VOID && d->return_exists == 0) {
            printf("type error: no return statement for a non-void function\n");
            typecheck_error = 1;
        }
    d->symbol->defined = 1;
    }
    decl_typecheck(d->next);
    
}
