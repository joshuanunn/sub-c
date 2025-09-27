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
  | BITNOT
  | EOF
[@@deriving show]
