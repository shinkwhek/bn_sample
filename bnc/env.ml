

type env = (Type.n * result) list
and result =
  | DBool of bool
  | DInt of int
  | DFloat of float
  | Closure of Type.n * Syntax.t * env
