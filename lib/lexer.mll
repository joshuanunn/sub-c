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
  | "static" { Parser.KW_STATIC }
  | "extern" { Parser.KW_EXTERN }
  | "int" { Parser.KW_INT }
  | "void" { Parser.KW_VOID }
  | "return" { Parser.KW_RETURN }
  | "if" { Parser.KW_IF }
  | "else" { Parser.KW_ELSE }
  | "do" { Parser.KW_DO }
  | "while" { Parser.KW_WHILE }
  | "for" { Parser.KW_FOR }
  | "break" { Parser.KW_BREAK }
  | "continue" { Parser.KW_CONTINUE }
  | "switch" { Parser.KW_SWITCH }
  | "case" { Parser.KW_CASE }
  | "default" { Parser.KW_DEFAULT }
  | "goto" { Parser.KW_GOTO }
  | "(" { Parser.LPAREN }
  | ")" { Parser.RPAREN }
  | "{" { Parser.LBRACE }
  | "}" { Parser.RBRACE }
  | ";" { Parser.SEMICOLON }
  | "?" { Parser.QUESTION }
  | ":" { Parser.COLON }
  | "," { Parser.COMMA }
  | "++" { Parser.INCREMENT }
  | "--" { Parser.DECREMENT }
  | "+=" { Parser.ADD_ASSIGN }
  | "-=" { Parser.SUB_ASSIGN }
  | "*=" { Parser.MUL_ASSIGN }
  | "/=" { Parser.DIV_ASSIGN }
  | "%=" { Parser.MOD_ASSIGN }
  | "<<=" { Parser.LSHIFT_ASSIGN }
  | ">>=" { Parser.RSHIFT_ASSIGN }
  | "&=" { Parser.BW_AND_ASSIGN }
  | "|=" { Parser.BW_OR_ASSIGN }
  | "^=" { Parser.BW_XOR_ASSIGN }
  | "+" { Parser.ADD }
  | "-" { Parser.SUB }
  | "*" { Parser.MUL }
  | "/" { Parser.DIV }
  | "%" { Parser.MOD }
  | "&&" { Parser.AND }
  | "||" { Parser.OR }
  | "<<" { Parser.BW_LSHIFT }
  | ">>" { Parser.BW_RSHIFT }
  | "~" { Parser.BW_NOT }
  | "&" { Parser.BW_AND }
  | "|" { Parser.BW_OR }
  | "^" { Parser.BW_XOR }
  | "==" { Parser.EQ }
  | "!=" { Parser.NE }
  | "<=" { Parser.LE }
  | ">=" { Parser.GE }
  | "<" { Parser.LT }
  | ">" { Parser.GT }
  | "!" { Parser.NOT }
  | "=" { Parser.ASSIGN }
  | integer { Parser.LITERAL_INT (int_of_string (Lexing.lexeme lexbuf)) }
  | invalid_integer { raise (Lexing_error ("Invalid integer: " ^ Lexing.lexeme lexbuf)) }
  | identifier { Parser.IDENTIFIER (Lexing.lexeme lexbuf) }
  | eof { Parser.EOF }
  | _ { raise (Lexing_error ("Unexpected character: " ^ Lexing.lexeme lexbuf)) }
