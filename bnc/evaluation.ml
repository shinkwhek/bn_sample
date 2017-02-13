(* ==== ==== ==== evaluation.ml ==== ==== ==== *)

open Syntax

let expInt = function
  | Int a -> a
  | _ -> 0

let expFloat = function
  | Float a -> a
  | _ -> 0.0

let expBool = function
  | Bool a -> a
  | _ -> false

let rec eval c =
  match c with
  | Bool a ->
      Bool a
  
  | Int a ->
      Int a
  | Float a ->
      Float a

  | Add(ea,eb) ->
      Int( expInt(eval ea) + expInt(eval eb) )
  | Add_dot(ea,eb) ->
      Float( expFloat(eval ea) +. expFloat(eval eb) )
  
  | Minus(ea,eb) ->
      Int( expInt(eval ea) - expInt(eval eb) )
  | Minus_dot(ea,eb) ->
      Float( expFloat(eval ea) -. expFloat(eval eb) )
  
  | Times(ea,eb) ->
      Int( expInt(eval ea) * expInt(eval eb) )
  | Times_dot(ea,eb) ->
      Float( expFloat(eval ea) *. expFloat(eval eb) )
  
  | Divided(ea,eb) ->
      Int( expInt(eval ea) / expInt(eval eb) )
  | Divided_dot(ea,eb) ->
      Float( expFloat(eval ea) /. expFloat(eval eb) )

  | Disj(ea,eb) ->
      Bool( expBool(eval ea) || expBool(eval eb) )
  | Conj(ea,eb) ->
      Bool( expBool(eval ea) && expBool(eval eb) )

  | Equal(ea,eb) ->
      (
        let eae = eval(ea) in
        let ebe = eval(eb) in
        match (eae,ebe) with
        | (Int a, Int b)     -> if a = b then Bool(true) else Bool(false)
        | (Float a, Float b) -> if a = b then Bool(true) else Bool(false)
        | (a,b)              -> if a = b then Bool(true) else Bool(false)
      )
  | If(cnd, tn, el) ->
      if expBool(eval cnd) = true then eval(tn) else eval(el)
