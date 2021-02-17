%{
#include "calculator.h"
%}

%option noyywrap

blanks       [ \t\n]+
integer      [0-9]+
add          \+
minus        \-
mult         \*
div          \/
op           \(
cl           \)

%%

{blanks}        { /* ignore */ }

{integer}    { yylval = atoi(yytext); return(INTEGER); }
{add}      { return(ADD); }
{minus}     { return(MIN); }
{mult}      { return(MULT); }
{div}    { return(DIV); }
{op}    { return(OP); }
{cl}    { return(CL); }
