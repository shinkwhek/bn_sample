type token =
  | BOOL of (bool)
  | INT of (int)
  | PLUS
  | EOF

val exp :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Syntax.t
