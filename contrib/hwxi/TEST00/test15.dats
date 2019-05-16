(* ****** ****** *)
//
// HX-2019-05-13:
// For ATS-Temptory
//
(* ****** ****** *)
//
#include
"share/HATS\
/temptory_staload_cs320.hats"
//
(* ****** ****** *)

implement main0() = ()

(* ****** ****** *)

val xs = sint_listize(10)
val A0 = arrszref_make<int>(xs)
val () = print!("A0 = ")
val () = glseq_print<arrszref(int)><int>(A0)
val () = println!((*void*))

(* ****** ****** *)

(* end of [test15.dats] *)
