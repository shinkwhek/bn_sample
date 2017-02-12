open OUnit

open Type
open Syntax
open Parser
open Lexer
open Evaluation
open Main

let _ = run_test_tt_main begin "main.ml" >::: [
  "> 1 => 1" >:: begin fun () ->
    assert_equal (Int 1) ( interpretation "1" )
  end;
  "> 1.0 => 1.0" >:: begin fun () ->
   assert_equal (Float 1.0) ( interpretation "1.0" )
  end; 
  "> 1+2 => 3" >:: begin fun () ->
    assert_equal (Int 3) ( interpretation "1+2" )
  end;
  "> 2-1 => 1" >:: begin fun () ->
    assert_equal (Int 1) ( interpretation "2-1" )
  end;
  "> 2*3 => 6" >:: begin fun () ->
    assert_equal (Int 6) ( interpretation "2*3" )
  end;
  "> 6/2 => 3" >:: begin fun () ->
    assert_equal (Int 3) ( interpretation "6/2" )
  end;
  "> 5/2 => 2" >:: begin fun () ->
    assert_equal (Int 2) ( interpretation "5/2" )
  end;
  "> 1.0 +. 3.2 => 4.2" >:: begin fun () ->
    assert_equal (Float 4.2) ( interpretation "1.0 +. 3.2" )
  end;
  "> 3.5 -. 1.1 => 2.4" >:: begin fun () ->
    assert_equal (Float 2.4) ( interpretation "3.5 -. 1.1" )
  end;
  "> 2.3 *. 1.1 => 2.53" >:: begin fun () ->
    assert_equal (Float 2.53) ( interpretation "2.3 *. 1.1" )
  end;
  "> 1.0 /. 2.0 => 0.5" >:: begin fun () ->
    assert_equal (Float 0.5) ( interpretation "1.0 /. 2.0" )
  end;
  "> 2 * (1 + 2) => 6" >:: begin fun () ->
    assert_equal (Int 6) ( interpretation "2 * (1 + 2)" )
  end;
] end
