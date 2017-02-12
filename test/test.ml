open OUnit

open Type
open Syntax
open Parser
open Lexer
open Main

let _ = run_test_tt_main begin "main.ml" >::: [
  "> 1 => (Int 1)" >:: begin fun () ->
    assert_equal (Int 1) (parse "1")
  end;
  "> 1.0 => (Float 1.0)" >:: begin fun () ->
   assert_equal (Float 1.0) (parse "1.0")
  end; 
  "> 1+2 => (Add (Int 1, Int 2))" >:: begin fun () ->
    assert_equal (Add (Int 1, Int 2)) (parse "1+2")
  end;
] end
