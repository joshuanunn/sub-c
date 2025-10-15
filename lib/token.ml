type token =
  | IDENTIFIER of string
  | LITERAL_INT of int
  | KW_INT
  | KW_VOID
  | KW_RETURN
  | LPAREN
  | RPAREN
  | LBRACE
  | RBRACE
  | SEMICOLON
  | DECREMENT
  | ADD
  | SUB
  | MUL
  | DIV
  | MOD
  | AND
  | OR
  | BW_LSHIFT
  | BW_RSHIFT
  | BW_NOT
  | BW_AND
  | BW_OR
  | BW_XOR
  | EQ
  | NE
  | LE
  | GE
  | LT
  | GT
  | NOT
  | ASSIGN
  | EOF
[@@deriving show]
