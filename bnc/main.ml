(* ==== ==== ==== sample language ==== ==== ==== *)
(*
 * author: shinkwhek
 *)

let file f =
  let inchan = open_in f in
  let str = Parser.main Lexer.token (Lexing.from_channel inchan) in
  let result = Evaluation.eval str [] in
  let result_str = Show_result.showResult result in
  print_string result_str

let () =

  let argc = Array.length Sys.argv in
  if argc != 2 then Format.printf "1 input\n"
  else let fname = Sys.argv.(1) in
       file fname
