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

val cs =
FILEref_streamize_char(the_stdin())
val () =
(
stream_vt_foreach0(cs)
) where
{
implement
stream_vt_foreach0$work<int>(c0) = print($UN.cast{char}(c0))
}

(* ****** ****** *)

(* end of [test12.dats] *)
