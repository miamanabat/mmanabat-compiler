#include "expr.h"
#include <stdio.h>
#include <stdlib.h>


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


