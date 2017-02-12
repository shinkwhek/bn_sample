type token =
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
  | EOF

val exp :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Syntax.t
