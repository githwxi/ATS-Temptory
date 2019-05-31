(* ****** ****** *)
//
// HX-2019-05-09:
// For ATS-Temptory
//
(* ****** ****** *)

implfun main0() = ()

(* ****** ****** *)
//
#include
"share/HATS\
/temptory_staload_bucs320.hats"
//
(* ****** ****** *)

val i0 = 1
val () = println!("i0 = ", i0)
val li0 = 10L
val () = println!("li0 = ", li0)
val lli0 = 100LL
val () = println!("lli0 = ", lli0)

(* ****** ****** *)

val u0 = 1
val () = println!("u0 = ", u0)
val lu0 = 10UL
val () = println!("lu0 = ", lu0)
val llu0 = 100ULL
val () = println!("llu0 = ", llu0)

(* ****** ****** *)

val f0 = 1.0
val () = println!("f0 = ", f0)
val d0 = 1.0
val () = println!("d0 = ", d0)
val ld0 = 1.0
val () = println!("ld0 = ", ld0)

(* ****** ****** *)

val f0 = cast2flt(1)
val d0 = cast2dbl(10)
val fd0 = cast2ldbl(f0) + cast2ldbl(d0)
val () = println!("fd0 = ", fd0)

(* ****** ****** *)

(* end of [test17.dats] *)
