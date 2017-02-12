type token =
  | BOOL of (bool)
  | INT of (int)
  | FLOAT of (float)
  | PLUS
  | MINUS
  | TIMES
  | DIVIDED
  | EOF

open Parsing;;
let _ = parse_error;;
# 2 "parser.mly"
  open Syntax
# 16 "parser.ml"
let yytransl_const = [|
  260 (* PLUS *);
  261 (* MINUS *);
  262 (* TIMES *);
  263 (* DIVIDED *);
    0 (* EOF *);
    0|]

let yytransl_block = [|
  257 (* BOOL *);
  258 (* INT *);
  259 (* FLOAT *);
    0|]

let yylhs = "\255\255\
\002\000\002\000\002\000\001\000\001\000\001\000\001\000\001\000\
\000\000"

let yylen = "\002\000\
\001\000\001\000\001\000\001\000\003\000\003\000\003\000\003\000\
\002\000"

let yydefred = "\000\000\
\000\000\000\000\001\000\002\000\003\000\000\000\004\000\000\000\
\000\000\000\000\000\000\005\000\006\000\007\000\008\000"

let yydgoto = "\002\000\
\006\000\007\000"

let yysindex = "\010\000\
\007\255\000\000\000\000\000\000\000\000\252\254\000\000\007\255\
\007\255\007\255\007\255\000\000\000\000\000\000\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\012\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\252\255\000\000"

let yytablesize = 12
let yytable = "\008\000\
\009\000\010\000\011\000\012\000\013\000\014\000\015\000\003\000\
\004\000\005\000\001\000\009\000"

let yycheck = "\004\001\
\005\001\006\001\007\001\008\000\009\000\010\000\011\000\001\001\
\002\001\003\001\001\000\000\000"

let yynames_const = "\
  PLUS\000\
  MINUS\000\
  TIMES\000\
  DIVIDED\000\
  EOF\000\
  "

let yynames_block = "\
  BOOL\000\
  INT\000\
  FLOAT\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : bool) in
    Obj.repr(
# 23 "parser.mly"
    ( Bool(_1) )
# 87 "parser.ml"
               : 'simple_exp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 25 "parser.mly"
    ( Int(_1) )
# 94 "parser.ml"
               : 'simple_exp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : float) in
    Obj.repr(
# 27 "parser.mly"
    ( Float(_1) )
# 101 "parser.ml"
               : 'simple_exp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'simple_exp) in
    Obj.repr(
# 31 "parser.mly"
      ( _1 )
# 108 "parser.ml"
               : Syntax.t))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Syntax.t) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Syntax.t) in
    Obj.repr(
# 33 "parser.mly"
      ( Add (_1, _3) )
# 116 "parser.ml"
               : Syntax.t))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Syntax.t) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Syntax.t) in
    Obj.repr(
# 35 "parser.mly"
      ( Minus (_1, _3) )
# 124 "parser.ml"
               : Syntax.t))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Syntax.t) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Syntax.t) in
    Obj.repr(
# 37 "parser.mly"
      ( Times (_1, _3) )
# 132 "parser.ml"
               : Syntax.t))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Syntax.t) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Syntax.t) in
    Obj.repr(
# 39 "parser.mly"
      ( Divided (_1, _3) )
# 140 "parser.ml"
               : Syntax.t))
(* Entry exp *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let exp (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : Syntax.t)
