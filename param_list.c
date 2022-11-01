#include "param_list.h"
#include <stdio.h>
#include <stdlib.h>

struct param_list * param_list_create( char *name, struct type *type, struct param_list *next ) {
    struct param_list* p = malloc(sizeof(struct param_list));
    p->name = name;
    p->type = type;
    p->next = next;
    return p;
}
void param_list_print( struct param_list *a ) {
    if (!a) return;

    printf("%s", a->name);
    printf(":");
    type_print(a->type);

    if (a->next) {
        printf(",");
        param_list_print(a->next);
    }
}

