(* ==== ==== ==== evaluation.ml ==== ==== ==== *)

open Syntax

let expInt = function
  | Int a -> a
  | _ -> 0
       
let rec eval c =
  match c with
  | Bool a         -> Bool a
  | Int a          -> Int a
  | Float a        -> Float a
  | Add(ea,eb)     -> Int( expInt(eval ea) + expInt(eval eb) )
  | Minus(ea,eb)   -> Int( expInt(eval ea) - expInt(eval eb) )
  | Times(ea,eb)   -> Int( expInt(eval ea) * expInt(eval eb) )
  | Divided(ea,eb) -> Int( expInt(eval ea) / expInt(eval eb) )
