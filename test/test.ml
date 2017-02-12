open OUnit

open Type
open Syntax
open Parser
open Lexer
open Evaluation
open Main

let _ = run_test_tt_main begin "main.ml" >::: [
  "> 1 => (Int 1)" >:: begin fun () ->
    assert_equal (Int 1) ( interpretation "1" )
  end;
  "> 1.0 => (Float 1.0)" >:: begin fun () ->
   assert_equal (Float 1.0) ( interpretation "1.0" )
  end; 
  "> 1+2 => (Int 3)" >:: begin fun () ->
    assert_equal (Int 3) ( interpretation "1+2" )
  end;
  "> 2-1 => (Int 1)" >:: begin fun () ->
    assert_equal (Int 1) ( interpretation "2-1" )
  end;
  "> 2*3 => (Int 6)" >:: begin fun () ->
    assert_equal (Int 6) ( interpretation "2*3" )
  end;
  "> 6/2 => (Int 3)" >:: begin fun () ->
    assert_equal (Int 3) ( interpretation "6/2" )
  end;
  "> 5/2 => (Int 2)" >:: begin fun () ->
    assert_equal (Int 2) ( interpretation "5/2" )
  end;
] end
