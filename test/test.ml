open OUnit

open Type
open Syntax
open Parser
open Lexer
open Env
open Evaluation
open Main

let _ = run_test_tt_main begin "main.ml" >::: [
  "> 1 => 1" >:: begin fun () ->
    assert_equal (DInt 1) ( interpretation "1" [] )
  end;
  "> 1.0 => 1.0" >:: begin fun () ->
    assert_equal (DFloat 1.0) ( interpretation "1.0" [] )
  end; 
  "> 1+2 => 3" >:: begin fun () ->
    assert_equal (DInt 3) ( interpretation "1+2" [] )
  end;
  "> 2-1 => 1" >:: begin fun () ->
    assert_equal (DInt 1) ( interpretation "2-1" [] )
  end;
  "> 2*3 => 6" >:: begin fun () ->
    assert_equal (DInt 6) ( interpretation "2*3" [] )
  end;
  "> 6/2 => 3" >:: begin fun () ->
    assert_equal (DInt 3) ( interpretation "6/2" [] )
  end;
  "> 5/2 => 2" >:: begin fun () ->
    assert_equal (DInt 2) ( interpretation "5/2" [] )
  end;
  "> 1.0 +. 3.2 => 4.2" >:: begin fun () ->
    assert_equal (DFloat 4.2) ( interpretation "1.0 +. 3.2" [] )
  end;
  "> 3.5 -. 1.1 => 2.4" >:: begin fun () ->
    assert_equal (DFloat 2.4) ( interpretation "3.5 -. 1.1" [] )
  end;
  "> 2.3 *. 1.1 => 2.53" >:: begin fun () ->
    assert_equal (DFloat 2.53) ( interpretation "2.3 *. 1.1" [] )
  end;
  "> 1.0 /. 2.0 => 0.5" >:: begin fun () ->
    assert_equal (DFloat 0.5) ( interpretation "1.0 /. 2.0" [] )
  end;
  "> 2 * (1 + 2) => 6" >:: begin fun () ->
    assert_equal (DInt 6) ( interpretation "2 * (1 + 2)" [] )
  end;
  "> if true then 1 else 2 => 1" >:: begin fun () ->
    assert_equal (DInt 1) ( interpretation "if true then 1 else 2" [] )
  end;
  "> if false then 1 else 2 => 2" >:: begin fun () ->
    assert_equal (DInt 2) ( interpretation "if false then 1 else 2" [] )
  end;
  "> false \\/ false => false" >:: begin fun () ->
    assert_equal (DBool false) ( interpretation "false \\/ false" [] )
  end;
  "> true \\/ false => true" >:: begin fun () ->
    assert_equal (DBool true) ( interpretation "true \\/ false" [] )
  end;
  "> true /\\ false => false" >:: begin fun () ->
    assert_equal (DBool false) ( interpretation "true /\\ false" [] )
  end;
  "> true /\\ true => true" >:: begin fun () ->
    assert_equal (DBool true) ( interpretation "true /\\ true" [] )
  end;
  "> 1 = 1 => true" >:: begin fun () ->
    assert_equal (DBool true) ( interpretation "1 = 1" [] )
  end;
  "> 1 = 0 => false" >:: begin fun () ->
    assert_equal (DBool false) ( interpretation "1 = 0" [] )
  end;
  "> 1.1 = 1.1 => true" >:: begin fun () ->
    assert_equal (DBool true)  ( interpretation "1.1 = 1.1" [] )
  end;
  "> 1.1 = 2.1 => false" >:: begin fun () ->
    assert_equal (DBool false) ( interpretation "1.1 = 2.1" [] )
  end;
] end
