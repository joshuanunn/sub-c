open Subc

let rec lex_all lexer lexbuf =
  let token = lexer lexbuf in
  match token with Token.EOF -> [] | tok -> tok :: lex_all lexer lexbuf
