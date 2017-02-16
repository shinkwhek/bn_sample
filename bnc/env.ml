

type env = (string * result) list
and result =
  | DBool of bool
  | DInt of int
  | DFloat of float
  | Closure of string * Syntax.t * env
