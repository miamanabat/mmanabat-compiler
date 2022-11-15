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

struct type * type_copy( struct type *t ) {
    if (!t) return NULL;
    // return a duplicate copy of t, making sure to duplicate subtype and params recursively
    struct type * copy = type_create(t->kind, type_copy(t->subtype), expr_copy(t->arr_expr), param_list_copy(t->params));
    copy->num_elements = t->num_elements;
    return copy;
}
int type_compare( struct type *a, struct type *b, int change ) {
    if (!a && !b) return 0;
    if (!a || !b) return 1;
    if (change && a->subtype && b->subtype && a->subtype->kind == TYPE_AUTO) {
        a->subtype = type_copy(b->subtype);
        printf("notice: type of array auto is now ");
        type_print(b->subtype);
        printf("\n");        
    }
    if (a->kind == TYPE_ARRAY && b->kind == TYPE_ARRAY) {
        printf("%d %d %d %d\n\n", a->arr_expr->literal_value, b->arr_expr->literal_value, a->num_elements, b->num_elements);
        if (a->arr_expr->literal_value != b->num_elements) return 1;
        return type_compare(a->subtype, b->subtype, change);
    } else if (a->kind == TYPE_FUNCTION && b->kind == TYPE_FUNCTION) {
        return type_compare(a->subtype, b->subtype, change) && param_list_compare(a->params, b->params, 0);
    } else if (a->kind == b->kind){
        return 0;
    } else {
        return 1;
    }
}

