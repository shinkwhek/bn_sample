type token =
  | BOOL of (bool)
  | INT of (int)
  | FLOAT of (float)
  | PLUS
  | MINUS
  | TIMES
  | DIVIDED
  | EOF

val exp :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Syntax.t
