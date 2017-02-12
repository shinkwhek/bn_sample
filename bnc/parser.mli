type token =
  | BOOL of (bool)
  | INT of (int)
  | PLUS

val exp :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Syntax.t
