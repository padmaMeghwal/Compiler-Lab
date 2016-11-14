%{
#include<stdio.h>
#include<string.h>
char str[1000][4][1000], abc[1000];
int count = 0, i, flag, line = 0;
char print_str[1000][1000];
%}
%%
"\n" {
	strcpy(print_str[line++], "\n");
}
"\t";
"\"".+"\"" {
	flag =1;
	for(i = 0; i < count; i++) {
		if(strcmp(yytext, str[i][1]) == 0) {
			flag = 0;
			break;
		}
	}
	if(flag) {
		strcpy(abc, "");
		sprintf(abc, "%d", count);
		strcpy(str[count][0], abc);
		strcpy(str[count][1], yytext);
		strcpy(str[count][2], "STRING");
		strcpy(str[count][3], "-1");
		strcpy(abc, "<");
		strcat(abc, str[count][0]);
		strcat(abc, ",");
		strcat(abc, str[count][2]);
		strcat(abc, ",->");
		strcpy(print_str[line++], abc);
		count++;
	}
}
while|for|if|else|switch|break|do|int|float|double|long|char {
	flag =1;
	for(i = 0; i < count; i++) {
		if(strcmp(yytext, str[i][1]) == 0) {
			flag = 0;
			break;
		}
	}
	if(flag) {
		strcpy(abc, "");
		sprintf(abc, "%d", count);
		strcpy(str[count][0], abc);
		strcpy(str[count][1], yytext);
		strcpy(str[count][2], "KEYWORD");
		strcpy(str[count][3], "-1");
		strcpy(abc, "<");
		strcat(abc, str[count][0]);
		strcat(abc, ",");
		strcat(abc, str[count][2]);
		strcat(abc, ",->");
		strcpy(print_str[line++], abc);
		count++;
	}
}
"("|"{" {
	flag =1;
	for(i = 0; i < count; i++) {
		if(strcmp(yytext, str[i][1]) == 0) {
			flag = 0;
			break;
		}
	}
	if(flag) {
		strcpy(abc, "");
		sprintf(abc, "%d", count);
		strcpy(str[count][0], abc);
		strcpy(str[count][1], yytext);
		strcpy(str[count][2], "LBRACE");
		strcpy(str[count][3], "-1");
		strcpy(abc, "<");
		strcat(abc, str[count][0]);
		strcat(abc, ",");
		strcat(abc, str[count][2]);
		strcat(abc, ",->");
		strcpy(print_str[line++], abc);
		count++;
	}
}
")"|"}" {
	flag =1;
	for(i = 0; i < count; i++) {
		if(strcmp(yytext, str[i][1]) == 0) {
			flag = 0;
			break;
		}
	}
	if(flag) {
		strcpy(abc, "");
		sprintf(abc, "%d", count);
		strcpy(str[count][0], abc);
		strcpy(str[count][1], yytext);
		strcpy(str[count][2], "RBRACE");
		strcpy(str[count][3], "-1");
		strcpy(abc, "<");
		strcat(abc, str[count][0]);
		strcat(abc, ",");
		strcat(abc, str[count][2]);
		strcat(abc, ",->");
		strcpy(print_str[line++], abc);
		count++;
	}
}
[0-9]+ {
	flag =1;
	if(strcmp(str[count-1][2], "ID") == 0) {
		strcpy(str[count-1][3], yytext);
		strcpy(abc, "<");
		strcat(abc, str[count-1][0]);
		strcat(abc, ",");
		strcat(abc, str[count-1][2]);
		strcat(abc, ",");
		strcat(abc, str[count-1][3]);
		strcat(abc, ">");
		strcpy(print_str[line-1], abc);
	} else if(strcmp(str[count-2][2], "ID")  == 0) {
		strcpy(str[count-2][3], yytext);
		strcpy(abc, "<");
		strcat(abc, str[count-2][0]);
		strcat(abc, ",");
		strcat(abc, str[count-2][2]);
		strcat(abc, ",");
		strcat(abc, str[count-2][3]);
		strcat(abc, ">");
		strcpy(print_str[line-2], abc);
	}
	for(i = 0; i < count; i++) {
		if(strcmp(yytext, str[i][1]) == 0) {
			flag = 0;
			break;
		}
	}
	if(flag) {
		strcpy(abc, "");
		sprintf(abc, "%d", count);
		strcpy(str[count][0], abc);
		strcpy(str[count][1], yytext);
		strcpy(str[count][2], "NUM");
		strcpy(str[count][3], "-1");
		strcpy(abc, "<");
		strcat(abc, str[count][0]);
		strcat(abc, ",");
		strcat(abc, str[count][2]);
		strcat(abc, ",->");
		strcpy(print_str[line++], abc);
		count++;
	}
}
"=" {
	flag =1;
	for(i = 0; i < count; i++) {
		if(strcmp(yytext, str[i][1]) == 0) {
			flag = 0;
			break;
		}
	}
	if(flag) {
		strcpy(abc, "");
		sprintf(abc, "%d", count);
		strcpy(str[count][0], abc);
		strcpy(str[count][1], yytext);
		strcpy(str[count][2], "EQ");
		strcpy(str[count][3], "-1");
		strcpy(abc, "<");
		strcat(abc, str[count][0]);
		strcat(abc, ",");
		strcat(abc, str[count][2]);
		strcat(abc, ",->");
		strcpy(print_str[line++], abc);
		count++;
	}
}
";" {
	flag =1;
	for(i = 0; i < count; i++) {
		if(strcmp(yytext, str[i][1]) == 0) {
			flag = 0;
			break;
		}
	}
	if(flag) {
		strcpy(abc, "");
		sprintf(abc, "%d", count);
		strcpy(str[count][0], abc);
		strcpy(str[count][1], yytext);
		strcpy(str[count][2], "SEMICOLON");
		strcpy(str[count][3], "-1");
		strcpy(abc, "<");
		strcat(abc, str[count][0]);
		strcat(abc, ",");
		strcat(abc, str[count][2]);
		strcat(abc, ",->");
		strcpy(print_str[line++], abc);
		count++;
	}
}
"," {
	flag =1;
	for(i = 0; i < count; i++) {
		if(strcmp(yytext, str[i][1]) == 0) {
			flag = 0;
			break;
		}
	}
	if(flag) {
		strcpy(abc, "");
		sprintf(abc, "%d", count);
		strcpy(str[count][0], abc);
		strcpy(str[count][1], yytext);
		strcpy(str[count][2], "COMMA");
		strcpy(str[count][3], "-1");
		strcpy(abc, "<");
		strcat(abc, str[count][0]);
		strcat(abc, ",");
		strcat(abc, str[count][2]);
		strcat(abc, ",->");
		strcpy(print_str[line++], abc);
		count++;
	}
}
"+" {
	flag =1;
	for(i = 0; i < count; i++) {
		if(strcmp(yytext, str[i][1]) == 0) {
			flag = 0;
			break;
		}
	}
	if(flag) {
		strcpy(abc, "");
		sprintf(abc, "%d", count);
		strcpy(str[count][0], abc);
		strcpy(str[count][1], yytext);
		strcpy(str[count][2], "PLUS");
		strcpy(str[count][3], "-1");
		strcpy(abc, "<");
		strcat(abc, str[count][0]);
		strcat(abc, ",");
		strcat(abc, str[count][2]);
		strcat(abc, ",->");
		strcpy(print_str[line++], abc);
		count++;
	}
}
"-" {
	flag =1;
	for(i = 0; i < count; i++) {
		if(strcmp(yytext, str[i][1]) == 0) {
			flag = 0;
			break;
		}
	}
	if(flag) {
		strcpy(abc, "");
		sprintf(abc, "%d", count);
		strcpy(str[count][0], abc);
		strcpy(str[count][1], yytext);
		strcpy(str[count][2], "MINUS");
		strcpy(str[count][3], "-1");
		strcpy(abc, "<");
		strcat(abc, str[count][0]);
		strcat(abc, ",");
		strcat(abc, str[count][2]);
		strcat(abc, ",->");
		strcpy(print_str[line++], abc);
		count++;
	}
}
"*" {
	flag =1;
	for(i = 0; i < count; i++) {
		if(strcmp(yytext, str[i][1]) == 0) {
			flag = 0;
			break;
		}
	}
	if(flag) {
		strcpy(abc, "");
		sprintf(abc, "%d", count);
		strcpy(str[count][0], abc);
		strcpy(str[count][1], yytext);
		strcpy(str[count][2], "MULTIPLY");
		strcpy(str[count][3], "-1");
		strcpy(abc, "<");
		strcat(abc, str[count][0]);
		strcat(abc, ",");
		strcat(abc, str[count][2]);
		strcat(abc, ",->");
		strcpy(print_str[line++], abc);
		count++;
	}
}
"/" {
	flag =1;
	for(i = 0; i < count; i++) {
		if(strcmp(yytext, str[i][1]) == 0) {
			flag = 0;
			break;
		}
	}
	if(flag) {
		strcpy(abc, "");
		sprintf(abc, "%d", count);
		strcpy(str[count][0], abc);
		strcpy(str[count][1], yytext);
		strcpy(str[count][2], "DIVIDE");
		strcpy(str[count][3], "-1");
		strcpy(abc, "<");
		strcat(abc, str[count][0]);
		strcat(abc, ",");
		strcat(abc, str[count][2]);
		strcat(abc, ",->");
		strcpy(print_str[line++], abc);
		count++;
	}
}
[a-zA-Z0-9_]+ {
	flag =1;
	for(i = 0; i < count; i++) {
		if(strcmp(yytext, str[i][1]) == 0) {
			flag = 0;
			break;
		}
	}
	if(flag) {
		strcpy(abc, "");
		sprintf(abc, "%d", count);
		strcpy(str[count][0], abc);
		strcpy(str[count][1], yytext);
		strcpy(str[count][2], "ID");
		strcpy(str[count][3], "-1");
		strcpy(abc, "<");
		strcat(abc, str[count][0]);
		strcat(abc, ",");
		strcat(abc, str[count][2]);
		strcat(abc, ",->");
		strcpy(print_str[line++], abc);
		count++;
	}
}
%%
main() {
	yyin=fopen("input.txt","r");
	yylex();
	printf("Output\n\n--------------------------------------------------------------------------------\n\n");
	for(i = 0; i < line; i++)
		printf("%s",print_str[i]);
	printf("\n\nIndex\tText\tToken\tValue\n");
	for(i = 0; i < count; i++) {
		printf("%s\t%s\t%s\t",str[i][0],str[i][1],str[i][2]);
		if(strcmp(str[i][3], "-1")) {
			printf("%s",str[i][3]);
		}
		printf("\n");
	}
	printf("\n--------------------------------------------------------------------------------\n\n");
}
int yywrap()
{
return 1;
}