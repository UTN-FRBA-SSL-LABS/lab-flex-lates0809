%option noyywrap

%{
#include <stdio.h>
#include <stdlib.h>

int yylval;

enum {
    NUMBER = 258,
    IDENT = 259
};
%}

%%

[0-9]+ {
    yylval = atoi(yytext);
    printf("TOKEN NUMBER (%d) valor=%d\n", NUMBER, yylval);
    return NUMBER;
}

[a-zA-Z_][a-zA-Z0-9_]* {
    printf("TOKEN IDENT (%d) lexema=%s\n", IDENT, yytext);
    return IDENT;
}

"+" {
    printf("TOKEN '+'\n");
    return '+';
}

"-" {
    printf("TOKEN '-'\n");
    return '-';
}

"*" {
    printf("TOKEN '*'\n");
    return '*';
}

[ \t\n] { }

. { }

%%

int main(void) {
    while (yylex())
        ;
    return 0;
}