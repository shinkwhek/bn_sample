type t =
  | Bool of bool
  | Int  of int
  | Float of float
  | Add  of t * t
  | Add_dot of t * t
  | Minus of t * t
  | Minus_dot of t * t
  | Times of t * t
  | Times_dot of t * t
  | Divided of t * t
  | Divided_dot of t * t
  | Disj of t * t
  | Conj of t * t
  | Equal of t * t
  | If of t * t * t
