%{
	#include <stdlib.h>
	#include <stdio.h>
	#include <string.h>
	int line;
	char str[101];
%}

%%
"//".* {printf("%d. %s\n",++line,yytext+2);}
"/*"[^/]* {
printf("%d. ",++line);
strcpy(str,yytext+2);
int i=0;
while(i<strlen(str)-1){
if(str[i]!='\n')
printf("%c",str[i]);
i++;    
}
printf("\n");}
.|\n|\t;
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