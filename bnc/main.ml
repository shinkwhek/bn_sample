(* ==== ==== ==== sample language ==== ==== ==== *)
(*
 * author: shinkwhek
 *)


let parse l =  Parser.exp Lexer.token (Lexing.from_string l)

let interpretation l env = Evaluation.eval (parse l) env

let file f =
  interpretation f []


let () =
  print_string "Howdy"
