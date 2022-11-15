#include "symbol.h"
#include <stdlib.h>

struct symbol * symbol_create( symbol_t kind, struct type *type, char *name ) {
    struct symbol *s = malloc(sizeof(struct symbol));
    s->kind = kind;
    s->type = type;
    s->name = name;
    s->which = 0;
    s->defined = 0;
    return s;
}

void print_resolve(struct symbol *symbol) {
    printf("%s resolves to ", symbol->name);
    if (symbol->kind == SYMBOL_GLOBAL) printf("global %s\n", symbol->name);
    else if (symbol->kind == SYMBOL_LOCAL) printf("local %d\n", symbol->which);
    else printf("param %d\n", symbol->which);
}
