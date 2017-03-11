
open Env

let showResult = function
  | DInt a ->
      Printf.sprintf "<int> = %d\n" a
  | DFloat a ->
      Printf.sprintf "<float> = %f\n" a
  | DBool a ->
      Printf.sprintf "<bool> = %B\n" a
  | _ ->
      Printf.sprintf "result error.\n"
