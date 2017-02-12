{
  open Type
}

rule lex = parse
| [' ' '\t' '\n'] { lex lexbuf }
| "+"             { LPLUS }
| "-"             { LMINUS }
| ['0'-'9']+ as s { LCONST(int_of_string s) }
| eof             { LEOF }

{

}
