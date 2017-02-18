type token =
  | LPAREN
  | RPAREN
  | BOOL of (bool)
  | INT of (int)
  | FLOAT of (float)
  | PLUS
  | PLUS_DOT
  | MINUS
  | MINUS_DOT
  | TIMES
  | TIMES_DOT
  | DIVIDED
  | DIVIDED_DOT
  | DISJ
  | CONJ
  | EQUAL
  | IF
  | THEN
  | ELSE
  | NAME of (Type.n)
  | LET
  | REC
  | IN
  | EOF

val exp :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Syntax.t
