%option noyywrap

%{
	#include <stdio.h>
	FILE *yyin;
	int con = 0;
%}
PalabrasReservadas alignas|alignof|and|and_eq|asm|atomic_cancel|atomic_commit|atomic_noexcept|auto|bitand|bitor|bool|break|case|catch|char|char8_t|char16_t|char32_t|class|compl|concept|const|consteval|constexpr|constinit|const_cast|continue|co_await|co_return|co_yield|decltype|default|delete|do|double|else|enum|explicit|export|extern|false|float|for|friend|goto|if|inline|int|long|mutable|namespace|new|noexcept|not|not_eq|nullptr|operator|or|or_eq|private|protected|public|register|reinterpret_cast|requires|return|short|signed|sizeof|static|static_assert|static_cast|struct|switch|synchronized|template|this|thread_local|throw|true|try|typedef|typeid|typename|union|unsigned|using|virtual|void|volatile|wchar_t|while|xor|xor_eq

ComentarioSencillo \/\/.*

Comentario    \/\*([^*]|\n|\*+[^*/])*\*+\/

Variables (char|int|float|double|void|short|long|signed|unsigned).*

Constantes const[ \t](char|int|float|double|void|short|long|signed|unsigned).+

Numero [-]?[0-9]+[\.]?[0-9]*

OperadoresA [\+\-\*\/]

OperadoresL &&|!|\|\|

SimbolosEs [;|\(|\)|\[|\]|{|\}|\<|\>|\*|\=|\#]
%%
{PalabrasReservadas} { printf("\nPalabra Reservada: %s\n", yytext); }
{ComentarioSencillo} { 
			con++;
			printf("\nComentario Sencillo: %s\n", yytext); }
{Comentario} { 
		con++;
		printf("\nComentario : %s\n", yytext); }
{Variables} { printf("\nVariable: %s\n", yytext); }
{Constantes} { printf("\nConstante: %s\n", yytext); }
{OperadoresA} { printf("\nOperador Aritmetico: %s\n", yytext); }
{OperadoresL} { printf("\nOperador Logico: %s\n", yytext); }
{SimbolosEs} { printf("\nSimbolo Especial: %s\n", yytext); }
{Numero} { printf("\nNumero: %s\n", yytext); }
%%
int main(void){
	yyin = fopen("codigo.txt","r");
	if(!yyin){
		printf("No se pudo abrir el archivo codigo.txt");
		return 1;
	}
	yylex();
	printf("\nTotal de Comentarios: %d\n", con);
	fclose(yyin);
	return 0;
	
}