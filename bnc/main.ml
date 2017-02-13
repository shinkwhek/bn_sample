(* ==== ==== ==== sample language ==== ==== ==== *)
(*
 * author: shinkwhek
 *)

open Syntax

let parse l =  Parser.exp Lexer.token (Lexing.from_string l)

let interpretation l = (Evaluation.eval (parse l))

let () =
  print_endline "Howdy."
