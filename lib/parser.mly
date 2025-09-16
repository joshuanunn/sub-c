%{
open Ast
%}

%token <string> IDENTIFIER
%token <int> LITERAL_INT
%token KW_INT
%token KW_VOID
%token KW_RETURN
%token LPAREN
%token RPAREN
%token LBRACE
%token RBRACE
%token SEMICOLON
%token EOF

%start <Ast.prog> prog

%%

prog:
  | func EOF { Ast.mk_prog $1 }
  ;

func:
  | KW_INT IDENTIFIER LPAREN KW_VOID RPAREN LBRACE stmt RBRACE {
      Ast.mk_func ~return_type:KwInt ~name:$2 ~body:$7 }
  ;

stmt:
  | KW_RETURN expr SEMICOLON { Ast.mk_return_stmt $2 }
  ;

expr:
  | LITERAL_INT { Ast.mk_int_expr $1 }
  ;
