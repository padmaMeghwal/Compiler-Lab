%{
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
int a = 0,i=0;
char temp[20],temp2[20],temp3[20],temp4[40];
%}

%%
[<][/][a-z|A-Z|0-9]*[>]	 if(strcmp(temp3,yytext)==0){ a = 0;} else{ if(a==1) {printf("%s",yytext);}}
[<][a-z|A-Z|0-9]*[>]	 if(strcmp(temp2,yytext)==0){ a = 1;} else{ if(a==1) {printf("%s",yytext); }}
. if(a==1) { printf("%s",yytext); }
   else printf(" ");

%%
int main(int argc, char *argv[])
{
FILE *myfile = fopen("input2.txt", "r");
printf("Enter the tag : \n");
scanf("%s",&temp);
temp2[0] = '<';
for(i=0;i<strlen(temp);i++)
{
temp2[i+1] = temp[i];
}
temp2[strlen(temp)+1] = '>';
temp3[0] = '<';
temp3[1] = '/';
for(i=0;i<strlen(temp);i++)
{
temp3[i+2] = temp[i];
}
temp3[strlen(temp)+2] = '>';
if (!myfile) {
		printf("Not valid file\n");
		return -1;
	}
	// set lex to read from it instead of defaulting to STDIN:
	yyin = myfile;
yylex();
return 0;
}
