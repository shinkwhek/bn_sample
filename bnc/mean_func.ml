
open Type

(* ---- ---- function ---- ---- *)
(* Exp -> (Env -> Env) *)
let rec meanExp exp =
  match exp with
  | Econst a       -> a
  | Eadd   (ea,eb) -> (meanExp ea) + (meanExp eb)
  | Eminus (ea,eb) -> (meanExp ea) - (meanExp eb)

