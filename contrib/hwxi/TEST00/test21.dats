(* ****** ****** *)
//
// HX-2019-05-09:
// For ATS-Temptory
//
(* ****** ****** *)

implement main0() = ()

(* ****** ****** *)
//
#include
"share/HATS\
/temptory_staload_bucs320.hats"
//
(* ****** ****** *)

(*
extern
fun
{a:tflt}
list0_list0_equal
(list0(list0(a)), list0(list0(a))): bool
*)

val xs1 =
append<int>(sing(1),sing(2))
val xs2 =
append<int>(sing(2),sing(1))
val xss1 =
sing(xs1): list0(list0(int))
val xss2 =
sing(xs2): list0(list0(int))

val ((*void*)) = println!(xss1 = xss2)
val ((*void*)) = println!(compare(xss1, xss2))

(* ****** ****** *)

(* end of [test21.dats] *)
