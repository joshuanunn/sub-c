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
  | PLUS
  | MINUS
  | STAR
  | SLASH
  | PERCENT
  | BW_LSHIFT
  | BW_RSHIFT
  | BW_NOT
  | BW_AND
  | BW_OR
  | BW_XOR
  | EOF
[@@deriving show]
