type token =
  | BOOL of (bool)
  | INT of (int)
  | PLUS
  | EOF

open Parsing;;
let _ = parse_error;;
# 2 "parser.mly"
  open Syntax
# 12 "parser.ml"
let yytransl_const = [|
  259 (* PLUS *);
    0 (* EOF *);
    0|]

let yytransl_block = [|
  257 (* BOOL *);
  258 (* INT *);
    0|]

let yylhs = "\255\255\
\002\000\002\000\001\000\001\000\000\000"

let yylen = "\002\000\
\001\000\001\000\001\000\003\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\001\000\002\000\000\000\003\000\000\000\004\000"

let yydgoto = "\002\000\
\005\000\006\000"

let yysindex = "\001\000\
\255\254\000\000\000\000\000\000\000\255\000\000\255\254\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\004\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\254\255\000\000"

let yytablesize = 5
let yytable = "\003\000\
\004\000\001\000\007\000\005\000\008\000"

let yycheck = "\001\001\
\002\001\001\000\003\001\000\000\007\000"

let yynames_const = "\
  PLUS\000\
  EOF\000\
  "

let yynames_block = "\
  BOOL\000\
  INT\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : bool) in
    Obj.repr(
# 19 "parser.mly"
    ( Bool(_1) )
# 68 "parser.ml"
               : 'simple_exp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 21 "parser.mly"
    ( Int(_1) )
# 75 "parser.ml"
               : 'simple_exp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'simple_exp) in
    Obj.repr(
# 25 "parser.mly"
      ( _1 )
# 82 "parser.ml"
               : Syntax.t))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Syntax.t) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Syntax.t) in
    Obj.repr(
# 27 "parser.mly"
      ( Add (_1, _3) )
# 90 "parser.ml"
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
