type t =
  | Bool
  | Int
  | Float
  | Var of t option ref

type n = string

let newt () = Var(ref None)
