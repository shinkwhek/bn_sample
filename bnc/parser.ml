type token =
  | BOOL of (bool)
  | INT of (int)
  | FLOAT of (float)
  | PLUS
  | EOF

open Parsing;;
let _ = parse_error;;
# 2 "parser.mly"
  open Syntax
# 13 "parser.ml"
let yytransl_const = [|
  260 (* PLUS *);
    0 (* EOF *);
    0|]

let yytransl_block = [|
  257 (* BOOL *);
  258 (* INT *);
  259 (* FLOAT *);
    0|]

let yylhs = "\255\255\
\002\000\002\000\002\000\001\000\001\000\000\000"

let yylen = "\002\000\
\001\000\001\000\001\000\001\000\003\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\001\000\002\000\003\000\000\000\004\000\000\000\
\005\000"

let yydgoto = "\002\000\
\006\000\007\000"

let yysindex = "\002\000\
\255\254\000\000\000\000\000\000\000\000\000\255\000\000\255\254\
\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\005\000\000\000\000\000\
\000\000"

let yygindex = "\000\000\
\254\255\000\000"

let yytablesize = 6
let yytable = "\003\000\
\004\000\005\000\001\000\008\000\006\000\009\000"

let yycheck = "\001\001\
\002\001\003\001\001\000\004\001\000\000\008\000"

let yynames_const = "\
  PLUS\000\
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
# 20 "parser.mly"
    ( Bool(_1) )
# 74 "parser.ml"
               : 'simple_exp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 22 "parser.mly"
    ( Int(_1) )
# 81 "parser.ml"
               : 'simple_exp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : float) in
    Obj.repr(
# 24 "parser.mly"
    ( Float(_1) )
# 88 "parser.ml"
               : 'simple_exp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'simple_exp) in
    Obj.repr(
# 28 "parser.mly"
      ( _1 )
# 95 "parser.ml"
               : Syntax.t))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Syntax.t) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Syntax.t) in
    Obj.repr(
# 30 "parser.mly"
      ( Add (_1, _3) )
# 103 "parser.ml"
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
