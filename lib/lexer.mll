{
open Token

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
  | "int" { KW_INT }
  | "void" { KW_VOID }
  | "return" { KW_RETURN }
  | "if" { KW_IF }
  | "else" { KW_ELSE }
  | "(" { LPAREN }
  | ")" { RPAREN }
  | "{" { LBRACE }
  | "}" { RBRACE }
  | ";" { SEMICOLON }
  | "?" { QUESTION }
  | ":" { COLON }
  | "++" { INCREMENT }
  | "--" { DECREMENT }
  | "+=" { ADD_ASSIGN }
  | "-=" { SUB_ASSIGN }
  | "*=" { MUL_ASSIGN }
  | "/=" { DIV_ASSIGN }
  | "%=" { MOD_ASSIGN }
  | "<<=" { LSHIFT_ASSIGN }
  | ">>=" { RSHIFT_ASSIGN }
  | "&=" { BW_AND_ASSIGN }
  | "^=" { BW_XOR_ASSIGN }
  | "|=" { BW_OR_ASSIGN }
  | "+" { ADD }
  | "-" { SUB }
  | "*" { MUL }
  | "/" { DIV }
  | "%" { MOD }
  | "&&" { AND }
  | "||" { OR }
  | "<<" { BW_LSHIFT }
  | ">>" { BW_RSHIFT }
  | "~" { BW_NOT }
  | "&" { BW_AND }
  | "|" { BW_OR }
  | "^" { BW_XOR }
  | "==" { EQ }
  | "!=" { NE }
  | "<=" { LE }
  | ">=" { GE }
  | "<" { LT }
  | ">" { GT }
  | "!" { NOT }
  | "=" { ASSIGN }
  | integer { LITERAL_INT (int_of_string (Lexing.lexeme lexbuf)) }
  | invalid_integer { raise (Lexing_error ("Invalid integer: " ^ Lexing.lexeme lexbuf)) }
  | identifier { IDENTIFIER (Lexing.lexeme lexbuf) }
  | eof { EOF }
  | _ { raise (Lexing_error ("Unexpected character: " ^ Lexing.lexeme lexbuf)) }
