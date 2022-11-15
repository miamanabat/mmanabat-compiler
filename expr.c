#include "expr.h"
#include <stdio.h>
#include <stdlib.h>

extern int typecheck_error;
extern int resolve_error;

struct expr * expr_create( expr_t kind, struct expr *left, struct expr *right ) {
    struct expr* e = malloc(sizeof(struct expr));
    e->kind = kind;
    e->left = left;
    e->right = right;
    return e;
}

struct expr * expr_create_ternary( struct expr *left, struct expr *mid, struct expr *right ) {
    struct expr* e = expr_create(EXPR_TERNARY, left, right); 
    e->mid = mid;
    return e;
}

struct expr * expr_create_func_call(char *n, struct expr * expr) {
    struct expr* e = expr_create(EXPR_FUNC_CALL, expr_create_name(n), expr);   
    return e;

}

struct expr * expr_create_name( const char *n ) {
    struct expr* e = expr_create(EXPR_IDENT, NULL, NULL);
    e->name = n; 
    return e;
}

struct expr * expr_create_integer_literal( int c ) {
    struct expr* e = expr_create(EXPR_NUMBER, NULL, NULL);
    e->literal_value = c;
    return e;
}

struct expr * expr_create_boolean_literal( int c ) {
    struct expr* e = expr_create(EXPR_BOOL, NULL, NULL);
    e->literal_value = c;
    return e;
}

struct expr * expr_create_char_literal( const char* c ) {
    struct expr* e = expr_create(EXPR_CHAR, NULL, NULL);
    e->char_literal = c;
    return e;
}

struct expr * expr_create_string_literal( const char *str ) {
    struct expr* e = expr_create(EXPR_STRING, NULL, NULL);
    e->string_literal = str;
    return e;
}

void compare_precedence(struct expr *expr, expr_t kind, int eq_not_needed) {
    // add parens when op has lower precedence than expr tested
    // if equivalent precedence, parens are not needed if eq_not_needed is one
    if (expr->kind + 10 > kind && kind + 10 > expr->kind  && eq_not_needed == 1) {
        expr_print(expr);
    }
    else if (kind + 10 < expr->kind) {
        expr_print(expr);
    } else {
        printf("(");
        expr_print(expr);
        printf(")");
    } 
}

void expr_print( struct expr *e ) {
    if (!e) return;

    switch (e->kind) {
        case EXPR_ASSIGNMENT:
            compare_precedence(e->left, EXPR_ASSIGNMENT, 0);
            printf("=");
            compare_precedence(e->right, EXPR_ASSIGNMENT, 1);
            break;
        case EXPR_TERNARY:
            compare_precedence(e->left, EXPR_TERNARY, 0);
            printf("?");
            compare_precedence(e->mid, EXPR_TERNARY, 1);
            printf(":"); 
            compare_precedence(e->right, EXPR_TERNARY, 1);
            break;
        case EXPR_OR:
            compare_precedence(e->left, EXPR_OR, 1);
            printf("||");
            compare_precedence(e->right, EXPR_OR, 0);
            break;
        case EXPR_AND:
            compare_precedence(e->left, EXPR_AND, 1);
            printf("&&");
            compare_precedence(e->right, EXPR_AND, 0);
            break;

        case EXPR_EQ:
            compare_precedence(e->left, EXPR_EQ, 1);
            printf("==");
            compare_precedence(e->right, EXPR_EQ, 0);
            break;
        case EXPR_LE:
            compare_precedence(e->left, EXPR_LE, 1);
            printf("<=");
            compare_precedence(e->right, EXPR_LE, 0);
            break;
        case EXPR_GE:
            compare_precedence(e->left, EXPR_GE, 1);
            printf(">=");
            compare_precedence(e->right, EXPR_GE, 0);
            break;
        case EXPR_LT:
            compare_precedence(e->left, EXPR_LT, 1);
            printf("<");
            compare_precedence(e->right, EXPR_LT, 0);
            break;
        case EXPR_GT:
            compare_precedence(e->left, EXPR_GT, 1);
            printf(">");
            compare_precedence(e->right, EXPR_GT, 0);
            break;
        case EXPR_NE:
            compare_precedence(e->left, EXPR_NE, 1);
            printf("!=");
            compare_precedence(e->right, EXPR_NE, 0);
            break;

        case EXPR_ADD:
            compare_precedence(e->left, EXPR_ADD, 1);
            printf("+");
            compare_precedence(e->right, EXPR_ADD, 0);
            break;
        case EXPR_SUB:
            compare_precedence(e->left, EXPR_SUB, 1);
            printf("-");
            compare_precedence(e->right, EXPR_SUB, 0);
            break;
        case EXPR_MUL:
            compare_precedence(e->left, EXPR_MUL, 1);
            printf("*");
            compare_precedence(e->right, EXPR_MUL, 0);
            break;
        case EXPR_DIV:
            compare_precedence(e->left, EXPR_DIV, 1);
            printf("/");
            compare_precedence(e->right, EXPR_DIV, 0);
            break;
        case EXPR_MOD:
            compare_precedence(e->left, EXPR_MOD, 1);
            printf("%%");
            compare_precedence(e->right, EXPR_MOD, 0);
            break;

        case EXPR_EXP:
            compare_precedence(e->left, EXPR_EXP, 0);
            printf("^");
            compare_precedence(e->right, EXPR_EXP, 1);
            break;

        case EXPR_NOT:
            printf("!");
            compare_precedence(e->left, EXPR_NOT, 1);
            break;
        case EXPR_NEGATE:
            printf("-");
            compare_precedence(e->left, EXPR_NEGATE, 1);
            break;

        case EXPR_DECREMENT:
            compare_precedence(e->left, EXPR_DECREMENT, 1);
            printf("--");
            break;
        case EXPR_INCREMENT:
            compare_precedence(e->left, EXPR_INCREMENT, 1);
            printf("++");
            break;

        case EXPR_FUNC_CALL: 
            expr_print(e->left);
            printf("(");
            expr_print(e->right);
            printf(")");
            break;
        case EXPR_ARR_INDEX: 
            expr_print(e->left);
            printf("[");
            expr_print(e->right);
            printf("]");
            break;

        case EXPR_NUMBER:
            printf("%d", e->literal_value);
            break;
        case EXPR_STRING:
            printf("%s", e->string_literal);
            break;
        case EXPR_CHAR:
            printf("%s", e->char_literal);
            break;
        case EXPR_BOOL:
            if (e->literal_value == 0) printf("false");
            else printf("true");
            break;
        case EXPR_IDENT:
            printf("%s", e->name);
            break;
        case EXPR_ARR_INIT:
            printf("{");
            expr_print(e->left);
            printf("}");
            break;
        case EXPR_LIST:
            expr_print(e->left);
            printf(",");
            expr_print(e->right);
            break;
    }
}

void expr_resolve(struct scope *s, struct expr *e) {
    if (!e) return;
    if (e->kind==EXPR_IDENT) {
        e->symbol = scope_lookup(s, e->name);
        if (!e->symbol) {
            printf("resolve error: %s is not declared\n", e->name);
            resolve_error = 1;
        }
        else print_resolve(e->symbol);  
    } else {
        expr_resolve(s, e->left);
        expr_resolve(s, e->mid);
        expr_resolve(s, e->right);
    }
}

struct type * expr_typecheck( struct expr *e  ) {
    if (!e) return 0;
    struct type *lt = expr_typecheck(e->left);
    struct type *mid;
    struct type *rt = expr_typecheck(e->right);
    struct type *result;
    struct param_list *params;
    switch(e->kind) {
        case EXPR_NUMBER:
            result = type_create(TYPE_INTEGER,0,0,0);
            break;
        case EXPR_STRING:
            result = type_create(TYPE_STRING,0,0,0);
            break;
        case EXPR_CHAR:
            result = type_create(TYPE_CHARACTER,0,0,0);
            break;
        case EXPR_BOOL:
            result = type_create(TYPE_BOOLEAN,0,0,0);
            break;
        case EXPR_IDENT:
            result = type_copy(e->symbol->type);
            break;
        case EXPR_ARR_INIT:
            result = type_create(TYPE_ARRAY,type_copy(lt),0,0);
            check_arr_types(e->left);
            result->num_elements = count_expr_list(e->left);
            result->arr_expr = expr_create_integer_literal(result->num_elements);
            break;
        case EXPR_LIST:
            result = type_copy(lt);
            break;
        case EXPR_FUNC_CALL:
            // create param list from expr list and check params
            params = param_list_from_exprlist(e->right);
            param_list_compare(params, e->left->symbol->type->params, 0); // return error code  
            result = type_create(e->left->symbol->type->subtype->kind,0,0,0); 
            break;
                
        case EXPR_ARR_INDEX:
            if (lt->kind == TYPE_ARRAY) {
                if(rt->kind != TYPE_INTEGER) {
                    // error: index not an integer 
                    printf("type error: indexing");
                    expr_type_print(e->right, rt);
                    printf(" is not an integer\n");   
                    typecheck_error = 1;
                }
                result = type_copy(lt->subtype);
                printf("indexing %d\n", lt->arr_expr->literal_value);
            } else {
                // error: not an array
                printf("type error: cannot index a variable of type ");
                type_print(lt);
                printf("\n");
                result = type_copy(lt);
                typecheck_error = 1;
            }
            break;

        case EXPR_DECREMENT:
            if (lt->kind != TYPE_INTEGER) {
                printf("type error: cannot decrement");
                expr_type_print(e->left, lt);
                printf("\n");
                typecheck_error = 1;
            }
            result = type_create(TYPE_INTEGER,0,0,0);
            break;
        case EXPR_INCREMENT:
            if (lt->kind != TYPE_INTEGER) {
                printf("type error: cannot increment");
                expr_type_print(e->left, lt);
                printf("\n");
                typecheck_error = 1;
            }
            result = type_create(TYPE_INTEGER,0,0,0);
            break;

        case EXPR_NEGATE:
            if (lt->kind != TYPE_INTEGER) {
                printf("type error: cannot negate");
                expr_type_print(e->left, lt);
                printf("\n");
                typecheck_error = 1;
            }
            result = type_create(TYPE_INTEGER,0,0,0);
            break;

        case EXPR_EXP:
            if (lt->kind != TYPE_INTEGER || rt->kind != TYPE_INTEGER) {
                printf("type error: cannot exponentiate a ");
                expr_type_print(e->left, lt);
                printf(" by a ");
                expr_type_print(e->right, rt);
                printf("\n");
                typecheck_error = 1;
            }
            result = type_create(TYPE_INTEGER,0,0,0);
            break;


        case EXPR_MOD:
            if (lt->kind != TYPE_INTEGER || rt->kind != TYPE_INTEGER) {
                printf("type error: cannot modulo");
                expr_type_print(e->left, lt);
                printf("by");
                expr_type_print(e->right, rt);
                printf("\n");
                typecheck_error = 1;
            }
            result = type_create(TYPE_INTEGER,0,0,0);
            break;
            
        case EXPR_DIV:
            if (lt->kind != TYPE_INTEGER || rt->kind != TYPE_INTEGER) {
                printf("type error: cannot divide");
                expr_type_print(e->left, lt);
                printf("by");
                expr_type_print(e->right, rt);
                printf("\n");
                typecheck_error = 1;
            }
            result = type_create(TYPE_INTEGER,0,0,0);
            break;

        case EXPR_MUL:
            if (lt->kind != TYPE_INTEGER || rt->kind != TYPE_INTEGER) {
                printf("type error: cannot multiply");
                expr_type_print(e->left, lt);
                printf("by a");
                expr_type_print(e->right, rt);
                printf("\n");
                typecheck_error = 1;
            }
            result = type_create(TYPE_INTEGER,0,0,0);
            break;

        case EXPR_SUB:
            if (lt->kind != TYPE_INTEGER || rt->kind != TYPE_INTEGER) {
                printf("type error: cannot subtract");
                expr_type_print(e->left, lt);
                printf("by");
                expr_type_print(e->right, rt);
                printf("\n");
                typecheck_error = 1;
            }
            result = type_create(TYPE_INTEGER,0,0,0);
            break;

        case EXPR_ADD:
            if(lt->kind != TYPE_INTEGER || rt->kind != TYPE_INTEGER) {
                printf("type error: cannot add");
                expr_type_print(e->left, lt);
                printf("to");
                expr_type_print(e->right, rt);
                printf("\n");
                typecheck_error = 1; 
            }
            result = type_create(TYPE_INTEGER,0,0,0);
            break;

        case EXPR_LE:
        case EXPR_GE:
        case EXPR_LT:
        case EXPR_GT:
            if(lt->kind != TYPE_INTEGER || rt->kind != TYPE_INTEGER) {
                printf("type error: cannot compare");
                expr_type_print(e->left, lt);
                printf("to");
                expr_type_print(e->right, rt);
                printf("\n");
                typecheck_error = 1;
            }  
            result = type_create(TYPE_BOOLEAN,0,0,0);
            break;

        case EXPR_EQ:
        case EXPR_NE:
            if(type_compare(lt,rt,0)) {
                printf("type error: cannot compare");
                expr_type_print(e->left, lt);
                printf("to");
                expr_type_print(e->right, rt);
                printf("\n");
                typecheck_error = 1;
            }  
            if (lt->kind==TYPE_VOID || lt->kind==TYPE_ARRAY || lt->kind==TYPE_FUNCTION) {
                printf("type error: cannot compare type ");
                expr_type_print(e->left, lt);
                printf("and");
                expr_type_print(e->right, rt);
                printf("\n");            
                typecheck_error = 1;
            }
            result = type_create(TYPE_BOOLEAN,0,0,0);
            break;

        case EXPR_AND:
            if (lt->kind != TYPE_BOOLEAN || rt->kind != TYPE_BOOLEAN) {
                printf("type error: cannot AND");
                expr_type_print(e->left, lt);
                printf("and");
                expr_type_print(e->right, rt);
                printf("\n");
                typecheck_error = 1;
            }
            result = type_create(TYPE_BOOLEAN,0,0,0);
            break;

        case EXPR_OR:
            if (lt->kind != TYPE_BOOLEAN || rt->kind != TYPE_BOOLEAN) {
                printf("type error: cannot OR");
                expr_type_print(e->left, lt);
                printf("and");
                expr_type_print(e->right, rt);
                printf("\n");
                typecheck_error = 1;
            }
            result = type_create(TYPE_BOOLEAN,0,0,0);
            break;
        case EXPR_NOT:
            if (lt->kind != TYPE_BOOLEAN) {
                printf("type error: cannot NOT");
                expr_type_print(e->left, lt);
                printf("\n");
                typecheck_error = 1;
            }
            result = type_create(TYPE_BOOLEAN,0,0,0);
            break;

        case EXPR_ASSIGNMENT:
            if (e->left->kind != EXPR_IDENT && e->left->kind != EXPR_ARR_INDEX) {
                printf("type error: only idents may be assigned values, not");
                expr_type_print(e->left, lt);
                printf("\n");
                typecheck_error = 1;
                break;
            }
            if (lt->kind == TYPE_FUNCTION) {
                printf("type error: cannot assign functions without declaring\n");
                typecheck_error = 1;
            } else if (lt->kind == TYPE_ARRAY) {
                if (rt->kind != TYPE_ARRAY) {
                    printf("type error: array cannot be assigned to type ");
                    type_print(rt);
                    printf("\n");
                    typecheck_error = 1;
                } 
                // array type compared only with first expr in it here, array homogenous checked in array_init
                else if (lt->subtype->kind != TYPE_AUTO && type_compare(lt->subtype, rt->subtype, 0)) {
                    printf("type error: array type ");
                    type_print(e->left->symbol->type->subtype);
                    printf(" does not match the element of type ");
                    type_print(rt->subtype);
                    printf("\n");
                    typecheck_error = 1;
                }
                else if (rt->arr_expr->literal_value != lt->arr_expr->literal_value) {
                    printf("type error: array size %d does not match array initializer %d\n", lt->num_elements, rt->arr_expr->literal_value);
                    typecheck_error = 1;
                }  
                      
            } else if (lt->kind == TYPE_AUTO) {
                // if left is auto
                if (rt->kind == TYPE_AUTO || rt->kind == TYPE_FUNCTION || rt->kind == TYPE_VOID) {
                    printf("type error: cannot assign");
                    expr_type_print(e->right, rt);
                    printf(" to");
                    expr_type_print(e->left, lt);
                    printf("\n");
                    typecheck_error = 1;
                }
                // update the symbol of the auto var to the type of the right
                printf("notice: %s is now of type ", e->left->name);

            } else if (type_compare(lt, rt, 0)) {
                // left must be ident and match
                printf("type error: cannot assign");
                expr_type_print(e->right, rt);
                printf(" to");
                expr_type_print(e->left, lt);
                printf("\n");
                typecheck_error = 1;
            } 
            break;
        case EXPR_TERNARY:
            if (lt->kind != TYPE_BOOLEAN) {
                printf("type error: cannot evaluate");
                expr_type_print(e->left, lt);
                printf("in a ternary expression.\n");
                typecheck_error = 1;
            } 
            mid = expr_typecheck(e->mid);
            if (type_compare(mid, rt, 0)) {
                printf("type error: ternary middle expr");
                expr_type_print(e->mid, mid);
                printf("does not match last expr");
                expr_type_print(e->right, rt);
                printf("\n");
                typecheck_error = 1;
            }
            result = type_copy(mid);
            break;
    }
    return result;
    
}

void expr_type_print(struct expr * e, struct type * t) {
    if (!e) return;
    switch (t->kind) {
        case TYPE_VOID:
        case TYPE_BOOLEAN:
        case TYPE_CHARACTER:
        case TYPE_STRING:
        case TYPE_FUNCTION:
            printf(" a ");
            break;
        case TYPE_INTEGER:
        case TYPE_ARRAY:
        case TYPE_AUTO:
            printf(" an ");
            break;
    }
    type_print(t);
    printf(" (");
    expr_print(e);
    printf(")");
}

int check_arr_types(struct expr *e) {
    if (!e) return 0;
    if (!e->right) return 0;
    if (e->right->kind != EXPR_LIST) {
        int ret = type_compare(expr_typecheck(e->left), expr_typecheck(e->right), 0);
        if (ret) {
            printf("type error: array elements must be of the same type:");
            expr_type_print(e->left, expr_typecheck(e->left));
            printf(" and");
            expr_type_print(e->right, expr_typecheck(e->right));
            printf("\n");
            typecheck_error = 1;
        }
        return ret;
    }
    if (type_compare(expr_typecheck(e->left), expr_typecheck(e->right->left), 0)) {
        printf("type error: arrays must be of the same element\n");
        typecheck_error = 1;
        return 1;
    }
    return check_arr_types(e->right);
}

int count_expr_list(struct expr *e) {
    if (!e) return 0;
    if (!e->right) return 1;
    if (e->right->kind != EXPR_LIST) return 2;
    return 1 + count_expr_list(e->right); 
}

struct expr *expr_copy(struct expr *e) {
    if (!e) return NULL;
    struct expr *copy = expr_create(e->kind, expr_copy(e->left), expr_copy(e->right));
    copy->mid = expr_copy(e->mid);
    copy->name = e->name;
    copy->literal_value = e->literal_value;
    copy->string_literal = e->string_literal;
    copy->char_literal = e->char_literal;
    copy->symbol = e->symbol; 
    return copy;
}
