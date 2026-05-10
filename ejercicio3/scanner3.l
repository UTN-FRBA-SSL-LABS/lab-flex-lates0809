%option noyywrap

%{
#include <stdio.h>

int contadorTokens = 0;
int duplicar(int x);
%}

%%

[a-zA-Z_][a-zA-Z0-9_]* {
    contadorTokens++;
    printf("identificador: %s\n", yytext);
}

[ \t\n] { }

. { }

%%

int main(void) {
    yylex();
    printf("Tokens totales: %d\n", contadorTokens);
    printf("El doble es: %d\n", duplicar(contadorTokens));
    return 0;
}