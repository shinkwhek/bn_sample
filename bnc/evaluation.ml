(* ==== ==== ==== evaluation.ml ==== ==== ==== *)

open Syntax
open Env

exception ExpDTypeError of string
       
let expDInt = function
  | DInt a -> a
  | _ -> raise (ExpDTypeError " not DInt.")

let expDFloat = function
  | DFloat a -> a
  | _ -> raise (ExpDTypeError " not DFloat.")

let expDBool = function
  | DBool a -> a
  | _ -> raise (ExpDTypeError " not DBool.")

let rec eval e env =
  match e with
  | Bool a  -> DBool a
  | Int a   -> DInt a
  | Float a -> DFloat a

  | Add(ea,eb) ->
      let e1 = eval ea env in
      let e2 = eval eb env in
      DInt( expDInt(e1) + expDInt(e2) )
  | Add_dot(ea,eb) ->
      let e1 = eval ea env in
      let e2 = eval eb env in
      DFloat( expDFloat(e1) +. expDFloat(e2) )
  
  | Minus(ea,eb) ->
      let e1 = eval ea env in
      let e2 = eval eb env in
      DInt( expDInt(e1) - expDInt(e2) )
  | Minus_dot(ea,eb) ->
      let e1 = eval ea env in
      let e2 = eval eb env in
      DFloat( expDFloat(e1) -. expDFloat(e2) )
  
  | Times(ea,eb) ->
      let e1 = eval ea env in
      let e2 = eval eb env in
      DInt( expDInt(e1) * expDInt(e2) )
  | Times_dot(ea,eb) ->
      let e1 = eval ea env in
      let e2 = eval eb env in
      DFloat( expDFloat(e1) *. expDFloat(e2) )
  
  | Divided(ea,eb) ->
      let e1 = eval ea env in
      let e2 = eval eb env in
      DInt( expDInt(e1) / expDInt(e2) )
  | Divided_dot(ea,eb) ->
      let e1 = eval ea env in
      let e2 = eval eb env in
      DFloat( expDFloat(e1) /. expDFloat(e2) )

  | Disj(ea,eb) ->
      let e1 = eval ea env in
      let e2 = eval eb env in
      DBool( expDBool(e1) || expDBool(e2) )
  | Conj(ea,eb) ->
      let e1 = eval ea env in
      let e2 = eval eb env in
      DBool( expDBool(e1) && expDBool(e2) )

  | Equal(ea,eb) ->
      (
        let e1 = eval ea env in
        let e2 = eval eb env in
        match (e1,e2) with
        | (DInt a, DInt b)     -> if a = b then DBool(true) else DBool(false)
        | (DFloat a, DFloat b) -> if a = b then DBool(true) else DBool(false)
        | (a,b)                -> if a = b then DBool(true) else DBool(false)
      )
  | If(cnd, tn, el) ->
      let ec = eval cnd env in
      if expDBool(ec) = true then eval tn env else eval el env

  | Var a -> List.assoc a env
 
  | Fun (n,b) ->
      Env.Closure(n, b, env)

  | App (f, e1) ->
      let cls = eval f env in
      (
        match cls with
        | Env.Closure(n,e2,env') ->
            let v = eval e1 env in
            let env'' = (n,v) :: env' in
            eval e2 env''
        | _ -> raise (ExpDTypeError "syntax error.")
      )

