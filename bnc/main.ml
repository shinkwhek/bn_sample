(* ==== ==== ==== sample language ==== ==== ==== *)
(*
 * author: shinkwhek
 *)


let parse l =  Parser.exp Lexer.token (Lexing.from_string l)

let interpretation l env = Evaluation.eval (parse l) env

let () =
  print_endline "Howdy."
