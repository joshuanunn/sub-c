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
%token DECREMENT
%token PLUS
%token MINUS
%token STAR
%token SLASH
%token PERCENT
%token BITNOT
%token EOF

%start <prog> prog

%%

prog:
  | func EOF { mk_prog $1 }
  ;

func:
  | KW_INT IDENTIFIER LPAREN KW_VOID RPAREN LBRACE stmt RBRACE {
      mk_func ~return_type:KwInt ~name:$2 ~body:$7 }
  ;

stmt:
  | KW_RETURN expr SEMICOLON { mk_return_stmt $2 }
  ;

expr:
  | expr PLUS term { mk_binop_expr Add $1 $3 }
  | expr MINUS term { mk_binop_expr Subtract $1 $3 }
  | term { $1 }
  ;

term:
  | term STAR factor { mk_binop_expr Multiply $1 $3 }
  | term SLASH factor { mk_binop_expr Divide $1 $3 }
  | term PERCENT factor { mk_binop_expr Remainder $1 $3 }
  | factor { $1 }
  ;

factor:
  | DECREMENT factor { failwith "Decrement operator (--expr) is not yet supported" }
  | MINUS factor { mk_unop_expr Negate $2 }
  | BITNOT factor { mk_unop_expr Complement $2 }
  | LPAREN expr RPAREN { $2 }
  | LITERAL_INT { mk_int_expr $1 }
  ;
