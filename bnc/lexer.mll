{
  open Parser
  open Type
}

let space = [' ' '\t' '\n' '\r']
let digit = ['0'-'9']

rule token = parse
| space+
    { token lexbuf }
| "true"
    { BOOL(true) }
| "false"
    { BOOL(false) }
| digit+
    { INT(int_of_string (Lexing.lexeme lexbuf)) }
| '+'
    { PLUS }
| eof
    { EOF }
