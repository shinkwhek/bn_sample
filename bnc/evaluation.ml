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
      let e1 = eval ea in
      let e2 = eval eb in
      Int( expInt(e1) + expInt(e2) )
  | Add_dot(ea,eb) ->
      let e1 = eval ea in
      let e2 = eval eb in
      Float( expFloat(e1) +. expFloat(e2) )
  
  | Minus(ea,eb) ->
      let e1 = eval ea in
      let e2 = eval eb in
      Int( expInt(e1) - expInt(e2) )
  | Minus_dot(ea,eb) ->
      let e1 = eval ea in
      let e2 = eval eb in
      Float( expFloat(e1) -. expFloat(e2) )
  
  | Times(ea,eb) ->
      let e1 = eval ea in
      let e2 = eval eb in
      Int( expInt(e1) * expInt(e2) )
  | Times_dot(ea,eb) ->
      let e1 = eval ea in
      let e2 = eval eb in
      Float( expFloat(e1) *. expFloat(e2) )
  
  | Divided(ea,eb) ->
      let e1 = eval ea in
      let e2 = eval eb in
      Int( expInt(e1) / expInt(e2) )
  | Divided_dot(ea,eb) ->
      let e1 = eval ea in
      let e2 = eval eb in
      Float( expFloat(e1) /. expFloat(e2) )

  | Disj(ea,eb) ->
      let e1 = eval ea in
      let e2 = eval eb in
      Bool( expBool(e1) || expBool(e2) )
  | Conj(ea,eb) ->
      let e1 = eval ea in
      let e2 = eval eb in
      Bool( expBool(e1) && expBool(e2) )

  | Equal(ea,eb) ->
      (
        let e1 = eval ea in
        let e2 = eval eb in
        match (e1,e2) with
        | (Int a, Int b)     -> if a = b then Bool(true) else Bool(false)
        | (Float a, Float b) -> if a = b then Bool(true) else Bool(false)
        | (a,b)              -> if a = b then Bool(true) else Bool(false)
      )
  | If(cnd, tn, el) ->
      let ec = eval cnd in
      if expBool(ec) = true then eval tn else eval el

