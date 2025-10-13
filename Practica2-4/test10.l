%option noyywrap

%{
    #include <stdio.h>
    FILE *yyin;
%}

PalaRe auto|break|case|const|continue|default|do|else|enum|extern|for|goto|if|register|return|sizeof|static|struct|switch|typedef|union|volatile|while
TipoDato char|int|float|double|void|short|long|signed|unsigned
Variable [a-zA-Z][a-zA-Z0-9_]+

%%
 
{TipoDato}    { printf("Tipo de Dato: %s\n", yytext); }
{PalaRe}      { printf("Palabra Reservada: %s\n", yytext); }
{Variable}    { printf("Variable: %s\n", yytext); }

%%

int main(void) {
    yyin = fopen("test9.txt", "r");
    if (!yyin) {
        perror("No se pudo abrir el archivo test9.txt");
        return 1;
    }

    yylex();
    fclose(yyin);
    return 0;
}
