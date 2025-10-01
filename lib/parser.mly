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

(* Lowest precedence: top-level expression *)
expr:
  | expr_04 { $1 }

(* Additive binary operators [left associative] *)
expr_04:
  | expr_04 PLUS expr_03 { mk_binop_expr Add $1 $3 }
  | expr_04 MINUS expr_03 { mk_binop_expr Subtract $1 $3 }
  | expr_03 { $1 }
  ;

(* Multiplicative binary operators [left associative] *)
expr_03:
  | expr_03 STAR expr_02 { mk_binop_expr Multiply $1 $3 }
  | expr_03 SLASH expr_02 { mk_binop_expr Divide $1 $3 }
  | expr_03 PERCENT expr_02 { mk_binop_expr Remainder $1 $3 }
  | expr_02 { $1 }
  ;

(* Unary operators [right associative] *)
expr_02:
  | DECREMENT expr_02 { failwith "Prefix decrement operator (--expr) is not yet supported" }
  | MINUS expr_02 { mk_unop_expr Negate $2 }
  | BITNOT expr_02 { mk_unop_expr Complement $2 }
  | expr_01 { $1 }
  ;

(* Postfix operators [left associative] *)
expr_01:
  | expr_01 DECREMENT { failwith "Postfix decrement operator (--expr) is not yet supported" }
  | atom { $1 }
  ;

(* Highest precedence: literals, identifiers, parentheses *)
atom:
  | LPAREN expr RPAREN { $2 }
  | LITERAL_INT { mk_int_expr $1 }
  ;
