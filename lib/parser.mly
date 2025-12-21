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

(* Comma operator [left associative] *)
expr:
  | assignment_expr { $1 }
  | expr COMMA assignment_expr { Ast.mk_comma_expr $1 $3 }
  ;

(* Assignment operators [right associative] *)
assignment_expr:
  | conditional_expr { $1 }
  | unary_expr ASSIGN assignment_expr { Ast.mk_assign_expr $1 $3 }
  | unary_expr MUL_ASSIGN assignment_expr { Ast.mk_comp_assign_expr Ast.Multiply $1 $3 }
  | unary_expr DIV_ASSIGN assignment_expr { Ast.mk_comp_assign_expr Ast.Divide $1 $3 }
  | unary_expr MOD_ASSIGN assignment_expr { Ast.mk_comp_assign_expr Ast.Remainder $1 $3 }
  | unary_expr ADD_ASSIGN assignment_expr { Ast.mk_comp_assign_expr Ast.Add $1 $3 }
  | unary_expr SUB_ASSIGN assignment_expr { Ast.mk_comp_assign_expr Ast.Subtract $1 $3 }
  | unary_expr LSHIFT_ASSIGN assignment_expr { Ast.mk_comp_assign_expr Ast.BwLeftShift $1 $3 }
  | unary_expr RSHIFT_ASSIGN assignment_expr { Ast.mk_comp_assign_expr Ast.BwRightShift $1 $3 }
  | unary_expr BW_AND_ASSIGN assignment_expr { Ast.mk_comp_assign_expr Ast.BwAnd $1 $3 }
  | unary_expr BW_XOR_ASSIGN assignment_expr { Ast.mk_comp_assign_expr Ast.BwXor $1 $3 }
  | unary_expr BW_OR_ASSIGN assignment_expr { Ast.mk_comp_assign_expr Ast.BwOr $1 $3 }
  ;

(* Ternary operators [right associative] *)
conditional_expr:
  | logical_or_expr { $1 }
  | logical_or_expr QUESTION expr COLON conditional_expr { Ast.mk_cond_expr $1 $3 $5 }
  ;

(* Logical OR operator [left associative] *)
logical_or_expr:
  | logical_and_expr { $1 }
  | logical_or_expr OR logical_and_expr { Ast.mk_binop_expr Ast.Or $1 $3 }
  ;

(* Logical AND operator [left associative] *)
logical_and_expr:
  | inclusive_or_expr { $1 }
  | logical_and_expr AND inclusive_or_expr { Ast.mk_binop_expr Ast.And $1 $3 }
  ;

(* Bitwise OR operator [left associative] *)
inclusive_or_expr:
  | exclusive_or_expr { $1 }
  | inclusive_or_expr BW_OR exclusive_or_expr { Ast.mk_binop_expr Ast.BwOr $1 $3 }
  ;

(* Bitwise XOR operator [left associative] *)
exclusive_or_expr:
  | and_expr { $1 }
  | exclusive_or_expr BW_XOR and_expr { Ast.mk_binop_expr Ast.BwXor $1 $3 }
  ;

(* Bitwise AND operator [left associative] *)
and_expr:
  | equality_expr { $1 }
  | and_expr BW_AND equality_expr { Ast.mk_binop_expr Ast.BwAnd $1 $3 }
  ;

(* Relational equality operators [left associative] *)
equality_expr:
  | relational_expr { $1 }
  | equality_expr EQ relational_expr { Ast.mk_binop_expr Ast.Equal $1 $3 }
  | equality_expr NE relational_expr { Ast.mk_binop_expr Ast.NotEqual $1 $3 }
  ;

(* Relational operators [left associative] *)
relational_expr:
  | shift_expr { $1 }
  | relational_expr LT shift_expr { Ast.mk_binop_expr Ast.LessThan $1 $3 }
  | relational_expr GT shift_expr { Ast.mk_binop_expr Ast.GreaterThan $1 $3 }
  | relational_expr LE shift_expr { Ast.mk_binop_expr Ast.LessOrEqual $1 $3 }
  | relational_expr GE shift_expr { Ast.mk_binop_expr Ast.GreaterOrEqual $1 $3 }
  ;

(* Bitwise shift operators [left associative] *)
shift_expr:
  | additive_expr { $1 }
  | shift_expr BW_LSHIFT additive_expr { Ast.mk_binop_expr Ast.BwLeftShift $1 $3 }
  | shift_expr BW_RSHIFT additive_expr { Ast.mk_binop_expr Ast.BwRightShift $1 $3 }
  ;

(* Additive binary operators [left associative] *)
additive_expr:
  | multiplicative_expr { $1 }
  | additive_expr ADD multiplicative_expr { Ast.mk_binop_expr Ast.Add $1 $3 }
  | additive_expr SUB multiplicative_expr { Ast.mk_binop_expr Ast.Subtract $1 $3 }
  ;

(* Multiplicative binary operators [left associative] *)
multiplicative_expr:
  | unary_expr { $1 }
  | multiplicative_expr MUL unary_expr { Ast.mk_binop_expr Ast.Multiply $1 $3 }
  | multiplicative_expr DIV unary_expr { Ast.mk_binop_expr Ast.Divide $1 $3 }
  | multiplicative_expr MOD unary_expr { Ast.mk_binop_expr Ast.Remainder $1 $3 }
  ;

(* Unary operators [right associative] *)
unary_expr:
  | postfix_expr { $1 }
  | INCREMENT unary_expr { Ast.mk_unary_update_expr Ast.PreIncrement $2 }
  | DECREMENT unary_expr { Ast.mk_unary_update_expr Ast.PreDecrement $2 }
  | SUB unary_expr { Ast.mk_unop_expr Ast.Negate $2 }
  | NOT unary_expr { Ast.mk_unop_expr Ast.Not $2 }
  | BW_NOT unary_expr { Ast.mk_unop_expr Ast.BwNot $2 }
  ;

arg_expr_list_opt:
  | /* empty */ { [] }
  | arg_expr_list { $1 }
  ;

arg_expr_list:
  | assignment_expr { [$1] }
  | arg_expr_list COMMA assignment_expr { $1 @ [$3] }
  ;

(* Postfix operators [left associative] *)
postfix_expr:
  | primary_expr { $1 }
  | postfix_expr LPAREN arg_expr_list_opt RPAREN { Ast.mk_func_call $1 $3 }
  | postfix_expr INCREMENT { Ast.mk_unary_update_expr Ast.PostIncrement $1 }
  | postfix_expr DECREMENT { Ast.mk_unary_update_expr Ast.PostDecrement $1 }
  ;

(* Literals, identifiers, parentheses *)
primary_expr:
  | identifier { Ast.Var $1 }
  | constant { $1 }
  | LPAREN expr RPAREN { $2 }
  ;

identifier:
  | IDENTIFIER { Ast.mk_ident $1 }
  ;

constant:
  | LITERAL_INT { Ast.mk_int_expr $1 }
  ;
