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
  | EOF

let string_of_token = function
  | IDENTIFIER value -> "IDENTIFIER(" ^ value ^ ")"
  | LITERAL_INT value -> "LITERAL_INT(" ^ string_of_int value ^ ")"
  | KW_INT -> "KW_INT"
  | KW_VOID -> "KW_VOID"
  | KW_RETURN -> "KW_RETURN"
  | LPAREN -> "LPAREN"
  | RPAREN -> "RPAREN"
  | LBRACE -> "LBRACE"
  | RBRACE -> "RBRACE"
  | SEMICOLON -> "SEMICOLON"
  | EOF -> "EOF"
