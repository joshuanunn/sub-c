{
exception Lexing_error of string

let line_number lexbuf =
  let pos = lexbuf.Lexing.lex_curr_p in
  let new_pos = {
    pos with
    Lexing.pos_lnum = pos.Lexing.pos_lnum + 1;
    Lexing.pos_bol = lexbuf.Lexing.lex_curr_pos;
  } in
  lexbuf.Lexing.lex_curr_p <- new_pos
}

let whitespace = [' ' '\t' '\r']+
let newline = '\n'
let alpha = ['a'-'z' 'A'-'Z' '_']
let alphanum = ['a'-'z' 'A'-'Z' '0'-'9' '_']
let identifier = alpha alphanum*
let digit = ['0'-'9']
let integer = digit+
let invalid_integer = integer alpha*

rule read =
  parse
  | whitespace { read lexbuf }
  | newline { line_number lexbuf; read lexbuf }
  | "int" { Token.KW_INT }
  | "void" { Token.KW_VOID }
  | "return" { Token.KW_RETURN }
  | "if" { Token.KW_IF }
  | "else" { Token.KW_ELSE }
  | "do" { Token.KW_DO }
  | "while" { Token.KW_WHILE }
  | "for" { Token.KW_FOR }
  | "break" { Token.KW_BREAK }
  | "continue" { Token.KW_CONTINUE }
  | "switch" { Token.KW_SWITCH }
  | "case" { Token.KW_CASE }
  | "default" { Token.KW_DEFAULT }
  | "goto" { Token.KW_GOTO }
  | "(" { Token.LPAREN }
  | ")" { Token.RPAREN }
  | "{" { Token.LBRACE }
  | "}" { Token.RBRACE }
  | ";" { Token.SEMICOLON }
  | "?" { Token.QUESTION }
  | ":" { Token.COLON }
  | "++" { Token.INCREMENT }
  | "--" { Token.DECREMENT }
  | "+=" { Token.ADD_ASSIGN }
  | "-=" { Token.SUB_ASSIGN }
  | "*=" { Token.MUL_ASSIGN }
  | "/=" { Token.DIV_ASSIGN }
  | "%=" { Token.MOD_ASSIGN }
  | "<<=" { Token.LSHIFT_ASSIGN }
  | ">>=" { Token.RSHIFT_ASSIGN }
  | "&=" { Token.BW_AND_ASSIGN }
  | "^=" { Token.BW_XOR_ASSIGN }
  | "|=" { Token.BW_OR_ASSIGN }
  | "+" { Token.ADD }
  | "-" { Token.SUB }
  | "*" { Token.MUL }
  | "/" { Token.DIV }
  | "%" { Token.MOD }
  | "&&" { Token.AND }
  | "||" { Token.OR }
  | "<<" { Token.BW_LSHIFT }
  | ">>" { Token.BW_RSHIFT }
  | "~" { Token.BW_NOT }
  | "&" { Token.BW_AND }
  | "|" { Token.BW_OR }
  | "^" { Token.BW_XOR }
  | "==" { Token.EQ }
  | "!=" { Token.NE }
  | "<=" { Token.LE }
  | ">=" { Token.GE }
  | "<" { Token.LT }
  | ">" { Token.GT }
  | "!" { Token.NOT }
  | "=" { Token.ASSIGN }
  | integer { Token.LITERAL_INT (int_of_string (Lexing.lexeme lexbuf)) }
  | invalid_integer { raise (Lexing_error ("Invalid integer: " ^ Lexing.lexeme lexbuf)) }
  | identifier { Token.IDENTIFIER (Lexing.lexeme lexbuf) }
  | eof { Token.EOF }
  | _ { raise (Lexing_error ("Unexpected character: " ^ Lexing.lexeme lexbuf)) }
