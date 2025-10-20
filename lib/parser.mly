%{
open Ast
%}

%token <string> IDENTIFIER
%token <int> LITERAL_INT
%token KW_INT
%token KW_VOID
%token KW_RETURN
%token KW_IF
%token KW_ELSE
%token LPAREN
%token RPAREN
%token LBRACE
%token RBRACE
%token SEMICOLON
%token QUESTION
%token COLON
%token INCREMENT
%token DECREMENT
%token ADD_ASSIGN
%token SUB_ASSIGN
%token MUL_ASSIGN
%token DIV_ASSIGN
%token MOD_ASSIGN
%token LSHIFT_ASSIGN
%token RSHIFT_ASSIGN
%token BW_AND_ASSIGN
%token BW_OR_ASSIGN
%token BW_XOR_ASSIGN
%token ADD
%token SUB
%token MUL
%token DIV
%token MOD
%token AND
%token OR
%token BW_LSHIFT
%token BW_RSHIFT
%token BW_NOT
%token BW_AND
%token BW_OR
%token BW_XOR
%token EQ
%token NE
%token LE
%token GE
%token LT
%token GT
%token NOT
%token ASSIGN
%token EOF

(* Resolve dangling else in if statements by prefering to shift else *)
%nonassoc IFX
%nonassoc KW_ELSE

%start <prog> prog

%%

prog:
  | func EOF { mk_prog $1 }
  ;

func:
  | KW_INT identifier LPAREN KW_VOID RPAREN LBRACE block_items RBRACE {
      mk_func ~return_type:KwInt ~name:$2 ~body:$7 }
  ;

block_items:
  | block_items block_item { $1 @ [$2] }
  | { [] }
  ;

block_item:
  | decl { mk_block_decl $1 }
  | stmt { mk_block_stmt $1 }
  ;

decl:
  | KW_INT identifier ASSIGN expr SEMICOLON { mk_decl_init_stmt $2 $4 }
  | KW_INT identifier SEMICOLON { mk_decl_stmt $2 }
  ;

stmt:
  | KW_IF LPAREN expr RPAREN stmt KW_ELSE stmt { mk_if_stmt $3 $5 (Some $7) }
  | KW_IF LPAREN expr RPAREN stmt %prec IFX { mk_if_stmt $3 $5 None }
  | KW_RETURN expr SEMICOLON { mk_return_stmt $2 }
  | expr SEMICOLON { mk_expr_stmt $1 }
  | SEMICOLON { Null }
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
  | identifier ASSIGN expr_14 { mk_assign_expr $1 $3 }
  | identifier ADD_ASSIGN expr_14 { mk_comp_assign_expr Add $1 $3 }
  | identifier SUB_ASSIGN expr_14 { mk_comp_assign_expr Subtract $1 $3 }
  | identifier MUL_ASSIGN expr_14 { mk_comp_assign_expr Multiply $1 $3 }
  | identifier DIV_ASSIGN expr_14 { mk_comp_assign_expr Divide $1 $3 }
  | identifier MOD_ASSIGN expr_14 { mk_comp_assign_expr Remainder $1 $3 }
  | identifier LSHIFT_ASSIGN expr_14 { mk_comp_assign_expr BwLeftShift $1 $3 }
  | identifier RSHIFT_ASSIGN expr_14 { mk_comp_assign_expr BwRightShift $1 $3 }
  | identifier BW_AND_ASSIGN expr_14 { mk_comp_assign_expr BwAnd $1 $3 }
  | identifier BW_XOR_ASSIGN expr_14 { mk_comp_assign_expr BwXor $1 $3 }
  | identifier BW_OR_ASSIGN expr_14 { mk_comp_assign_expr BwOr $1 $3 }
  | expr_13 { $1 }
  ;

(* Ternary operators [right associative] *)
expr_13:
  | expr_12 QUESTION expr COLON expr_13 { mk_cond_expr $1 $3 $5 }
  | expr_12 { $1 }
  ;

(* Logical OR operator [left associative] *)
expr_12:
  | expr_12 OR expr_11 { mk_binop_expr Or $1 $3 }
  | expr_11 { $1 }
  ;

(* Logical AND operator [left associative] *)
expr_11:
  | expr_11 AND expr_10 { mk_binop_expr And $1 $3 }
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
  | expr_07 EQ expr_06 { mk_binop_expr Equal $1 $3 }
  | expr_07 NE expr_06 { mk_binop_expr NotEqual $1 $3 }
  | expr_06 { $1 }
  ;

(* Relational operators [left associative] *)
expr_06:
  | expr_06 LE expr_05 { mk_binop_expr LessOrEqual $1 $3 }
  | expr_06 GE expr_05 { mk_binop_expr GreaterOrEqual $1 $3 }
  | expr_06 LT expr_05 { mk_binop_expr LessThan $1 $3 }
  | expr_06 GT expr_05 { mk_binop_expr GreaterThan $1 $3 }
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
  | expr_04 ADD expr_03 { mk_binop_expr Add $1 $3 }
  | expr_04 SUB expr_03 { mk_binop_expr Subtract $1 $3 }
  | expr_03 { $1 }
  ;

(* Multiplicative binary operators [left associative] *)
expr_03:
  | expr_03 MUL expr_02 { mk_binop_expr Multiply $1 $3 }
  | expr_03 DIV expr_02 { mk_binop_expr Divide $1 $3 }
  | expr_03 MOD expr_02 { mk_binop_expr Remainder $1 $3 }
  | expr_02 { $1 }
  ;

(* Unary operators [right associative] *)
expr_02:
  | INCREMENT expr_02 { mk_unary_update_expr PreIncrement $2 }
  | DECREMENT expr_02 { mk_unary_update_expr PreDecrement $2 }
  | SUB expr_02 { mk_unop_expr Negate $2 }
  | NOT expr_02 { mk_unop_expr Not $2 }
  | BW_NOT expr_02 { mk_unop_expr BwNot $2 }
  | expr_01 { $1 }
  ;

(* Postfix operators [left associative] *)
expr_01:
  | atom INCREMENT { mk_unary_update_expr PostIncrement $1 }
  | atom DECREMENT { mk_unary_update_expr PostDecrement $1 }
  | atom { $1 }
  ;

(* Highest precedence: literals, identifiers, parentheses *)
atom:
  | LPAREN expr RPAREN { $2 }
  | LITERAL_INT { mk_int_expr $1 }
  | identifier { Var $1 }
  ;

identifier:
  | IDENTIFIER { mk_ident $1 }
  ;
