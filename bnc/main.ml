(* ==== ==== ==== bn language ==== ==== ==== *)
(*
 * author: shinkwhek
 *)

open Syntax

let parse l =  Parser.exp Lexer.token (Lexing.from_string l)

let debug = function
  | Bool a -> if a = true then 1 else 0
  | Int a -> a
  | _ -> 2

let () =
  let lexbuf = Lexing.from_string "1\n" in
  let parsed = Parser.exp Lexer.token lexbuf in
  print_int (debug parsed)
