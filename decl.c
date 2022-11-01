#include "decl.h"
#include <stdio.h>
#include <stdlib.h>

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

