(* ==== ==== ==== sample language ==== ==== ==== *)
(*
 * author: shinkwhek
 *)
(*
let file f =
  let inchan = open_in f in
  let str = Parser.exp Lexer.token (Lexing.from_channel inchan) in
  let result = Evaluation.eval str [] in
  let result_str = Show_result.showResult result in
  print_string result_str
 *)

let interpretation f l =
  Evaluation.eval (Parser.main Lexer.token (Lexing.from_string f)) l

let () =
  (*
  let argc = Array.length Sys.argv in
  if argc != 2 then Format.printf "1 input\n" else
  let fname = Sys.argv.(1) in
*)
(*file fname*)
  print_string (Show_result.showResult (Evaluation.eval (Parser.main Lexer.token (Lexing.from_string "1\n")) []))
