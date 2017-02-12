type t =
  | Bool of bool
  | Int  of int
  | Float of float
  | Add  of t * t
  | Minus of t * t
  | Times of t * t
  | Divided of t * t
                     
