%option noyywrap

%{
	#include <stdio.h>
%}
TOKEN_RFC [A-Z]{4}[0-9]{2}(0[1-9]|1[0-2])(0[1-9]|[1|2][0-9]|3[0|1])[A-Z0-9]{3}
%%
{TOKEN_RFC} {printf("TOKEN_RFC=%s\n", yytext); }
%%

int main() 

{
	yylex();
	return 0;
}
