%option noyywrap

digito      [0-9]
letra       [a-zA-Z_]
identificador {letra}({letra}|{digito})*
digitoHexa  [0-9A-Fa-f]

%%

0[xX]{digitoHexa}+ {
    printf("constante hexadecimal de longitud %d: %s\n", yyleng, yytext);
}

{digito}+ {
    printf("constante decimal de longitud %d: %s\n", yyleng, yytext);
}

{identificador} {
    printf("identificador de longitud %d: %s\n", yyleng, yytext);
}

[ \t\n] { }

. { }

%%

int main(void) {
    yylex();
    return 0;
}