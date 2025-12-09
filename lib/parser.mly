%{

%}

%token <string> IDENTIFIER
%token <int> LITERAL_INT
%token KW_STATIC
%token KW_EXTERN
%token KW_INT
%token KW_VOID
%token KW_RETURN
%token KW_IF
%token KW_ELSE
%token KW_DO
%token KW_WHILE
%token KW_FOR
%token KW_BREAK
%token KW_CONTINUE
%token KW_SWITCH
%token KW_CASE
%token KW_DEFAULT
%token KW_GOTO
%token LPAREN
%token RPAREN
%token LBRACE
%token RBRACE
%token SEMICOLON
%token QUESTION
%token COLON
%token COMMA
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

%start <Ast.prog> prog

%%

prog:
  | decl_list EOF { Ast.mk_prog $1 }
  ;

decl_list:
  | decl_list decl { $1 @ [$2] }
  | { [] }
  ;

specifier_list:
  | specifier_list specifier { $1 @ [$2] }
  | specifier { [$1] }
  ;

specifier:
  | KW_INT { Ast.SpecType Ast.Int }
  | KW_STATIC { Ast.SpecStorage Ast.Static }
  | KW_EXTERN { Ast.SpecStorage Ast.Extern }
  ;

param_list_opt:
  | /* empty */ { [] }
  | KW_VOID { [] }
  | param_list { $1 }
  ;

param_list:
  | param_decl { [$1] }
  | param_list COMMA param_decl { $1 @ [$3] }
  ;

param_decl:
  | KW_INT identifier { $2 }
  ;

arg_list_opt:
  | /* empty */ { [] }
  | arg_list { $1 }
  ;

arg_list:
  | expr { [$1] }
  | arg_list COMMA expr { $1 @ [$3] }
  ;

block:
  | LBRACE block_items RBRACE { $2 }
  ;

block_items:
  | block_items block_item { $1 @ [$2] }
  | { [] }
  ;

block_item:
  | decl { Ast.mk_decl_block_item $1 }
  | stmt { Ast.mk_stmt_block_item $1 }
  ;

decl:
  | var_decl { Ast.VarDecl $1 }
  | fun_decl { $1 }
  ;

var_decl:
  | specifier_list identifier ASSIGN expr SEMICOLON { Ast.mk_decl_init_stmt $1 $2 $4 }
  | specifier_list identifier SEMICOLON { Ast.mk_decl_stmt $1 $2 }
  ;

fun_decl:
  | specifier_list identifier LPAREN param_list_opt RPAREN block { Ast.mk_func_defn $1 $2 $4 $6 }
  | specifier_list identifier LPAREN param_list_opt RPAREN SEMICOLON { Ast.mk_func_decl $1 $2 $4 }
  ;

for_init:
  | var_decl { Ast.InclDecl $1 }
  | expr SEMICOLON { Ast.mk_init_exp $1 }
  | SEMICOLON { Ast.mk_empty_init_exp }
  ;

stmt:
  | KW_RETURN expr SEMICOLON { Ast.mk_return_stmt $2 }
  | expr SEMICOLON { Ast.mk_expr_stmt $1 }
  | KW_IF LPAREN expr RPAREN stmt KW_ELSE stmt { Ast.mk_if_stmt $3 $5 (Some $7) }
  | KW_IF LPAREN expr RPAREN stmt %prec IFX { Ast.mk_if_stmt $3 $5 None }
  | block { Ast.mk_block_stmt $1 }
  | KW_BREAK SEMICOLON { Ast.Break None }
  | KW_CONTINUE SEMICOLON { Ast.Continue None }
  | KW_WHILE LPAREN expr RPAREN stmt { Ast.mk_while_stmt $3 $5 }
  | KW_DO stmt KW_WHILE LPAREN expr RPAREN SEMICOLON { Ast.mk_dowhile_stmt $2 $5 }
  | KW_FOR LPAREN for_init expr SEMICOLON expr RPAREN stmt { Ast.mk_for_stmt $3 (Some $4) (Some $6) $8 }
  | KW_FOR LPAREN for_init expr SEMICOLON RPAREN stmt { Ast.mk_for_stmt $3 (Some $4) None $7 }
  | KW_FOR LPAREN for_init SEMICOLON expr RPAREN stmt { Ast.mk_for_stmt $3 None (Some $5) $7 }
  | KW_FOR LPAREN for_init SEMICOLON RPAREN stmt { Ast.mk_for_stmt $3 None None $6 }
  | KW_SWITCH LPAREN expr RPAREN stmt { Ast.mk_switch_stmt $3 $5 }
  | KW_CASE expr COLON stmt { Ast.mk_case_stmt $2 $4 }
  | KW_DEFAULT COLON stmt { Ast.mk_default_stmt $3 }
  | KW_GOTO identifier SEMICOLON { Ast.mk_goto_stmt $2 }
  | identifier COLON stmt { Ast.mk_label_stmt $1 $3 }
  | SEMICOLON { Ast.Null }
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
  | identifier ASSIGN expr_14 { Ast.mk_assign_expr $1 $3 }
  | identifier ADD_ASSIGN expr_14 { Ast.mk_comp_assign_expr Ast.Add $1 $3 }
  | identifier SUB_ASSIGN expr_14 { Ast.mk_comp_assign_expr Ast.Subtract $1 $3 }
  | identifier MUL_ASSIGN expr_14 { Ast.mk_comp_assign_expr Ast.Multiply $1 $3 }
  | identifier DIV_ASSIGN expr_14 { Ast.mk_comp_assign_expr Ast.Divide $1 $3 }
  | identifier MOD_ASSIGN expr_14 { Ast.mk_comp_assign_expr Ast.Remainder $1 $3 }
  | identifier LSHIFT_ASSIGN expr_14 { Ast.mk_comp_assign_expr Ast.BwLeftShift $1 $3 }
  | identifier RSHIFT_ASSIGN expr_14 { Ast.mk_comp_assign_expr Ast.BwRightShift $1 $3 }
  | identifier BW_AND_ASSIGN expr_14 { Ast.mk_comp_assign_expr Ast.BwAnd $1 $3 }
  | identifier BW_XOR_ASSIGN expr_14 { Ast.mk_comp_assign_expr Ast.BwXor $1 $3 }
  | identifier BW_OR_ASSIGN expr_14 { Ast.mk_comp_assign_expr Ast.BwOr $1 $3 }
  | expr_13 { $1 }
  ;

(* Ternary operators [right associative] *)
expr_13:
  | expr_12 QUESTION expr COLON expr_13 { Ast.mk_cond_expr $1 $3 $5 }
  | expr_12 { $1 }
  ;

(* Logical OR operator [left associative] *)
expr_12:
  | expr_12 OR expr_11 { Ast.mk_binop_expr Ast.Or $1 $3 }
  | expr_11 { $1 }
  ;

(* Logical AND operator [left associative] *)
expr_11:
  | expr_11 AND expr_10 { Ast.mk_binop_expr Ast.And $1 $3 }
  | expr_10 { $1 }
  ;

(* Bitwise OR operator [left associative] *)
expr_10:
  | expr_10 BW_OR expr_09 { Ast.mk_binop_expr Ast.BwOr $1 $3 }
  | expr_09 { $1 }
  ;

(* Bitwise XOR operator [left associative] *)
expr_09:
  | expr_09 BW_XOR expr_08 { Ast.mk_binop_expr Ast.BwXor $1 $3 }
  | expr_08 { $1 }
  ;

(* Bitwise AND operator [left associative] *)
expr_08:
  | expr_08 BW_AND expr_07 { Ast.mk_binop_expr Ast.BwAnd $1 $3 }
  | expr_07 { $1 }
  ;

(* Relational equality operators [left associative] *)
expr_07:
  | expr_07 EQ expr_06 { Ast.mk_binop_expr Ast.Equal $1 $3 }
  | expr_07 NE expr_06 { Ast.mk_binop_expr Ast.NotEqual $1 $3 }
  | expr_06 { $1 }
  ;

(* Relational operators [left associative] *)
expr_06:
  | expr_06 LE expr_05 { Ast.mk_binop_expr Ast.LessOrEqual $1 $3 }
  | expr_06 GE expr_05 { Ast.mk_binop_expr Ast.GreaterOrEqual $1 $3 }
  | expr_06 LT expr_05 { Ast.mk_binop_expr Ast.LessThan $1 $3 }
  | expr_06 GT expr_05 { Ast.mk_binop_expr Ast.GreaterThan $1 $3 }
  | expr_05 { $1 }
  ;

(* Bitwise shift operators [left associative] *)
expr_05:
  | expr_05 BW_LSHIFT expr_04 { Ast.mk_binop_expr Ast.BwLeftShift $1 $3 }
  | expr_05 BW_RSHIFT expr_04 { Ast.mk_binop_expr Ast.BwRightShift $1 $3 }
  | expr_04 { $1 }
  ;

(* Additive binary operators [left associative] *)
expr_04:
  | expr_04 ADD expr_03 { Ast.mk_binop_expr Ast.Add $1 $3 }
  | expr_04 SUB expr_03 { Ast.mk_binop_expr Ast.Subtract $1 $3 }
  | expr_03 { $1 }
  ;

(* Multiplicative binary operators [left associative] *)
expr_03:
  | expr_03 MUL expr_02 { Ast.mk_binop_expr Ast.Multiply $1 $3 }
  | expr_03 DIV expr_02 { Ast.mk_binop_expr Ast.Divide $1 $3 }
  | expr_03 MOD expr_02 { Ast.mk_binop_expr Ast.Remainder $1 $3 }
  | expr_02 { $1 }
  ;

(* Unary operators [right associative] *)
expr_02:
  | INCREMENT expr_02 { Ast.mk_unary_update_expr Ast.PreIncrement $2 }
  | DECREMENT expr_02 { Ast.mk_unary_update_expr Ast.PreDecrement $2 }
  | SUB expr_02 { Ast.mk_unop_expr Ast.Negate $2 }
  | NOT expr_02 { Ast.mk_unop_expr Ast.Not $2 }
  | BW_NOT expr_02 { Ast.mk_unop_expr Ast.BwNot $2 }
  | expr_01 { $1 }
  ;

(* Postfix operators [left associative] *)
expr_01:
  | factor INCREMENT { Ast.mk_unary_update_expr Ast.PostIncrement $1 }
  | factor DECREMENT { Ast.mk_unary_update_expr Ast.PostDecrement $1 }
  | factor { $1 }
  ;

(* Highest precedence: literals, identifiers, parentheses *)
factor:
  | LPAREN expr RPAREN { $2 }
  | LITERAL_INT { Ast.mk_int_expr $1 }
  | identifier { Ast.Var $1 }
  | identifier LPAREN arg_list_opt RPAREN { Ast.mk_func_call $1 $3 }
  ;

identifier:
  | IDENTIFIER { Ast.mk_ident $1 }
  ;
