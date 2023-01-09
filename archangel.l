%{  
	#include <stdio.h>
	#include"y.tab.h"
	extern int yylval;
%}

%%

[0-9]+ {yylval=atoi(yytext);return NUM;}

"prime" {return PRIM;}
"even" {return EVEN;}
"odd" {return ODD;}
"all" {return ALL;}
"in" {return IN;}
"to" {return TO;}

"true" {return TRUE;}
"false" {return FALSE;}

"<=" {return LEQ;}
">=" {return GEQ;}
">" {return GR;}
"<" {return LS;}
"!=" {return NEQ;}
"==" {return EQ;}
"and" {return AND;}
"or" {return OR;}
"{" {return CBO;}
"}" {return CBC;}


[ \t\n] { /*Ignore Whitespace and New Line*/ }
. { return yytext[0]; }
%%

