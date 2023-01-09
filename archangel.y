%{
#include<stdio.h>
#include<stdlib.h>
int yylex();
void yyerror(const char *s);
int global;
%}

%token PRIM EVEN ODD ALL NUM IN TO LEQ GEQ GR LS NEQ EQ AND OR CBO CBC TRUE FALSE
%left LEQ GEQ GR LS NEQ EQ

%%

STF : PRIM ST {
	int i,j;
	for (i = $2; i <= global; i++) {
        int is_prime = 1;
        for (j = 2; j < i; j++) {
            if (i % j == 0) {
                is_prime = 0;
                break;
            }
        }
        if (is_prime) {
        printf("%d ",i);
        }
    }exit(0);}; 

|EVEN ST {
                for(int i=$2;i<=global;i++){
                  if(i%2 == 0){
                      printf("%d ",i);
                  }
              } exit(0); };
| ODD ST { for(int i=$2;i<=global;i++){
             if(i%2 == 1){
                 printf("%d ",i);
             }
         } exit(0); };
| ALL ST { for(int i=$2;i<=global;i++){
                printf("%d ",i);
         } exit(0); };
| CBO EXP CBC  { if ($2 == 1){printf("True");}else{printf("False");}exit(0); };


ST : IN S { $$ = $2; };
S : NUM TO NUM { $$ = $1; global = $3;};

STTM : | EXP AND EXP { $$ = $1 && $3; };
  | EXP OR EXP { $$ = $1 || $3; };


EXP : TRUE { $$ = 1; };
  | FALSE { $$ = 0; };
  | STTM { $$ = $1; };
  | NUM LEQ NUM { $$ = $1 <= $3; };
  | NUM GEQ NUM { $$ = $1 >= $3; };
  | NUM GR NUM { $$ = $1 > $3; };
  | NUM LS NUM { $$ = $1 < $3; };
  | NUM NEQ NUM { $$ = $1 != $3; };
  | NUM EQ NUM { $$ = $1 == $3; };
;

%%

#include"lex.yy.c"
int main() {
	yyparse();
	return yylex();
}

void yyerror(const char *s){ printf("\nError!\nInvalid Syntax\n"); }
int yywrap(){ return 1; }