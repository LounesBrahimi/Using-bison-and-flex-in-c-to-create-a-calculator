%{
#include <stdio.h>
#define YYSTYPE int
int yyparse();
int yylex();
int yyerror(char *s);
%}

%token INTEGER
%left ADD
%left MIN
%left MULT
%left DIV
%token OP
%token CL

%%

Program: Exprs { printf("\n\n\n\nResult: %d\n", $1); }

Exprs: INTEGER | Add | Minus | Mult | Div | Parenthesis { $$ = $1; }

Parenthesis : OP Exprs CL { $$ = $2; }

Add : Exprs ADD Exprs { $$ = $1 + $3; }

Minus : Exprs MIN Exprs { $$ = $1 - $3; }

Mult : Exprs MULT Exprs { $$ = $1 * $3; }

Div : Exprs DIV Exprs { $$ = $1 / $3; }

%%

int yyerror(char *s) {
    printf("yyerror : %s\n",s);
    return 0;
}

int main(void) {
    yyparse();
    return 0;
}
