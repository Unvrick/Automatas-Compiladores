%option noyywrap

%{
    #include <stdio.h>
    FILE *yyin;
%}
ComentarioSencillo \/\/[a-zA-Z0-9]*
Comentario \/\*.+*\*\/
%%
{ComentarioSencillo} { printf("Comentario Sencillo: %s\n", yytext); }
{Comentario} { printf("Comentario compuesto: %s\n", yytext); }
%%
int main(void) {
    yyin = fopen("test11.txt", "r");
    if (!yyin) {
        perror("No se pudo abrir el archivo test11.txt");
        return 1;
    }

    yylex();
    fclose(yyin);
    return 0;
}
