%option noyywrap

%{
    #include <stdio.h>
    FILE *yyin;
%}

PALABRAS    analizar|comparar|diferenciar|distinguir|examinar|investigar|identificar|clasificar|relacionar|contrastar|organizar|categorizar|inferir|descomponer|interpretar|amable|creativo|inteligente|responsable|trabajador|honesto|alegre|generoso|puntual|empático|perseverante|respetuoso|organizado|educado|entusiasta|y|e|ni|o|u|pero|sino|aunque|porque|pues|ya|mientras|sin|embargo|además|por|lo|tanto|a|ante|bajo|con|contra|de|desde|en|entre|hacia|hasta|para|por|según|sin|sobre|tras|yo|tú|él|ella|nosotros|ustedes|ellos|mío|tuyo|suyo|nuestro|vuestro|este|ese|aquel|alguien|algo|ninguno|todos|varios|qué|quién|cuál|que|quien|cuyo|donde

%%

{PALABRAS} { printf("TOKEN: %s\n", yytext); } 

%%

int main(void) {
    yyin = fopen("test8.txt", "r");
    if (!yyin) {
        perror("No se pudo abrir el archivo texto.txt");
        return 1;
    }

    yylex();
    fclose(yyin);
    return 0;
}
