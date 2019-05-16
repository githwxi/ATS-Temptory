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
//
val-
~some_vt(fil) =
FILEptr0_open_opt("./test13.dats", "r")
//
val () =
println!
("nc(fil) = ", length(FILEptr0_streamize_char(fil)))
//
(* ****** ****** *)
//
val-
~some_vt(fil) =
FILEptr0_open_opt("./test13.dats", "r")
//
val () =
println!
("nl(fil) = ", length(FILEptr0_streamize_line(fil)))
//
(* ****** ****** *)
//
val-
~some_vt(fil) =
FILEptr0_open_opt("./test12.dats", "r")
//
val ws =
FILEptr0_streamize_word(fil)
val ws = mergesort(stream_vt_listize(ws))
val () =
(
iforeach0<x0>(ws)
) where
{
typedef x0 = string
implement
list0_vt_iforeach0$work<x0>(i0, w0) = println!("word#", i0, ": ", w0)
}
//
(* ****** ****** *)
//
val-
~some_vt(fil) =
FILEptr0_open_opt("./test12.dats", "r")
//
val ws =
FILEptr0_streamize_word(fil)
val ws = quicksort(stream_vt_listize(ws))
val () =
(
iforeach0<x0>(ws)
) where
{
typedef x0 = string
implement
list0_vt_iforeach0$work<x0>(i0, w0) = println!("word#", i0, ": ", w0)
}
//
(* ****** ****** *)

(* end of [test13.dats] *)
