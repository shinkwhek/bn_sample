(* ---- ---- types ---- ---- *)
type var = string
type const = int

type expr =
  | Econst of int 
  | Eadd   of expr * expr
  | Eminus of expr * expr

type sentence =
  | Sif    of expr * expr * sentence * sentence
  | Sfor   of expr * sentence
  | Snoop
  | Sapply of sentence * sentence

