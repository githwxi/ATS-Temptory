(* ****** ****** *)
//
// HX-2019-05-09:
// For ATS-Temptory
//
(* ****** ****** *)
//
#include
"share/HATS\
/temptory_staload_cs320.hats"
//
(* ****** ****** *)

#define N 10

(* ****** ****** *)

implement
main0(argc, argv) =
{
val xs = listize(argc, argv)
val xs = g0ofg1(xs)
val () = println!("argv[] = ", xs)
val () = list0_vt_free(xs)
} (* end of [main0] *)

(* ****** ****** *)

(* end of [test07.dats] *)
