open OUnit

open Type
open Mean_func
open Main

let _ = run_test_tt_main begin "main.ml" >::: [
  "> 1" >:: begin fun () ->
    assert_equal 1 (meanExp (Econst 1))
  end;
  "> 1 + 2" >:: begin fun () ->
    assert_equal 3 (meanExp (Eadd (Econst 1, Econst 2)))
  end;
] end
