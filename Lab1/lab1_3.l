%{
	#include <stdlib.h>
	#include <stdio.h>
	#include <string.h>
	int line;
%}

%%
"main"|"{"|"}"|"("|")"|[=<>\n\t ]|int|INT|float|FLOAT|for|while|read|print|"+"|"/"|"-"|";" ;
[a-zA-Z]+[0-9]*[a-zA-Z0-9]* {printf("%d. Identifier: %s\n",++line,yytext);}
[0-9]*"."[0-9]+ {printf("%d. Floating Point Constant: %s\n",++line,yytext);}
[0-9]+ {printf("%d. Integer Constant: %s\n",++line,yytext);}
%%
main(argc, argv)
int argc;
char** argv;
{           
if (argc > 1)
{
    FILE *file;
    file = fopen(argv[1], "r");
    if (!file)
    {
        fprintf(stderr, "Could not open %s\n", argv[1]);
        exit(1);
    }
    yyin = file;
}
int i=0;
yylex();
}