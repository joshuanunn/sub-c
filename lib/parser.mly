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
%token BW_LSHIFT
%token BW_RSHIFT
%token BW_NOT
%token BW_AND
%token BW_OR
%token BW_XOR
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
  | expr_15 { $1 }
  ;

(* Comma operator [left associative] *)
expr_15:
  | expr_14 { $1 }
  ;

(* Assignment operators [right associative] *)
expr_14:
  | expr_13 { $1 }
  ;

(* Ternary operators [right associative] *)
expr_13:
  | expr_12 { $1 }
  ;

(* Logical OR operator [left associative] *)
expr_12:
  | expr_11 { $1 }
  ;

(* Logical AND operator [left associative] *)
expr_11:
  | expr_10 { $1 }
  ;

(* Bitwise OR operator [left associative] *)
expr_10:
  | expr_10 BW_OR expr_09 { mk_binop_expr BwOr $1 $3 }
  | expr_09 { $1 }
  ;

(* Bitwise XOR operator [left associative] *)
expr_09:
  | expr_09 BW_XOR expr_08 { mk_binop_expr BwXor $1 $3 }
  | expr_08 { $1 }
  ;

(* Bitwise AND operator [left associative] *)
expr_08:
  | expr_08 BW_AND expr_07 { mk_binop_expr BwAnd $1 $3 }
  | expr_07 { $1 }
  ;

(* Relational equality operators [left associative] *)
expr_07:
  | expr_06 { $1 }
  ;

(* Relational operators [left associative] *)
expr_06:
  | expr_05 { $1 }
  ;

(* Bitwise shift operators [left associative] *)
expr_05:
  | expr_05 BW_LSHIFT expr_04 { mk_binop_expr BwLeftShift $1 $3 }
  | expr_05 BW_RSHIFT expr_04 { mk_binop_expr BwRightShift $1 $3 }
  | expr_04 { $1 }
  ;

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
  | BW_NOT expr_02 { mk_unop_expr BwNot $2 }
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
