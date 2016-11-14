%{
	#include <stdlib.h>
	#include <stdio.h>
	#include <string.h>
	int line;
%}

%%
">"|\n|\t|"</"[a-zA-Z0-9]+> ;
"<"[a-zA-Z0-9]+ {printf("%d. Tag: %s\n",++line,yytext+1);}
[a-zA-Z0-9! ]+ {printf("%d. Content: %s\n",++line,yytext);}
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