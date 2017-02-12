type token =
  | BOOL of (bool)
  | INT of (int)
  | FLOAT of (float)
  | PLUS
  | EOF

val exp :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Syntax.t
