#include "type.h"
#include "expr.h"
#include <stdlib.h>
#include <stdio.h>

struct type * type_create( type_t kind, struct type *subtype, struct expr *arr_expr, struct param_list *params ) {
    struct type* t = malloc(sizeof(struct type));
    t->kind = kind;
    t->subtype = subtype;
    t->arr_expr = arr_expr;
    t->params = params;
    return t;
}

void type_print( struct type *t ) {
    if (!t) return;

    switch (t->kind) {
        case TYPE_VOID:
            printf("void");
            break;
        case TYPE_BOOLEAN:
            printf("boolean");
            break;
        case TYPE_CHARACTER:
            printf("char");
            break;
        case TYPE_INTEGER:
            printf("integer");
            break;
        case TYPE_STRING:
            printf("string");
            break;
        case TYPE_ARRAY:
            printf("array[");
            expr_print(t->arr_expr);
            printf("] ");
            type_print(t->subtype);
            break;
        case TYPE_FUNCTION:
            printf("function ");
            type_print(t->subtype);
            printf("(");
            param_list_print(t->params);
            printf(")");
            break;
        case TYPE_AUTO:
            printf("auto");
            break;

    }
    
}

