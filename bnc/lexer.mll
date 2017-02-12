{
  open Parser
  open Type
}

let space = [' ' '\t' '\n' '\r']
let digit = ['0'-'9']
let lower = ['a'-'z']
let upper = ['A'-'Z']

rule token = parse
| space+
    { token lexbuf }
| '('
    { LPAREN }
| ')'
    { RPAREN }
| "true"
    { BOOL(true) }
| "false"
    { BOOL(false) }
| digit+
    { INT(int_of_string (Lexing.lexeme lexbuf)) }
| digit+ ('.' digit*)? (digit+)?
    { FLOAT(float_of_string (Lexing.lexeme lexbuf)) }
| '+'
    { PLUS }
| "+."
    { PLUS_DOT }
| '-'
    { MINUS }
| "-."
    { MINUS_DOT }
| '*'
    { TIMES }
| "*."
    { TIMES_DOT }
| '/'
    { DIVIDED }
| "/."
    { DIVIDED_DOT }
| eof
    { EOF }
